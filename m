Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE325EF800
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:48:43 +0200 (CEST)
Received: from localhost ([::1]:52728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oduqA-0008Ns-UR
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsDs-0008HA-WB
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:01:12 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsDq-000560-MX
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:59 -0400
Received: by mail-wr1-x42a.google.com with SMTP id cc5so1826798wrb.6
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 05:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=cu119da0HjcUuKL/VIvH/HwWjoQGHux1zzUmwlLHBhQ=;
 b=tqC7ZGxfgwJmJD+QaI1iB+Dmi7PyHxQokTNjmJZcPZ55Pj7ptbpDgDWdEst75NLhCh
 9d3GKwUNT4ldIO1/etsCziVpKVwEI4DZ03glL10oZQr5WEuCq1YqVKfSBnFbMPgljedg
 STnosPKZF3AR/TyRWKZ3sd5mpHrAyP2hiz2sFXe39IvDaAbXGYRLoQ762XhTyuDCeIAi
 9LU0GF0S+zcpDo3a4bJTu03kk+mQnEev6VZbcARpBkMZBxPV7YcjvYdje/ogKEar0OH7
 zcjmO0VSTMcmrudrWt0lU7CkZ8MWZSOqLO4MCiB0En+EaX3Tv1Xnp0fDxyjWitIjRFuG
 Kpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=cu119da0HjcUuKL/VIvH/HwWjoQGHux1zzUmwlLHBhQ=;
 b=E3A66GwxQHcXJyqzAm+pY0LFrcNsgZhMONLvlIxstKMfFK7B7lcOmg3SxqXgY63zr+
 idmqvY9T7plWZAfyKK2tjf1FJDO6l/r/He8+vLnSKJq4Rx+RR4MrIL6rHxAVLrmo85O0
 sOgs3CnwoJoVlKTCOoo1hk/N7z5qCPg5GueDaPP+tMA9DCwFCeCfmPzeqh2u7OeTLKvo
 5qUHsCKPYwH7wMBdfEAm2jLg7+E2mdK0UsKRcHv+OfVptHddo4r7ZB3c0z4Z/eByPI1m
 qs9O5gH1luhDk2u/R0a83YWR9SmAFv1qE2R7hSOrvr9T3Mx7aNrw8x/ZFm9LFgzzPaRB
 n6aw==
X-Gm-Message-State: ACrzQf2VNTVE2rZl2nTgQx5lDHt6Y5pISZHaQIfqMQm+ePnxiHwqVn0Z
 aGyYKValbFTVEE/z3l5fZCI9JA==
X-Google-Smtp-Source: AMsMyM6BFxxgbmPM+J+bBe2NoDLrO9ZBXikOB+uYn7pbwaeuri79t7KUeSjOzhkSFMgI/d6hlguRAA==
X-Received: by 2002:a5d:588e:0:b0:22a:feea:6c09 with SMTP id
 n14-20020a5d588e000000b0022afeea6c09mr2037830wrf.112.1664452855448; 
 Thu, 29 Sep 2022 05:00:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a5d4ac3000000b0022ac672654dsm6801058wrs.58.2022.09.29.05.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 05:00:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE32D1FFB7;
 Thu, 29 Sep 2022 13:00:53 +0100 (BST)
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-7-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-D?=
 =?utf-8?Q?aud=C3=A9?= <f4bug@amsat.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 06/17] include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
Date: Thu, 29 Sep 2022 13:00:48 +0100
In-reply-to: <20220925105124.82033-7-richard.henderson@linaro.org>
Message-ID: <871qru1jbe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

> Allow the target to cache items from the guest page tables.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

