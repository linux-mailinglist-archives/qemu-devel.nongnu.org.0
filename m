Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A6543B77D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:43:59 +0200 (CEST)
Received: from localhost ([::1]:52868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPYM-00040e-6J
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPRb-0001r6-0H
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:36:59 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:47038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPRW-0004rv-U1
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:36:56 -0400
Received: by mail-lj1-x22c.google.com with SMTP id e2so4598639ljg.13
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=C5XVrPzatG4txLGmDlJH2zNn4eNzaIJM5B5tSnPA1Gw=;
 b=qDk/FbzdcvEx4RmNp+hiHtn3bYFZaAcLzHHq4H4t2oO9ACQA3GoeG3DdABJbCYzlco
 TEyLHeT8r8+XGW8b1mSh2Cd5Rgb0gEsDyR0dDcPPX5rg6WKyCfeWuLTgwmTXPMyDc2PR
 vvO86mQQgKhF+2KsU6gvpT74lOCfvmiOP3uFqkrTrovNnLBpoNZzHhuI9EzntCp88mbC
 m5tIruW/oo1YfvD2Chvh132X1SCU3Zrpof6SZ482wCExLxK0zp9/88qNrqistWzu/tNk
 Y66Qz45+E08iOoe7FkyH8VV5uYlqbc91IIHkMAa2EHKUOqK8v7pUGXXR4oN887Uc6CfS
 Gq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=C5XVrPzatG4txLGmDlJH2zNn4eNzaIJM5B5tSnPA1Gw=;
 b=TEszQ6Zv/8Mc6ObjZK/ILWlxOZnZbQbJKB1xE7A/GFCAOkQpmbdDlIilGOP2QPH7ij
 wEOh8MmeEtofOLAmnp8lD9PM6YcNr+ystPkukylNrt/C18x3ODSOulSAeR3jEIw1Qs0U
 j/5N4CwWv6DT3mUh6cs1DHmYhskv/+2HANCOdT3xP4YTr/B4i1kh85f040B0fIPPvHdw
 vyGpIAf+tBmOGOOZJCf02Bv1dOoHACXOYCT4OMTsYu5R56SBFtO9SLzALJK5PH9ycPOT
 gKujS+ycJf1lU+pyBNp8BIkFsCZNNZE0BUM94r2uNMGeLuAZyeWOc3M2rLn+SSWO65Vj
 4PCg==
X-Gm-Message-State: AOAM531QBRJ/pBMfsk9Z3bTxDb7y4UASXIRywsIGxbmKRh8NgO0AylZm
 nIuktMW0rP3i+UT8DaTfVpltQQ==
X-Google-Smtp-Source: ABdhPJxG+5nuNfBCgdeRl4nz4mvBJVVkCeXDgxgYn0KPO8dxYal6uVXJsxd8As4H9DjjEvFhyKHVLw==
X-Received: by 2002:a2e:a361:: with SMTP id i1mr26444883ljn.365.1635266213469; 
 Tue, 26 Oct 2021 09:36:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d14sm2280492lfb.210.2021.10.26.09.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 09:36:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BF3371FF96;
 Tue, 26 Oct 2021 17:36:50 +0100 (BST)
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-48-richard.henderson@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 47/48] tcg/optimize: Propagate sign info for bit
 counting
Date: Tue, 26 Oct 2021 17:36:45 +0100
In-reply-to: <20211021210539.825582-48-richard.henderson@linaro.org>
Message-ID: <8735onzqsd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x22c.google.com
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

> The results are generally 6 bit unsigned values, though
> the count leading and trailing bits may produce any value
> for a zero input.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

