Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B139F68EB9A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:36:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgsD-000709-MY; Wed, 08 Feb 2023 04:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pPgsB-0006wz-LZ
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:36:15 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pPgs9-0005DD-5w
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:36:15 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3185T1sW025574; Wed, 8 Feb 2023 01:36:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=twQ9LzofZ+qycf1IQDuTsFFO7/SX+ztzg4sV8j9BMTQ=;
 b=deIPxqlMxH96Gy0dzBRBaJ0E1nmGjYTWYoYEeGys945avClUiVYfYSSV0bfWynOblqJR
 +PK6fcdMyviPh9Uo2ugpn2MMvCgt0pXGy3fAMM4XZ3pHYGLnal7UovdwsGNj8WVjjlGc
 BvHh/tjnkb4Xkz/sHkikglSX/f72gduzlW3oKtJCaezTckziVj8DR4zGkUQybyeEl/JL
 t6guNnc1tgj09CXHWTvTIX1AqpKNy8NJefJ6MxXNAF19IBQ99F2YGAwJ76UmSdA9eq6q
 7HRhdbWKKpsL8A8u8CIkt4X5fLAEBFjMrG1+K0Ehloc/nblRog/cpxZjQcDGH8TkZppT fQ== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhmk1bt2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 01:36:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HM+9EZ2Bh0mN9Sgwgmt3yX6A6IpLS8t0SM+hBG06azZcyCrmpmYfbIvBbCMBAJKRkS/mMF1IFFWngzfT+YUiq8j8W8x7Wk2m/nKqDvhe1bkQSgP9/OnXt5pfGCPGwKoRIx6Hr7ETqQ2NyMTeBH22TpX865+pCNygxxTgRYNJ3DWrTllOMU07lZoKvNQwDy0R72ODIdqwqSwzpHri1cnQATvFi4Zt/5Ue6zhdFn6LwiScP79k89SK/iZuae+V1ZDtBB2ddoMC8AINYV+ZQW9k13Ruvp5Ok+TmH9+Lo7uRvM6/VtxQaR1hK9ziRQ0fixkcRAuU1+5PycIUKYfaUEh6Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twQ9LzofZ+qycf1IQDuTsFFO7/SX+ztzg4sV8j9BMTQ=;
 b=DSvSGG1H2oY26AeHxF1ItFgtmueAsRk9fHsg76PW2TrujIDWCqB0fYCVVEMs1Q/fRMk0+r5miDtEVU0YGjwjI7Bf+MF1rwGhoR3/hBR0s7Cl7pzXJip0CBDzelVKSAm0rPTIsqdcLhlR2LuNTcHDx+JGRiwjJyVw2a5Zr3LQTTajXrU+GnesVPlvI3eeFRztYCEvjDvaNCvA0I/rzeRmRg5aYS6ud+iUvMmNAETk4UaAvL0s42Q4bx9QPs+z1Y6rg0pWz/be52pHO+U1wdeS7lHlx22FKj2tYMIRa2SwaSDygqiAzm40Hoyl5q3KIeeUsRWNtKr66dpH1rDc/Q0+3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twQ9LzofZ+qycf1IQDuTsFFO7/SX+ztzg4sV8j9BMTQ=;
 b=REB/epu8WbRWYr0LJlQ7LlMG8qP1UyV8yQhwYBfmz/EvMv0leInliIltgxuvPxX0c1PSiY9Wy2D+UrfJeQK6Etp1cvBl8W6pXDUviD+520ShatnKdFU9eml1mO8R6RAkLpRNdiopGJZtWqVLU2r9QkzM9Db18qj5QiLF7xGR++JPf9G4/2bPzhntNX7dRKGAm+Drx3l2np1RDCde1ttE5k6LP2kXAwj+HN1BKwcphKKEcdV7NxUF01A5x6jTdvy7r8Y9JrzhYE5ZDdd/bNAPq00ViVJfEPqBv26pC8oAM6PtEEDLuR39mIUHKtLoaYQMq6q3euF5HBaesvgd3YLEHw==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by CH0PR02MB8180.namprd02.prod.outlook.com (2603:10b6:610:f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 09:36:06 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 09:36:05 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v2 0/6] migration: Modified 'migrate' QAPI command for
 migration
Date: Wed,  8 Feb 2023 09:35:54 +0000
Message-Id: <20230208093600.242665-1-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::19) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|CH0PR02MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 53c7b0dd-4ee6-487e-63fd-08db09b7e66a
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VenxENDsfmSk5VP45ip/xTiITd+9/RGvChDGCddtgHsrQcISEU7ao9j6EPnS7AfYz/ZXMYqu0zwrhvlNUI3jwOT5XbMs7y3rhN9cxtD8GSMqXY1fp+4O158N3ctbKeW79A3fzGjAOln4117mrDCMGgaqehDZeyVnwJL8ccW23ua1sYidflhknaFH3SIhlMnlvc8IO5PWgPdOzmYIfK97Ysb0xJKnvcGmQjM8ku6/Dl0ycmemCYuHjvHzfSZRYv7Bsg/Vr6sktQPW9QrxJk1b1YcDzR9yMHSWayAEJuDGuDJ82kIMI1QITIzhMM0dr6kFMn9GZWgAzZ8qRBApOM5LGVqmLJRj4wn3TWRW5D0Ln7AxHe07IZLnUNMWPQYmBtHEewdPZCVshFy3JmBSgsOvx/kKeiHp3eN7Wehsn7LeYJBNnZhw86u2BPegEBaTDpKXMPB3bi+p2gxOxRIdHPZj3BLf3ejnJkkPN8SrBOKsvsx6dWsW9HHAXQFQmNYkG16OUcUR2VQTL5eQRVYoqQITawdJFAc2tbti8XJwffG8Pwp3NCUYCFaUAeMrFmjJLIomm8hxN4PLcmxhGKSfaZu1ut0dB6WbwLvbyyzROCA6tC/i+JIRSgdf/2jeXi5FEnG7wpaiYpJyNuEjOItBsdLd9ELEE8CKF9F6IwhvM5fq8DfNTd614051oIKCRaMRN0PjPoL6Phhyu2pNXm+J6L9PyNZKP38mBtKpmhCZ2NU5soE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199018)(36756003)(86362001)(2906002)(41300700001)(5660300002)(8936002)(44832011)(38100700002)(83380400001)(38350700002)(966005)(6486002)(52116002)(478600001)(6512007)(186003)(26005)(316002)(66556008)(8676002)(6916009)(107886003)(6666004)(66476007)(66946007)(1076003)(6506007)(4326008)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8tc5/LdB/wmaCatf0fOE1xwwy2gShsW4H5J7pIOSgBfjFkWFyp4pbkKAWT6R?=
 =?us-ascii?Q?+l6h99OBJQAeVONjR/+2CeULeG+OabB5VDvTy1vSAMm1W0cB7TJNSwyOC862?=
 =?us-ascii?Q?Peh4M72gxrA7e10d1pKSp8qdHEQ522WUS04/63ozOnZMvAVTy9SIa6qkL3ia?=
 =?us-ascii?Q?EpIz6jdfi6ECt0EFh34wDsrctDjmVJwedclES7HIjcwAI0C4hGDN0ABUcocs?=
 =?us-ascii?Q?is6uM9gpa2eVO2U2taCRb3fYDm3KkyX1jlYV12OTbWUi0Xj96olib4DoVpG0?=
 =?us-ascii?Q?xZTk9PHwXrA7bu8IguOudpCfDPMa4etxLbla8QD1rdJ6k7AxHtUuKa5of7DP?=
 =?us-ascii?Q?QcaDUioEKixsC6ropouC6efThIEzshfS8Z/d8L9iGWq803UXfNj9GuDAAh74?=
 =?us-ascii?Q?7YdVVVJsX5LvwTVs4rnwQ70lJMJAySBgqIuTIoOorhe6ITJHAHBMo47i1IWm?=
 =?us-ascii?Q?FsT6EN5fRKg43UxthiK9+qm6M0dMUFE3PfcL5lYS5q3jdE3zsqMUPDk2k09d?=
 =?us-ascii?Q?UQALyQgr7iwH6zOk46YiOinLuGBdbTsk+YxtPm4g78s4CPpZncZ8YYFhS9/1?=
 =?us-ascii?Q?b4wJuH2aTe7FA3QngqCT+d21+z4b0cgl7yVc6R+1fWqC84W49inmE9xLCBZb?=
 =?us-ascii?Q?+lOmFASpaTF96dQnPPhgh4np4dHZzwr4j+mavKFVKQWKXzFkMK9UmFzEOvZa?=
 =?us-ascii?Q?FQcUFAWxENfX0ZH2xhOr2LkpWqUCs0zhfhJbeka87rUT2W438OOZC0AoNOrF?=
 =?us-ascii?Q?0KLcEY5FaevhYbjGx2oXfjM7Kf3VrKQvYn8NNr3Y2HN1YqWqmjm4NRmbBghf?=
 =?us-ascii?Q?Ml+tdTUivHfC7nqFZIxROlXZ5CXIsboFaDvOv8Qk17RZqgdMgHir5zTf2jy2?=
 =?us-ascii?Q?61i2i4udWJJPsicD8ctNr+r1lyPsv2ZbwTA5H5KIHvNSSwD5u7+2pzaMqBvw?=
 =?us-ascii?Q?uQ9saG7EDxISVaz4RMldWepG//KngUB8eQ/bSq+wFHkPxBKEbtJJ+I04lfqp?=
 =?us-ascii?Q?bhxVYUuzW7N7fBFixiLjaeQhps3/bG2KZZMD88/Wx99vZ7dmI2smW74Ab7EI?=
 =?us-ascii?Q?1vy0lOQlm4A73+Fk5u3/bjdRVirvpWFCHyvOrLe/fbsA0K5knxFa4dLIv6eC?=
 =?us-ascii?Q?w+WlFR6bD04hyK3324bQ82mFlZurMOUeaJpH5ZvNE2ISYKovoLvEs/DpsbGG?=
 =?us-ascii?Q?I5COfeMfk2ssXy52raIkk/Meo8RDIvFASt/RJJI2eTIEB7VttrKk5TXN/Hia?=
 =?us-ascii?Q?45hUMA4RSU4lNUKrNCTulS1g+OpPjb84b1sbWwiY0oStxot3608IA4/SFXr9?=
 =?us-ascii?Q?lFAINSVbdmDAaAToSW8UL2564i5mFwjugD6q7ziOBTUvzu8bSLtrapw1zavG?=
 =?us-ascii?Q?luMLOaY5xRfvMLM5FVTroqFp7y7qjYr33ag8wvFOhaJ2u4gKbjs7YwKcYK9b?=
 =?us-ascii?Q?JC+QN7cqQlbi8Ut/8e3PpIaDxgdKgVtwIVn1+puJBV4Ux4WMviWXEhTQeYdB?=
 =?us-ascii?Q?D9UBf4Ik2ucPKdTt/YudZWyXPVmWit1qCCEl7p2S05hKSwMf82BrcFSydlLq?=
 =?us-ascii?Q?ZX5a/xu6xP72/VfHpM0ajHBDCcZ9/x7n17KGWxVr86wWNLsjB07PVSeLtWJG?=
 =?us-ascii?Q?fg=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c7b0dd-4ee6-487e-63fd-08db09b7e66a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 09:36:05.4485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHqbNP9FaeR7ZiXNQMnt6eRjMQHOj6wzh2ocdQsyXIUQUCWyIQpaQLXvotGMawAmDkDtdx5meVNcJDjTx8wXBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8180
X-Proofpoint-GUID: tw3j8qA8PRdAqudya5RPhkhgOl6r-oDY
X-Proofpoint-ORIG-GUID: tw3j8qA8PRdAqudya5RPhkhgOl6r-oDY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_03,2023-02-08_01,2022-06-22_01
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

This is v2 patchset for modified 'migrate' QAPI design for migration
connection.

Links to previous versions:
v1: https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04339.html

Thanks to Daniel, Markus and Dr. David for their valuable insights.

v1->v2 changelog:
- major improvements in restructuring wire protocol for exec and rdma transport
  backends.
- rdma argument change from [str --> InetSocketAddress]
- exec arguemnt change from [str --> list of string]
- functions are reshuffled into new files as per the recent migration changes
  in qemu.

Abstract:
---------

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

Het Gala (6):
  migration: moved hmp_split_at_commma() helper func to qapi-util.c file
  migration: Updated QAPI format for 'migrate' qemu monitor command
  migration: HMP side changes for modified 'migrate' QAPI design
  migration: Avoid multiple parsing of uri in migration code flow
  migration: Modified 'migrate-incoming' QAPI and HMP side changes on
    the destination interface.
  migration: Established connection for listener sockets on the dest
    interface

 include/monitor/hmp.h          |   1 -
 include/qapi/util.h            |   1 +
 migration/exec.c               |  38 ++++++--
 migration/exec.h               |   6 +-
 migration/migration-hmp-cmds.c | 113 +++++++++++++++++++++++-
 migration/migration.c          | 144 +++++++++++++++++++++++--------
 migration/rdma.c               |  39 +++------
 migration/rdma.h               |   5 +-
 migration/socket.c             |  37 ++------
 migration/socket.h             |   5 +-
 monitor/hmp-cmds.c             |  19 ----
 net/net-hmp-cmds.c             |   2 +-
 qapi/migration.json            | 153 ++++++++++++++++++++++++++++++++-
 qapi/qapi-util.c               |  19 ++++
 softmmu/vl.c                   |   2 +-
 stats/stats-hmp-cmds.c         |   2 +-
 16 files changed, 457 insertions(+), 129 deletions(-)

-- 
2.22.3


