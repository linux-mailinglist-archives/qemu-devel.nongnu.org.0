Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0B358ED92
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:47:51 +0200 (CEST)
Received: from localhost ([::1]:55474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLm3q-0001Ys-J8
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlaV-00043c-25
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:17:33 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlaT-0003yB-Ij
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:17:30 -0400
Received: by mail-wr1-x435.google.com with SMTP id j7so17756698wrh.3
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=31xRYOTyJtGEDRc3VusafduM3SWZ8yI1RGJ1IVichaU=;
 b=lxqxrKAbCfu/f9UHSp74ToUmmKNJlEmpkm1nel+b31QAewSvwj3t71tw3hTX3QncbW
 cFVG4+XysUNcci1+VVgbubs8qhy+ML6Rih+xrUK6DZmO7T4i795X0uNYDmXkbkyp1Q+9
 BjC0HMrQXXPKKd+QwFkf5NxHHnbHO/xeF5yUF5LQupmKmcptVP80d88Mk0VLYnelawB1
 Cfv8IVguADG4dITDZESounoQSWu59Hb/zQaKeXfJeA1sB2C57jVdy2iIQAULyhHQZntU
 Dhd9m+mSGz2ftLeE3R410uk4siZpvQwaribK6cHby710TzDRMORl43ksMhJ2JRmxpkO2
 bL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=31xRYOTyJtGEDRc3VusafduM3SWZ8yI1RGJ1IVichaU=;
 b=Xji1OMMZd8n5uevt0f9xLZLRfcFUfxP+0S94D/125ljORAJwyKqRC3i3V4bq6tIyTM
 b+JzrmItzgKr9thAqPdSuCVqcUFNLv1F8rZtZ0S9cDM1pQ3OABtH3y0g6o1DNI7z9akS
 DdFXIh5fz8/5qHdwl9NG76ZB1RRkwd0CmAGuh/ZJcqRyC/faD9/23v+2BGURu3fZuEqm
 alR8hGhuHVzY2QO8EssXfqCgDYQr7V82MqtppIAmOkIfjJ1oR0JePuIaBDTTprhlKc0f
 kDsCzfH5az7Tx+3EYIC+lZQyuuvIOzSUhIjxHfe2YA18LqcD944P2WH5gKd8Xs6ZsNa+
 qP2A==
X-Gm-Message-State: ACgBeo2uk4nw5UV/LTE6eZoF4O+eviyCmb6an4UZPrO2cvIlm+v/sy4I
 rybjBdc/wAxBLbVzdhDNMYNnkk6R4AnOzw==
X-Google-Smtp-Source: AA6agR5SFZR9uxsoHCju9Xp9AZ7kEq8Tuv3tD/gJODm0UQylW8HaqCkniXBi+55fT/Af69Zid5ipbQ==
X-Received: by 2002:adf:eac5:0:b0:222:411:a94e with SMTP id
 o5-20020adfeac5000000b002220411a94emr11964881wrn.607.1660137448229; 
 Wed, 10 Aug 2022 06:17:28 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e12-20020adfa44c000000b0021e5cc26dd0sm16054100wra.62.2022.08.10.06.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:17:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4B6ED1FFB7;
 Wed, 10 Aug 2022 14:17:27 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-24-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 23/62] target/arm: Add is_secure parameter to
 pmsav7_use_background_region
Date: Wed, 10 Aug 2022 14:17:22 +0100
In-reply-to: <20220703082419.770989-24-richard.henderson@linaro.org>
Message-ID: <87bksskzko.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

> Remove the use of regime_is_secure from pmsav7_use_background_region.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

