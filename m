Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480654E579C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:35:55 +0100 (CET)
Received: from localhost ([::1]:36188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4tm-0006yy-Cq
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:35:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX4n1-0006Zk-5b
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:28:55 -0400
Received: from [2a00:1450:4864:20::533] (port=43589
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX4mz-0001C5-QY
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:28:54 -0400
Received: by mail-ed1-x533.google.com with SMTP id b24so2682102edu.10
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=X+Ys6jCtLeMuZeUbPKj0cG9NDE10BKoMSHpatJK/giA=;
 b=fiefp/Z02NUnjF1k4xRKr5PVhL/PUp27CigaGhEUW+mykavXj57eKDlhBORCUelcOu
 AnrfNF9GgGlFrgUOEu+uYFwkiSJSQRif6mSCbR3JqQgeZ/4hssBCsazntbn+HBNyt4Pj
 0Eih/DnB5gKl/IJ90Wm8czN0D3WgBlO31YJzsDO4nMWLQLnL2M4cAjIFPusKvrULzKUD
 NCxVHFKUTW0+MRJ8+2kHEGa/muu8xsFPHwL2UUfxk+pFmhKI0y2PGxdF/5lLbk3wsfSa
 dWZtPDH4hXMmCSviayhuXXxjylFHKppoDz5s+mzZzaE1+72dAHcOxHJ/VZ6wUn45rm/Q
 64ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=X+Ys6jCtLeMuZeUbPKj0cG9NDE10BKoMSHpatJK/giA=;
 b=cgomZZs5pqL7kpTYz/110hDs8ozK4qFB+5OU/goeL0MaVSnbhxuE7x9ax00Gq4d8mm
 ZrnmfPoDrgvw8sDpiFJPwjhRc/+x8UV2I7HeAHyGxiSsBaE/+XWJhOX+jadMGrnEV3fe
 0py/VxFXaEwOMY9/twDASaMxSDo1ueVpLfkXJq028V0eLB9Nwngc+7HNq5esJMgaMB8i
 ztW5Agy4CDkarVFR+C7cA8WSkKtMzpJbfLodi8zS5Qg0BKKOkBy4aDxKUhpkDb629hkN
 J/ctlz2fZY3t9IuJ4Hk51alhUJq7P5b3OAcAtJns5zXj8h/596rhdrF0Pu8jG3I+zwa7
 0mqw==
X-Gm-Message-State: AOAM532g62Z5wNwlwT2cXKkBiR1jDmAf1ddRf5APdq0yDLrIjjH60y+0
 Xd0dzPmWyJXNWWV4l6Tr8Mjwhw==
X-Google-Smtp-Source: ABdhPJwmXVXCikGzumGtER/aPuYeM2qQpMJv2ua4jQCq4pL//UWdKulVLHmtjBm69mSOhwcbeQE5EA==
X-Received: by 2002:a05:6402:2811:b0:419:12:abd0 with SMTP id
 h17-20020a056402281100b004190012abd0mr1492880ede.143.1648056532252; 
 Wed, 23 Mar 2022 10:28:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 ga42-20020a1709070c2a00b006df76956b53sm169692ejc.212.2022.03.23.10.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:28:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3D88C1FFB7;
 Wed, 23 Mar 2022 17:28:50 +0000 (GMT)
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-16-richard.henderson@linaro.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL for-7.1 15/36] util/log: Use qemu_log_lock/unlock in
 qemu_log
Date: Wed, 23 Mar 2022 17:28:46 +0000
In-reply-to: <20220320171135.2704502-16-richard.henderson@linaro.org>
Message-ID: <875yo44lyl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Avoid using QemuLogFile and RCU directly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

