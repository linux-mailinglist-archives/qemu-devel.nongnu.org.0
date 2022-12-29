Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4BA6590CE
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 20:17:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAyHE-0006iR-SP; Thu, 29 Dec 2022 14:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pAyHC-0006hc-Tj
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:09:14 -0500
Received: from mail-db3eur04on2132.outbound.protection.outlook.com
 ([40.107.6.132] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pAyHB-00075d-G7
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:09:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GD+GyhflaAgaaoT1PeRqQQsx2t6AbmINw1oD5WtTKmj0Iqox+00eWb705hrix1cUBri8wC/OBFQTrbfYYIIk/dIdI6TwC4hd0BWLWI720Xzn9xIyBku8rIrOOnl8vAvXc5LfYCel6TAzBPrm6fjzMwkStwGBG+0yWSLX0jc8PJIp4MHScotZNOrSMyPKeYjZS0t4r8v9Y9h7dEzqHFsGNEseevairI6hTZTrlcEqPGAyNmEuzki3sEb8jViQkOU6OBMD5BnXecIfECogPtaEy4l7zCo77A+xGwIy1og/tMkw+PU+bB+P4U+D2mP2SklfHH6s2AOs6/vuk4I+S5EbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0m0cZlcwSjHifBQEmyr0hOm1owh50NOZ8QSDtUMOQE=;
 b=Oto2QqbosKFcNt7YIb+QdtWda7O0+3x+MkavO97CN525cflmmsxzQJe/9gRyZTo256bKnkbp7MYCuUUfLZEnfSiRQ7P5ML8JoDahraISHSHOpePedFePwDVrgUXX79+em5IHojDe73XRHM+frBRiT0TgDNfEk1XHXhD7CdzE1to7QBlUd/2jeNmGQO6tNC16BsRU7ZKvXsT2k60yjrq1ex8evpGye0H67b5ZWFVYEEwNMgz7lS1Ly/CscCu1nW9cNLea3p2EJwNsKzRjWwRT9OEmHm4D6HhQ139ZPIx3c/bt9AKbkl3c/JtnMvd8b+/Atscz+KcHK6+0tqGn8G9wjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0m0cZlcwSjHifBQEmyr0hOm1owh50NOZ8QSDtUMOQE=;
 b=F1xTkKKNDLmtNxfGLCgIpxAxtoIoc9f2RhuITyx+24ObgWQerKLnaEC/bPIHwDd6wdZZOK9xZiDeLFfQ10iaqA3JSnRRrKJ1QkcQp38YE/ojgV2LMUsq2+aLvXeMgfAR1hKkFZyUnLpOtrZKft1NT6gCcunyQCAJTt8N3/1vwD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PR3P189MB1049.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.17; Thu, 29 Dec
 2022 19:08:38 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%4]) with mapi id 15.20.5966.017; Thu, 29 Dec 2022
 19:08:38 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v2 1/6] pcie: add helper function to get number of VFs
Date: Thu, 29 Dec 2022 20:08:12 +0100
Message-Id: <20221229190817.25500-2-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229190817.25500-1-sriram.yagnaraman@est.tech>
References: <20221229190817.25500-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0070.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::25) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PR3P189MB1049:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e2dc4e0-9b76-432a-f949-08dae9d0170d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iVAZ8IacdYMNWr2gK8J+GDtgiOH7yiDVxqRNghKfeEmTPVFlcZWDsIE1sRqzLW+2G1A4tH7Jq7/cLR2jVvPfoo/IBM5JfqLcCzEy8w6x3xzDBy22kymxpVNllA5nGLNBS4lLIpQDz6x0wHYZTArV/Gnw9MUhQ0OSbgqkrfON+PhzAfUvnZFruZhPgaz4+WUXTj3mh8WRbCsNSnCXFJhbqkg6irp4rO+HulNLNssvcfyZwX6HRzk48nTUBcn4Cra6og8Ei+PKlRKIASDVDIBjOzWziSgms3jJB0/he7kLSVYnsDj+aCL3+iGNLJfQpcpmOQ3w/gMSO0K4gO2LtcOvYhJUXmJKKKg3+610l821eyz2fcDTeSpNScmMyfZAKg2WJkx+nrd9qxeOAs1+YIwUQXhOk2Jhu+40HkkZvLnObROSbTvtzp+idA/HW69lTmucn2EhP2kK8RwqJHy+Azmbh+V8mmo6ftPjzaWe61GMOuYCayucaGfBInUgdTjfDbRVAGGQWMVV/9I0CG+sZuHCh6/lowB6KjxN6EUzCEhUSCGt3d3jUWwB4CdtnY1VbMm8c/ilJgDkULMKsFZTnc1Arpgg2r8Sl+F4DEDHFgqc2LMKUwMmaSYpEW2TSgmEkVyiiEkT2zXTpFqjwtCxgeJQjd1AlcrdBxadERpCfYlgU0BnJ+zK7lvRybB+MN9yGdTE5/gBkm1qT+ecAMw97KuCDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(39830400003)(346002)(376002)(396003)(136003)(451199015)(6512007)(36756003)(186003)(110136005)(26005)(316002)(66476007)(5660300002)(4744005)(44832011)(2616005)(70586007)(66946007)(66556008)(38100700002)(4326008)(1076003)(8676002)(2906002)(6486002)(8936002)(86362001)(478600001)(41300700001)(6666004)(6506007)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6LOJLg9odis3mCNbcOVJYxDgu8op/33qV6oWPuTKaI+KPw9xl76v1IhvcocD?=
 =?us-ascii?Q?B69TGZRMcb3SUlQ1Wo+AxMCcJSQtBUQXGxVZdzVuOigNMBQeKnpFzd8WDh5U?=
 =?us-ascii?Q?8NqyboKb0m7fPBG4wbAf7bnQr9FYzubHz94RILOfKoQmylfF2ECIF4QFjPqN?=
 =?us-ascii?Q?7t170wruL2m9d5Jxtn2MzPF7N/okuEa33XXWFS5kt5OjJTfQ26uwcsYSOYA8?=
 =?us-ascii?Q?aASwsUlQkDh6pQr17EkKeax68myzWeRU7G3CPyUGOIcCPR74wXZTNvqA214N?=
 =?us-ascii?Q?50K51PXQR+g/D/clVn3MgSlHqaJam4yegyKjm5siTuvJ0iV1rH194FDFAcan?=
 =?us-ascii?Q?gRc+I1XqGrL16xTzCNAAJqDtUb6iqZwFoC4YlCoFsHojhgKUbv/hoBHgPDCy?=
 =?us-ascii?Q?8tj0cAZLeKxoltcRPNpv3Bom9LWcfoAq/cfJp681SNZr410eH2Q6xNhMxiLm?=
 =?us-ascii?Q?ly9ZeTYXgGuENk2XzXcciKVde0FaC4PaKD03Ke7Xih9sktWsDvv9xI9gcHVA?=
 =?us-ascii?Q?kFCjF5ZLh6yHTHT3Nim5YhKvxeImpgOHFp7l4Yb+EoHUVHa3s2Ntywb6GSpH?=
 =?us-ascii?Q?IgKRQFUFnfuvf2xVjw4F5FrUtrns4zG/kgSv+o8B8tiXfsQC3Sv0K5CdN/xs?=
 =?us-ascii?Q?0sSJ1YjKlhPuh0iCKqnLpEbPYpotHp/qz7TIgshAFQXTp0ElVOVh78LlGXth?=
 =?us-ascii?Q?N/ChcIxYhGQjawuocGjWO2FZdv1vL7UPkIhc1ZBufM7Lmb81fpPaElf5rDZ9?=
 =?us-ascii?Q?tHHCu+3OsiVHe1fa6eOC7Qa6stejaYITYM42YymY8yv8S9aqGV5qKz8VlPkC?=
 =?us-ascii?Q?mOirjzS+NN/X/KSiMlTvFSf2FFE7sivjDlpTwFylwmDJQTouDxuvuzXSCBtk?=
 =?us-ascii?Q?ARs6exclQI2mx1PJrbsjSZK431jsdfGQpit62FhAyuI8TSTZ3OnxSfj3XpN7?=
 =?us-ascii?Q?2FgundYGo+9Nx7jasLCpjQGWEFR3XVVDD4ZHOkIV3RYlTU/hH2eSecy2o3PJ?=
 =?us-ascii?Q?5siX8dIpJvEne/m3deedySomE6ByRAJ764cIMLJjyzZA7iPuShaZf9KC9Hdn?=
 =?us-ascii?Q?Q/82O6tmpbthuDLwBg8fnXHJqcG0z4mcmz6wvljn0g3Awg8XFSw4LdfXrRfO?=
 =?us-ascii?Q?Sd4y1zDy6LSy+WOn8l8VxObZjKoaDkCJ0N13iIfgLtpDR6Lso+rBMURl2P9D?=
 =?us-ascii?Q?TyzgpculCq/sy4tB+/+z9V5zJvkr3YzYNQhiw4rI/M9BM59kIQQMfjIOHUii?=
 =?us-ascii?Q?3fjltQW/wFc6bOC0XUdDgMkz3bs4O0AakH3dH+LI0f/e4zRq2VhHEUz7PHkr?=
 =?us-ascii?Q?ABJAKGAumfoqtq9E1Jav46m0Nqohx2bqnV96+MuQ/dHF7U3+Iy1vOe/g1BUi?=
 =?us-ascii?Q?BFAwX/adVrHRn04ZffYiXE3hZPbp9V8F7emG/TUCaB1WGFHYQdpeW19WKgO9?=
 =?us-ascii?Q?Wydmm5iCs9+BartJQ/Gej4McB/jzRLQ/+ZVWwlygbP36I9KsD37d40UYEMIB?=
 =?us-ascii?Q?G9daWZDkssNN0PyR+wcZGQpLHo856/buHkzEpwus94iRH5+I0yFfTYgV8xDV?=
 =?us-ascii?Q?T9TVmLCAf2m3S3OOAZ1r07BaqQW2DC84MFfsz5w6jWcTVTJQ2wkekd2+dG3u?=
 =?us-ascii?Q?lg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2dc4e0-9b76-432a-f949-08dae9d0170d
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2022 19:08:38.0466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4gL+DgZ5MFk1hHlJwTLOZFmrs3DDJ6oBipX8+eewGzrVOzj84JPJ7ekEMMnp9PiGjQ0HWzgJG6mnJHi7uZftYzkYceNvawuz8vKNFSv4uU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1049
Received-SPF: pass client-ip=40.107.6.132;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/pci/pcie_sriov.c         | 6 ++++++
 include/hw/pci/pcie_sriov.h | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
index 8e3faf1f59..88ba642a20 100644
--- a/hw/pci/pcie_sriov.c
+++ b/hw/pci/pcie_sriov.c
@@ -300,3 +300,9 @@ PCIDevice *pcie_sriov_get_vf_at_index(PCIDevice *dev, int n)
     }
     return NULL;
 }
+
+int pcie_sriov_get_num_vfs(PCIDevice *dev)
+{
+    assert(!pci_is_vf(dev));
+    return dev->exp.sriov_pf.num_vfs;
+}
diff --git a/include/hw/pci/pcie_sriov.h b/include/hw/pci/pcie_sriov.h
index 80f5c84e75..8e9367a03a 100644
--- a/include/hw/pci/pcie_sriov.h
+++ b/include/hw/pci/pcie_sriov.h
@@ -74,4 +74,9 @@ PCIDevice *pcie_sriov_get_pf(PCIDevice *dev);
  */
 PCIDevice *pcie_sriov_get_vf_at_index(PCIDevice *dev, int n);
 
+/*
+ * Get the number of VFs created for this physical function.
+ */
+int pcie_sriov_get_num_vfs(PCIDevice *dev);
+
 #endif /* QEMU_PCIE_SRIOV_H */
-- 
2.34.1


