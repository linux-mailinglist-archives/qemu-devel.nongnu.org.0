Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41475EF67F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:27:54 +0200 (CEST)
Received: from localhost ([::1]:36688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtZx-0002e8-Gl
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrwD-0004a6-Me
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:45 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrwC-0001Fa-1P
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:45 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so601604wmb.0
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ftciCRJk7qPjoxyx1ixtcBcODABLdBXn8O/3ifVXrzE=;
 b=oKIemvRYhbku3DpOvwXFaacaIwt2j5s8nSciAs6K8TKBYT/F6wq90HwXW+9g1w8SWl
 Y2dAr6iYiX4xxp4YON6SIHiIxiypMXjF0/6uTbW4MeDMa1vmFeIaMhuJXe/4/ODXXOy+
 5mKCbGqfJXyojKCAJJWKb/5Ab9JyLFZBPbD/rFOGv9gyks93p8UVLFDHnJGmwrDgQHbf
 sAqAR9QocMV0BwSJFPZiHyuA/wB/gBJ+c9wxfZqa209Q2mTAsAN3bN6xn6mr5WsLyzvh
 tXPk6Wt4R19wdw9YPTwSGREsnmV0Pv5zFDEkn0QGQ98u3pFv+dKoyQy5cBf8IsOKQhOi
 INkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ftciCRJk7qPjoxyx1ixtcBcODABLdBXn8O/3ifVXrzE=;
 b=j/uiLQrG8M7a3peaab6r+3n8X7kQ0JC8mykGu72090EpE7Sm6AucCa74Vcnyhn6LyA
 3c/XhRoz2ifh/qKUHpqk4iaxAQIVCHBMHIbLVt6Kxgz/8qs2HKGsLh+4dUXnY81I5Srd
 ip4oARi2ZmbEqOj+hm1i5Wz+v0r+Jt/5IYzziUhPPioFeIDd/Fhmr9gGyJqSIFf8h78z
 oZICmG6pY7JBR8x7oMTdi03fWGKQLnEeZbymUCaiwi4/wev0txmZ133/NUMou2w+VWPZ
 MEV76yFmd1OPtAkYk5AEKzV5N3sZtOXPtovIKjwCP/8Izirp1FdpRjBnf4uMrwLuehSU
 7Y2w==
X-Gm-Message-State: ACrzQf3W4kj/AJ+siPtcRlwbFPd1G2bPzENwaotk9tqmnVtQ+aaGs7un
 DO66pitABQzmdzKCt340YoTeyg==
X-Google-Smtp-Source: AMsMyM7+Jh8LzIof33CL4XKXsn+DGu9IFBY1L6ZsN2octu5CCe0taf6bdvR2U6zUxFxh8r4zUfCDqA==
X-Received: by 2002:a05:600c:216:b0:3b4:874c:61e6 with SMTP id
 22-20020a05600c021600b003b4874c61e6mr10494584wmi.116.1664451762741; 
 Thu, 29 Sep 2022 04:42:42 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n43-20020a05600c502b00b003a83ca67f73sm4406718wmr.3.2022.09.29.04.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 021791FFC6;
 Thu, 29 Sep 2022 12:42:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org (open list:Virtual Open Firm...)
Subject: [PATCH  v1 15/51] vof: add distclean target
Date: Thu, 29 Sep 2022 12:41:55 +0100
Message-Id: <20220929114231.583801-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 pc-bios/vof/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
index 8809c82768..990f26af31 100644
--- a/pc-bios/vof/Makefile
+++ b/pc-bios/vof/Makefile
@@ -19,4 +19,6 @@ vof.elf: entry.o main.o ci.o bootmem.o libc.o
 clean:
 	rm -f *.o vof.bin vof.elf *~
 
-.PHONY: all clean
+distclean:
+
+.PHONY: all clean distclean
-- 
2.34.1


