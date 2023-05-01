Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED8F6F31C5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 16:03:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptU6v-00052D-3j; Mon, 01 May 2023 10:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptU6f-0004ke-1i
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:02:22 -0400
Received: from mail-dm6nam10on20606.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::606]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptU6d-0006dp-2t
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:02:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0UEIZLBqilG84roc74jwGpvPUR3NNEsSWjtwkp0Hzmha843N/qkKWKv2BB9Ot9bok2rPA5m9I02CLkTzrUGUExt2dJ+6YvDrgydUYLYbB5skLbHu9UPSAB2VTLg1am9GALcR6xAUfebaktfIPsY/VQDaq6Lhvbrpr2fMa2FliVQGwP/D0BPUBOngB4uulqpQgdN76JLqC5asIoMNgUN/ZaXOVOyhddAFD4gd/ZJeuWTmP9cN8WThm2pieJCu/ZLSfv1lz5FQse9+8BUd7MahqxMUiGPwhW1Ft5cLWvulimopp9n2ktTDKd1h/j0X8bChc6hFaEXY6jdXeFO0eMNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1GiRRZFWNAqz0aOicqY70qhCawjtdnOioRW4j5drN4=;
 b=HrA8n6EktpstAl2HSlwL2loqdobl8JtG1eh0Ftovrd+eqjKRVbJzDNVMBXjPBmddfk3nsAZDDi4vaM/isBIxMjayqdm5Qbpqo8izTa5s6OJrcc/j8jAN+YjaB8o+IC38drD0WCCtNKM6EDvFrDFJ3u/88jo47Nn06GgmQqDMPcJ7xEt43eeMKbYqSiTqkKP94NnCAwyG7GjbsqMNstplT41ex83b6+M7xntUbTzUSxzzlUZ2edhhIUV9teIGJlGclIMIhpghZywoflrVMzsxrroo+v1veJRcNqZPclh1tJfbbExCJ+zfYgbepsAo17Lf+JEvo0PjcvFMPsRTm2q0sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1GiRRZFWNAqz0aOicqY70qhCawjtdnOioRW4j5drN4=;
 b=r+XYXSanN7C3Sv3zTfmU9uwkvvpPZ5QFe9qUIidGej6T7AhaUKqZ6L93MwCV/gKFjN8pbPm7zacYXE5586Xy6XZ+Jz0VGJIq1HKJKRCdmNPrxAC0yVTgSzqr6g21ahSPxlcWHDL7XAmirxBE/+ZbYhC5XERkaYzJcDtqWLZHBBH82p2YKGa3c8XGO9cwxxBVmVvIUHkhp5AQdrydu/uxxocLniGzL47olfFCM2bxiJa9OARxtVMlyrBgqCzYFe1QjHDILQh/0E3PU4fBJrdharbFeRPvt/7LI2Sw4Ypi8QfpjuNhf/Ljvi6xj0358CngYcZ+Zba7hJ7wHOUOUVeXng==
Received: from DM6PR08CA0060.namprd08.prod.outlook.com (2603:10b6:5:1e0::34)
 by SN7PR12MB7786.namprd12.prod.outlook.com (2603:10b6:806:349::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 14:02:14 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::e3) by DM6PR08CA0060.outlook.office365.com
 (2603:10b6:5:1e0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Mon, 1 May 2023 14:02:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.20 via Frontend Transport; Mon, 1 May 2023 14:02:14 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 1 May 2023
 07:02:06 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 1 May 2023
 07:02:06 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Mon, 1 May
 2023 07:02:01 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: [PATCH 4/8] migration: Enable precopy initial data capability
Date: Mon, 1 May 2023 17:01:37 +0300
Message-ID: <20230501140141.11743-5-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230501140141.11743-1-avihaih@nvidia.com>
References: <20230501140141.11743-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT029:EE_|SN7PR12MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 78b0daa7-d662-42ac-ba95-08db4a4caabe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OyaITLCJJLvBvdvvCPAI9JHYzqqAkPzhpKXU5jrSyAkmG/+jl9ZO+MFcjfEmA33HdylwbrE+zxgLiFhtbcjQbAxIANMtlmS+krKzNeuD2Z2rjYePUiJtheZfDDZtAzwjyiFXhRuSzaMQnR5csKRSxhCnIv48iXx+X/KJwJoUS0KwI3DjhnFw02yipnoJ+SrnoOrmg9A1vEsgJsdLNVKCmK0IN6JTnPd0oft8qLIgv+WT85IZ6RxKsXUmjETLy6f1X1AJtbSX/5FTW8ip0DGZJtaFoQFeJCj7VE5ihBTHYg2b1uqYPz0xpSQRWMku3NlUXTccFDL27tnTi/ksSX777vKGtGenIAeHgaMWUdVpabYaUKWa5x2VHGD6DNpRUHFIYK9VR7t9g7KfSLZkvOvmrclStyeTMDMuxJ6s3z8LfVll0UK5ZMdWMyPfovJXeYuTm0GrfgpcXqNG/94yGZjF9RIkQdUcBFjJ4Y/rFfN1ObdfXkg+TDRePVWpI/JtwilMWacx8NaCcoKKbnLQQO8at6QO5UtRt22jCaN6jeBINsf/HEQCeSDkrYUjDryRWY5YKZSDVsJcrcLIVIT+1A0sgklIlPRfLn/XQlDfzSHsmm7sqEKsHiaybHnvyUuUsDSk8skCPies/hqYhRxtqQR6savIyu98eWlTn9a0y3HoKrdFQJgoKA0NxO1L/eDkWWjAefDUASPPiRwWP1mAOfiUgw==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199021)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(316002)(1076003)(82310400005)(26005)(2616005)(41300700001)(336012)(426003)(47076005)(83380400001)(36860700001)(478600001)(186003)(70206006)(70586007)(54906003)(7696005)(6666004)(4326008)(6916009)(4744005)(82740400003)(7636003)(356005)(2906002)(36756003)(5660300002)(86362001)(7416002)(8936002)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 14:02:14.4091 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b0daa7-d662-42ac-ba95-08db4a4caabe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7786
Received-SPF: softfail client-ip=2a01:111:f400:7e88::606;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Now that precopy initial data logic has been implemented, enable the
capability.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 migration/options.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/migration/options.c b/migration/options.c
index c4ef0c60c7..77a570f866 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -560,10 +560,6 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
             error_setg(errp, "Precopy initial data requires return path");
             return false;
         }
-
-        /* Disable this capability until it's implemented */
-        error_setg(errp, "Precopy initial data is not implemented yet");
-        return false;
     }
 
     return true;
-- 
2.26.3


