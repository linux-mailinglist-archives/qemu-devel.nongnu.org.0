Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE62F6590CD
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 20:17:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAyLb-0008IO-8Y; Thu, 29 Dec 2022 14:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pAyLZ-0008HM-1p
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:13:45 -0500
Received: from mail-db3eur04on0708.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::708]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pAyLX-0007uK-8i
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:13:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkKc7tlSEYD6QdSYAarwNbZYuT2jHxWgJ609f812/WjcmWkCXNyk10QSQqlrzsOY002i1YgTxpBloU0h09WtGbUuyMCigxgQGDw+TxWaz79RlCNjA0/Rrnz99v5pUPrWkMAFErXoCqauXFBWuS1M7TkkMVoqTDiPbq4EiANViSGqThlo6EqB/6szgoKGvsThyAouPKIcHSM99Y03JmCxzBBFLdyyvSWTfdAmU8Rc6ATYBj+wg+TeuSeHIitW6M+Wvux/TDfChlKfS147FDpbnkFFwj55WtEI4bbkYtiy3AQMdXnwHCko43geJ+3Lbe9IhlFayKkA4lTtVKwYBw/FUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbNPupfk5xR+2NfITWgBDwcNBYpmCp6LJb9aaT0+wcg=;
 b=dxoMl3WcigugQSqdrfE/ooagpnQy/E1az7zImqd1ZGCPp41gFOEyONtxL4S9DL3tgY1ZTZ92GeWCqvxkbppXOhJ9xFAlehQGDZ7H3Jv4ynh8v+cFiOkkkjMiZscIZetf7iYjHY65cpiqdwb2leWBqbrIFUdjMfH0s0wCG1BfbRb2rcolLv60SnGcaQmnOqd9giyM+Svkq7JTNzqzXnsQDfRh0v/N683mS5RBHb3PTb0NeBzFVrpEvfPAHedF1ylJVqRukYb9uYG6faLV0CSxfotDNA2koCUFQNofriRbAIhW7HEvBGAKwpshdSujOS9JZZCsRGArLhroH6fp+a3rmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbNPupfk5xR+2NfITWgBDwcNBYpmCp6LJb9aaT0+wcg=;
 b=ND5rqXXdTs8Th9bA+LUI98eIVxZ2GxR4Ud9U36oK3Nw0cHQ6G5gNxbgxIW2I7P9GlvQJr2U0K7qsB+LfhZxpg/X6Ls+bIr4Pp/z+7JldnrSA89oInHlRxy2hhS1Xm3WVatoyoocQyqvcgLevZH1FLD0fXKGE/2KaO+bSMOEIou8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PR3P189MB1049.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.17; Thu, 29 Dec
 2022 19:08:36 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%4]) with mapi id 15.20.5966.017; Thu, 29 Dec 2022
 19:08:36 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v2 0/6] hw/net/igb: emulated network device with SR-IOV 
Date: Thu, 29 Dec 2022 20:08:11 +0100
Message-Id: <20221229190817.25500-1-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0081.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::21) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PR3P189MB1049:EE_
X-MS-Office365-Filtering-Correlation-Id: 28113e36-9748-49c1-a4f7-08dae9d015fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ZaYcvLO2reFu0JZNR5A2S2uDreW/NncVt792kpfL7hOzXgJOqECvvMatKgELUQKEGWvxIIi7qng9ydirylkdsAm0BE1mHSVE9rBRVtXkarMdhiqzVSHMgCU2KWLIHiHlporbFPIRLmkyXeLyjZ6VRUU8+/sJQXKHIre/4XKHYbI4ikeY+2ECDeccJLddOsaY7DRhoMAjV8fJos/aZekXMsissilwgCX3AUkvoQm27IwjXIyw0diVz+uzgzFHkYJ6eo3FkPWzl9eKUCAcJlh0CXl9o0Rb5qDaX34Xnyjhe0bMctbTthL8ygJ0scg5V5mgLDcZxucizxm0GeeWrXjP/rYYbusEy2+7jUJwTvRUw+f9hI72x5hlF68smu6xCwl/ul0CaqeWek7CF393p5SkEdNw6lWNOaAWWW9INBjLhVRVHrXNl4XWff+AcEH9JYVsc9Til+UIWm5AA7rKQArRkPHLVI6SGYEgyGDAc+pv61zs3VVJ9esZpeSOarYGluSQqKO50sLUWdCUMBbQ4Zd/7jOriA6Em0zayE0eoOIsyU5GCEL24VsMo0L3yZUWPLp0848u9K2nESoDqv9HT7jdAGJh/3mVt4cLqdMI71n8EY1tiRg69o4l1QZbQIHb6iXRB8Cchd9JAySCAqqapOiHeGtkNusAlM52MFLLlhIHl6fKPt3sqV6yVrqWsTLa+DH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(39830400003)(346002)(376002)(396003)(136003)(451199015)(6512007)(36756003)(186003)(110136005)(26005)(4743002)(316002)(66476007)(5660300002)(44832011)(83380400001)(2616005)(70586007)(66946007)(66556008)(38100700002)(4326008)(1076003)(8676002)(2906002)(6486002)(8936002)(86362001)(478600001)(41300700001)(6666004)(6506007)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kaf1+49qOXYxYJ04ENBPuhNS0Qjvg9b1TmRkxJIuAURR1eHxqg8ld/Dy3bnl?=
 =?us-ascii?Q?exik6E5x+f1a7QhOvF9GGnGc5l0qkN8tFhTGG4dsJ7QLbpFA0a7UzFY1X6ci?=
 =?us-ascii?Q?QK6YlsaTa3RcYsXQw1YrFgj7SW8qCGi/tlQUd7mPwTxHvFeyU5QCGSUQE4v6?=
 =?us-ascii?Q?SJWbuRz4Jrv0wUIFgEP8k570Zfi3LXtIBDQMtLMscBLOl67UBfm3KKwe1tuu?=
 =?us-ascii?Q?UFq/XWJsmNzpumrurjVgen6v+VAeEpw2ntF27QTaZD+mHkMNfXP29T7A9STY?=
 =?us-ascii?Q?kIjlO/oUiBMUQqQ2vQgbnSUdnDB+FP+zY9u5GbqoNwBI2C6P2o3ttmX7RZ54?=
 =?us-ascii?Q?tPUSvo7uB8JuNJo51t7Y1hK1vb3wgZ4KQCBuM+0fAGsWuWFrr4AtnDi6NO+4?=
 =?us-ascii?Q?GIMqURmBCLXWHAT6k0woM6RVsJXqfPr/QXAmaeTPUazMP7jXAwNpbBrCMwn4?=
 =?us-ascii?Q?WabIv8UxBJxUE1WzWdKdUc1vt/ERNDmsnvPIfXN3hJPLpCKJwWfSAYPLss0f?=
 =?us-ascii?Q?dqnxUTEv2qU6z2DZXlszTcE4D88BXcGNQVXUPrcKTQu5ImayUEwzQeMApHU6?=
 =?us-ascii?Q?r7cMONLhchsu4qWuND1y9EOLHkf7/g+qQXQ1LmPbI+hW/jzusaJkD0XEHnFR?=
 =?us-ascii?Q?jr9JwCkrJmmHJy5hQsggG8p3M8F9h93zRRcxYtHLGxF1sphZGZpfveKLzKXh?=
 =?us-ascii?Q?POIgnciNVEC64nx+IEu30mA8VOGxHL3Lk5s+kcVGxYEY1aZKhmYQpDOORIbZ?=
 =?us-ascii?Q?kdQzTtwm+qZKm0SIrz7FlfUalUGeVSB5xqGGJec6OxgXvW5twexXWVBF2stY?=
 =?us-ascii?Q?/0oYInK+z8htftxLH6BN1X/QoZN2scbAFdEKYZA4DfpVHz/trWug7jUQC+/s?=
 =?us-ascii?Q?iMtinyWpmXz2AXn+PqCzrHU0WTOxRjX616H/H4OaMMlcI8hNK8GDrgyvWSbT?=
 =?us-ascii?Q?OmtZVjOF0REk9fzBNVtnAoVw3DNlBpp/f9Yymx6PE0TxEABBSi2wX3tMXTSO?=
 =?us-ascii?Q?//aXQtE4o+WqsOJafgtQ0oCZO9CBC2dgAhsn1y38Czw8MaSAwj/3WAPTv8O7?=
 =?us-ascii?Q?pforcajHVtXMZldeE+ERVBkGATb3ar7LK6IQ2YlZes9P9TYVpeGGqhC+rmVN?=
 =?us-ascii?Q?Bj7c4jSzrNqlfHH9JY95awndddMJgP7n+DA1wZaVJnnldvcdXr/hEpH8JGFj?=
 =?us-ascii?Q?w+OIpmKl6ZqKwuIife5f8bldCUfp/CuG4SWGxB3H4OPPgo/haM5kaFFhDbj5?=
 =?us-ascii?Q?01IdfxhE5TzCzmcNxrJKa0m50n5vjGP/vfBFX3JAET5ajeJlU77iKR0lhKqq?=
 =?us-ascii?Q?wv3mqEredRWoIsEQMXY1q80YI1z0YEhrj6gkt7dr9YrHmN7FJFJujxmakXwA?=
 =?us-ascii?Q?WvobjiJuTGrj9N4Tru+NOhq/eDqy1W08vi7mPlvmTP2skc1PIXAYnkuC+zJh?=
 =?us-ascii?Q?uFIATXmkolAj/0OUPGELyQ2VptTQeUNiqkoi9zpPyIdg9bW/R5WOGphdqMqe?=
 =?us-ascii?Q?xeINkhHuVUS/Ffjwixk3Un1m2DwbvfCbytaiG9sP84GoUDoUGsrGFilg7MCc?=
 =?us-ascii?Q?iIK8LceBxtt7Pfkah+p49lpgpSmg3TSmkW/MBMzM68utd4FHgReU+DiL6QxM?=
 =?us-ascii?Q?ag=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 28113e36-9748-49c1-a4f7-08dae9d015fb
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2022 19:08:35.9035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jAwnL8wP30sWNtN/28ceL9LjC1TwEY5CD6f7N/FFB0lhwmbNTvDkk7eRWuAoYDSVJMRjSCe0Hx7KUjkdooNNRUuKyxkbH3ZXno50fG4F0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1049
Received-SPF: pass client-ip=2a01:111:f400:fe0c::708;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Changes since v1:
- Added qtest for igb

Sriram Yagnaraman (6):
  pcie: add helper function to get number of VFs
  hw/net/net_tx_pkt: helper function to get l2 hdr
  hw/net/igb: register definitions
  hw/net/igb: emulated intel IGB (82576EB) network device
  hw/net/igb: build support for igb/igbvf devices
  tests/qtest/igb-test: introduce qtest for igb

 hw/i386/Kconfig                |    1 +
 hw/net/Kconfig                 |    5 +
 hw/net/e1000_regs.h            |  363 ++-
 hw/net/e1000x_common.c         |   13 +
 hw/net/e1000x_common.h         |   29 +
 hw/net/igb.c                   |  619 ++++++
 hw/net/igb.h                   |  175 ++
 hw/net/igb_core.c              | 3800 ++++++++++++++++++++++++++++++++
 hw/net/igb_core.h              |  207 ++
 hw/net/igbvf.c                 |  254 +++
 hw/net/meson.build             |    2 +
 hw/net/net_tx_pkt.c            |   17 +-
 hw/net/net_tx_pkt.h            |    8 +
 hw/net/trace-events            |  190 ++
 hw/pci/pcie_sriov.c            |    6 +
 include/hw/pci/pcie_sriov.h    |    5 +
 tests/qtest/igb-test.c         |  222 ++
 tests/qtest/libqos/igb.c       |  245 ++
 tests/qtest/libqos/igb.h       |   51 +
 tests/qtest/libqos/meson.build |    1 +
 tests/qtest/meson.build        |    1 +
 21 files changed, 6179 insertions(+), 35 deletions(-)
 create mode 100644 hw/net/igb.c
 create mode 100644 hw/net/igb.h
 create mode 100644 hw/net/igb_core.c
 create mode 100644 hw/net/igb_core.h
 create mode 100644 hw/net/igbvf.c
 create mode 100644 tests/qtest/igb-test.c
 create mode 100644 tests/qtest/libqos/igb.c
 create mode 100644 tests/qtest/libqos/igb.h

-- 
2.34.1


