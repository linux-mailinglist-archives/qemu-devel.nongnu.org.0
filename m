Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CFE6D922D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 10:59:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkLT9-00038p-9q; Thu, 06 Apr 2023 04:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pkLT6-00037c-Pz
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:59:44 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pkLT4-0004zs-Dl
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:59:44 -0400
Received: by mail-wm1-x32a.google.com with SMTP id s13so22196614wmr.4
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680771581;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5sRssPNnjk3FAAC+e6GI9oX98dvbrVIoKM4xtqCLlrA=;
 b=YII4xabBar2qgebAcPiklW/unkEMHWDuzLRCvxFk/UIH+PpgClheiQltRIEzpj77Pa
 E7NN+ACG3OIepEIJguzVWYGdlql7j7gya/NrJMMN2xMiJ4rHV6C4ykgh0KcgMUswajQF
 F0S8b5Gg/tq5SaNEEi6s16L142Z9mzJDOIPY3P0t3k1iH+VgJQ2Y1JXs5lWKp3Hzz2Wm
 yu1ioq8GHSxJHChSiUwRj5hZFWsTNj6lOH6K9PWeVBkLPCjaPaqs1Y+AhZflGsfkSnbN
 sKCN6wWH+p/G8uVtjuoNxP+Pc98XX49VuoY6NYEyhoXdAvUIPpGMSldLMRAFYdodaZyU
 5yVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680771581;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5sRssPNnjk3FAAC+e6GI9oX98dvbrVIoKM4xtqCLlrA=;
 b=qUDxFVSclyge0SXLRVDhp3mtkeEr3HSiDWbCrk9EGYpVUAtVZFFE5LMHnSpNThVNbA
 U+6i3rb0ynTEPGIfkwOm/+mcoLEheYNaq5PH0hfGT67MTvQOOx5560FB6EalPjG6qIiT
 i4ZF5pUY99vOELiFq7I8BJxmCKGkQDxGyPSqrYXHBkXPPj3ZFnPsfyZVvlms/1I010S+
 Af0e2NNvGq2Po7YAXENNgF3ZAAdnGGN5xSFrDuF/aJdUXifW56AmjfhNqX8g8e4T5bmb
 rVcjfKNAUnix2s1hDbdK6nB9HM6WdU/Hr6YIW8xHdc2CYNtqqi/0XBO42jjnS2EmPxPY
 OKEQ==
X-Gm-Message-State: AAQBX9ffFO3C/jplbCxJ3T4Ki8iLPAWj/6kCFQg6iuaBOMMmjlM54Drp
 zNqTqC337J3gD8UzapFYZIbZ+w==
X-Google-Smtp-Source: AKy350a5z9Vn/jqwCz8XAy+NdfPZbRY6wD5oyyp/lb/ETDZgLXHhcUAhKvVEQnxfzLFAT9HuflqkFw==
X-Received: by 2002:a7b:cb4d:0:b0:3f0:6b33:a5e1 with SMTP id
 v13-20020a7bcb4d000000b003f06b33a5e1mr862961wmj.9.1680771580873; 
 Thu, 06 Apr 2023 01:59:40 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003ef6f87118dsm4798573wmo.42.2023.04.06.01.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 01:59:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 32B481FFB7;
 Thu,  6 Apr 2023 09:59:40 +0100 (BST)
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-3-philmd@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 02/10] accel/kvm: Declare kvm_direct_msi_allowed in stubs
Date: Thu, 06 Apr 2023 09:59:23 +0100
In-reply-to: <20230405160454.97436-3-philmd@linaro.org>
Message-ID: <87edoxjshv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

> Avoid when calling kvm_direct_msi_enabled() from
> arm_gicv3_its_common.c the next commit:
>
>   Undefined symbols for architecture arm64:
>     "_kvm_direct_msi_allowed", referenced from:
>         _its_class_name in hw_intc_arm_gicv3_its_common.c.o
>   ld: symbol(s) not found for architecture arm64
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

