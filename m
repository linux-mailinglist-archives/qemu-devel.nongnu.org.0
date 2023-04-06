Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCA66D922A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 10:59:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkLS4-0001c5-1P; Thu, 06 Apr 2023 04:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pkLS1-0001bK-Uj
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:58:37 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pkLS0-0004px-Ez
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:58:37 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 n19-20020a05600c501300b003f064936c3eso2551151wmr.0
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 01:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680771515;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHzSA/w+tX29wdWiyiod4QQFWJP9A2SW72Qr9AlU6gA=;
 b=CfPEMKLKqOz/c3+hZ29YAY4dhnm3/P8Qdd5ytuaG4hm36heD2Zf/Ekwv2bz3sieyAU
 lCS9A60SVmslx2d+mK0nvxajpqAbWWH58sSX50rXMYKxvlOJT8cQtIKonxVMWaQJgpr2
 z9ZCuQsrxcXpHJS4q4vmTB5xM1uqNH2aZXDpGq8XaLTUE+9L4Qj3x4aveWKuZTctKpoq
 f8HBIJM2csKrijwyNxnz2n8JvCN9mEFcSyULbkVvfCxdojQtvuuPHIcmvsnvIdlISU8C
 08sGcS1Kmk+2IN2DdDH14DbP5n3N0njIrvaDv8nFRT+8d50kImoO+gz6xnUFNzAelVyz
 NqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680771515;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hHzSA/w+tX29wdWiyiod4QQFWJP9A2SW72Qr9AlU6gA=;
 b=ozUpKDTswwZL5HIUlSqFbay2u5UdSv5ZL83nL0S5VVuOrIsZH38PDhEO79jX5rzd9U
 limhWW3G9JoKrUcFdWEK6CFX1S9SIqw6Aw79nrqu3j5OD4PV8qbHxFYvtL/M4M2BQ11y
 4H1DqKg79xrTi3Nq2XLqHWsUOlRxve2RPhyOO0/KKEPrQR79NMEYQRDKoOf4EWJ/Wtyz
 lEtjDhO5hETTBio8beQr/pMBEKF+q1DGAi9Aju15JmNzni1vIZ63WFb3bMLiKc4pnZNV
 6bLN9WFnLH7cLS1gAWfZ47kiLbw/aQY8weXaFTso1tbpkiliWF1/u6lXfZZ+qwA7sC0R
 p78w==
X-Gm-Message-State: AAQBX9fFQ5pOMIrODdTrGslFLxi4bAueUo0aUgfSKLPaqB224W7S9aA2
 KR1Opvhfv0v00jt4Yt2WIp2QHw==
X-Google-Smtp-Source: AKy350ZvO2HEFpt6fKATtkVuDR9PZfHcx1kRVj+R7uhiRUrRmPQtOUp51lr7nDaatafZ7WJbFafRmg==
X-Received: by 2002:a7b:c34d:0:b0:3f0:44d1:3ba7 with SMTP id
 l13-20020a7bc34d000000b003f044d13ba7mr3420294wmj.17.1680771515016; 
 Thu, 06 Apr 2023 01:58:35 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c355000b003ede6540190sm4772378wmq.0.2023.04.06.01.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 01:58:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B7231FFB7;
 Thu,  6 Apr 2023 09:58:34 +0100 (BST)
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-2-philmd@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 01/10] sysemu/kvm: Remove unused headers
Date: Thu, 06 Apr 2023 09:58:24 +0100
In-reply-to: <20230405160454.97436-2-philmd@linaro.org>
Message-ID: <87ile9jsjp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

> All types used are forward-declared in "qemu/typedefs.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

