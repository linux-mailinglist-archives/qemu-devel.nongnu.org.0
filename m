Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8D23CC4F6
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 19:42:57 +0200 (CEST)
Received: from localhost ([::1]:53994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4oL2-0002h4-Fe
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 13:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4oJ5-0001Jk-I5
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:40:55 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4oJ4-0001M4-5J
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:40:55 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 f8-20020a1c1f080000b029022d4c6cfc37so8792195wmf.5
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 10:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=d1vbIpWjOyk4Lntz8uwd+EHxtXcPMB4sYAXA0xYrZVY=;
 b=oSMhlrQZawCovrhS2/0cHpe1I4XW8C8Re+AMAj+fwdZp0pRq1/KVWuXkTmodX3Kbbc
 5RvEk6x2kC+8dcUxZhrczUo5277x9lUwV2o2FV1kvwIa9OptNYfb2vjqUUjpgqCTt4aB
 UWNPEf6tRHn8FfUFbAYo2Xl+06YBfwtEAnfFFIers56xsNY710Iwt/dhZ5cdKeScks5R
 vDXG3Q1jew4np8ia+ygacSpT0wwcLz104NXEW3r3jI5Msq+jPz7WJWDWx2L9QWQpMOIM
 zq0aZ7a0nI+gcTxI6R/jJLH9SGROkXWiq8PKdRWzCvItTkNABsNqO+msMwu+oZKOtJIg
 m1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=d1vbIpWjOyk4Lntz8uwd+EHxtXcPMB4sYAXA0xYrZVY=;
 b=F3J3493nLocELs1WUMgyPKJYxGaEfASYWuIRFNymwH2HjCcLm8fG+5cSclnPcHyOuB
 4SDyfkHVbVEnSmH5CooWR1ymWKvzDcv5jHXqib0ZRMpEFdgxUichDGNoDmLKc5c+97+r
 c3vvaI1wN6FraDnDz/Cs63fr3HxU8+CLNZ/x2C1E4ZM/JB+AzEnsap1cQTow5ays2NYc
 WrhCcs3ffmqs2ifltZ2vFEE8aITNQX4iWo5vd5DZ+0l1gV8hXRMHwF/Lk+XVIzdoEu+I
 76oWYtJeDP645cOQdPrZ1Vyg6JP05fRxLEL3gxq7u+JXPk0Xs2J1136AJ4XRdpTWUUuQ
 nkfw==
X-Gm-Message-State: AOAM531yx3rwsOOjxFTQl8VPcCxdsBKkWNdkj097h5MKZv4AdtcjUN1i
 kXErOkFzSDMUBa5y1Vb/05HY7g==
X-Google-Smtp-Source: ABdhPJwSHGrdvZ+x3XyC942S7dcra2a4J4Ted+i/0tmNXH6a8DYuMdsyaf1SDwhCbw5XM3inuKDVUQ==
X-Received: by 2002:a05:600c:1d04:: with SMTP id
 l4mr10081599wms.130.1626543652703; 
 Sat, 17 Jul 2021 10:40:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c15sm11343313wmr.28.2021.07.17.10.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 10:40:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9A3511FF7E;
 Sat, 17 Jul 2021 18:40:46 +0100 (BST)
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-5-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 04/10] accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain
Date: Sat, 17 Jul 2021 18:39:51 +0100
In-reply-to: <20210712154004.1410832-5-richard.henderson@linaro.org>
Message-ID: <87czrg3kkh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The purpose of suppressing goto_ptr from -d nochain had been
> to return to the main loop so that -d cpu would be recognized.

Hmm is it though? I've always treated it as ensuring we always come out
into the main loop (which is helpful for debugging).

> But we now include -d cpu logging in helper_lookup_tb_ptr so
> there is no need to exclude goto_ptr.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cpu-exec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index d3232d5764..70ea3c7d68 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -150,7 +150,7 @@ uint32_t curr_cflags(CPUState *cpu)
>      uint32_t cflags =3D cpu->tcg_cflags;
>=20=20
>      if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
> -        cflags |=3D CF_NO_GOTO_TB | CF_NO_GOTO_PTR;
> +        cflags |=3D CF_NO_GOTO_TB;
>      }
>=20=20
>      return cflags;


--=20
Alex Benn=C3=A9e

