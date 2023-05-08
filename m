Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016BE6FB3E8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 17:34:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw2rW-0006LC-D9; Mon, 08 May 2023 11:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tejus.gk@nutanix.com>)
 id 1pw2rT-0006Kz-Cg
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:33:15 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tejus.gk@nutanix.com>)
 id 1pw2rB-0005p3-40
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:33:15 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 348EfeCd020034; Mon, 8 May 2023 08:32:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=H+B3kDG2ijqkH50cw3GTCxpp/Y7p6L2QSc2mbEiv/sA=;
 b=xrn4DbtQaquI+psYLQBg9PugEWAI9qh+Npmn+7kpxcwcMTf4wTFfgtjNwXB03tRQgWjU
 phxVpzJA/Rnoeg3tGGSHuHEivBTc1uvg4ipjxUg2jpqkXpjZyG/6yxHAmP6xdnOnYShF
 37Rhd0MLOhsWkqqbMcaYwk4s7LV1gVFy7YwKf/nWOWxaVQTkxT+LZDELJIRKapSXTU83
 kgr9FQLTR/tKPJKmrH7liTSo2ZQfUC18wdc1G05aYW+HF+CXpTzoOCig8IAWaNfFzhhw
 eAxoN+sNRD3xv3lKQP2YYdQLGLJ7xDGmpDy6c3LU/k2TB36RFfOMrlBHyebAWweU+ujU dQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3qdjtavakh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 May 2023 08:32:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bnd7oaiRab0cKWdxOE3gCxYMdUCBxWrDVDnc9aKXim9mJdOvU5eNGd6sBt+FXRHCsQ0+zguSzge+5w4X+qCLdqHaSODWdWRngArwpx4YjAWIO3VOl7TepwNyLobLeoUUaSlGJ/3GJRd6yD/HJOmTWtzW76FRU0jgo6iKjr9ehklQxlrvQpI4UpR9Qudlhxp5b+gowRgWAL3jakADGVFVyQi+KIR1xciQ72nFVP07Vv5aFJUFYnU7Mi+O3+DiffAmBfjIeiA97Qj6tJcRZ21ibllMIII3UtiZEL7Cqrhr4uHAEk0R8L4wqto8sOWIoAJjRjFTUz/QYebDWRaX/03AKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+B3kDG2ijqkH50cw3GTCxpp/Y7p6L2QSc2mbEiv/sA=;
 b=PK+UM8KNCf3gMpzw7jBcNQR2CGtfl5qTUNDELKaZn9YGDaQs3+XSjJCHVyPhuACMoSUjq4brWxUmDxRAIUjCLqjmSqnCFdlLc+ecEyEEJXJQnDipcCmALv2/tVj+xJ5J4aD0I9/TNz3IbsckKpZQNx5gNYLL1Ni8JZXeD0G6LpZ845XJOclzOJRqxUYSZPRpL1dcWC+82IusCrZlKCz9j+17AIZhCGkDUHpdeilYMMncEu1+PfZ8diEzlZMIIoax3AB8X8IMdQce9iQIMQjc79DT1QWwLxT6cjlg0EIuCQTm5Xijb2zI9uVY5DoGN/hdUx1SFmBdJG2fJoHjunzVvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+B3kDG2ijqkH50cw3GTCxpp/Y7p6L2QSc2mbEiv/sA=;
 b=R086gxwy9mlHamnTkvgoDE3rZWL/TYUCaLI4fvFoQjsUiRC+w6YtxxzHJNz6viltHgniI3MUeOpLcJx/3gLbjr4h3t6D3xKFrvJE4JLERvDpcIH9p0UdvsKNDQahiYljvOXjjprao9YQch4Mj+txWwso+k6K40zPKh9aZcn+PyRCBmh7LeFsJ0eRa0jBhv8mOv1ES82bf/ELQyvM9LohrExPYxnBGgG9NqjAU6jEUAltvWsDXtL3kwre5Gq6QTKoBFWi1f8hhd+m2T/ifQJUboYU+LEc4ALzXcPfbaHblfYgs/XAutlBk6JsdM+07NP7ICOYGervvY8YLpuSlCKkjA==
Received: from BYAPR02MB4806.namprd02.prod.outlook.com (2603:10b6:a03:42::30)
 by SJ2PR02MB10148.namprd02.prod.outlook.com (2603:10b6:a03:55a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 15:32:48 +0000
Received: from BYAPR02MB4806.namprd02.prod.outlook.com
 ([fe80::7a30:ca33:20c9:c9d0]) by BYAPR02MB4806.namprd02.prod.outlook.com
 ([fe80::7a30:ca33:20c9:c9d0%7]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 15:32:48 +0000
From: "tejus.gk" <tejus.gk@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
 berrange@redhat.com, shivam.kumar1@nutanix.com,
 "tejus.gk" <tejus.gk@nutanix.com>
Subject: [RFC v2 0/1] migration: Update error description whenever migration
 fails
Date: Mon,  8 May 2023 15:32:22 +0000
Message-Id: <20230508153223.133081-1-tejus.gk@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0192.namprd05.prod.outlook.com
 (2603:10b6:a03:330::17) To BYAPR02MB4806.namprd02.prod.outlook.com
 (2603:10b6:a03:42::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4806:EE_|SJ2PR02MB10148:EE_
X-MS-Office365-Filtering-Correlation-Id: 48668773-b052-4a4e-c1f6-08db4fd97a60
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pAJOnW/Ce5lED/hLkQCPu515sKF7QWNlwbR3Rdkl/ehr2sEStmKFZ2n4ZWGXSsQT5ux9L0prwQGCyORQdnYiQe9BsM5JXVIPTIO3rlioX2xaVPSTHLYD4CaBZms0QeFG5uTXwHjKk/ecExoy1+2yKZWZVpPZSbdvMAH+Hc3iv13J1knLj35E0lsioSdikYqmSrFyQAZPjuEOMk8/yhMeldijiPOYrHTKGej9p5hhOHGYNHr/Ww3VbCiOFyDnYhThsLpAeHRD5HWT4ENtZP3z+EBfnpDzzf5IqTT01RsEqZa3T+STR9Iv6LjJelziz1xqTboK2ez7ZKdNjlCsIewx3lp75rkIps1AkRnEhtfWWkc3nBSQQr1ITHhJxP0oe2f7l5ggX5jP14SBEd9wf7nUSXlrcN2U2ib2rNrA0UMG1P5w7w4cqkT0RK77QaakSu0DqsewRuchVK7P0uwHYFO7q/JzPrNLR2L3dKInGovVnw2tr12UqH9AaZ0kV0m9JRruS1prpure6JiUSO3ryMEDOAeNZ9CcEYzMfzPSVgNqCnljDVXczoVUwgnjL7tmLHuLrjivcwdpifYiG0x1Vecm88xZax396k1+7pH/ok0jbSQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4806.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199021)(5660300002)(4744005)(6486002)(52116002)(8676002)(6666004)(41300700001)(966005)(8936002)(316002)(26005)(6512007)(6506007)(1076003)(66476007)(478600001)(107886003)(66946007)(66556008)(6916009)(4326008)(15650500001)(83380400001)(186003)(2616005)(2906002)(86362001)(38350700002)(38100700002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7C4CWl2dr9R0KiARjouNHxpL76x0JwHsf0oUbMLmIXksfATpoevTtJaPR3nl?=
 =?us-ascii?Q?JWetCuW7mIVODH0FdMunskKUAkEIgRAgMR7x8UKgqkCwyXdoeMRY+liYQDJv?=
 =?us-ascii?Q?mBHEoe4GzBlaL6tmY9UY9iDsE+eVY8WLhCz2Fc01axBSGGNmzJZUJ/tEJXUB?=
 =?us-ascii?Q?U8ZJTmy6LPdupD7IsgI9L8jWHP5kwvN0lgoQTQb/uvs7l+z/s4IPyne3i+95?=
 =?us-ascii?Q?AQFrCthLitBCVcjc7eAslOWKwJYEvMoCD15QQazUBiPy0Gnm2G8crv7/ZZb2?=
 =?us-ascii?Q?Q0PUG7XWQo31YcKouRgnRPPLhOwjcW2raRHfsl7KOd4pA+JHhcYL+JNL3uSo?=
 =?us-ascii?Q?qYgr/MkoX0nDc+nvzFeVQyZGLdVlj8qQmIfvf78oesrugE1HD2VXsBQzQ/Fl?=
 =?us-ascii?Q?qGRrFugJsh2KVATYffVkdEZEGyuxI8eGIWo+MLlm2SO+igT6QySJsGwZQ3lF?=
 =?us-ascii?Q?rR8h+nLZbR8GDgTvwP1jTfzCi23QBVd5T2T+Mg3vElE/Yb8TdX3biy9OBqn9?=
 =?us-ascii?Q?/3lKC7JN9dM5l5EGXZzzw5mTEMv2hRFofDVvPMtWxkpMzNaAG44epk3pzUJX?=
 =?us-ascii?Q?0EU1FFdPtczVegldbJpd1ERzUKB4qcRd+G05FllL7NmQVRFvrsyA05rc+aq1?=
 =?us-ascii?Q?scTs+ET10kwKj7XRePPWi2Z254/DTwGviU16O+DqJ8BIOXWwXgXbx+nx7iCc?=
 =?us-ascii?Q?Ei6wVYrQZUcC8o9RDUKgiNKkU/ILkrxSBPU8BQW4go+SMrRhRE7fds9ITzZD?=
 =?us-ascii?Q?6I/TMh8dHRvqmLxHImg3zZCIdYqE4Hjggk9w+1pCZMy+EiZqFMv4NWf73IHg?=
 =?us-ascii?Q?o3UinuTKYovzi4IN35pqK6FRDUnIInsu5dm1aIHK1aI8HFDejR1yZVnbHLzU?=
 =?us-ascii?Q?dxQBQTdEAqfJuNFJeW8Lr4XfD5M/+lRCKty/mSaEUCEQDZxGfnA3UaggGKHL?=
 =?us-ascii?Q?XLbTz7UIjS92SeTNITk8AY4OI1V7hw4upKQxl1KgL1qLiyhUXguqa+Y6vC9l?=
 =?us-ascii?Q?nLRp7byzYv5s6ZfQBykQsPOubdKIr2woqhyHHPEKZghNsCapLt/W3xYtyVFI?=
 =?us-ascii?Q?JBv73ijID04+1e35cAUgmbtuHO6LFB8COMrQSCDPjgrppdUs32ROMn/ImIG2?=
 =?us-ascii?Q?g94/SJt2CsfuHAhCFJjBnsAdR0zURpHZ/j197r/kKtvKr5txEU5YnAvc8eM5?=
 =?us-ascii?Q?mGTgBX9zTSSrNd0TtGDxAOVVVpOTjtoXUfOkmdcsQCKSdaUPugU14e9RiJZt?=
 =?us-ascii?Q?FVvKEVOn6Kh1bA13P9lNWy6yZs/2guoBtDThIG1Fcb5McwdBFv3KX2TMC8s0?=
 =?us-ascii?Q?zsQzBN7Y+ZhBmJnIFoQJ17hSIIUBLUdqTx0fr7YKk8nesMNs48/g1SqF240g?=
 =?us-ascii?Q?hOW11PlhNib50pR2pq2FhhdBbmOpndLOkZ+riqo5HpFJEUYAv18jYCV+UhQi?=
 =?us-ascii?Q?VB9gcBdCQJiHI91GjuHljA4gwC/XVgbdE3W9LLj6c54qu+zHXkUKTyxblrCQ?=
 =?us-ascii?Q?qxEjVJr/50IsjHdGRRL9NrHFA1jzF96K4R2v4RaRvrfoWvRtlR0KTD7GrW3F?=
 =?us-ascii?Q?jk7rFiAS0IlzAXxe4cyXDGQlloWtKs3qXUgz5Yur?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48668773-b052-4a4e-c1f6-08db4fd97a60
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4806.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 15:32:48.5037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXrujetKVuF3w4/Biq8HpcBFnLlh/6Qr8gFCN3sZWxrsxdC+st+rrgv0LsfgxY65xFN0MtgbDdBn9ecZmiqrrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR02MB10148
X-Proofpoint-ORIG-GUID: d8-WjqSzQVicjU8jE32ytHMFK2f0u9mK
X-Proofpoint-GUID: d8-WjqSzQVicjU8jE32ytHMFK2f0u9mK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_11,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=tejus.gk@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi everyone, 

Thanks for the reviews. This is the v2 patchset based on the reviews 
recieved for the previous one. 

Links to previous patchsets:
v1: https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg00868.html


tejus.gk (1):
  migration: Update error description whenever migration fails

 migration/migration.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

-- 
2.22.3


