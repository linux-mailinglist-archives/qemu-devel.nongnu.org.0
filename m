Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85356FDABB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:28:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwg6h-0001m0-Cz; Wed, 10 May 2023 05:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwg6f-0001ky-DX
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:27:33 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwg6d-0003lG-OD
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:27:32 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f42d937d61so12459365e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 02:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683710850; x=1686302850;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KfVBeOiLxMpg0GmqSrHHfMW8UgbJWOQeTSLauyEkpdQ=;
 b=l8VSUKnOg4gScxX37m/5vFBYLSmEj6dtuFr56BLHds5DG9zgdUTJbqb7TA+pYvnNZo
 U5slQTa/p/16x3yE3Zklqb0oaz5Gae1O0XOml0x82E094uHGlkz0CAYZLNM+muPh3YUF
 gk9/WGyiFWkdNIqInoQmRdG9zuLQaq9l6tIcAYxJ+iuRXYJtm+lzsKLNaOGneK9v7aS2
 7kC4g5PWlsdjBlOphWwMtIxR1avZnq3QPOiy2Q+wZN8f1EbrH90Y9oDe1cH2MTUOOwdE
 UlWXV97riZo1Dd9Bmsuxy9w3lXFj6qOTHaBHtEtroeWBZzi5J07yn4IkcFJnA08Jl5cX
 /6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683710850; x=1686302850;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KfVBeOiLxMpg0GmqSrHHfMW8UgbJWOQeTSLauyEkpdQ=;
 b=N/Ty9zqdlCbURrvWlk5r1hJeVAI/l+/TRFqENWGKGaUP8BkylzIjNgP7QrG406X/+L
 iVAH5LpXXRbD/Lm99GYI9ghX+qTMTN8noTxpy8r7c4m7BsUPHj1mVXq63nl/tK+ElQ1K
 QdEyjJ5M1u1ONXeiKb7bGwnhquzD+FtzehL7yMlZ9keZRVYC90kJvcOd3uU6NGG4vfZX
 pOBDPrW1uu6Fv/N9HvD7kBm+5Svr2dEvASEmZpPmnDRbDgWR+W7s9k/JATE7PeEcI4/V
 gxYG7RHvxrN2RBM2fgFZ3ImaJjpfxO37hMWlx7kukusRCRI3YNLD7Y/DWrA1R0YPILbR
 KEtw==
X-Gm-Message-State: AC+VfDxhbWPAB/7331YihuDf3sVTJ7mAi26xkFsn1vvoZ3rqdQsHU9Tx
 k/AguNQlLk4Is5Ss0iXz2j756g==
X-Google-Smtp-Source: ACHHUZ7ZMxstqpdTUJ1zE1TDUQYOC7TISHErlOQ0KrDQJUgW89CzIfqoaS8aQvLbwehaD6ufeoLiuw==
X-Received: by 2002:a1c:4b19:0:b0:3f1:78d0:fc4e with SMTP id
 y25-20020a1c4b19000000b003f178d0fc4emr11678984wma.32.1683710850282; 
 Wed, 10 May 2023 02:27:30 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a1c4b07000000b003f4bef65a65sm832407wma.28.2023.05.10.02.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 02:27:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D26A1FFBB;
 Wed, 10 May 2023 10:27:29 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-10-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 09/30] tcg/s390x: Introduce prepare_host_addr
Date: Wed, 10 May 2023 10:27:21 +0100
In-reply-to: <20230506072235.597467-10-richard.henderson@linaro.org>
Message-ID: <87sfc48rjy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

> Merge tcg_out_tlb_load, add_qemu_ldst_label, tcg_out_test_alignment,
> tcg_prepare_user_ldst, and some code that lived in both tcg_out_qemu_ld
> and tcg_out_qemu_st into one function that returns HostAddress and
> TCGLabelQemuLdst structures.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

