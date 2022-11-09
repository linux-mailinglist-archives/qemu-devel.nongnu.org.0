Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D54C622BFB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 13:57:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oskcr-0002R6-EM; Wed, 09 Nov 2022 07:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1oskc5-0002Hi-Lf; Wed, 09 Nov 2022 07:55:37 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1oskc3-0006qI-0o; Wed, 09 Nov 2022 07:55:29 -0500
Received: by mail-wr1-x42f.google.com with SMTP id g12so25575412wrs.10;
 Wed, 09 Nov 2022 04:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w+C/UX+wZCLgCzDRjAbBH13JpR4bUNUDvsVDBUP8rfw=;
 b=ekzeRN4Yw0mpLr9VeGW9jsXuFTf4JuRTP4NjZpnUlGWtMfB89dBpC9/78e1wM1gKRF
 zt8hxeLr8p1AbieHXfm4/w80mFQdTGFT9gd9jtbvmIRQLDT7uPcoK02e0AjEq7zBSOTb
 PXz+UOLPGhDleBrtBghrndRKbalrreuLiM9er/vM7FBKa614XcY0UUq7xlnjguVqchh7
 PEUJK8de3APAmvUD45cvMiRUEJk/C7ZfhQJ4J9PNloX7N8HeKlpwGph2j1kA9yHSCm13
 lc62XuW5dZGbMiTHuLbRlnSxWZwvCQ/lylr7CFoWY6Dk+odfNylivcwP8H26rxAEsAcM
 8tgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w+C/UX+wZCLgCzDRjAbBH13JpR4bUNUDvsVDBUP8rfw=;
 b=vRt4twfFJmMKi+YlMogr3IfmNqbWiz1lpbjyN/h2XRk5mIYRr/pWTLrxB/eseF0R/r
 gvolM6405K2eVKiEPqcaw4bDTNw5Xh0mk/wj84WvXuxbmbkMFBPkVQMTrTQihvoJy7WN
 hadO70neZi+koTFlEKu4cKLhn/vKxUZcL7lpuFpRaPuDi+pvcP+AlgSNB0x8dlGLoPmN
 7wjOIZOsLlpPmFGh/IiKchA0HnGQHdbP1vH78KJboJ2R7NQQuwgF1wWZSzn3+FgxYjI0
 xcwOfmo9Quw47/UG/5g4V6uFjWNdJ89ockGA/13W93s5faLR11ORmHF8StJ4DTSVkhOv
 l1Mg==
X-Gm-Message-State: ACrzQf0Y24MAA2CCYmpmxXl2fl7v13IlKXO/FeEOcm+HQGalrOo1+pjy
 0g6YU4lgvetj7JV73tgNibl8gvtzCuAsPXdZZb4=
X-Google-Smtp-Source: AMsMyM5fh/48mKuX1BMDQvRee5D8c4ORDhOfBMmanJg2THebR5eH1q0L32DwhL4zRCZwffbC3fYja6FVzsaww16G5fY=
X-Received: by 2002:adf:ea10:0:b0:236:ec3e:869d with SMTP id
 q16-20020adfea10000000b00236ec3e869dmr27374695wrm.33.1667998522373; Wed, 09
 Nov 2022 04:55:22 -0800 (PST)
MIME-Version: 1.0
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-2-fcagnin@quarkslab.com>
 <87a652hmoe.fsf@linaro.org> <0a146956-a397-54c1-71dd-cd90a68218f7@linaro.org>
In-Reply-To: <0a146956-a397-54c1-71dd-cd90a68218f7@linaro.org>
From: Francesco Cagnin <francesco.cagnin@gmail.com>
Date: Wed, 9 Nov 2022 13:55:11 +0100
Message-ID: <CAF8_6Kk9CWdveyYPRHdN1wXN+9+Mp8fZ6=yDtkvrR_7UO+Y07A@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm: move KVM breakpoints helpers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, dirty@apple.com, r.bolshakov@yadro.com, 
 peter.maydell@linaro.org, agraf@csgraf.de, pbonzini@redhat.com, 
 Francesco Cagnin <fcagnin@quarkslab.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

> I was planning to move hypervisor-specific code to target/arm/$hypervisor/, but here Francesco wants to re-use the same code
> between 2 hypervisors... Maybe move it to target/arm/hyp_gdbstub.c
> and let meson add it conditionally?

Something like this?

-arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'),
if_false: files('kvm-stub.c'))
+arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c',
'kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
+arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))

