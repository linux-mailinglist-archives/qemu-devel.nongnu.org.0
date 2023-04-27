Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BA36F0DB3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 23:16:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8yA-000543-Om; Thu, 27 Apr 2023 17:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1ps8xv-0004zk-J3
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:15:48 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1ps8xp-0006DV-0V
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:15:46 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1a69f686345so70080135ad.2
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 14:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682630138; x=1685222138; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=NBOvjaSfMSuca94VtLHfDH3Fo8fcsNM4lEw6ArweVuk=;
 b=ajXomIBDCrFEVZHl0rSdsp98rzc675FaSfvcLBhMIUsw8r/f2jD0RZvWtLl5dO9TkJ
 XUkUklj/694dQPfI4rLDvSjrbaxm0e6b8Kww/vHDa5jxFMN5w/MWR7fOFtmtZIzDyMNB
 Q0EW+6aqSaVFsLSyhf9sm0Q0sG/lkbOjbuOhwu0ec8GFpXjQq73G5nc8Ge61H/p/IAui
 738i8C5QbHNCpmldpD5EdwQEnVkgiU1b1R2Ay1GD1iV3D2cOOG6bbJ1fOZZInPMccIgG
 npiTBM4AUev/wco2jvK+ja3H15Tkz0qal++qKG2oipq1FHlnC/7CWYDJ/j+AvOthAG1j
 4tgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682630138; x=1685222138;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NBOvjaSfMSuca94VtLHfDH3Fo8fcsNM4lEw6ArweVuk=;
 b=eQOKh27hTIFfdlYXy94dGOK3KNzwrbX2XjrytrEtoXjxMC0gcQrkkaGaNFsdkPQM4m
 317g63CXWIBxrRDy7K1hGrdu8oLkgh2P213J5yi9akbG334y/Xow3iOt9aRH2+eNU1ao
 /3ceRhVw9QnjF7YUYzXzcLd/jsv5Q1S2AnP8q1GC+MJplIJ13BD2u272dRDPYewAuQYF
 /a5J8e2rVzLzAlEVN5swotELVsjTYsBMkDkovpWWN2ounzrxqUO9oL8wW7CPGHQRlzNH
 Zs+hLdQzC+kFJPZZDSHOVUJu6vztr60pRoBAhf9mufNUJ0wd72O69rBFdoa3HMRjKJ+4
 yqJA==
X-Gm-Message-State: AC+VfDwcLMw8v+1nlO87Qc8icKt1UbIQNBBaZyAr//S/t/7ci+17FdCj
 XGkqbqXeOhcPOZdSXb5V1pLV4Qe7kDU72NsjjvM=
X-Google-Smtp-Source: ACHHUZ4hk4AGEqiSUaU7++X+Hf8oXKZIyFiTgZFYXnDtTdK2YDvF1ZDb3OEsQkg5OZ8UmDy19DQxrA==
X-Received: by 2002:a17:903:32c1:b0:1a6:a375:cb44 with SMTP id
 i1-20020a17090332c100b001a6a375cb44mr3097821plr.39.1682630138571; 
 Thu, 27 Apr 2023 14:15:38 -0700 (PDT)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 j17-20020a170902759100b001a6e3e3dbc3sm11992359pll.22.2023.04.27.14.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 14:15:37 -0700 (PDT)
Date: Thu, 27 Apr 2023 14:15:37 -0700 (PDT)
X-Google-Original-Date: Thu, 27 Apr 2023 14:15:22 PDT (-0700)
Subject: Re: [PATCH 0/2] target/riscv: RVV 1-fill tail element changes
In-Reply-To: <20230427205708.246679-1-dbarboza@ventanamicro.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 dbarboza@ventanamicro.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: dbarboza@ventanamicro.com
Message-ID: <mhng-ca247fea-c6c6-4ad3-bb6d-2c85e93d15d1@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, 27 Apr 2023 13:57:06 PDT (-0700), dbarboza@ventanamicro.com wrote:
> Hi,
>
> This series makes changes in vext_set_tail_elements_1s() to be a little
> nicer to the emulation.
>
> First patch makes the function a no-op when vta == 0. Aside from the
> logic simplification we also have a little performance boost.
>
> Second patch makes the function debug only. The logic is explained in
> the commit message, but long story short: we don't have to implement any
> tail-agnostic policy at all to be spec compliant, but this function has
> its uses for debug purposes, so keeping it as a debug option allow users
> to disable it on demand.
>
> Patches are based on top of Alistair's riscv-to-apply.next.
>
> Daniel Henrique Barboza (2):
>   target/riscv/vector_helper.c: skip set tail when vta is zero
>   target/riscv/vector_helper.c: make vext_set_tail_elems_1s() debug only
>
>  target/riscv/vector_helper.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Though this made me think: it'd be nice to have some sort of 
"aggressively do odd things for VTA/VMA" mode in QEMU, as that could 
help shake out bugs in software.

