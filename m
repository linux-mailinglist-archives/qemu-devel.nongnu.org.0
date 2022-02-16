Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8B54B8662
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 12:03:51 +0100 (CET)
Received: from localhost ([::1]:48538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKI67-0000gj-AD
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 06:03:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nKI0x-00065O-HE
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:58:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nKI0v-0002td-Le
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645009105;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DRgsYMjYbI1Ay3UK3ILtrWH6+oLsAgC5jLQlX2z1sZI=;
 b=BsIgCs4lFoP8V5RIMM5CS458gN8Ag05J5vx6iLYfQgdITE86MfUKFgEkVSRdH8d+Q/E+aV
 KA9siribHaOzj5KV0zbj1DfkNZ5gJHVURzeNK+AbDKEbjSY9j/Hg8rXYfgPribW0FArSKl
 c6xln3If9KLfpuYy6ZEabZm7tLrmuhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-kHJjpWteM5C8rbO7Qzjf1Q-1; Wed, 16 Feb 2022 05:58:20 -0500
X-MC-Unique: kHJjpWteM5C8rbO7Qzjf1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D398E8143EA;
 Wed, 16 Feb 2022 10:58:18 +0000 (UTC)
Received: from [10.72.13.24] (ovpn-13-24.pek2.redhat.com [10.72.13.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C6E01084186;
 Wed, 16 Feb 2022 10:58:12 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/virt: Fix CPU's default NUMA node ID
To: Andrew Jones <drjones@redhat.com>
References: <20220126052410.36380-1-gshan@redhat.com>
 <20220126101447.5d4f01f9@redhat.com>
 <f5780366-7c6e-1643-d471-1304ce6584ca@huawei.com>
 <5c99b245-e118-f7bd-4a4f-2c865bacaa75@redhat.com>
 <20220215083236.tt2ajffkdq3psmxw@gator>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <3e5d1d3e-ee3a-6f66-6b8a-26628e3bd53b@redhat.com>
Date: Wed, 16 Feb 2022 18:58:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220215083236.tt2ajffkdq3psmxw@gator>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/22 4:32 PM, Andrew Jones wrote:
> On Tue, Feb 15, 2022 at 04:19:01PM +0800, Gavin Shan wrote:
>> The issue isn't related to CPU topology directly. It's actually related
>> to the fact: the default NUMA node ID will be picked for one particular
>> CPU if the associated NUMA node ID isn't provided by users explicitly.
>> So it's related to the CPU-to-NUMA association.
>>
>> For example, the CPU-to-NUMA association is breaking socket boundary
>> without the code change included in this patch when the guest is booted
>> with the command lines like below. With this patch applied, the CPU-to-NUMA
>> association is following socket boundary, to make Linux guest happy.
> 
> Gavin,
> 
> Please look at Igor's request for more information. Are we sure that a
> socket is a NUMA node boundary? Are we sure we can assume an even
> distribution for sockets to nodes or nodes to sockets? If so, where is
> that documented?
> 

Yes, I was investigating the code for Igor's questions, but I didn't
reach to conclusion when I replied to Yanan. I will reply to Igor's
thread and lets discuss it through over thread.

Thanks,
Gavin



