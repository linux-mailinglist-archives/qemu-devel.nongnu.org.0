Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FFF5011EA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 17:04:35 +0200 (CEST)
Received: from localhost ([::1]:36728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf11O-0002o5-U6
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 11:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0zi-0001SI-MV
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:02:50 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:46699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0zf-0000jw-RG
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:02:49 -0400
Received: by mail-ej1-x631.google.com with SMTP id t11so10545979eju.13
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 08:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vmNHjitZXHj3P9a+HiKnBa07QlWe+HlszfIi2JsrBjc=;
 b=USFuHC56r9PvABQfLJZm7//UXum0lbiuP7HKat05MWiXUbR83f7Kxk86ZddLz3tSiq
 9KhXsGIiJEH1M+EjedVkWzQGKv3ECZI99SVTq917+cuG6vZPPzuDl9SFklIzJRtyneMQ
 dxpj51gdqSnQwksgl6xgqVcnXPOjJTqdaA6RaTqU518Bq+yMnmhO/df4d5KGXxIfHQ2V
 frOQBGly3Anr6A/9FrBe00LV15g8gXSIP+8wPrLC9HTRCCk797zx2Bogewk7Frp3EOqK
 glrBVzMA9H4ugdrP+td9SQdrLgCO74XODucpKbLVpT5q3hiYmp0Y/DnjjWmK1C92bBSh
 rqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vmNHjitZXHj3P9a+HiKnBa07QlWe+HlszfIi2JsrBjc=;
 b=cub6HTBy2u1ZNOSRg/oMYBPrY/4pg174FH3neeuDIvtbJ8qL1V+/48/jdTJHSDzOdh
 cqZEO4gt3LfBjNo3PdfF/V5e1UDEPaU6DiBNznqW56PM2LctcoV0eXcP6So4PB4NHs1F
 jiYU433SQv+v1J2MfTEZUub7Fs85vKQlwJJc7f+oVYwTQ8W9zHGXUB4FZdP2NAEF1QHR
 oGqevgHxAQlYLZl/LL9Sx1sFgqiyHbMtt9w9pb06Hc9qV2JFonmorerfaOJhQJMMudbH
 qn3pCfjRSdEJRyyjrYmhe0oS94pS8js97IScta1DEVUjFGA1v/1U2oLoMNnqWUBGJehP
 TJ+w==
X-Gm-Message-State: AOAM531mh7rIEHlp1eQhz5Zy2eM+pwAfUaDMYxzudMJVOf1wDpau9YFG
 6NbslxD45FYL4t2bfG8sc3kKYw==
X-Google-Smtp-Source: ABdhPJzoeIjWEvPvgLT+bO/shnGBC7lKXFW3o74rldG1A8Em8mDu85/rMVXL4KFrnoxtgJRH3j4TIA==
X-Received: by 2002:a17:907:6d90:b0:6e8:c8e7:8622 with SMTP id
 sb16-20020a1709076d9000b006e8c8e78622mr2775243ejc.242.1649948566411; 
 Thu, 14 Apr 2022 08:02:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r29-20020a50c01d000000b00415fb0dc793sm1144366edb.47.2022.04.14.08.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 08:02:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 009351FFB7;
 Thu, 14 Apr 2022 16:02:45 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-37-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 28/39] bsd-user: Use qemu_set_log_filename_flags
Date: Thu, 14 Apr 2022 16:02:40 +0100
In-reply-to: <20220326132534.543738-37-richard.henderson@linaro.org>
Message-ID: <87czhjvhbf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Perform all logfile setup in one step.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

