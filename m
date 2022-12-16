Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C8964EF92
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:42:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Dj6-0001Qb-3H; Fri, 16 Dec 2022 11:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1p6Dj1-0001Pf-7v
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:38:20 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1p6Diy-0003uJ-AM
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:38:17 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9A7453456D;
 Fri, 16 Dec 2022 16:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671208694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XsgOxWorY/si/brUATRkcun4Oio4I4roiDQeFWYTt5U=;
 b=LVSejay+jVfMLCmR7UIL9TR9ifNTbqubC4FGAtw4qS3qDZ4ow/sPHywB8dCxuBtS41jc8A
 g2phzqj8DqLybUxoiVF9hPnvN4oJzcES5LZXGXibSFSL3c/ucJ0djm4p3s/r9Eg8cgiyJC
 noIUGc8aiz6K8HrK90U9sORFjbvqOm0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671208694;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XsgOxWorY/si/brUATRkcun4Oio4I4roiDQeFWYTt5U=;
 b=btWCBOyEKen3kvMLYEXzdUNF2aNwEqoWV16XMNGHumuq0/0Xv+YOai237xPSgPEn7/36cw
 AXd6H5AAhRRj60Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26EB2138FD;
 Fri, 16 Dec 2022 16:38:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UfLsN/WenGMNLAAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 16 Dec 2022 16:38:13 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>
Subject: Re: [PATCH v1 09/10] gdbstub: move chunks of user code into own files
In-Reply-To: <20221216112206.3171578-10-alex.bennee@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
 <20221216112206.3171578-10-alex.bennee@linaro.org>
Date: Fri, 16 Dec 2022 13:38:11 -0300
Message-ID: <87mt7ngv7w.fsf@suse.de>
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

> The process was pretty similar to the softmmu move except we take the
> time to split stuff between user.c and user-target.c to avoid as much
> target specific compilation as possible. We also start to make use of
> our shiny new header scheme so the user-only helpers can be included
> without the rest of the exec/gsbstub.h cruft.
>
> As before we:
>
>   - convert some helpers to public gdb_ functions (via internals.h)
>   - splitting some functions into user and softmmu versions
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>

Just one detail below:

> diff --git a/gdbstub/user.c b/gdbstub/user.c
> index a5f370bcf9..3492d9b68a 100644
> --- a/gdbstub/user.c
> +++ b/gdbstub/user.c
> @@ -10,11 +10,354 @@
>   */

...

> +/*
> + * Resume execution, for user-mode emulation it's equivalent to
> + * gdb_continue.
> + */
> +int gdb_continue_partial(char *newstates)
> +{
> +    CPUState *cpu;
> +    int res =3D 0;

This variable could be dropped.

> +    /*
> +     * This is not exactly accurate, but it's an improvement compared to=
 the
> +     * previous situation, where only one CPU would be single-stepped.
> +     */
> +    CPU_FOREACH(cpu) {
> +        if (newstates[cpu->cpu_index] =3D=3D 's') {
> +            trace_gdbstub_op_stepping(cpu->cpu_index);
> +            cpu_single_step(cpu, gdbserver_state.sstep_flags);
> +        }
> +    }
> +    gdbserver_state.connection->running_state =3D 1;
> +    return res;
> +}

