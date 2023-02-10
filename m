Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521B86917CF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 05:58:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQLTQ-0000rg-TV; Thu, 09 Feb 2023 23:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pQLTO-0000rT-P9
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 23:57:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pQLTN-00037V-Cd
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 23:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676005040;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mKpg5YokEETC/IqCV/+104zsL/s17GkmYS7pCFgr5HU=;
 b=hWtwHTquTNAK9gNqeoZOjmxjIoTpO2vRVtim0N3RuxOaz/SjEWHNgsjE9HjShpEFQRb4OS
 mcxrTMRM5iitrAUEBxcHTV6msbTcuNkLBhZfX0SGw0v4hSukbisIgBC0LkkelzARzRig00
 slTCLX3UPPcFccTKW54LybzGY4V6KKE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-XJlxqRV2NCK_vqVMPDpxeg-1; Thu, 09 Feb 2023 23:57:15 -0500
X-MC-Unique: XJlxqRV2NCK_vqVMPDpxeg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50C5B3804515;
 Fri, 10 Feb 2023 04:57:15 +0000 (UTC)
Received: from [10.64.54.63] (vpn2-54-63.bne.redhat.com [10.64.54.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D76AB140EBF4;
 Fri, 10 Feb 2023 04:57:10 +0000 (UTC)
Subject: Re: [PATCH RFCv1 2/8] memory: Add last stage indicator to global
 dirty log synchronization
To: Peter Xu <peterx@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, david@redhat.com, philmd@linaro.org,
 mst@redhat.com, cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20230206112010.99871-1-gshan@redhat.com>
 <20230206112010.99871-3-gshan@redhat.com> <Y+VN/vWvdO2IxL3C@x1n>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <1181fe1c-1e13-e287-5b7a-b9e3fb9203d6@redhat.com>
Date: Fri, 10 Feb 2023 15:57:08 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <Y+VN/vWvdO2IxL3C@x1n>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/10/23 6:48 AM, Peter Xu wrote:
> On Mon, Feb 06, 2023 at 07:20:04PM +0800, Gavin Shan wrote:
>> The global dirty log synchronization is used when KVM and dirty ring
>> are enabled. There is a particularity for ARM64 where the backup
>> bitmap is used to track dirty pages in non-running-vcpu situations.
>> It means the dirty ring works with the combination of ring buffer
>> and backup bitmap. The dirty bits in the backup bitmap needs to
>> collected in the last stage of live migration.
>>
>> In order to identify the last stage of live migration and pass it
>> down, an extra parameter is added to the relevant functions and
>> callback. This last stage information isn't used yet.
>>
>> No functional change intended.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   accel/kvm/kvm-all.c   |  2 +-
>>   include/exec/memory.h |  5 +++--
>>   migration/dirtyrate.c |  4 ++--
>>   migration/ram.c       |  6 +++---
> 
> Better move the migration/ changes into the next patch.
> 

Ok, I will combine PATCH[2/8] and PATCH[3/8] in next revision.

Thanks,
Gavin


