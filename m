Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A4968C42F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 18:07:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP4wS-0007Lk-GE; Mon, 06 Feb 2023 12:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP4wO-0007KW-Kt
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:06:04 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP4wJ-0008N4-Ow
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:06:04 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C10DB606EC;
 Mon,  6 Feb 2023 17:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675703157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mn3iQ4ySwsb/eo8V/XRuT7zh/HCH8qaYdtB/Jn0bPsc=;
 b=NF/TIWO/cHyQzN1D1ZCjcsEVdddCoAaKaollSAM+y4ls7MLtdg92zaP2JBmwg5vqdf6CYC
 a1fedrBIJpnKQHKzwVofd3Re06/8bg3lolMtJcbFk2UnecE84fdmATh97801khU6X43bld
 O0U9+QPPttb/MsH7/aM9J12MKxkBInc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675703157;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mn3iQ4ySwsb/eo8V/XRuT7zh/HCH8qaYdtB/Jn0bPsc=;
 b=pglLErLJLFTMUwka87XPtT9D49NcSgWsPpXxkrOJy3awv7vpvGo2RhjK6/CLZl16GdgVYZ
 cNkmSTsjr/aOTkCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5137F138E8;
 Mon,  6 Feb 2023 17:05:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1gkYB3Uz4WMtJAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 17:05:57 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 01/10] vl.c: Do not add isa-parallel if it's not present
In-Reply-To: <c75d2adc-f566-75bc-f3a1-71c5b1dd9245@linaro.org>
References: <20230206140809.26028-1-farosas@suse.de>
 <20230206140809.26028-2-farosas@suse.de>
 <c75d2adc-f566-75bc-f3a1-71c5b1dd9245@linaro.org>
Date: Mon, 06 Feb 2023 14:05:54 -0300
Message-ID: <87a61qafm5.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 6/2/23 15:08, Fabiano Rosas wrote:
>> Currently the isa-parallel driver is always added by default
>> regardless of the presence of the actual code in the build, which can
>> lead to a crash:
>>=20
>> qemu-system-i386: unknown type 'isa-parallel'
>> Aborted (core dumped)
>>=20
>> Check for the presence of the QOM class and do not include
>> isa-parallel by default if it's not found.
>>=20
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   softmmu/vl.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 9177d95d4e..614e6cf66e 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -1269,7 +1269,8 @@ static void qemu_disable_default_devices(void)
>>       if (!has_defaults || machine_class->no_serial) {
>>           default_serial =3D 0;
>>       }
>> -    if (!has_defaults || machine_class->no_parallel) {
>> +    if (!has_defaults || machine_class->no_parallel ||
>> +        !object_class_by_name("isa-parallel")) {
>>           default_parallel =3D 0;
>>       }
>>       if (!has_defaults || machine_class->no_floppy) {
>
> How is isa-parallel different, why not the other defaults?

I doesn't need to be different, I did it like this because I expected to
solve the others in the same way. Peter also flagged the inconsistency,
I'll add a Kconfig dependence like the others.

As to why the other defaults don't have this issue:

serial - for x86, already selected by CONFIG_PC;
         not used on arm;
parallel - for x86, should be selected by CONFIG_PC, I'll fix that on v2;
           not used on arm;
monitor - built in with char.c;
floppy - built in with blockdev.c;
sdcard - built in with blockdev.c;

cdrom - uses mc->block_default_type, so the CONFIG corresponding to that
        device should be selected.
net - verification is only done later during machine init, so the
      machine will need to provide a fallback;
vga - uses mc->default_display, so the CONFIG corresponding to that device
      should be selected.

These last three are addressed in other patches in this series (VGA_PCI, VI=
RTIO_*).

