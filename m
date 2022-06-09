Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BA8544E57
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:04:26 +0200 (CEST)
Received: from localhost ([::1]:50826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIls-0002cw-Gu
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1nzCfU-00029E-8f
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:33:24 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:57086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1nzCfQ-0007u8-Dh
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:33:23 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25964PeN022399;
 Thu, 9 Jun 2022 00:33:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=dKLyhRXmd9foly6WSGrPHdyLCHn1LmBo+8gCkrBjBSk=;
 b=e7Jm1FrY+3YKHgIxs3PdT1iswbrn6lCBpblOYW8KPsu0CWguSkTeotx1gsbV2WIl/QpT
 /b0CiYlr9vsmLqR1JDigix20776Ben3MUuGFP0KhRUy7kF78fkS1O1P3XqKknf11+630
 F0yfHtJcAp/ggtDa2CaUbOMv+ex/1RaXJ+dcH2SPfnisPryW/CeXhETb9j0cmBo7JvOl
 pLbBn+SCDbWn30+NbIjIdgnewD4c2eBowIFBPM8y9W4VZ/sCNUAn0Z3E5MfOw+4/hf7U
 w4+9xzSKAYsnyPhy0h9hSsTYrrprBPidsPZksajAA26Wb1+GPwqZ4+mGsA01iultFFxS Hw== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3gg6y0a3qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 00:33:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpAzvoKJMyU9L2E4V3oek0/atjdH48dND6r72hof31MicsIQlnfy8nL34jr/PtJmlijuF5sZO3pIn/Zwb5tJiek4ozivD2o6ePnddjvpVpNRlqEKmpdbRpkTFc1F6O83CwBPwZ4+uumF7IB80mTpCsb7xU+urWJHjIvL4GiypitU0PXb2TORuoFMEIlpQvGMSQhoKwRaMPyNwoc9Mhw6WMzLkFt0yBbITmyPnR9jrqDrf1qlGZ8w0HGYdRaPaDmzc1thykUaJZai/Sq8Ak1rig/i2DR3fMIEPnaYkZ3tHqW8+vkAf4FUQE5kbShYFm6SYKn+8zFr71mMSIAgjFbLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKLyhRXmd9foly6WSGrPHdyLCHn1LmBo+8gCkrBjBSk=;
 b=RMfq9sErGaeg45b4+mps7aHp4T8tg9JJ2ilOAHOrpswzDFTmbsAwfE7p/bDPjwCaVaPLIIpuQkrb2IFbI0hKsDkg8F/hC1RQVaIO+TwB4tSWlDU3jps6ISYMBuOOgS31fQeEVJF8jroG2EKFFZa/NKICVMXYqoMIMporvSDsm0bkZRBDHWGy+hcOQ0PGl1wb1TRgeF+jlh9VPbwuJJVe0pvHEWG6yS5zgwpUseaxq6aFmd6KYYMDbeElYSLcS05/04K7GO3AYUHavaWVYWW1Zr7F4GZZ2CR56BHE6+KcjLHQCxfsllmtrZEN31ado2TF44ESDg6Vh2UFD4gnBgSbSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SA1PR02MB8639.namprd02.prod.outlook.com (2603:10b6:806:1fe::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 07:33:13 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 07:33:13 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 Het Gala <het.gala@nutanix.com>, Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH 1/4] =?UTF-8?q?Modifying=20=E2=80=98migrate=E2=80=99=20qmp?=
 =?UTF-8?q?=20command=20to=20add=20multi-FD=20socket=20on=20particular=20s?=
 =?UTF-8?q?ource=20and=20destination=20pair?=
Date: Thu,  9 Jun 2022 07:33:02 +0000
Message-Id: <20220609073305.142515-2-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220609073305.142515-1-het.gala@nutanix.com>
References: <20220609073305.142515-1-het.gala@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::12) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14b39540-bfb1-40e9-d0ac-08da49ea4f51
X-MS-TrafficTypeDiagnostic: SA1PR02MB8639:EE_
X-Microsoft-Antispam-PRVS: <SA1PR02MB8639B2C811F3AA2C7AEFA5FF98A79@SA1PR02MB8639.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1oB9NpCUv8bKZ7kBcYlM/X7KKcgltBK617ZKBTbQB8ElLfJMREzwrr3yA6f+r24koWoEHLEbmTh8IR1t6zdqofJEJfRIvJo+D5kWPhlEbItlvqkxVf+DjP8jQthQrQV2HdmhcgsNYc+FTG50hrNZTi2LuCAY41viutgq/8Otn/FteAfCJVV88U7YPpWO2buVsxy3zOBepylYP68O49Cubzm5+gQgmSLTgqFBi+6g4rip4TnwuCHMFfIrFvwr67vLJjfPXXAkTlXa1Y+aT7GVc1ik4olH+jmG7zafxkiWQh0oIlv6zm2wqLL0YKZdk2c4Gii/QoWddo3fYkzEe/DM6Lh49Or4bTA+pPqMFWeBwO42FoWIAtuOt4KYBBi2Pf5qW19LRcnBgc/CKWgdJhllMfsR85uMyJOV5e7hXKrFbrRtUhyOucqgjOEm7HXk0RZL/jaN9WxzkaHkbHkCcojIYhxemILHqYB5I3SElREW+CNb0vPzaJSIw37+20IkXU94d1EWyRYG/T0IM2eUgk5b3f27Oy4yOe+WPCk24AHomK1QNHQq/OFQh8aZwbp6VLUvf9NJFbZXxOSHXn+YDw+LXzos7l+fTBLnMMsmA1s39ZLbjzzV4fCZ7e/XAgEm1qhtVDUUvpXbYfh1+azJT7XLcNKjdgTUAIhOY/ZUv1hWLVGbxW+IVWn4Jeh2pFhqKz+mrdP83LU4LJ0gQtPxDs/hWxg5Q3Sv8W8/igIPjt7husc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(107886003)(6666004)(1076003)(2906002)(8936002)(52116002)(54906003)(86362001)(6506007)(186003)(5660300002)(30864003)(83380400001)(6486002)(44832011)(38350700002)(26005)(38100700002)(36756003)(6512007)(2616005)(316002)(66556008)(66946007)(4326008)(6916009)(66476007)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U244U1FUYjI3QWdHMFZjRkpKNUxOOVBXUkpzZTZEQjU4REllYWpmdURWdW5U?=
 =?utf-8?B?RHRNZkhJczBnaU96ZzJQL0hEVDdaVEJaeEpqV2g3d3Y4NG5Oc295R3lraVpv?=
 =?utf-8?B?dEhjeHp6cjI3UWFqNmkvaXduOWU3YjF6L0diYWNvcXpvY1NzWTEwS1Y4S3M4?=
 =?utf-8?B?RFBkNmQ0NFllYWh5RUR6ZEZoSmNFMFJsVUNnd2VXd3d5Nzd6R3lQNFpueko4?=
 =?utf-8?B?WDdUZDdZSlorcFZDT005M2JMV2xBbExJM0lsZTFOTkJ3YUl5dTdiZlJYMEsr?=
 =?utf-8?B?UFo0d3hoVXkwOXZiNjNlRDFvcTYvTzdhTExZUEtzUmtGNUFhT045R1pOc2Vt?=
 =?utf-8?B?SnB2QlFNTW16b2ZnOHN3YXEzY0RkMEVVN2xHV0VldGJ3M2R3UHFUd3h6ekxO?=
 =?utf-8?B?QVEvSVdydmdyUDhIdDl1NUpsWEF6anBGVHEzc0hqUUdEbXRDTnBxWHc4WUF0?=
 =?utf-8?B?WWRGN2lUbnJqdHp2ZVIzdWlSTWZkaFlBUE5ONFN2eDRWK3BEZElKL1NqUnZR?=
 =?utf-8?B?bjA0OHE5NmJvTDQ2UGxwOUV6akRHb3hEYkdyeW5LZFNjaWs1VkVGRjBTWktx?=
 =?utf-8?B?MUV1TFpvemRKVStzNURWZEpHQkxzVmRSTm9qWXR3ckJVRkZKL1pjZ2QrL0ht?=
 =?utf-8?B?RkpmU2dtOCtNMGdVSU9XbzRIRlA0S2t2OGZjbEcxLzVCaUZqNlhOcGxldUhr?=
 =?utf-8?B?eENKUU5BcUk0empCK3poVVFqdU1CbzU3M1UwVzJ5VU1HYjFhNHQ1OExDeHJS?=
 =?utf-8?B?MWJ4RzlGOHVHb004QVFPeDYxWjdxaFVlemZQa21lWk1kNnRQUU4xZHRjakxv?=
 =?utf-8?B?MjNFbGhWSkQyREhRMG1IT3RlV0F5UU10RW5lc3BSd2QraDdZZEUrTDI4QnVC?=
 =?utf-8?B?YXVyN1RteXVYZXRMb2lwMVR6MTBDK1ZCZUxaWklPQmZ3NFoyMW9hREJQM2JU?=
 =?utf-8?B?YkpmZGFQOGdpN0xKcm9xUXR0bDhhUGVVdVMvQjNkRG1BZG4rMnNYT3NUU3lO?=
 =?utf-8?B?WnVyaXFpNll4RFVRTDBWL09QdmptZmx1M2JWWURqUndzUUhXd21FMlNaYmV4?=
 =?utf-8?B?N1pUQ204ZjJSM2RQWm4xSjkrNDZtZE9PMGx2YnE1WnAwMlhWaTNCN091ZWdD?=
 =?utf-8?B?NTJ1VmgyRG8vMWJyWkt2Sk14WjJFYnIrQ0Z6dWFRVGdpM3BpMklUMUFWd3VI?=
 =?utf-8?B?bklsRi8xT1V5OU5TV1dpYVRYNTkrTW44NC9ISGNvSjYwcjJJQUl4KzJBVUdD?=
 =?utf-8?B?MWRmTWxKOFZWcFJHcFJJbzJnMnZvT3NxNmhXN24vMFhmK3BWUTZYYkdHbDNL?=
 =?utf-8?B?TThzOXArMWJhWWU4OEZiK1c1OG1BeHJNcWNRSzVPN0YxVlUrcGhJVm9UaXY3?=
 =?utf-8?B?SWJ6eEdFU2JtMkVFZ2U1a0ZiZndNTVBsS2VMWThuL1R4cUNDUmFCRlR2SGNl?=
 =?utf-8?B?REdGRmdHQXRZd3JQaXNXSjNoUktYQUYzN3VHZTMzQXkyT3J4dGRCMW1KaHFv?=
 =?utf-8?B?OVo3WVhQZFpmQmtiMDB5MlVnY1RXZUJLNEsvcXhBV3VNbHVEUUY1QmNwZVN5?=
 =?utf-8?B?d09Xd3A0TVhPZXVMRm85VVdWcmdjUjF1Mm4rN09BcS9Tem4wOHQwc0R2YUJs?=
 =?utf-8?B?dFdmM09IZExTMGJFYUppWlhhNjFuZEJ1ajkyQ2tiRi9kL3RyaElVbkN4N2Vv?=
 =?utf-8?B?VWtObEh4TnhYZWF0bWNuTzhMMG1qR2dkbkd6dTBqYVJqRHR0V1VBZnhjUmZn?=
 =?utf-8?B?K1dPT0M0YUdGSjJnb3RsNXlCRTBmd2w3d0dBMlZyNHROY0piZG9FZEpCTFVr?=
 =?utf-8?B?OXRxNjVtSnZZU0k3VTVSMExpZmQxVlI2QjBJT2dPanJWYVlHb2d1My8xQkQ0?=
 =?utf-8?B?UEMzN21PRUZFTERQeGFJMlIxU2xIcWRYdXErVzFwT01sNU5HM3Y3Mk1CZ01T?=
 =?utf-8?B?Q1FpeWZsSkNhVEtEd2MrVTA5SkNpRzMvN3ZJSnZHWUVuZE4wbExRc3Fvc1FS?=
 =?utf-8?B?UlowY3BGeVJCMGZrTGgzWFpYbER5VjFISnFwTDA3V2JyOTVYZG9USDUydXZU?=
 =?utf-8?B?V0NsWUZyTDVWUFJ3TGNIblRPdGNkY1J3Z0V3aHA1ejZwWUFPeStua0JwY1hZ?=
 =?utf-8?B?YWZGYkJVcmhCSFdQMHJRd1dBNkhPTml5bjlsTTlscHJtUExSM2VwVDdneGVJ?=
 =?utf-8?B?U1A1YkJ6ZGZpbnFkRFZWNmwxWmFCU0QwUGxFWnA5eW1xWGl2VXI4TTBneW10?=
 =?utf-8?B?K3Vha0ZTZlhsU1FhVGREdHpjN1Nwc1lQS2lUUmQzWVVHREhtRDk3TnZFTkh3?=
 =?utf-8?B?eWd2eGhpbG1oOXpXbVVPYmg3bFRLNjZLUE91U2RXVnk3d3QwM3E0RDdHTlcw?=
 =?utf-8?Q?oQt1So5iIeYeGGBg=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b39540-bfb1-40e9-d0ac-08da49ea4f51
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 07:33:12.9220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOPxecwBrJCK5kZ2MbEfX7BqdiA6zye37UZiXSM57p02eYESIvy7pKzKyzGXXXGBOtDZweVNz7yllF4v9wPn9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8639
X-Proofpoint-GUID: EuC86nl0_eFHzIdfIumiQdCm512sIRog
X-Proofpoint-ORIG-GUID: EuC86nl0_eFHzIdfIumiQdCm512sIRog
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_07,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 09 Jun 2022 09:30:26 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

i) Modified the format of the qemu monitor command : 'migrate' by adding a list,
   each element in the list consists of multi-FD connection parameters: source
   and destination uris and of the number of multi-fd channels between each pair.

ii) Information of all multi-FD connection parameters’ list, length of the list
    and total number of multi-fd channels for all the connections together is
    stored in ‘OutgoingArgs’ struct.

Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 include/qapi/util.h   |  9 ++++++++
 migration/migration.c | 47 ++++++++++++++++++++++++++++++--------
 migration/socket.c    | 53 ++++++++++++++++++++++++++++++++++++++++---
 migration/socket.h    | 17 +++++++++++++-
 monitor/hmp-cmds.c    | 22 ++++++++++++++++--
 qapi/migration.json   | 43 +++++++++++++++++++++++++++++++----
 6 files changed, 170 insertions(+), 21 deletions(-)

diff --git a/include/qapi/util.h b/include/qapi/util.h
index 81a2b13a33..3041feb3d9 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -56,4 +56,13 @@ int parse_qapi_name(const char *name, bool complete);
     (tail) = &(*(tail))->next; \
 } while (0)
 
+#define QAPI_LIST_LENGTH(list) ({ \
+    int _len = 0; \
+    typeof(list) _elem; \
+    for (_elem = list; _elem != NULL; _elem = _elem->next) { \
+        _len++; \
+    } \
+    _len; \
+})
+
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index 31739b2af9..c408175aeb 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2328,13 +2328,14 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
     return true;
 }
 
-void qmp_migrate(const char *uri, bool has_blk, bool blk,
+void qmp_migrate(const char *uri, bool has_multi_fd_uri_list,
+                 MigrateUriParameterList *cap, bool has_blk, bool blk,
                  bool has_inc, bool inc, bool has_detach, bool detach,
                  bool has_resume, bool resume, Error **errp)
 {
     Error *local_err = NULL;
     MigrationState *s = migrate_get_current();
-    const char *p = NULL;
+    const char *dst_ptr = NULL;
 
     if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
                          has_resume && resume, errp)) {
@@ -2348,20 +2349,46 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         }
     }
 
+    /*
+     * In case of Multi-FD migration parameters, if uri is provided,
+     * supports only tcp network protocol.
+     */
+    if (has_multi_fd_uri_list) {
+        int length = QAPI_LIST_LENGTH(cap);
+        init_multifd_array(length);
+        for (int i = 0; i < length; i++) {
+            const char *p1 = NULL, *p2 = NULL;
+            const char *multifd_dst_uri = cap->value->destination_uri;
+            const char *multifd_src_uri = cap->value->source_uri;
+            uint8_t multifd_channels = cap->value->multifd_channels;
+            if (!strstart(multifd_dst_uri, "tcp:", &p1) ||
+                !strstart(multifd_src_uri, "tcp:", &p2)) {
+                error_setg(errp, "multi-fd destination and multi-fd source "
+                "uri, both should be present and follows tcp protocol only");
+                break;
+            } else {
+                store_multifd_migration_params(p1 ? p1 : multifd_dst_uri,
+                                            p2 ? p2 : multifd_src_uri,
+                                            multifd_channels, i, &local_err);
+            }
+            cap = cap->next;
+        }
+    }
+
     migrate_protocol_allow_multi_channels(false);
-    if (strstart(uri, "tcp:", &p) ||
+    if (strstart(uri, "tcp:", &dst_ptr) ||
         strstart(uri, "unix:", NULL) ||
         strstart(uri, "vsock:", NULL)) {
         migrate_protocol_allow_multi_channels(true);
-        socket_start_outgoing_migration(s, p ? p : uri, &local_err);
+        socket_start_outgoing_migration(s, dst_ptr ? dst_ptr : uri, &local_err);
 #ifdef CONFIG_RDMA
-    } else if (strstart(uri, "rdma:", &p)) {
-        rdma_start_outgoing_migration(s, p, &local_err);
+    } else if (strstart(uri, "rdma:", &dst_ptr)) {
+        rdma_start_outgoing_migration(s, dst_ptr, &local_err);
 #endif
-    } else if (strstart(uri, "exec:", &p)) {
-        exec_start_outgoing_migration(s, p, &local_err);
-    } else if (strstart(uri, "fd:", &p)) {
-        fd_start_outgoing_migration(s, p, &local_err);
+    } else if (strstart(uri, "exec:", &dst_ptr)) {
+        exec_start_outgoing_migration(s, dst_ptr, &local_err);
+    } else if (strstart(uri, "fd:", &dst_ptr)) {
+        fd_start_outgoing_migration(s, dst_ptr, &local_err);
     } else {
         if (!(has_resume && resume)) {
             yank_unregister_instance(MIGRATION_YANK_INSTANCE);
diff --git a/migration/socket.c b/migration/socket.c
index 4fd5e85f50..7ca6af8cca 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -32,6 +32,17 @@ struct SocketOutgoingArgs {
     SocketAddress *saddr;
 } outgoing_args;
 
+struct SocketArgs {
+    struct SrcDestAddr data;
+    uint8_t multifd_channels;
+};
+
+struct OutgoingMigrateParams {
+    struct SocketArgs *socket_args;
+    size_t length;
+    uint64_t total_multifd_channel;
+} outgoing_migrate_params;
+
 void socket_send_channel_create(QIOTaskFunc f, void *data)
 {
     QIOChannelSocket *sioc = qio_channel_socket_new();
@@ -47,6 +58,14 @@ int socket_send_channel_destroy(QIOChannel *send)
         qapi_free_SocketAddress(outgoing_args.saddr);
         outgoing_args.saddr = NULL;
     }
+
+    if (outgoing_migrate_params.socket_args != NULL) {
+        g_free(outgoing_migrate_params.socket_args);
+        outgoing_migrate_params.socket_args = NULL;
+    }
+    if (outgoing_migrate_params.length) {
+        outgoing_migrate_params.length = 0;
+    }
     return 0;
 }
 
@@ -117,13 +136,41 @@ socket_start_outgoing_migration_internal(MigrationState *s,
 }
 
 void socket_start_outgoing_migration(MigrationState *s,
-                                     const char *str,
+                                     const char *dst_str,
                                      Error **errp)
 {
     Error *err = NULL;
-    SocketAddress *saddr = socket_parse(str, &err);
+    SocketAddress *dst_saddr = socket_parse(dst_str, &err);
+    if (!err) {
+        socket_start_outgoing_migration_internal(s, dst_saddr, &err);
+    }
+    error_propagate(errp, err);
+}
+
+void init_multifd_array(int length)
+{
+    outgoing_migrate_params.socket_args = g_new0(struct SocketArgs, length);
+    outgoing_migrate_params.length = length;
+    outgoing_migrate_params.total_multifd_channel = 0;
+}
+
+void store_multifd_migration_params(const char *dst_uri,
+                                    const char *src_uri,
+                                    uint8_t multifd_channels,
+                                    int idx, Error **errp)
+{
+    Error *err = NULL;
+    SocketAddress *src_addr = NULL;
+    SocketAddress *dst_addr = socket_parse(dst_uri, &err);
+    if (src_uri) {
+        src_addr = socket_parse(src_uri, &err);
+    }
     if (!err) {
-        socket_start_outgoing_migration_internal(s, saddr, &err);
+        outgoing_migrate_params.socket_args[idx].data.dst_addr = dst_addr;
+        outgoing_migrate_params.socket_args[idx].data.src_addr = src_addr;
+        outgoing_migrate_params.socket_args[idx].multifd_channels
+                                                         = multifd_channels;
+        outgoing_migrate_params.total_multifd_channel += multifd_channels;
     }
     error_propagate(errp, err);
 }
diff --git a/migration/socket.h b/migration/socket.h
index 891dbccceb..bba7f177fe 100644
--- a/migration/socket.h
+++ b/migration/socket.h
@@ -19,12 +19,27 @@
 
 #include "io/channel.h"
 #include "io/task.h"
+#include "migration.h"
+
+/* info regarding destination and source uri */
+struct SrcDestAddr {
+    SocketAddress *dst_addr;
+    SocketAddress *src_addr;
+};
 
 void socket_send_channel_create(QIOTaskFunc f, void *data);
 int socket_send_channel_destroy(QIOChannel *send);
 
 void socket_start_incoming_migration(const char *str, Error **errp);
 
-void socket_start_outgoing_migration(MigrationState *s, const char *str,
+void socket_start_outgoing_migration(MigrationState *s, const char *dst_str,
                                      Error **errp);
+
+int multifd_list_length(MigrateUriParameterList *list);
+
+void init_multifd_array(int length);
+
+void store_multifd_migration_params(const char *dst_uri, const char *src_uri,
+                                    uint8_t multifd_channels, int idx,
+                                    Error **erp);
 #endif
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 622c783c32..2db539016a 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -56,6 +56,9 @@
 #include "migration/snapshot.h"
 #include "migration/misc.h"
 
+/* Default number of multi-fd channels */
+#define DEFAULT_MIGRATE_MULTIFD_CHANNELS 2
+
 #ifdef CONFIG_SPICE
 #include <spice/enums.h>
 #endif
@@ -1574,10 +1577,25 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
     bool inc = qdict_get_try_bool(qdict, "inc", false);
     bool resume = qdict_get_try_bool(qdict, "resume", false);
     const char *uri = qdict_get_str(qdict, "uri");
+
+    const char *src_uri = qdict_get_str(qdict, "source-uri");
+    const char *dst_uri = qdict_get_str(qdict, "destination-uri");
+    uint8_t multifd_channels = qdict_get_try_int(qdict, "multifd-channels",
+                                        DEFAULT_MIGRATE_MULTIFD_CHANNELS);
     Error *err = NULL;
+    MigrateUriParameterList *caps = NULL;
+    MigrateUriParameter *value;
+
+    value = g_malloc0(sizeof(*value));
+    value->source_uri = (char *)src_uri;
+    value->destination_uri = (char *)dst_uri;
+    value->multifd_channels = multifd_channels;
+    QAPI_LIST_PREPEND(caps, value);
+
+    qmp_migrate(uri, !!caps, caps, !!blk, blk, !!inc,
+                inc, false, false, true, resume, &err);
+    qapi_free_MigrateUriParameterList(caps);
 
-    qmp_migrate(uri, !!blk, blk, !!inc, inc,
-                false, false, true, resume, &err);
     if (hmp_handle_error(mon, err)) {
         return;
     }
diff --git a/qapi/migration.json b/qapi/migration.json
index 6130cd9fae..fb259d626b 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1454,12 +1454,38 @@
 ##
 { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
 
+##
+# @MigrateUriParameter:
+#
+# Information regarding which source interface is connected to which
+# destination interface and number of multifd channels over each interface.
+#
+# @source-uri: the Uniform Resource Identifier of the source VM.
+#              Default port number is 0.
+#
+# @destination-uri: the Uniform Resource Identifier of the destination VM
+#
+# @multifd-channels: number of parallel multifd channels used to migrate data
+#                    for specific source-uri and destination-uri. Default value
+#                    in this case is 2 (Since 4.0)
+#
+##
+{ 'struct' : 'MigrateUriParameter',
+  'data' : { 'source-uri' : 'str',
+             'destination-uri' : 'str',
+             '*multifd-channels' : 'uint8'} }
+
 ##
 # @migrate:
 #
 # Migrates the current running guest to another Virtual Machine.
 #
 # @uri: the Uniform Resource Identifier of the destination VM
+#       for migration thread
+#
+# @multi-fd-uri-list: list of pair of source and destination VM Uniform
+#                     Resource Identifiers with number of multifd-channels
+#                     for each pair
 #
 # @blk: do block migration (full disk copy)
 #
@@ -1479,20 +1505,27 @@
 # 1. The 'query-migrate' command should be used to check migration's progress
 #    and final result (this information is provided by the 'status' member)
 #
-# 2. All boolean arguments default to false
+# 2. The uri argument should have the Uniform Resource Identifier of default
+#    destination VM. This connection will be bound to default network
+#
+# 3. All boolean arguments default to false
 #
-# 3. The user Monitor's "detach" argument is invalid in QMP and should not
+# 4. The user Monitor's "detach" argument is invalid in QMP and should not
 #    be used
 #
 # Example:
 #
-# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
+# -> { "execute": "migrate",
+#                 "arguments": { "uri": "tcp:0:4446", "multi-fd-uri-list": [ {
+#                                "source-uri": "tcp::6900", "destination-uri": "tcp:0:4480",
+#                                "multifd-channels": 4}, { "source-uri": "tcp:10.0.0.0: ",
+#                                "destination-uri": "tcp:11.0.0.0:7789", "multifd-channels": 5} ] } }
 # <- { "return": {} }
 #
 ##
 { 'command': 'migrate',
-  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
-           '*detach': 'bool', '*resume': 'bool' } }
+  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'], '*blk': 'bool',
+           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
 
 ##
 # @migrate-incoming:
-- 
2.22.3


