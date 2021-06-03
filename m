Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86F839A330
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:29:55 +0200 (CEST)
Received: from localhost ([::1]:34210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looM6-0003ad-MM
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looJS-0005N5-4y
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:27:11 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:43873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looJL-00008w-Up
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:27:09 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso3833519wmj.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=zZkINOiCfSLYMZg+DwgAMCAuQpUCdh9HGFRlZOfYxOM=;
 b=RqMIoQsMiBS8cAttdYfEFNwelUZYNvDsH/723TFvtRCbgN9QbbnvsrcRsybwWRuqPG
 GS6qlkEdE4+YgfB4km5s62tKLi0XULPWZ3CQCXHexL92I35Fpv7GBpH8k5ucnNpDw7MI
 zw55WqYh3kI+ZmCEOyqE2hWYahb/KnTUgnO1VXuyCzW6IN4WLaiXS6FvLwGLzjZh2kpj
 +OM6d6Nj8FAo/C8jVzjpV5VnqTbpKRbTKSun4jnDwR+ZW4XPpqkxsGaI0WEqGHZ/8new
 vpZvbLBBPB5x6LoXzzwvVQ/uP1RtcwnlmeAISpgwqqOdb0kE37N6DEyYZ62YcrP/GNF5
 +/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=zZkINOiCfSLYMZg+DwgAMCAuQpUCdh9HGFRlZOfYxOM=;
 b=OoUo9/8hifGtGat4nYH5pJTBTsYzDquTDROj6fr9ygNo+C1qP1lS1/UoPILu88dbfZ
 Ycs4dKK8HygJx19KKWLkXAcbkZGc0xFS8O2XYNHLjxyk0wzB34DSKgZ59P+6zNyYRM2d
 SR25sj9vBqXAcJ/TWZtRjwp6vyMtFdR10GYiPctyROy4LgSX8MGW9Dw/gDjX9mWp1bj+
 pjwQdsIDRMtrAG4O4dd7QYKyq9CJuH08rxVkUhLnrQYVnEUNE/wzH6DqEdVrGjmBWwoJ
 Bmpo4dDqgKWdSZyfKS3Gd5asDqHopyQK+9nXI8bF03i1Okg7b8ho18/lkw1hiXr0fl1x
 jGeQ==
X-Gm-Message-State: AOAM531h7PvTPid+qk0TMzaILyD6vJYUeh4AiF5BpT2lwZ2SA4cFbgTt
 DVurTsnlgmCJkSHN44ZvKpgkMw==
X-Google-Smtp-Source: ABdhPJxFbKQRRBjpr8xQbunFY7dyCns/aWuuZCZKrzQT4mccylN+r1YRiWmw1/3nbTZD0m9KiCUMoA==
X-Received: by 2002:a1c:6503:: with SMTP id z3mr36989483wmb.72.1622730422608; 
 Thu, 03 Jun 2021 07:27:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u17sm3581604wrt.61.2021.06.03.07.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:27:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A8581FF7E;
 Thu,  3 Jun 2021 15:27:01 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-21-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 20/28] softfloat: Convert floatx80 float conversions
 to FloatParts
Date: Thu, 03 Jun 2021 15:26:55 +0100
In-reply-to: <20210525150706.294968-21-richard.henderson@linaro.org>
Message-ID: <87mts781my.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This is the last use of commonNaNT and all of the routines
> that use it, so remove all of them for Werror.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

