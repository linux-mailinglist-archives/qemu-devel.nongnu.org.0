Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A674C543C
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 07:33:29 +0100 (CET)
Received: from localhost ([::1]:55772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNqe0-000486-VU
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 01:33:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nNqbo-00025R-Q5
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 01:31:14 -0500
Received: from [2a00:1450:4864:20::431] (port=42935
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nNqbm-0006T3-77
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 01:31:12 -0500
Received: by mail-wr1-x431.google.com with SMTP id d17so7432141wrc.9
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 22:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KnYql3OH7CHGuzhamKtAe9R5fsZj0EkHsVE9D5HsbSY=;
 b=JLyv6Vtc2ezlwgkOy+t+gzGOc/C7uYfeyqhvZKNUwFKZxNtNW+u7A3o0LM5HXj49ew
 qexLYX1D7MkHGEwdlbWHC3FSFArcMuWIUhiqrmPOtk4tt7W2ylgdVptRn+Rsw9DbgA6I
 lAcDZtWNiGrNyU2+3pTsEtS1Wr/g7ZJL2giYAbfCUoUYsWRbBJHeRKazhW+FxAP2F9Bn
 B89UwZ2sReTRns09aDosIXgJxeH0OvmbDP/l6MCa8BLs4g1QJbPSUWWlJpJRAQbp+VAA
 0zipTklbkJlIABxPNJcy0x25KWKZZEmUTOxQtmbE28PdZdBcs1/apFIkDV7joeyul3dH
 6Gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KnYql3OH7CHGuzhamKtAe9R5fsZj0EkHsVE9D5HsbSY=;
 b=0MeDykUAPBg3/MjtOuqcmht4Nb95Sf2WEmi+h2fEDwoy6V0Z1v2f4s09WUubjR8XR5
 uaM6+HB/6psOCHhtOZCaQKsDEjAYEe8BIUTPn5OoAw3gPF4j2ohmm5MsD5ul9xbMTW7t
 4HOz/TIL0ketgSTsVfvFWk5ERMbmM1wubfWcZ2+FYHSHVQKocGbZKZLh8Y8xl/SLAgI/
 1dmKNZl1ZxApKbNQYUkm8vt7qg5XPrWHed9yvhA67/0xvRrHyytKvfz7cEYmASlT3hE1
 RXrNtmXrj8tj1aZH8jONnOFbdxg/nfbkWrk+7B2tlh7ZnYZtbMFglmfSjHONJi/GPeNo
 2dGw==
X-Gm-Message-State: AOAM533oRql8UKVwMryPEgD2Q2kN6We79+GLRo1U/r9PmFtWRduBWQVf
 ayDC9PIjIeYiJKN0RugacToOisrPgKQ=
X-Google-Smtp-Source: ABdhPJxz3NPSydGgquyn7Q1y/Fl/BjbJiakyXY+6CtzPbONWWxS6N+FeOpRUM02cdugZtwRzQ7zXDg==
X-Received: by 2002:adf:cd8f:0:b0:1ed:af02:2295 with SMTP id
 q15-20020adfcd8f000000b001edaf022295mr8423625wrj.226.1645857068640; 
 Fri, 25 Feb 2022 22:31:08 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800b:ea29:1:266:a58e:9f87:7014])
 by smtp.gmail.com with ESMTPSA id
 q7-20020adfcd87000000b001e8a4f58a8csm3933407wrj.66.2022.02.25.22.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 22:31:08 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] tests/acpi: i386: allow FACP acpi table changes
Date: Sat, 26 Feb 2022 08:30:17 +0200
Message-Id: <20220226063019.1112654-3-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220226063019.1112654-1-liavalb@gmail.com>
References: <20220226063019.1112654-1-liavalb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, imammedo@redhat.com, Liav Albani <liavalb@gmail.com>,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The FACP table is going to be changed for x86/q35 machines. To be sure
the following changes are not breaking any QEMU test this change follows
step 2 from the bios-tables-test.c guide on changes that affect ACPI
tables.

Signed-off-by: Liav Albani <liavalb@gmail.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..7570e39369 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/FACP",
+"tests/data/acpi/q35/FACP.nosmm",
+"tests/data/acpi/q35/FACP.slic",
+"tests/data/acpi/q35/FACP.xapic",
-- 
2.35.1


