Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C4D37FBFF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:00:29 +0200 (CEST)
Received: from localhost ([::1]:36886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEhI-0001c5-CT
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhENI-0002uV-H5
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhENG-00014d-V3
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5bFMY1wPkAX0kvucte6aKA1pZ+Ccdar2/PwwvnNc5vY=;
 b=GOwdpDKZCt8w68mlk2jWBTa1NBLupYS93EaMx1J6aJwjUw0prnC5HEZfnH3x647WMWJqQX
 MDAcJd94iubbTqoWz0FN2sJFa9lIXcQ2f6uwIeVyH5FjMcuJpbCenwLmJieRSaXypGW7RW
 VJ/QCq7xJa5AoPgEruZto/uF4EFb8OA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-1nPJV6mjNi2rc9op6nJj0g-1; Thu, 13 May 2021 12:39:44 -0400
X-MC-Unique: 1nPJV6mjNi2rc9op6nJj0g-1
Received: by mail-ed1-f70.google.com with SMTP id
 z12-20020aa7d40c0000b0290388179cc8bfso14863213edq.21
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5bFMY1wPkAX0kvucte6aKA1pZ+Ccdar2/PwwvnNc5vY=;
 b=rPH/t/tmptHsmf1JerhmPznexgOoFbat3dn8xXPZvxBJem2P+vHIgJZ0S1PLcGFgK3
 xC/HjfvaPrprv3Ml2jr6/vcoyO6dXI9Y3Z54+vN+ApD7qEz6iB7QqJTTeNeAojzdqA7/
 COSkDuqA0OOtFx6ZqfXrdCnLYNhW1TK547MmEZ5bbws4Jb7MZnqLhjbz/5CHVdFQczPe
 bcsKB70QkVwFPd7WsnHMyywO0V4JONCQXxm0w9TAPmn6bztXwf184MmN8KM1W4eGnYU8
 plA+9LOhvnchaoaaNynxiQJ0ickWbzRHWmdQlRWA+5YODHR97BA4/cV5YfDQlqZksj3B
 ktKw==
X-Gm-Message-State: AOAM533KaicKjtIR/R/WWOrb/bvG9ytyXq5/Gq9kw2HNaEPDlcbWj2Ox
 LxkKW9k1okLq/NAX9oHfCUcVOQtuqtHwtDc0G8xxm+jBPXTAgNy8vwGBgsbHZAkpvWRRjA8+VXa
 iGkpR6OBbo6shdbDBFDtlecDQbkpIvo0O6n++6enNBfNPU2UpSxRLnjpjGL2MBahz
X-Received: by 2002:aa7:cc98:: with SMTP id p24mr26599600edt.353.1620923983606; 
 Thu, 13 May 2021 09:39:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9Yfa+X1wXqN++Raq2r/eiE8AApNA1VgBUQC+GklA6Tu6xOGbOboIOElrzIapP3GjQzgAk9A==
X-Received: by 2002:aa7:cc98:: with SMTP id p24mr26599584edt.353.1620923983459; 
 Thu, 13 May 2021 09:39:43 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id t22sm2705341edw.29.2021.05.13.09.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 09:39:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/10] default-configs/devices: Remove implicy SEMIHOSTING
 config
Date: Thu, 13 May 2021 18:38:57 +0200
Message-Id: <20210513163858.3928976-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210513163858.3928976-1-philmd@redhat.com>
References: <20210513163858.3928976-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cmmit 56b5170c87e ("semihosting: Move ARM semihosting code to
shared directories"), added the ARM_COMPATIBLE_SEMIHOSTING symbol
which selects SEMIHOSTING.

Since the ARM/RISC-V targets select ARM_COMPATIBLE_SEMIHOSTING,
they don't need to select SEMIHOSTING manually. Simplify.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 default-configs/devices/arm-softmmu.mak     | 1 -
 default-configs/devices/riscv32-softmmu.mak | 1 -
 default-configs/devices/riscv64-softmmu.mak | 1 -
 3 files changed, 3 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 0500156a0c7..341d439de6f 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -41,6 +41,5 @@ CONFIG_MICROBIT=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/devices/riscv32-softmmu.mak
index d847bd5692e..5c9ad2590ef 100644
--- a/default-configs/devices/riscv32-softmmu.mak
+++ b/default-configs/devices/riscv32-softmmu.mak
@@ -3,7 +3,6 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
-CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
index bc69301fa4a..8a92f0a2c74 100644
--- a/default-configs/devices/riscv64-softmmu.mak
+++ b/default-configs/devices/riscv64-softmmu.mak
@@ -3,7 +3,6 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
-CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
-- 
2.26.3


