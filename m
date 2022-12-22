Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0815B654358
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 15:46:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8Mp9-0008Fq-J5; Thu, 22 Dec 2022 09:45:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1p8K3W-0000iO-9K
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:48:10 -0500
Received: from mail-db5eur01on072b.outbound.protection.outlook.com
 ([2a01:111:f400:fe02::72b]
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1p8K3U-0008SE-Fp
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:48:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNY1YtESeO/ZXoi1tZWl9/eNH0jcMADz46UXfL6xfjdmR+QjnPx5am97f/KaTpUUaZ2VogHHOyuOdYyQi3ddyGKoQV2fviChwk5O8m1ixbEuuta2DgPt9n8Px+m54NrW4WpJ+w6WkGRTTPuOrLoC7WdoGI9oq1YxQ9WMw1c5pKTCuq1IHy4iXIrgSlR8sEbXc8EbI568U4ydlyUGLYKi2jGnEbO4r7IguaJN5ifKhnoKZgWTeI+Ues3hzcO5jxvsAA5+XOY4dvOT1nRSz9W6e8tq8+lw2DkAxXLZ6R+7pWslHcnPJBK44v99usx7NMP5rFb8zWLGZgv2Pb5mimptgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OvtvVhxVUq1OVtayEozyu16iofxPDSHV10MmtD7mNE=;
 b=FfWoAx/uQt7eiYfgVRRaX2J3OgMf6CN0u7Cextmw6wDOWJKh++exS/w7N3YcEO6LODTxWsbUz1yiNU1rv1AK/71KeSel/IqvZDTDTeaBGMt6T+yEh+LebBaPIkLQ4t/sfV5Rq4edRQyE5/iCMgqVKCaWJdCkPyrLTG1O0/6JIaJ8xEmyc8MW/MvdjL+BsXV3JuZ7PvnV1Xu7vTGAH/mdUbocXJ5lcmTZT26QTuLuSoyE8sGgqZP/JXQjQBYOWTccDziA8V+pF7CxsoeMcA64J8CypLPOPmuqztDGNmVUSMJmr+lN3jt+2n5IqqezoxysFDZYiJKHphqW3P9iXR9pNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OvtvVhxVUq1OVtayEozyu16iofxPDSHV10MmtD7mNE=;
 b=WXIzfSZ588LWDR6zHB6Vcpjy6/P11c5Srxblznw305dRk8FDIUOBlEjqR9QgAH9oljUXxIXAJF/dFPePXgHhbgR+ySfox/J3tPZHlakOCit5X8jEUQom7PFQByODgX6Z9gKZrM4CfPSIR37MqXua5LCV5U65FxN9FUHtmQWILYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by GVXP189MB2055.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Thu, 22 Dec
 2022 11:43:01 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%3]) with mapi id 15.20.5944.006; Thu, 22 Dec 2022
 11:43:01 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 0/5] hw/net/igb: emulated network device with SR-IOV 
Date: Thu, 22 Dec 2022 12:41:15 +0100
Message-Id: <20221222114120.8790-1-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF000000F4.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:1:0:21) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|GVXP189MB2055:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b5cad13-19ac-4b27-3729-08dae411ae11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aZMsT1OOmhdhK16G5cTVUFv4EasCYL6pYBaOQ6XxVtg7JxriSm/CJ7wvzKroEMzdaAHfnnF4FHw6A1EKsmQ+cnGU0P4MKrcUx0IDIwSmLaoPGJUYD2YApUgiKITfXto59GXXi+H5cGDYw4h3vGbKFSeOJMbdmRufT0VQqK8xEFBTvIenJGM1v23GZqivBC/GOt3I5kGr1n34TZHb2VpJrVGjrZqGk+IhGLMr5NoafWJfhaUYjrgbQQbNa6hmNot5cXTwPM5l4VjqEISVJ/+eHNVEloD7SkRkU2IsDyFq8cVnLTTw1mJrueGCPuMgWOIQjuH1eGTz3ukNFTb2KavL0AEBVfQXllWCGpVPEm6Zq1OS/iOFDXRHGzd2Kx85aT7OBG1jwak95Fce3jkO8HEazJlEAwNMja6pna9npub+yOfAenyJlByiqDiOLX22Av4rA6bTnrjYbeBe7i/uIN0v37JhkT7Ootg0k6W02/mYZE9HAsUSQpCr14I2xeb/IOvo2/wCOy0P/Tl+SE7fMrsMLiJxZ9412TQwcqrX3/VfIihb0BjT9yeHcZxOOoJR7MeoFtmciV14aONBKaOcbe2barjiwwg96pXaKXNZeSeM/UVs2Gkt3DqFvQwco+QZLgvy4CrGYwtKO8zod1kCkXkFZo1pkbIo8p2DXspW+2J1Q/OrBZ9sqJjLPaOUoEzDySXZmeQWjgOxwUnzmV1x8jrz5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(39830400003)(376002)(396003)(451199015)(36756003)(316002)(478600001)(86362001)(5660300002)(26005)(70586007)(44832011)(38100700002)(8936002)(66946007)(4743002)(66556008)(2616005)(110136005)(186003)(4326008)(6486002)(1076003)(2906002)(66476007)(41300700001)(8676002)(6512007)(6506007)(6666004)(83380400001)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vcqiWTzZCjgs5TkWTfkOarA63PEYLExOFGUWubWD+gfFOnfkDgr1lm2ujytu?=
 =?us-ascii?Q?/zicLrK6zbBqROPlocQPo+V+Junr1MF9sFCEdQvnSW3c2IxNT7tkRlkkT2Kp?=
 =?us-ascii?Q?hC8u1wu6PETEOrmVcl9vuEcg3FhyaKTM/BpS3xsxhAxfwEi3bMGLAD7aAhzl?=
 =?us-ascii?Q?1ZygnbYGHILiYT4UlUbNYlHL5N693blkhv+Vod4/EsV45rjK7wZeciYlSsQ2?=
 =?us-ascii?Q?ishwHCWei1PsuYFuP3CUcjTGQ0C1SJLq8TUsUYUnbpmcWqkgnxsQIv5WZoXv?=
 =?us-ascii?Q?U/eHH9beY7qlM+fB71wCwjmcKTUVAl8KRTfVYQh35IjSNtad2eHG7q2yTR6d?=
 =?us-ascii?Q?1qMQnUdwHXyWQfu7CMzBQDWDbU5hVWU940eNbSirROV33On5DEumrmLhdIZT?=
 =?us-ascii?Q?AfQ1mgeFf6czugM2EPt1JC67PKJrElUELlsi7iKz86pnz9YedOd36UbncfCN?=
 =?us-ascii?Q?ZAbzB0feXiZAsFDT8H6MnzBqrJ0K5vlddcLq3cCa6r5lXjd7RAUgiLTx4jo/?=
 =?us-ascii?Q?HA1PYUGvkCn+qgOJWulus+BwJI3UdB1wawuZwxr4Qso+EXEFKoCHdnMuYCQT?=
 =?us-ascii?Q?pQI2RYCrAkOSmXQG/LFYOzqzq+i01gqwRVob8oK9KtorwwT4q2rXyu4R23DW?=
 =?us-ascii?Q?WBJl9WdAplNd/5iuYmGjUbhXxlSUhxhT4urHsKMw+g+e3spIxuru8iTSh76z?=
 =?us-ascii?Q?yMYBfLy45agmzXNpMpJIiabEs7qmhfz7SAS5P+Nm7GhXg+O0LuTM/AO+Tn7O?=
 =?us-ascii?Q?kegXMOWuIF3FMgJ66IrnsjRz9mNQOu9DLzYJX/WV4gMq0rxHMfQnXQEknfN9?=
 =?us-ascii?Q?5dryOyl9puDiwxb7gLLZx/84vA8xo4BVDlrg9LoiP0bfpIQIVgSQdued/EvM?=
 =?us-ascii?Q?mXoA1m4ko2luFKghmX78SEuOwUUQ91FV1VHDAx2zc4g2gp8+9J9qZCVTACf/?=
 =?us-ascii?Q?zqqlX7+11V7hTJceN3vXuaDkaR+MFo2l9plCkFHoNZhwfRhaPaSjouDA8Q+O?=
 =?us-ascii?Q?o1QWNFayrEMyoMU25uL4/0Ob7OkFcvb7mb3AItFygAvVRhSKhBXE0ocDPJMi?=
 =?us-ascii?Q?2xo+nE92L2FSUwPmIN13bwvaaTYuacz3MtkkoY4Hg+q/X4MT0xjKI8/HD9/e?=
 =?us-ascii?Q?xCKpEakhnuichbcGu5IoHn74Tfi1piwJD5Rxl2yvDpJ1UHdFQnOMCfdGTeSA?=
 =?us-ascii?Q?WoCvDyfOEHYhEWpE3+B2KH6TJiqQHgUeC3J0x1ZNb44oHAe3kChVAImPVXhT?=
 =?us-ascii?Q?i2Owsg//g9C1QNpDqHuw/3tolpAF+q0u+PffV2xmpN+RWstYUDs4mo95XH50?=
 =?us-ascii?Q?/lwHtndDTNvvHNaZAJhdkUS45LmosJTb7QFUVo4VtMw2fK0mD/ZlfQlvkM6R?=
 =?us-ascii?Q?0KsiV4lZGlOycDS5pasjasdCh/9XroEA8X5wD2mojnVsY+9m/SbiJh4bB/52?=
 =?us-ascii?Q?1IiKg+1BioL0hVBn19mO7nOAuUdzobnEOxdA9GZUnheqqEhFkuzdMcuwZyiE?=
 =?us-ascii?Q?dfi4Ru/ganyNwOAh/g7hGBtfiIZxMc+bdj0rYVX/tk8PPMuYbBexVdUIactP?=
 =?us-ascii?Q?NNs+pznMr1h6OzFQNVWfoCbR0LTGzsfGGSaey0VcULrpw0p+9i/YpEYSsXwz?=
 =?us-ascii?Q?bg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5cad13-19ac-4b27-3729-08dae411ae11
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 11:43:01.3706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xgx9F4GMksLQ8AikTDXk1QR29qvl7oTgrLHimcWXtspIyFx8EOzjyeH2A0GjU0xvg7YgznAyq7HdDvOvDl79t5a+JOa7l4fBt3V6XQzzGEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2055
Received-SPF: pass client-ip=2a01:111:f400:fe02::72b;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 22 Dec 2022 09:45:26 -0500
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

A new attempt at adding support for Intel 82576 Gigabit Ethernet adapter
with SR-IOV support.

Start qemu with the following parameters.
   qemu-system-x86_64 -enable-kvm -M q35 \
   ...
   -device pcie-root-port,slot=3,id=pcie_port.3 \
   -netdev tap,id=net3,script=no,downscript=/tmp/rmtap,ifname=xcbr3_t2,queues=1 \
   -device igb,bus=pcie_port.3,netdev=net3,mac=00:00:00:01:03:02

Load IGB/IGBVF modules if needed.
modprobe igb
modprobe igbvf

Create VFs via /sys 
ls /sys/bus/pci/devices/0000:01:00.0/
echo 2 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs

Sriram Yagnaraman (5):
  pcie: add helper function to get number of VFs
  hw/net/net_tx_pkt: helper function to get l2 hdr
  hw/net/igb: register definitions
  hw/net/igb: emulated intel IGB (82576EB) network device
  hw/net/igb: build support for igb/igbvf devices

 hw/i386/Kconfig             |    1 +
 hw/net/Kconfig              |    5 +
 hw/net/e1000_regs.h         |  357 +++-
 hw/net/e1000x_common.c      |   13 +
 hw/net/e1000x_common.h      |   28 +
 hw/net/igb.c                |  627 ++++++
 hw/net/igb.h                |  184 ++
 hw/net/igb_core.c           | 3782 +++++++++++++++++++++++++++++++++++
 hw/net/igb_core.h           |  216 ++
 hw/net/igbvf.c              |  262 +++
 hw/net/meson.build          |    2 +
 hw/net/net_tx_pkt.c         |   17 +-
 hw/net/net_tx_pkt.h         |    8 +
 hw/net/trace-events         |  190 ++
 hw/pci/pcie_sriov.c         |    6 +
 include/hw/pci/pcie_sriov.h |    5 +
 16 files changed, 5671 insertions(+), 32 deletions(-)
 create mode 100644 hw/net/igb.c
 create mode 100644 hw/net/igb.h
 create mode 100644 hw/net/igb_core.c
 create mode 100644 hw/net/igb_core.h
 create mode 100644 hw/net/igbvf.c

-- 
2.34.1


