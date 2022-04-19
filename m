Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1781506989
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 13:16:29 +0200 (CEST)
Received: from localhost ([::1]:40978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nglqO-0006v1-Oz
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 07:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nglo8-0005RF-2r
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:14:10 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:46648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nglo6-0002kx-JD
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:14:07 -0400
Received: by mail-ej1-x630.google.com with SMTP id t11so32109003eju.13
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 04:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4J4IcVC0uCh5qVskPbZima7PwhLeGTVGqK4i7OngjWA=;
 b=Cc6MUBGfIl/eB0p/an6bXi2qQf95z7MPRpzKhBEzZ6aRBJgJQE+W9T0/mA0CpbiWw9
 WMMDHrZESw82JlpPJJQEWMXaf4oqxZZqZJLXxSIXOooKHf28vhbJRl/W+H+YS8spR/le
 V8jK+XTIjYsJ+LI83EAHVGBrjWcK4exslmv3JIMiye7M3m7pqc1RH3M1Yv8JCwSxTd11
 1RZFBSTwl9uEL4sW3mxQUg+hjbki35HK8DRV01Jeumazey2XJE/3XhXM13Qi3oxpB3G9
 RYnSJTPqXbq8cV/KafIx0wrJ/3cSiXeChuG/bRYEQGPH7sQ+HWDD5PvfTkpnwpoo8gsC
 z1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4J4IcVC0uCh5qVskPbZima7PwhLeGTVGqK4i7OngjWA=;
 b=SxM9rBs/kDCmAENcfpihQCqmtrBTnDAE3+604ZUry8OgDbOuYSeY/3Vii4j0414Wp+
 Wfmavm1R9AtIg3S7fg5SrgtGxJnHaQurK+/ypw/qzPb/LA84fJ9B1RkRc4JcW0kabVHD
 a/f1tiemc8jviuwgcJLieBSONchFiF+ZEmzqd4t1XIr/43OOAm8FX8hrguSi0+gAWFCJ
 cXRRv/YfKZtI60By/eW2sHJhqAOhvutY/E6HMdkDQL0f2m25l3NJzmFKTt25k0/6l7ZT
 4zZt+6Wr6+8doWxSQnEWA4/lPd5L6k9DvW05FcldnmHLzVsRFEkFl5TplxO1Li+MIDqn
 vj8w==
X-Gm-Message-State: AOAM5323dATOyZwDUBnvyGvzzTL1JIwHrweDBLrq8JfvamEarsCUJV04
 Xuye/L/LiRKF/95dE7+Mu1HW6A==
X-Google-Smtp-Source: ABdhPJxPf37wC28pkk5oLQVFiL3fS1vf5vazmWd4tjwMoHqgcbGsbCMUelG0Ms+HxOP4oQGSLOHQyw==
X-Received: by 2002:a17:907:a421:b0:6ea:beb6:fd99 with SMTP id
 sg33-20020a170907a42100b006eabeb6fd99mr13086399ejc.261.1650366845241; 
 Tue, 19 Apr 2022 04:14:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a1709067e0d00b006e880b53294sm5505610ejr.58.2022.04.19.04.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:14:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6204B1FFB7;
 Tue, 19 Apr 2022 12:14:03 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-4-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 03/60] target/arm: Update SCR_EL3 bits to ARMv8.8
Date: Tue, 19 Apr 2022 12:13:58 +0100
In-reply-to: <20220417174426.711829-4-richard.henderson@linaro.org>
Message-ID: <8735i9xr44.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Update SCR_EL3 fields per ARM DDI0487 H.a.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

