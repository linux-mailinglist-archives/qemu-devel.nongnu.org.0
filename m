Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7139F4ABE7B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 13:18:12 +0100 (CET)
Received: from localhost ([::1]:49092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH2yB-0003IE-4w
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 07:18:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nH2tU-0001Wx-5X; Mon, 07 Feb 2022 07:13:20 -0500
Received: from mail.ispras.ru ([83.149.199.84]:43928)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nH2tQ-0000Le-P6; Mon, 07 Feb 2022 07:13:19 -0500
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 6553140D403E;
 Mon,  7 Feb 2022 12:13:12 +0000 (UTC)
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: target/arm: cp15.dacr migration
Message-ID: <662aca02-da99-524f-d9df-cd61427ca520@ispras.ru>
Date: Mon, 7 Feb 2022 15:13:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I recently encountered a problem with cp15.dacr register.
It has _s and _ns versions. During the migration only dacr_ns is 
saved/loaded.
But both of the values are used in get_phys_addr_v5 and get_phys_addr_v6 
functions. Therefore VM behavior becomes incorrect after loading the 
vmstate.

I found that kvm_to_cpreg_id is responsible for disabling dacr_s 
migration, because it always selects ns variant.

I used the following changes to solve the problem, but I'm not sure that 
these changes do not break anything in KVM.

Can anyone give me an advice about that?


diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c6a4d50e82..d3ffef3640 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2510,11 +2510,6 @@ static inline uint32_t kvm_to_cpreg_id(uint64_t 
kvmid)
          if ((kvmid & CP_REG_SIZE_MASK) == CP_REG_SIZE_U64) {
              cpregid |= (1 << 15);
          }
-
-        /* KVM is always non-secure so add the NS flag on AArch32 register
-         * entries.
-         */
-         cpregid |= 1 << CP_REG_NS_SHIFT;
      }
      return cpregid;
  }


--
Pavel Dovgalyuk

