Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208926FF674
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:50:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8YT-0003k4-DD; Thu, 11 May 2023 11:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8YP-0003do-0f
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:50:05 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8YM-0003tv-9Z
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:50:04 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f423521b10so38216255e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683820199; x=1686412199;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BwN5tpuRN2cJdotGmcOb41yElIh/yWePobfoz5DoaZ0=;
 b=u6NZXWHg6kiaj23pAfKJLPWT+jw159Zb7t4MUlYgsRPrHXIMRY2Nm36L+cPhA6QsPy
 NSIW1hYFH+vTyiVsaUqp4BMHMsOTbDk5CfMlJ1xHR99gKp2WIZio/MXmvzWfA2ZI1rjQ
 v7D8qLC+8ZeLsEL8P/Qozdak/+8xhPXP8k0ABqgn/L9dTlZTJ9hP8cenDx9VOJ/qKl11
 Tfb4rIAbLMR+Nw0CgI9fSfL3FXRyKCZON0YZmkmzNG3EuB1IyHnFSUTOpWZbiTL7z69g
 b2dkt44Pgavic4X/zTPQwxQyJAuFKYdxNH7mDcfBMBbgY5iBTDHTOVONB5SEPFp8oqGu
 haUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683820199; x=1686412199;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BwN5tpuRN2cJdotGmcOb41yElIh/yWePobfoz5DoaZ0=;
 b=RnNQnr7KmfL6qUcsSt5oPHXKEp5g3STOHJHJBmpIL84X73raun65x8Q/8qZgCpsstF
 mFaOFIthC7eZtUQgwROFh6Z2HYYxXnKk6OVKk5keYftsnO/AijGal+BhyIpgvJYPK3Sl
 lTnI0/QOPClFaGs2gG+hjzomYhgP6FcadgLbr0VB5ndHci9H+NEAazOQadC9mLCXvlPg
 43aC5/Ja5k2yu8qCSTL4bmoWGy6jeW2N8h67DNmo57ZNmIQw88AbOh2cKyLAXLB8rpdg
 xhPsCNM1qELTXJ5dGai3ZlhilKbxBAIglHn/4Y/QgGQgzv/VCSgKfyObrE4U0szW2NZL
 iz1w==
X-Gm-Message-State: AC+VfDw79FJHX2oF4etrcZY4dRXY9rhsySLoUXEaCcvnFczwwGyUt+Dg
 xtozQKLD2ePKGWlYh71uEtfqUA==
X-Google-Smtp-Source: ACHHUZ7GIIlncBM1Fl9CQp8FgOowZCqMSrvtE2t32BJmZpQynROG1mBKFq1DKqBcZIleANod6yGrPg==
X-Received: by 2002:a7b:cb92:0:b0:3f4:2374:3515 with SMTP id
 m18-20020a7bcb92000000b003f423743515mr11135701wmi.5.1683820199245; 
 Thu, 11 May 2023 08:49:59 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bc8cc000000b003f4e4b5713esm3446778wml.37.2023.05.11.08.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 08:49:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A33161FFBB;
 Thu, 11 May 2023 16:49:58 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-12-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 11/84] tcg: Add addr_type to TCGContext
Date: Thu, 11 May 2023 16:49:54 +0100
In-reply-to: <20230503072331.1747057-12-richard.henderson@linaro.org>
Message-ID: <87mt2a27h5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> This will enable replacement of TARGET_LONG_BITS within tcg/.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

