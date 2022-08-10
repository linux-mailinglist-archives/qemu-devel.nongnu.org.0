Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3008058ED96
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:49:50 +0200 (CEST)
Received: from localhost ([::1]:57840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLm5l-0003F3-3c
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlYm-0002Eq-E7
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:15:44 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlYk-0003jO-SU
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:15:44 -0400
Received: by mail-ed1-x532.google.com with SMTP id o22so18999594edc.10
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=A/+NphId358p7jn4yfPgb3q4UH8rakYtHeOmbY2/y2s=;
 b=On1yzvqiE2TDBelWxS+BtdIdVYOQHC/HEWmZvK6NNlb1ChMdmcpehgDIEJbmNFJK7q
 l++bF13rLl8Qg8PBw0DEJSLMZMZ0RRsZ7MsAhaeQ+EJAgG2fn/WSDqdkj+5YCnJolAIZ
 zpHrn00M4XR2NuM5M8EboU+tbXF/Yi136npbMXUgv5cOsn3aA7ZhPJaLFEp4TxiJnl5K
 xawUpPRAuN+hMfKDi+EUXglPHRgNZIUhW6a4Zrx+qFz1YUedPpIr2PYLUqr9Yra4SZyl
 Y/bL+HVANtEPPUfFRqRzC+FxsmdliFZ5q2Fz85pGPBVjOUOnoZLSihdV51spHuwrZBSh
 ZBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=A/+NphId358p7jn4yfPgb3q4UH8rakYtHeOmbY2/y2s=;
 b=xlM3ZvVjRAAFEE/INFXgPTasY8MmDHqpB9UJvL6i7gISrt57TxNXpKbVj1C42YWl0e
 InDBuNtBoG7Yxcu3TT9PBo6+ViL9rQ4gyz5uLm2JiH4zP65Rr40RR8jC480H+4vRxYaW
 W8iMXoTl9aSl0wDa5uHRNtZywsC41tKjMPyPDekE8ebIj4EWLhzdbmm9U75FZGEznBGS
 XSPnf2OFYGtYX+jgFDaZrV5YsBMlfIpFexI4SHNNftlcsGORdjb/mKVp2ip6yf7SvpUO
 eANvW9yv8fMjOgtWCsMSGkdwIHlyO+YVO5mwT7vq83BtU2Oi7fEwdtB5XcyFIkfgGBRD
 GFDg==
X-Gm-Message-State: ACgBeo1y+W5I1/yDM9pJGmb9BNjaHnmYPYkEg4NSDAoToIv3xwup3EIE
 qIzZG+dtkSbe7LD+NQtEwHFlFA==
X-Google-Smtp-Source: AA6agR7clJYkeaPbtaE4xBJFbsrF38iPhZzKxOILVYf8PGDXvD8J2I8RRzj4ZACi+FmLqBgLmlNtKA==
X-Received: by 2002:a05:6402:278c:b0:43d:cd35:db25 with SMTP id
 b12-20020a056402278c00b0043dcd35db25mr26140109ede.44.1660137341346; 
 Wed, 10 Aug 2022 06:15:41 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a1709066bd000b007308bdef04bsm2298618ejs.103.2022.08.10.06.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:15:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0ED271FFB7;
 Wed, 10 Aug 2022 14:15:40 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-20-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 19/62] target/arm: Add is_secure parameter to
 pmsav8_mpu_lookup
Date: Wed, 10 Aug 2022 14:15:34 +0100
In-reply-to: <20220703082419.770989-20-richard.henderson@linaro.org>
Message-ID: <87sfm4kznn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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

> Remove the use of regime_is_secure from pmsav8_mpu_lookup.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

