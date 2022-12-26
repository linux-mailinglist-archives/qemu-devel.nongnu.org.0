Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45481656021
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 06:35:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9g7f-0003u1-NY; Mon, 26 Dec 2022 00:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1p9g7d-0003tk-T5
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 00:34:01 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1p9g7b-00019N-Ju
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 00:34:01 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BPLo3f4027688; Sun, 25 Dec 2022 21:33:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=jbHdDkxqIZgMqvc9SLx2bZzIYRuHcB8pP3JjCJJ9rZ0=;
 b=A5CwkG7+5+JOn5hJQUb5BxW/OOtU+0HubUB1LWpZCyDmTDRFULUODZkAD6QBzCH/8LHY
 XT+sg7Ilhs4iEPy8qwxaG+ALPTfepyayXBRy0WPMKA517SSeZu2qJusmn2xD0+5V+U/d
 pvBYJVmF8qZDqL95kcHdxpo05Ilvko9lGS9t33Qphk3mHuj/sYO4msmQuKLhjEviwlrQ
 hotmxlr+8HBIc4yc5J7zi2JyWKsX6JtiVCGEiEgaeXTxOZjvqjjyFrRyg9YK3wf3sJ/q
 00vyXo65b2etZNigcswjIi0XNJBOOY8EFKlODD1GO84GdlrKgZVsSt0xL1Vtcz+WhSSR kg== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2043.outbound.protection.outlook.com [104.47.73.43])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3mp1cnuc09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 25 Dec 2022 21:33:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OB4WmpBcW45eN1nl81heVt6F1pxshuRlMcVGvQLm2cA9z4wD6DpsVVMpOaSHfPcMrB5WcXzMdOhEoMHNOuySxL9x20ZFSpdA7qd7rWYx8YrzvJNhtoVgnULrRYqgG82s5wSZfBRIqGx7+k+sdRKnJsRxjHdw++yCR/tTxftzX76ETJBHTQajRP0HKiMoTvNYGQIbBMQyBmxdjqBgKJlIJpjtL8MPDf8IMHDSqadGUTtFrR02XFpzouHrfuvvZx1cFh4zwa+3uMVbOYOhms0nzoYQ25e2U63k7YOr9aKDgPy7AXcJ9261eWHLJ+Rt103I+f4i4Ss+6CAWqqtPYfXCMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbHdDkxqIZgMqvc9SLx2bZzIYRuHcB8pP3JjCJJ9rZ0=;
 b=FP+/r+KrvbhPWmh+06/2+aZX6fmIFXXpNA2CRDy6SNexw80BnqCJTrO0y6zX3cCgFlWuY9PlzH1u17SXNyfpmAQ0ql798gkepICFwqcNkjrf5aGHsWdiInHlQG+lg5fPjirHt/D5fDI0VDqkNguTsARz44j0CYvaCCYNGN1vd3Q09QObBFCXXG+djLUXTTMa9/EjQRefxyfSv2GAlEYH2kbhhP7kX1qqfgo1T4n7y6M+jDg2fBrnjoJI5tDrsBgQV2G7nWPHPkovq9u4iIOrfgFpFv1yp4EPd+99hJi9xQ1bJEx5pMSFczlaDxhAU7y1ojWcaGIxDnv7/Civ8YHQ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbHdDkxqIZgMqvc9SLx2bZzIYRuHcB8pP3JjCJJ9rZ0=;
 b=aIYfi8chujFIPB89zhZRtjLyOCpY35+uR03LJ/fc0TqzY4jyH59KfBmtS6ryp3Ibx87ZRdXYNMW3SNCVZw3XaqaQf2R2MEMM3BAuoxnJCnpaD31FgQ8amdpJWstit2o4zyklKrlsTxQRrHfFAETb6m0aT4uJfm/TJHNOkDhK9Fw/tKCmtifcy3fP/wiC5AerKLUwfhNMfZTkmyc71hIbgLS2XiaTWEawF3EibyxHk5e4OR5i49j7NSW7bJgdBWi9/ui6CmOdghAcZsy3QeSHo3WnSFFUkG1xxoORFM+JZ8W8u9RrwwNgeoJ44xdphAEajfB8EEmdYirTTzrxTpoxKg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by PH0PR02MB7655.namprd02.prod.outlook.com (2603:10b6:510:57::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Mon, 26 Dec
 2022 05:33:51 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::6713:972f:95c7:a1f3]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::6713:972f:95c7:a1f3%6]) with mapi id 15.20.5944.016; Mon, 26 Dec 2022
 05:33:50 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH 0/5] migration: Modified 'migrate' QAPI command for migration
Date: Mon, 26 Dec 2022 05:33:24 +0000
Message-Id: <20221226053329.157905-1-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0009.prod.exchangelabs.com (2603:10b6:a02:80::22)
 To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|PH0PR02MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: a073d559-b0b1-4b6a-2032-08dae702c4d2
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 29k3LcSIMzLLqEqN01c7b6hRCwaA13z3oxjGIyFuyrzB5A7QkWB5CiFi4kkAPgPidxG8aUSKV6ROdaxGG+Ws6qoJH7udaltsRjsN7dX+Gm4BRvNUB7iGXLsV0Rcs6gv+stFWdaAQUp324ZpBt8FwXjJQlu4Vc0uhI8M5YU8/YSiX4Q2waSgKkkPpw6c3lHZzGXO6jC+V5qhAMIk5xZuHNm+0XGHzg8BB7WrEX/gvwKEwniShewId7gpAThnMtxZ7pfuNEcwGH7C5dGKL9YxysPCYuQnv8FYwyIZqVkwY/CQ9xgTgfrrT03P9Uf1GsBgpR48eb9O29iNV+J91QRhj9w1NHzxE65z5jrO4zTLa55ZUsjZ2luzbQvEFy4Utnq3qwlTLVWpM+386uF6YugMP1lMrfKsIdc4zJ74UxA2Fqyh9XueJKq8RE9H7oVnt+05GLUKrz/YDKtdaG9aeM8KK0Lb8j4vo5d53sZZ8XLsH7FsgUQaqRLOwt6cACSWL2fG82XACYkx+JHXoj8iBj6ezPflc71jd9RDOJqTE7rehaPRtPdEiIBD23Y10DfwaeurpghJGnfzeaWBiyLHtU+KawIU9zCW03+EcUmDsatL7a9C+fI3Q1SQ9FHQrItyvzFOnnPtP/LiIVUrw4ogG1XAhN1ZYN9dT+soGJq0XANWz/fQ2Wu8t8PiyGSsX0DwsSi5O7tNF6v4TYo/7OaDIlAitKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39850400004)(396003)(346002)(376002)(366004)(136003)(451199015)(36756003)(86362001)(26005)(6486002)(478600001)(52116002)(6512007)(186003)(107886003)(6666004)(6506007)(8676002)(66556008)(66476007)(5660300002)(66946007)(41300700001)(8936002)(2906002)(6916009)(316002)(44832011)(4326008)(38100700002)(38350700002)(1076003)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zuW80yrrLot1SG0Psle2SCkvs2p9HrCqM4dX4SpUB7irp2Nx2qb+BisDBFVe?=
 =?us-ascii?Q?tdkH1x6Pq6/6OjucOeE/4o08rcIbTgPKWrLbQ46CzBKvDnooIQpuTW86ZjPT?=
 =?us-ascii?Q?UQLmUfkSSM2L3xYROIzfMGQYcc7sHS99b0YSw2Cd4i7GKPVnIxb0bAzGPjgF?=
 =?us-ascii?Q?14tNLSXTYP5uRdvgsR8YVVBlbSeeSgWHujuTK46R1dP5bE8rcHgVvQQA3YOt?=
 =?us-ascii?Q?J/2T2sTC6iNBckBIVceNrLgqNMymOzTRNfqdK4C/vqAfVPdrtVKiRKC4H7ap?=
 =?us-ascii?Q?sZSjkDVtDrUD7fizzBayczy61b4m3v95fPLq/aefswM2QPp+poSV1dpGpnWl?=
 =?us-ascii?Q?ikhP+j7J4v5yD2AcC8p1sFbfHi+RZ9dl3yhpr1FOUVS9pxAmPQg5i+3ysvEI?=
 =?us-ascii?Q?QT0KaNtuWdG2uTaz8mQOOKXt7SSIzcErZDcRh5PDEin9trEpAPRPQ96mkaQw?=
 =?us-ascii?Q?5oQaSy1TzG+e/AojhS62FeaBTqH+6D4NClxDJ1YZAln56HO3QSG1dk71XNhC?=
 =?us-ascii?Q?Otu7kkf7ImWIIrrlGfUo/ojZBKI0ECexQ77ZNBFrHYp9x4RMvguiIkcEuNIN?=
 =?us-ascii?Q?mafc6taZc1tMckWPiD7PIZrCYael86GC6dzOeyjuwIixCnTHMsueBmD91XTR?=
 =?us-ascii?Q?ZIDvBuGN3YPrkGulLbYgdQDztjQYoPLyANNBUCViz1ipI1IJRYcqGDdQtGbG?=
 =?us-ascii?Q?uYJ1eC3k7yP3LbZLsGW65hgSnBb0hk3ndIH5FjGClfXkM6WxFaW8FSgZb86u?=
 =?us-ascii?Q?o9EDJbscviaY/IVBnSF7jW9GHH1pl5juizNjaMs471uRiqx087n5BlryISpj?=
 =?us-ascii?Q?B5xRawWrmFEV8KZCiK86ID+ctn/MZeQ09ST3h7cPc2s7gFIcRHH324cH4gpu?=
 =?us-ascii?Q?9g5LBWH3equgO8OznA6JlKz8Oqy03HGz0ayI/ClIrZbnHNH1pg01yvvpjO1m?=
 =?us-ascii?Q?OIaSfic4J7sLTu3jk9AiMBWlLhQ1vmQq7CQX+BBYAsJCer2kkXcQQPzK7eK+?=
 =?us-ascii?Q?mNLw8SOlE0Lk9kdhBZ/KQPGCrWuU5oLZtS6z7voPxmZCf0m823/A0JkXEDeC?=
 =?us-ascii?Q?hgDMBwkpO4n6uw8whzOuuU3UTLdyc/+2+qorSFzkmYAFyNCR7tn/A1e/eaOH?=
 =?us-ascii?Q?dRhVCCpotYlfRv2NBFETXqfPt1d7hAU1UIGhxnblWpvsURDTczGpHGzPh9uL?=
 =?us-ascii?Q?Scv+VNt6B31Z+Y9L1HdPffeu4M20ZISKn1iw072/a4FEkmwGmvodeZ0PDnB7?=
 =?us-ascii?Q?FPAXqeAA4exfQFXYtdxL1nhSt2TCXv2iGucK0w6zL7XevRaLaQzaybAu9AJk?=
 =?us-ascii?Q?gq4IqkZaB7oQHE1WaBhV/smQ39I2QDwluV9JFRUu+3GorND0pnryG16cn/TO?=
 =?us-ascii?Q?fFLyAKO+USpjO5jncD2Z4O71iF+jOMaYvUKaFDe0fkQpIYKHy5/OVMAeiNbF?=
 =?us-ascii?Q?RdHWesypth8f+f3pu3NnpCqtKmAr14YRUalKcRD42YwD0Pjs2MLyaXc4uA5P?=
 =?us-ascii?Q?5VQStzpADGoMBFoiB2xb3YoisGvivh5PbA7EoScar7ZweVHSiFKVvyHVGGVe?=
 =?us-ascii?Q?6JZpUCEwVuQj9PbxPH906mBCGTFrSGpRReTFSi+k?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a073d559-b0b1-4b6a-2032-08dae702c4d2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2022 05:33:50.6902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAxVt0iOVEK9MKRTysMTVobn1kqlyFnquss5PvU2b0CnNLILuwSTahOsNxl5eH8D4wyj6mC+mnAgHH2DQ66IKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7655
X-Proofpoint-GUID: doufIR5Ie4-HrcJPUX_x96knzMMXL2EJ
X-Proofpoint-ORIG-GUID: doufIR5Ie4-HrcJPUX_x96knzMMXL2EJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-26_02,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Current QAPI 'migrate' command design (for initiating a migration
stream) contains information regarding different migrate transport mechanism
(tcp / unix / exec), dest-host IP address, and binding port number in form of
a string. Thus the design does seem to have some design issues. Some of the
issues, stated below are:

1. Use of string URIs is a data encoding scheme within a data encoding scheme.
   QEMU code should directly be able to work with the results from QAPI,
   without resorting to do a second level of parsing (eg. socket_parse()).
2. For features / parameters related to migration, the migration tunables needs
   to be defined and updated upfront. For example, 'migrate-set-capability'
   and 'migrate-set-parameter' is required to enable multifd capability and
   multifd-number of channels respectively. Instead, 'Multifd-channels' can
   directly be represented as a single additional parameter to 'migrate'
   QAPI. 'migrate-set-capability' and 'migrate-set-parameter' commands could
   be used for runtime tunables that need setting after migration has already
   started.

The current patchset focuses on solving the first problem of multi-level
encoding of URIs. The patch defines 'migrate' command as a QAPI discriminated
union for the various transport backends (like socket, exec and rdma), and on
basis of transport backends, different migration parameters are defined.

(uri) string -->  (channel) Channel-type
                            Transport-type
                            Migration parameters based on transport type

-----------------------------------------------------------------------------

Author Het Gala (5):
  migration: Updated QAPI format for 'migrate' qemu monitor command
  migration: HMP side changes for modified 'migrate' QAPI design
  migration: Avoid multiple parsing of uri in migration code flow
  migration: Modified 'migrate-incoming' QAPI and HMP side changes on
    the destination interface.
  migration: Established connection for listener sockets on the dest
    interface

 migration/migration.c | 133 +++++++++++++++++++++++++++++----------
 migration/socket.c    |  31 +--------
 migration/socket.h    |   5 +-
 monitor/hmp-cmds.c    | 101 ++++++++++++++++++++++++++++-
 qapi/migration.json   | 143 ++++++++++++++++++++++++++++++++++++++++--
 softmmu/vl.c          |   2 +-
 6 files changed, 344 insertions(+), 71 deletions(-)

-- 
2.22.3


