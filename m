Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969BD500FFC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 16:27:07 +0200 (CEST)
Received: from localhost ([::1]:38720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf0R8-0000hh-Oj
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 10:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0Kp-0000Hu-SD
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:20:35 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0Kn-0002KR-M2
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:20:35 -0400
Received: by mail-ej1-x62e.google.com with SMTP id k23so10367952ejd.3
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=96ACQo5rqccw+MuaM9jso1frVzBTDsCzuFADI3QmSM4=;
 b=k30gbbOuuDIj6iB483Y9yCdw4YM/9kdaALz/z4xndNDmL67aoTvt3SN2QUTU6aPusH
 0OCGaAo5DJ8oKs1IhO9pfu8T8KwtvPMdNmHCXc53mo8Bkm1lK4MCZOA/uAKp3XFHfsOa
 4y8I7XU9O7hDj6cFT+bjhAoF1q+dSaU56DgNMI9sd1N04UbvcBuYbrbq9O/kTQhBpNEf
 iK7yCuv2HPkY3M6sfbI1uO7ccII21AaxV61WyHzyT0bBZypFV/m5xw3Swi7KD98V/+JP
 +nqXLH/pQNUNV9C8pfGPWzPB/IzpP3fNz+HP99cp0awskn1y7kzZRS03UDwmLHUi5vq5
 ZStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=96ACQo5rqccw+MuaM9jso1frVzBTDsCzuFADI3QmSM4=;
 b=C0pT9p0ARXM/rFHcbYdAruxhDcp7gYqTshi0k6+Vetcmq7LDlAYvSo4X71Hv9gxbvq
 ErgjV14ZQYL0huDbeVHLQslT5If4O9wkexoF8AhMHBvR6yL3439zEY4CfR14yEBmEKZR
 ltLia/+R8joP7ombTAl9DLhmZn4Z7w/vyB4s/RwLrCsA8XKwC9puHEQcti6ZI33nF5ue
 J0DgIY6OTTroJLaBHj8S+O2TpEUem2U/t9Nk8NfjTy6jQeowaS6XS3KM6wV4pcTCMvQL
 tEn5gY++6l3v6JD4FP994z0OHJ+ecTQ9u/LWm1iJzHZryh6fzu2G5dC3LpPyHhn+ypRc
 28QA==
X-Gm-Message-State: AOAM530GlTs23AAFizEhmeIqV5prOvMNx262l6qgb29q0u1nQTJ3LpYK
 X6p70/r6RdfXFWbvjy5MPzrRHH/efV0TPw==
X-Google-Smtp-Source: ABdhPJzb0iNBqyG1VgD/1HEhXpM8YU92YxoJx2PhvU6+oSWslbGNe4SflscCa2C2tI9dw8RSVuQEwA==
X-Received: by 2002:a17:906:3ad3:b0:6cd:382b:86e5 with SMTP id
 z19-20020a1709063ad300b006cd382b86e5mr2382655ejd.145.1649946032091; 
 Thu, 14 Apr 2022 07:20:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a170906174100b006e85e9903f2sm682425eje.89.2022.04.14.07.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 07:20:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 693261FFB7;
 Thu, 14 Apr 2022 15:20:30 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-28-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 19/39] util/log: Remove qemu_log_flush
Date: Thu, 14 Apr 2022 15:20:25 +0100
In-reply-to: <20220326132534.543738-28-richard.henderson@linaro.org>
Message-ID: <87bkx3wxu9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> All uses flush output immediately before or after qemu_log_unlock.
> Instead of a separate call, move the flush into qemu_log_unlock.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

