Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBA36C465B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 10:28:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peuki-0007Mt-0X; Wed, 22 Mar 2023 05:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peukf-0007M9-MT
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:25 -0400
Received: from mail-dbaeur03on20727.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::727]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peukY-0003Dq-FJ
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvmDxx+mchAQxBZo2+NVHtP5QKPcZi1F7g20Yb9aIP06LVwrEhjxOl1gfRGGuFQVmeML7AYYRumU+QmUSSODi9UbXQ52YOtbvOd3EshU/1AwXvoUy/3HAZTZnuFu/C99OpGAtX+GDqchcbWtIYVTNvODxa3agwgA0h87MjOXXWa3kDvw0o0R9/W665usoNX1D4tBtJJZ/+FUuhl1R+bc19NyNRgnaxdvvBwdBNEpdF/0F0l3abE0QVOcIPDLgnDtJ1JfIK+CnKevOiyuMuVEOhVaZ688y3FdDXdFxl4YX3NUoiAAMSGtwpgnZMVSMsxEKnS6CTrcmNX0S05E25PXsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1suM6PTmTV6FK0IUo2J3B2FxazRNlTyMpP+jOAICRY=;
 b=IvGskHDeQ4DMsF1U7EOBoQ3+niM+m49wmzjOHZVqBYp7Ioh8sVvhBkG1kFSAeDgb/dVe8inEY+Y6aLlixwxvE0panGT3gr/c73bjbz6al8ndvzQi+94ZrULMu7na/Ct+ki1TTZHpHXFwt+Lg+e6+F3cJZo5RI+iq200cpFhwgZ1dPWvx9mrkTcPobFRf3qhJxR1EZt2fVaibEmNNPx/ob5UfP5m00aeiaKkRb7ZfgddPp2LvrnPo1cDQa2wXzY2l+oHKPuD6QfUCOOSKkQ98fVQE1029QEjUSNATgOLFn3sdCjgavPiPyW4jXrjLiTx/lqxI9/fu/vgAQ7mNBG4EAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1suM6PTmTV6FK0IUo2J3B2FxazRNlTyMpP+jOAICRY=;
 b=kZq1lcBexm2FNHquu2PvILfd2qVQ31RfwCInbX5V134a97p69AWrHTtUuEMvXs8S8dz3IPbAdG1R5osoX7E+dkPPiVlhk5YFmM9MKxSBdVn9PYaBTsTxy5B06pnNyMAEWIlOT5wcMVimi4mP7yvw7c+MMX7mW4sJjkEBoqrpqKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DU0P189MB2201.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:27:11 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:27:11 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v8 0/8] igb: merge changes from
 <20221229190817.25500-1-sriram.yagnaraman@est.tech>
Date: Wed, 22 Mar 2023 10:26:56 +0100
Message-Id: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OS6P279CA0140.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3a::13) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DU0P189MB2201:EE_
X-MS-Office365-Filtering-Correlation-Id: b6fc37bc-8c4e-4cc3-b758-08db2ab79da9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 75YcXX7oPChONbvEp7CXxQQLivFwedGxHGfBvBm9ocpsFlW/QiwFTE8uWN2zwJjEMe6BlPcEVQyLlaqOEmmKIAltReea/Xk2nJ+QmdP3GEmhWLR8JEx8Q8+tZEpG/Axja9GxK5vRDjPv+YlVhjt0ZevOfKN+edmysh7DPfrzXRfs619eUvFJiCX1kJYfRhJ36tr3y0Uol/nAlXZ3rBIXSxEv3t/cSI8EB5GR7Jpvn1ujXomUKHckjGjxYvk/Az2DCBvfmhfgxEwiSQhf7LJn+j9YpFCpwrezNKrzoOvgxH9IzEUFB9IycOvl+HJNrs5J6l46ErMjOnjafXLf7qs/I4rOahh+D0u/NrpSLCpqi2+eSjQoqsv1TQsq1gYO08dD7MrQKGq4eb3KXBJFxb6mR2bLXPpbv9OSyMZZnNtLYfgYntG7ipwxhZ9yCy29D7tVGxmL48Int5xXHy6vImlD+BVjZJwfNFWc0kNi1ho1qDEu9Z4D5S8vAms96n2Anm24PWYjS+btdbyqlxJ5vHxJgEn4iIn2tgvAAmufD46pl7iYVtdS8rcjxmfbeNigVKWfWY5x1VyMsBA2wrtBDCKl7xL56bIbBAJgwNBTb/kIiWDYg5lDwxS/9i1AnSVZubevvN5DfwXkzFfnhtGbBb9P0OF8oSwmYjSUgx0meDmpQsxXaFulRPgxBcoY/3gioP4EJdULyPwBTSTRSkCwt1SJ63Qh7Np2BCnmA5myUxxZzHM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(39840400004)(346002)(109986016)(451199018)(36756003)(44832011)(8936002)(5660300002)(41300700001)(83380400001)(2906002)(2616005)(316002)(478600001)(6486002)(54906003)(86362001)(38100700002)(1076003)(6512007)(26005)(8676002)(70586007)(6506007)(66476007)(66556008)(66946007)(4326008)(186003)(6666004)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1lcHz59OLqOl5BJBKlC5iht7BHEXYEOEBTgSYEAngEnxR9zqndJ3t5Qeo1eE?=
 =?us-ascii?Q?b03cnwEGw8mJCC9johwktI/Y4boMPfIyN9WrHONZXv4W/FA6DKwCa3WKvQug?=
 =?us-ascii?Q?Zo8VHnDeDJqMgvOIFfJ3ZaN+5uyJGc8nCWrXfGIVTbxV4j+0YnjqD6pGgXZz?=
 =?us-ascii?Q?uBhDk2OaAh0AONLLi5zAR4MQVQS4KRh44xrQYoFuiijF9RFBSNLeV9i3FWAR?=
 =?us-ascii?Q?B2ZZrwWxigqJQil6EqmIq5dXGVvdZ+IfMayw6l4JXw5prrLbKE9NU+JFC/IQ?=
 =?us-ascii?Q?HCmE7Yow/bZZ2vqB/wQiIXYBsag9Iysg+mkhfnWeU4pzrl3h3Z7HF2Tvw0Z3?=
 =?us-ascii?Q?tEyrW5/fQ5VRdhXENWxaNA3MF/vGFcYjgxXDX8MdT43eHXhJcFOAsSQqCriz?=
 =?us-ascii?Q?VFhlpjrObe56m8B3QirrOgh9z/Jf8xIWW/Bt+3uQVfR5rbiyp484htS0PgYN?=
 =?us-ascii?Q?vs5zFwtJsLt+nmDR8+MTwZNJ5nvKsK5iiQLDpau4r4tN8asAddCPi/yHMxrZ?=
 =?us-ascii?Q?PEOy2pCM7VWm/SwCy/8bKYVwIJInUCXcKcxEGDzKt00VZ/aWEji0S69rSye2?=
 =?us-ascii?Q?Ozbzgqb+TDNVGnPbVwt6NLtsdOS+0BmqiHnLrqC/7dHd1NEFJQ4Hn3w6nXYe?=
 =?us-ascii?Q?pHgKz3JrwvyT+/NlkaSw245RupkqS7LyvEeKqGuzvMT2f0gmZND8xOjsBmf+?=
 =?us-ascii?Q?rxNwoLseeC/85/ryGjv1PMC7ZYTkvyCDCCd7nUV3/1F8Q2bFKMYTcIEqc8rv?=
 =?us-ascii?Q?YpO2+5dlgE35vDI5MUihwO42YKOrx2TLPK2mgpK5QnUm9K/ISChRHG4p/DS1?=
 =?us-ascii?Q?1cCg1Bv49tmtCPyYrDXE3MeV+HRx+Lrozhve7iL4FBJxBu0bHgPMWMKKGa3S?=
 =?us-ascii?Q?UXfZs6cUexR/Q7N3sJB0HTqkg9vqwVRB+oHVThSr8BLDG91CnTiDk6eCAUtV?=
 =?us-ascii?Q?MDAb1IlEm88GWq5c7p8EI0DR97mMQyYbxyKY6QEtIktZlasi7h+QpTy6qPA/?=
 =?us-ascii?Q?A/bwxjZ5JoXGS6OO5DVzBWvJxvOVJdPmzvtT6a5/zEqBMgwrHVezR8WD43sk?=
 =?us-ascii?Q?wHKNDhGWpKDBQzmqeRjWf/jy1cAM6BnkT2vBi3WDeRR1YJiSX67jz+HhqJf6?=
 =?us-ascii?Q?y9eFDdSCWEBWeweHv1pQTbv8md+mKE6DaV8H/huXGgL4N89Na5CLxH7iAN3o?=
 =?us-ascii?Q?6N8jB7Q9oDkO2obSFhPrnhIIKy3WpXmDA1NVXiOsAclsf4lTAqaKrpNgwL9X?=
 =?us-ascii?Q?lUCjZAeCpz36O2qevrGy9Pcvjow2NpV9pXkYUgcrXDEgBJpBfjjl3nFMWhz3?=
 =?us-ascii?Q?ICZHJRHUMkoNikZZ2qYiVEtFG8tvadatcjC7gCiqn126BIKwe7TcnGDISsVF?=
 =?us-ascii?Q?XQWO5odmtywQlRRd292zaZ/xtezVssBjnZfd9Rpm1sfS9lav7ZN7FoSI2bRU?=
 =?us-ascii?Q?dcoc8TomjVH1RxLZ0BJ/YY6MQ5ST8sympbud5Rpuqhe86LiV4AX2zIT6LL5p?=
 =?us-ascii?Q?mwQ7y4q6P5jgHaTA27A4r9uNDeUBX8EAnC9qb2+q6KpHJbspa4Kk/DsgnXOU?=
 =?us-ascii?Q?GsQdRj9QTnocWerHqXiIE1O4HuTqpl1KjKVmgxhPtpzThgP6JLJ6tuV9Y+Zg?=
 =?us-ascii?Q?mw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fc37bc-8c4e-4cc3-b758-08db2ab79da9
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:27:11.6520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JY3AvzE4Pdpmk83A2/nlOdNZhcjcn/YgFFdo8nlrvVT0AEXQn0myVav2VDNwp1ftMwgjgzh3gX+XFSC5Vahx8Y0PknRQ9ZheziWYVnv8F/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2201
Received-SPF: pass client-ip=2a01:111:f400:fe1a::727;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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

Based-on: <20230322042044.25136-1-akihiko.odaki@daynix.com>
([PATCH for 8.0 v2] igb: Save more Tx states)

Now that Akhiko's patchset for introducing igb device is merged, I have
rebased my changes on master. The changes proposed here adds support
for 
 - Correct PF/VF reset handling
 - Introduce ICR_RXDW register definition
 - Impement support for VFTE/VFRE/VMOLR_RSSE/VMVIR/VMOLR registers
 - Check oversized packet for VMDq
 - VF statistics

Changes since v7:
- Adapt to "igb: Save more Tx states" patch from Akhiko
- Fix bug in VMVIR patch for inserting vlan, do not overwrite context

Changes since v6:
- Rebased on latest, which includes igb device introduction.

Changes since v5:
- Added back an unecessarily removed empty line

Changes since v4:
- Removed the change implementing VTCTL.IGMAC, it needs more thought
  and implementation of DTXSWC.LLE and VLVF.LVLAN first

Changes since v3:
- Fix comments
- Rebased on latest patchset from Akihiko
- Remove Rx loop improvements that Akihiko has pulled into his patchset

Changes since v2:
- Fixed more comments from Akhiko
- Reordered the patches to make changes easier to understand

Changes since v1:
- Fix review comments from Akihiko


Sriram Yagnaraman (8):
  MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
  igb: handle PF/VF reset properly
  igb: add ICR_RXDW
  igb: implement VFRE and VFTE registers
  igb: check oversized packets for VMDq
  igb: respect E1000_VMOLR_RSSE
  igb: implement VF Tx and Rx stats
  igb: respect VMVIR and VMOLR for VLAN

 MAINTAINERS          |   1 +
 hw/net/e1000x_regs.h |   4 +
 hw/net/igb_core.c    | 207 ++++++++++++++++++++++++++++++++++---------
 hw/net/igb_core.h    |   1 +
 hw/net/igb_regs.h    |   6 ++
 hw/net/trace-events  |   2 +
 6 files changed, 180 insertions(+), 41 deletions(-)

-- 
2.34.1


