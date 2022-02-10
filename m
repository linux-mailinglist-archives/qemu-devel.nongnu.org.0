Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEA24B0A85
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 11:27:11 +0100 (CET)
Received: from localhost ([::1]:44954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI6fN-0003in-NF
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 05:27:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nI6bj-0000Yt-SA; Thu, 10 Feb 2022 05:23:23 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:55088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nI6bg-0000tz-Vt; Thu, 10 Feb 2022 05:23:23 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21A7dwLg017445; 
 Thu, 10 Feb 2022 10:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=DSS0yWCFM+yy0zNaf1wF/V5nILO7Ph0jnGOfn6+1v1s=;
 b=oNpwrFl8R1l9kqWMeitL3JEAVMjracoa27BMP0mDwBIzeAq+IETeNQdqk5bpi4WiOs4K
 ZHcC6FyhoOG5rcW7RRHU5Phjrw3RvyuZ4RQN5I4rE4qdgMJ1Wgn1VO0SUhVtsY0wBpi+
 Y0+sPbSyugIagm6pgGQ1pXRXv2RtGHZHCvdyr00oFBOyFA8khiEhEcQS9IcpoTcHDjds
 ERJyVSO4TYzd+/qkq+PG77/4ZAi0iPz4gHZf2jfo1w4PEWFKZNa4wmURnQnYz1lY6sKz
 dQzIGIfJlxttFHv0l8Ok8+cXW8yhgzAlizsh+PQcbDnvk+615SlJF96DDzRxYzOHuDQO GA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e3h28qj25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 10:23:01 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21AAACoY142896;
 Thu, 10 Feb 2022 10:23:00 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by aserp3030.oracle.com with ESMTP id 3e1f9k0vhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 10:23:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFoBnGPbc3v/hcVxNAY7HdykMXrXQjImFiGUDDw8hsw1SEsxYMU8V7nSL8bw+gku1ba2E57oNje14/lX9VUFVTAvS0UvcBep+n9GaAcaHCEBZ3xAW75BHVYe4h2sSGcPj86Sv3Ab5gHkHg8ptx59QvMdN/Q8MNwYpz36+LeJW/sFgUxk5F26QfCFl7wRkJWiRJ0SaZPYq+bM2r3RSY+zN6m6cjr66LUOzltLptpmFSCc6lrL33p9NtqllYv9mp6KwHakUAniOnsBqlDopMRnrlqffbz/ZmYdxvnmov4HO1L4XEv79hIDdKKTczGGe9P9bmq0epXUmk53vD00jK9yBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSS0yWCFM+yy0zNaf1wF/V5nILO7Ph0jnGOfn6+1v1s=;
 b=X7kpBwW1uld8w+pWf1yhK1xlZhv9A2Ds0QqJfB2ZPjBhYzGwXoQH7TWxgpTZGa3mxImX77JZDtNMg0PAG5YdfUl12sestrygtFkAlD2LyhfXjPnIiiYIMJ0JPeNCuYIZ5gwhuMAlTXA/DGJLf9EbrQYySt/HbIaPb/h2ajwbSLEiZ+e3OwKhxud/Arts+XC7dKBMidlCRH4FzlhYnVQJ/luUGqTXkJ2OkaJYt3y4XQCgmv4Zlh1lfejdEHBr1cGGfqDaPZvR1pjYWhKgweDzVgMigHhnyfNNH4wNNhgwnxW9FzCU9+kX8JJbx3JbNECxLSvWZEfPk9t3fyXkKW+oaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSS0yWCFM+yy0zNaf1wF/V5nILO7Ph0jnGOfn6+1v1s=;
 b=JGi8BmROsc6s2VNx9drAKQzAR41gkSyfS+4nHZ2rMGqBme51/xJrCsvHoNuqq1G4iiADxlc0C3fqmTZkU+HOYElrIkPtohOLj68Vcud+nrVotfEIFQceIRRfZPHj1u2Y5qdykzzZJPPZfapXPv7jzqjYyczt4SapKUD6OoZl+Ew=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by DM6PR10MB3513.namprd10.prod.outlook.com (2603:10b6:5:17b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Thu, 10 Feb
 2022 10:22:57 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::b8e3:f092:c0ea:9ddf]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::b8e3:f092:c0ea:9ddf%4]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 10:22:57 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 3/8] qmp: add QMP command x-query-virtio
Date: Thu, 10 Feb 2022 05:21:55 -0500
Message-Id: <1644488520-21604-4-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
References: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51d9c976-8479-4f63-9878-08d9ec7f4e5e
X-MS-TrafficTypeDiagnostic: DM6PR10MB3513:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB351395CD510A1A89901030A9E82F9@DM6PR10MB3513.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G8jg105cgYuP+cKO4kmLZUpE4mf27VIji+7p1nm6xrDAzTx/gpO2s0I6j4ZH5T8HCeVBpEcvl1XwS6AzayWC/0k+3iO4z4Dt/4ZzybuKZc9/WpcJWm/4TtuuM3Mj8K742avSIqxVbXjTu1ONDKMsvWL1oS85xPdNZ3/d9qFixdwf/7rXHBkBSnKM36NE3+AZ7JNLvUOUwp3HAl051vjbMxaXJPEG7JfbiNwoLPxLeKbEtyyqlmr9TUXenCBYR2WpeYaIyQtGy4+C/9W8HmDITyZUaNTqAXnUJHkL7BLLuEDoP1onXH+yH29xsz0jsJhMF8kzT+0gWtIwNQ9aluRQzi1uOIKN1RvgdLCgIMmhv2Ag/R+BIYzN3QVmdfsDyxgfHhq73hZW+/HElc3PmWRdBJHObdS7FbIR6ep9hbr5tPBlUe5w2dAg0ofDqXh0StDsFeaDgitW6xFSm3dGWZTtcjMHivl18i0jF3Y4P9oPgsRTxSmJNOiYbVi2DYjjEw8Izi1I34F49hpBsY9uLtMFELd1K7f6hitzWk0CRJu9ZLQp9w6B+O6Fr6Bqc9t3TrxC8aF6Kt2DU+YtNy03DPHU1M1FP++xDffg+giqyWB4CyB35fPoCV3hVsmB3sxyd1AqvgnoczT7oBziexdKe+3wZQQXCvvx5NCWST5OQsSgMkMaFPPZ/gL1e/xUyfXQvTRJJoSTkp1iYW3n8iamWiO6uA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(508600001)(44832011)(86362001)(8936002)(8676002)(66476007)(66556008)(66946007)(6486002)(7416002)(83380400001)(5660300002)(316002)(6506007)(38350700002)(2616005)(36756003)(38100700002)(6512007)(52116002)(186003)(6916009)(26005)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iGwvKb2oW0VTNcz/eP5mTspY755vBJRW2Hyhh6fW4C6MAPpOHRw5FKow0dwe?=
 =?us-ascii?Q?SfTrX4eQoM2z+RPyDbUdqwguSL7ulTmMfxHKcbBqOQxDZ/9SWk1wgeMwIiVT?=
 =?us-ascii?Q?o2VWt2XZ4//c2uMdUxm3qNgjAdfve12TgHzHaSe4niwsNz4OM1M4Gxw9dQvq?=
 =?us-ascii?Q?y5UAfgP1zqpE1TGqgb7bTy2MSYb3IL5wjXL03aUT1QL3GpCh9MVYKbsJx/GX?=
 =?us-ascii?Q?iyVuvKrpfwKZn/VKTuWKumt4grGMcZVPa7bjDawkJBkL9zgyVF1ZGw0lwJaS?=
 =?us-ascii?Q?MoqJpHCsUTSxPPXU9hAlc1fhFJKbKeeQA95hRVmV2tydL7d5Jnt6P1carup7?=
 =?us-ascii?Q?ZwXLMcXS4MOH6j1rV42LQSymeeBbvDLST+IZsxw0sNuYzber3U/+DilAy23g?=
 =?us-ascii?Q?XbOB6gkQAZYTrSAhOHrBuCG4wuUnZ9+FjZTHtxf6tAKlK6JVBF4PaM/IYLci?=
 =?us-ascii?Q?vzdv4z1MByZHUEanFDxBYr7A+o+B3ZNThcTtmd05XnpEUlyKjsdREdGZGq6G?=
 =?us-ascii?Q?8OM7BOIhyPozrSY0FqTZrsdUI5tUhz9ZWlQgd37yeSOw5BylbBF7lw19d7WL?=
 =?us-ascii?Q?IC44pQlH+3RUjfwReUCsT7ne/yJFlCfwNPDwz23LZYihtkOkEDlAt0l7SHMA?=
 =?us-ascii?Q?OcKTEiQeIMARKC0FZjjM4Il4j9YXBdQD8k/CMJ+rrYOyMf6setazfibZyBRq?=
 =?us-ascii?Q?6vKXO7rYeAHaJwxHR/FvGGFeijmVnumdA1uzdzTrN6PzVlmu0jzu8GFwZ1qq?=
 =?us-ascii?Q?WUnYnaXNM5QlvCaGKdUcD0l7s5f7/2dXUyUbPB+rGesBM8bSGUqcBau9ULjl?=
 =?us-ascii?Q?cvog6i0M72S8mH6GOouy47/rQqsIqu5DwSnKogWVdOQuW3YgrXgsiENX4qs/?=
 =?us-ascii?Q?bwFnZQua8EmfndMtkXxVH8pKgVK1mDRhb58KxLZ22a0etzHrmkEaeST9J0Bv?=
 =?us-ascii?Q?hCpTue4GjFaRkmMt6MpccxYQI4KZw4ytsb3XlaKQqa4RqYI+BYolA1FEkc6s?=
 =?us-ascii?Q?Xh9uir769Gva/jRMRF+2ssQXhnCkjtWKAInWZl2+5NcIrXtuN7Ktb6NkVB1P?=
 =?us-ascii?Q?Dye1TeR3zEScZArYTnc5BT2rj2cAFSSIA7nSgN1HhAXAvEyTCsuM+Z6UOSyk?=
 =?us-ascii?Q?MRET7w/YmEHMtwfCCbBu+I5E7tqMEHx4hu2Y82j/iwY5tw/7AitHI1+6rjKv?=
 =?us-ascii?Q?vmHZPRM5hybEIWI+e2eekRjGMHlqdhQDSdI1MqIDI62U+d5iXmg86wFnszYu?=
 =?us-ascii?Q?iuPKBVWBCsqC4jS/WjU5lMrr3sGi5q32wqunhXBpWMJTH4coch7veQwh4Vul?=
 =?us-ascii?Q?dyqcBNCM2xRInbg13DF6jpCMutux7K/V50jF/8/aRd6DokvURM/r5V+cD+w3?=
 =?us-ascii?Q?46NqZyEgXwUNQUe2slMk2d1IPCKpKqbd2HCXrpgW72BLZSGEhSpZV2qhstbL?=
 =?us-ascii?Q?i7LYM8/YEg9mKMHgLWFZT9C/FW/Z6RvT8QnOERBsm8wLJH/SJYN/SKCzrOzF?=
 =?us-ascii?Q?l30623RxQ77vTIg7b5eRgSdTFUckHJhBnMHYV61n2eAeDY5qz2efLAg8tAJq?=
 =?us-ascii?Q?gRoa+u+m3DX0O5jGOqpasvC8UhJdIqqs6+kB+EApiCAXh2WTyCp5ZskLB+wu?=
 =?us-ascii?Q?jEzMfZhZsdjNfisF/QQ8mM8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d9c976-8479-4f63-9878-08d9ec7f4e5e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 10:22:57.0709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUiux81OwwSjff6FbP6azvYEbfKeZ7T/dLgLBqNhpSl+mtD4M4AMokb8+KRkW2iW1MtiacNtwQdlAn/bcf3++w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3513
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10253
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100056
X-Proofpoint-ORIG-GUID: kAyz76eqXXn4zymmioWrgejSK7QO8IgP
X-Proofpoint-GUID: kAyz76eqXXn4zymmioWrgejSK7QO8IgP
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This new command lists all the instances of VirtIODevices with
their canonical QOM path and name.

[Jonah: @virtio_list duplicates information that already exists in
 the QOM composition tree. However, extracting necessary information
 from this tree seems to be a bit convoluted.

 Instead, we still create our own list of realized virtio devices
 but use @qmp_qom_get with the device's canonical QOM path to confirm
 that the device exists and is realized. If the device exists but
 is actually not realized, then we remove it from our list (for
 synchronicity to the QOM composition tree).

 Also, the QMP command @x-query-virtio is redundant as @qom-list
 and @qom-get are sufficient to search '/machine/' for realized
 virtio devices. However, @x-query-virtio is much more convenient
 in listing realized virtio devices.]

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/meson.build      |  2 ++
 hw/virtio/virtio-stub.c    | 14 ++++++++++
 hw/virtio/virtio.c         | 44 ++++++++++++++++++++++++++++++
 include/hw/virtio/virtio.h |  1 +
 qapi/meson.build           |  1 +
 qapi/qapi-schema.json      |  1 +
 qapi/virtio.json           | 68 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |  1 +
 8 files changed, 132 insertions(+)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 521f7d6..d893f5f 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -6,8 +6,10 @@ softmmu_virtio_ss.add(when: 'CONFIG_VHOST', if_false: files('vhost-stub.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
 softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('virtio-stub.c'))
 
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
 
 virtio_ss = ss.source_set()
 virtio_ss.add(files('virtio.c'))
diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
new file mode 100644
index 0000000..05a81ed
--- /dev/null
+++ b/hw/virtio/virtio-stub.c
@@ -0,0 +1,14 @@
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-virtio.h"
+
+static void *qmp_virtio_unsupported(Error **errp)
+{
+    error_setg(errp, "Virtio is disabled");
+    return NULL;
+}
+
+VirtioInfoList *qmp_x_query_virtio(Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 7c1b1dd..e59f0d7 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -13,12 +13,18 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-commands-qom.h"
+#include "qapi/qapi-visit-virtio.h"
+#include "qapi/qmp/qjson.h"
 #include "cpu.h"
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
+#include "qom/object_interfaces.h"
 #include "hw/virtio/virtio.h"
 #include "migration/qemu-file-types.h"
 #include "qemu/atomic.h"
@@ -29,6 +35,9 @@
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
 
+/* QAPI list of realized VirtIODevices */
+static QTAILQ_HEAD(, VirtIODevice) virtio_list;
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -3687,6 +3696,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
     vdev->listener.commit = virtio_memory_listener_commit;
     vdev->listener.name = "virtio";
     memory_listener_register(&vdev->listener, vdev->dma_as);
+    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
 }
 
 static void virtio_device_unrealize(DeviceState *dev)
@@ -3701,6 +3711,7 @@ static void virtio_device_unrealize(DeviceState *dev)
         vdc->unrealize(dev);
     }
 
+    QTAILQ_REMOVE(&virtio_list, vdev, next);
     g_free(vdev->bus_name);
     vdev->bus_name = NULL;
 }
@@ -3874,6 +3885,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
     vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
 
     vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
+
+    QTAILQ_INIT(&virtio_list);
 }
 
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
@@ -3884,6 +3897,37 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
     return virtio_bus_ioeventfd_enabled(vbus);
 }
 
+VirtioInfoList *qmp_x_query_virtio(Error **errp)
+{
+    VirtioInfoList *list = NULL;
+    VirtioInfoList *node;
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+        Error *err = NULL;
+        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", &err);
+
+        if (err == NULL) {
+            GString *is_realized = qobject_to_json_pretty(obj, true);
+            /* virtio device is NOT realized, remove it from list */
+            if (!strncmp(is_realized->str, "false", 4)) {
+                QTAILQ_REMOVE(&virtio_list, vdev, next);
+            } else {
+                node = g_new0(VirtioInfoList, 1);
+                node->value = g_new(VirtioInfo, 1);
+                node->value->path = g_strdup(dev->canonical_path);
+                node->value->name = g_strdup(vdev->name);
+                QAPI_LIST_PREPEND(list, node->value);
+            }
+           g_string_free(is_realized, true);
+        }
+        qobject_unref(obj);
+    }
+
+    return list;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 90e6080..8f4e4c1 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -110,6 +110,7 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    QTAILQ_ENTRY(VirtIODevice) next;
 };
 
 struct VirtioDeviceClass {
diff --git a/qapi/meson.build b/qapi/meson.build
index c0c49c1..e332f28 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -48,6 +48,7 @@ qapi_all_modules = [
   'sockets',
   'trace',
   'transaction',
+  'virtio',
   'yank',
 ]
 if have_system
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b97..1512ada 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -93,3 +93,4 @@
 { 'include': 'audio.json' }
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
+{ 'include': 'virtio.json' }
diff --git a/qapi/virtio.json b/qapi/virtio.json
new file mode 100644
index 0000000..aee0e40
--- /dev/null
+++ b/qapi/virtio.json
@@ -0,0 +1,68 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+#
+
+##
+# = Virtio devices
+##
+
+##
+# @VirtioInfo:
+#
+# Basic information about a given VirtIODevice
+#
+# @path: The VirtIODevice's canonical QOM path
+#
+# @name: Name of the VirtIODevice
+#
+# Since: 7.0
+#
+##
+{ 'struct': 'VirtioInfo',
+  'data': { 'path': 'str',
+            'name': 'str' } }
+
+##
+# @x-query-virtio:
+#
+# Returns a list of all realized VirtIODevices
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: List of gathered VirtIODevices
+#
+# Since: 7.0
+#
+# Example:
+#
+# -> { "execute": "x-query-virtio" }
+# <- { "return": [
+#        {
+#            "path": "/machine/peripheral-anon/device[4]/virtio-backend",
+#            "name": "virtio-input"
+#        },
+#        {
+#            "path": "/machine/peripheral/crypto0/virtio-backend",
+#            "name": "virtio-crypto"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[2]/virtio-backend",
+#            "name": "virtio-scsi"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[1]/virtio-backend",
+#            "name": "virtio-net"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#            "name": "virtio-serial"
+#        }
+#      ]
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio',
+  'returns': [ 'VirtioInfo' ],
+  'features': [ 'unstable' ] }
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 7f103ea..fd00ee2 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -103,6 +103,7 @@ static bool query_is_ignored(const char *cmd)
         "query-gic-capabilities", /* arm */
         /* Success depends on target-specific build configuration: */
         "query-pci",              /* CONFIG_PCI */
+        "x-query-virtio",         /* CONFIG_VIRTIO */
         /* Success depends on launching SEV guest */
         "query-sev-launch-measure",
         /* Success depends on Host or Hypervisor SEV support */
-- 
1.8.3.1


