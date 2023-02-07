Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAE968E119
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 20:25:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPTa6-0002de-UO; Tue, 07 Feb 2023 14:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPTa4-0002d6-Tl; Tue, 07 Feb 2023 14:24:40 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPTa3-0007TB-4m; Tue, 07 Feb 2023 14:24:40 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 449A21F8AA;
 Tue,  7 Feb 2023 19:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675797877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=af9bxaujU4/cnFOxN9t19I2SMY+pL5s8Z0lQz9YYmHw=;
 b=ONqnWS6bTh7Sx5izYhw6Yyo2a1JVy2rtIL7MBp1o0DghxlHIeKH1s5Aay7qwjDzYmckOM7
 YglE+wX1Mzowjk2PiavWnilVNIcWqUORh15paSyUPTYvQjxXsB7ox3UKGSpa7mXh3v83Bp
 Muc+7c7EeKvZoWonjlFEiD2Fpe0tQWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675797877;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=af9bxaujU4/cnFOxN9t19I2SMY+pL5s8Z0lQz9YYmHw=;
 b=ol/X6mGCM9OGw96XFGMnE3GIzWkIfIa5LBHkzFyV0gCTDCctfCO/MmJCV8cfDMw6Erb+mA
 nn+cpiT2Fj70qnBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA1BA13467;
 Tue,  7 Feb 2023 19:24:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oLKbJHSl4mOMBQAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 07 Feb 2023 19:24:36 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH 06/10] hw/arm: Select VIRTIO_BLK for virt machine
In-Reply-To: <461ba038-31bf-49c4-758b-94ece36f136f@redhat.com>
References: <20230206140809.26028-1-farosas@suse.de>
 <20230206140809.26028-7-farosas@suse.de>
 <461ba038-31bf-49c4-758b-94ece36f136f@redhat.com>
Date: Tue, 07 Feb 2023 16:24:34 -0300
Message-ID: <87pmalmg7h.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Thomas Huth <thuth@redhat.com> writes:

> On 06/02/2023 15.08, Fabiano Rosas wrote:
>> The virt machine has IF_VIRTIO as block_default_type, which causes the
>> generic code to try to create a virtio-blk-pci device pair at
>> configure_blockdev()/qemu_create_cli_devices().
>> 
>> Select VIRTIO_BLK and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors
>> when PCI_DEVICES=n (due to e.g. --without-default-devices):
>> 
>> $ ./qemu-system-aarch64 -M virt -accel tcg -cpu max -nodefaults -cdrom foo.qcow2
>> qemu-system-aarch64: -cdrom foo.qcow2: 'virtio-blk' (alias
>> 'virtio-blk-pci') is not a valid device model name
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   hw/arm/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>> 
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index 8dcc08b7ec..296d4f5176 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -33,6 +33,7 @@ config ARM_VIRT
>>       select ACPI_HMAT
>>       select VIRTIO_PCI
>>       select VIRTIO_NET
>> +    select VIRTIO_BLK
>
> I'm a little bit torn here ... while it makes sense for me to add VIRTIO_NET 
> so that you can run "qemu-system-aarch64 -M virt" without any additional 
> arguments, this is now about fixing additional (convenience) CLI options 
> that are optional ...
>
> I assume we need those for some qtests? What about checking for virtio-blk 
> in those tests instead?

Yes, from bios-tables-test.c.

I tried hard to avoid this kind of scenario, but ultimately it's the
-cdrom option that's broken, not the test.

That's just how the code was written. The -cdrom option can use
virtio-blk as a backend because the virt machine has IF_VIRTIO as
block_default_type. So virtio-blk is a dependency as long as -cdrom is
present in the build. Unless we change something else or guard against
it in the code somehow.

