Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE1B469780
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 14:49:41 +0100 (CET)
Received: from localhost ([::1]:33430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muENA-0006cf-DQ
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 08:49:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1muELO-0004JW-8N
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 08:47:50 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:55930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1muELL-0006eD-AO
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 08:47:49 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 09C5B1FD54;
 Mon,  6 Dec 2021 13:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638798464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8MS2aW2q7Ar8EzhBLrvergMsWWJJzYybJNP8s8eEWYs=;
 b=Meb7IMHpaSlynXLPTV20O7JoPANR6aLzVjMoZEvNqySIVe+lg8pYWwlft8H7S3/3vs08vP
 y5I5hB6zTrqAO5YXdTCL8JuARa2sYtvtYmJCBfOUxKByBtv4rVySiWaMrGHOeqNRx0krDJ
 CLjnb3LB21csXgpMH+aTGugqzSQXkUI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638798464;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8MS2aW2q7Ar8EzhBLrvergMsWWJJzYybJNP8s8eEWYs=;
 b=QyzijkB0jZfBBIhoGMdUm8Oi3z16at61Qxm7UbrCfHiapFlAJxaSz1ig7ImX0TQ2bITD0o
 SgLp6eiIkcR5yEDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B254B13BB9;
 Mon,  6 Dec 2021 13:47:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uLAGKX8UrmEUKAAAMHmgww
 (envelope-from <lizhang@suse.de>); Mon, 06 Dec 2021 13:47:43 +0000
Subject: Re: [PATCH 1/1] kvm: Clear variables which may not be used
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211206112738.14893-1-lizhang@suse.de>
 <Ya32dqW8Mo0/X+3H@redhat.com>
From: Li Zhang <lizhang@suse.de>
Message-ID: <1414281f-abc5-588d-9c67-4ef7a0bc3add@suse.de>
Date: Mon, 6 Dec 2021 14:47:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <Ya32dqW8Mo0/X+3H@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lizhang@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.076,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, cfontana@suse.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/6/21 12:39 PM, Daniel P. Berrangé wrote:
> On Mon, Dec 06, 2021 at 12:27:38PM +0100, Li Zhang wrote:
>> The variables msi, route in kvm_irqchip_send_msi may be uninitialised
>> values in some cases. It's necessary to clear them.
> You say the patch is going to 'clear them' but....

Ah, sorry for my bad. And this is not correct fix.

>
>> Signed-off-by: Li Zhang <lizhang@suse.de>
>> ---
>>   accel/kvm/kvm-all.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index eecd8031cf..bd50dc6b80 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -1913,10 +1913,8 @@ static KVMMSIRoute *kvm_lookup_msi_route(KVMState *s, MSIMessage msg)
>>   
>>   int kvm_irqchip_send_msi(KVMState *s, MSIMessage msg)
>>   {
>> -    struct kvm_msi msi;
>> -    KVMMSIRoute *route;
>> -
>>       if (kvm_direct_msi_allowed) {
>> +        struct kvm_msi msi;
> ...but this is still an uninitialized declaration.
>
>>           msi.address_lo = (uint32_t)msg.address;
>>           msi.address_hi = msg.address >> 32;
>>           msi.data = le32_to_cpu(msg.data);
> I guess the bug you were wanting to fix is that this code only
> initializes 5 out of 6 struct fields, before calling the
> ioctl.

Yes, you are right.

>> @@ -1926,6 +1924,7 @@ int kvm_irqchip_send_msi(KVMState *s, MSIMessage msg)
>>           return kvm_vm_ioctl(s, KVM_SIGNAL_MSI, &msi);
>>       }
>>   
>> +    KVMMSIRoute *route;
> This was initialized correctly before and didn't need moving
>
>>       route = kvm_lookup_msi_route(s, msg);
>>       if (!route) {
>>           int virq;
> Regards,
> Daniel

