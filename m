Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A607D3E31AD
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:21:55 +0200 (CEST)
Received: from localhost ([::1]:48672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8Dy-00034Z-OC
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC86C-0000Bb-4T
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:52 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:63928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC86A-0004UI-3i
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:51 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MBdcE032510; Fri, 6 Aug 2021 22:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Ynl3rqDV80YypsCnO3SFfnqToaD3KbhyxyKpAHPDIy0=;
 b=yOyDYuhrswfWiOO1yo+YkU3B2qjWSoz7mSLJp/HDYcDh9rIscr+epNIoBQaETtWS4uVv
 E1quMj5xwzl2A2FRToi2p2IqUDdJVQH734rLJ1ZrWQLL7TsOp+U18GOwaBKpmH7ol0Fs
 Wa+bQ5dachUH03lNv37V0jv5p1ShsJ5gNOajKuFVuwB61n6yvQsZMx393eA/Vlq0H8mk
 qXFliPnBQt+nknm/zGA6KYD2k4kj4hYNTQBHCbLGGv2QC5koQ31i7xL/GGkXgK6pcCpq
 biQFLXYKo3qrxjyH2T8XFqqfwl9sLMtVwR2iYJSFZ6y7BoZNL3lsc8To915dRvhw8qRH wQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=Ynl3rqDV80YypsCnO3SFfnqToaD3KbhyxyKpAHPDIy0=;
 b=dTkQwh3HSj4f93FEGu9vpv3hTznroOzVUlo5sGTo6u5zuTbQ9TuFWesbLnPjyI3JQP7V
 Be6Op/sSyuSBMjXQDhV6BAaebkBuvNfQ6GJWC2UZegeAsBfwVie7zPPY47YQn/XLTooa
 0+78aQbTbzlpCN5xzjE4s9PqUwP5fHnRjRoj+SkNNA1kiqNhd/4Srvi8kFKdQdR9Tx+F
 RZ3b9hxNpLcEEX7dQqdrsMDSTc8cbLmbhDZ5AtfCgPDC7+Tye9F7s1c+ZLuNJ0dXiuiP
 ZJwd9X77Ihka13cWSUqhBuh2lgpRmo4ycdKKsqxd1aQxWy2vTmFFTp6M4TEvY9vTg28F oQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a9661s144-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:44 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBmb4013986;
 Fri, 6 Aug 2021 22:13:43 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by userp3030.oracle.com with ESMTP id 3a962pfbad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqdTkR8vLECqXnxUptrCf0WsD8I25+V/Z90vN9Um52yB/7tlXme8PnyC8G27dn6EFoukrUMwdCVCh0V9rijLWGMWfh+VC5dSMgEzfbLfT5YOEcqBWlASsbMvU1huHbc5MiedvWLKC1AptMrmhT8bkAIADPqgDE24QLjldmFg6AnEY8JbY9oUnZ24+SvDMCYk4dhN5Dwl4RpQp1lP4BaFJ25gCx42c2VVy3pj+yhVGBplAzsqiQJRkWYqKElxTTnGPA81lln8N/UsA+PFRClmcxclr13KnXfXSxFlApafkBUj4UBezLabCrIyinj3B1Jch6ti0u6ami82ytcRowtCDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ynl3rqDV80YypsCnO3SFfnqToaD3KbhyxyKpAHPDIy0=;
 b=TKgCRGpzP5Zx71UXMza2HeLE12mYy4KsHZddPTK5/GgEXY0pZbIi+daRbZhwAiE6pGcUntz4bCniL0I21fqtx1LhD6oUK45kG5poMnlwVf6LHnOp1MKR43dQ2BYwVVS8InH8TD53QUvKBlIXYySX9qtxX3Qg1kEpaAnMpacvNOsWbTGL27Ubo6/3jCvYXgh7fswCktEiYV9DTf2+mRmOuLX9K5MAFYgclv8K8EwNYWlvQ8gkN56qt9iWa7ZF7Y7+hYxGd2uFYSyum6Xjp3YeFes9PPjYDbbswwCTRTyXzwgFNdyLZdc0/hBQNnqB/7h5ZQoP3ytZsprQWvN3vZtdBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ynl3rqDV80YypsCnO3SFfnqToaD3KbhyxyKpAHPDIy0=;
 b=h3D1y4xOPIlfYE3Qmzo552+px/sK4ycZRRZqk6zLT8p/Wkpb92eyNvm8LqzeqgwMnVG3rvVjP1kkdIdXdJPHUtRqONzPycs+7NZF8vjo5B+Gh5AZAubs/DbkSAjWo/YF99VLSVLmhlSZEqYiBVFyCOHOH/jvE/EBYZh1yKi9Co8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:41 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:41 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 26/27] chardev: cpr for sockets
Date: Fri,  6 Aug 2021 14:44:00 -0700
Message-Id: <1628286241-217457-27-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.7) by
 SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bb8d30b-6b28-4f6c-fee3-08d9592772dc
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4734722E84CEC81491B968A1F9F39@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I6Yph2+Fl06Opy4ZlV15B9S3PcNsnhTbO51cf/KQ7K25xl4QQi4EMRbi/Nexs46r75iqv3Ib/QY0r6S6FKpa/mfftEecXe/zU8REKZTLBLcp+yNYfeoH1lu8hCluRmWu6bCwjrsGxdDJOy5/EL+QsmzMJyXt1uyQ99oNeBC/KnHRswoa8NzdJj4mm+sX8EGMHyyckzdCruflGS/xBVpf1sB47OapYPR8X7qGGxDPSwjarhpUkGf3tYVi3s3ww+hjY2l+lAgGcjWBNj9wbAc3YFpB1RSvXJq9vEqheyTnWAj7eX556UChzz6jODMHcMOxbqNC03L2NbfvY5B4KX+sukYOKhEXv5rgmMeWeQQHlwTTtEmU65LQRjh0wnZirw989Awik4Czk/nhqmdMy4guFvqj709KAyUCm3SMqY5i8GacqA+Bxnl+QB0FCOH2bkFHbb1QFmXkjxD9dVWDHoHAlw/HPZSOUv9Jf+JVije9/OaTjrtKW1r9HayV9J/gBHPAB74aTTlgT54BuWrrgzcdt/K2Ob4JSXySAELEQU4bOT61RHr6KFecAk67isF6GOe/QNuk2qnT0zof+Ufl0XCePmx8M9OBUjZpEb5G6VpyT0SZS4JX1flk8UPUKNnkQ5JwcF1FffSRXOh43bPhkPMDPUDj3U9M/x/BCsWHdgd7ETEVAPJr+bzlv22oYEQPtB+03QpAYS0AFfyaRKOeQ9hvrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(136003)(366004)(346002)(66946007)(107886003)(66476007)(8936002)(86362001)(316002)(83380400001)(54906003)(8676002)(66556008)(4326008)(36756003)(956004)(6666004)(26005)(186003)(2616005)(478600001)(7416002)(6916009)(5660300002)(2906002)(52116002)(7696005)(38100700002)(38350700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0f5cD9uz1wtmT1j2Bbce2hT6ONWsoDtChqDZEY9uc6FjcLvSijIBENMn5y+G?=
 =?us-ascii?Q?IIMWzUuJ0rxK7M905YdXf0QeUB6i0631hBjBdsRajYI/YxExUv2fX5/as838?=
 =?us-ascii?Q?ukS5vFTGFvkN2dES6l+B7ttVMQKwCTjrH3agwr+ncPR1Wt//7gJqtguvY8LM?=
 =?us-ascii?Q?ixNR0wbTn9ZhDrq/2Yo2t2j0Re2YNnwFtUWDShKG1DLUGTLmxBahjyO+Sf4z?=
 =?us-ascii?Q?g4NeG37D9nXRxf6an7c9ZSlKdPy9GY/C6zFrirMkLXz6olO1TqnSPYaeIxiq?=
 =?us-ascii?Q?kn2MyM3FnZsLLhWQKl6oceMbAlk/o+nUU/tbl1EudMTFCxQsovqM1o9nu9uW?=
 =?us-ascii?Q?HYCX0XtQtX2S1nFWtEOYKEZSR/fPNh2foXng4Vbx7KjutWpbTXVfpNRXxc1J?=
 =?us-ascii?Q?S8yAYSEFFkfUtVNtOvqBChZj/BMEe20TqqM3J0mFKmUe3AF5WoPq/5nqPn9C?=
 =?us-ascii?Q?NQaTPOpCI8yl5O+c7Y6/IIEcOqDUjJEeEsQ7A1RIevatYRH8cAYvm95W2y52?=
 =?us-ascii?Q?l9xtWDC6N3MbkXrBuIjtOA7NK9+CYW9JUtURkdLrU+YzqRVbK22rK/zlorG2?=
 =?us-ascii?Q?VjPHlTfdRWyWUZwlgGVYbqpd9CSllMYe5KpDh5dQsqzrNYFv0EstU0xyWB8Q?=
 =?us-ascii?Q?lV5ANZuPFyuZH4byxetD0ABjdqEg/R1TKBNsw2Zl0oNhuHvcT/vc3X4MObpJ?=
 =?us-ascii?Q?EYuUUD9GPDRrHWRRa/AsOopSJ+vPld6O30cfwKkoTMcnbfyRuscVprN1+T5u?=
 =?us-ascii?Q?zZ06YRhovnhUlcmz7GmX3jSI0VcU+0mIXHA/+aN2XzKTr5txXto9XN9N1yZ2?=
 =?us-ascii?Q?S2ZRx7HRor89kPIoKfo9IJuEM/ReOk+zRmKTSvnkIvY63KfeUPd+kEhlgB9v?=
 =?us-ascii?Q?GHOair1r7a6PYgVRPTchJIprB0hyqWzCVR2PHC91MwqHlh2WYEmUuy7njRbo?=
 =?us-ascii?Q?dvdXNTpW49YJuhn73yTqOhxy185cGtSKzBvVLQmJ5Pp545DFSHAqD5VTOWwc?=
 =?us-ascii?Q?9+dTBc8g5snMTygQX2qw8HUQEMxyGlGpeorMRm5oX4E/yCYm6CXNh3dPrmW6?=
 =?us-ascii?Q?bSooxXKY5inc9qGnfX8uRnXm8GnNhKqp69jLg2kpAn2FAXspWuGlx+CrQ4mx?=
 =?us-ascii?Q?sPf0mia7mQrJBYwf6VZ0YJFs14yHd1OF+1Ge/ElPKAZBiS+wH3skSkMW8Izs?=
 =?us-ascii?Q?TGP4JETu1RpRoWrftLT8w5xkwD58QCR6C46ftPY4Z0GnYETfqsiLtkzojJvP?=
 =?us-ascii?Q?wA3uAGFes5xiZ6FVreOfFMu8F6in6NWFdFtNdzsRnug1bI6F80z3P977t404?=
 =?us-ascii?Q?adNlzJy88Gh5oEDA/zL1iQ70?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb8d30b-6b28-4f6c-fee3-08d9592772dc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:41.6587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izTfNbDocC8nFcYgcI/LlvyFS4/5W/1j9nXpsThrIZp+uovpDRt41PRrhcM7QlsxmCGNMp/V0Tc3+A7+dpX0BeUxang3srhKezjVoq5JrXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-GUID: 2cg72fE365qIFtAyNlyReb1GW0lVr-A0
X-Proofpoint-ORIG-GUID: 2cg72fE365qIFtAyNlyReb1GW0lVr-A0
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Save accepted socket fds before cpr-save, and look for them after cpr-load.
in the environment after cpr-load.  Reject cpr-exec if a socket enables
the TLS or websocket option.  Allow a monitor socket by closing it on exec.

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char-socket.c | 32 ++++++++++++++++++++++++++++++++
 monitor/hmp.c         |  3 +++
 monitor/qmp.c         |  3 +++
 3 files changed, 38 insertions(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index c43668c..f6d00d8 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -27,6 +27,7 @@
 #include "io/channel-socket.h"
 #include "io/channel-tls.h"
 #include "io/channel-websock.h"
+#include "migration/cpr.h"
 #include "io/net-listener.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
@@ -414,6 +415,7 @@ static void tcp_chr_free_connection(Chardev *chr)
     SocketChardev *s = SOCKET_CHARDEV(chr);
     int i;
 
+    cpr_delete_fd(chr->label, 0);
     if (s->read_msgfds_num) {
         for (i = 0; i < s->read_msgfds_num; i++) {
             close(s->read_msgfds[i]);
@@ -976,6 +978,10 @@ static void tcp_chr_accept(QIONetListener *listener,
                                QIO_CHANNEL(cioc));
     }
     tcp_chr_new_client(chr, cioc);
+
+    if (s->sioc && !chr->reopen_on_cpr) {
+        cpr_save_fd(chr->label, 0, s->sioc->fd);
+    }
 }
 
 
@@ -1231,6 +1237,26 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
     return false;
 }
 
+static int load_char_socket_fd(Chardev *chr, Error **errp)
+{
+    SocketChardev *sockchar = SOCKET_CHARDEV(chr);
+    QIOChannelSocket *sioc;
+    const char *label = chr->label;
+    int fd = cpr_find_fd(label, 0);
+
+    if (fd != -1) {
+        sockchar = SOCKET_CHARDEV(chr);
+        sioc = qio_channel_socket_new_fd(fd, errp);
+        if (sioc) {
+            tcp_chr_accept(sockchar->listener, sioc, chr);
+            object_unref(OBJECT(sioc));
+        } else {
+            error_setg(errp, "could not restore socket for %s", label);
+            return -1;
+        }
+    }
+    return 0;
+}
 
 static int qmp_chardev_open_socket_server(Chardev *chr,
                                           bool is_telnet,
@@ -1435,6 +1461,10 @@ static void qmp_chardev_open_socket(Chardev *chr,
     }
     s->registered_yank = true;
 
+    if (!s->tls_creds && !s->is_websock) {
+        qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
+    }
+
     /* be isn't opened until we get a connection */
     *be_opened = false;
 
@@ -1450,6 +1480,8 @@ static void qmp_chardev_open_socket(Chardev *chr,
             return;
         }
     }
+
+    load_char_socket_fd(chr, errp);
 }
 
 static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
diff --git a/monitor/hmp.c b/monitor/hmp.c
index d50c312..993df18 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1458,4 +1458,7 @@ void monitor_init_hmp(Chardev *chr, bool use_readline, Error **errp)
     qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read, monitor_read,
                              monitor_event, NULL, &mon->common, NULL, true);
     monitor_list_append(&mon->common);
+
+    /* monitor cannot yet be preserved across cpr */
+    chr->reopen_on_cpr = true;
 }
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 092c527..0043459 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -535,4 +535,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
                                  NULL, &mon->common, NULL, true);
         monitor_list_append(&mon->common);
     }
+
+    /* Monitor cannot yet be preserved across cpr */
+    chr->reopen_on_cpr = true;
 }
-- 
1.8.3.1


