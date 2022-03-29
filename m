Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C644EA875
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 09:22:41 +0200 (CEST)
Received: from localhost ([::1]:48466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ6Bc-0006Vx-HA
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 03:22:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZ62d-0006tI-8A
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 03:13:23 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:58216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZ62a-0002Cj-Sn
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 03:13:22 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22T4paVp018430;
 Tue, 29 Mar 2022 00:13:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=9+nymWdD1OZE7bTOh7Ta8REDHqHKpFEDpkDtjzatZAg=;
 b=bomQW3NuMOmUMnTGijnjz9G25Bfahzru77TH+ezUkyqAKQdkBxi4estdBBjVYcnX6vdR
 jLAUPrM37MYgl/pFiOpRmVY+uv4ZSV2IPF11jccCUVL8GuAiDD74Anttz5ELyV5OOHUO
 AX/pvlUIXNqXFhTeBtBakfk38+iladdkegxBvAVMHjIopmJ+3HG7j1V0ybp61Hc4r+v5
 CBsTIZrocMSAY+8ZqVbET8IbvJ9K251IekDP19mQvX/f6BkNKLBzCEFw25z440HABDws
 cSa8G2HVINzv4ZfH3Peg3hOrQv1a1mWHKBY71YcTo08W30wrK25nNeCr6Mia7fQwBzOc pQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3f1xr8ddwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 00:13:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ml4rFO55Tpq5cPddl0sqUvNdn0PzgeZl0vGxxP+MfYNylQvNd1X0uQWMBJmFsOEgpevKj+80yZB9XkeYPMCiOlPFLQ1Z51/32xlbCTi2Du9Ex0JZLRZqZ0LQyf4eSYmlPKAS+7ljXOMSviANr9CnYvYaVsKN5LVfK5e4lbSrDN5cf4JYZ8TeTCzESFTJoLdnv/ENb4D6glIua0VY8ZhB1QHruThsyGmWlU+xtX6yrPLwQ1siDYt+0J0APIQeYyHxS+51c11NMJ0atoemx8jwPG/Upbkg5IoY/arY+l/nFdpZZqvPTZCZxA7zzoMIDqB0SX0yehdvctPm5ZfKHNclvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+nymWdD1OZE7bTOh7Ta8REDHqHKpFEDpkDtjzatZAg=;
 b=Dw8sBtYU4ktB8YPdqlHbRr3rmHE2RC6noNuJ+80F9xaOwOCD+F7sqUfPhr+ZeDPLBlNtCq+zQCI+nxX06gAIT/Oek40PEX5HEnFSV1iLLF/SnrX6l78Yin42qz4jkcHGfIinK2mSBn9W34/N0GqwO0KJx1IFlWjCcYM4PBghGDJnf8Uo9oxA7dLR8uNXFjYTKPpDUVryE9d2AEWErFfeP3qb39pYY11VuzreKx4x+PqOD6Wtq4DmQJgwA7dNFM2z5C3oW88LjyUsEtUbG1YD/+A9rmeaywjBAwJrtGc78cPYd2ASTT3XEkNbxuZDGb9kWSLyak1jDyLuBPobw7mtJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by BN6PR02MB2820.namprd02.prod.outlook.com (2603:10b6:404:fa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Tue, 29 Mar
 2022 07:13:16 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 07:13:16 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] Added parameter to take screenshot with screendump as
 PNG
Date: Tue, 29 Mar 2022 07:13:08 +0000
Message-Id: <20220329071308.200045-2-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220329071308.200045-1-kshitij.suri@nutanix.com>
References: <20220329071308.200045-1-kshitij.suri@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::8) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b61bfbdb-a918-4208-4cb4-08da11539852
X-MS-TrafficTypeDiagnostic: BN6PR02MB2820:EE_
X-Microsoft-Antispam-PRVS: <BN6PR02MB2820B120F9AC82CCDE56C7C0991E9@BN6PR02MB2820.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nKrDejZjS9x96mamGXMgQKmGTC7KPnyWyiF7KowvWb+OFtamV4JHymL6szCKZX1FHJxO7zjMvLZ/ilC6/mQWnc44guwp9nOOcMiEPnPN/GcB7/JaJA1YB2Lj+46RFE+RugTQ2gnZY5Z0RmVjRcgoK0G2iq/NtLzI8bmSPgkQWSZ1MAJznyXJ+uaSzW/tNZOg8F9OUotiIPM++MSHx1ld08Q3SNXGz/q7UvT5fqxJ+g9qEfyJCAEZAIY1T1XfzCbBlrNoFeY3q32+pfmTGYrY2zJDInZh79MHYoLfClbvOsGbuEyp6+OeunwHQR0WMa4+YDIGQOkgxVBVnb2To/a8eThPPHS1K8+Yp+/dSFVT4hz0+MLtqKgQGv+HLt1MCDS9rPT7EOZZrrOTGpVkRzeRAceZ/DS2qi88s/8FZRrdXPgf+QbAjV9avFUYlfr2NdJ7C6neoWDtz2CiU323NJ+2i33ZIuAbpVNJMvLrIbVbk/F3c2FWGc1wHegbJH7zHotmSU3pvDjnG0qWdlog08bY9yRzk8tUmdHsj+CqLyzF7vPsAyxvyXHdxODOii58rH70WzNa1WHgWoSK7AobqtOc6DvE50jAZtP0VtWc8n+mLUk6ao/E4vlhV77AfVCcWO+KFdmuPpqxfo4FpCLT+p5UbRU88O5M7CSFygmxNUZItiwyhBKN4MPHRL0ZZitGotmwZKnhk3WuSdZFxBqnDJf4gnmC7hRiaXkBh/YoA9xQvL72Gx73ZAB3FvzL0MIGwDXy/yXzOFjK4c/jb2IBIUIWMEQI2Ph0eDmzPJfgp+oGrZQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(5660300002)(38100700002)(6916009)(1076003)(44832011)(38350700002)(8936002)(86362001)(2616005)(66574015)(186003)(107886003)(26005)(966005)(316002)(6486002)(6506007)(6512007)(52116002)(8676002)(4326008)(66946007)(66556008)(6666004)(508600001)(66476007)(36756003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEpxZ1hKb1BRbGwyb3VrVTA3NjlCUHFiK2w2ekRSRUx0YUNVMEZwWDIyTVhQ?=
 =?utf-8?B?eDlWaFNFVDlyQUlQdlhRT1MzMUVzZHFkNllJUmI2MERocVVmZzVwWW5KUk03?=
 =?utf-8?B?Nzl3bGg4U2d6MWI1WmdZRWhFb1ErMEd2YVFEZXoxYTZsTlhSRHFJL1JhNVVy?=
 =?utf-8?B?MytBeTlvY0VTSzlCV2dLNmk3NUI3dzlXVHVlREdxSVE2NGtZK3MvMGNLT1Mv?=
 =?utf-8?B?T01lby9sNExWT3dXVEpkcHBIcUFjdVdMMzNlNnFQYk5VLzZlRVRJdW9zNlZU?=
 =?utf-8?B?aS9hZHF6TDQxY0JhbDBURVRGdmc4b0duRXFCTk1zYlQzaDlIWi9OQWJ2UXBa?=
 =?utf-8?B?Mmtrd2IwdDJRMGVnTjJFY1NROWJUa0NtZ2EreVl1UHc1R1Q0dzBReDB5Z0pZ?=
 =?utf-8?B?L08rRTI0aGFpNXVUa3BRYWhWdGRiWDRZM1VRNXFIaGNhb3dvcy9wQWd0am9Y?=
 =?utf-8?B?eGcrYVFzWU9ZR0toL2lkMTl2aU1HOE1kcGhTSzg5aERVUlBpZXFMZmRrN1pN?=
 =?utf-8?B?UWxNMXk1ZnFHTlEvVU1qQ1RyZDFodXp2L2x1WTdiNlNESWF5MTZ4WHlBRU9N?=
 =?utf-8?B?QkVpY2FuTkhlbmdGY1ZzdjkwdWg2R003OWRHcEdsbUlDVk83Q2l4djkyeXdI?=
 =?utf-8?B?T05qM0QrSG8yK2RxeDAzY2h3VG4xZlpFa09lV3ByTlQ4WFdramwwU3hRVEc1?=
 =?utf-8?B?UkxXTVRvLzhjeUtXUlZtWk1KNDRpT1NmZFpxOTQ2OWdEczRjdnJlUkwrTXNv?=
 =?utf-8?B?ZENUcXBKRklNVU5HcVU3eHFEbUhicVhURHd4b1VTRVpUZ3Irdytabk5RRGRH?=
 =?utf-8?B?clNSaHNrVDAyVWVxWTdjWFoxNThzV0FHS3ZJWEI0WW5SZTBEa3ZyTkJjZ015?=
 =?utf-8?B?dUlMQVRXV3gwNmxMcnF1elJsYnVTYU5DNWFaVDVaKzVaRGNPVUZQY2ZoRFpr?=
 =?utf-8?B?bThENUMweDBTRk1CekpIT2x4UGU5bDdnUDI0OTJ2ejVWTTBoSnJRWThLWVMx?=
 =?utf-8?B?NEpXUTladFVHL3hJOWNvdWlyYU9adFlETHJkRDFoT0JFeUluSU5IclU0UHp2?=
 =?utf-8?B?b2hTTkswL0dhWTlOd3BMZm40RnNKeVFTU2k0Ym1FSERUdTY4ZHJqNlpvdSt3?=
 =?utf-8?B?dEY5RkRvU0lML2E2WmN6bnZrRDNIdXBYZEYvRWE1M2FzVXA0SHdFZnhaZmFn?=
 =?utf-8?B?b2xBWlRCdktDWWZkQWdkSVV0NWt4N1BKZGZHQWVQUnRieWVlU05FZUU5Z2Fk?=
 =?utf-8?B?bENBRmtyd3VhUXZJVmhsWlZEZ1M0YUpJYWxQNFFQZWtQVFg3V2FDL1FGOVdK?=
 =?utf-8?B?NHR1ellsblNCeHhvSlZWU3JNcEZPZ3NJdURBUVBUOEw1aHdzcGZ6Yk9FNFJG?=
 =?utf-8?B?OVZuVkZsTXkzVXlGRWxKV0h4NVo0WHN3L20vdzFqbnNLMGdUVkNCbUoyREJW?=
 =?utf-8?B?ZGMzOU5ETUtXRzJmT21iYlRwYlVuOExhQ25UaFVZUVpESjk0SXJlOW9pTFZk?=
 =?utf-8?B?YVp4aXdzSm9GbDRVUXZIWFZnRitaWUx2cWk2ZXNicjVpZmxMc1hzTDk1ZGRz?=
 =?utf-8?B?SEtmRE03cjVDU1RrZEt2SG9mM1J5ODkwYUJ5OUJmYUxlOTRXa0FsQ2FrNFJ6?=
 =?utf-8?B?RGlKM2FJamtaT29QTGFiZUFZT2o3cHJ2U1U4WnY5ZXBxUEE5MCtFRllYdzRn?=
 =?utf-8?B?VXNzSnRMalJKcjkwdnRqd3RHUEVFSkRjMHRiM25kbTZ6K0xtcTBUUFNMdmZ5?=
 =?utf-8?B?eUdsMjlYUmJrZDMrOEUvckdIMzhWRkNBV2FUWkdYcnNaUi9wcEo3M0FiUUdB?=
 =?utf-8?B?dlpmaVFjdzduV2JjWHh3VU9NOXhUT1ArYUM5MWF6ZFdYSitJUmVyUDNVcjdn?=
 =?utf-8?B?WnZ0eEtVSUtRcE0zWFVoMHpUaTlvSEVDQmswL3pidE9qUjg2L1Z4UnNjQzFQ?=
 =?utf-8?B?VVN5QzZJNTZnVXVsNnNHK3ljdE94WENyTm9BSVpXVFREK0NnVFhXN3RrdWtC?=
 =?utf-8?B?SU1XbS8wcjZZUmdIYzVxbmN6ZXRjMUJBMEJvZ2ZSRXdjVkJKWE90aG1qSlJ1?=
 =?utf-8?B?SGRyV1EwbnRaUlpTRWsrU0xmYVRMZjBNdm9wQnRBL2M3WVNOT1ZZQTRTS1Vh?=
 =?utf-8?B?bHFHd2Z5eUJrK2tqNEtmQWM0ZWdZQW1sY3U2eDJreWNFQlRTVFluYi8wbFhx?=
 =?utf-8?B?NjdqcytYN2w4TGpGVTg0RWVGTnIzOHF6ZzEwa001QkExNnp6SnFrdnVDeWs4?=
 =?utf-8?B?YnhDQ3NaVnlzMFJ1SFNELzN5SGhpdURoK3FlRzFVYk1TclRYd2c5K2pmY2Q0?=
 =?utf-8?B?bkI4dUo4VE44RFF6ZENQKy9NNmw2TG9vcjQ3WHBKeXloZ3Z2ZGZKV3FHMkd4?=
 =?utf-8?Q?yDxc3Nr4JMz9XlNw=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b61bfbdb-a918-4208-4cb4-08da11539852
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 07:13:16.2772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zf7ix0iMXUY/OTMRCp/xILm6xeKFLXMQU7p8M04e2EwxSoXaKktDq/YLiU70yRbAec7KC3wENV9uHgsm2BI+6Gi2yO20SCfkg56CwqfyLa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2820
X-Proofpoint-GUID: mXacee8fN739zRBVl8xtsHaWoaXCGBX2
X-Proofpoint-ORIG-GUID: mXacee8fN739zRBVl8xtsHaWoaXCGBX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_02,2022-03-28_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, dgilbert@redhat.com, armbru@redhat.com,
 Kshitij Suri <kshitij.suri@nutanix.com>, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently screendump only supports PPM format, which is un-compressed and not
standard. Added a "format" parameter to qemu monitor screendump capabilites
to support PNG image capture using libpng. The param was added in QAPI schema
of screendump present in ui.json along with png_save() function which converts
pixman_image to PNG. HMP command equivalent was also modified to support the
feature.

Example usage:
{ "execute": "screendump", "arguments": { "filename": "/tmp/image",
"format":"png" } }

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718

Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
diff to v2:
  - HMP fixes for png
  - Used enum for image format
  - Fixed descriptions and updated qemu support versions
 hmp-commands.hx    |  11 ++---
 monitor/hmp-cmds.c |  12 +++++-
 qapi/ui.json       |  24 +++++++++--
 ui/console.c       | 101 +++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 136 insertions(+), 12 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8476277aa9..19b7cab595 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -244,11 +244,12 @@ ERST
 
     {
         .name       = "screendump",
-        .args_type  = "filename:F,device:s?,head:i?",
-        .params     = "filename [device [head]]",
-        .help       = "save screen from head 'head' of display device 'device' "
-                      "into PPM image 'filename'",
-        .cmd        = hmp_screendump,
+        .args_type  = "filename:F,format:s?,device:s?,head:i?",
+        .params     = "filename [format] [device [head]]",
+        .help       = "save screen from head 'head' of display device 'device'"
+                      "in specified format 'format' as image 'filename'."
+                      "Currently only 'png' and 'ppm' formats are supported.",
+         .cmd        = hmp_screendump,
         .coroutine  = true,
     },
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 634968498b..2442bfa989 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1720,9 +1720,19 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
     const char *filename = qdict_get_str(qdict, "filename");
     const char *id = qdict_get_try_str(qdict, "device");
     int64_t head = qdict_get_try_int(qdict, "head", 0);
+    const char *input_format  = qdict_get_try_str(qdict, "format");
     Error *err = NULL;
+    ImageFormat format;
 
-    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
+    format = qapi_enum_parse(&ImageFormat_lookup, input_format,
+                              IMAGE_FORMAT_PPM, &err);
+    if (err) {
+        goto end;
+    }
+
+    qmp_screendump(filename, id != NULL, id, id != NULL, head,
+                   input_format != NULL, format, &err);
+end:
     hmp_handle_error(mon, err);
 }
 
diff --git a/qapi/ui.json b/qapi/ui.json
index 664da9e462..24371fce05 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -157,12 +157,27 @@
 ##
 { 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOptions' }
 
+##
+# @ImageFormat:
+#
+# Supported image format types.
+#
+# @png: PNG format
+#
+# @ppm: PPM format
+#
+# Since: 7.1
+#
+##
+{ 'enum': 'ImageFormat',
+  'data': ['ppm', 'png'] }
+
 ##
 # @screendump:
 #
-# Write a PPM of the VGA screen to a file.
+# Capture the contents of a screen and write it to a file.
 #
-# @filename: the path of a new PPM file to store the image
+# @filename: the path of a new file to store the image
 #
 # @device: ID of the display device that should be dumped. If this parameter
 #          is missing, the primary display will be used. (Since 2.12)
@@ -171,6 +186,8 @@
 #        parameter is missing, head #0 will be used. Also note that the head
 #        can only be specified in conjunction with the device ID. (Since 2.12)
 #
+# @format: image format for screendump is specified. (default: ppm) (Since 7.1)
+#
 # Returns: Nothing on success
 #
 # Since: 0.14
@@ -183,7 +200,8 @@
 #
 ##
 { 'command': 'screendump',
-  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
+  'data': {'filename': 'str', '*device': 'str', '*head': 'int',
+           '*format': 'ImageFormat'},
   'coroutine': true }
 
 ##
diff --git a/ui/console.c b/ui/console.c
index da434ce1b2..f42f64d556 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -37,6 +37,9 @@
 #include "exec/memory.h"
 #include "io/channel-file.h"
 #include "qom/object.h"
+#ifdef CONFIG_PNG
+#include <png.h>
+#endif
 
 #define DEFAULT_BACKSCROLL 512
 #define CONSOLE_CURSOR_PERIOD 500
@@ -291,6 +294,89 @@ void graphic_hw_invalidate(QemuConsole *con)
     }
 }
 
+#ifdef CONFIG_PNG
+/**
+ * png_save: Take a screenshot as PNG
+ *
+ * Saves screendump as a PNG file
+ *
+ * Returns true for success or false for error.
+ *
+ * @fd: File descriptor for PNG file.
+ * @image: Image data in pixman format.
+ * @errp: Pointer to an error.
+ */
+static bool png_save(int fd, pixman_image_t *image, Error **errp)
+{
+    int width = pixman_image_get_width(image);
+    int height = pixman_image_get_height(image);
+    g_autofree png_struct *png_ptr = NULL;
+    g_autofree png_info *info_ptr = NULL;
+    g_autoptr(pixman_image_t) linebuf =
+                            qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, width);
+    uint8_t *buf = (uint8_t *)pixman_image_get_data(linebuf);
+    FILE *f = fdopen(fd, "wb");
+    int y;
+    if (!f) {
+        error_setg_errno(errp, errno,
+                         "Failed to create file from file descriptor");
+        return false;
+    }
+
+    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
+                                      NULL, NULL);
+    if (!png_ptr) {
+        error_setg(errp, "PNG creation failed. Unable to write struct");
+        fclose(f);
+        return false;
+    }
+
+    info_ptr = png_create_info_struct(png_ptr);
+
+    if (!info_ptr) {
+        error_setg(errp, "PNG creation failed. Unable to write info");
+        fclose(f);
+        png_destroy_write_struct(&png_ptr, &info_ptr);
+        return false;
+    }
+
+    png_init_io(png_ptr, f);
+
+    png_set_IHDR(png_ptr, info_ptr, width, height, 8,
+                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
+                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
+
+    png_write_info(png_ptr, info_ptr);
+
+    for (y = 0; y < height; ++y) {
+        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
+        png_write_row(png_ptr, buf);
+    }
+    qemu_pixman_image_unref(linebuf);
+
+    png_write_end(png_ptr, NULL);
+
+    png_destroy_write_struct(&png_ptr, &info_ptr);
+
+    if (fclose(f) != 0) {
+        error_setg_errno(errp, errno,
+                         "PNG creation failed. Unable to close file");
+        return false;
+    }
+
+    return true;
+}
+
+#else /* no png support */
+
+static bool png_save(int fd, pixman_image_t *image, Error **errp)
+{
+    error_setg(errp, "Enable PNG support with libpng for screendump");
+    return false;
+}
+
+#endif /* CONFIG_PNG */
+
 static bool ppm_save(int fd, pixman_image_t *image, Error **errp)
 {
     int width = pixman_image_get_width(image);
@@ -329,7 +415,8 @@ static void graphic_hw_update_bh(void *con)
 /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
 void coroutine_fn
 qmp_screendump(const char *filename, bool has_device, const char *device,
-               bool has_head, int64_t head, Error **errp)
+               bool has_head, int64_t head,
+               bool has_format, ImageFormat format, Error **errp)
 {
     g_autoptr(pixman_image_t) image = NULL;
     QemuConsole *con;
@@ -385,8 +472,16 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
      * yields and releases the BQL. It could produce corrupted dump, but
      * it should be otherwise safe.
      */
-    if (!ppm_save(fd, image, errp)) {
-        qemu_unlink(filename);
+    if (has_format && format == IMAGE_FORMAT_PNG) {
+        /* PNG format specified for screendump */
+        if (!png_save(fd, image, errp)) {
+            qemu_unlink(filename);
+        }
+    } else {
+        /* PPM format specified/default for screendump */
+        if (!ppm_save(fd, image, errp)) {
+            qemu_unlink(filename);
+        }
     }
 }
 
-- 
2.22.3


