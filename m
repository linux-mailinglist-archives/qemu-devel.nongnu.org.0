Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D804C4CAA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:39:08 +0100 (CET)
Received: from localhost ([::1]:32830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeYc-0000eV-SA
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:39:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNeAd-0007Ku-ML
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:14:19 -0500
Received: from [2a00:1450:4864:20::133] (port=40620
 helo=mail-lf1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNeAb-0000TF-Jn
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:14:19 -0500
Received: by mail-lf1-x133.google.com with SMTP id b9so10525851lfv.7
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YstO8c/wi7wKCMMPFRxPRV+xcuZLJVUVOkzkg14rFYA=;
 b=dAJkRNaAUS9TBZp2cSgj5lhJNiaOCFG0aH3iV/VXgLVi2osCEYyXp4wo1/RB92svuz
 aAKtlgpz9k0ZubiU9MYVq8EOVKTgPfs0Bq7GhoJH9pT2r7ru0AChJZTpB1yYTKLmN03C
 EfTvmhdZ+KMdvKZbvtO17pTq9Z69v0D7YMVP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YstO8c/wi7wKCMMPFRxPRV+xcuZLJVUVOkzkg14rFYA=;
 b=CS4KgGg/dhihR2qIo/652QELAD2hRTnnaQWIrxmRtvgcBx7Bp14VykOg+OOLYUA5kJ
 uTS/Cnwigati359WAsiKwi+175kc2d2NSGZHv5C5ulGyJx58MOFIugNlrWLV24l+skJU
 R7NSouwYlsIEoeJ16w68N/oX6tUnRkUS/dhDnkTa4oof3hoec+D5ysrHMwYDTDNxlK15
 DE//AYJcAEn3iu7dv85EggyjYgd1D/7kpcHVm0GydCnquzTTKxaVlnIU2QfbKLmJMox/
 qI0G2EIwE1owx47qhLe+emXuA2+Dcvc8/7iy4187aSqHAq3v2alrq0P8ykwOP9gtsoSd
 I+ig==
X-Gm-Message-State: AOAM532A66OQbqDTf+Xj/b7tv2gSps1bYbLLbyKCD8WfUjvX0Wmfdf+1
 UK5PC8CSCjw3IEzq4XznCsBMEp1+Gdw5kg==
X-Google-Smtp-Source: ABdhPJzC0p9wAL55THxi2xTX7/dfzjzZkcMwFXYPhhBWr8hc/mnzMiKtKThGn6ivgtDYg/2RFkZ2QQ==
X-Received: by 2002:ac2:4ac5:0:b0:442:c5c5:14b6 with SMTP id
 m5-20020ac24ac5000000b00442c5c514b6mr5269956lfp.19.1645809255823; 
 Fri, 25 Feb 2022 09:14:15 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2a:768f:813e:378d:5c94:9b97])
 by smtp.gmail.com with ESMTPSA id
 bq5-20020a056512150500b004433c791651sm252024lfb.69.2022.02.25.09.14.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Feb 2022 09:14:15 -0800 (PST)
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
X-Google-Original-From: Vladislav Yaroshchuk
 <Vladislav.Yaroshchuk@jetbrains.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, r.bolshakov@yadro.com, eblake@redhat.com,
 phillip.ennen@gmail.com, phillip@axleos.com, akihiko.odaki@gmail.com,
 armbru@redhat.com, hsp.cat7@gmail.com, hello@adns.io, roman@roolebo.dev,
 peter.maydell@linaro.org, dirty@apple.com, f4bug@amsat.org,
 agraf@csgraf.de, kraxel@redhat.com, alex.bennee@linaro.org,
 qemu_oss@crudebyte.com,
 Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
Subject: [PATCH v15 8/8] net/vmnet: update MAINTAINERS list
Date: Fri, 25 Feb 2022 20:14:02 +0300
Message-Id: <20220225171402.64861-9-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::133
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lf1-x133.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 25 Feb 2022 12:16:18 -0500
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

Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa8adc2618..8e0fa7a2bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2730,6 +2730,11 @@ W: http://info.iet.unipi.it/~luigi/netmap/
 S: Maintained
 F: net/netmap.c
 
+Apple vmnet network backends
+M: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
+S: Maintained
+F: net/vmnet*
+
 Host Memory Backends
 M: David Hildenbrand <david@redhat.com>
 M: Igor Mammedov <imammedo@redhat.com>
-- 
2.34.1.vfs.0.0


