Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B33968D99D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 14:46:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOHr-0003oM-8f; Tue, 07 Feb 2023 08:45:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPOHm-0003nX-GJ; Tue, 07 Feb 2023 08:45:27 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPOHl-0007EH-1H; Tue, 07 Feb 2023 08:45:26 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1801E3F29E;
 Tue,  7 Feb 2023 13:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675777523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lV+K3kPtNhC/p8IGUSrKR6VGBaVMLoXYdz3X4AnBffs=;
 b=ZjgCf07QrD4r7ttu2zXVAo7+vY/b2ME9xbC51AaZyoemwqsHUekGgX2xiFoN4IYR74bUes
 McdOf/pE/WjaYY4X0ra4roi2jCi63qu2p1sSOjGCQFPmi1Y5GDXkwom1JabubXqb8vitm4
 Ho8e/oZhmaBQoJASK+5eNaBWl9oEHWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675777523;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lV+K3kPtNhC/p8IGUSrKR6VGBaVMLoXYdz3X4AnBffs=;
 b=E/1TZG4jpDeavK83icDrcSd4/R6Z6SvO8eGcHK1R6K/M8euciI5LRLe+pFgiWYplTNoODa
 5tlXqb7avZIe5eCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D4C3139ED;
 Tue,  7 Feb 2023 13:45:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kT2eGfJV4mPIeQAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 07 Feb 2023 13:45:22 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Ilias
 Apalodimas <ilias.apalodimas@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] target/arm: disable FEAT_SME if we turn off SVE
In-Reply-To: <20230203100551.2445547-1-alex.bennee@linaro.org>
References: <20230203100551.2445547-1-alex.bennee@linaro.org>
Date: Tue, 07 Feb 2023 10:45:20 -0300
Message-ID: <87cz6loahb.fsf@suse.de>
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Before this change booting a -cpu max,sve=3Doff would trigger and
> assert:
>
>   qemu-system-aarch64: ../../target/arm/helper.c:6647: sve_vqm1_for_el_sm=
: Assertion `sm' failed.
>
> when the guest attempts to write to SMCR which shouldn't even exist if
> SVE has been turned off.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> ---
>  target/arm/cpu64.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 0e021960fb..a38d43421a 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -409,6 +409,13 @@ static void cpu_arm_set_sve(Object *obj, bool value,=
 Error **errp)
>      t =3D cpu->isar.id_aa64pfr0;
>      t =3D FIELD_DP64(t, ID_AA64PFR0, SVE, value);
>      cpu->isar.id_aa64pfr0 =3D t;
> +
> +    /* FEAT_SME requires SVE, so disable it if no SVE */
> +    if (!value) {
> +        t =3D cpu->isar.id_aa64pfr1;
> +        t =3D FIELD_DP64(t, ID_AA64PFR1, SME, 0);
> +        cpu->isar.id_aa64pfr1 =3D t;
> +    }

What about -cpu max,sve=3Doff,sme=3Don ?


