Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7195458ED7B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:40:08 +0200 (CEST)
Received: from localhost ([::1]:38060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlwN-0005PH-DL
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlTI-0001M4-2v
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:10:04 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:33609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlTE-0002cw-Ek
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:10:02 -0400
Received: by mail-ed1-x536.google.com with SMTP id b96so19094674edf.0
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=hZ1xA2W3o9gY6J4xqFqE7ZFb7NMD/RS/IMKLIwA/TJ7MQ71JQTzZShZRlnJG1v6KR/
 z8r6Pj8lQ3gAqzw2lyizI6MrOiRYZP6gj/1HgTrCYZ5KcRS9d5p6s3fUleH0qmM3Kc0S
 /+JP2nNYbmXlppEQOkPhjlqAg2crwe7YYBQEuyH8rdBynYizlj/8/qPb8/fM+tU39uEo
 wvONkGvf5Bh3V0lQuiWtrDvxatogbSCGhdAXlA/N4TuhGf6sqt2o6BpdfcYFS7b2J0vd
 EedzCU1dLP2fO/j3hJZ1oV1lLjlWxZ5fnRinGkpqm25MiPI8dINI+5/MwC5hzk92Q5q6
 NKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=C3ucCfR2TkLPKYCZzDAhhX6vV7+WX6cDVMtST6l+XLsGSaMQD1TVd/Buca+q0bXm0v
 PSnsfxSedBBwE1CoJCfjrSO2UWyTBgS2Ss5caYtiD2p0asmp+0NhtayifzQKTI6VahJF
 lURtP3mdhgJBn/jXBMft5PnQInYBKzMtZ6e4qr8hEZb69n8y4oIv0oU6pufwjexptHw/
 kham7YpclFszMnPT4RXfHDfQKa41dXFCXBHlarlH6+IqwhmgKg6RsqOS3VCQEi48SBJn
 fYxzFDfn6BdmFw9fixtKm+TvOV3XMzy7DS5LX4jNg7NFGnIG1qJMSidE/6JG8feUFZbK
 SjQw==
X-Gm-Message-State: ACgBeo3xv7BbhVHr9HtOIEDI0OJXHIjVV/Ik0RGV4RO7Gp79hQGDxICh
 mKzTFiYMEu5EMAoCxpd4FwSf9gds2EmnXQ==
X-Google-Smtp-Source: AA6agR4seuZdbRmxDRiEiZXi4ray6pZX9W9fUIteQ2HDxEi/VElcrykR0fqE1zApFaYNWwUiqh+jvg==
X-Received: by 2002:a05:6402:3206:b0:43d:4e0e:b693 with SMTP id
 g6-20020a056402320600b0043d4e0eb693mr25662856eda.316.1660136998617; 
 Wed, 10 Aug 2022 06:09:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c16-20020aa7df10000000b0043cf2e0ce1csm7650409edy.48.2022.08.10.06.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:09:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 417801FFB7;
 Wed, 10 Aug 2022 14:09:57 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-17-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 16/62] target/arm: Use GetPhysAddrResult in
 pmsav8_mpu_lookup
Date: Wed, 10 Aug 2022 14:09:52 +0100
In-reply-to: <20220703082419.770989-17-richard.henderson@linaro.org>
Message-ID: <875yj0mehm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
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

