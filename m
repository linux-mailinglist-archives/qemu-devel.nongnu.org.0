Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA7643B5A2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:31:06 +0200 (CEST)
Received: from localhost ([::1]:35664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOPp-0007dr-8e
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfOFt-0006IU-4v
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:20:49 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:42774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfOFr-0006w1-9b
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:20:48 -0400
Received: by mail-lj1-x235.google.com with SMTP id 65so15227894ljf.9
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FabAwDieY8deos63OWC4txncu+8jmFNBejMd+VihahI=;
 b=SRPb8m/aZfLtxoSP/okHqVc1AIiMdV3khVSecOgEjy3i9E2b1J97zHWsojGZzefjWR
 HNZLIM9fKW8H+1EUrNiU8f9QBLYePGKAMcYu/c02sX9m9Qr8ZunonXof42KqAyisvqw/
 6dY9FzoIJwPsRx6p337C0g+Fdyk5NKsTmN221sCijeldipByaOWyE6xY7Htof34OizCj
 edU7RZjtZkX0WSnrflNF7/lraszfAs9I+6tcgcTFqqMEUelixGU5qz5OYmIgMyu/I/RK
 uN2NDxziwbw5yx5R4yg4xLmauloomAfV62SvtQ63GcBkJh4C5Gxlxql75Qpk9RpWiyws
 JpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FabAwDieY8deos63OWC4txncu+8jmFNBejMd+VihahI=;
 b=y8WP7ITXBCzDEyJoyDR8gZd+BmDWcVyN+UZtF81ka9V3CFKhRs2sdHCtHP2J3By7x0
 3I+ZBsLyD7j+DpxIawKwrNwNDc7SCVktDerAEULbr1/fLBY+FteHAr2a1eoPGb8Vd2hy
 u3JNX/rbmrKxcaMkZu3al3VxjYUXZQlm/lcDrl+uwC9UBTCZjvQDH81BUIZ94U5ruVHI
 gJH3MA6/btpe4cZ3npIiXR1a0hB2n9Ju99PERXNkPo23ob+8N0Em71rOrJgDkUizjzfO
 uxMo2ThFxXYO4Ym09ZAZ4xzXL394FJdAG2fAECWfN56nMW0bMSogfix4Ac6tWgg55wIN
 t5Vg==
X-Gm-Message-State: AOAM531SfgTyDXH3zdZf0KQy1+h0q8Io2WZb23XOVQQQxsaf2dyXlRIY
 C0Xes3Fz/RYKAscDbU4HUgdbEP927vk+7g==
X-Google-Smtp-Source: ABdhPJw31k+myfDgLxYgbnl8p6m0rsvovUSKFoWdw6pfAIozWaVSfIXs006J3lbd4lFo5/WqCRTxrg==
X-Received: by 2002:a2e:b804:: with SMTP id u4mr26990148ljo.425.1635261645039; 
 Tue, 26 Oct 2021 08:20:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j17sm1238835lfg.152.2021.10.26.08.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 08:20:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E39961FF96;
 Tue, 26 Oct 2021 16:20:04 +0100 (BST)
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-16-richard.henderson@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 15/48] tcg/optimize: Split out fold_const{1,2}
Date: Tue, 26 Oct 2021 16:19:59 +0100
In-reply-to: <20211021210539.825582-16-richard.henderson@linaro.org>
Message-ID: <87a6iv24pn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x235.google.com
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

> Split out a whole bunch of placeholder functions, which are
> currently identical.  That won't last as more code gets moved.
>
> Use CASE_32_64_VEC for some logical operators that previously
> missed the addition of vectors.
>
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

