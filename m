Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C65E7FF2
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 18:36:32 +0200 (CEST)
Received: from localhost ([::1]:53506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oblfD-00021e-8R
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 12:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oblQJ-00052S-4w
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 12:21:11 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oblQG-0006nW-LB
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 12:21:05 -0400
Received: by mail-wr1-x436.google.com with SMTP id r7so794184wrm.2
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 09:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=UMABbjBdVBp2LT/6Zb9xSuTrvCj1ADVZ6uM8suF8Md8=;
 b=xgjrETZ0ptZmDyM5aQgz2mPXTW8MNPsbLJVWg0qDV1H70VZ2+gYpSbmbE53+LtiInx
 3+WjyJ9b6rPUcG+Bcnzjl65bHkVRDgU7tYYRD/aPAob66bw2lyJdzPZrwL5t3BcVviWa
 ZzXTLUK3NNTlXJLgksaO1IH9PXQwE1fhckCMFEZGh9Cw44qYzCPlH/xMfW06QAIKkBje
 8utx1PPVnjVUzHg2D5EzKNVb+gB8LTK+MtFMa3OotNjCfnL2+mWgIEebTXgnzBSCHmXD
 n1n9lzbY03PUrbUB7UzETTxhP3GZOGnCUwKnyOP/1EXqkkOsRfsZ4oCMpl7ouqmH5jsk
 NukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=UMABbjBdVBp2LT/6Zb9xSuTrvCj1ADVZ6uM8suF8Md8=;
 b=kTiML4uW83YmiPcWEJoHcNiowa7Dqdc7kZYhdXpw7vqhUOa7RNAm5db9Zp8DWQpQeL
 g4kr+YPbNtWRvXxP9idck/0uv1AU7Ofo1MlCxF0QWGSGKtd9zJuTOl1eFfqDM699KueO
 mSZ9kB2ZwqQphg3lZleY9p7bYPMq2aLg980GPKABmpPhZQNmHkBVPfHIC7l1b5BILqK4
 Vp+lXXp8kTB3HcGoRS0d+sNf7vYLHU+bcdr0vyYz6LJtUnRJuZJqqsUsJR+H16o74W/v
 4bafuz0NRGb1zTLEUGd/EkxcIkUiHvG0+5vrKa7Mtkl2H1jfw0Z6n9puODJ3rF7P+9rr
 XK3g==
X-Gm-Message-State: ACrzQf1CJQZkHmCcvSFJp+JASaQuNTAb9DxOzrd5difIPWT8HjYcDVyz
 xtn8pb6mY3HxXLHJZ81xRuIsAQ==
X-Google-Smtp-Source: AMsMyM7pdPJMASU9FNofwVbUGHNU9w1nONaD+VPq3ZFqjy1ly40FP7ozvmTehmrflcRslkLL7t9RBg==
X-Received: by 2002:adf:d22d:0:b0:228:7882:a57a with SMTP id
 k13-20020adfd22d000000b002287882a57amr5662612wrh.429.1663950063054; 
 Fri, 23 Sep 2022 09:21:03 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c4ed300b003b4868eb71bsm3400371wmq.25.2022.09.23.09.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:21:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9AA261FFB7;
 Fri, 23 Sep 2022 17:21:01 +0100 (BST)
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-6-bmeng.cn@gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 05/39] tcg: Avoid using hardcoded /tmp
Date: Fri, 23 Sep 2022 17:20:57 +0100
In-reply-to: <20220920103159.1865256-6-bmeng.cn@gmail.com>
Message-ID: <87tu4yuknm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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


Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> Use g_get_tmp_dir() to get the directory to use for temporary files.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

