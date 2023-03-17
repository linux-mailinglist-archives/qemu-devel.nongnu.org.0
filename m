Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD156BEFAC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 18:28:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdDsH-0002ug-Lg; Fri, 17 Mar 2023 13:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdDsG-0002uX-6C
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:28:16 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdDsE-0002sr-Ld
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:28:15 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 p13-20020a05600c358d00b003ed346d4522so3849803wmq.2
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 10:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679074092;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=isWmQVRQWCcDWr1/H7IGY07CSL7Rod9EcBW9Jh+DIss=;
 b=qju08C+pmAumDXYzlKGSf9iZ4TXqBx4av9TtwIx2D/etQyEUfujfmA6K7Ou8+77ksb
 8j8oKCVRrkbE8tQke9uaW+RCa8Y2D01AfA9tZU+SODhuUvJR23GGW7M9iHZFJ7DDn1nl
 6JJ+bHE5MFvl0im6D/WDvuJRnKttEJwk2hOc58b0es75Y77dRhvAPcNYADh2rFQXn0sA
 ffF3DyuO5HTn/blYyAP9kKuzM+G0VkXiK/37yf6bSRiRwklhvnhcPj3fMGfHtLbxNvcr
 vdhoTJi7531LbodfFxmCGumy8axGiFxSyViwZFIQyALLcTOLvkjw8tc+679iXXcwnkxl
 6UyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679074092;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=isWmQVRQWCcDWr1/H7IGY07CSL7Rod9EcBW9Jh+DIss=;
 b=c9sFy5rmhhM5wUA/0BX1vAEm9PMZTSMYMePRekNIGeBwUUaxBFZVe1UTVPFTRk6AzD
 SgEx4scBLix+zKfD563XuVdGMuIQrNHBt7KH8/NqnVlSnopHOPqn1hpaovOYKgubUvdY
 SQL6yrlpWLXuWWQjvTZQY51Lnvm+qk3dX0dPQxKX10zfVwzZDL32gt+mvUcnnwT2B/k3
 Xn+6sdRHMIQoQgwKpWluhgdIRC2AcK9gUouhtjo46rbqUW7KmH9PEa3LjgGVvKu1mZdC
 s6ZjNc1Vo/QjyZRo54kezcMjYpVOU0blPFHVme0Z4pzPtMj5VnmcERx/xQti9X8Qv4+n
 TBUQ==
X-Gm-Message-State: AO0yUKVI0pRzRt1X1a8C0iAGszD2RP9IcwR8oSWxictK3GVgg5H1LuVJ
 4DpAgJg4oeZroTi52+5+l02nConP8eUF6xazgBE=
X-Google-Smtp-Source: AK7set+eqgg+xZET6g+q4AfkVK1jm6fBU276kaoRp/CYwAjA5HPhukJPUaA/LK3cQKpvd2fTFflROQ==
X-Received: by 2002:a05:600c:34c1:b0:3eb:383c:1876 with SMTP id
 d1-20020a05600c34c100b003eb383c1876mr25848854wmq.6.1679074092389; 
 Fri, 17 Mar 2023 10:28:12 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a1c770e000000b003daf7721bb3sm8415030wmi.12.2023.03.17.10.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 10:28:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C3A9F1FFB7;
 Fri, 17 Mar 2023 17:28:11 +0000 (GMT)
References: <20230317170553.592707-1-berrange@redhat.com>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] qtests: avoid printing comments before g_test_init()
Date: Fri, 17 Mar 2023 17:28:04 +0000
In-reply-to: <20230317170553.592707-1-berrange@redhat.com>
Message-ID: <87edpn70es.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> The TAP protocol version line must be the first thing printed on
> stdout. The migration test failed that requirement in certain
> scenarios:
>
>   # Skipping test: Userfault not available (builtdtime)
>   TAP version 13
>   # random seed: R02Sc120c807f11053eb90bfea845ba1e368
>   1..32
>   # Start of x86_64 tests
>   # Start of migration tests
>   ....
>
> The TAP version is printed by g_test_init(), so we need to make
> sure that any methods which print are run after that.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Queued to pr/170323-for-8.0-1, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

