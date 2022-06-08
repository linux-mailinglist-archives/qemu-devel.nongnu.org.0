Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C84D54363A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 17:12:12 +0200 (CEST)
Received: from localhost ([::1]:57442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyxLu-00027H-Hl
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 11:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyx8N-0003IS-EZ
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:58:11 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyx8L-0006r9-Ok
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:58:10 -0400
Received: by mail-ej1-x635.google.com with SMTP id v1so31323518ejg.13
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 07:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vP5ZdqxLwmCkJi6GZU2PlqY7NQswDa+l07J1FeR7k/8=;
 b=ZkVwRzMUOCnHO5nsmwC1g5472wQyp+GkIRh3rIEjfryYHNnIadmzxn5+kYwhhdWYZk
 GpRIMqHPYRc3zc0Mw/0rWt91gNoCL+q2gZ6ul0SdUH/JXtjbJf2nxlC4YoF9R0yjB7YH
 qVF47wlTCGVaLRqpu0LFZV0BdaZe6tUBGw9Hq63BhsioiUd4qk7ApLPUSHjNL7vixoK8
 MZ6pr0DPr/R17h8IIv1IJ3FtIKylbexu94jF8+0qj62SeBq0Ovq4nHzweRsFwBKxoik0
 m2KFXtJuS1iuUb18OuaXskVRGu+1k/lw8/FgzEbaTPoINa8Ek49yC1VgQFOttG5NZYRx
 KMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vP5ZdqxLwmCkJi6GZU2PlqY7NQswDa+l07J1FeR7k/8=;
 b=CkStlhZCtVfka7A40ptPWymkKgLUydPT8LltjXEnZ2Xg3jKaB10OxEp17H21bDO4BO
 7vqLe/Ybbge6HE2oc27ojJlz/inuZOgMkEJfrw5+c5ljKsOYufMtDtisLG0TPQleymxW
 ERUKtDXX60wy67g6LFRFqWBXVqocZZ55A/Cmyhr02Vlt2X+RzDr1Y7qz9cAOWuoilntc
 TB0AHOSAyA7MhRNXoC6BDayY3/Eb2peYraORQ/2525XBn5tTxHePSqMIQOMVrk7W4avy
 F/QrwZALtZD2vIEUMF0LbvO+DY7Bt+9Wb9Ym9WMWNinJgOV/kYGZmD54/TJtxcSIGGPi
 B71Q==
X-Gm-Message-State: AOAM532p1UbR6Egg56490Sx/ovJr19TWZ8PEwclCqakYw8DwU8r8p2pC
 n8iZfWhM0zgZV1TD6DnxU3y4Uw==
X-Google-Smtp-Source: ABdhPJxBznpRzO9kDoaCZUF4kjIcf4geD1Pu28WipWhTqiy4INoFYbWoKLXjN11T60RWnYjLlbm5pQ==
X-Received: by 2002:a17:906:a45a:b0:711:d546:478f with SMTP id
 cb26-20020a170906a45a00b00711d546478fmr12840288ejb.741.1654700288153; 
 Wed, 08 Jun 2022 07:58:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 s23-20020aa7d797000000b0042bc54296a1sm12295354edq.91.2022.06.08.07.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 07:58:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2D35B1FFB7;
 Wed,  8 Jun 2022 15:58:06 +0100 (BST)
References: <20220604032713.174976-1-richard.henderson@linaro.org>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] test/tcg/arm: Use -mfloat-abi=soft for test-armv6m-undef
Date: Wed, 08 Jun 2022 15:58:01 +0100
In-reply-to: <20220604032713.174976-1-richard.henderson@linaro.org>
Message-ID: <87ilpbtd6p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> GCC11 from crossbuild-essential-armhf from ubuntu 22.04 errors:
> cc1: error: =E2=80=98-mfloat-abi=3Dhard=E2=80=99: selected architecture l=
acks an FPU
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

