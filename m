Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBEC58ED74
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:36:33 +0200 (CEST)
Received: from localhost ([::1]:57650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlsu-0007Yi-7A
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlP3-0001o4-R6
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:05:41 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlP2-0002F3-Aa
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:05:41 -0400
Received: by mail-ej1-x635.google.com with SMTP id w19so27611306ejc.7
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=WPQYchGB2rYlqYUwcEScn38UdSF55Df6fd/Dedx2FdSBrMV6d7qROkCJjwr421y7Ru
 WnzkY6LvIsk40Tg52cu+J0Qhpj6WaeckT/khY+87JYn/A9dyyo6GuZIQpX35PfR+/ITg
 Jo+YrATY7u/SmXq7/yQha874AJqsAbik19knNd00VidYMnEaSU8imGde3gZ9Rl0cf658
 ipsaIPw0IQk5Y/R9WQ0me9k7WOwYcLjzCc/ZTZbZu5cw+WQ4++5knKBSnV/AqDr/F68z
 lSYz6ElHi4tse5CXIDhHlnWJJcZtsNz5x4Ncd8D5FItDDX92InkeDWD4GqbZhJuEC8po
 kYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=AZWgckRGBsNROJwFGyZnSbktUcpjlANmdU4NG1U9Yua2nf9CWyFAc/2nBgz/o0IiPQ
 XN3L2uSxIwBiLdARvCRdQyyXKJof+AzgpeZErBxKiy82YkljYOJT8BUshrFBgbbZXS7+
 mMwyYko2Ut42e6ds2Mbw0dszmbHzNE3U6nTk6fdB1zWbaO7oqkJOH1ZGkzywM2bk1PmD
 MNVW7eRPyGkuUstHqS/kQKaJ8Abo1icC+NQU7kWfjxCVQYioG2177XeVc+4cpDSowYxS
 fUTZd7famzBFP6SEHOWDzCTo7h8nN/aIW5rYtpIJIU1ksAKaMXZSfFeA+D3qB+aa626B
 giGA==
X-Gm-Message-State: ACgBeo1Abr4nHg2yjgGNm6PuI2xP3pmM3261NhE0hN2bRzi/S6E5tQYT
 L3Z+f81qZ4vNbvmr8Buj26R0IMp10XTnCA==
X-Google-Smtp-Source: AA6agR5+5t4COwTJTgYuslyqrB2jAeDqsX3iYZmVJcxKGIfdU35yfr569neNT4zFRb2ZbJDkQRixBQ==
X-Received: by 2002:a17:907:2cc8:b0:731:53a3:4a33 with SMTP id
 hg8-20020a1709072cc800b0073153a34a33mr10691018ejc.319.1660136739011; 
 Wed, 10 Aug 2022 06:05:39 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 8-20020a170906318800b00730223dc5c0sm2269809ejy.206.2022.08.10.06.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:05:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E19151FFB7;
 Wed, 10 Aug 2022 14:05:37 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-14-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 13/62] target/arm: Use GetPhysAddrResult in
 get_phys_addr_pmsav5
Date: Wed, 10 Aug 2022 14:05:33 +0100
In-reply-to: <20220703082419.770989-14-richard.henderson@linaro.org>
Message-ID: <87iln0meou.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

