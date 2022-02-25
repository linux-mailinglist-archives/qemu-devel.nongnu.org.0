Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609C74C4C23
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:28:58 +0100 (CET)
Received: from localhost ([::1]:39708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeOn-0003sH-GG
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:28:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNdqc-0002ev-EE
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 11:53:38 -0500
Received: from [2a00:1450:4864:20::230] (port=45842
 helo=mail-lj1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNdqZ-000491-5H
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 11:53:38 -0500
Received: by mail-lj1-x230.google.com with SMTP id e2so8167001ljq.12
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 08:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YstO8c/wi7wKCMMPFRxPRV+xcuZLJVUVOkzkg14rFYA=;
 b=DM3pt+vrE1R7cScwUHdVFDFztbSlyPbCODxZarFaXV3iPKiiYIX8wUuuqEBeKuXgBp
 vCyC89tN0HhsTcrBYksSINiJesFuSRa1REojsBJJ6ToqitorC3EoX7lOgupEtVSeENUv
 so28LoK2uMpWKIY621rnuNjBoDEWQqeGclsVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YstO8c/wi7wKCMMPFRxPRV+xcuZLJVUVOkzkg14rFYA=;
 b=ohDsLmIi25guyXDXHG+lKTNhI0Qu1HNEBJNdyvbGUVxZU/7ury1D/VON/mXRNV2ZRB
 2VtFWqi5Na3iuYrSijTzD3cZflIiOPE4a4NrrNMLPD45MXM93Gjx1OH40Gk7PxQhBbFE
 groKAV/kMZJS4Md8pt9bMO1lcBoe+JQJA1KFor9z7mvzQ1cutGkBxFJyZ05ywo6nB/98
 ZUwcI4MKxHyEJkLRfG9MuH9v3cpsAP0QX7LW/5fp/KJpmiBSaIBhVAyPImh/85sAJdRu
 AvNWnnIpllFtx27Ku1FQ31q2fkClug7O8JMJuf+7Nf35VORvSapuzVZBgKAETj5St/ar
 AcxA==
X-Gm-Message-State: AOAM531itsNPPGj7swlg87myJqfw6UkfJFZRAsGddrdRG38KQGAQITeU
 SIXRLcIjjPcXs7ngcw57ZLlptt+63p+oSw==
X-Google-Smtp-Source: ABdhPJwwapkZdyKQ2bMjCAnrPMPHHUmt6gxFqoOoOE2DL3/4oPipPvHdd2M7iMoRzjO0uft2f6RxPw==
X-Received: by 2002:a2e:99d1:0:b0:244:bad9:4ab7 with SMTP id
 l17-20020a2e99d1000000b00244bad94ab7mr5896202ljj.269.1645808013415; 
 Fri, 25 Feb 2022 08:53:33 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2a:768f:813e:378d:5c94:9b97])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a2e834b000000b00246308690e2sm309683ljh.85.2022.02.25.08.53.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Feb 2022 08:53:32 -0800 (PST)
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
Subject: [PATCH v14 8/8] net/vmnet: update MAINTAINERS list
Date: Fri, 25 Feb 2022 19:52:38 +0300
Message-Id: <20220225165238.63646-9-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220225165238.63646-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220225165238.63646-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::230
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lj1-x230.google.com
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


