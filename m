Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6A868294D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 10:44:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnA3-0002Ad-SF; Tue, 31 Jan 2023 04:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnA2-0002A5-36
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:42:42 -0500
Received: from mail-he1eur01on0702.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::702]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnA0-0001fb-7D
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:42:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoQ59VP3H7JjXrkafjM9Uy5mV8NeeXFPw2Js2s90nx76MsIocKjZ9U21ZzHlADOxevJd7nXazZsPOQYEI+vrhuuBSYcPAV1Bnp887wKmijD3LVW8Jh2l+hJGYBE34ymlwzwB2eNS8P8Qk6nnfxeDNB43kArpzZpWN4ercpE0rM2DNQfOhtRPB3QGq/wdNCuSEozS+BLInHzYbcxxLMsJ4/QsGi5AuEuZAxOiOgBMIoPo8ww/hPYXi142JYU6dBBz3rxkP4xnxAY4M0GvTluaEPu7Ssg3AehYfsCwdHi9SOfFDQzUet4y/i24BylWoSK7Wv63zAi32WQRv9NooighDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLFnHN1oNhzbV3irsRQfF0zzC6/m6XLuxANb9M5WrHY=;
 b=ChtOTBylyA3IU3qSLlSDQI6uUc8oOBdP+ST/JWquiQf1zfM4a1XH2zvlysheHU+jhmrU06GJuxh+KYsWxqsCTF2+jl8P+Z9wEdF+xOUpGbXAs0p8ndMWvcQUrICeYPu5g3vAAvGGUle4xh+bEZvi+icLDsRSeXJghvwti84Yd6uRtgmLaY59h/xCGmb0eu/3d3fhQbcvJNlsX9VThS0Dk18a891437QdDqnCJBijlYyxdH2KtRXzgSwGdfrqKt10OKwO3/JrS+SOTGhV8wz549iVPDkFFNLmcXAZ+LRKqHZ/WhhGBWEz4GnbLp+DjzpsleMvHhgpsOMfzzlPBzT39w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLFnHN1oNhzbV3irsRQfF0zzC6/m6XLuxANb9M5WrHY=;
 b=VVbv1AiEdooRDdDG4uSxGEVZWYqb7+KYqOcmyqXo4i8fIFwgRUtOv5XaMgDReJFJPO0MFy31+swUJYJgzO5moLv04ZVDgkPHr2b+DHbs6hXnck1RtauefqK21Uoka5eV94tFZJQoh1XKrmd7JnrVKcHgo5L2AVP24lkmoRON0ew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by VI1P18901MB0733.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 09:42:36 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 09:42:36 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v3 0/9] igb: merge changes from
 <20221229190817.25500-1-sriram.yagnaraman@est.tech>
Date: Tue, 31 Jan 2023 10:42:23 +0100
Message-Id: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0040.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::14) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|VI1P18901MB0733:EE_
X-MS-Office365-Filtering-Correlation-Id: c9296c08-4460-45b2-c489-08db036f7c24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mLf3wG4DeVcLLTpntPf+uy5AmUQEmsj9QGN1HldwKKBdZ8wPlWy4k+oCii+9XhmJAb7aZ8U3+8uxZTVlsat3is3qF3GmRyt2VeVwE6jGzcN5aQLUWILNKE/aAeX/HAeA6H6n6P3DOj0vlcvGk2/V21BHKvNAts6Q+AtmPqKl1EEtyLtOhON3it5dM8I8skxiTi9K1WMS+TKHgGD9nu7ozGPMjr3IbJFY5q45xVFoBiHlMQuc74gy/XhJ6M9/H0xa+vsr7+7rK3d0MU6cfUeocL167N3qyLrV/p3rwoEAZz+egZd4rDqlEzdcHKB+CxAPkkdJB9luxm4T2lozZDZiZbYqfvYzqSrI/IPBkZwIGhnXZPTs/bek3fyUK3lwzc8/kuXdRxr5l455UIFONEvDl/cNe2+XEhKFg4pvoIsuJdoKMOdTTxv5wSsebz33x1tuvxP661MOjpkT+rQWOfJH6zbB/Er4I4Gx7+ZapJjZPGyff8EsvrgvlH4AW8xtsAM9oA6QQNP/74GccOSNnv5KIhNyHZo6HHFy/oE3dPO+yFzsH2ZMah4jT3MF+5AF7VhXojAiE5/QVI23KwqIsRqVrtK5DtLVVnn0y8RqiXWathcNsgMO6HUSEUqApi1l8m6QRgoENoNbVaTY0HQ0bAXtadtb/dWWGOWBdXbr49DAqYcFoDy5r22pIesyiTIqmvK8MbwuUfHbS3fMLA16TesEN12+G83u6FVXgQICCVsscSKWugWwOyZTNzEOz7mBzNrS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39840400004)(396003)(346002)(376002)(136003)(451199018)(109986016)(316002)(66946007)(70586007)(66556008)(83380400001)(86362001)(38100700002)(54906003)(36756003)(6512007)(26005)(186003)(2616005)(478600001)(966005)(6486002)(6506007)(6666004)(1076003)(5660300002)(44832011)(8936002)(2906002)(41300700001)(66476007)(4326008)(8676002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O75yYPn2mP9CvYKjsTj95/um9GzBPTPR22szjA67Uy28Izybf7qF6njgiF0z?=
 =?us-ascii?Q?IfmPZc+IDd5sQUYRZUSJbXrZvlF0w7VCkPYAhHMgY3mEnnfjAgL6l6M64adr?=
 =?us-ascii?Q?Eh0DeWIpYGzLmPBkCbozWyRvuIf8/+MtsV1pSjjP2Cpuhygi2QsC1utQ8DZE?=
 =?us-ascii?Q?U2q8BA1BxZwv/zrQ+bhlujnOGrRaGH5+juzd0dOiFV6H9+Evw7Lh9kpVXBhV?=
 =?us-ascii?Q?TnkXI+tsBJjWBF5NzoCw9JDAWPCkk8IUkBm3aJ1FyLPhATSTlw0L4L+Ckmx6?=
 =?us-ascii?Q?f7ZQeBXgJhteaCVi6i10Sbi3R3lXg8vjNGUIIgWmz2HPex1L6abVeiTAO7RB?=
 =?us-ascii?Q?b6PBSvxQGUZ/GpdG0jPHqumlchDas4VyXYMukNZvqtYvwXLFRSYvDkM5s81C?=
 =?us-ascii?Q?wvABy9RWaQOZuz5yozqoXihaah3rfr6f/erKpDgS93MjwSjHNIJ3rF5vQllD?=
 =?us-ascii?Q?Dnzl7GMiAMK22lZDI3+/Kkx7D17WS1PxWhvd/R1/5P1aToTTAFl8uJcRDndA?=
 =?us-ascii?Q?QMs5re1Qr0sgfy1N3ln2p6I0swVQpYAWcFvXOTkGFhDg4ZaO1bEDAC1bcAQT?=
 =?us-ascii?Q?IlTQyftiMzx9dKsUOeQs+tK18V2y9NXy734dY7/lctePwvwt4T8uolPW7rx3?=
 =?us-ascii?Q?uhP28RN2oTIpKyPeYvOxEap6YQHFqIXf9lz+cfuVWez7RsN2lx4ypPCUcueN?=
 =?us-ascii?Q?EmTsZ+KGYJOqPuIYDeYmj31C3FyNpuzrhg0O/pIdrKtFS6NQB8aPiY6AFvxa?=
 =?us-ascii?Q?h7j/UwegyI3DyWx79QGmaQpAUMVjxSyU+b/CatLa9ZmPHvmHY7rye4Ugnzwf?=
 =?us-ascii?Q?isywNhQMjfj43pWwTzXmjx+Al2o5Clp18oUhmJtGm0d9kSBkDYmd/YrMa59S?=
 =?us-ascii?Q?3jiTgNuckP6mvYlWSl27vSLMn3NhXADPVSiaybv0zAAEkL4QU40+a96RV0qP?=
 =?us-ascii?Q?66FnSZe6tIQzztz8bxMgLpuYc6XRjISQlMM9HzwW7t+pmmG/w/eQPausqA0E?=
 =?us-ascii?Q?JqVDMImR7azsKqwHulYMZfnAsDt/i+3aEVXWWyZABQbLfeM0nBPt0Gd789LU?=
 =?us-ascii?Q?xWKSOMGIFvtRvk8TR/LbOMZ+8z0pLTMMtfKpTwHwqcAK6bo7j/OycsuNlfkj?=
 =?us-ascii?Q?gpv8OGaxHbGV7G9K44QtG96JAz0ls8IhH5lpcsR1bQK44X+qZq/1yIyPewA8?=
 =?us-ascii?Q?byTWTEw71uDcJyIy7QEYtfKExuywYb1JSevIGpmTznbfbttiUXiuHJxn6/Qj?=
 =?us-ascii?Q?fAooKn9iFWFJWwbPhqHsL3eJerw6699L98A4uk7TpLvOWOyFZZb+aRByBxGA?=
 =?us-ascii?Q?QqX33T3oRUf9qxepclDfoPP470logmhIyr82BABi6uxpAncea+09n+pppSWp?=
 =?us-ascii?Q?CJJIIHLy74rb4nK6xdi2rJ3uFxyw//QDXk3la3kLrhP5JYgnlBu0aKzWgprw?=
 =?us-ascii?Q?FCjccCiIuGvVCeu43Zs+rQI8sBQP/jWkaoOPSgeeX/p6OtEHEwrWwkSn1yg6?=
 =?us-ascii?Q?vhKq/NJJqo/wCjFFE5GqtatvuGUNmcWg/mcOHByZfLLSRRFx5o4bti32nSM8?=
 =?us-ascii?Q?Rs7z1XlhxJZvLIBuR8OO2pSw8JnjT1Q4kGPOKX1wYgEVdYNd/rGcmSawSvZN?=
 =?us-ascii?Q?0A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c9296c08-4460-45b2-c489-08db036f7c24
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:42:36.3969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBJqkAA5McsyT0zWDRzRXVGFSHJyXC9WIqaS8apIrSkue8hBfmWJwipXfmGruBJj4XFtooB0wST4J6nnuESDy2CkdGQygLVS68tFBEaULFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0733
Received-SPF: pass client-ip=2a01:111:f400:fe1e::702;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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

Based-on: <20230130140809.78262-1-akihiko.odaki@daynix.com>
([PATCH v5 0/9] Introduce igb)

Rebased on latest changes from Akihiko, and merged changes from my
original patchset:
https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html

Changes since v2:
- Fixed more comments from Akhiko
- Reordered the patches to make changes easier to understand

Changes since v1:
- Fix review comments from Akihiko

Sriram Yagnaraman (9):
  MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
  igb: handle PF/VF reset properly
  igb: add ICR_RXDW
  igb: implement VFRE and VFTE registers
  igb: check oversized packets for VMDq
  igb: respect E1000_VMOLR_RSSE
  igb: implement VF Tx and Rx stats
  igb: respect VT_CTL ignore MAC field
  igb: respect VMVIR and VMOLR for VLAN

 MAINTAINERS          |   1 +
 hw/net/e1000x_regs.h |   4 +
 hw/net/igb_core.c    | 244 ++++++++++++++++++++++++++++++++-----------
 hw/net/igb_core.h    |   1 +
 hw/net/igb_regs.h    |   6 ++
 hw/net/trace-events  |   4 +
 6 files changed, 197 insertions(+), 63 deletions(-)

-- 
2.34.1


