Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828683F9E5D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 19:56:14 +0200 (CEST)
Received: from localhost ([::1]:37310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJg5I-0007gQ-13
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 13:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3B-00057V-DM
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:53:57 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:14104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg38-0006ob-LM
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:53:57 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17RGR5BB002221; 
 Fri, 27 Aug 2021 17:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=hbeesl5jr2MDQwAekYTe74dtuO0w8jGAN0DHFmlsco8=;
 b=fhvPGkxu4gNQSRHpf+j2K+AVplpaU3VdHuyk4FupiC4DYmSb0yRT5Qt6fAPxu8XRZNF9
 +jFiNcYnOL5N4fy+SfqtwJXF08VgQ7J7VBEE16pjSFcincLXFKqPAcxtRtr2YhFiMvqK
 bSqaDtFGHn5qLb9TwQTwAd5gtdt1sNCYxec1kPLDgY+mKyZ9VXD0aXHkya7aHSWPx3Oe
 0PYP742xZsrUCBDth6WMECR8kezthyZui+8YZHz4JdvCYluf4Xi3NvHTtUkYgnLRkqgG
 pHVGXJsAU4r/qC5/AJ3cMcC83cpoMWkw69TrQFGELTzQk3051EzaLktvQnaj8NqJPOit vQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=hbeesl5jr2MDQwAekYTe74dtuO0w8jGAN0DHFmlsco8=;
 b=qsSKZgArXM7ly3OFRB5Nh89zEjvrMHE3X141E6EcBqG0dYZ2WXsVkZlaIlb3vXo8Bxs/
 ZbLKlUsbMR1CG1xO1sZpfTviV/7fUJgni9wu9/Erkgk0uuts8OeF159isEko1DtZXKi9
 2cJWwCsE3E0TLvLGkGvFllzRYjSdNY7PVCh6L54KVJJpx0WiEY76/5HLa6qmn6sD2w49
 FVRr8XoQ8C0OB4hULG2oF14GO2gX+sPxQ+bQ9GMGUoEI5sFGwa/Z4c1HsOsADGDoNHqJ
 zo7qpAyaqoPS6PxXw+ITbhgCkKfIYhhNaE+kumTG6pM0kQWxJwhXSLcHrgKxQ7CYKKnl Bw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3apvjr19ev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:53:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17RHnwwb179340;
 Fri, 27 Aug 2021 17:53:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by userp3020.oracle.com with ESMTP id 3akb92hhth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:53:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnHqC57qefBJftxKvQ+RqpkbVjHhwhc2ktif38YGZmpmbaIuwg8aX49RJokl2pMMngjWZUJAu2hNOTtBFjDULrl6+dPkaorCH7WjM3ZxIpiKgxmBLVXvvkh4rU+f3IU2DqOdWJ4YTwu+tg4wMrbBvjND75Tk4lu15Y9nRzR2hxZ8i6SlzEqqG/cvPGBUmDtFckJDlsj9PTS+GOcu0S/TYNRV3KVQgl/27Idi2gn0o3HHHxRMrbMjNU/HMbwTKWaNB9c1z5HfUeegQbLjdpuCvAe+pNfe9MD9YZ3SUJHOzryPut223jorymzLnEbNzsxPeeT/t+btoo/cSYp6TLSSCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbeesl5jr2MDQwAekYTe74dtuO0w8jGAN0DHFmlsco8=;
 b=Jqe9dHD4ZmuGoUjTrWi5YFig2jtYF6GknWmlvrh+UMMOMNbjptA6cQZhnYZ52N/hthpLYa2ypHbp6FcrFBpCyYHMwGqYO2kEOFoWwZQqIq8GnLVpDuQZnCaIFw0t+eTAbx/PMLDvMSQ67tWN6kMBqFWrPl8BkIRv5UvU973aDa7d5fqkYjux2cfJrxZEx8ZEA39SqvhKnTsfhcIf9EdfI9750wXDmeYPRKXv9WLa3h73EqCEbjkiM0LzmbDwZlrU1jYkSikLVGelo41kDfCsXHOjWOoItJI/nMg2hXHo96/Fd8uny1MDCu5fcok+1/0ZRCw1OmftVvDa89IvZBrI/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbeesl5jr2MDQwAekYTe74dtuO0w8jGAN0DHFmlsco8=;
 b=Js3XZqJ1vH8qKarNM//VRJ+32v6zqlWapmgU0zdzDIZWeey+WLvfz9gaV+SKdptXFCu8DEzRkFQWqilonQrPu6giyZ5apoQYuNu2tsw7SvM4hq6LgpUNkIEkC5hFxntf6HK5MKertreV6P5SzudQiMirs1Oz3iF/c9DObIKsgKM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5233.namprd10.prod.outlook.com (2603:10b6:208:328::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 27 Aug
 2021 17:53:38 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122%5]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 17:53:38 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server v2 00/11] vfio-user server in QEMU
Date: Fri, 27 Aug 2021 13:53:19 -0400
Message-Id: <cover.1630084211.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1629131628.git.elena.ufimtseva@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0093.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.46) by
 BYAPR11CA0093.namprd11.prod.outlook.com (2603:10b6:a03:f4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 17:53:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c760c28-606f-47a2-6f7d-08d969839913
X-MS-TrafficTypeDiagnostic: BLAPR10MB5233:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB5233FCE1AF957D276E18933390C89@BLAPR10MB5233.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bChTL3PrvI2ZNlWg9j86b4b8uEXab45TzX0hJwPcvaGEmXnamb3aG95XtiO9qWox0lcJSgP4pskRy0Aniyz45GdQxwoJI6fjJJS2GKlU8c1teMoRYIcod2eHhzEsUiyhUYvUDfzTcpg3zPR5BMDBS69XoX9l+ytAxKwVb+Maasx2k+d8CX+MSoMqGTTIUI1/wxzx9pEi9c1g4uoMmcgXuKUvVJfi3fJ7mDHd1Po5OkfEhlmuDA3RVJd2e4vXEFzTUZFuBIyzernTjIrxNLILJGMTaYCN8Y6OmIYKb22RpbE9SOCFEN2QONRp4PCRNE6IrYUg+opVreCllXUy+5dPlyjZGBG4ELYaQ0JnnGvduGLRDBa20X3ElQyl1a2NHny/9yQlWp0IyI27as9stPwz+Lsgek2gWRvRPZSnxo5+nZ+tCjLgnFFpor7eGqu5F/PmIgbqNX7anFEdx/D1HPoZ/UBQ6PmUISqostaYmQsKkHOOECc7Tf60vnqyiR1iBX5mM/Gfypov9/XWoCHdcZQ1BaxY3+1wk3v43VVvnmQkuM9iScoZDo+U43f8QMdZ905ODhy4eVixcuPjZeWeRjtHSf2ldSFGmUxrrWNJGGdnNwzkaOV+DV8O7U/70CXmfdCQq91V0FsggB6wf9ldGlHwlU2xFdpmCA/KDTOo2gp52BzOGEGyH8Kniw5CWJsZ9qc+iunrZ3KG8sepmkxb+aI4jhdyNfdhX4IiXDi6x7MD43reYhdYCLh65iikHFiElxSi5nNTVldFJ36795lYDWopgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(39860400002)(376002)(136003)(38350700002)(478600001)(966005)(86362001)(6486002)(6666004)(26005)(7696005)(316002)(7416002)(52116002)(6916009)(66476007)(66556008)(38100700002)(66946007)(2616005)(36756003)(107886003)(4326008)(5660300002)(956004)(2906002)(8676002)(186003)(8936002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u3xEbZhpXCYCC6v+izHJgUQmbHIvasKkbn1z2TnApQ7Zg9Xv6xir7FXKkkvx?=
 =?us-ascii?Q?YeUb5qScytO79fxvcgduGFDTbJ3lrF1ZbjKWHfyXVneJfirMG7o+9/F1mvA4?=
 =?us-ascii?Q?XY5VNWQrdWvgUOca8RitXWHeseQdKRjokguIudbFU2UesszbFJll71Rf0zbH?=
 =?us-ascii?Q?eWagvbB+B043OF+2x8ZPi7IMGetv720yr5Bp38OlcyIrmeT1cmLyueyI0HsU?=
 =?us-ascii?Q?YRy2lvfw6KDF0LxIMbPFIpVG2fq7HTPGSUrhckRTqsDdgpNVhh301VgPKhEm?=
 =?us-ascii?Q?9tSC29aEWAMqPC4MKzL361QkqSUHd6pBEwJ/e8Qrogx8i3zKXLV67w2oC89k?=
 =?us-ascii?Q?hdoPjjnm1+VKF3EYMizd0RHwES0DtfnWSDOkz4bKp+FSZ0NNaaKLXsFPhf9t?=
 =?us-ascii?Q?Yq5vR0tRmVYpytvLuIq2qNjtTJyBivStFyoiTdwhvwmmQlG0dymsmYKivtVX?=
 =?us-ascii?Q?oBjwWLMmUAwDfvq8VK8GYjg4NdeVWFKkqflKt7q6SLxq2X5iBgnmTWyRx01f?=
 =?us-ascii?Q?MjgqHn4q2o4WOSIByWlGe5vtvQuvtWsE3suoH8u/QxfqvekgdQ8SofXXil54?=
 =?us-ascii?Q?mj8KWxRQeGNjJbFO2gHxr7Xttjq3l4kHmdSXChY5oKFuivC/sKcQNFqllyim?=
 =?us-ascii?Q?U3o0o0FQ7vFG7tQxpn5kC/DvrahHtHbajvjszw8EJF0iIfGzRX2Ay66hlCTN?=
 =?us-ascii?Q?JhEiVKrzUKuPV5oe6RrOHuGILgzw7UdOvagRemIcWN8RdKQqEfPU7TWeXLKg?=
 =?us-ascii?Q?mD77P9w5X37IsqXaOcYXq7bE5C4Lb7LWTt0c5U2BYBTcB6DNslodx4szsgCq?=
 =?us-ascii?Q?2YlYqGiQA5X2QfYAgFvTKyXnvhQwQLKtS1AlfaTEdA52yU+DksNd8ca2D2jO?=
 =?us-ascii?Q?z5DfkImu6236Ga2Yhzo8QkOW3WiYx4cRYaAXl2dQMH0qra3NVeDpVTn0tpaJ?=
 =?us-ascii?Q?nxVk/b3LhaK5zWYtdID4jjE0wUgxKJaHzi8HEHSNGIxMafugxR14RuItNbXe?=
 =?us-ascii?Q?5wQxmQb0aYav3pzxdwF7TOyS57nzH5ZVHafdnhGpB/PrhJoXNbMzKypGmEBN?=
 =?us-ascii?Q?JgknXryxO7Xi95gHZagBI7GeUKUiiZbkUkdSZvnmO+e5YdRNzBMKuGMa6i02?=
 =?us-ascii?Q?8dNDy7bA/VlKwSa7dlpopwZuBh6mZJGZIqgedlOsWcXt88MqM86zA/Uq8pcL?=
 =?us-ascii?Q?Vsw5TsVdr6tV3I9eQtfWnljQJ63Nz0fnZ4OhKx4VZT1oLPJNO40KnW8KUK2n?=
 =?us-ascii?Q?dZJhKj/vjbrlCc5IDu3b/udGPB0i1FRIQ252Y67PE/WAxJTFpz4WeDPUTWD9?=
 =?us-ascii?Q?u95D26YCMtha9N1lg+PWAdBG?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c760c28-606f-47a2-6f7d-08d969839913
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 17:53:38.2264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLUhr5WoSog3pvv/RB/X/nrmAvcpbVMgrxIWm8zc4PthLvl1JEov4VaoQ4R9Tic1SoqXdj6FV14I5cPFzdkwuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5233
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10089
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270105
X-Proofpoint-GUID: bIFNhilSaB0sot1OR9CcUNF91OFPORS8
X-Proofpoint-ORIG-GUID: bIFNhilSaB0sot1OR9CcUNF91OFPORS8
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series depends on the following series from
Elena Ufimtseva <elena.ufimtseva@oracle.com>:
[PATCH RFC v2 00/16] vfio-user implementation

Thank you for your feedback for the v1 patches!
https://www.mail-archive.com/qemu-devel@nongnu.org/msg825021.html

We have incorporated the following feedback from v1 of the
review cycle:

[PATCH RFC server v2 01/11] vfio-user: build library
  - Using cmake subproject to build libvfio-user

[PATCH RFC server v2 02/11] vfio-user: define vfio-user object
  - Added check to confirm that TYPE_REMOTE_MACHINE is used
    with TYPE_VFU_OBJECT

[PATCH RFC server v2 04/11] vfio-user: find and init PCI device
  - Removed call to vfu_pci_set_id()
  - Added check to confirm that TYPE_PCI_DEVICE is used with
    TYPE_VFU_OBJECT

[PATCH RFC server v2 05/11] vfio-user: run vfio-user context
  - Using QEMU main-loop to drive the vfu_ctx (using
    vfu_get_poll_fd() & qemu_set_fd_handler())
  - Set vfu_ctx to non-blocking mode (LIBVFIO_USER_FLAG_ATTACH_NB)
  - Modified how QEMU attaches to the vfu_ctx

[PATCH RFC server v2 06/11] handle PCI config space accesses
  - Broke-up PCI config space access to 4-byte accesses

[PATCH RFC server v2 07/11] vfio-user: handle DMA mappings
  - Received feedback to assert that vfu_dma_info_t->vaddr is not
    NULL - unable to do it as it appears to be a valid case.

[PATCH RFC server v2 10/11] register handlers to facilitate migration
  - Migrate only one device's data per contect

Would appreciate if you could kindly review this v2 series. Looking
forward to your comments.

Thank you!

Jagannathan Raman (11):
  vfio-user: build library
  vfio-user: define vfio-user object
  vfio-user: instantiate vfio-user context
  vfio-user: find and init PCI device
  vfio-user: run vfio-user context
  vfio-user: handle PCI config space accesses
  vfio-user: handle DMA mappings
  vfio-user: handle PCI BAR accesses
  vfio-user: handle device interrupts
  vfio-user: register handlers to facilitate migration
  vfio-user: acceptance test

 configure                     |  11 +
 meson.build                   |  28 ++
 qapi/qom.json                 |  20 +-
 include/hw/remote/iohub.h     |   2 +
 migration/savevm.h            |   2 +
 hw/remote/iohub.c             |   5 +
 hw/remote/vfio-user-obj.c     | 803 ++++++++++++++++++++++++++++++++++++++++++
 migration/savevm.c            |  73 ++++
 .gitmodules                   |   3 +
 MAINTAINERS                   |   9 +
 hw/remote/meson.build         |   3 +
 hw/remote/trace-events        |  10 +
 subprojects/libvfio-user      |   1 +
 tests/acceptance/vfio-user.py |  94 +++++
 14 files changed, 1062 insertions(+), 2 deletions(-)
 create mode 100644 hw/remote/vfio-user-obj.c
 create mode 160000 subprojects/libvfio-user
 create mode 100644 tests/acceptance/vfio-user.py

-- 
1.8.3.1


