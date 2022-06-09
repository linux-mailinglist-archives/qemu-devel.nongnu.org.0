Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F214C5452DF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:23:56 +0200 (CEST)
Received: from localhost ([::1]:32818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLsy-0007au-1a
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzKJL-0002Yx-EB
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:43:03 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzKJJ-00042j-VF
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:43:03 -0400
Received: by mail-ej1-x62a.google.com with SMTP id o7so14985243eja.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BGK4hDaw/jG9yRD/qZWrM6XiDndlUO9LQdEFQdUUI+Q=;
 b=rRY4IBRXIoRG2fhY9fhtZ+GlK/11VvGpnFe9LBwDGrE+VjdYMNfYpGCh+/JXGsYFLk
 fvtNvtqOt0/5CgIIORhoLOOmLNHHEMg+ZScNhq9vp7OMsEeguv3YYl85J8I+lOuoTV/C
 ylwC6MBl9cESLiqCAw9TwVuP/orhec+cE2GWzeyWylgJx5MKQnAE3PYe6ar7YLtZbF8x
 sUDfRq+HZeqv/KLGtZABzsXI38+7HGqaY5T7qs1P76TG1uzhQ9t+aNTs8VJlTVx3FqPF
 GdVlUNCyb7yprfMr1HBtQY92vFKt1H8uC8RCnekf/kn3gpxCOKZHwe8RQW0jHYiAWhZ2
 Yprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BGK4hDaw/jG9yRD/qZWrM6XiDndlUO9LQdEFQdUUI+Q=;
 b=E0Zl/mdCCWvWNRC1AXN1Tl4KvEMeAtzYYxLtDKM/lFMaFUWVPD1hEE4pjs2degOtiA
 Tq3OR19bJeo2fQSDngLlM7/8pN57id2kuun64CkznKRHqZ6nATTmFnvxX8YRrM1uvMxt
 eonuBkG4ouHS0lE0okBD1DP1QTWUYgSy4sq3t2IEpWEzdqyGr0Aq1sZXyfUlen9Wstu9
 8v8ilUAAJa9aAJPvsuvHYoJXnH/tsRhchdqpaAt7djpKsi++ioOs0HT5uGeolOUwDmFL
 q+IdrhVKYbI5RbtkhNQvbfLkTysvrEn15m3grDkaEYMDjRkRtis7osuRuJwUW5CU6iC0
 SABQ==
X-Gm-Message-State: AOAM533psik5dRLdpmFgl3QhfdT/YiFFnwkm9Sj4gCj5boMuEOIbkFS+
 iVyk9EKmQSWahuQa5PF8tkjfaA==
X-Google-Smtp-Source: ABdhPJxYEtbBmSj5ghfU8TGu5D1AVa8Cdvg203hELhpMm4GKCRoWsBgu22GxhrL17IOGKjS402VY7w==
X-Received: by 2002:a17:907:1b19:b0:6f0:1022:1430 with SMTP id
 mp25-20020a1709071b1900b006f010221430mr37612985ejc.13.1654789380570; 
 Thu, 09 Jun 2022 08:43:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a170906614900b00711c7cca428sm6513565ejl.155.2022.06.09.08.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 08:42:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A28231FFB7;
 Thu,  9 Jun 2022 16:42:58 +0100 (BST)
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-15-richard.henderson@linaro.org>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 14/53] semihosting: Move common-semi.h to
 include/semihosting/
Date: Thu, 09 Jun 2022 16:42:52 +0100
In-reply-to: <20220607204557.658541-15-richard.henderson@linaro.org>
Message-ID: <87k09psv0d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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

> This header is not private to the top-level semihosting directory,
> so place it in the public include directory.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

