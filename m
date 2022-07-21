Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFFA57D475
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 21:58:58 +0200 (CEST)
Received: from localhost ([::1]:32890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEcK0-0001AP-Kz
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 15:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oEcHk-0004nq-FY
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:56:36 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:23280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oEcHh-0006aI-39
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:56:35 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LILbIe008250;
 Thu, 21 Jul 2022 12:56:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=Lj5w4mJj8kjAFdzWnecDvcqixsQf65a+aZC3Zbjc/QI=;
 b=YviSwbbq/wtHRobslkiimsezWD2YJZdWsVfQcqpA1dqHMuMXG0dm3IUqynwCOQjJVIp2
 muRdj3On8eDW17ioK3dMcRHL+OzvW33eAUZuwQL+BuBkVb6feA9dPC9GG8A2KVbLkHuo
 NZQILkreD0+8nCp+XHXstBc/UxQDOStwE/FLoDQ5SJMVtKExUwZ5CY9f7EbbX/M+Yp13
 HsHoZiyEleTLaqPHGEY+5R0VmoLFl6UGKLt+Ckpy84y5Y7QItnxMrAcHudknxuP0YlqI
 22OEPww4wt+ZJYWTy5VniSGtC7AyHqpQqivJ2KKoyf/vxHdt21CaqX86hhPF5ldmWXiA WA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3hbs884a93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 12:56:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAWDqmBvrlHHw8RfXPFblT6qFRTcRWan3uHj+I/WUbxR6xWb5ao+zBFr9t732ND5qVYK0MNsLxmcPb7MX4VHQg8uAhnapLjhVyhro5X0cwWQpTVEgNNJ9PfyCZ8h73WpHb03fLoM+C9WF70FqOoZhgImgfKU0KB/jOk0+paPywJDsW+aPWqN2Tx7YQUhnNERbvUog/A9rvJRHnFjFwVdrmL+QubDKOuOY0TtM+mM6BXf+/8fDz0xMHRzCoIvSIutURditzYQIfnNVOkCLZW5pwGZ/Z9gBrK3hpJ6ogMdzufAQjfg9GXu1UvTCYcPBcLLT+Z08uCKc71SC/4FdQetGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lj5w4mJj8kjAFdzWnecDvcqixsQf65a+aZC3Zbjc/QI=;
 b=BB0UGteQ4CUAxlCt8emmNv+ku5aYrdjvJKipd1JQZRbu2mPqk7TFSKsqpEqoSMRQtR6vWY1ZdSEkpEyy+t5+ZU2OosdtBC313S8CCeftQ5TAfGrvqrkobqjpLn9YojHnf4VHsFh0EdvtTWbOs6XCR4RnCvcwTpTFQBjZwGjxNl667iXHiMhRMXu1YRfMctHMUM1dWCt9SINWh9nbyRV2QuAvlzdgI1QHC/T0NjkfFr9yZbaCDay/OVe5e83h7OF3OBZSqChYnz5ER5SUIj84WFE7GM9x2owAxXa1ksOwcKh0VLyNIrxsDntNvGab3PaL5nUs2BQSDSDuSc2hmnGQwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM5PR02MB2825.namprd02.prod.outlook.com (2603:10b6:3:108::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 21 Jul
 2022 19:56:25 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 19:56:25 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 prerna.saxena@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v2 0/7] multifd: Multiple interface support on top of Multifd
Date: Thu, 21 Jul 2022 19:56:13 +0000
Message-Id: <20220721195620.123837-1-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0035.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::48) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09d421d3-db6b-4c5e-7ad0-08da6b5317ca
X-MS-TrafficTypeDiagnostic: DM5PR02MB2825:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lKpcMaPXUR4HVH4dskKu90p9ZprM5TaPFpGg/Q7dnd/1YA+tdQ60AncyLO/gFWDidZAxlRCT15YKP27eDm1sMS4KLuPKuMCo3Iq/QDQd7rertwthDQwrPC+piRWldaZPlCEnylPw0h/UzWCweTG7z1FQf9IxMPpgtPgJYXsH32iIAUzCSmFQSdZg1n11GiO1qozOWEd2klokogooGQU/08x7kx8j+ezqZJZOXWR0tbHUWBk5XWkg+9CYzmsZHiB1wlkencV4pIruiCbb3rRaOVCC1HnQAkGQ1lPQeTlU4SZt7h8tfI2oeRhhjiDzZbDyuGAKEwhxq0bhaIRUPQfx/+T/qteX4bUyRmkaiY4sVfkJAlfg3Fm/DN4gZ9Aw/pH+dRlWpcN2U41J7T9vhspkdAHpo4I24mna2OpxBMNsYCdyl4sa6roTQBS6zNR0E8g22D6A3SpjJw/D5kY1f1Jfx3WYrtcZe08GcPLh2h9dxTIC4yIdqN5QKBLydI1IoD6pNi+LN0Kp/buYa07my/e9rxICTeoUKwO2vgj7hbusM0mzt/yZKi/Q9GWG5PbF9EwcaJeeg0MvxDMCXP7IyKD7+TuPKJhZZluvuSTNiiLAMd1OtZw3h5VrtoLa4908qjYtFamvy1DYFPOStWTVjDd9SenNXUNJlr2Tk07z9qySygoK0Df8L0yI8JAMJo7OUQXIibyEsIVU3CJ6EpKw2bqENKFq1Wt+AgcN+DnqO3HRYunkZLPHyNTf8YIKZoLy45J2qr66/rSBc5uLRZLEqxx0QI7hYjV6wkVIMvxe6NuLYqMffxljkRmm2o7rotxQSsHgSziIo7g+YOkI77N8I/5OUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(346002)(376002)(396003)(366004)(38350700002)(38100700002)(1076003)(83380400001)(36756003)(186003)(2616005)(26005)(86362001)(107886003)(6512007)(316002)(966005)(478600001)(66946007)(6916009)(66556008)(52116002)(6506007)(41300700001)(5660300002)(4326008)(8676002)(8936002)(44832011)(6486002)(6666004)(66476007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1hKu16F/jI0km5WR7hecm98781KSG8fbhqMUgJp4XT3M45CtG5uwRX2d9nIL?=
 =?us-ascii?Q?6xSHOow97zAxpBqs3C0r6yMik1kJUGQgAjsuFnyCbg3inQlNSeBW7y2njISd?=
 =?us-ascii?Q?4ldefIklJhvT1iuy2r5yxEAYYeucwVwOagMXlUoTaMZLvmp5R3SzPrtsYvwF?=
 =?us-ascii?Q?szK1I0hNJsecxa6iPsXyvVR2sqf4gpnRGGdKpaW8VrqZK7tF6LLF0q4C8cLT?=
 =?us-ascii?Q?Y5gUAQqBhC5YBYMNGutWN+hQ5uMthf7Dr0cZyCFXY3bwgGEhSU80rLfs7LeA?=
 =?us-ascii?Q?+jO7fai2bBrXw1GcqeGryqshFXiGw9vfM9Tk3tXQrzbu4RZEdAcTEWMchHHr?=
 =?us-ascii?Q?7EtqKiVcC0DZME14SvFVIXo+n7FzTSD9p1FzL0dpSSj9fX30VMrpRieP/jXX?=
 =?us-ascii?Q?N4WSm5y6pm6H/vpp32IzowNl3i0vXe+cTIfqgFJOH0oZNODzk7XIjSul2Za8?=
 =?us-ascii?Q?yiQzpQCOvZBf20KKiP/bDuMEGh+GWZQe8BmPJJHogvdTCraPtb0qjfIn8+HY?=
 =?us-ascii?Q?53VUTR3rdecYYceMGlczizENJFb6ANdP40+mFi17XX4D8TxgRTsn29RNzCSp?=
 =?us-ascii?Q?9MaDxJdXto0sYGECzDJd/HQ0hYRyC63x1lgluJQqw0CMRHBdCFDGCv4SjK19?=
 =?us-ascii?Q?kwghcxia1IIsFVsa5HXClFx7X7+rGLvRiLHDAuYrl1UAnEGBFy9mieVcOE4J?=
 =?us-ascii?Q?M0gQB9BH437jUZe1/V+07BcK5KlazVUuprPla58z3ULmvNCc2WZoFGu7A8El?=
 =?us-ascii?Q?+Jkhzl2wiq5sQCsAiTTyxBadCySXHwo2NNzmRzAMIkntyAolXJ6YNuNsP29r?=
 =?us-ascii?Q?KsdiPkrTGTXZiX0YGTkZGeNA6a0YNlvo0hIhDbPl99NEbfCebF4pu44qLWnR?=
 =?us-ascii?Q?+GAdFZrJLIbuvgXDS5zMOAlcwlhOXA3FI/DRts6y79yrj2ygYBH3sw9Zi77Y?=
 =?us-ascii?Q?7xea2hE6iBZM3sOhF5Sv/kqDHrguHQIn0Wv9UTE6alhvzGyizB5FmcGILU3p?=
 =?us-ascii?Q?TFt6QrxYr1DnobwvATTR5wGJixtsnpFF2++w0EmMzvVxdNK5T2TiBYh3NVzR?=
 =?us-ascii?Q?JUE+8DtZzDypkY04Pget97vZdH+P1eAIeX/6xsf69rCsypd1uWNBGqXTAqDv?=
 =?us-ascii?Q?r/TgQL0KaHWiEAjvv2jbOO0dT45YVl3QpzFdnMfbMzDVewL92OhSFIUE4ARi?=
 =?us-ascii?Q?MvXd7VCLbUM+AiXjCl6LDIrfdG+JAJJlZkVjyCB0euqDk227rNLePDEHNz1D?=
 =?us-ascii?Q?jBVqC85f/jIJ5xBKc65YV0RIDDXMQEo/N+zWTHJzhToxw/MeSPe7L7YBm+2Q?=
 =?us-ascii?Q?N2l4c+++Dge+lu+YpDm8sF4LCBS8mZ/wevUy3QOkFWVGYnjslZVOzbmfJumm?=
 =?us-ascii?Q?Bt/smJRj4ChY8b7efTSSlZUbORPmo30Rr7b6zrOpr78oWaxzdZjmEsd1k0Lu?=
 =?us-ascii?Q?TIoWx8oRL21hW+W+cB/A5EnrUWQhg7uIl+IiZTeGOhGho+eNix1Hf5ExqQCE?=
 =?us-ascii?Q?E45uK7dpXTX7/1s7umEfsdw0dFH4HcVLTk5jceCpHInSVpN15Frr/1oUkbfg?=
 =?us-ascii?Q?el7R3i4ptjmzF6ccakv4imNF5wTBy0qWoOJumwGd?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d421d3-db6b-4c5e-7ad0-08da6b5317ca
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 19:56:25.3668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBz8zuM86J44DTsNHo8nrCrjDqDeFBNZskHVI5RVTIddVJ6A2OdTlzwbfLxQKOFdvewaEMmRHWAsmgWYvKteJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2825
X-Proofpoint-ORIG-GUID: M5BMnhU3Uvui5mX17iNgfJxa2OIpBugg
X-Proofpoint-GUID: M5BMnhU3Uvui5mX17iNgfJxa2OIpBugg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_27,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is v2 of multiple interface support over multifd for live migration.

Links of previous versions:
v1:
https://lore.kernel.org/qemu-devel/20220609073305.142515-1-het.gala@nutanix.com

Thanks to David, Daniel and Markus for their valuable insights.

v1->v2 changelog:
- little helper functions shifted/added inside util* file into a separate patch
- HMP changes are split into separate patch
- migrate_multifd_channel() API been restored
- removed total_multifd_channel variable 'OutgoingMigrateParams' struct.
- qio_channel_socket_connect_async and qio_channel_socket_connect_sync methods
  are not updated
- instead introduced variants qio_channel_socket_connect_full_async and
  qio_channel_socket_connect_full_sync for connecting particular src and dest
  ips for live migration
- added code for validation for mismatch of IPv4 vs IPv6 for src and dest addr.
- Few nit whitespace changes in qemu-sockets, are split into separate patch.

Abstract:
========

As of now, the multi-FD feature supports connection over the default network
only. This Patchset series is a Qemu side implementation of providing multiple
interfaces support for multi-FD. This enables us to fully utilize dedicated or
multiple NICs in case bonding of NICs is not possible.

What's new
==========

The HMP code changes for source and destination side are split into a separate
 patch.
Little helper functions for live migration from different patches have
been added together into a single separate patch.
migrate_multifd_channels existing API have been restored. Instead of
pre-computing total_multifd_channels parameter and storing it in the struct,
it is now calculted on the fly to reduce complexity, and are equal the number
of multifd channels coming from live migration API and qmp monitor command,
are verified.
Instead of breaking existing methods while establishing connection between
any non-default src and dest, created newer methods for accomodating src_addr
as extra parameter for establishing connection.
Added a check for validating no mismatch between src and dest ips for IPv4 vs
IPv6 happens before connection is created.

----------------

Het Gala (7):
  multifd: adding more helper functions in util files for live migration
  multifd: modifying 'migrate' qmp command to add multifd socket on
    particular src and dest pair
  multifd: adding multi-interface support for multifd on destination
    side
  multifd: HMP changes for multifd source and destination side
  multifd: establishing connection between any non-default src and dest
    pair
  muitlfd: Correcting nit : whitespace error changes in qemu-sockets.c
    file
  multifd: adding support for multifd connections dynamically

 include/io/channel-socket.h    |  44 ++++++++
 include/qapi/util.h            |  12 ++
 include/qemu/sockets.h         |   6 +-
 io/channel-socket.c            |  93 ++++++++++++----
 migration/migration.c          | 195 ++++++++++++++++++++++++++++-----
 migration/migration.h          |   2 +
 migration/multifd.c            |   6 +-
 migration/socket.c             | 106 ++++++++++++++----
 migration/socket.h             |  25 ++++-
 monitor/hmp-cmds.c             |  66 +++++------
 qapi/migration.json            |  93 ++++++++++++++--
 qapi/qapi-util.c               |  36 ++++++
 qemu-options.hx                |  18 +++
 softmmu/vl.c                   |  30 ++++-
 tests/unit/test-util-sockets.c |  16 +--
 util/qemu-sockets.c            | 112 +++++++++++++------
 16 files changed, 692 insertions(+), 168 deletions(-)

-- 
2.22.3


