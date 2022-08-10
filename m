Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A9858EDA2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:53:26 +0200 (CEST)
Received: from localhost ([::1]:38508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLm9F-0001XD-Ih
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlbL-00057n-CJ
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:18:23 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlbJ-00048L-Np
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:18:22 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z12so17717376wrs.9
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=zO8pfZJn35AjHt2l49MHGo5TA20D9pbuXxof1kmoTc0=;
 b=xL6dyKxxX2Vl+P51F4blwbqmwcc/XQWI5mrbLf4oren43/XzhlITSdJNj/DTGMd3B4
 ZV4NASEEWncfA+XQwdNjmE9gM6bLvry8MybdQleLV7094pz0u8Sx66DtFPbDTNXKfwan
 73AWcNe2FuVApzr5BaL7CnAR0j7mRIDow4WpsORir8DLJj2SzkVLgGyWEc2S1HfxAICj
 7Cf13GvlJkrX0uNUL2A0WIWSI7lcGvC30jIbhUFJNoozp+FYuLpE82SY7+m02oDpKiGN
 87kFXpT1wgZRmy6wf/+q+q4EYzNFm7GI9UF/HNdjfP206IjnORxaHnefAiojMbVXgg5I
 8ElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=zO8pfZJn35AjHt2l49MHGo5TA20D9pbuXxof1kmoTc0=;
 b=arRTu7gomAKOG01OXXT7mvzgxOGnf63/7FAO8Tsr1h2xUlHmgk1WjtmVgTWrgaZBRr
 V0hwu5itxsmAqz4M8VcRovz0M7Usdili8P4Qj4x+qZATyqjx1aB2P4TO2IolXqPO04Oo
 fGmcXRdmpF1doGVGEvTZzGBkrqIqKjNDMba2KrfFDpiPJjOt89qYyOu89M/FK1JQT9DY
 zo3ed81saQrZSoPQT0b9OCZJUjJP+LgH9J4ISZeZmAtuEIwUM6Tee9Z2vYZ9KLyy7VsL
 36yVp9oRi/tCC+TySjALa5FItVwC4mjFZ2/7flVolCkVGQdnDf4R51grvzgDHWS7SRgA
 u4jw==
X-Gm-Message-State: ACgBeo0nzJGCiBIy5eFk6y3HIrMKkoHxhiRd0rN9WYukRfFxCxjOovAw
 L56j7PU33Gn2tgZ4ThB+5jrArA==
X-Google-Smtp-Source: AA6agR7MQRcc65KkBPWbCh8QSohaigCXnaQh1mN78R5MJdSL1rHS8fvY664ltx1kVKnJA94Tvjw0oA==
X-Received: by 2002:adf:e111:0:b0:21d:665e:2fa5 with SMTP id
 t17-20020adfe111000000b0021d665e2fa5mr17970233wrz.652.1660137500335; 
 Wed, 10 Aug 2022 06:18:20 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a5d56c8000000b00222d4dfcdffsm6527922wrw.87.2022.08.10.06.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:18:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4C4BA1FFB7;
 Wed, 10 Aug 2022 14:18:19 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-26-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 25/62] target/arm: Add is_secure parameter to
 get_phys_addr_pmsav7
Date: Wed, 10 Aug 2022 14:18:10 +0100
In-reply-to: <20220703082419.770989-26-richard.henderson@linaro.org>
Message-ID: <8735e4kzj8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

> Remove the use of regime_is_secure from get_phys_addr_pmsav7
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

