Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6457555F18B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 00:46:44 +0200 (CEST)
Received: from localhost ([::1]:56176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Jyl-0006ls-HE
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 18:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6JwY-0005xn-Sc
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 18:44:26 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6JwX-0004Jf-5D
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 18:44:26 -0400
Received: by mail-ej1-x62e.google.com with SMTP id lw20so28757294ejb.4
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 15:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=TwYy7d9vf8dVZLk6Qy0eV/ITOUhQJEDphII3Oq9TdYg=;
 b=OKWrkzb0aeyTYjdlU7mXgenR3X5XMYGAAxzgSJ2dgHvHmu2xewHisyBFkVQrIAJsAa
 stbsF/IFXB2ozf+2cKgh/+Am/zcLHZ834Tv8oT6GXaK5YxFV4w/RnSEJnzx9HUtVU/5J
 NRHlgeFCDvF8NCYPRQV0Kz7WTrttXmEkhD9kRGQO1QVDEjoO2XGX07JXHktqu1yiHTMo
 Htk7L9nWAEYcpu5KFJE4U3Zxb2q3ZfX3uy3W5efNEXsUjVB/F/JQLcmS5cgmyLzCAx4J
 b3PnepRQ9I9uIlDp7sTdD70wWXJRyUONKDUn+M/ZMQevDDvLE4xk6oNrYLTo/rnRcEGB
 A/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=TwYy7d9vf8dVZLk6Qy0eV/ITOUhQJEDphII3Oq9TdYg=;
 b=Cv9x6A5F6tx55OrnSdLFkurUcX20bph0UsMF1yz//dHpsNJbxLoc4iyVyhRdlqP0Sp
 070+j7PbKhWV12heB0hEe8Lz2sg+3MOzQOYUytSGpG8L94lNW9FekkNYWRUwHqT45E/b
 w7Ren83CPdoux4K48w9wJDNJXy+8NZ9g6mKsnsGiLCah3uzAw+KUKRAENUia3cLx0I1w
 kifWq01ULKGqeJwB/qJPS6E55tmPHhBcvNSvfYe9+2QJLyls9zmZJmpbvrjfEVTQUKk0
 sIlsW8qKUSzprUnXhrtb2QKM60uNPgVIa+jnGkULh84wAx17/EOZERoATDDb1lVXwzgf
 ppkA==
X-Gm-Message-State: AJIora/Ry4l8qN/jtESdwmpSZPeIX2NKp0fxo+oVkGpFT34R/UityR5F
 a5ZFpBT5I/dQOLnSsSyhiVsKiw==
X-Google-Smtp-Source: AGRyM1vNMMGndMNvAGZTT974YbTg9iyR46mVreEEO3534RMSG+fG1INy4szF11UB+ti3USvb+cbaog==
X-Received: by 2002:a17:907:968a:b0:722:e508:fc15 with SMTP id
 hd10-20020a170907968a00b00722e508fc15mr417628ejc.188.1656456263652; 
 Tue, 28 Jun 2022 15:44:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 x2-20020aa7d382000000b00435640c141esm10267819edq.93.2022.06.28.15.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 15:44:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 15ABA1FFB7;
 Tue, 28 Jun 2022 23:44:20 +0100 (BST)
References: <CAMo8Bf+9B8Cv3gJ1Ti_Wj3AQtdnbB=XvK-L6xWvNtdBGZJuP6Q@mail.gmail.com>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: running softmmu tcg target tests locally
Date: Tue, 28 Jun 2022 23:34:53 +0100
In-reply-to: <CAMo8Bf+9B8Cv3gJ1Ti_Wj3AQtdnbB=XvK-L6xWvNtdBGZJuP6Q@mail.gmail.com>
Message-ID: <87y1xgif23.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


Max Filippov <jcmvbkbc@gmail.com> writes:

> Hello,
>
> there used to be an option to run tcg tests for a softmmu target with
> make check-tcg
> but since the commit 5377a1000192 ("tests/tcg: list test targets in
> Makefile.prereqs")
> it is no longer working for me.
>
> Is it supposed to be working and was broken by accident?

Hmm I thought I had already the fixes for that from Paolo but it seems
it is still broken.

>Or what is the correct
> way to run these tests now?


--=20
Alex Benn=C3=A9e

