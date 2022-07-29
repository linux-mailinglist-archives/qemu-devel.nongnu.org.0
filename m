Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDE4585101
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 15:37:19 +0200 (CEST)
Received: from localhost ([::1]:43056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHQB2-0006uR-Qt
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 09:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHQ4f-0001gX-4F
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:30:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHQ4c-0007gn-IJ
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:30:40 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v3so5080898wrp.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 06:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=/xs9rtWTsJJa1n27V/Xiqs2Fe6ZxcaaSL73gS/RZlFA=;
 b=IOZhWZgBzxEZtzTlozyPpUqfcW9BnpCrAyFw5dtsHg0ajDQAUbhhlqVEykoDzSSFrV
 WXoNTVxqVUnBUO0YA0sq9xuGMR/Le1+QMRA1/JoBocqsRyj2ApNLg/8NS1gTlThKGzmt
 9DbfN0ue6lBRi3xcNBva9rkUtOuPvxNB3EcDr8fmoPuMDP2M+AC7ZKV0rjIBp4Dfluua
 5f6ezmcPLhuPIDrC0VpDA9DPB0cEewXZVR3btUM8rqNKZkokuEP2OH51UqUPDVuHMFWV
 51BnpHbqjH7+E9rs+dlrs6ZEe0WyrAWuF5vXQfempTlu+TK/v5GMBn9NMRsgoF/813ia
 +yAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=/xs9rtWTsJJa1n27V/Xiqs2Fe6ZxcaaSL73gS/RZlFA=;
 b=iP5UcCBU8jbhSdpiFMoUfDmIcwztcNAUmMwW/J71/HXA3U7wZDMq5gEsvCeWmW9qsy
 wli7n6AtHkIBtnevcUHXItMXofxQtNlWlTox5ATKgmZmd6pNhpIkUWCY3xCWHeH++c6x
 pdR7dcN1Ltffn8qDtmgjUxbkvWE42bws/Wj3rb+YJJwgenbcnRpHC0muXYNSnjLVeNUS
 +dYjfGER33FZG6AVmO/SqjVcHdw9BraFwgUBUD6uc2+BGQP1PwMpLo9ZQV5MIiDKj8i7
 Ul+2VyBYbhUkQbM+CyJoUamKoSuhmIH0Wl2Yzp6R1Jzgjgu7qXgwHtrgb6dPH5qnmRBP
 n8/g==
X-Gm-Message-State: ACgBeo3cm1CkmkH0inYLXeVbrZ3R9X7wvHkuh5BcLMrYe1r0l+QAuA1S
 sxp510RitH6W1OHU83jX5ncnfA==
X-Google-Smtp-Source: AA6agR6LTVcJgSAsIOI1iBkMxqR9Vj6+Om/W2i9LMSwds1Kc5jGUQvS/a1qWqjc0p004tqu529XC5w==
X-Received: by 2002:a05:6000:79b:b0:21e:9709:2c28 with SMTP id
 bu27-20020a056000079b00b0021e97092c28mr2399001wrb.539.1659101436688; 
 Fri, 29 Jul 2022 06:30:36 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a5d4dca000000b0021f0cf9e543sm2467064wru.2.2022.07.29.06.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 06:30:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 97D801FFB7;
 Fri, 29 Jul 2022 14:30:11 +0100 (BST)
References: <20220728200422.1502-1-luoyonggang@gmail.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Yonggang Luo <luoyonggang@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH v2] ci: Upgrade msys2 release to 20220603
Date: Fri, 29 Jul 2022 14:30:04 +0100
In-reply-to: <20220728200422.1502-1-luoyonggang@gmail.com>
Message-ID: <87o7x8f3mk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


Yonggang Luo <luoyonggang@gmail.com> writes:

> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  .cirrus.yml              | 2 +-
>  .gitlab-ci.d/windows.yml | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Queued to testing/next, thanks.


--=20
Alex Benn=C3=A9e

