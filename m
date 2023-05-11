Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C9A6FF834
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 19:15:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px9sF-0007aV-J4; Thu, 11 May 2023 13:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9sE-0007aN-G0
 for qemu-devel@nongnu.org; Thu, 11 May 2023 13:14:38 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9sD-0005Mc-13
 for qemu-devel@nongnu.org; Thu, 11 May 2023 13:14:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f315712406so294410215e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 10:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683825275; x=1686417275;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6TrDR/4rBB0RvdiQuty3WQAKUKl/NKsBE8M2oESaPI=;
 b=ADuWw9FPlsRe1XsyyEizQQzDWh2ebcH1GSYrprcPNzalcSYsb7EialwCl1hk96bUH7
 FHmuhsGFEyWZlmTyK5ZPsQJcy+zSXzqGc8B7HjbrSQYW8i9EtONID2M+05lgYcBVgs9z
 DbOfne0Fylru9D4MVKt9TUH6KFJJlinAdUTD1cVvw4to4eBiFqUGy7DhHImkfsksouHX
 1Yw392buwzN/B3JW1YjblOEauKZiGOjX4k89gixojSSeiL7cViJooI5c6RJr16KaYeYt
 C0EFoZt9hf72Em/UX09cNsAUB1qC/WnzSZbarDXIEjnuQQLjmHyBee+rI3lmU4OEgxT0
 WQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683825275; x=1686417275;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=W6TrDR/4rBB0RvdiQuty3WQAKUKl/NKsBE8M2oESaPI=;
 b=Xi+4TckIQuxOH1+C36kKlIrOEaQAISMLluVDcY7GpSHkrOqgrLhXo0K2U4KxrgjSct
 /pf5xtF1iZIYyVnQgFDH9GxxH5gKedrJ0vj3lCiWliLlAFrXJL9SOsd6PFoijW8HKRoN
 fQIc067YDfjRzv+Cgwf7JpED3rxDmiYiFw1aFu3+PUGaF1N+TbFg6Bfcw3s5RWc9d7eU
 mvliGaYILImGesEOlNFUM2MXkJ0s8doOdrz8jL04S5EksgxfXxCPmylbkO48Q0dg9E38
 Y9QzhqFbBVqVP/uFg8ThG3X6Sfker+2wOlnL8MkAJBxxiqIcxr33AG3cIrn/TvdlgXsi
 4dFw==
X-Gm-Message-State: AC+VfDyEoAHOjObcxq4Z9PhIrXY30mIJZLBmKKHd/C0g7fJoyoLw5ODq
 0RTkMZuDoQD39BHH4CiTWa0qpmXJmv2DvfgYPYSSCA==
X-Google-Smtp-Source: ACHHUZ4P1hle/kV8x4OnkfmvmFQmVVnWEebslP6M4mzn7tVQzH6dPFiBAf0pMv8s5Tdx75LQDCZstA==
X-Received: by 2002:a05:600c:1d88:b0:3f4:220e:bff7 with SMTP id
 p8-20020a05600c1d8800b003f4220ebff7mr11332431wms.5.1683825275229; 
 Thu, 11 May 2023 10:14:35 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d4c42000000b003063db8f45bsm20850759wrt.23.2023.05.11.10.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 10:14:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 92F0D1FFBB;
 Thu, 11 May 2023 18:14:34 +0100 (BST)
References: <20230511165640.1862868-1-alex.bennee@linaro.org>
 <CABgObfabZgJro_faUfhADWtTg1ewpM2iMtmt4KkJpSBqmJsF_Q@mail.gmail.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] Makefile: include gtags in UNCHECKED_GOALS
Date: Thu, 11 May 2023 18:14:27 +0100
In-reply-to: <CABgObfabZgJro_faUfhADWtTg1ewpM2iMtmt4KkJpSBqmJsF_Q@mail.gmail.com>
Message-ID: <87pm76yemd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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


Paolo Bonzini <pbonzini@redhat.com> writes:

> Il gio 11 mag 2023, 18:56 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha sc=
ritto:
>
>  This is the mechanism we use to avoid defaulting to a build dir when
>  we don't need to.
>
>  Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> I had already squashed this into Steven Sistare's recently posted patch, =
which otherwise would have broken the
> "pages" job in CI.

\o/

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

