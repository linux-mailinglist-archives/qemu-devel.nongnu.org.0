Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6F84EAEAE
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 15:44:54 +0200 (CEST)
Received: from localhost ([::1]:45726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZC9V-0004x2-Jk
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 09:44:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZC81-0003cm-VX
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 09:43:22 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:46304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZC7y-0006eI-Pi
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 09:43:21 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22TCB7UP018430;
 Tue, 29 Mar 2022 06:42:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=iaXFxf36Fa6wASN5NJIOJwL7/+B9vJoX1P5OuO7Sesc=;
 b=vuTevTfsRHExiog1um2C5X6Z2EcK3k98IrTB5XsKEtnTuzI15SsEJPez/9MD4XH4+KNr
 mwOVMSeS+livKpHlmcJHjsFs7n77NdM9yyRFYquQZc4OA8oJis9J8p4DGczhOYB2WvKC
 eohza79lJWVxBrUr5P25JFuqVlij0xhg/UkGYevxuz7Wfu5EcMz3BWc3GGGsJts3CEd0
 H0TqwAgu3qPb53vSfuPyzhU32ntixY5opsfHcWwLb0T8AZkEOTTQD3HFpTQR9S+Kw8DZ
 gKOtl/FXfHFBkE+ujvqeCJ8jdICpRrCL/dlr9hzkFd3j9V2Ii7wG8ojJqLvuMN9q9Mfk 3A== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3f1xr8e737-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 06:42:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ozj+ZG7Vuk9qTR+ISlhVhzCuuzF/uRsSMlQrD18981LSwBPAJ0d24vfU6ZYKvaSTWE+KJ1iJS7p+YLOZyD7wppFqupLfY6uIClC0OIfkagmr7704tyrNEdbYQHIhF8UrQh+sLy+NTPWFtbki5gArHL+weyvkrRVH6BLoqb2u1f1gdC2N1pJd2KyCL5fuDH59PC8PM+4uIk3bT7XJxwaCWXb28saUdZdlhBtorxZgENn5e3JxpipXCMcS8HzgsITPNP9KzIHw9KLo+iE52sSoWBVF9pTQmWtCHBfAiJOER/GXOcgsFAw8aSFAapdaCkhEfc18usMen+KzOMuqViRSNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaXFxf36Fa6wASN5NJIOJwL7/+B9vJoX1P5OuO7Sesc=;
 b=UXfyQt2k+bsNFyYV5Q7pfhLJviPRsw4USx4BooX2zI9bpWcDS7jNsCA3yTs6GeNSu7nOco166UV3pumrYMDtH0oOxnFdhVBN9ZRKqSHiVX7DypY5sc3iHNgTv+fwnvK5Eh4CBdke3uNBNDARdUucWYK64ssVYMTyKKz8/GpNnNGExyrQHbMRu3HScKQ2yAX4FxFL/8PFTsiRDyPgzy+NF+E//7QrI0pn3yXj26XLyudfVG/cQIXcii9eNx8L0TX+cO8fxO78QFu+UUWQ6nVfJJJrVjBVZpXH7BRgt6kyoGcHdSCLRPWUMq3hMVFxWjahU1QIzPgzytwpdyQT/RN/wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4048.namprd02.prod.outlook.com (2603:10b6:805:2c::26)
 by BY5PR02MB6193.namprd02.prod.outlook.com (2603:10b6:a03:1fd::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 29 Mar
 2022 13:42:47 +0000
Received: from SN6PR02MB4048.namprd02.prod.outlook.com
 ([fe80::f5cf:57d:ddf6:945]) by SN6PR02MB4048.namprd02.prod.outlook.com
 ([fe80::f5cf:57d:ddf6:945%3]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 13:42:47 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] Added option to take screenshot with screendump as PNG
Date: Tue, 29 Mar 2022 13:42:33 +0000
Message-Id: <20220329134235.44298-1-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0208.namprd05.prod.outlook.com
 (2603:10b6:a03:330::33) To SN6PR02MB4048.namprd02.prod.outlook.com
 (2603:10b6:805:2c::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8fe8b61-3cfc-4760-803e-08da118a02a2
X-MS-TrafficTypeDiagnostic: BY5PR02MB6193:EE_
X-Microsoft-Antispam-PRVS: <BY5PR02MB61932AA1D21870EB6EFD05F8991E9@BY5PR02MB6193.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kTG88FM2S3x8f7alD2RMWjTDH1sJHq7vlges+JaZBNBnuMHP/duRq5XIoEhHXfszH3DserymcV4hBdV2zV0U9If8nVt3I594h8GIM7UPJZKGVLgYNigy4mTSsX9fgcOKi35G7aRcZ/MOgFwxUUwKyDkTHhdxgc2c1R+Rhi62LKo2ChQAK2aBn9lTysf698Xs9Qb07kVqGkluvBvsWlc0FOKVE+8enCAgWD2CW5GNeCvN6JboV/pStJU6NTgdfs+diOxl/Q6SDaZ8KF9MyKMolD9pGFcZj65HJwLHWjvufL5f6k0YpsEA+B/pBkif2wEsjI98rSP464pzK9PR2m8YOPcxCNmSVP+jMaWchQTdbHsPN/6ugiWpow94r8capcbosGKdaS38YbCPMfilSrO2VpoAL6nrXHduOEopFdYWX8tphMFWJPQVYutwq1y18psvq0mW9KY+b5OTtahk99C2UFtCti3TZK/7FXUkhXPzcYcf127zieogewpnJbYYYBLpg9C0fkwgfaFsVJDi+Z0NMOwwjZCwVPwNkq563qpTuhCID3UWogoBQF7oDp4wyGJjevFDrX24lNgNaKPntgS5VOZ4EArD3Hz/yJSRqlwDgMt7kbJQoQzNyALwNmeuw/JYXvxFN56UsT5kkAMhTTfQkcMCAv9MVkV5QizJd3hR5ZbrnOZzXupSCoHg7PNq40KMyqo8J2Z753qSt8VkOqXFhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4048.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6506007)(508600001)(6666004)(52116002)(8936002)(66476007)(316002)(4326008)(44832011)(66946007)(5660300002)(36756003)(86362001)(6486002)(6916009)(8676002)(66556008)(83380400001)(38100700002)(38350700002)(2906002)(186003)(26005)(107886003)(66574015)(2616005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D8N+sAiu+FL1I/3yrwQ565Q64Q8iFZS05HwFmJr7/bukMkSXg5JJm83u8a34?=
 =?us-ascii?Q?p0AmkhQw1plxi0DAERQfehvI8/JjbzPP2WIuUN3VnYJQOO4yGGxCm8F42XOS?=
 =?us-ascii?Q?CH82M+BUqxn0JJMz6lbmyb/ZDn9oPRwgBENbqdgBVH3dc6hECg05GsmUkwaV?=
 =?us-ascii?Q?7hOutUAQ56fpwHQGBUuiofQlBurOudf2Fo83EY0fnVYS4YlmkXL04Iucy/JJ?=
 =?us-ascii?Q?yvEzy47d2f/gmNu9v0UukBp7ezXCCKMLXqgXP10dXGQawv+tK2AD5viHO1fR?=
 =?us-ascii?Q?NWBuZLJh7/lyngXjw73cusN0JtOBIWIDvblHSAlMlVdwQQ+toy0BVQiMN0ws?=
 =?us-ascii?Q?gNUXSM1XP7+k8myJIoJp1hQgpOYeXT72N/BgNY+auGnrSzCI06U5Jq70lLiU?=
 =?us-ascii?Q?to2QsWnXYblucbH/NW0tQcOLmrRaPhIcai8Hm0Zt4zXl1I92DV2pxOyoc0m4?=
 =?us-ascii?Q?zlgiV0hPIReDsN2Cll1SgvJoApRpXa1JtM8uvDX1TcilD8INQYLJN+FjZiVA?=
 =?us-ascii?Q?3zQu3RyfVSctwjui2PtX81DRIw8tCba/xgaAQePitPdVOzZd9w50kpEgLDbp?=
 =?us-ascii?Q?7h0kPCSb/YrqcmQy5XwcHlksj7dbVIiWrytai8VMxW3HWbSF9U21gjBwavhf?=
 =?us-ascii?Q?Ykqm9qYdFkDbru37CaiTAH+vbQnnpW6kNLwjNryhgPlW5zS8gnlwIZkgA5Sc?=
 =?us-ascii?Q?hPNzmdhM2FfhoGCvKlhsZtxTMrkFQcCtnw6JCsNq1/V5h2647u1K4NSDQCEG?=
 =?us-ascii?Q?7MzJtqi7Qif3K8ySfyaU06G29vGYUnd7ljT6suFLHvQtRzc3O/qWLT5A7lu9?=
 =?us-ascii?Q?PtNhEXVp24pKTDnUVU8xaI1rsPWEBpoL5HrsvlmqqhoBRfIyaOzGz9rXBJlg?=
 =?us-ascii?Q?wAO89VHBf8D666hk4IoImCEJmeK/5uBCPGSYprebP4bVgalRxPysXgX2qSxb?=
 =?us-ascii?Q?Y50OB6ey2GU6PCdsJAo9fE5Vc4SJHYfcfVC/cSfHovcr54EIKcoiC4b6gPo0?=
 =?us-ascii?Q?tS8oC9Bp33VuvZ16gzmU8wyhs2zZ8/f5d85UA5NE1AiAd3NLrJFbpVnhEPaC?=
 =?us-ascii?Q?cevuk5HTX13eFIQvLbKySTSJnklLQo/lB1THFV8/Q6fEuZFRUNqdCaRK7p/g?=
 =?us-ascii?Q?kpw8uEz7gpDluK6LM5QPI21iGFw681G9RLBz1ribbImpDqkua4d9WVP5IAWf?=
 =?us-ascii?Q?adSzOevX8hQ9VBFotHjeU7iXl4LbgAEeXBSHIF06o4Ca6SgsKVoP3S+q6XQV?=
 =?us-ascii?Q?zbfqQ+YW0jqESrG0Lu/u/SHNXqPj/y4GGouIRc55IYMsJKTUQCl3y3euMCIa?=
 =?us-ascii?Q?Be6j5alaZNePGl5AA943GYUAcugWQWf7mh3QTTcg7592bLKGdJoIR0hBIZ4C?=
 =?us-ascii?Q?UYauPES5dmFZaNT7lL6cDyQeCvYwb9iWgD+Vi1wc5iElsb3bmD2gAg/u091R?=
 =?us-ascii?Q?UIFEM7wMFX9ipKYNFm4THV6OL3cVn8nR1WxwGfECQISgGKO0nNHc+68WlHvT?=
 =?us-ascii?Q?TuKKD/q16JJaZ/RbPdFm5BVy2SWwWtzcUA+q8TeEUJqsgbrN8gIuesUxlLRB?=
 =?us-ascii?Q?S2B5AsuB6vrTfbvBgNH9Oshj39kPUR1R44Lxlo9bNNGSLQr7VQUZkW5amAkF?=
 =?us-ascii?Q?edBMWu8yn1KKrh1MLfQuIQYQSRfvUKIIYltLthQUE14A41ZCycMY2A0dZDwC?=
 =?us-ascii?Q?h17ZqNhR1QhOZdHXAWJmFGb1IlNf9Bz0Xiasxf+BCouN1orAAgV//DHmbs2P?=
 =?us-ascii?Q?PzRTKrpm4NHkvtoRlz1i3P94BmZiy80=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8fe8b61-3cfc-4760-803e-08da118a02a2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4048.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 13:42:47.5896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zs7L5QyZyYmETlzurGrkbaee0YDFzlM8v7tYmcJF8858UoPhu9pKeQbTpS9LzlrniWI4qupSBVTnrS9tMvutT/PWqClhu+PSjGmoa+rkm9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6193
X-Proofpoint-GUID: ZJiTYyPYlSgSXDmiPSj9KfGVC5BTCueC
X-Proofpoint-ORIG-GUID: ZJiTYyPYlSgSXDmiPSj9KfGVC5BTCueC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_05,2022-03-29_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: soham.ghosh@nutanix.com, peter.maydell@linaro.org, thuth@redhat.com,
 berrange@redhat.com, prerna.saxena@nutanix.com, dgilbert@redhat.com,
 armbru@redhat.com, Kshitij Suri <kshitij.suri@nutanix.com>,
 philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series aims to add PNG support using libpng to screendump method.
Currently screendump only supports PPM format, which is uncompressed and not
standardised.

PATCH 1 phases out CONFIG_VNC_PNG parameter and replaces it with CONFIG_PNG
which detects libpng support.

PATCH 2 contains core logic for PNG creation from pixman using libpng. HMP
command equivalent is also implemented in this patch.

v2->v3
 - HMP implementation fixes for png.
 - Used enum for image format.
 - Fixed description and updated QEMU support version.

v1->v2:
 - Removed repeated alpha conversion operation.
 - Modified logic to mirror png conversion in vnc-enc-tight.c file.
 - Added a new CONFIG_PNG parameter for libpng support.
 - Changed input format to enum instead of string.
 - Improved error handling.

Kshitij Suri (2):
  Replacing CONFIG_VNC_PNG with CONFIG_PNG
  Added parameter to take screenshot with screendump as PNG

 hmp-commands.hx    |  11 ++---
 meson.build        |   9 ++--
 meson_options.txt  |   4 +-
 monitor/hmp-cmds.c |  12 +++++-
 qapi/ui.json       |  24 +++++++++--
 ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
 ui/vnc-enc-tight.c |  18 ++++----
 ui/vnc.c           |   4 +-
 ui/vnc.h           |   2 +-
 9 files changed, 154 insertions(+), 31 deletions(-)

-- 
2.22.3


