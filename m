Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C974A82BB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 11:52:51 +0100 (CET)
Received: from localhost ([::1]:46396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFZjO-0001u3-LB
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 05:52:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFZc5-0005C9-4P
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:45:22 -0500
Received: from [2a00:1450:4864:20::536] (port=42782
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFZbz-0002dS-BU
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:45:12 -0500
Received: by mail-ed1-x536.google.com with SMTP id p12so4969665edq.9
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 02:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=eqt5kgWK41l8/DvSAMCyXlQhGcUfxzmZeLlwCRTye++RuoVrxwJClPwmtWJAoKnmK0
 ExynT4jJ4O1xFnRkrxmXNa5NrYIUBeAs3b9GqPKNQI8JJn4zJjX64hfqwQshzbDScSOb
 fgUQM8HxpBwe9m0Ph+i8kS5WJebf5MltHSmbLoyqSNmyN1rZbAV3uBVdMi6vwJBJeF6K
 /cqoa45ZiSq8BlDS2MukNa83w1ixe9cU2FR+E1ilOas7YAQ48obYsQi0YnU9fVSnBxRb
 ON6bPvlhYFVST+FTcpzFthBJaWPiY2jNSyfHgSn4KYLioNpgWHNFvBOIN1cEwah+UUVq
 MFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=F96NRE8q/SNcGEo2HE/hTDDDniBp6kIxnsB4ZJ23O8etr9yu1yNFWMq84vkdcpAXN8
 KwCaTgCqfJpnNSgXmKCOPRmT7xyu4vn39MFj0yCn5fmFP/dG4IEfigxm/9t/7yvtTniZ
 eS/3uEgtlxU01ZhjG3GmboGhNMDlD0HqFhAD46YDX0FyiQtZiM+fzF1gpu4sTZCFpyGG
 MCHY1xBnM4OnsYS+5J4QtJ2pQhFrvmwy9NP6s4sw7J3otA/EcAjzFkA2EHX6hIbgOBHR
 vtZ64Hg2pNsq6iCgH9PIkgsBdsrVzGFWgZNG14y1PHdVTS1ajYUv6eNSVCFFeAE8WkpL
 uzVQ==
X-Gm-Message-State: AOAM5310y+vRVLOO3bncRzm3n9oseBSI4kS3NwAKuGY2BdE3B8XV9bXQ
 OOgYizRwPhJFTPIfAyE1zhTseQ==
X-Google-Smtp-Source: ABdhPJxA5EzBrjiCJFLDbmkF38SccVVb83WP9oZSeWOl0yTgoDXQnncw+obVKl0RIzKuuCXzpjkzqQ==
X-Received: by 2002:a05:6402:90b:: with SMTP id
 g11mr29487676edz.69.1643885109023; 
 Thu, 03 Feb 2022 02:45:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v2sm16422095ejb.114.2022.02.03.02.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 02:45:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9769A1FFB7;
 Thu,  3 Feb 2022 10:45:07 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-19-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 18/20] tcg/i386: Implement avx512 multiply
Date: Thu, 03 Feb 2022 10:45:03 +0000
In-reply-to: <20211218194250.247633-19-richard.henderson@linaro.org>
Message-ID: <87pmo4tej0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

