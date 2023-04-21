Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0A36EAB66
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:20:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqgm-0004wP-Bb; Fri, 21 Apr 2023 09:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppqgc-0004wF-PO
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:20:26 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppqgb-0002CD-5Z
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:20:26 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so3198825e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682083223; x=1684675223;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wm6I9o8vvas+iXIcJ3xvKuehSYI7+PdHbFuQZdJll8g=;
 b=ST4nFuM0N6d7zF6QMDDqqtXg1Ph5DwLDHKyB1BLr23rPBOJLoTt5e0GW5gE5SJa07J
 AqrrDhRLO90sL2XUpmuRLqLOBQB9K3mX+CNtlNFj94htn2ZwTaqOSBvL3k0AKLEF9Kvx
 8U3N/Le7Wqzcy6wDd81+WoWj50sxepZ7tJlGMgl9aGNLXXQVAoshL7Xfv0g2ufkU4PKJ
 R0UUZ2CiE/K+X07uDv/K8RqSa7/PtVHv5eV6/XPYaW3bRp08tzvM7QnKdiwoAWfZhAiU
 BqSHVzSF//l/XEWH/6kt5YD59fMBKJb3MNIQRtWJCpJILv5dGP7MMcQ2nzUTkvXC3ZW0
 KNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682083223; x=1684675223;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Wm6I9o8vvas+iXIcJ3xvKuehSYI7+PdHbFuQZdJll8g=;
 b=QYefZ7s2s0C722Tlz0RpDVEfkIGYNpXcile5OZYOTA97qLzsCjG3JU33DHtQ36T6kJ
 +wZggb2rICAe4vn/6ZB1cmv/Fb6wa9J5O9EI6+Iwzi3qI74riWzi7U46pr6DxfRvRkHx
 7OGXWK4iFA61s5nRoxEgc90SD6HNSQ2OOaNSvPj1vWVc6bUp619KCJf7dnlncYQMh7tK
 tb8hB+n9LTeXMjJLPN/SvvmEIBxyXuef11ZgSP1rQz3kf+Fsza9rrnnOu6RQs6NSCnSZ
 YVTBa4ElDzWSTfkqe0NnAKa4UvWOjac1SZEKv8h4UhOgvRLhdM7HBeBM+oXQnwZAbDZR
 pEUQ==
X-Gm-Message-State: AAQBX9dkP9ddUuOiKmmQp3ErRu7RHLPFeeGQ0FcvIq0KBWmTOvgIMqCB
 WXJUTVmj5bekFvbiiPegNDAapg==
X-Google-Smtp-Source: AKy350Zq4sOYE7CjjESZJ9QFXbSGgN3I1G/7iUmo/rO32zjCKX+bPb9+BwarplfUnQKu96531udcWA==
X-Received: by 2002:a1c:7c0a:0:b0:3f0:b095:15d9 with SMTP id
 x10-20020a1c7c0a000000b003f0b09515d9mr1842765wmc.40.1682083223564; 
 Fri, 21 Apr 2023 06:20:23 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a5d6246000000b002feea065cc9sm4342867wrv.111.2023.04.21.06.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:20:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 791C71FFB7;
 Fri, 21 Apr 2023 14:20:22 +0100 (BST)
References: <20230419144553.719749-1-thuth@redhat.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Ed Maste <emaste@freebsd.org>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Warner
 Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>, kraxel@redhat.com
Subject: Re: [PATCH v2] tests/vm/freebsd: Update to FreeBSD 13.2
Date: Fri, 21 Apr 2023 14:20:15 +0100
In-reply-to: <20230419144553.719749-1-thuth@redhat.com>
Message-ID: <87leilbcdl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Thomas Huth <thuth@redhat.com> writes:

> According to QEMU's support policy, we stop supporting the previous
> major release two years after the the new major release has been
> published. So we can stop testing FreeBSD 12 now and should switch
> our FreeBSD VM to version 13 instead.
>
> Some changes are needed for this update: The downloadable .ISO images
> do not use the serial port as console by default anymore, so they
> are not usable in the same way as with FreeBSD 12. Fortunately, the
> FreeBSD project now also offers some pre-installed CI images that
> have the serial console enabled, so we can use those now, with the
> benefit that we can skip almost all parts of the previous installation
> process.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

