Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5586460B1BB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:34:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omypt-0006Iw-6m; Mon, 24 Oct 2022 10:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1omypq-0006II-Sm
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:53:50 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1omypm-0002ef-0A
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:53:50 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 az22-20020a05600c601600b003c6b72797fdso6789040wmb.5
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2AYaVD9+o8hYkUjYRgg3pVzUQXGqppKWJDuMMbxeoGU=;
 b=eHPa8xELkArjitzs/3sytiBneNTnGd3syA/lr9m7pumH4/PP1DCPPQmzOWmWyt8Hnz
 W1AZhIQsIsY5n4hdXcOikEmcw9GxoybGFlC8XHyro6fx0J6ncJ39m0nWdVRAW4l/GjwX
 +Oe8h0GQ69h2b7Gw0IEJ/2LviD89/vdPTQSamspbnYmoivxx4cmGJUZdNBWoMdsnVuRd
 kTBUT/LOakipzJz72ZTj54zLmYN9VF8sOsDw4t99Vo7rU10Pe3R67kzad43CRGipeqns
 PnB6vw5DXiBv+qXlwX4tyhtOKZ1KlVo49zdcGEoV3Io8DrMhxIubwZSi3BfRlzeYLIjM
 +CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2AYaVD9+o8hYkUjYRgg3pVzUQXGqppKWJDuMMbxeoGU=;
 b=OmAHT7aBL51Y5dGg0Nl4q80xIG8G/QZHGtZ4vwYIxpp+GxetrszNeO22bQhGJD9NxZ
 s+j/s3UlWqkDkPrjCch4coh6BFUBn2ToMSf7nn+umHmlecNfJcLgUi+9Uwd+V4I2x9cp
 T0n2Mu4vVMmHUlD8hZZTZ1uNzCjX/1MX+Rz19N3MSo3sN8UdmK25t4kNJpqOyIORmrbD
 t/rtCCrRn58hoer8ho7fE8fBHg2uO05a9Hk/kTHpwxFYiknr35l5Xem87naEoPz3D/Ym
 3Sd36HKxIZlhG2nmkvWFbaIHChft4vxISksRKYQi3rN9XkzO5Vc0jOQ0YNae1fHQc5bi
 IYqA==
X-Gm-Message-State: ACrzQf344AWRzu02YvnYXHqmav7Q/ah91utaxxzrALt2ZUWKxKxODcar
 Y3znJJ/p2fQhUhVvWKHhyGJFUw==
X-Google-Smtp-Source: AMsMyM4BStOLcd/RUSoSKcto7JGX8eZBdzc5HMc9DZ/UCLQEbhQiU4P2YVrIp/Y/hQOOx4YaqCj2zQ==
X-Received: by 2002:a05:600c:46ce:b0:3c6:f274:33b2 with SMTP id
 q14-20020a05600c46ce00b003c6f27433b2mr22634613wmo.27.1666623224413; 
 Mon, 24 Oct 2022 07:53:44 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a1ca404000000b003c41144b3cfsm8367942wme.20.2022.10.24.07.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 07:53:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7DFC31FFB7;
 Mon, 24 Oct 2022 15:53:43 +0100 (BST)
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
 <20221024051851.3074715-7-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v6 06/14] target/arm: Add ARMFault_UnsuppAtomicUpdate
Date: Mon, 24 Oct 2022 15:53:15 +0100
In-reply-to: <20221024051851.3074715-7-richard.henderson@linaro.org>
Message-ID: <87fsfd9sso.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> This fault type is to be used with FEAT_HAFDBS when
> the guest enables hw updates, but places the tables
> in memory where atomic updates are unsupported.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

