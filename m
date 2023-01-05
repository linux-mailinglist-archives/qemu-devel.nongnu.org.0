Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74AB65E7DD
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:32:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMS2-00012F-Lb; Thu, 05 Jan 2023 04:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMS0-0000xm-Dj
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:22:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMRy-0002wL-U4
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:22:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gf6urgZ0331uiPj/HrTkbtrhp5tMVYmuc/Q/Xm+wfIY=;
 b=Aoix99SHyM+GvWGKZgCjlDwD4ZoKbpPRffXNCzqXmyNg6MZmQJKQEUIVTtPsbd27mwq/H1
 kuKKTVdzC29IZWvQZS34/PRpoXJ3iLkzVBSn9XCNvtsihf1+knsB+iPVsCCl2AlVG/7emm
 q1bcChvSIwSbJnzIBiPy/9QecA8pbIM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-QsNLc7LmNIKMLnlyop_xyw-1; Thu, 05 Jan 2023 04:22:13 -0500
X-MC-Unique: QsNLc7LmNIKMLnlyop_xyw-1
Received: by mail-wr1-f69.google.com with SMTP id
 v4-20020adfa1c4000000b002753317406aso3920706wrv.21
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:22:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gf6urgZ0331uiPj/HrTkbtrhp5tMVYmuc/Q/Xm+wfIY=;
 b=IUDGtQNOjY5CSBegPiiyDAPEP02t3g07XdSUFQaGD0VUskn+LOaIefL1IZSagSz58o
 MH0YEdbe85MffOR3B/hlmSLe2TEA4os0FZ+jJ2kmnmt8y5usl07PlXrW+olQgVhJVzuI
 FMrgvr0BoO+quoeNN74x/+3o7mWqH+6Ap06PxcuSoWoecKa4+7ii18L9qzcWyi53bfeK
 LKFCj1920CBMCQjfYfGNYbu7FJWcyaaZKiUP7yZgTGWbUxk5nByBB8upcIrGRwBiutst
 7FqJTzKaxw+Q408YT3e/YqDL6QBtLz/tbBQqhPxDVUdbzEM8FGhNqxyAKpgLlzHuahT1
 5ssA==
X-Gm-Message-State: AFqh2kq05OAcaHyBcGoZKcjGdRG3FHjnuYl9r941lXvLcbsBaktHCk49
 nnZmrDZ+B5Dt1cRL4C2bD/QYlKlhWdKN2E+EXk9NzufLX+mGmXobdgSKwNgvSDV0sh1fS2o7GWo
 oOiyZOH7qdIcdLCZyBcyIxADTCgg16qm9PormE8XjfER4fI6+gFe1sM9bfPWN
X-Received: by 2002:adf:a51a:0:b0:272:dcae:259b with SMTP id
 i26-20020adfa51a000000b00272dcae259bmr29201312wrb.43.1672910531747; 
 Thu, 05 Jan 2023 01:22:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt84CbN9J1lPo0Fsll+Bo9ZTHwCmmlrNWODF6RASsrkljwCT3lhE2YIbaPmIaFdpFlpfdJ1Kg==
X-Received: by 2002:adf:a51a:0:b0:272:dcae:259b with SMTP id
 i26-20020adfa51a000000b00272dcae259bmr29201294wrb.43.1672910531430; 
 Thu, 05 Jan 2023 01:22:11 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 i10-20020adfdeca000000b002b6667d3adfsm43202wrn.80.2023.01.05.01.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:22:10 -0800 (PST)
Date: Thu, 5 Jan 2023 04:22:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 32/51] include/hw/pci: Include hw/pci/pci.h where needed
Message-ID: <20230105091310.263867-33-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Markus Armbruster <armbru@redhat.com>

hw/pci/pcie_sriov.h needs PCI_NUM_REGIONS.  Without the previous
commit, this would close an inclusion loop: hw/pci/pci.h used to
include hw/pci/pcie.h for PCIExpressDevice, which includes
pcie_sriov.h for PCIESriovPF, which now includes hw/pci/pci.h for
PCI_NUM_REGIONS.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221222100330.380143-7-armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pcie_sriov.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/hw/pci/pcie_sriov.h b/include/hw/pci/pcie_sriov.h
index 80f5c84e75..96cc743309 100644
--- a/include/hw/pci/pcie_sriov.h
+++ b/include/hw/pci/pcie_sriov.h
@@ -13,6 +13,8 @@
 #ifndef QEMU_PCIE_SRIOV_H
 #define QEMU_PCIE_SRIOV_H
 
+#include "hw/pci/pci.h"
+
 struct PCIESriovPF {
     uint16_t num_vfs;   /* Number of virtual functions created */
     uint8_t vf_bar_type[PCI_NUM_REGIONS];   /* Store type for each VF bar */
-- 
MST


