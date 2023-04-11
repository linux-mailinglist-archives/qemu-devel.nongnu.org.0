Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EABD6DDB19
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 14:44:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmDLH-00034y-Ox; Tue, 11 Apr 2023 08:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmDLC-00034S-1j
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:43:18 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmDLA-0002nJ-6I
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:43:17 -0400
Received: by mail-wr1-x434.google.com with SMTP id j1so11414399wrb.0
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 05:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681216994; x=1683808994;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nzCFqVL6tz2b7a1AwWb4k7YJdRF/ecySJTqcXWnUTy0=;
 b=txkFmXv0pt4f5iCjHzesB3CURRGH0Wmu+/Tu+Toc3ytLYKDP3WLaPN0MG8Bp27v02h
 bO4EsmvM9V/G4DwQv3zoyPvBlo+qGSRnm9K5B1+CTTe6N4cOP8QJ4769QCa8IvgybqGk
 JZTN0uvlYP0ans0a9p138GoMabPBoEagE6653iHwAM+SJ+qMqU4bU4DTiGbFW46EEQBe
 o2RfV4X0Lv9czR+RJcAAgPzWOMVqMdei087weNB/q83+gEh4mQ6et7BcoQrXGt96xEWN
 wVrjSo7iKNEHhi1RSaNahY/aQAOly6q+sxJQf2SxXW0ZT87piE7tQxLBaNwctsBu0mFy
 dA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681216994; x=1683808994;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nzCFqVL6tz2b7a1AwWb4k7YJdRF/ecySJTqcXWnUTy0=;
 b=lHD7D/4rKOOo09HDG6ZVjnfM8tzLhRdfgzmiXu+yjjiFPFZV7g0/t+J1EWRFdzjqOV
 q3DJ+hUzzdhCCxjcVDIkJKZjyxdpwXNf1M0XX55hcRDTDwuYNtRl0Q7Lwkx6ZXyFGyUt
 AdnUjBepV+BAv3kOgzVHsQtGqMJgxEv9lJN3E1s6vlae3KyCG7CuYlxAtjBC1XQHsrj5
 qBBsMy+O9gUQ/dIBvP7e03zEB43n7pe/ejxyI5Klv+eAy3T3YX4QEdZ6Qh8RTVK40OCx
 gOXi9j63hB5cO+HOeeCeRG+/DyO3Rc8ib1tj12FKvyX3wMnaclsyqEpw1JK7k+Jui8kF
 T9Tw==
X-Gm-Message-State: AAQBX9fk60JlMQSFNoaN0Gs7ISHcv7Yfv+pWuo3FhHFF40K9896fNEV9
 p2gF7ZApJI+U63f1BhI8DIsldw==
X-Google-Smtp-Source: AKy350YzhoFl0SmqtVJEs+SsQH00Sml1pqr0SE5cdsagy7Q/m67GuAmfZxZm+4oJ+x8xTHETuCtygw==
X-Received: by 2002:a5d:58ee:0:b0:2f2:3536:1678 with SMTP id
 f14-20020a5d58ee000000b002f235361678mr3587554wrd.49.1681216994239; 
 Tue, 11 Apr 2023 05:43:14 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a05600c099800b003ee74c25f12sm20644058wmp.35.2023.04.11.05.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 05:43:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8AA4B1FFB7;
 Tue, 11 Apr 2023 13:43:13 +0100 (BST)
References: <20230409201007.1157671-1-sw@weilnetz.de>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH for-8.0] docs: Fix typo (wphx => whpx)
Date: Tue, 11 Apr 2023 13:43:08 +0100
In-reply-to: <20230409201007.1157671-1-sw@weilnetz.de>
Message-ID: <87wn2ipp26.fsf@linaro.org>
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


Stefan Weil via <qemu-devel@nongnu.org> writes:

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1529
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>
> I suggest to apply the patch for 8.0 because it fixes documentation.
>
> Regards
> Stefan W.
>
>  docs/system/introduction.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/system/introduction.rst b/docs/system/introduction.rst
> index c8a9fe6c1d..3e256f8326 100644
> --- a/docs/system/introduction.rst
> +++ b/docs/system/introduction.rst
> @@ -27,7 +27,7 @@ Tiny Code Generator (TCG) capable of emulating many CPU=
s.
>    * - Hypervisor Framework (hvf)
>      - MacOS
>      - x86 (64 bit only), Arm (64 bit only)
> -  * - Windows Hypervisor Platform (wphx)
> +  * - Windows Hypervisor Platform (whpx)
>      - Windows
>      - x86
>    * - NetBSD Virtual Machine Monitor (nvmm)


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

