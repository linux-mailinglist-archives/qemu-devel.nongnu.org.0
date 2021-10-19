Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0BC433CF3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:04:59 +0200 (CEST)
Received: from localhost ([::1]:46568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsXq-0005ss-VD
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcrIm-0005xN-Kh
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:45:20 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcrIk-0002oe-TI
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:45:20 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 n7-20020a05600c4f8700b00323023159e1so3449330wmq.2
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=pxr2c2S/F1T9AJp3ya4a1rH6/ywNF3ZyjV4TUjX9CGQ=;
 b=wJXg6S4GGUdyA2FaG7QEmZ/P4prfRhBXcS7xnnqAKBMMKLw3JY39RPtApSPIVgdvkM
 m55/aR/YXVd2AGmrbRiSiIKeiXrrP2L0fCfxiziYJDcqEjFDIlQCydfCZPEfC2OwNuA0
 biuer+8Ezrq9kj/pvqaRXkO3t8bzLks/0eJxqdpQZ8pFocryWpS2qRAyDkUyPQEtxnvh
 XRZT/b/FyZdfZ+Sr0JUpecXsQPDAUJbxNp5sMqR+FbxwiiuiJNdKB5RJY59OpI3xNWil
 n/M3U4MzqtKJjv39RlVXmMg8PkSBXULMBhYZDR+R+bvDt6gKgC4+hXpKggJ6KvSGpftF
 LqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=pxr2c2S/F1T9AJp3ya4a1rH6/ywNF3ZyjV4TUjX9CGQ=;
 b=197Ba+q4ZIiw7kIuMpqKCy5C639ce6j2ypQLEup5Gd+cp3KiqXx77wLry+lldxBBCD
 qZATp6LTITTLHQPF7gnd/9/zi62Q15VqGzpaALzK11afYK7TJkVOk3jgp5HJ2vLg0MCT
 JzZd90q8oTG9cvFb6B0N7P/3/LTg4oG0oY8FIwzSBDa0hhWeC6nJiMPBkWMbZyrwOXHB
 xBml7xDnJlUDYbGbgjNeYCpTs+8BJ6SmwYyRDCEgBK88UBezuvtiM+KQj2/BTnG2H4yV
 E4IAAMzpn6dhHzvBNsz/BTUFntLz2gbAQOXsSuUDukrybmokDy+ttsJq+mY3SxIvb4b7
 k8qg==
X-Gm-Message-State: AOAM5314NAranKE4IQ2blQiAvvhTRxmQS4o1pPxO0Yh/xNN8tPx4DDUL
 MYo298grxQU3tr/L7o9nNSPfFA==
X-Google-Smtp-Source: ABdhPJxn2svrxE+b+7//Ny4SYd3rMwgmY+bVfAN1zCEDSUTJtKiJFvGLLm6Ne3sWn9TtvQw9Un5JSg==
X-Received: by 2002:a1c:770b:: with SMTP id t11mr7057285wmi.19.1634658315834; 
 Tue, 19 Oct 2021 08:45:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l2sm6803454wrs.90.2021.10.19.08.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:45:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 372431FF96;
 Tue, 19 Oct 2021 16:45:14 +0100 (BST)
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-6-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 05/48] tcg/optimize: Move prev_mb into OptContext
Date: Tue, 19 Oct 2021 16:44:18 +0100
In-reply-to: <20211007195456.1168070-6-richard.henderson@linaro.org>
Message-ID: <87a6j5xblh.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This will expose the variable to subroutines that
> will be broken out of tcg_optimize.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/tcg/optimize.c b/tcg/optimize.c
> index 627a5b39f6..b875d76354 100644
> --- a/tcg/optimize.c
> +++ b/tcg/optimize.c
> @@ -46,6 +46,7 @@ typedef struct TempOptInfo {
>=20=20
>  typedef struct OptContext {
>      TCGContext *tcg;
> +    TCGOp *prev_mb;
>      TCGTempSet temps_used;
>  } OptContext;
>=20=20
> @@ -609,7 +610,7 @@ static bool swap_commutative2(TCGArg *p1, TCGArg *p2)
>  void tcg_optimize(TCGContext *s)
>  {
>      int nb_temps, nb_globals, i;
> -    TCGOp *op, *op_next, *prev_mb =3D NULL;
> +    TCGOp *op, *op_next;
>      OptContext ctx =3D { .tcg =3D s };

Do we need to add .prev_mb =3D NULL to ensure the ctx doesn't start
corrupted or does the partial initialisation ensure the rest is zeroed
out?

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

