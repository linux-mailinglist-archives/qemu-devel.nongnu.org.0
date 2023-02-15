Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1EA698232
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:34:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLfM-0002F2-CU; Wed, 15 Feb 2023 12:34:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSLfH-0002C7-TQ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:33:56 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSLfG-0000SS-9n
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:33:55 -0500
Received: by mail-wr1-x431.google.com with SMTP id y1so19964373wru.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 09:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DcVGeHtYBRBwgzlnj8UOcf+La3RPbj1Pw6zmXVeuBcc=;
 b=TY7dQXLP+3LKCNRuwKAhQmsMNW6yqGfShnlxc5kciH5j7CHP+SAxHky6xXlncBZX8n
 BSRTzK10dxcoqsQWFT6WpcC4ts45JbA73YMYClqbr8qB8vQM4QPLTySoSrxejp0q3EhB
 OzQYrzzV8cm6EH9EIpXR4FgnxdfxrSN+XZs5wybmiFW4XepspjZZU46ghYGMF5Sc7jQ0
 mFA/6gX52831D1p1t/G9uRZPGG8OyXYpv2TKYP6skVcjNd523BUCP9XAZgLNOqMnmvKq
 +va/iwCGtw5knvxrKiOY7JqgDep8sgKDqLp2xpItOUb7WFnF3Ad/zBZ7m2uDFP30urqx
 4txQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DcVGeHtYBRBwgzlnj8UOcf+La3RPbj1Pw6zmXVeuBcc=;
 b=xQia9xf+pUT7hlENWIjvAYrzYeoE1IppCU4KSVLNbe/Kldx/VnZQzPVMRYI4k3wcmP
 CSIROtxK7EBrZE7eL7yezHWmyphKxPmRCrhGEflB6FYzDIWKQZW8R2oPC/8L/DO/DQQr
 3iu0siv+Gk/82xdSkBkRYac+Fgg2XK+COkeO7+uHSxGksaYuDrbLbmn9nSzEd6Yaw+AZ
 ql2SmevAPtUYwmSc2dKnHTNK+EzKwbTj/CFgYdP/QLtyM8RvGuQoHx1fNsB6HMjlC1Xp
 1NYcsssqg3eTUWCXP7VHK2tNKcM/ELqnFE91jhncyF3hiBc+VewoNxgtOgCZwxAVcnr6
 m2HA==
X-Gm-Message-State: AO0yUKUrx5DTo9OYFKdcu8zfAdYUYwGe9nlx0Jii5snecjMWwWLsxafD
 mqf8JjxPxc1a2vw/PBzQRwb8JQ==
X-Google-Smtp-Source: AK7set+YVSC2ETEfLUAdM7ZmVXyP2J/zSok3OF7fsnYAGSVBSonf4LmvlhvvVw86fx22TDcCI9+cNA==
X-Received: by 2002:adf:ee92:0:b0:2c3:ed68:5600 with SMTP id
 b18-20020adfee92000000b002c3ed685600mr2446540wro.38.1676482433071; 
 Wed, 15 Feb 2023 09:33:53 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a5d4cc5000000b002c558869934sm8186388wrt.81.2023.02.15.09.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 09:33:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E55E1FFB7;
 Wed, 15 Feb 2023 17:33:52 +0000 (GMT)
References: <20230215153451.30626-1-philmd@linaro.org>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] accel/xen: Remove dead code
Date: Wed, 15 Feb 2023 17:33:48 +0000
In-reply-to: <20230215153451.30626-1-philmd@linaro.org>
Message-ID: <87sff696kf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Unused since introduction in commit 04b0de0ee8
> ("xen: factor out common functions").
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

