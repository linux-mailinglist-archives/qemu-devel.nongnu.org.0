Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CEC67FB06
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 21:55:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLsEQ-0003om-Vb; Sat, 28 Jan 2023 15:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLsEP-0003oP-A5
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:55:25 -0500
Received: from mail-db8eur05hn2211.outbound.protection.outlook.com
 ([52.100.20.211] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLsEN-00062E-Oi
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:55:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ne/sbjIU6nID3ooUJc8keIh9yDXoNt71Zv537uqfKSxCqhsFbciXRIYt6KwHjrm6DXURJLwA1vFv9DobLFDZTQb56OIbBpSTaW7dymf/0TT1c6KikkGutHPGrKubwJDDapXNkmcIBNxT0vaK+RfLLM3Iq6jkgkyTbsRELFVbtDkrfwxmzV74KqmvprOrJIs9E4dfRtEscroVYES8esD8XCmotW9YfRw0h4yUrFp32BQtOjz/65UPsCT9mF74DzXiueApcR8CKSt/Glkxz71ukE0enGVNLHL5fU6CAn3eQmphEq3+t3iMaWo2jfJ+lV6L6um1IyR0DbI2tp7sCc+sAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUZfMjtgU6ZQw9MsWLWz1QLw4h/ZiYXkx3n1mIiAzFc=;
 b=VRAFnWkqf/UBsr/Ufv6vrZ8lXxuGWXMm+AUYTM57fKlfcHJMka2W/6uBSl4Hhl/Zz8tpkp3Xb6wTidsr86Xu6WRKIGvnRovLOXTv2lHvHwaU96qGr7ANd9ifKDzBRLKRJ69t9fZH+8kFGvOEXZg2A4Q8cGnL9VVLI2W+Zacrw3bU5fa1OKLZKPv8BJH8T4yYRPfuo9x+ENtJpBwercJxtPTDidrcFOhs4IG86Kf/sJ38bOE408+9q+AbuMKNe7YRoVkgDRADth3pLT1PCMUbkODINSqhLQRbVjqXYpsHbwlm8vOx0ZXbArWBhHRmICLLGVtpuHDbIc+Ap03A9m99eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUZfMjtgU6ZQw9MsWLWz1QLw4h/ZiYXkx3n1mIiAzFc=;
 b=fg+OWT7OsX1fawwyaZiP1sAt9S+OstzVCu/jVPZ/ng1RSG7ZCNCWKRcW4zKq1dQegP+fwOC9C/x79bD/ePm4yvE4GisIabPcZ5lxYo8Nak9r4pG+7fBmcHyWFOCH6mlYIYuUamsdQDjGRsE6S9EGmM46rIgFBKqkFtItLqOIXJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AM7P189MB0661.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Sat, 28 Jan
 2023 20:50:19 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.030; Sat, 28 Jan 2023
 20:50:18 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 0/9] igb: add missing feature set from
Date: Sat, 28 Jan 2023 14:46:24 +0100
Message-Id: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0045.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::14) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AM7P189MB0661:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd70539-dffe-438e-3439-08db017143c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: foi1fBgR1L2CA+FY7nFN7rB1CBRtnfKV7o5vV8O65m5vaauHY67hZgdRlt1pqEvvZKJf2o9gUxf041PAjugb55zpZOeWQdjjmmAA/elG6YB6gqi7ZLSJK2j5LqnxELpM5B7oVpOWdDggEVoy1VE3hZ8nbyfbzjurMmL/0vHAiFEbY4crGC5wEwdDe9xFyxySd7uXKoF++nyrEjQNuMuUmzmbzP3Oj/zH3xD1XEcG7496qSJ7bGy07zFpQbhC53j/fmhw0v8w+o8VVfV/1voyG/x3BQqeRwOO91aqTkKhePXSYW0XZJTAc/69pnw+dG113qy4w93/KeQMo4MFz8f3JRBvxOWK2u6j7oFSeZzS+TJZswSro/zi3zinkRqlc1TRj4lWa8ZzCozOsQCTXThbzqmCXSpJLwkBI/1xU1OpTQb/xkVcFsUU+DCuvhHWdCH06YrcqVnjGzFCEFCHe779Be99dZ+nQyjTTE0ZHLhOvgabPIhMEjjEoPfXMcuJ9ornJVXf5//f18UBDQaRcy4tXw3D/ZGJCfqg1+6S4vy17M5Ndhylx4NvP8PTDuemL/DBm1iiLqZ+twWz2rfLP98ndvg6zpLo7uTLs/GTdIiL/HbhIH5vHDwvJazshquVxFeXFdeRu8pFG3SSV4DOosDUZgb5nVvYk6CICGXV+289j7rdxh1fHg6eWYL1g82BodKGW9CJ66COscZv0qbnnFH0Qyn3L+PDNV7xkGys1NuBJB8O75fXC75byBXdnXOdMVmW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(396003)(346002)(376002)(136003)(34036004)(109986016)(451199018)(8936002)(41300700001)(86362001)(2616005)(83380400001)(810100004)(38100700002)(41320700001)(316002)(8676002)(54906003)(36756003)(4326008)(66556008)(66476007)(70586007)(66946007)(1076003)(6506007)(6666004)(6512007)(26005)(186003)(6486002)(508600001)(966005)(44832011)(2906002)(4744005)(5660300002)(266003)(37730700002);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tv8t+Fb0dlu4lNfFzoN6ZYpYtZm0R42Va9Djx1+2Ku10gkJjmTtCZQqUdGHv?=
 =?us-ascii?Q?7Qqo/VFv0s5iHMwbrfGN/CccPFAie1m2fVm836S7kdZrM9gXFmRIQv12xj7h?=
 =?us-ascii?Q?Z6o1cgRfg1jleohx1v5IYsNLgalhiCqJvkobyLq+I9FbUhQsG5VVq6GW/ioV?=
 =?us-ascii?Q?fudGNEj2Lr25HZcm2C9yHC3gbh5zxvH5vzhxLHO+ksPFpTZ8mwQpK+DJM6RF?=
 =?us-ascii?Q?LPT3NcTW3n8V6PkjeJ8dVCebS03rTf2HT1MG6GHRnHIRs6+zzcZLRMaF9dyq?=
 =?us-ascii?Q?8uzRVoXhCCInYQOrkcefjqFXXEo2RMpLBD9M5K/kELDQqaB64CHMX7tNIumN?=
 =?us-ascii?Q?uoTbmk0XFq469U5odvwRh3xyrT6T7xicMLhN3XR7ZuV7S4i3VamSeoSwXhRo?=
 =?us-ascii?Q?ytjzkn+S9L5YMpjgKMZRxiSTGMk3GmIN2GQ2faHF3iswgHJ+Bm+zA9pv26Dd?=
 =?us-ascii?Q?1xlQ6wftyNp9hK9s45AEnYLX4E9wuywplmuuRb7DcrVJIKgC7hXKe+JlhQGq?=
 =?us-ascii?Q?1b3qLjwHiOSbqYbw0ulSBTsmkCVuYzKBRXuxvaUHWUIvm0FEOTz6pik2eKbm?=
 =?us-ascii?Q?qZfaHrebftOAcXxpQlKdjsonicBzQPGRXTOzzw+m7uIGAadMe0wpyZ/gwxSd?=
 =?us-ascii?Q?fAov3XB89uNHE180oyoR06AWieGrSSE2O3T0y+P7axCEuUfdNT4/xl9owcip?=
 =?us-ascii?Q?GPz+uG6c11bT12E4ulXE+zLsM4DngvH3bEvH5KJQ9+BSfNmU8UAhtETVTjxH?=
 =?us-ascii?Q?QS1+CBi2end0piHIA5XkTwULuUPDX6jijChO1IuY8V5zXtiHT47rDL3nlD3R?=
 =?us-ascii?Q?+X8YwymB9YyWA5LsK7JOhxRzFq0D3hVBxEzJRVYVKS9b4ho8AbcJ8v1l0mZo?=
 =?us-ascii?Q?5UcDluVWuY/sJ7qkxdM/iZqmEQr/U/etHwt5Cku3uRdAN0fd5Z6BrQbR1gEQ?=
 =?us-ascii?Q?8vfGIMh3zKL+OyPei0R+Stt354Obg449bmpC+rrTRo9mVF2zf2eaScyVcloV?=
 =?us-ascii?Q?vV6YPf7x7VDt9DSCG3dxaQLFWEC2Rolqvb36rE8bDAiLAzrJ+g2eZysJpYM+?=
 =?us-ascii?Q?4C6kZTMqS9IyZpq0LAYChCt+yc3YFp5qBwMBLCZ7zQr21I9JDW7bma292c9s?=
 =?us-ascii?Q?IZL3o2nALeqfvmYZOOYMrOZzFrM78kPdiiWoC+lqSbFLr3NAST7M4DdizV+K?=
 =?us-ascii?Q?ceauEMIR6V30HHl2XpOVRE56ntV8jJWfXBxIxC+CIGKpBXMk/bnsveOvb1PO?=
 =?us-ascii?Q?46lQhBK4ZCVx3bbjTIwdt0t/W0f0CrJdaIT4W45T4XXdRVy054IaU/vAcSE4?=
 =?us-ascii?Q?zanyJb5ms6HgOyCAoAowXPz0Mbj3BeJYamWmqfk5+DIg6AZGXdrUfawXYosN?=
 =?us-ascii?Q?QXDrQmWqCobqVCo7esAuOUBpcduuQXfzDmGcKFihhk6etX/LWrI+Ct04rvgF?=
 =?us-ascii?Q?ByknR6SE43bSayHOKKhiyTVIgGP1sVuRFkn6aj/GasxM4icFEZARTVAFth7R?=
 =?us-ascii?Q?BhvwDpycjv8tIcawUeGxzXn2G9MWlS8gBfhpBj95T9RtLwSsh6s6xAZ1NfQ6?=
 =?us-ascii?Q?rahadcQLz2TN209wW5uj4Oy66cU06jhOtxWdSQ42lxSJUOWju5XO6n28gBAu?=
 =?us-ascii?Q?7Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd70539-dffe-438e-3439-08db017143c7
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 20:50:18.4847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STUoEgPgxVOXP/Bc2DJlGaiJRGO2wdHTRWqHTBMlH4QWktUlW+tSY5kpgbFtmqKuHRq0+NHWDizP4xStobgRHhMBRnzk2A4w/Lwk8OO/g8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0661
Received-SPF: pass client-ip=52.100.20.211;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Based-on: <20230126111943.38695-1-akihiko.odaki@daynix.com>
([PATCH v4 00/13] Introduce igb)

Rebased on latest changes from Akihiko, and merged changes from my
original patchset:
https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html

Sriram Yagnaraman (9):
  MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
  igb: handle PF/VF reset properly
  igb: implement VFRE and VFTE registers
  igb: check oversized packets for VMDq
  igb: respect E1000_VMOLR_RSSE
  igb: add ICR_RXDW
  igb: implement VF Tx and Rx stats
  igb: respect VT_CTL ignore MAC field
  igb: respect VMVIR and VMOLR for VLAN

 MAINTAINERS          |   1 +
 hw/net/e1000x_regs.h |   5 +
 hw/net/igb_core.c    | 255 ++++++++++++++++++++++++++++++++-----------
 hw/net/igb_regs.h    |   3 +-
 hw/net/trace-events  |   4 +
 5 files changed, 205 insertions(+), 63 deletions(-)

-- 
2.34.1


