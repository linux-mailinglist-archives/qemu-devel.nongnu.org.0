Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5523943B78B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:48:44 +0200 (CEST)
Received: from localhost ([::1]:34768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPcx-0002TW-D6
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPSI-0002uq-HO
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:37:42 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:33420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPSF-0004ut-KC
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:37:42 -0400
Received: by mail-lf1-x12e.google.com with SMTP id j21so209753lfe.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 09:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=mJTZHV9hik246pZPj1X+N+VDvdAe58chZdKH+6+tR0I=;
 b=pXJTy5X4Tc4/M0vvhP5WRntIKvu/wDFTDZkwbJq4yA5R27laQa/9zgn8mXhmQC3pdP
 CGlFrOmIuxQh52sy5BOpuiFOefPVjuDqm3O1dwqj4Af4F1yYygDENqsoQ4DAoIpkcCSN
 I2Vy2OSa+m4ftnU9T/5aLZDRXOBXntcjtCmKySgPkp2BrAq9vYQ+mI6LcWgnqwikPARQ
 5p5M2ZsQI8XY2cMkjV4SqLeJOp1leefJbbyepQXxctyR1xAmAx75h8DcNCm8kWFTf/a+
 kEwt6f7kYYDUwYfnFqeObwizjJceDhtsyG3wkZqh78ztOmGx3f49D2Wd+Haj1gav+23Y
 s0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=mJTZHV9hik246pZPj1X+N+VDvdAe58chZdKH+6+tR0I=;
 b=aDRCybH6LF2eHMjIzka23B2tLmWrGrTvFmz2Ldg9UkP4sUGYQztbgWpCIPjuF0wPlZ
 HuGrR33BDMmUrq309ZwJjCGIbXUQ0K3tgD3hYmMB8YG0dGwS6a4dWHivlH1M60/zhAth
 r7NSMELUOFsV3XlY5ZiZb0geFxjAcrIgU+F07Y1bCzqSRg2ahohfYiBp60yM1chnm5Vs
 x/7loTE3iZkdOeU8mGJo0Cfke6hC/U3sCaQl7YzCAdBIiXAu/U3WcMdWuVTshitGg8i8
 JFe5yTuSGN7hjJEg4qPtpl72DfI2ueu0KtRgo1cylGvOaC2TFzmgBUi1ZKL6agoEANNi
 UjZQ==
X-Gm-Message-State: AOAM533Ed9RLSlph/t91+8dvuMTbFC+h279pQkBmorICMHYpCwSmio58
 rMCBm8+xGz0JWWQyr5ExUBC586AoMunNKQ==
X-Google-Smtp-Source: ABdhPJyVFP8Qb2y6D8+dEnkiSfaW4SFAhwP9poNHv3TkCr1Zku7MF4sthe8IWMtYu0d7lE5q4C998w==
X-Received: by 2002:ac2:5f7c:: with SMTP id c28mr24376292lfc.512.1635266258016; 
 Tue, 26 Oct 2021 09:37:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j12sm759211lfu.7.2021.10.26.09.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 09:37:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E7D1E1FF96;
 Tue, 26 Oct 2021 17:37:35 +0100 (BST)
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-49-richard.henderson@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 48/48] tcg/optimize: Propagate sign info for shifting
Date: Tue, 26 Oct 2021 17:37:31 +0100
In-reply-to: <20211021210539.825582-49-richard.henderson@linaro.org>
Message-ID: <87y26fyc6o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x12e.google.com
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
Cc: luis.pires@eldorado.org.br, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> For constant shifts, we can simply shift the s_mask.
>
> For variable shifts, we know that sar does not reduce
> the s_mask, which helps for sequences like
>
>     ext32s_i64  t, in
>     sar_i64     t, t, v
>     ext32s_i64  out, t
>
> allowing the final extend to be eliminated.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

