Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23AE618419
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:19:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcwZ-0004B1-LU; Thu, 03 Nov 2022 12:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcuj-0000vH-UD; Thu, 03 Nov 2022 12:18:01 -0400
Received: from mail-dm6nam10on2085.outbound.protection.outlook.com
 ([40.107.93.85] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcuf-00088V-Qp; Thu, 03 Nov 2022 12:17:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrMNrL8wRUhZyQaVjq0PRVC2hKF3vk93ymo3hWyD9VBzhjqxvEaBCf0v1B8Zg/CkHuJRtGJ0Th+c0HGdzM3b91N5KI0ZQP4r1XSNV9iEkZGeUf9E1r+8DxyoGkNi3XoMU9GtdtQqGbXVlsf8GoB3tECGhv7yhV9+LFIDaUaQRx9SBMIeoCePEKtx7OKCmaYaGUJynj0Fsha2yQP9w3gfLl3/54ByYEo9ekexL0HmsB3O9QthB0F3bfl3JibRzEDcSgS1UvXVVPuzQQisWvKfj9R0oIzQvnR2odwkZu/UfObDK4kOyg7uO0qer/zeO1cElEwubt9NQvo5DzR3kNd4dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5ZDCaJEj7rGphFv5mwbs/C0kTqe7TbM9xM2F0vPEKM=;
 b=EWMnPQIuVdTCdBZtpxeIMGvA3VShF0C7THvZZ/UCiLmMfvBheqIKycPYCmxm9VVp1bRdSSJpqGJivifJlRowN9lup8iV8m5CgC/IUgPWpK+crYAjQYgAqvGatZ7O6JMdk6kMqJ+V2IYzYW2Rcpah8p75m4WeFLCjAhn6GSrB7nTC3j64rjxxnWARNNLX3DT5unroE7N4FAQVzYZZsAg+BK0stYtInbOjScP1MsItzGia/fm1uwIkYo2YfwhyTVimOHrlV+r4ydU/6XMkujly/RVeAS8aSvadfXDuScazc/3eyoN43Y6O+UajQ4tqOM3UK0rO94/rxBRD0ClEgHd1IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5ZDCaJEj7rGphFv5mwbs/C0kTqe7TbM9xM2F0vPEKM=;
 b=aUlR7suKMopKmYO+4QrhAWrA3HEh2+TJsldZONw+xWi77brSIm/dLLv6Dk8GcNPwG/GFS/O+BbqHdmQ0IYxUZ6Tfd53oQM5VBAEkUNXc6D4cokwPYfJ+n/Ecf3m5xrs2nL1NEblwmVwPiSPHqzleFWeQ7/eEYf5CpnJcaNayg+/6z0d43tf6Rek7i0u/0oMWWOJmiy7lf1Z7hniN3FAxbaDo+yDDUBZdjWtC2UEnFLFi4u4UIvC/hF7q+FN5iq4Hu9fZwdik6AiZeM8E5eGIMcV0B6zxuG35Hk5L83Pz5bGPo7pQvRTEa2Io5HLndPoy1KOmB/DoEffq6Lxsq94ggA==
Received: from MW4PR04CA0132.namprd04.prod.outlook.com (2603:10b6:303:84::17)
 by DM6PR12MB4337.namprd12.prod.outlook.com (2603:10b6:5:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.21; Thu, 3 Nov
 2022 16:17:46 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::83) by MW4PR04CA0132.outlook.office365.com
 (2603:10b6:303:84::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 16:17:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 16:17:46 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 09:17:30 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 09:17:30 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport;
 Thu, 3 Nov 2022 09:17:23 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, "Ilya
 Leoshkevich" <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan
 Quintela" <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Kunkun Jiang
 <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v3 08/17] migration/qemu-file: Add qemu_file_get_to_fd()
Date: Thu, 3 Nov 2022 18:16:11 +0200
Message-ID: <20221103161620.13120-9-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221103161620.13120-1-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT011:EE_|DM6PR12MB4337:EE_
X-MS-Office365-Filtering-Correlation-Id: f1775c3c-19c1-4a09-59dd-08dabdb6f1ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dTMS6XWAUdNZa/b5aKyd9qy3xJpA26bEFz6UVhhrI3coQhdOlgbazjYsm5Qypria2KTEkYn6GV0MfN4I5sh8TyFjFXckX6+SraEtSlndQYwYf6uAEvI5zWA+2v5+XpQ02/R33KN+vtVn+UIfFffdLGBdA5AdT67qtYqoUGJVpjmyq0Tth99Yu19yCVvKiLGwcYEpUG+oyrKtO+j6KOwvlyQojEgsuAog2HnRFBa3XPdghEgt1zy8cxo09ub8CLCWryG5AzIEjmSNA90tjnVsHL2vGtGnI/cFiuBgu86hmDtOFVXsDAcQoLMQR11OBGJR9ZZ+HRUjmGiQRyGomnHL6/AwsM5Pova5CHzsg1Bo8g7NlYR8EPDveKCIMU0Mp9klLvISZmqIGXaGVEfQTmAbY8h+kl0tR0bgTtbTRVJHzGr3nBMI/acEj7rNDppJIlRUQvj2Clbwg9qLgQF+8AHNthdezS9Wg2dKuUAL+Kd/V6MCNRDY0syJO2MANMv/kKWMEcG04hmrwwdPImEoDRz8Ioa6BaB06h7xaxqFzFADDzLhteqmjd8L8J/xSrQ5uvxzTZcZD7xDiWfzrQhRMFJFRhZBkn6O1/FK7P37g6GGBtbyDLmj76Aa3jAJVmAIoDv0butKvXn/0Ihvpe5RP65ft+uHSyVOAYr8HS6Eq91hWWCrFTiR1wGyAC3mncnxG+MB43jd5pSt8L2RxaNTelkrxDYnzQgntGjE4laefvNxWoMpixgxklCHsGFnmH7PkruDI3iEVJIKgGD8gQkO1Ny2WA==
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(426003)(83380400001)(47076005)(6666004)(70586007)(478600001)(40480700001)(2906002)(356005)(7696005)(82740400003)(36756003)(7636003)(40460700003)(36860700001)(336012)(186003)(26005)(2616005)(1076003)(316002)(82310400005)(86362001)(8676002)(4326008)(70206006)(41300700001)(5660300002)(6916009)(7416002)(54906003)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:17:46.3676 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1775c3c-19c1-4a09-59dd-08dabdb6f1ca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4337
Received-SPF: softfail client-ip=40.107.93.85; envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add new function qemu_file_get_to_fd() that allows reading data from
QEMUFile and writing it straight into a given fd.

This will be used later in VFIO migration code.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 migration/qemu-file.c | 34 ++++++++++++++++++++++++++++++++++
 migration/qemu-file.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 4f400c2e52..58cb0cd608 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -919,3 +919,37 @@ QIOChannel *qemu_file_get_ioc(QEMUFile *file)
 {
     return file->ioc;
 }
+
+/*
+ * Read size bytes from QEMUFile f and write them to fd.
+ */
+int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size)
+{
+    while (size) {
+        size_t pending = f->buf_size - f->buf_index;
+        ssize_t rc;
+
+        if (!pending) {
+            rc = qemu_fill_buffer(f);
+            if (rc < 0) {
+                return rc;
+            }
+            if (rc == 0) {
+                return -1;
+            }
+            continue;
+        }
+
+        rc = write(fd, f->buf + f->buf_index, MIN(pending, size));
+        if (rc < 0) {
+            return rc;
+        }
+        if (rc == 0) {
+            return -1;
+        }
+        f->buf_index += rc;
+        size -= rc;
+    }
+
+    return 0;
+}
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index fa13d04d78..9d0155a2a1 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -148,6 +148,7 @@ int qemu_file_shutdown(QEMUFile *f);
 QEMUFile *qemu_file_get_return_path(QEMUFile *f);
 void qemu_fflush(QEMUFile *f);
 void qemu_file_set_blocking(QEMUFile *f, bool block);
+int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size);
 
 void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
 void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
-- 
2.21.3


