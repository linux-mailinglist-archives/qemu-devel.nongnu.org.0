Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EA5535B60
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 10:22:10 +0200 (CEST)
Received: from localhost ([::1]:38390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuVEX-0000DD-9n
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 04:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nuVAp-00070p-Jn
 for qemu-devel@nongnu.org; Fri, 27 May 2022 04:18:19 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nuVAn-0000J3-MA
 for qemu-devel@nongnu.org; Fri, 27 May 2022 04:18:19 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2247C219A1;
 Fri, 27 May 2022 08:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653639496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RYXOVp9w5o+uxLAnuu7KJFTZV3EuVStkbl778UdPEng=;
 b=EpOMhv80NovL+URREiocXd3PlZqVdkaHmJG0006eneK2j/UBTxazf2bZnw/KJM1F67fEph
 6hGxHWgEuNcr8UH8q8BUqlAHsjzw9dIKimSvQ5VoDVcVRmYtzhsleKDMOX8S4YGYEROxh7
 14p3cz3C66DP9hrOo28UfP9BT40PHYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653639496;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RYXOVp9w5o+uxLAnuu7KJFTZV3EuVStkbl778UdPEng=;
 b=kl55zE83r8HzKmw0af69R7YwLNPzesm4xQRB9iGQJe32oBDAMQIYPsH0eri/uqowqNX4DS
 u24yszJH7T79cxAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E657113A84;
 Fri, 27 May 2022 08:18:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FZNfNkeJkGJ5NwAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 27 May 2022 08:18:15 +0000
Subject: Re: make -j check failing on master, interesting valgrind errors on
 qos-test vhost-user-blk-test/basic
To: Dario Faggioli <dfaggioli@suse.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
References: <6dad6efd-7cb4-d1e0-d5f1-dbe35f69e545@suse.de>
 <0e831d41-d338-ed6a-7530-a13d24675556@suse.de>
 <94ef489c1721bdd741ba71c3fe75b3b66ec400b3.camel@suse.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <70e033c7-3096-d730-ef6f-1e0e0f052855@suse.de>
Date: Fri, 27 May 2022 10:18:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <94ef489c1721bdd741ba71c3fe75b3b66ec400b3.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 5/27/22 9:26 AM, Dario Faggioli wrote:
> On Thu, 2022-05-26 at 20:18 +0200, Claudio Fontana wrote:
>> Forget about his aspect, I think it is a separate problem.
>>
>> valgind of qos-test when run restricted to those specific paths (-p
>> /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-
>> net/virtio-net-tests/vhost-user/reconnect for example)
>> shows all clear,
>>
>> and still the test fails when run in a while loop after a few
>> attempts:
>>
> Yes, this kind of matches what I've also seen and reported about in
> <5bcb5ceb44dd830770d66330e27de6a4345fcb69.camel@suse.com>. If
> enable/run just one of:
> - reconnect
> - flags_mismatch
> - connect_fail
> 
> I see no issues.

On the countrary, for me just running a single one of those can fail.

To reproduce this I run in a loop using, as quoted above,

-p /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/reconnect 

for example.

After a few successful runs I hit the error.


> 
> As soon as two of those are run, one after the other, the problem
> starts to appear.

Not for me: one is enough.

> 
> However, Claudio, AFAIUI, you're seeing this with an older GCC and
> without LTO, right?

Yes, to provide a different angle I tried on veteran OpenSUSE Leap 15.2, so gcc is based on 7.5.0.

I don't think LTO is being used in any way.

> 
> Regards
> 

Ciao,

CLaudio

