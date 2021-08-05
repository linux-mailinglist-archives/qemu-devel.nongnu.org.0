Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F223E1EF1
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:40:12 +0200 (CEST)
Received: from localhost ([::1]:36054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBm27-0008W0-Hp
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBltd-00023o-9q
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:25 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:57394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBltZ-0006io-Ov
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:25 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175MCQcA016841; Thu, 5 Aug 2021 22:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=xzGlLAHQxiPUqHp1mwUYIMAbxK8qmeJjkjkUCTCKpxc=;
 b=RmKngQ9f2fdaZRV/Otrsrxy7yKvnDMyLglyYDfyafpyFQghDQEeKFz6Qiy7RAoqN+YQj
 cqEO8ScM4Q4ag5h3Cm3aWMjwhnkJAznGDCJOOjlArs1oWkkTh3FNM1zf06ZUZLdTH3e6
 0zO8X25tV/QL4klzBlfqEJDz/PcM2NhouSjD8ALRcfIB0ydmQXBmgflUz38hDa7+GdSO
 y3LSxqRTTiABXwOFjZbgL6qWcc5SYFcEsMJaxh289sfE0mcaom6BRQS3V3lQ5sX57MB3
 UU/1JrCGmBwUjx40/Fn+IhqvPNna6b6QBE/qiQ7Dm6r13PNMQjK57G2QH3YX/NfU2LRh JA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=xzGlLAHQxiPUqHp1mwUYIMAbxK8qmeJjkjkUCTCKpxc=;
 b=ljr18kY/8IXTQ5Tgcb0qKh/T0WjTkCh1EXn44hKpFyYt93ch7hOZOAbor+/Nj9SkxPwg
 TW2EpsEl4fgX2C37DFJDHj3VEhgKJCTX3RmzqGs6d7kMK7w16bBG4bfUDoTGMSOZV8BZ
 wNiXF6laM4Q5AESvdvMF3WclLPuKNUTgxZkizVEZ0Mhz1R8gOAm1YRfw7m2I+FG17kHF
 oEVpRw8D0chDtd6FJsgrKLVeOsNHKZIPIBqvjiD2COaCxK17+RcolJYCL1qAvjgWKeO6
 Yht1VQCJuOIo4hRGwKDCsACQaS4V5s4kdlBlvWvnLtI7nw5dEfYhMBV6NdkcY9CwVR3D Pw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a843pamju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 175MUFIg166810;
 Thu, 5 Aug 2021 22:31:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by aserp3020.oracle.com with ESMTP id 3a7r4ah26u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUjBjZShU2vYwcGYqMGNb7tOG3p15JW1OR5EWfuwu68WZoGS/WoHAwLEYUTgP5HxHFjgmqfHTtDtNCXpyWjV+0L5Xr6RZT2V0BqjkDH5KfrHnIriHSd3LgYfFo25IepaBHwEH4d6D7Yg+1Al04WJNBHdY0APn4c4nDZ+1N1XX3nUkbhwpyRe/ECga5L7aSdHhT82FmLFfhOtUZUyl5iIYmdTMYEchYqwegh2u/1ERWCgp4QW/+XjaeZPE3Bc61+CrAOkKneOYxfG1G+2V2ma2WF+wgHOmaCInif4r0X3dv8/BzQ2f+PXT6H5xRy3hwvvrKmHaHqd8cbApK2SXif2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzGlLAHQxiPUqHp1mwUYIMAbxK8qmeJjkjkUCTCKpxc=;
 b=cvfp7lH/UHC74fnGUM9LxywTSP74xFi3jfEmD92LZtVxDOKDrgW5upUcaLDi371Zjx41VXvbTaOJabtvIlPxa8O3M2SwWWtoGryCY3EXmYVksGbvkJgislrJb54qmVYNjXj8eMaqx8pVD5KquR3kgJqQE0O7t7By86PwSiBDUXfLT/fF0MIM3x+Vc4XfSkShHXnBDl+7QSsPMFA1jpwnDLM+De92AmTp5OJGacbm3Pvq2lVUA9z5Lu9NEomJ5WKpe2bS3DAE0BXXpEWT+E05PlN+Hvn0AtjKrluvj6seFAET2vBsmYOKSDiekf++/BavI1iexlDnqwRUNCPL0FPSag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzGlLAHQxiPUqHp1mwUYIMAbxK8qmeJjkjkUCTCKpxc=;
 b=hH6fZEplEvppJ6rgwmmGXowAFbDtv5qyxaKro170v5cSNLthWFBrLBYpwvvik0fARCAJep5pWhEtBXBi4lg9Vo2bLSY8rjGtG4E0wZIQnHdeD7JSDhcXfu5UuhXQ2BMezdXEfefSuUfyL5cPXe/I1jWZSnq87rqd6kyaI5h7x6E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2221.namprd10.prod.outlook.com (2603:10b6:301:2c::38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 22:31:16 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb%2]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 22:31:16 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com
Subject: [PATCH v6 02/10] ACPI ERST: specification for ERST support
Date: Thu,  5 Aug 2021 18:30:31 -0400
Message-Id: <1628202639-16361-3-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:217::27) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 BY3PR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:217::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Thu, 5 Aug 2021 22:31:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4665eee-e643-4720-939c-08d95860bd2b
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB222159B1C1C227A65435023997F29@MWHPR1001MB2221.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s4GI5xnGrA8t69/yIpVWFPxhduX0Kc1ElueBuCoHTo0UZcjyf/sLqTPabkSjtTfHruLlTmHu+Hkg1UMNnEYFsev5YKn+ziEs+Rg4XAUtBtoITeUN2PfAuuWJPqK1eBHimp7uksdZU5KFmMq5BLhyySaXoW0dIFF2fPaArnsh/hoycq7EjzEJEo+27RZDmzTe536/aiuVJ8lxRPM2StiNoTpfJ2Z6OMk5MF/QxT7cS58cMEtDGFPtNgZhqXFGakyvS+gE2SmFsrriqgTWtgji2zfnh3fXsIgv57SFiIll2qyX4EqEFMKIoLyemCyMe2AGdmJApES/TC9Ag4V9UCtrQVhP6x9kUiJe6Ix6z1jrKUXaozuW6yaSew983Tp7UCuOuZthEFQwkLL+4IzA3XCml5BFdmOFfLMtlBclYo+CVPh2keEboR07Qa1X1nlhZQyvhVqLJ1vorwpDCOFsbvnJJ6qZmbDFiYCchLfU7laFuqC/Pp7zCGy+CS2UsgPmSZS1iTEe1jhaHvql0iU4x169EO9aWx4DgVcM9EH9hXnRJki2BcJ1BNZk57jEpKlGqiH7kwbv2ogWq0RxXD//vMudfBt1MCi42DCdgAk8pT6+/16BmgnHPsYRAiLdi6inweSKfwsNr2Pvwla5vS2CazmQJL7QpEAqPSlyC4dXTxmGNqtCeEStVNJHeT6L7+WE61YZhcmBoSttcU53VJu0X3+iuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(346002)(136003)(39860400002)(8676002)(6486002)(38100700002)(38350700002)(107886003)(66946007)(8936002)(66476007)(66556008)(316002)(83380400001)(2616005)(36756003)(956004)(186003)(5660300002)(52116002)(478600001)(7696005)(86362001)(45080400002)(4326008)(2906002)(26005)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d2W+1/fMWA60CeGtPRbx704j/Ou/nN6YRQLXm37tIE1b9LLL4WV81d7bRuMF?=
 =?us-ascii?Q?Cfbr/oEWYC+5r03gVPQFAiGTfo05kVaMIHEagKyDG7cf7At/qItbI93o6a0r?=
 =?us-ascii?Q?Id6+WgxpcSEDPP7ulDR7S3HTOvHdAsVHoNRduubIBZ8KB/DLYbXspMOKOtWG?=
 =?us-ascii?Q?vN+EpfM+2Mw5khqlKbKUnW6Ux3YZBZYhSPrwMdc0iSCUEgcIRPoGBGrhyKM4?=
 =?us-ascii?Q?kdPytjMa/RbeHPdbxZ63RS1C9tUVy4Iw8YdbOn9mkqiUy86hsJbAwMlVWBkR?=
 =?us-ascii?Q?gqp4DPbE3TRkfq7aKfTWJtbXv0h/MeUOWRA7yhh2qfjGuKV9jvfKKVTkH2nZ?=
 =?us-ascii?Q?fqKZKmfkCMsBKnrRARyKQbzhHEjm37DRaJCBKIxUsY7zqlQgQzV1SiyGfwJL?=
 =?us-ascii?Q?gFHl0jQ6FpkUddXeXLrqbVcEJr/1o6Q+c+wuVS4oRTwrFQYvlRF1mW2BbJQx?=
 =?us-ascii?Q?92ZalFzZ2pkWXKnB2ZPEbCVSikxoNBtUswz68sLFR9HcTVCoO98ag4LEhasl?=
 =?us-ascii?Q?k47454npcoNq+7RNma13v373MtVQvVOMn5rKxAAYErl9ftpYEC1SwA4gVuWV?=
 =?us-ascii?Q?TiV1g+367n5Za9lLu/NGQxmbWh4cFSLMXQkV+0UQ5ypeIW5HCinjuL2SYQ3Y?=
 =?us-ascii?Q?3ywAgrG1HhsjyCmt9+orqo2dLwEvABPUePW26oP67FqJOZPzj0/FbjKnzYtN?=
 =?us-ascii?Q?Nj69JdKG2vs1QjNFTBoxVpehqqdrmgzLwvWTsu9bUN0eCyVz01wG+jx2w7M9?=
 =?us-ascii?Q?gVcTcHAZNHwwCj8o3z2RglbmDEtEGe8aZ82gtH4ugC0Y29TVthCCVo0bJk90?=
 =?us-ascii?Q?07m6XSNDP7zLtXF8j1H1bXK83kJKX2Flv0VaQwqEk3KCsO8guS1F9AmM/Ysz?=
 =?us-ascii?Q?02XHfZ46oVF7MTyi3vYAD7wwDTQyr82k7E5bUhzT48fUu8tTs+ndL0ZFGk3T?=
 =?us-ascii?Q?AEvyOQxmQS3XLQHAr+4nSEz6hCrT/Sl8wjwHSzxjPwHB96Yo4js3OD84vWj3?=
 =?us-ascii?Q?/ZGmHlnOc/HH1Qv+z5QVIRRqejhUsSW4TuQfK1H3z9xzU9O84e7xsGOoI0o9?=
 =?us-ascii?Q?7UTNfO7P+lYw4956KC8drEx3f+dJkmVC/rwhLXPjBwWmXXi0SvqPFVsG2m23?=
 =?us-ascii?Q?rbvsSqRmIaVFusZuvtuXtEPnlpJu02e/TQeCzPq0YXk8v/vU+1a2acOb5G2c?=
 =?us-ascii?Q?yfsFuWsLynUWOyp26LF0mPuK8vH3dwX/nccZfHotHDcdYlbZGMjcHHLYQWSW?=
 =?us-ascii?Q?iflklsHjDQtiEFt2gEvKy/5lzdf+Mc+qklvraoaDfEcZ3ibz/ShzYF30ACb3?=
 =?us-ascii?Q?HcNq5UkAxQ8ynlNw5bv8LNiC?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4665eee-e643-4720-939c-08d95860bd2b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 22:31:16.5073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPtu2lDH+Nt5s0UpdXgTNrGDPqkEmW7Hbcupe3GIKHCmBByNDpVcsXwD84oob2t0uQaNGoocsa+nrVV5U84UR9+wYAof9rCLKfRwVzP3erU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2221
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10067
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=638 phishscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050131
X-Proofpoint-ORIG-GUID: sx0h9_2BiNIbLpEw77bj9KQcS3YAjFVT
X-Proofpoint-GUID: sx0h9_2BiNIbLpEw77bj9KQcS3YAjFVT
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ehabkost@redhat.com, konrad.wilk@oracle.com, mst@redhat.com,
 pbonzini@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Information on the implementation of the ACPI ERST support.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 docs/specs/acpi_erst.txt | 147 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 docs/specs/acpi_erst.txt

diff --git a/docs/specs/acpi_erst.txt b/docs/specs/acpi_erst.txt
new file mode 100644
index 0000000..7f7544f
--- /dev/null
+++ b/docs/specs/acpi_erst.txt
@@ -0,0 +1,147 @@
+ACPI ERST DEVICE
+================
+
+The ACPI ERST device is utilized to support the ACPI Error Record
+Serialization Table, ERST, functionality. This feature is designed for
+storing error records in persistent storage for future reference
+and/or debugging.
+
+The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
+(APEI)", and specifically subsection "Error Serialization", outlines a
+method for storing error records into persistent storage.
+
+The format of error records is described in the UEFI specification[2],
+in Appendix N "Common Platform Error Record".
+
+While the ACPI specification allows for an NVRAM "mode" (see
+GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES) where non-volatile RAM is
+directly exposed for direct access by the OS/guest, this device
+implements the non-NVRAM "mode". This non-NVRAM "mode" is what is
+implemented by most BIOS (since flash memory requires programming
+operations in order to update its contents). Furthermore, as of the
+time of this writing, Linux only supports the non-NVRAM "mode".
+
+
+Background/Motivation
+---------------------
+
+Linux uses the persistent storage filesystem, pstore, to record
+information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
+independent of, and runs before, kdump.  In certain scenarios (ie.
+hosts/guests with root filesystems on NFS/iSCSI where networking
+software and/or hardware fails), pstore may contain information
+available for post-mortem debugging.
+
+Two common storage backends for the pstore filesystem are ACPI ERST
+and UEFI. Most BIOS implement ACPI ERST.  UEFI is not utilized in all
+guests. With QEMU supporting ACPI ERST, it becomes a viable pstore
+storage backend for virtual machines (as it is now for bare metal
+machines).
+
+Enabling support for ACPI ERST facilitates a consistent method to
+capture kernel panic information in a wide range of guests: from
+resource-constrained microvms to very large guests, and in particular,
+in direct-boot environments (which would lack UEFI run-time services).
+
+Note that Microsoft Windows also utilizes the ACPI ERST for certain
+crash information, if available[3].
+
+
+Configuration|Usage
+-------------------
+
+To use ACPI ERST, a memory-backend-file object and acpi-erst device
+can be created, for example:
+
+ qemu ...
+ -object memory-backend-file,id=erstnvram,mem-path=acpi-erst.backing,size=0x10000,share=on \
+ -device acpi-erst,memdev=erstnvram
+
+For proper operation, the ACPI ERST device needs a memory-backend-file
+object with the following parameters:
+
+ - id: The id of the memory-backend-file object is used to associate
+   this memory with the acpi-erst device.
+ - size: The size of the ACPI ERST backing storage. This parameter is
+   required.
+ - mem-path: The location of the ACPI ERST backing storage file. This
+   parameter is also required.
+ - share: The share=on parameter is required so that updates to the
+   ERST backing store are written to the file.
+
+and ERST device:
+
+ - memdev: Is the object id of the memory-backend-file.
+
+
+PCI Interface
+-------------
+
+The ERST device is a PCI device with two BARs, one for accessing the
+programming registers, and the other for accessing the record exchange
+buffer.
+
+BAR0 contains the programming interface consisting of ACTION and VALUE
+64-bit registers.  All ERST actions/operations/side effects happen on
+the write to the ACTION, by design. Any data needed by the action must
+be placed into VALUE prior to writing ACTION.  Reading the VALUE
+simply returns the register contents, which can be updated by a
+previous ACTION.
+
+BAR1 contains the 8KiB record exchange buffer, which is the
+implemented maximum record size.
+
+
+Backend Storage Format
+----------------------
+
+The backend storage is divided into fixed size "slots", 8KiB in
+length, with each slot storing a single record.  Not all slots need to
+be occupied, and they need not be occupied in a contiguous fashion.
+The ability to clear/erase specific records allows for the formation
+of unoccupied slots.
+
+Slot 0 is reserved for a backend storage header that identifies the
+contents as ERST and also facilitates efficient access to the records.
+Depending upon the size of the backend storage, additional slots will
+be reserved to be a part of the slot 0 header. For example, at 8KiB,
+the slot 0 header can accomodate 1024 records. Thus a storage size
+above 8MiB (8KiB * 1024) requires an additional slot. In this
+scenario, slot 0 and slot 1 form the backend storage header, and
+records can be stored starting at slot 2.
+
+Below is an example layout of the backend storage format (for storage
+size less than 8MiB). The size of the storage is a multiple of 8KiB,
+and contains N number of slots to store records. The example below
+shows two records (in CPER format) in the backend storage, while the
+remaining slots are empty/available.
+
+ Slot   Record
+        +--------------------------------------------+
+    0   | reserved: storage header                   |
+        +--------------------------------------------+
+    1   | empty/available                            |
+        +--------------------------------------------+
+    2   | CPER                                       |
+        +--------------------------------------------+
+    3   | CPER                                       |
+        +--------------------------------------------+
+  ...   |                                            |
+        +--------------------------------------------+
+    N   | empty/available                            |
+        +--------------------------------------------+
+        <------------------ 8KiB -------------------->
+
+
+
+References
+----------
+
+[1] "Advanced Configuration and Power Interface Specification",
+    version 4.0, June 2009.
+
+[2] "Unified Extensible Firmware Interface Specification",
+    version 2.1, October 2008.
+
+[3] "Windows Hardware Error Architecture", specfically
+    "Error Record Persistence Mechanism".
-- 
1.8.3.1


