Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C34D6FF5D7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:24:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px88c-0002V3-Mj; Thu, 11 May 2023 11:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px88a-0002Up-8y
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:23:24 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px88Y-0005cS-QD
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:23:24 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f475366514so16916205e9.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683818601; x=1686410601;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0467cQoaMYu2uSz/1YkTjrofbpdu/LBxA10H7yXltGk=;
 b=nDbvwujDMEpkjBH9nZr8ugMbRj6813ebQ/phmivqGSRdrD2a7lExMnQPe3v+k79eDd
 IMpBL+y21XBieH3SoW0q8lWdFF88V3VHiEUgGNusk680nR9OgCdMpvgNwM0Ztxb5zH4J
 NhWaoCxh0OlFHO+3cPDmi3TCqfuLbKnKHZh1K1XQ6X2TgcbF1+V9WpUgU1lvKH2bLefD
 GQiaJmuk2WfOgadQqQdkr4mWdtaXMctKoLyBFGXSpJpBoqc/0xNrZFtkFFkAI/NZyzZ9
 iHF0TE7/jRICUX24p2oPlec+oI+ZZy3npCHPzZG8GBygLfPmbypQUHzFviEwll7t7TdK
 6z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683818601; x=1686410601;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0467cQoaMYu2uSz/1YkTjrofbpdu/LBxA10H7yXltGk=;
 b=PAORyxvVi1XEh5z9d9zmqHkRv8MGEYwybCjdO6VbTf1Fx47gN9W81QCtiM3cbTeOVr
 zT9+j6oUEk0fwKzy4nNCn9Lc28q+Saq148E/Ww1epGVHPOtXLDNDx1IbQ4srKncI/ipV
 D8b7mdDctEGhpWURmyVGZNfm/WF6jGb7Et1xj3JwNe8nVJACqpgEsAHrae6NXQM1zWcz
 rI+YkanVtTpulkmFCtPGLmMV0X1qDY2dwtD1pU1Veobo51PXBQdSN2TLUsY/qbkZ9dX6
 2QUkvXARn9fMhlxUsMbEsAI0LnLwCc5LARlrvxzHLAGwB8Zqp6jeae3cCOW687NRKVEx
 viSA==
X-Gm-Message-State: AC+VfDxcaiu05dKZxi+AF36dfH5sTfojrpeZmJQ28UGxjGu8AEN2SmkZ
 8KubIjAlDyFcEFJJeoXMwulWdA==
X-Google-Smtp-Source: ACHHUZ6Pet1eBGSeRtqQp2yT4hn+hiELLaoJ50fq3y3SBwNNh25HS80z65pmW4NcPeJehi0JNnPp0A==
X-Received: by 2002:a05:600c:383:b0:3f1:93c2:4df6 with SMTP id
 w3-20020a05600c038300b003f193c24df6mr14807197wmd.12.1683818601053; 
 Thu, 11 May 2023 08:23:21 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a05600c1c0f00b003f1738d0d13sm12143902wms.1.2023.05.11.08.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 08:23:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0DFD51FFBB;
 Thu, 11 May 2023 16:23:20 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-3-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 02/84] tcg: Widen gen_insn_data to uint64_t
Date: Thu, 11 May 2023 16:22:51 +0100
In-reply-to: <20230503072331.1747057-3-richard.henderson@linaro.org>
Message-ID: <87pm763na0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

> We already pass uint64_t to restore_state_to_opc; this changes all
> of the other uses from insn_start through the encoding to decoding.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

