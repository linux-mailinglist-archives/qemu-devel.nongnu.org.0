Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01976170EE8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 04:18:45 +0100 (CET)
Received: from localhost ([::1]:53354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j79hE-0000GC-2T
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 22:18:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53078)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1j79gI-0007m1-6y
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 22:17:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1j79gH-0003DZ-4n
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 22:17:46 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:46629)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1j79gG-0003Ac-Rn; Wed, 26 Feb 2020 22:17:45 -0500
Received: by mail-lj1-x242.google.com with SMTP id w19so1557369lje.13;
 Wed, 26 Feb 2020 19:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hSejYaCs7IfHJXCU0iAn87QmN7uPaTvX4osKYJJq1xk=;
 b=ezzIEn343OXbejVpX3wulBzsw+ibzl1CS18pRis9PGLFpMExdOuzsayXKCueU5+Yl1
 GiSyrrJGztYgzNj2qwcSYYbVtWm9AYLn7TFIFqYOYQqMW3zoVd9ha5LqVC1bf1kaYCD+
 ii0cM64tboW9MxFH4mnjJw+uqEBLCB5vUMIn0x5aG44vAQO70Gf1K4CFWFDzKxNhDY9s
 p6Ykq8BQkjNOPTTgjxIWy4CjCr30ZrpEbxQEWt6H5OJxqotIhOOXzJVInKRdvWBULHq2
 D7laDF+I88CBM1lzi7Uxy/rM4FxQKv5nyiWX9yny/SlAlWvsxu6mVfTZzUljtX/Qyz97
 T1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hSejYaCs7IfHJXCU0iAn87QmN7uPaTvX4osKYJJq1xk=;
 b=VX9WV74Q/wkvKTIK/OBquNYA5EcrquMW6YRRMzGUHq5cim9QOSu8s6eEmX3OAuCOt5
 dngV35yMfwjUI8uGaz9pMtRPgEu3Qvc7ttVoQlZrY6Ij6ZSaWq9SHVYXTp2E2tC/ZSmh
 AAvA/knWXoh9I+OYD2qcAbShOrMsWm/PoZmPN1lxyqElTJgFwcDE1iD35WGMEafqZ/xC
 a6jNzmFSZ8uOmfWfaiYG5urALg89VyVapHGxY7w6BgflxEp5WZKIkaLVmlqJYD3QAhZm
 PLE7/LnzPZt5tq5Kt2qENrxigx3PqANIIWSdGUezpnz0np5Lzrky/6hIJmDAk1RyWX44
 Xjlg==
X-Gm-Message-State: ANhLgQ2zrVx15KH5S02j/7ghUepYX/wMcNQPwzkOGLxCEKeStWPgvb91
 TDiDeqkjfjtTCqSUCPsgKZ7SgLUQsRCgZw==
X-Google-Smtp-Source: ADFU+vs0k8vDLDwBJGV9xzHa+1Im+1e81v70PmamTAIcf/8f5++eRZvnS3HU1iUWSc4QWfqADH4giA==
X-Received: by 2002:a2e:9d92:: with SMTP id c18mr1400542ljj.265.1582773462465; 
 Wed, 26 Feb 2020 19:17:42 -0800 (PST)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id f9sm1895739lfp.24.2020.02.26.19.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 19:17:41 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/2] hw/arm: versal: Add the LPD zDMAs
Date: Thu, 27 Feb 2020 16:44:22 +0100
Message-Id: <20200227154424.6849-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Instantiate the Versal LPD zDMAs.

Cheers,
Edgar

Edgar E. Iglesias (2):
  hw/arm: versal: Add support for the LPD ADMAs
  hw/arm: versal: Generate xlnx-versal-virt zdma FDT nodes

 hw/arm/xlnx-versal-virt.c    | 28 ++++++++++++++++++++++++++++
 hw/arm/xlnx-versal.c         | 24 ++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h |  6 ++++++
 3 files changed, 58 insertions(+)

-- 
2.20.1


