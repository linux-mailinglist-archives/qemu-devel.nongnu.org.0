Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CEA5F33C2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 18:41:42 +0200 (CEST)
Received: from localhost ([::1]:52556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofOVg-0002s6-OP
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 12:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofODz-0007qh-42
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 12:23:23 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofODr-0000Fv-99
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 12:23:22 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 130-20020a1c0288000000b003b494ffc00bso8825737wmc.0
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 09:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=y7MPD/0u539Yy7E8xJIA0xSc/2vP4Wf3XjCF7UVvwoE=;
 b=Ogguem1iHlEth/J65PgW88WmkPN0irY0aejWnQrPbKLy+BtYWHrjUL0ON1kSO9cqm8
 XS/s4aX6FNVOPluJy4COMRP4LXLVxYZ3qdnBwVdyGlHC0eSXysYTb4bPOfY2W9xEINAX
 hDOFvvpuE/Ftex2/IdQL+yHyweflR2LH4P/vvkPFXQGD2Fa7EfaSKtacamZrJfzzIEjP
 oR/SOupHoOb9DZAoMrb46WYAu+4+APCjI4Xf9S5yRfXPEaTOtdkibW0sJ1TNp0Fb2ZP+
 Jn0hWppjt49FEnBp/ZAI49NKReTy4cjqIgCtP/NSoaU9Da03oho9MG/KzuoALGdr6Asq
 Ol6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=y7MPD/0u539Yy7E8xJIA0xSc/2vP4Wf3XjCF7UVvwoE=;
 b=RVpukIC77ZrXsMXq8rbGT7N/o1lEUgd4x9bcR2zWlyDzHjRVEjpsPFFsyo/NX/HUsE
 TxmN94EGEgd7WByYQSOqZ5lgM9Q95eY3Ecvy4f3bUM+bcjUMNi5JrRNRk3Z0gVC9S9VB
 JSVKnZClXK7rU+ki9GGOD1iLnqVJJL2hA05UaThCLXGBuRBnXLLuGlCVUq6fMA25/4J+
 J2ENb/YSGssuai+5tkQO+XdFK6S8sx7tbc7FWmnZlNSAU2Dq2XZzVbOGa1RaB/w4MqW2
 IT0xwTpoHdt9hZ7bwQSiAFmWQhsNOWcyrcKLAKwemuAVEduuedfYWxzJa+Om83ZdRIxG
 jjtw==
X-Gm-Message-State: ACrzQf3P7GhHFUDyftd3BK0fj6zQCzYr12NljFJrWi+Cx1DVAqDyLu3+
 AKKR2TYxmSI0hk4PZbd8utL7fQ==
X-Google-Smtp-Source: AMsMyM5bAud05ueYtFVqHamfXazsXxF6HenXpNYESujVkpfJH+67wGqlWAty0R/dYTlIdtnIU3ZhDw==
X-Received: by 2002:a05:600c:41c3:b0:3b4:9668:655a with SMTP id
 t3-20020a05600c41c300b003b49668655amr7379447wmh.36.1664814193400; 
 Mon, 03 Oct 2022 09:23:13 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c63-20020a1c3542000000b003a6a3595edasm12149926wma.27.2022.10.03.09.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 09:23:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5A6901FFB7;
 Mon,  3 Oct 2022 17:23:11 +0100 (BST)
References: <20220930212622.108363-1-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linux.org, alex.bennee@linux.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 00/18] tcg: CPUTLBEntryFull and TARGET_TB_PCREL
Date: Mon, 03 Oct 2022 17:22:44 +0100
In-reply-to: <20220930212622.108363-1-richard.henderson@linaro.org>
Message-ID: <87h70knafk.fsf@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Changes for v6:
>   * CPUTLBEntryFull is now completely reviewed.

You should try a --disable-tcg build because I saw that failing in CI.

--=20
Alex Benn=C3=A9e

