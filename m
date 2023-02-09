Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6320B6904C0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 11:29:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ4AD-0001GX-G5; Thu, 09 Feb 2023 05:28:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ4A7-0001C6-Q3
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:28:19 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ4A5-0007zh-Vu
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:28:19 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3198BkWK002442; Thu, 9 Feb 2023 02:28:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=0rbEBv5EYCOGmj6k7APAnzNsUmx828kwkJm2AIPYThg=;
 b=Bzz3BBDB5V63IFITekQMsekKagBWl/jvlH1TSlwlBwqixI9CAQe5JgSzvF9n78NIWp8+
 1LiPqs/4chsIlrEaDIKD3ovFKZf4ziOJLN3/gfVkSJnC8YsGpq6toGbeBvvMBJW22Yk+
 ZtPcDkqKEbO65OxWqDKrBgwqwIKN5WWufvVQGOh6XqV4tAOXHK2X/sN0jx2wNfYqL8VW
 vDhVgjAAPMqP6rVVXv5lksLWSvEAM015lgogsdgTX/a5Ae8NTPpwjfzLElHj7IagfXZ9
 9G6MJ6aNWB8gSkBOIsBw4dVibl/1gtj1wFxEgT0s7+PJH0SCAqycLfFiLzsp+cqpUeQE ZQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqjp1bye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 02:28:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RO7PzXl2Yyw95aULkT/hXwhCBAgXieXNWHKrwhybG9k9uldCSiVtxFOXzOmypHP0nlIxMEFx/DVPR7YjTuTBMm79Mc19bXRr8dAesCBWbkKf6sR/f1rTdKBsDGOKEglSG6qAGhtpI62KTAbaGBrqgW3oHPM3qDUfz87MyrQCDcgiqqQ09X2L3+JTFBkdY/vaKTV6CbPomJUFRjWQL/bvnyes3mHb4FVj7oPyPks+WFGby2au5SUKrxC+YiUyq4Nhl5eHUadDack0geo+UTWRvHYA4/5XkNvuDpjUxHidYaN0vtJTu+vxz61LzxSZb7xKcqNIh49dzZZphESRDWAApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rbEBv5EYCOGmj6k7APAnzNsUmx828kwkJm2AIPYThg=;
 b=OhSY/QDFTVturiFmTeOC7cvk9l3MwTjKhdDtlB4KIl91u3AIjZZ2UCv2wWInR+gzJIJN7DKp7l1yyHM6eWCAlkR1TbD/O2mfZs8rEdzPDyARuluODLiYY5zqqA5faFEfpZz7MFUntKG0BjD9Z1FyKhs1FAtq6ie2Ueqk8RoAaaK5EyjNg7+awLv00rB4kfHjCq9vKX3XtoD0H6kEyXJ1D2ceUyO3DyIFy0Ckat9FoPH+bcDHlDHr3uZCi/VKkSWHR63atIGXtWrIxeMlF+5YmjKRUJeVhg3UZNCsqfSWjfgBaRgjYSCw5EPKm0F3qZUkgn9Bwvfpsk0kcj7MNtfUXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rbEBv5EYCOGmj6k7APAnzNsUmx828kwkJm2AIPYThg=;
 b=nBtl4dAr6HeCEoZ+bp2Lxulr+4qx51TWEtbAdO7iJW/DFCvPMTcmqduMNRXyhi87Cn2kYGXwKp9bpyUdU/fpif0oeX0H2MBK3orIRAC1RB2z3613zwnZ+Ox1yKKapcNm1Kk6BhJquvrxmjNFLobME/BLj15IkOgwxi3KlMLvjWuWn8jb6PFSYhF97F/qR2Psxtf3Ey/SeKJXdVOxI+SvaBPZbHPcv4iS/Rucv6NDGBypWEnbL1/G6ktUJccmwP0I/ucknQZlvGKrrmar64rN/8QwFBnvOHdB3K8JnXmNIa1trK/hR6RhAjv78p6w30QZDC/Z3w4lWwqUrSvw0iQPLQ==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by BN0PR02MB8240.namprd02.prod.outlook.com (2603:10b6:408:157::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 10:27:59 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 10:27:58 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v3 0/6] migration: Modified 'migrate' QAPI command for
 migration
Date: Thu,  9 Feb 2023 10:27:48 +0000
Message-Id: <20230209102754.81578-1-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0123.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::8) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|BN0PR02MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 024fe460-94dc-423c-40a5-08db0a885085
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lOzALxsRtutFvCf6Rt/eDreKTgLSkLioM/Y+9fes4vgxRF4CSGM0GhOM5NbInqaNPYqghC0IU/a/QWikw+D5flR0s14tH9j/Km+BTbXfH7bq/wzVk93bQad1Mp3FFc6mbv1cS/GwskxsFGxx/wTflZk6FmcWX2Fc/bBDrlHj13EUMd3MNX1kv1WC/irNXaefAHxmoKWgnxgutf1XRZORv1uGQFJEPFAqXuNPjpHSOtGlsjeMDTrbvxea9gBTaz2aHYI8v4YGjC1AxOGhjEPY9d4gxk0wT8L2Zce1O1oY5aHMw5z3jqXiJcm68BTzM0wIPA/KpcIV58UxV6QfkUSuaMZn3I/Tp43eq+Yo2bIwGhcQ0LSGROf5FecGfSCKB5Ag2aDveJH2qIPUR7iGLe8EtgYEsnp/eA98+rDjmsFjKhmBhwLLb/POelRSSLDiCWsE8kEjSpO88kCCMzgEyOtgG9iLY6rqCudMKgmyEuZ77yT0lPHrR2Lu+rUy8hnyO0QcOcOSwhRAKH1Qj3GCqThbDP6vMJlqyawnIOf1dPoCgr0cL+06ifcW/tvbd5JnLqZMq9ASjdxJMRdhxiC6RKjehiXmYHz+3f2+5ayOIDwS/+WryW5uMy16jfUG2mNUwiOvh35h1FFpkNV8j+hApaLaAiBUKamh/6jGOwNOqH+vxZpi6QJ51wHueRIPOwwOtS5961mAhKishdZlngrpf+7GhV6vh+pjYNtTDix06j5CFVs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199018)(5660300002)(36756003)(2906002)(44832011)(83380400001)(66476007)(1076003)(38100700002)(38350700002)(2616005)(8676002)(4326008)(6916009)(66946007)(41300700001)(26005)(8936002)(6666004)(66556008)(107886003)(186003)(6512007)(6506007)(316002)(478600001)(86362001)(966005)(6486002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T2REAc9JqGvESODcUF7byi/c3DnL2yG7xj5Iyd14Ji1dR0VfY9vt+ukXTKuG?=
 =?us-ascii?Q?XNpALEyS/Rbcj5PcoxjZuVUnjzIsmVlL7R8vRLs6j88uvKiLKnDL99wS70xS?=
 =?us-ascii?Q?L967Yz/gGLprkPtmQ8fU/rcC1COeVWJtOt5eazRv+b9zNYoRzzByzTyQqC6w?=
 =?us-ascii?Q?8aeVKzi9yY/xMAR0M67vzSWrgZSyhazeP2JckjSL5jk7dojB5sll7IV/hGEb?=
 =?us-ascii?Q?XlM1LFODsuvY+I8HHfbCEcVbsJCzyymqtalz7RIZu/JjZmfzBn/mgz51wpgy?=
 =?us-ascii?Q?ucJ2a5jp8XpBl980VWYBFWpDLZ76qQJNfbV+7oVab/Ti8VcktHtYwaVl1BRc?=
 =?us-ascii?Q?fP2MSE4hIYolHT14bVRzI/w2Knn2uvgow5C/GFiFEFhZvC66XxmGch0mKLyg?=
 =?us-ascii?Q?TJDR0TDKIhVjHjoXj+sARkaWIY38dgPvz137zmjxNhdSP9lTVCARNKGkG3gp?=
 =?us-ascii?Q?oUN8I2SQuJognXJm5HXSOduI2sSKCInorndHqJPPXk/ecFW+iH+kUnHUNbzJ?=
 =?us-ascii?Q?Nof6xAyqs8oGSRYy47Bf67OhP+4waWOhhYppO9AKMtooeewYxzQp2Ylm/NdS?=
 =?us-ascii?Q?5O03+HMDCKD3NZ6WOk8RUZA1hQyxL2823SmTapJsDui7Q/LppuySB+kPVdJ9?=
 =?us-ascii?Q?nfUbQOshoHqXa77kE2gMfMwF5z+NhyxdO5xILybfcpi2FUm0mCYHXGol2V9I?=
 =?us-ascii?Q?6I9rNoBSL+e74TslUX87aawp6lZN5Yewc0cB4VJZLb2JiwHUp3ArDvdZA3jb?=
 =?us-ascii?Q?p7JSXZhcSYidGJcpfsnIOC+Ln4T6RPlTQnDexD3JJzsY76hDQP3Z2uBA+8ZT?=
 =?us-ascii?Q?1COOD6aqCTrdoJ7BEvrhuyrJ2A6QFHlSohDVLZryUwJWG0Iewu8wukhvCAaN?=
 =?us-ascii?Q?SgGw+fxSr+PN347fb2YlL8edjSVaRSOrGbZAIwx/ciYptzV33IFh3qI4pxW+?=
 =?us-ascii?Q?9Ba04mKuN9i1ecarpVDxBplxR8Xhg3pKnYUApT5WsIx5owMGCv1WhukLN7Pb?=
 =?us-ascii?Q?edisJ9Kl6EfG4QxJ52FUz/lw8nGEBDM/Bh9l9q01GQ2vlYmjBoyc5g3SNJCH?=
 =?us-ascii?Q?QBeAp8Z3IY6m0sbc45coG8ZxMKJzCX2emd9CWgYeCH513yxcwY1Rp+msC6mq?=
 =?us-ascii?Q?C+sB38/79nefTJ4ub+6FAbD4LBRwi7jKyrbtAoHmih9hjC/q56n4Lc/kReTJ?=
 =?us-ascii?Q?atJt1TFy1nJOR0p2I6wyrCfAnxq+ypAmmTx7P8k9dYSzeJ1TlQpsRKd+iCzX?=
 =?us-ascii?Q?51vqQv19afu7/pD0DUuAZtjtIu7w/suW9Ls8gn+1Tcq7MkhvqkmSMFsxa5pM?=
 =?us-ascii?Q?mI2WMu89QbmYIQ9DAYqoTKGLNGIJi+ILtIrJ8NtS4/72Pcj13P7Q+fsvoa3s?=
 =?us-ascii?Q?O5ketzeoWpymlzNRpNI9edJbmb4HnDVxPXd9qvdIguDnxHK1jh8SmHivmyWB?=
 =?us-ascii?Q?vDvZ05ZJMlFq5uaFnDCkxuDgvrULuqCRKl/f+mBJlaaQk3BQ+VS+QzcbQp/K?=
 =?us-ascii?Q?bgoh/4Ey1NjhSk13tLCOPUQGQugJlej5Z5Y4A4Hbxwht32ml2k4l+qfCrB6m?=
 =?us-ascii?Q?0ti8ONLGt4uD2d+BtlCu86x2UAqJlx8b50Gi9h63qeArjrs3JLkzapVKAmLT?=
 =?us-ascii?Q?Rw=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 024fe460-94dc-423c-40a5-08db0a885085
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:27:58.7984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBrEP516DHq8tVecnWCxsBxL1/ckxaaqhpsKWr4u3wz47pfrKTy0UTsEVS9RkB8cXFtDLOi0YSrrDmaJj9TAiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8240
X-Proofpoint-GUID: PpnY-Bg6dvAFAgp1XyssPRwW4Bi0lqts
X-Proofpoint-ORIG-GUID: PpnY-Bg6dvAFAgp1XyssPRwW4Bi0lqts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_08,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
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

This is v3 patchset for modified 'migrate' QAPI design for migration
connection.

Links to previous versions:
v1: https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04339.html
v2: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg02106.html

Thanks to Eric for his quick and valuable suggestions.

v2->v3 changelog:
- minor improvements regarding 'migrate' QAPI design in qapi/migration.json
  file.
- 'socket-type': 'SocketAddress' --> 'data': 'SocketAddress' for keeping
  consistency accross all the transport backends.

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
 qapi/migration.json            | 153 +++++++++++++++++++++++++++++++--
 qapi/qapi-util.c               |  19 ++++
 softmmu/vl.c                   |   2 +-
 stats/stats-hmp-cmds.c         |   2 +-
 16 files changed, 456 insertions(+), 130 deletions(-)

-- 
2.22.3


