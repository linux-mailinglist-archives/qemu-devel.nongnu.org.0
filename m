Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69726C52F2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 18:46:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2Wz-0005QH-1C; Wed, 22 Mar 2023 13:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pf2Ws-0005Lo-Dn; Wed, 22 Mar 2023 13:45:44 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pf2Wq-0008CT-PW; Wed, 22 Mar 2023 13:45:42 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 921BD33DA5;
 Wed, 22 Mar 2023 17:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679507137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQ+46afQyo/ocgtqIMO6SapyQRkrX2+kvN8yoxsBizA=;
 b=z5uvNxmlzxBRGOAv8HhaW+OueVe8IuB2T1hPLtyVOfbliDU+PLMLUFTTGATH+ZcRuK5m7e
 1RCuKCRpWAx2+XIRw1q+XQ6IR9C+BHtRIxRh/meMcbPgUtftR28zlsUXJ6Gj8IpTB7Y2JW
 65K7DItw2l7zF8unQYDJf2nD5Lyhnhw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679507137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQ+46afQyo/ocgtqIMO6SapyQRkrX2+kvN8yoxsBizA=;
 b=mtOSGn5FvJaRlDbVQwHeZ55GgKIU29Ntv9xrHQEO+vD35CkmUGBty+U37hw0Nt9+0xf68p
 wtiW97FIpc7N/PAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1E077138E9;
 Wed, 22 Mar 2023 17:45:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7c3HNcA+G2RYHAAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 22 Mar 2023 17:45:36 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Claudio Fontana
 <cfontana@suse.de>, qemu-arm@nongnu.org
Subject: Re: [PATCH-for-8.0 0/2] target/arm/gdbstub: Fix builds when TCG is
 disabled
In-Reply-To: <3d67c765-20fc-9ae9-1dfe-753f4ef16263@linaro.org>
References: <20230322142902.69511-1-philmd@linaro.org>
 <3d67c765-20fc-9ae9-1dfe-753f4ef16263@linaro.org>
Date: Wed, 22 Mar 2023 14:45:34 -0300
Message-ID: <877cv8smrl.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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

> On 22/3/23 15:29, Philippe Mathieu-Daud=C3=A9 wrote:
>> Fix when building QEMU configured with --disable-tcg:
>>=20
>>    Undefined symbols for architecture arm64:
>>      "_arm_v7m_get_sp_ptr", referenced from:
>>          _m_sysreg_get in target_arm_gdbstub.c.o
>>      "_arm_v7m_mrs_control", referenced from:
>>          _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
>>      "_pauth_ptr_mask", referenced from:
>>          _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
>>    ld: symbol(s) not found for architecture arm64
>>    clang: error: linker command failed with exit code 1 (use -v to see i=
nvocation)
>
> Beside having the non-TCG configs tested in CI, (I think) we can avoid
> such breakage by moving the TCG-specific declarations from
> target/arm/internals.h to some target/arm/tcg/tcg-internals.h header.
> (target/arm/internals.h is 1400+ LoC anyway). Worth it?

I think it would be worth it. That still leaves the issue of these small
functions that are semantically related to what is being emulated but
don't need any TCG-specific symbols. It would be nice if we had a
default approach for where to put them. Without going back to sticking
everything in helper.c, of course. =3D)

