Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C811969EE9E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 07:08:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUiH4-0004u6-Bw; Wed, 22 Feb 2023 01:06:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUiH2-0004sU-8e
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 01:06:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUiH0-0008D4-O5
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 01:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677045997;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lVef1Oh2tJ8hQOebHG/5e5/WuRpB+D7satE3jExCtSg=;
 b=KoUVxnqQrE9A3KTQk8B+7MNxhjWNj1XPaKPaKCwiSUdev41o9LmuP7IVkj+3MKu08HMnSm
 aGA0NZdIc4ezgOkkCs6u7T9dfm4HA9/e6lh1Z9zRsEOyju26+Y3RleaSX6APTNHrB50D0C
 cdrv5N/AKKdSWEB0/4MF8Pr+YZ/UlNU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-C2QVHynJMziZOKeEvXIONg-1; Wed, 22 Feb 2023 01:06:32 -0500
X-MC-Unique: C2QVHynJMziZOKeEvXIONg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB9A929ABA19;
 Wed, 22 Feb 2023 06:06:31 +0000 (UTC)
Received: from [10.72.12.31] (ovpn-12-31.pek2.redhat.com [10.72.12.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CED1D492B04;
 Wed, 22 Feb 2023 06:06:20 +0000 (UTC)
Subject: Re: [PATCH v1 3/6] kvm: Synchronize the backup bitmap in the last
 stage
To: Peter Xu <peterx@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, david@redhat.com, philmd@linaro.org,
 mst@redhat.com, cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-4-gshan@redhat.com> <Y/UDbqyB2N/OWWi5@x1n>
 <08c954d7-f4e4-4d63-28fc-50128f4bc2d7@redhat.com> <Y/Val7mrVHHE8Bsb@x1n>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <5654e434-c041-fa88-ac7a-72b8570789b2@redhat.com>
Date: Wed, 22 Feb 2023 17:06:15 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <Y/Val7mrVHHE8Bsb@x1n>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/22/23 10:58 AM, Peter Xu wrote:
> On Wed, Feb 22, 2023 at 10:44:07AM +1100, Gavin Shan wrote:
>> Peter, could you please give some hints for me to understand the atomic
>> and non-atomic update here? Ok, I will drop this part of changes in next
>> revision with the assumption that we have atomic update supported for
>> ARM64.
> 
> See commit f39b7d2b96.  Please don't remove the change in this patch.
> 
> The comment was just something I thought about when reading, not something
> I suggested to change.
> 
> If to remove it we'll need to remove the whole chunk not your changes alone
> here.  Still, please take it with a grain of salt before anyone can help to
> confirm because I can miss something else here.
> 
> In short: before we know anything solidly, your current code is exactly
> correct, AFAICT.
> 

Thanks, Peter. I think it's all for later. I will keep the changes and with
your r-b in next revision :)

Thanks,
Gavin


