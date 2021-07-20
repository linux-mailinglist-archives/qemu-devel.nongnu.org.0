Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14033CFF03
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 18:15:03 +0200 (CEST)
Received: from localhost ([::1]:56754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5sOc-0004GV-MP
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 12:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5sNa-0003Ky-7s
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 12:13:58 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5sNY-0001NH-Ck
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 12:13:57 -0400
Received: by mail-wr1-x433.google.com with SMTP id c15so3021084wrs.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 09:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=zLiXpYKOlP6DNQl7D1rOEElALBXRVevv4zUIeaaxB+s=;
 b=J4IZvabQOgPXy8ymNFmVyBSfB39QuxrhJT8MdsLpGSEL3Sx8t2nrRu6xCuiA3MdH7P
 KmErvZSgUSlasIZEfJOWPMq0EbmvjbDbR26r/P8Ueg1E3cvKgOtxFA0sCyS/ye+4FNeM
 vMgIqUebJuofvRdsKW9G9Qv7nmBdr5lPm6Incrsd6P8nBAYOTNV0cVyfKEmaRIArZjWZ
 KiWLt69KcYepxlc8LRJ3yTh619rovsro/Zt841QYHc7VluvlyMZxqmbnoaLUtPKx212u
 P9ZiUHc02+wAh3hsyG198xKjFU2y+11xE0FxMmxiFGeVjlcsmWu3K0UZdMFHFbnkNR2S
 4WhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=zLiXpYKOlP6DNQl7D1rOEElALBXRVevv4zUIeaaxB+s=;
 b=HapHYJPwYhh1kA2GQeLRBp2J92u/0jf4EF/+j1BkJOkYZlo1udNBFQ0CfMOEk8aBpC
 E6iWhV4UhwUPxtObk2IBQLd/oZn7vwXwkLL8W0Y5TMnZ6QjcYUArNdXEYsjPn2IlfSAx
 ZdnyDrmAJ0GF1fBBAI7SxKUYGI0ucO5VqxpLjw2Ai55+lYgKTMwM4JOG9k68w0ufxZsO
 +7ixgKVmxN2UWZDd7HpHWflrrZ2k3e9+3ViA2sNK+vE8VpMJuTcsnMFnClmCc/qgmDaD
 kA+XpvoC7w8p/fhOSB4Mz+nLNwRoSfvpjPoFvvWVFs6D5tcr93aZGOBa0ArMMcnPb5qa
 6LdQ==
X-Gm-Message-State: AOAM532J0uLIwA3XJpTmQq6fJAoSfVvlUpgdE/us0o7oU6MEKhPMT12F
 RHFzBImxvOeDVRi0jJ73HBkfWw==
X-Google-Smtp-Source: ABdhPJxv7qe+lQOb4hB85kfJsqatuYHT2pL/lZpGuW6vC5Q5RTM7r82t1D93XtWN43D47o0mKzEZSw==
X-Received: by 2002:a05:6000:11cf:: with SMTP id
 i15mr36567311wrx.212.1626797634274; 
 Tue, 20 Jul 2021 09:13:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q7sm20274515wmq.33.2021.07.20.09.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 09:13:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4A3941FF7E;
 Tue, 20 Jul 2021 17:13:52 +0100 (BST)
References: <20210720011800.483966-1-richard.henderson@linaro.org>
 <20210720011800.483966-13-richard.henderson@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH for-6.1 v5 12/15] accel/tcg: Move breakpoint recognition
 outside translation
Date: Tue, 20 Jul 2021 17:12:21 +0100
In-reply-to: <20210720011800.483966-13-richard.henderson@linaro.org>
Message-ID: <877dhlm08v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Trigger breakpoints before beginning translation of a TB
> that would begin with a BP.  Thus we never generate code
> for the BP at all.
>
> Single-step instructions within a page containing a BP so
> that we are sure to check each insn for the BP as above.
>
> We no longer need to flush any TBs when changing BPs.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/286
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/404
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/489
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

However...
>=20=20
> +static bool check_for_breakpoints(CPUState *cpu, target_ulong pc,
> +                                  uint32_t *cflags)
> +{
> +    CPUBreakpoint *bp;
> +    bool match_page =3D false;
> +
> +    if (likely(QTAILQ_EMPTY(&cpu->breakpoints))) {
> +        return false;
> +    }
> +
> +    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
> +        /*
> +         * If we have an exact pc match, trigger the breakpoint.
> +         * Otherwise, note matches within the page.
> +         */
> +        if (pc =3D=3D bp->pc) {
> +            bool match_bp =3D false;
> +
> +            if (bp->flags & BP_GDB) {
> +                match_bp =3D true;
> +            } else if (bp->flags & BP_CPU) {
> +#ifdef CONFIG_USER_ONLY
> +                g_assert_not_reached();
> +#else
> +                CPUClass *cc =3D CPU_GET_CLASS(cpu);
> +                assert(cc->tcg_ops->debug_check_breakpoint);
> +                match_bp =3D cc->tcg_ops->debug_check_breakpoint(cpu);
> +#endif
> +            }
> +
> +            if (match_bp) {
> +                cpu->exception_index =3D EXCP_DEBUG;
> +                return true;
> +            }
> +        } else if (((pc ^ bp->pc) & TARGET_PAGE_MASK) =3D=3D 0) {
> +            match_page =3D true;
> +        }
> +    }
> +
> +    /*
> +     * Within the same page as a breakpoint, single-step,
> +     * returning to helper_lookup_tb_ptr after each looking
> +     * for the actual breakpoint.
> +     *
> +     * TODO: Perhaps better to record all of the TBs associated
> +     * with a given virtual page that contains a breakpoint, and
> +     * then invalidate them when a new overlapping breakpoint is
> +     * set on the page.  Non-overlapping TBs would not be
> +     * invalidated, nor would any TB need to be invalidated as
> +     * breakpoints are removed.
> +     */
> +    if (match_page) {
> +        *cflags =3D (*cflags & ~CF_COUNT_MASK) | CF_NO_GOTO_TB | 1;
> +    }
> +    return false;
> +}
> +

This seems to have a really negative effect on:

 ./tests/venv/bin/avocado run tests/acceptance/reverse_debugging.py:Reverse=
Debugging_AArch64.test_aarch64_virt

Even bumping the timeout up from 10 to 300 isn't enough to get it
working. I'm not sure if this is a time or a hang.

--=20
Alex Benn=C3=A9e

