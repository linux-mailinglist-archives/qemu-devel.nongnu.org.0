Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C8E4CD3DE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:58:39 +0100 (CET)
Received: from localhost ([::1]:49650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ6Zy-0006OJ-4v
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:58:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ6Ux-0006t0-LS
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:53:28 -0500
Received: from [2607:f8b0:4864:20::632] (port=41837
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ6Uw-0005Nl-A1
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:53:27 -0500
Received: by mail-pl1-x632.google.com with SMTP id z2so7519996plg.8
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 03:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=untwttg2h9MUzs6wtedAKndtsuh/tYZaw3CDKZL3ZkM=;
 b=y13iFTqDCatdTUdF+XvDYh1UK9pfV+FQM3QtuXniHjN4pn1U55j6eooXeIHVvmnCPh
 OETKZBvRfitwJ4a+tiCOnK2qTaaA4eUbHIzkyNu3HjrAB+tWljfALf/ICqyqPehTl0wb
 l2nfiNelK4qxcmnl7n7P0gyVisj7OOTm7NeMx0UW7wGecZsxzpbWNHxSsOckToycdh/5
 5vqHpDE/IXybg0lwkXWw4fbnTHo+WCiKqT1rFDuk6zdazACJWzyaDQ0F5COwy0MhhMZ5
 294tMh0M84wRXDcGq8BPCpQK5KVLNSRY3GU79OFCdUjdLVAbd0+rga7upPfh8/JPRUVe
 lICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=untwttg2h9MUzs6wtedAKndtsuh/tYZaw3CDKZL3ZkM=;
 b=nNIUvaCc5c7Z3TChHBg4X/dnQ0WlDnrzY7DlfV/KvIz6f2Mba8hZ8HgAJ4BIFOAb6c
 Z5x5056dGXVSXHts/Gb9c7xy2c5GzPMHC7jitI1hGBMltrKXF/OpQ5axNzgUY/GCRDm0
 s/kng4pbqjt3EanG+IKnw6WEkv+SE0b72bTxmSF5Lhs+FhKBaE+eEjpVJGE4hfT9NcHd
 KOMnhvLpIwUlsGQ1UTPh0HkuKnf/98IffreE8Su+0MgSS627kGVQsfLhERseoF8s9Jus
 twhdMmlsKDoILRwpltkWQVzMVpexiBeG8VeRn+oTzhK3AIG8LjZiSlvzvI9ls+BbqOLF
 6aFg==
X-Gm-Message-State: AOAM530x+yE85WWoPojnQo7Yv15Wo4fab64uZTe6uXQYcNBgvLccCHa5
 oe6+4kArMomgjhqgikja0uNYD+bXn20gNA==
X-Google-Smtp-Source: ABdhPJzPQGxFnQTnY9GMhg3o5emmo3dDEoM6QQ3aggN8FBnIBker3+Wkl+5isDZhSN50NANEn4cwtA==
X-Received: by 2002:a17:902:6acb:b0:150:c60:294a with SMTP id
 i11-20020a1709026acb00b001500c60294amr41129779plt.71.1646394804460; 
 Fri, 04 Mar 2022 03:53:24 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.152.50])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a056a00178700b004e1a15e7928sm6334878pfg.145.2022.03.04.03.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 03:53:24 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v5 1/3] tests/acpi: i386: allow FACP acpi table changes
Date: Fri,  4 Mar 2022 17:22:55 +0530
Message-Id: <20220304115257.1816983-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304115257.1816983-1-ani@anisinha.ca>
References: <20220304115257.1816983-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x632.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: liavalb@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liav Albani <liavalb@gmail.com>

The FACP table is going to be changed for x86/q35 machines. To be sure
the following changes are not breaking any QEMU test this change follows
step 2 from the bios-tables-test.c guide on changes that affect ACPI
tables.

Signed-off-by: Liav Albani <liavalb@gmail.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
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
2.25.1


