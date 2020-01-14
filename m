Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9022C139F86
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 03:33:14 +0100 (CET)
Received: from localhost ([::1]:58434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irC13-0002Ff-Dk
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 21:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50923)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pizhenwei@bytedance.com>) id 1irBzB-0000Jk-M2
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 21:31:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pizhenwei@bytedance.com>) id 1irBz7-0003T9-0N
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 21:31:16 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:43306)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pizhenwei@bytedance.com>)
 id 1irBz6-0003SF-RC
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 21:31:12 -0500
Received: by mail-pg1-x544.google.com with SMTP id k197so5642819pga.10
 for <qemu-devel@nongnu.org>; Mon, 13 Jan 2020 18:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dAhOey3cqiOp5/b6uTfIau2ZiRzs6yslTIYzXyRfd0c=;
 b=wtDHZD8bqB+uan+hMSBRSzUNmG9/WOmSL/yl6dPhvuBti1zXoCe5xgp5Y4y2VRfiAN
 3yn8r/NhEsXik/+nseS4mrX9c7gJ/mtQ0+N2GiqtKA1Loig2RzqHpl8ibwKhx4cBBFbn
 w7v5zKKZA1GA7Zp2HW/NgSf4pV37X8sZkM3bihlQ5nK4egT5DeiM00qmutHb3F2WcD3H
 p/l4fHPYKw5o4GzPWRnpY6LXlc+6YXpECgaRGpQkkDc5FYVNUdr0jmiORXRBM1EMuhVb
 isVnYnSbdWmEIJNAyM6MOimHPMHR09z4te3QtjjJMOqEMC7/KUXfgd4LvEG3h5UKx7H2
 vI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dAhOey3cqiOp5/b6uTfIau2ZiRzs6yslTIYzXyRfd0c=;
 b=qu2CjAEUAoNu9PkHfAbnus39Vu0kHTN9H5y0JWV4NH7zFDYvTK89SmIk/bP/V+lx7y
 WHSjKMlsQ9ksW2n+iJLygnld6hoGMvzoHisaHAi8BmaSoUuvG2L4LbCqbM45xnA/BezC
 XlRUnp+M8zd4wwp9qUi4B1LUyOrsH9rHPiElaErAfNoR5eSwyNqDaLrw+XdHrj/+OOuC
 IuadfAXPfVc39zgD+syEa08gEhy6DCGTMnPQ96iVwGNSCrQ5dl/t85kdcZLAlZpq1ukm
 5JyQIGtozGad1O5bxP4WMO3Hko4LUw930Kzjsx/B4YOL1PTasraaSbLrj6QpSvURKev1
 ShZA==
X-Gm-Message-State: APjAAAVsFWLqp51rC7skS9OIYiaBu+toS8XRvX6kIyocrT9gQGoj+cUx
 MvWCAuBwwvZENWpfGSLEtQm8fA==
X-Google-Smtp-Source: APXvYqyTOx46iWqJwrGWImeS+HJuwYGs1QC70uQuMUJKJKNiaueahhv5Pf33oMjG/10CPJPrgpMW1w==
X-Received: by 2002:a63:f743:: with SMTP id f3mr24204789pgk.28.1578969071801; 
 Mon, 13 Jan 2020 18:31:11 -0800 (PST)
Received: from libai.bytedance.net ([61.120.150.71])
 by smtp.gmail.com with ESMTPSA id w5sm14693898pgb.78.2020.01.13.18.31.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jan 2020 18:31:11 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: pbonzini@redhat.com
Subject: [PATCH 1/2] pvpanic: introduce crashloaded for pvpanic
Date: Tue, 14 Jan 2020 10:31:01 +0800
Message-Id: <20200114023102.612548-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200114023102.612548-1-pizhenwei@bytedance.com>
References: <20200114023102.612548-1-pizhenwei@bytedance.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: gregkh@linuxfoundation.org, yelu@bytedance.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>, mprivozn@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add bit 1 for pvpanic. This bit means that guest hits a panic, but
guest wants to handle error by itself. Typical case: Linux guest runs
kdump in panic. It will help us to separate the abnormal reboot from
normal operation.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 docs/specs/pvpanic.txt | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
index c7bbacc778..bdea68a430 100644
--- a/docs/specs/pvpanic.txt
+++ b/docs/specs/pvpanic.txt
@@ -16,8 +16,12 @@ pvpanic exposes a single I/O port, by default 0x505. On read, the bits
 recognized by the device are set. Software should ignore bits it doesn't
 recognize. On write, the bits not recognized by the device are ignored.
 Software should set only bits both itself and the device recognize.
-Currently, only bit 0 is recognized, setting it indicates a guest panic
-has happened.
+
+Bit Definition
+--------------
+bit 0: setting it indicates a guest panic has happened.
+bit 1: named crashloaded. setting it indicates a guest panic and run
+       kexec to handle error by guest itself.
 
 ACPI Interface
 --------------
-- 
2.11.0


