Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04D153FF7B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 14:55:18 +0200 (CEST)
Received: from localhost ([::1]:60162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyYjt-0005np-HD
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 08:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyXQ2-0002TY-Hk
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 07:30:45 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyXQ0-0004xS-SD
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 07:30:42 -0400
Received: by mail-wr1-x434.google.com with SMTP id u8so19396969wrm.13
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 04:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=bb8S+aLNdYYw+01fXkl17jEAbzIL9xJdxMEtlPTG8HQ=;
 b=fmqp9riY8SFEpO6JC2gD8k87nw0sBwOYddNeFJfTwH2He61TsAq/WRRfvGj9UJ6Y8f
 1ikdNPPiOO5OHKXi8bWi8VF8MlYPa4qlTo5FL4c8TA6CHny5FRq0qQmstRHlUMlzfD6c
 2B/tCB9lGmcmXh1MmBAdzf/G06+OrQ55i2O75voW0J4J3NoNk6+heplsIFxJN0rhv+xJ
 TpSDSDs3Y4M2Eg82Clv4X7jO2kSybjKLZdXwBz5emu50KphN9FN6j3HH4fuSxfJGmglo
 h+ar14gNh5O7OMQdeK4XQP/Lvbad8lq/6emkKhXw9QBcXNtygMVlfVr3ZLDEFrMnXhLx
 uMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=bb8S+aLNdYYw+01fXkl17jEAbzIL9xJdxMEtlPTG8HQ=;
 b=nwnZlUj4xQ6+jbkdl+xgLVyERD8wUNaxQyu5vBsLLzTzYTaT6T04TCPXF/xE4k0Z2c
 nf5t4YSdKn1D28hIaoJCwiqVv0n9SCOmkOHbG8Snys91h87F4cmwjmfAadofLbdfu7WS
 auq6IMRqF2Cl7UDXDwBydTkcLZQBl1xNOb9qjRgc5+NjJ/dYurGtGiKeYlhaTw8qcJoy
 BSKyE5Th4GVdhIEqvlGsCNl2Qnq6fkFKTngbO9uPSWz3gGoA/zn9QWmopSq6dfBm0TXd
 113hXriuIfWPND6YMXhujohKTRva6MFqTUt9selnDGTCgt7h81JV6FEstX77+hXs/n22
 FBZg==
X-Gm-Message-State: AOAM5307/yTGqaR/fvy5b9INkqfWdBVOdegVjuz3HEz8IDoxB1sPbSaj
 sGlfZGbFF6hlXls8TL9sffluMA==
X-Google-Smtp-Source: ABdhPJzZN6I/8/MuSdYiWyLD49RU93QtJu9AmKZFxM+I7klCe1cMej6sxU7BVhX/3BluXgSUu905eA==
X-Received: by 2002:adf:dd52:0:b0:213:bb11:2fde with SMTP id
 u18-20020adfdd52000000b00213bb112fdemr23443398wrm.467.1654601436663; 
 Tue, 07 Jun 2022 04:30:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a7bc844000000b00397243d3dbcsm19786507wml.31.2022.06.07.04.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 04:30:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 52F691FFB7;
 Tue,  7 Jun 2022 12:30:34 +0100 (BST)
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-12-richard.henderson@linaro.org>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH v3 11/49] semihosting: Clean up common_semi_open_cb
Date: Tue, 07 Jun 2022 12:30:29 +0100
In-reply-to: <20220521000400.454525-12-richard.henderson@linaro.org>
Message-ID: <87czfkvhgl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

> Use common_semi_cb to return results instead of calling
> set_swi_errno and common_semi_set_ret directly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

