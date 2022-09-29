Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286145EF833
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 17:00:31 +0200 (CEST)
Received: from localhost ([::1]:39434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odv1a-0000P8-4S
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 11:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsdI-0006dz-Kp
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:27:17 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsdD-0000ro-DV
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:27:14 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 130-20020a1c0288000000b003b494ffc00bso2592294wmc.0
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 05:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=2Rfy6wHZJqmidGAbipkoBkOSlp7EwwRSmenX35/wo2o=;
 b=dWgSzExkeBm6LQGmercbj7tdbeNcxpRSDlOQkhoznd1Ep4eHkP1eVSbGCEkpaojmOW
 frgJWqNUxDmRNWjcgUXHT0rraZ6HP97GzU5cM6W0PK0Y5KQ/eX9h+tyqMQJRvlYq2EIG
 4TjUqxnLXoiCMmoAlznH2JC7LxjJSCneB0YzVfvOXI8UstLucT9fOmbiQE2TWhZYGO/0
 SYMv1bXw6jL3tHtwCcO2TNRKvpljXS2ggsBSF5uRrDt8mZBRIm54EJEK0QPFDvVtmeOI
 +QF0boUCrreZCJzntC/6Rc7hnyWgknEsa3eRO6G5kdL6L2vylkD/2jF85MzTMgqvT2D+
 EsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=2Rfy6wHZJqmidGAbipkoBkOSlp7EwwRSmenX35/wo2o=;
 b=Rqrje0OLOPYhzjGnB7irmV6Cvkxyt7JjjAJOLXPL5nRxa/+ALP3S+LxkJr8ztdHqad
 usRtz+ysHRhD/tXlJEnKLeqFf5fN4GM4TvrigzUllqmfvzrpqB/SRGCwVlpoQoXmtTtm
 XsJjcPOWM7h1MwWVVewHEAWXnW6Kt8EMv1/FgG5BP4j00PaMvZ4YJ2NDcBC2u5Xk/QgV
 jk7vEGMFodiMUl5k4L7aLQk0bfER//3d3Gnz1m9NPkrNMoROv/WukQRD5XOMvqCzQa8M
 HsYUzUoERCM4UP6xxum/UIhVbjuylx4f5cWfsFf9zjzNNwCT6FIInJ9t0svBnmC6bxbJ
 jJKw==
X-Gm-Message-State: ACrzQf2G7ddoK9arhphy+47lq8wgjy0d1ALrdxLFvGN7hhfcanhpqPEg
 Bw7U0XnS4Uk/NnIvcYInuTP0yg==
X-Google-Smtp-Source: AMsMyM4Q0gyoAjGZqQOoiz/FdgEAZxJv6pTiBQ26nEsoIi43cWh7vlkuTctXeRsiZOTya1jAXXOcDA==
X-Received: by 2002:a05:600c:a48:b0:3b3:3256:63c with SMTP id
 c8-20020a05600c0a4800b003b33256063cmr2111095wmq.34.1664454427537; 
 Thu, 29 Sep 2022 05:27:07 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 co4-20020a0560000a0400b00228d6bc8450sm8059134wrb.108.2022.09.29.05.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 05:27:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 053071FFB7;
 Thu, 29 Sep 2022 13:27:06 +0100 (BST)
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-9-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 08/17] accel/tcg: Move byte_swap from MemTxAttrs to
 CPUTLBEntryFull
Date: Thu, 29 Sep 2022 13:27:01 +0100
In-reply-to: <20220925105124.82033-9-richard.henderson@linaro.org>
Message-ID: <87wn9mz7qe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

> We had previously placed this bit in MemTxAttrs because we had
> no other way to communicate that information to tlb_set_page*.
> The bit is not relevant to memory transactions, only page table
> entries, and now we do have a way to pass in the bit.
>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

