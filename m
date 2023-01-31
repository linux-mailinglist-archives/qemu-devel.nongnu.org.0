Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED16682964
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 10:47:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnE5-0001XX-Pn; Tue, 31 Jan 2023 04:46:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMnDh-0001TQ-NQ
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:46:31 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMnDg-0002hw-0A
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:46:29 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso568971wmb.0
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 01:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xdsBAgq8mmfQNGcCfpPGhEtJaUfUX0pCIz3BCQgFFh0=;
 b=Q/YjMQGum03wv9AVuV7J5fWRVMJs+pBY9tOntr328KjykwK1kPk56Xe4qXGtXr2T3P
 C8P3dM6XjOH5Du9S0VQ9IJcRo7TJUf2Cd7BvePsAaHqLO8aMqutVa2bPiEnF4/UzE1CU
 a3NQfmmVXJ7WCd2LX0eNkOVXi79r30bMUjxn1rY4y9aVL09hSNM+SE9RpDAPOaJpVn4z
 koP3yykPEYB8bnq0tlV8cfqRJnrzuGGmSD4ouIV5OfMEklc4cuIHvMjs7wV2KmWvjYPm
 IbThZA+4wXzaUy4CEDKcN440YYNgjkx66fgEhXR62S4RUbOSlblVTlgV9UfyF8uIuG4v
 ITdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xdsBAgq8mmfQNGcCfpPGhEtJaUfUX0pCIz3BCQgFFh0=;
 b=W2fGTP7MVp/xDW07pVJol44/gRocSgx4IaF4sqoYhAd76tBjGNxDcdNU+58BuW6heZ
 PUWLKdwnB1s5OhQdYicbYp7rPGjgQ2GgmZR3BKkV/dvk5Sf6i4NQDlpTLx/K5LLn7fdj
 RlqmjNLneq1W5wdbEpmx7zDsew8qf86kPQSIj/jILJm4LE6rULe29ezcREVqDDKMKLiL
 kgdPQdXcl8Zd4EsGOgFBlH/j7SvzpNwFL79Lw3L5cmtyoCtqbGXJyZpULCjcv4iASkkb
 fYtkClWbZ7sXYsT8bInG4SMpYaeXNkqGtCgCG8d11ovTPQboxNhi4Ytk/x83zs7jiQe0
 3RbA==
X-Gm-Message-State: AO0yUKVNyIs0dJK9BHbYtOsW0YAkNj6P7HhKVrhHy85ImaI2env4sWUa
 kWn1oX2GJnS2qJyayyEK89rRRMsOEAkeOAbw
X-Google-Smtp-Source: AK7set+HdA4HakueO796L9REYhGB+gAb5FVVRGaToivRs58MgX4PCS7Wgt48dlF6QNOms1D9lJKvVw==
X-Received: by 2002:a05:600c:190c:b0:3dc:43cf:7302 with SMTP id
 j12-20020a05600c190c00b003dc43cf7302mr2972964wmq.3.1675158386630; 
 Tue, 31 Jan 2023 01:46:26 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b003cffd3c3d6csm14913764wmo.12.2023.01.31.01.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 01:46:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A79C01FFB7;
 Tue, 31 Jan 2023 09:46:25 +0000 (GMT)
References: <20230130140320.77999-1-akihiko.odaki@daynix.com>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Viresh Kumar <viresh.kumar@linaro.org>, "Michael
 S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost-user-gpio: Configure vhost_dev when connecting
Date: Tue, 31 Jan 2023 09:46:21 +0000
In-reply-to: <20230130140320.77999-1-akihiko.odaki@daynix.com>
Message-ID: <87cz6v595a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> vhost_dev_cleanup(), called from vu_gpio_disconnect(), clears vhost_dev
> so vhost-user-gpio must set the members of vhost_dev each time
> connecting.
>
> do_vhost_user_cleanup() should also acquire the pointer to vqs directly
> from VHostUserGPIO instead of referring to vhost_dev as it can be called
> after vhost_dev_cleanup().
>
> Fixes: 27ba7b027f ("hw/virtio: add boilerplate for vhost-user-gpio device=
")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

