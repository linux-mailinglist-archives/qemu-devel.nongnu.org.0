Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83821321E15
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:29:05 +0100 (CET)
Received: from localhost ([::1]:44374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEF16-0007v7-8c
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lEEvb-00038K-RS
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:23:23 -0500
Received: from mail-mw2nam12on2115.outbound.protection.outlook.com
 ([40.107.244.115]:57473 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lEEvZ-0006Gl-Rr
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:23:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcSQVoJ9wU9iZ5ed8RRwQ00aK9LjUh4Gz7HuXKeQjy5+nB1f1sxGLcXIa9701B6LLe6Q1LsEFFaSocAWYzBajYcRSlzxNQkvBlGVTHH93HAlkM/VTn/dERX+L29lmeHVD+zOyrMMZGsZn8n5jzTFKCYEvulLCJIybVFW1UZEoJfzoF7wCnVqaP/6dhx3NFbBGxs1k1Tijv0zGaPKodNH4Qn/gnKStCuF1J1Gb5j7Df5sKespp5uIqoqY8j0l4KuQrr+bsYIGvceX3WSKfXWQE7Pgm2PbHIwMjMtXgvKVlhQuolj5rsGh/xVdl1sGdCXO/9y4WbI4EG78yf/MT0dcjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKNYz8xKVdrybfjtyXBenJUMqKPHBMdsicz0ANaBAuA=;
 b=D/descDRgnpP+q6mDn3toGiVxG+EUSsBkcCNdq73vKNE+HPIn/tAWRTwTxTMyiS9DDieZMvVHJqB5wxMjU/DDstsY8IHgL3KmfxeJGWNYaR/qNmq2MORXGqcfoNKmxAcoxLcrtSrYI9nIXzo8PCCjr859lnr6/DxXokdhrjGJ47kgvcYiXAcf1VKtHl8UI5cUKjq0kqNRqHThJAR3Bjgw7v6/BbxW2jFlLaKHwO74c2MI3WuVR9E9Qpb0cTW9H0+1+sJxQ+Tw1NvzzY8O4pe0Rr+uaY8vpIkG3ayo05jWAlcsyqnWlMWoE24aspMisBqsMGy2SJ2wE7phadHP/fvmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKNYz8xKVdrybfjtyXBenJUMqKPHBMdsicz0ANaBAuA=;
 b=r+UJCaOubtFkb9sJ6hgrPv69g7nUbal4md9SV5y3fa1096Uvs3RebPfC1iie5DH2w3YUHixMe+xXazK+hVgMydQl/ZLuJJZJ8bu2bHY9gBJmK0uRvz+pjTk1rli7D+Pq6ZOeuyBOSz9Cp8lJy4yxLKgbK5WjrlG0sbuGFoNUNWw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB5152.prod.exchangelabs.com (2603:10b6:805:c5::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.32; Mon, 22 Feb 2021 17:08:10 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 17:08:10 +0000
Date: Mon, 22 Feb 2021 12:07:31 -0500
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, cota@braap.org,
 richard.henderson@linaro.org
Subject: Plugin Address Translations Inconsistent/Incorrect?
Message-ID: <YDPk08PCwhD7Nm2+@strawberry.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR16CA0018.namprd16.prod.outlook.com
 (2603:10b6:208:134::31) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR16CA0018.namprd16.prod.outlook.com (2603:10b6:208:134::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 17:08:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70b524cf-07f0-4f0a-bbed-08d8d7546e38
X-MS-TrafficTypeDiagnostic: SN6PR01MB5152:
X-Microsoft-Antispam-PRVS: <SN6PR01MB51528ECC2D528D17055A83968A819@SN6PR01MB5152.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hHwov+Pa3sUGOcc5F1cTjq50Ak6RXJGnDDsNytFjGiI+7XTfsLC1QdZfbhiGGR/3PjsNU3cFmjdKb7T9yNbo4KzaukAfKVOE+r2SqLuXpNVokcDqk+JB5UfFHg9qP5wj7Vw4g9J4i7x/Q+e6DX/qLz1HAgOCqFOUOa4rgeiqnDcBEWsbDEosS+lArw5xGdq/IGR5W122O+GskFuXS2KUpKNUkizbExYko0DH089sm/5dSnhsOwJ6eltZUQ3POe3g6Mf6aQzyieG/LZkvwxVsUVgf2JcA1P4BU/n4rhzjYALcujyflIbuYq10N1mp1rrDHMhjgEH+ERHy1Q8VeOk3embj1cY1vgEgDqIGbDUfyRimVftyRzfna2KiM5qWCmiSVYPX6b8IU9OdOE+mq+r18m0CCFXi9VYwkJnrd/ujF4QeyCq18otSY6De011uD8fCpNPQK8wG2NwazsUSMTZQBjOSTzOuC7h+TEwtZ15OokmBqWVNB7hQtHSaqxY5fVhTyiYDGH5HkdI4/F11vlfMww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(396003)(376002)(346002)(186003)(26005)(2906002)(6506007)(5660300002)(956004)(16526019)(7696005)(9686003)(66946007)(55016002)(52116002)(86362001)(6916009)(4326008)(66476007)(66556008)(83380400001)(8936002)(316002)(8676002)(478600001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YlcESWJp0yBTXGtHnnU5JEeMpE2+Uygq6r+u4mI0QGAK+SPkyr1vImNvIfGy?=
 =?us-ascii?Q?6uENd3DffSokCq6DHIyTgOrcMvgms8IAWe3WiEp0BSy26h/M2MkCxkOTgzz6?=
 =?us-ascii?Q?pgiFRL/F+0XEa8KZHbFLVLJ8JQwItap/IRDYPlhPf3urZAprK5Ho/UEaMiw8?=
 =?us-ascii?Q?GD7Ynrxf19EIlhwIVlevyRgSkoDLGVNU+MokPRKZS61FRQ9uyDEHH9t2SNIz?=
 =?us-ascii?Q?zCNLG4GXvUX6ywzssmomApm8EieQQKZXWeHQiTa2UKGGChL6pX8AIiZ5s3mD?=
 =?us-ascii?Q?4ZB7GT//DHoh2QEWDDxjIWQ+DNan+vUTqMDGEJUhzEfiqJwZCS4O2BL3mQTe?=
 =?us-ascii?Q?mAhWIRBXGit5XBy6dVebTuRvMGpl+ncaimXUb7ihPoWNHYOu7O0zY3ssLfMN?=
 =?us-ascii?Q?/nqa0bWIZK64SpNYs+nufdex3T2jjYYFUxpl1jK7MDkmsBUylRx2E2Raa88Z?=
 =?us-ascii?Q?Dz4qnAm3etlggOGzx/CDZ/CbM6vfcy5QqJhc8kmoiBQ0/H8Ggyi01IKUQati?=
 =?us-ascii?Q?PPYYDdp0gSfyhS+DxRPo5aEsLdvJFDul6yYvSGEpzpCsGwkgSIQ3qUxb6AJ6?=
 =?us-ascii?Q?7e2Y/BlV44DATuWq+pLcM5GLEqAYgTtnybgPqNV/FJ1aagqBmKQei0Y6lDMs?=
 =?us-ascii?Q?R8UERLy+qi35aXF8AMJow2FcLDaCCS2qqt8v8gC6VKM9dSAgRKrk6ICHhIzh?=
 =?us-ascii?Q?R8qITUzpc5e8zJiJs10E+EXDra/6YMkmcC3ncbktmMWZ2bkofgCsaB+icy31?=
 =?us-ascii?Q?h6AG/OGO5tUtDsZ1xHn4dwEERhqYps2opP8/iwNa46rhJ8/LFE67zzMmQ2Xr?=
 =?us-ascii?Q?+xrkIWX47jJFVBOq6M8K474sXIw457NqwuPzjo5klE3t3x0/SV3LI7y22CNg?=
 =?us-ascii?Q?UYIKGTHfJRL+H9gay1FYiMXjnoRksFh6iCDMXLIAZQc9Ti/EpDDL9zN3D02f?=
 =?us-ascii?Q?PgyeuaAQfd0CKy/LShKJfLESlAN4happwjoXic8IsNzg+rHGAAYQgx2XVLNT?=
 =?us-ascii?Q?V1PInQ40OrcEMp8at34oZ9i6oiTU5AKSEfYxs+1kuMtPilWCdWkAmCuEtfqY?=
 =?us-ascii?Q?lnM1jIqwFn71l8QaLgPTvgly/33jurw2F2gsd5nWY8iO5+wGn3dXoal7JMjq?=
 =?us-ascii?Q?5fP98RNzkz18dw3KyTM+RTz2X1suWBZjX10iKkvZ8oO3S0mD0Pgg5l/sLui5?=
 =?us-ascii?Q?G6KKh8C1Vwf3wozWYyUSR32ZUgAcmn5ix4gA7EX3QezSHA4VW3LwB2p8KT7D?=
 =?us-ascii?Q?D0JIDK4ToifTjTZf1bA0hC0vDEbGejN32VQSfiQDDOvFKzCS13TijJCK39RE?=
 =?us-ascii?Q?VNabWNMRFxo+KecFTiStsX5e?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b524cf-07f0-4f0a-bbed-08d8d7546e38
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 17:08:10.0461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CcfzNtBjidJq9HTgIfBdqQVFo9n++hKUoQu64Kk8otacUaAY6ZHVC96OsL7BNlkFmY+fAgIAbN2VynbkD1acYnTsAc4I0BpDnkZOX9q1WCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB5152
Received-SPF: pass client-ip=40.107.244.115;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I've been doing some more work with plugins and found something I didn't
expect with regards to address translation.

If I call (inside a memory callback):

`uint64_t pa = qemu_plugin_hwaddr_device_offset(hwaddr);`

I see that `pa` takes the value 0xe0e58760. If, however, I plumb
`cpu_get_phys_page_debug` through to the plugin interface and call it
like:

`pa = cpu_get_phys_page_debug(current_cpu, va);`

I see it takes the value 0x120e58760.

I notice that 0x120e58760-0xe0e58760 is exactly one gigabyte, which is
also the offset of the beginning of RAM for the 'virt' AArch64 machine
I'm using. Furthermore, I see the name of the plugin function includes
"device_offset", so perhaps this discrepancy is by design. However, it
seems awkward to not be able to get a true physical address.

I've done some digging and found that inside `qemu_ram_addr_from_host`
(called by `qemu_plugin_hwaddr_device_offset`), `block->mr->addr`
appears to hold the offset of the beginning of RAM. 

Do you think it would be reasonable to modify
`qemu_plugin_hwaddr_device_offset` to add the beginning of the RAM block
or otherwise return the true physical address (or at least expose a way
to find the beginning of it through the plugin interface)?

Thanks!

-Aaron

