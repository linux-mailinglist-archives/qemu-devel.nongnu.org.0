Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C149580009
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 15:37:14 +0200 (CEST)
Received: from localhost ([::1]:59026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFyGm-0001Kh-Mg
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 09:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyEy-0007fS-L8
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:35:20 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyEw-0003Vl-RH
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:35:20 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d8so15929227wrp.6
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 06:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lqhlxWyWKLtuFG4jSAJ7ND2MnebtAmoapB/e7kVT1wE=;
 b=ot1mPT+ujEGfRAKap2gVWUqkgNtNS4V2+9ZS1LY8h59nPWfRO/M/tO912yvdxzoUcp
 74pv3sFi5Em8FYKNTK0YfPFgMSW9sUpsJFfUXEg0VZyeZuISYZudCc/WabLMVhD3prvb
 J9cG0OxhNnTfcqLEj3bQNcCm0QAEQ09yKwfMpxV991znO6njTaf6ja/4YqpsPBZW4Vrc
 gXBPwZ0OmxBa8Ij87Kwfw0AUww4JqTOiW7IXU/VbGYupbFqeHadpH5tN+o1TYlr5tG3q
 y5AQ2HTVB0Ib8WuL+2YJt3ffrE15rH7graUgjbYBT22vbo/V52cu0AUhSLTBZodfirkr
 xSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lqhlxWyWKLtuFG4jSAJ7ND2MnebtAmoapB/e7kVT1wE=;
 b=SLxesC+mb+vBkE+i/s7GHg6FVW1IimK9Sddu4hPOm3H9AHXqUklAmtqsV4E4prtNuP
 g0JEdw/QD4hw+c2dNlS8e2R4KpWEdZnQ4GcGXKhjjSqKa2f5CKVtindhxInsuq3f3ENj
 ya9vqJamPpPP4v2O3sy1AxhwHhQD86ka/v7ipedABq5fFCidETWs8k86AK8QUBm9kUxq
 FmaGV49XLu5cBMtxCm90WmtN7hFY1ckHWWqgmk8OZuLNAEFza+DSXrD7ovd4hFqfQPOV
 v7gjlmM0RpvQXCO1cL+yjGH5eIr1Yu127XjtU/X8TeVqz1M/6Usi1hoDchFI2uMZlcSD
 zKbA==
X-Gm-Message-State: AJIora/zWfIH6ZzZsJ+qbaZOFbqb2utJxtLcxAQC2eiiLh7DUmZHEkCS
 /82M73DC4FFi+yaoT1uI9vhYnw==
X-Google-Smtp-Source: AGRyM1vMzSgaTqAN9tGuj9NqRNrBC4/Akp19Hv04YuYDVWoOO1+XX4zmJPD7jK0Dvxhe9gkhFjE9wA==
X-Received: by 2002:a5d:498f:0:b0:21e:4074:8c49 with SMTP id
 r15-20020a5d498f000000b0021e40748c49mr7961362wrq.70.1658756115890; 
 Mon, 25 Jul 2022 06:35:15 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c4fc500b003a03185231bsm16265535wmq.31.2022.07.25.06.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 06:35:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 70C1F1FFB7;
 Mon, 25 Jul 2022 14:35:14 +0100 (BST)
References: <20220712103131.2006653-1-alex.bennee@linaro.org>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] docs/devel: fix description of
 OBJECT_DECLARE_SIMPLE_TYPE
Date: Mon, 25 Jul 2022 14:35:07 +0100
In-reply-to: <20220712103131.2006653-1-alex.bennee@linaro.org>
Message-ID: <87czdtiact.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Since 30b5707c26 (qom: Remove module_obj_name parameter from
> OBJECT_DECLARE* macros) we don't need the additional two parameters.
> Fix the documentation.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  docs/devel/qom.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
> index e5fe3597cd..0cf9a714f0 100644
> --- a/docs/devel/qom.rst
> +++ b/docs/devel/qom.rst
> @@ -292,8 +292,7 @@ in the header file:
>  .. code-block:: c
>     :caption: Declaring a simple type
>=20=20
> -   OBJECT_DECLARE_SIMPLE_TYPE(MyDevice, my_device,
> -                              MY_DEVICE, DEVICE)
> +   OBJECT_DECLARE_SIMPLE_TYPE(MyDevice, MY_DEVICE)
>=20=20
>  This is equivalent to the following:

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

