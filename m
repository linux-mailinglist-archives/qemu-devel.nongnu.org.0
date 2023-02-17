Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9B269AC0A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 14:01:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT0LB-0006Vy-3w; Fri, 17 Feb 2023 07:59:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pT0L9-0006VB-DU
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 07:59:51 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pT0L7-0002Bt-Rj
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 07:59:51 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 d4-20020a05600c34c400b003e1e754657aso917718wmq.2
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 04:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3WwYHQndvMOsd13yhTvLBst/AY25D7+JqlpL6hBX+fM=;
 b=JkRj/cQP4Gk/9iagFuCR6fvlEuhvdLVjpOVd8rV89ggmcUkWufsIraHUHcHG0aeWpF
 dE0hls+Ys7lcfUPRFh1jxd2Bvm1bWom+UPwO4OuKWAs/jHpVDZOcJX5eBsgdjhxI3h3Q
 VSqkDH+JO/SeAVKSbkBWU5simpl1CWCwf7KllA92WY7NHOMoIhyqUwpDM+pHNVApdwLZ
 O7WwUMSB8EV/sOMTlkfQVoiFU7xBIqczb+uIDP/pd+h0H5U5svn17rEbCRvJGEbWrSxP
 uvdKzce5tNTnCSPQ6Om29p9VqY+4w/wMONGzG1LQkaWCU4XWh7Jc25va2SgrNx+AWppJ
 nTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3WwYHQndvMOsd13yhTvLBst/AY25D7+JqlpL6hBX+fM=;
 b=m4sBkCx1JXgXRYvFS2vnA/b1hXl4YQITENF9mzGh6KRnjs4B0KVrffx4IaT5geJ2Xc
 QTTeNTZVJgNI1qLlFl5mkiWiXyKN63wBcZsyxcRwIhKl7GOrfX2MHpEYhg0a8zBNTnbU
 I1b0OkD9W7POaeKNjEUIt9BnbWkxwg33JQetYNpiC1EbEtt1TRxtnA/oYrUiNodtMKlq
 lFo69t0f2e84KmcR+SQe4GXzhZ230NTF/2L8ei76TH7gtg0tHPRxaI9a7h9E0ZNImLfy
 M0uGZutHVScMmXiJVMA3gvU/a7467vZikwfjHPAhxOvLqzqn2J4p/qisAZXmzCBoo3U5
 vAzg==
X-Gm-Message-State: AO0yUKXHfQMG4ojfojW4BkDlCPBlqTq/m2fSuTBwQ1a04iRSIaie5gdH
 YMNP5JgWgskOXKFZwNi3ljuz/A==
X-Google-Smtp-Source: AK7set/wwLc8TJsYcTWBN0HF/Ok7NZgumETkShwpkT/UJoz5bI0pdauMQiTpUceMnfTtssK3dLdTpg==
X-Received: by 2002:a05:600c:2ed2:b0:3e0:e77:3056 with SMTP id
 q18-20020a05600c2ed200b003e00e773056mr195884wmn.30.1676638788127; 
 Fri, 17 Feb 2023 04:59:48 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 ay38-20020a05600c1e2600b003dff870ce0esm837711wmb.2.2023.02.17.04.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 04:59:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 506851FFB7;
 Fri, 17 Feb 2023 12:59:47 +0000 (GMT)
References: <20230217103130.42077-1-f.ebner@proxmox.com>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: jsnow@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/ide/ahci: trace ncq write command as write instead
 of read
Date: Fri, 17 Feb 2023 12:59:40 +0000
In-reply-to: <20230217103130.42077-1-f.ebner@proxmox.com>
Message-ID: <87lekw78ho.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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


Fiona Ebner <f.ebner@proxmox.com> writes:

> Fixes: e4baa9f00b ("AHCI: Replace DPRINTF with trace-events")
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

