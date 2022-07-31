Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B4358616A
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jul 2022 22:44:06 +0200 (CEST)
Received: from localhost ([::1]:52180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIFnB-0001Hz-Tv
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 16:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oIFlj-0008EL-TJ
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 16:42:35 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:49502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oIFli-0001Fm-92
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 16:42:35 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D2C573F0C4;
 Sun, 31 Jul 2022 20:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659300152; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r2QrY1Zy/e/qW1BGzdLIWSkTtZc9y5773iwhduybDh4=;
 b=lwIm3sJW31KSZCARDfO9VNbrhA+d/hAS6R7yqpvwUFxp72cvi6UK1N2fDM/ejcnNqKI2xx
 mtKlEiRWq655TZLEzvUg1w5StJNMdSKwiJdM4AdEtGcYcu7MvdKr/SslI8eEi1D3nNDmkB
 /ZDRILC/gz+w+NpJTDHTVp9zzg7Ycpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659300152;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r2QrY1Zy/e/qW1BGzdLIWSkTtZc9y5773iwhduybDh4=;
 b=K0sZUwAXuJwxR4HiE8W7RJoyapulrZmQrrzQ+ljEhTqW2pc8ohrk5aP0l3xci/30o+wKL0
 GHTW1IT+a/tqHzCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A0A9113416;
 Sun, 31 Jul 2022 20:42:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sNN1JTjp5mKRXAAAMHmgww
 (envelope-from <cfontana@suse.de>); Sun, 31 Jul 2022 20:42:32 +0000
Message-ID: <8b008e30-15df-91cd-c891-b7707324abe1@suse.de>
Date: Sun, 31 Jul 2022 22:42:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: virtio: why no full reset on virtio_set_status 0 ?
Content-Language: en-US
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>
References: <8350fff5-f8d7-11a4-9f3a-aac8b7f5a964@suse.de>
 <20220727112737-mutt-send-email-mst@kernel.org>
 <CACGkMEt768mxHkcfEBK3EgA3sk979gckuQ-tWz1edX2HzVo73g@mail.gmail.com>
 <cde2074c-67bc-373f-c218-d9deaf84e5f0@suse.de>
 <8a8475c7-c720-1aef-02bb-ca4cb3c1ff68@suse.de>
 <20220728093501-mutt-send-email-mst@kernel.org>
 <be4dc741-4153-1620-223f-852ff5aa34a7@suse.de>
 <20220729061221-mutt-send-email-mst@kernel.org>
 <20edd357-716f-c84c-9714-607f7f64db5c@suse.de> <87sfmkf3yc.fsf@linaro.org>
 <a8b045fe-958c-ee88-28ff-b73aab1664b9@suse.de>
In-Reply-To: <a8b045fe-958c-ee88-28ff-b73aab1664b9@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/22 16:00, Claudio Fontana wrote:
> On 7/29/22 15:21, Alex Bennée wrote:
>>
>> Claudio Fontana <cfontana@suse.de> writes:
>>
>>> On 7/29/22 12:13, Michael S. Tsirkin wrote:
>>>> On Fri, Jul 29, 2022 at 11:46:05AM +0200, Claudio Fontana wrote:
>>>>>>> @@ -2025,7 +2031,6 @@ void virtio_reset(void *opaque)
>>>>>>>      VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>>>>>>>      int i;
>>>>>>>  
>>>>>>> -    virtio_set_status(vdev, 0);
>>>>>>>      if (current_cpu) {
>>>>>>>          /* Guest initiated reset */
>>>>>>>          vdev->device_endian = virtio_current_cpu_endian();
>>>>>>> -- 
>>>>>>> 2.26.2
>>>>>>
>>>>>> As you say this is incomplete ... bout could you share a bit more
>>>>>> of what issue does this address?
>>>>>>
>>>>>
>>>>> Hi, the problem I am trying to address is a segfault in OVS/dpdk that looks like this:
>>>>
>>>> Sorry I was not clear. What I mean is, you don't yet know why does removing
>>>> virtio_set_status call here prevent the crash in ovs, do you?
>>>>
>>>
>>> I have no idea. Trying to collect logs to figure things out, but as
>>> mentioned the logs easily hide the issue.
>>> Likely there is just more to study here.
>>
>> Given the OVS is going off on a NULL ptr deref could it just be it's not
>> handling the disabling/reenabling of the virtqueues as you pause and
>> restart properly? I could certainly imagine a backend jumping the gun to
>> read a queue going very wrong if the current queue state is disabled.
>>
> 
> In this case both the ovs buf_addr and buf_iova are NULL, which is a nice case as they are more detectable,
> however I also have segfaults where the addresses are just garbage.
> 
> I wonder whether it's possible that given the fact that the guest is going away without notification (SIGKILL),
> as the guest driver resets the device and communicates with QEMU, QEMU adapts the state without notifying ovs,
> so ovs happily tries to dequeue data from memory that isn't there. But I am just guessing.
> 
> I am still studying the qemu vhost user side and ovs/dpdk side to try to understand how this whole thing works.
> 
> Thanks,
> 
> CLaudio
> 

I am pursuing this as a DPDK library issue.

It would be cool to have ovs, dpdk and vhost-user with the default test-pmd application somehow hooked up in a basic test
in one of these projects..

Thanks,

Claudio



