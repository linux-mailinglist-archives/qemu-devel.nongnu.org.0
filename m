Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6419E3622B6
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 16:49:51 +0200 (CEST)
Received: from localhost ([::1]:41640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXPn4-00033T-1H
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 10:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1lXPHf-0003eD-Nj
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 10:17:24 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:50743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1lXPHZ-0000rS-G8
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 10:17:23 -0400
Received: by mail-wm1-x32b.google.com with SMTP id u20so9860513wmj.0
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 07:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:references:mime-version;
 bh=Y0NFtQ7GKxg+D8+yBeQkxP4F6jq+pOWGtjppThGe8Zw=;
 b=QOhS4zTDUkT9aNKwfO9XwNXCpwJE1qn8CQbzc2PCu49Pe01i0HMobm90nXPMDqRKUL
 q70atWKX9yu3EOXPqwed1b5nOBAaeU6DmLFHqH9aVPpQ4s9twqmJM7DdhOd3rOQsHhZU
 vzAq26YWJ2Q5HT1mUMPIybn/+6T1IzS0x0K68D0ceqzDsOH87bhpvLlmlfp2p+XVyXrB
 vq829zJ1obRPuAHezj4ejJghTMnyYN7nToGsOre5ug0jyUFDTkhlovvlhJ6qjPO9NZ33
 e8hlv/W/BTwxxAnEJctUYqjrjKK81JPp/sqDuaUzMOvr82RnRAppR/Sv0rd6qWQzdn+5
 4qbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:references
 :mime-version;
 bh=Y0NFtQ7GKxg+D8+yBeQkxP4F6jq+pOWGtjppThGe8Zw=;
 b=Z+RVxLTuJdhwHZ/2FZvPSMIotHY2oW0agPoK3p5dSw3EN2njt8l5iKjC7lbl93BWzk
 7vjTE5oVeBKP4MxdxZyv0nDiUysyfgDa4ivU6iS8m2fuwJdvzfgUMhMn8sR3tFasYdjz
 rZ7huldl8ZMBkrjJ/wUSdNGN0DCs2d55bCekJxxWCaSyEwMXfw/CGgyAHxuv4I1S6piu
 GqcRt69lkJg9IS3aXTL/8FeceoDCZdUlXAqQZfEEaaocoF97504Bj31c836SEx0E8wRh
 4PznXhGAan/cIPHIdaOewBMEItFhVAgqllJKEUzEUce+2hMkIl9TDNIkEE1k0NRY6Rfs
 a5sg==
X-Gm-Message-State: AOAM533/i6l922mGQRkFk0szO22EgMxIkyZ5Uw68Cq00VeHJffpPLJNb
 icyh1iz8yJktAL4+9jt356q8tHRAnQ7yrQ==
X-Google-Smtp-Source: ABdhPJwuJ5WmJoib9ITY2Z/8wXvu/NIInfsOmhF38B7XuSzNc4eiDh8IVqE+M1jwW4dB/gdw2IYrdg==
X-Received: by 2002:a05:600c:203:: with SMTP id 3mr662394wmi.140.1618582633219; 
 Fri, 16 Apr 2021 07:17:13 -0700 (PDT)
Received: from [192.168.83.193] (lfbn-tln-1-134-231.w90-119.abo.wanadoo.fr.
 [90.119.102.231])
 by smtp.gmail.com with ESMTPSA id l9sm10511421wrz.7.2021.04.16.07.17.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Apr 2021 07:17:12 -0700 (PDT)
From: "Emmanuel Blot" <emmanuel.blot@sifive.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/riscv: fix exception index on instruction access fault
Date: Fri, 16 Apr 2021 16:17:11 +0200
X-Mailer: MailMate (1.14r5757)
Message-ID: <FB9EA197-B018-4879-AB0F-922C2047A08B@sifive.com>
References: <20210415134128.32670-1-emmanuel.blot@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=emmanuel.blot@sifive.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 16 Apr 2021 10:48:05 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When no MMU is used and the guest code attempts to fetch an instruction
from an invalid memory location, the exception index defaults to a data
load access fault, rather an instruction access fault.

Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>

---
  target/riscv/cpu_helper.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 21c54ef5613..4e107b1bd23 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -691,8 +691,10 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, 
hwaddr physaddr,

      if (access_type == MMU_DATA_STORE) {
          cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
-    } else {
+    } else if (access_type == MMU_DATA_LOAD) {
          cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
+    } else {
+        cs->exception_index = RISCV_EXCP_INST_ACCESS_FAULT;
      }

      env->badaddr = addr;
-- 
2.31.1

