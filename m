Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9936636702
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 18:29:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxtXQ-0001qv-Kg; Wed, 23 Nov 2022 12:27:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxtXO-0001q8-PJ
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 12:27:54 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxtXM-0000Gd-CE
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 12:27:54 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANBoKLf001436; Wed, 23 Nov 2022 09:27:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=WzrtjcHjxPVGWcXaLskbbDieIYTI6risJbOlUJAUK/A=;
 b=AiRyuPAM6pReILgEl6ZUxofJ8NQrmjY+bphaVtxr20yVIMgdwL78XTNG2Epm11R+OvDR
 /+xvgUBunm1Bm+OARUEUBeWifRp4fG6FwU6JytazcZ/2sx2cN/OKTzVIdDTaoJo82s6t
 aWguhoFSn8ChvbxyqiOaN2A3xn6FrQQPnzLahdNxOv9YGCI3hGbKUsMGpH58pzuzvL+g
 p9oeyrwdwW7Qh7Du7kDxfJxZKeScmTsvImfvY8qIyDTAvOr8ap/iXW830sV+Bj0C0u+z
 eQ2XI1GNv0KXf02R08QydSkpruJitz2DHpjturyh4auiG1t2eWGjjlVmG8A/zW2ggn4I Lg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxy3mtqp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 09:27:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLeT6n1aHfVOPcL29y6bSGEMg3M/MMJpgKdX/da+tRwwcTKrV430spXg03x2Lsnf/0OjmaNbEjXcUVpsg1fGL0eEys8Y8i/jbtGyvJ6qHkrVB1BvA39uZ6o737ob8+U0GfxPRawXGV9XKYUa6mYOplTdKfQ7vMJSMSIr/TBwF+EpxdQMhp09Z8ydmtyqyOX/QA2AyFzUJzMmbf5vKcI6gX7xOeiJygZ7wm8VEcIAEiZyEJpk9yDu4LAvdI3xAdADIUO4OtFwO53WhIJK8K/pac3bvCmTMx6dSkEc6Q3RWaNHQB7HrbeYRvu7yVZzifmYuCDR2OabvnTuK2msEOSYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzrtjcHjxPVGWcXaLskbbDieIYTI6risJbOlUJAUK/A=;
 b=MVrml7IpsftBNQ+wZRf3QVeUTc5EJfwT1owpz1AP6A9JxTKreHVfAojqjrsF6GR1tEBwaKgxemMohv432yZb5YPXUyDPsi8w0G+Uvc9G+lIzWXrQL8/4V/r9fqRIM4pItyDjjDtU8hJTWLNVvVDhBuP4mkqjbaQfgqDumJ9dfW6yADlH4RwG88phM153Zd78/juujVI50UolSkQw0VARGTNXssjoJewHUr2b0OIRr17gxsbopFQt8N3r7oMHlqe7VhNk+4Zs/aKF8eUv6c5eDXyg02KJMM1pketFxOm7wd+HmsGZSLAZdkyRMQhdHvb9sqVSJ8zG/psoeHGMiy9y7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzrtjcHjxPVGWcXaLskbbDieIYTI6risJbOlUJAUK/A=;
 b=thwVOrE1FluK60X0HqQsAhTO7DuCtFVXKXQozap5ywRKC1iOzxmgLQwdVS7UfVWQEfJ+19fUB7OqZ21/Ed50QvQ/6wWMz6uCZKjIRA7nMtA1+mkiGYznhz4P6mazMbyGr69J+CgQIjczA6+0Lzc0La/iH7H6SwQgGVJGJvixg74m3i1jodeMVs+nkDUwMt97umHhyC6rYlvOiK8blWS/widnBo0p8V3XEmpOao6S2CckSE+42JKy+PG1IeE2ieUGBtV120qijFR1SRVIZZFmnwb9wypZkfKICkCFUM53Sz54sbEgHqhqt5qShCNLZ07BH5ZnZ30u9g24Fo6vI0c/zg==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by SJ0PR02MB7375.namprd02.prod.outlook.com (2603:10b6:a03:2a1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 17:27:48 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5857.017; Wed, 23 Nov 2022
 17:27:48 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com,
 "manish.mishra" <manish.mishra@nutanix.com>
Subject: [PATCH v5 2/2] migration: check magic value for deciding the mapping
 of channels
Date: Wed, 23 Nov 2022 17:27:35 +0000
Message-Id: <20221123172735.25181-3-manish.mishra@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20221123172735.25181-1-manish.mishra@nutanix.com>
References: <20221123172735.25181-1-manish.mishra@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:254::11) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|SJ0PR02MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca621f0-77d6-40c7-3950-08dacd780a48
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yntO5tgMExAi/3V/PlKEolQ1oTn3GsnyiPdoTfT4RlENsaSZmlNsA7CvEF1ZVCMMsbRhRXac5rt0M7WLhJVSfyVp4Qwmg8wWy0PqKLX6YwAsTaHMGjI7SDHBei1uhsbFMfuTeD4qE7xQstW+Itja6zrw17h8uhdMbGDucEZuHG2cDAJ5y0AO6JPxu3nhsziEuBpgkvWr23qgHW+08VQiC1cQlpcgrRNkJWua/jffcyPg85FRCtimD+PXi9EvV4tIFi+YzVCvAj9YWdj9eM/PRLlO3hdOkeg3obqj3UjVo4Y41kMAakMHxygd5SAUN03zAz6ArI2sTML3MxaVMWseaxYNao0oKofY0JHeRkgFIHDrsGHsbmrQi+lpSQ8yRR0IHiR5s0iEQCLgdvMew218YhO9rV3EHP126NkPWDQLzuRNBkahla1JdJzEJvVC/j3i6pmrrGMiVMvioua+r7SacW8JKDYZfqlWqEmjK3YeMA4HCBAsIBDN+uu5SLA2lZiNp+xD6Vq9+MGnM2wbuMXYDaXRlInHmHR8N5QU6LtJFZ5CqCDOtoBu6oqV61fwWNMIJbXv2W/zXUcLXPmAUeAW6paYBbK+fx8vsvu7L7zKI+mM1tR+A0Xz8Hxg3QGeej18i4yPsmVmVI7QrOzvemaj84WZrnzGKUOT567a1PWn3YM7t/NTV00y9Va2nrMboci/Mv/Td6D+6RtdaZ3PmrIHzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199015)(26005)(83380400001)(6512007)(2616005)(1076003)(38350700002)(38100700002)(186003)(2906002)(5660300002)(8936002)(478600001)(52116002)(6486002)(107886003)(6666004)(6506007)(4326008)(66476007)(8676002)(66946007)(66556008)(41300700001)(316002)(6916009)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmxPeE5UdFFmQUNSZTlXVzBmVGRBVHFBSkljZWtaRWU3bXQ4WGpiZUtuT1Rq?=
 =?utf-8?B?S3F0VG9zemlQZUMvMFl5dnpIMzhETWxnSEZqbERHVlNUNTJURjkwajFwdHFS?=
 =?utf-8?B?cXI4MFNVY3VWNS9oaW5ENUNYSHBkZjZBa0VmNWR4cEJLUnFzbkhrUzJsc3hE?=
 =?utf-8?B?aWJzTWFKWTRSOUgrNG1KWmUrSGtQZE9xLzBZTk9GL0k3MGg3RTlkUjArN1Fi?=
 =?utf-8?B?c1JMSHZkeEw0dTlFSU9uaDFYRk9XV2lsbE9mYjcvUFIzT2lGNWNNcGdGRjlK?=
 =?utf-8?B?dkZlQmRWcndrUWgwOVVxYjRRNStlWmUrcnZIdm85S2owTjdySG5aNzgxU1d1?=
 =?utf-8?B?cmVaamRvNUJkayt3UE96cTFOWk1FYUJkdkZuanRIcHd4bHl1TTc5T2Vobi9E?=
 =?utf-8?B?RVVvZngyN2V1YzlZYnJ4NjBFdkZtSzkzSTRrRTl0Z2s1NHZVcC85R0hiQ29n?=
 =?utf-8?B?S2hBSDRNRktWc3hydDV1ZlYxb0w3WGo3aVRReUVybmpScFZDOU45UWpWbDBu?=
 =?utf-8?B?YjdETFArOUFNeU5NUjNPc1BKQnpNeFFhS1ZhZ2xGVXhCZnY2NHFhUGpRSVBY?=
 =?utf-8?B?T2xNRy9NaEMrS29aSi9CenJKRldmdm9Zc2NGeVpxVTZrbCt2bndCTFJRWlJI?=
 =?utf-8?B?WlY4V3diYUhjYUVBN2JCV1NZdG4xUWdycEtDQWo2Q3JWVmhPTVZzSkZLa08z?=
 =?utf-8?B?dEpYRjh1aUtVZVVhckgvckU5em13Q2RlQlJ1U1FmZU1ERkJhbVFFbndEbTRW?=
 =?utf-8?B?OWcyUWs0NlN3RElFQUN5bHFoZlBBN0NsdUptTHNqOFdwaFZkcGxMcUE0d3Bv?=
 =?utf-8?B?aE5TaG1xS2IycVZZVFB3SXJqU2ZqSHhmc0ZEVmw2cTdqMDBHeThRRTBGYVY1?=
 =?utf-8?B?RkNMNEsyN0IvSXNNNGdrd1Q0RmptS3dKMU5lc2g0bm9IVmIxcmVWejVBbW9Z?=
 =?utf-8?B?TkdyR2JtZzRvMllZajg3b1p3SU5tS0Y1ZzFzcmZPZUxnc1FqcDU1OEdNNzMx?=
 =?utf-8?B?SDFnNmQzQVhZYnNaVDdvbmFFZnQvYjhNazdEeFR2RG9JVEFkT1dBSHkrakMw?=
 =?utf-8?B?TE9HZXNGUHE4NVlVTEdPcFlkR1p5cHhoSmRHd1Y1NDM5MzVQdmhIYzFwQVpH?=
 =?utf-8?B?alVFV1dIUFhGM253K3U3NTFXV3Jxd2pnL3VTTWZnRVdESnZSQWxURjlzYlRC?=
 =?utf-8?B?T0d2RlZzVU1QZEpwMUtTQ2o3dVZwYmhGcGlENERxaVk0WXE5ZXM1clJXSDBt?=
 =?utf-8?B?aTVZcFphcnlVNzA3M1VkQkdKTkNybjhzL3ppaXdwOTlYVk14eDhWWWcwR3hw?=
 =?utf-8?B?M0FiQzFrcUVXbW81OC82QUlJK2VzblR2Zm0yMFN2dzhFaHpZN0E3ejlFZFUw?=
 =?utf-8?B?VFVFak1mNGJCaVByVzZZZnF0OGVDZlplVzc0U0w5b0llMnNyZWw2WXFUQWts?=
 =?utf-8?B?OGpvb3Z5a3dqbVNQd0FvdkpyUzNUMGRzTS81T1BVVW5PUE5zd1djQ2grYWRD?=
 =?utf-8?B?QVdmQ0dtVFlJdU1wdXZLeS83TEE3UlJZalM1SXZjd3QvUjlyQjVYWlJDdXpn?=
 =?utf-8?B?SnNVd0ZjZ0p4QzB6Y1RQNmQ1dmRLanRNOHhQdjQ4NHR5Z0REOGdyTXZjQXJw?=
 =?utf-8?B?YVp1dUR3YnFUbE12bnljZ1QwVnlJZE9XcmxyQnorMDZ5L0QxcXJDMzFMWlpw?=
 =?utf-8?B?K0tjRnRIMEt4TGsrOThWRDJHZmFsd3pzUGVuT29za0xFZjl0TXpwdHN6T3U2?=
 =?utf-8?B?cFpsL3huRGhPcHczaG92cDVsbkNhdmtmTHN5NGdqWUZRc05McGIwNWxqcXpE?=
 =?utf-8?B?czN6aDVNeHV5QW0wWUhGUFF5N3dyREJ3SDJvcE9XU3Bka2p4RjRtZXpmdWVn?=
 =?utf-8?B?UFNiRXZvZVZURjZvM3BuL2ZwYmw2Q0xzVGFHSEFLOHo5Mmhvd2VDdmhReWJt?=
 =?utf-8?B?d0RHdWZPN01BSnFwRjR6dEtQV3dEZ3FLbjZ6WmU5azdPVVdxV0NNSTMxcnNs?=
 =?utf-8?B?OERSWkIyamY5MGhvcENKVnJsRW5CRC85ZVlWRW92TmJESmhBK2lmQTRKSU1J?=
 =?utf-8?B?aWZQL2FjcFhTdTZrazZLTlk2cCt1R0NaY2xWNURHa0NIdVB6TVYyYytDTzZN?=
 =?utf-8?B?SWVMTHlwdkN3WDhPUnI3djJyaUEyaENGSjdjMUxSakdCMDNiRnY4NzI2cHNO?=
 =?utf-8?B?V2c9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca621f0-77d6-40c7-3950-08dacd780a48
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 17:27:47.9871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XLjzpzQbRAEFAYCRL2peplvRFoPsEdFd6LHzUdrGxd3RY+ZQ0R0R7LlGtgNScczmvkkxCgdWmM11kjUBOtqVuj9B2HaTl4lWfVoSlVzR7lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7375
X-Proofpoint-GUID: bGmb12fTXY5Jr8OsAt-Kiy51Yysb9E9T
X-Proofpoint-ORIG-GUID: bGmb12fTXY5Jr8OsAt-Kiy51Yysb9E9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_10,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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

Current logic assumes that channel connections on the destination side are
always established in the same order as the source and the first one will
always be the main channel followed by the multifid or post-copy
preemption channel. This may not be always true, as even if a channel has a
connection established on the source side it can be in the pending state on
the destination side and a newer connection can be established first.
Basically causing out of order mapping of channels on the destination side.
Currently, all channels except post-copy preempt send a magic number, this
patch uses that magic number to decide the type of channel. This logic is
applicable only for precopy(multifd) live migration, as mentioned, the
post-copy preempt channel does not send any magic number. Also, tls live
migrations already does tls handshake before creating other channels, so
this issue is not possible with tls, hence this logic is avoided for tls
live migrations. This patch uses read peek to check the magic number of
channels so that current data/control stream management remains
un-effected.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.co
Suggested-by: Daniel P. Berrangé <berrange@redhat.com
Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
---
 migration/channel.c      | 45 ++++++++++++++++++++++++++++++++++++++++
 migration/channel.h      |  5 +++++
 migration/migration.c    | 45 +++++++++++++++++++++++++++++-----------
 migration/multifd.c      | 12 ++++-------
 migration/multifd.h      |  2 +-
 migration/postcopy-ram.c |  5 +----
 migration/postcopy-ram.h |  2 +-
 7 files changed, 90 insertions(+), 26 deletions(-)

diff --git a/migration/channel.c b/migration/channel.c
index 1b0815039f..270b7acca2 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -92,3 +92,48 @@ void migration_channel_connect(MigrationState *s,
     migrate_fd_connect(s, error);
     error_free(error);
 }
+
+
+/**
+ * @migration_channel_read_peek - Read from the peek of migration channel,
+ *    without actually removing it from channel buffer.
+ *
+ * @ioc: the channel object
+ * @buf: the memory region to read data into
+ * @buflen: the number of bytes to read in @buf
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Returns 0 if successful, returns -1 and sets @errp if fails.
+ */
+int migration_channel_read_peek(QIOChannel *ioc,
+                                const char *buf,
+                                const size_t buflen,
+                                Error **errp)
+{
+    ssize_t len = 0;
+    struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
+
+    while (true) {
+        len = qio_channel_readv_full(ioc, &iov, 1, NULL,
+                                     NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
+
+        if (len <= 0 && len != QIO_CHANNEL_ERR_BLOCK) {
+            error_setg(errp,
+                       "Failed to read peek of channel");
+            return -1;
+        }
+
+        if (len == buflen) {
+            break;
+        }
+
+        /* 1ms sleep. */
+        if (qemu_in_coroutine()) {
+            qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 1000000);
+        } else {
+            g_usleep(1000);
+        }
+    }
+
+    return 0;
+}
diff --git a/migration/channel.h b/migration/channel.h
index 67a461c28a..5bdb8208a7 100644
--- a/migration/channel.h
+++ b/migration/channel.h
@@ -24,4 +24,9 @@ void migration_channel_connect(MigrationState *s,
                                QIOChannel *ioc,
                                const char *hostname,
                                Error *error_in);
+
+int migration_channel_read_peek(QIOChannel *ioc,
+                                const char *buf,
+                                const size_t buflen,
+                                Error **errp);
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index f485eea5fb..8509f20a80 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -31,6 +31,7 @@
 #include "migration.h"
 #include "savevm.h"
 #include "qemu-file.h"
+#include "channel.h"
 #include "migration/vmstate.h"
 #include "block/block.h"
 #include "qapi/error.h"
@@ -733,31 +734,51 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     Error *local_err = NULL;
-    bool start_migration;
     QEMUFile *f;
+    bool default_channel = true;
+    uint32_t channel_magic = 0;
+    int ret = 0;
 
-    if (!mis->from_src_file) {
-        /* The first connection (multifd may have multiple) */
+    if (migrate_use_multifd() && !migrate_postcopy_ram() &&
+        qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEEK)) {
+        /*
+         * With multiple channels, it is possible that we receive channels
+         * out of order on destination side, causing incorrect mapping of
+         * source channels on destination side. Check channel MAGIC to
+         * decide type of channel. Please note this is best effort, postcopy
+         * preempt channel does not send any magic number so avoid it for
+         * postcopy live migration. Also tls live migration already does
+         * tls handshake while initializing main channel so with tls this
+         * issue is not possible.
+         */
+        ret = migration_channel_read_peek(ioc, (void *)&channel_magic,
+                                          sizeof(channel_magic), &local_err);
+
+        if (ret != 0) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
+    } else {
+        default_channel = !mis->from_src_file;
+    }
+
+    if (default_channel) {
         f = qemu_file_new_input(ioc);
 
         if (!migration_incoming_setup(f, errp)) {
             return;
         }
-
-        /*
-         * Common migration only needs one channel, so we can start
-         * right now.  Some features need more than one channel, we wait.
-         */
-        start_migration = !migration_needs_multiple_sockets();
     } else {
         /* Multiple connections */
         assert(migration_needs_multiple_sockets());
         if (migrate_use_multifd()) {
-            start_migration = multifd_recv_new_channel(ioc, &local_err);
+            multifd_recv_new_channel(ioc, &local_err);
         } else {
             assert(migrate_postcopy_preempt());
             f = qemu_file_new_input(ioc);
-            start_migration = postcopy_preempt_new_channel(mis, f);
+            postcopy_preempt_new_channel(mis, f);
         }
         if (local_err) {
             error_propagate(errp, local_err);
@@ -765,7 +786,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
         }
     }
 
-    if (start_migration) {
+    if (migration_has_all_channels()) {
         /* If it's a recovery, we're done */
         if (postcopy_try_recover()) {
             return;
diff --git a/migration/multifd.c b/migration/multifd.c
index 509bbbe3bf..b54b6e7528 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1228,11 +1228,9 @@ bool multifd_recv_all_channels_created(void)
 
 /*
  * Try to receive all multifd channels to get ready for the migration.
- * - Return true and do not set @errp when correctly receiving all channels;
- * - Return false and do not set @errp when correctly receiving the current one;
- * - Return false and set @errp when failing to receive the current channel.
+ * Sets @errp when failing to receive the current channel.
  */
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
 {
     MultiFDRecvParams *p;
     Error *local_err = NULL;
@@ -1245,7 +1243,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                                 "failed to receive packet"
                                 " via multifd channel %d: ",
                                 qatomic_read(&multifd_recv_state->count));
-        return false;
+        return;
     }
     trace_multifd_recv_new_channel(id);
 
@@ -1255,7 +1253,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                    id);
         multifd_recv_terminate_threads(local_err);
         error_propagate(errp, local_err);
-        return false;
+        return;
     }
     p->c = ioc;
     object_ref(OBJECT(ioc));
@@ -1266,6 +1264,4 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
     qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
                        QEMU_THREAD_JOINABLE);
     qatomic_inc(&multifd_recv_state->count);
-    return qatomic_read(&multifd_recv_state->count) ==
-           migrate_multifd_channels();
 }
diff --git a/migration/multifd.h b/migration/multifd.h
index 519f498643..913e4ba274 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -18,7 +18,7 @@ void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
 int multifd_load_cleanup(Error **errp);
 bool multifd_recv_all_channels_created(void);
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
 int multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index b9a37ef255..f84f783ab4 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1539,7 +1539,7 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
     }
 }
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
 {
     /*
      * The new loading channel has its own threads, so it needs to be
@@ -1548,9 +1548,6 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
     qemu_file_set_blocking(file, true);
     mis->postcopy_qemufile_dst = file;
     trace_postcopy_preempt_new_channel();
-
-    /* Start the migration immediately */
-    return true;
 }
 
 /*
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 6147bf7d1d..25881c4127 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -190,7 +190,7 @@ enum PostcopyChannels {
     RAM_CHANNEL_MAX,
 };
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
 int postcopy_preempt_setup(MigrationState *s, Error **errp);
 int postcopy_preempt_wait_channel(MigrationState *s);
 
-- 
2.22.3


