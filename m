Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A05E544E5F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:08:22 +0200 (CEST)
Received: from localhost ([::1]:59634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIph-0000Ia-4n
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1nzCfV-0002Av-Jx
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:33:29 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:32070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1nzCfR-0007u2-1o
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:33:25 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25964I86001909;
 Thu, 9 Jun 2022 00:33:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=2+tW6qFI88gqNpzs9PTDNs1XxIiCRp/LBNHS5egfIRo=;
 b=vuA9Jm5LAaOX+RIwguE3UR4oSo0ryDIbD3y3jkOXBKcIow1IifREGs32ejpWpcrrN33M
 Mc68Ixl8zrrvDdJ7nfdHkNCw2JsqLMUK25QwQVyWq55A/eZkWsY0KbSLgLJuXyrwTKAN
 sIcckM7aYCkpvrotFP/MsNfWVprtjJED4k2Dd3AphUkPFZJb3xYSmEXFgylF0LbMK8U2
 02buhYkRjlG+/e0nMiTgKiE8TE1ZefUyzKmDu2c8iiYIAg4wHLj0Y5ahKrAMYOUNeFfc
 4XN/fkv3ECAgP3+kE35LlPys33hxLXEyRPJxfcJLQQtGVZby/M1fbd34RehkWmVWpQ6S 9Q== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3gg3qvtaxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 00:33:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHv6eAV0Rp/SXkQErwMDZZRaBaS4GFiv1p6Dd1FX2vm3KKQ70fHB97Z1+fKLe1OSZ8IuWjOGgflfb4HAXQq9+owSivNTX+wATMTEL8GVPTRtzAMgT4sbv2S2GEv4Fs8Mnb8QSmLSUhy9VINjtfuFtPkgfgp9js88w5UYGAhmgDR+oW1LF6fMTyuvmEXMT2zvaPwSjpj0w0Y7OhanQq5ck+Kc8slCCKvj3wREcKrBTIAPlalfJYT8cKol4gw7hVIpID0IVLoWGqU4izERUpHW+5Se+9jIb6R+Q9wVG4bhbRhuKnGbDVuio98d4ajw5XGTpX/dV3/zF3AC+dRp9ANcyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+tW6qFI88gqNpzs9PTDNs1XxIiCRp/LBNHS5egfIRo=;
 b=CH4E9IzYcBPVQcfxvsJUCnUkiZUWpKPNgQurzGe4CV4KFQ+rn3+zhvzp8sGho02WFDKEI8xAYiFJ3+RMetIOhDdsBeegmhVktBXat/B9Q/cd8CWHsIkZ0QjvE5IhOkK15Mpr1yB98Cr3yy69j1MwRpmEAqv6k1p2XKECJ8CjrIjo6UWR5rDMz+Rp7SzDKINLSa74jsiOXtGWDE/5OEJ1VWuFNVOoXmOZOhMDsqWdOkCttOyl4FVpcWrkSxKAawtoPrvIJ9D1aI1/arj4W9mFq/zLqU6o+jzof6uFP+5jSQNeK9y5UJSF4ADqulOaI/M7mhGWOUlcSUqs4qwTXRuB9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SA1PR02MB8639.namprd02.prod.outlook.com (2603:10b6:806:1fe::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 07:33:11 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 07:33:10 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 Het Gala <het.gala@nutanix.com>
Subject: [PATCH 0/4] Multiple interface support on top of Multi-FD
Date: Thu,  9 Jun 2022 07:33:01 +0000
Message-Id: <20220609073305.142515-1-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::12) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2e05c7a-b154-4cbe-84ab-08da49ea4dfa
X-MS-TrafficTypeDiagnostic: SA1PR02MB8639:EE_
X-Microsoft-Antispam-PRVS: <SA1PR02MB8639980813F933431C8C98FA98A79@SA1PR02MB8639.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eXybWYmTMelYgA+QriG8b2QTNr+e7LqVXQndmHDq4MNns3j3nz/bpyP59IlaEYyM/4/w7t5ajHYBCwt3y6ViGDcI2JMJJWL1AW9BnGgat9ntgr+jGHe6SpXkgW1/j8wp207Mic5xHlEh3ecHPbLJgNPmhHuSLJ91Vm4gjZTGccjGuwU3qDlFKDehAJdfOHEzbAt5nHyILOQ3vxzUgq41clQFGRmZBIeE8LtfUpC/c71DHMjj148xjG9RXc2in1b6nog02GAPHQplpE7/Xr1wjcV6DbaJa35Va2SVodNy+qhqtnOaQ31Wq4FZicf8vCq0msdeXeqFHXwt0Nfvn1n8OHdGxIhkrIr4ly/hy0CGRTRB7L89i3SYgWNUG06J3zJh8Km1rIBiLmz3a+6mGBIQx5ANd6lKbt2cYny948Vb74sYGt+U7HylrUrgylPVyjERzHBVfnaCBVjq3xp+Y1XUXFY/UYNotHrD2yAZpienb3hFxPvyK0A6F5jYBz+Mi2THWUtmoUcX8nbuPNmbKmSV5OSTndOlfQTo2OKsbcHGc21+7DyASvW1A16oLPYwRGIrws5dtWmCIVtEpHuHcVQ58GZPhZeuzz1pEVTGOUcTe8lI2tPInT91npsbIajmsCLyLF+QYGuMIte+hRnqv4JsvAyZjkSDopyuPs7Nacc94hs3qv3+ZnBBK43vo9oqFhZ/ZVRDqtmiokvWIlwkkbOhNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(107886003)(6666004)(1076003)(2906002)(8936002)(52116002)(86362001)(6506007)(186003)(5660300002)(83380400001)(6486002)(44832011)(38350700002)(26005)(38100700002)(36756003)(6512007)(2616005)(316002)(66556008)(66946007)(4326008)(6916009)(8676002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nmo3ZUZFeiswaEIwbkp5ZmNXOTA5cDhJNUVpUSs1OFdkOHFML2RaTEh0WHBW?=
 =?utf-8?B?V3MzSmMxRW50Mzc5K25hR0gwMkhhN1pIcS9xc2RKVFkyR3JPU2xZbTdRWE5s?=
 =?utf-8?B?S2s4cnVFeWdUQUVvVjZCWDIzMmhlNDQzcjk3S1d4Y1VlT1hGMS9KR2pJMFl0?=
 =?utf-8?B?T1N0Z0FkMXJwSU5pZDVRUTdMSzQ0bFRtb2xaMFRPZ3ZydHoyZTNXcGhac2da?=
 =?utf-8?B?NVJqd2c5WmVRYjJhanhYL2JoMlJHZlFxWG1iVXljS3VuMklpajNLSEtmTVFM?=
 =?utf-8?B?UDZNUk8raHhSOERnZno4RjRBWHVUcWY0N0V6OVNncWxjYzI0ci9CaVNGb20z?=
 =?utf-8?B?cm5FYXlyREtkVHNHOTF4OXorMHY2UUVBbUZKdGxhWGtqa1ZQS1NDM3VHNU9a?=
 =?utf-8?B?YktCMUhxRElxZXd4MFRveUhGUHJKNm5jRUtxVTVJdENsdStLeHg0dUtrOTdC?=
 =?utf-8?B?a255U0NPRjBPL3VPZHo1SFY4UFdwMDNCYkxRNDU3U3U1RTY3U1MxRlRxZk1N?=
 =?utf-8?B?aWp5QTFJOWpJaUk3a05Dd3BvanVPSS8zS3BHR0ZuVkE2U2dEcGZGZVZHYU1h?=
 =?utf-8?B?eEhtaUV6b3c1YThvbGRmZ1YrZ3RhTlIvNWl2d3lCbXRPYmlmYndtRE5QZ3ZT?=
 =?utf-8?B?YTh4L1dZZlhGd2orbjNKZXA4L09yclMzcm9UNVNCb0Z4bndhV2hVR0liemZ4?=
 =?utf-8?B?YUxBTzh2dHM5WHZjeC9rZ0ozUUZMQlY0UWhDTkwvVDh4azE0VndJbDFBQVZq?=
 =?utf-8?B?MkRyZFVwcmJNcUFDVER1anF4d3BLSkltY3JGUE9tNkdIeFdVdHR0bWtJMHRO?=
 =?utf-8?B?U1BoUzh0anpaeDFDTTNxbDN2YTZ3Z3RJTDBTay9MaDVLNm9pYklpYkJrYUo5?=
 =?utf-8?B?UEVHd1BjN1NUWHJxNHJUZVozSkQvdGp3bXZHb3JRRURaZWVIMm5WZGpzM0h4?=
 =?utf-8?B?aGdodlRrMkU4d3Ztdk1SaGN5dzY3RVJRRVN0S1N3V2NMZW1mdTdYUWxVeXpH?=
 =?utf-8?B?YWFrNS90aHU5MCtnWk5PTnNBYkNtMnZtOG03ekJVdksvNi9aVXIwSFFDbmQ3?=
 =?utf-8?B?RllrdWdBS2ErUlBDWWM3anJLL3dLZlZDU0pPbk9lVlZpemhRTEFraDVESDc4?=
 =?utf-8?B?azlxcW5idERTTmRZRXlnM3lkWFJxVjcrTThRMnozU3ZTSmIwSXI5NjZTaGtI?=
 =?utf-8?B?R2dGR3FxVDlRWnMwSVluRUVQakVxS3hzZE12NFdHSFlpdEV3S1ZmS05FdVg1?=
 =?utf-8?B?OGpjUFpweFVsR213amgyL2dZSHhOVE52ZE90SG80UXgzUGFKamVtRm5Vb1oz?=
 =?utf-8?B?R2dOV0U3MWcvNGh2aDNsSzRvcEljd3gwR0FqYkpzTVZvY1F3V3FLTWFNMVVS?=
 =?utf-8?B?Z0NkalpjWlRiU1UrUHpoUGxhZHNZVmRUeEhvWVN2ZDJIWmlQZ2FvZjZJV09X?=
 =?utf-8?B?dUMzakdCTUtGSTBkZGZGNC9Vc3hvOG9MZ0E5WDR2YmQ5QUxVdnk0Ymd4VkR1?=
 =?utf-8?B?bjkvVFRHK1dvOGRiU2N3QzlTakZiN1gwRU0yazEzTTBDaXh0ZzhxalRCOExr?=
 =?utf-8?B?d1l2ZVJITEZrWlk3eVNRVklQS3QrUG4xWGlrVlMvNEczLzYvU3VBTHdNMk1O?=
 =?utf-8?B?ZHhoTnp1MjVBUTVyWXhPMTNKVHVKR05STW1xT2tlMHR0L2llejJSc1NHNmdO?=
 =?utf-8?B?eEwzTTkyK2VBdGh0aCtUZzVkV1l0L0JzZnJjMFFMaWlBRUw5L3JnMmZRTmQ3?=
 =?utf-8?B?bmp6dzROanArR0VFdkN3KzkvNzRJRHc4Sm1QTUN1YlJHMC85WUw3dTVScWI5?=
 =?utf-8?B?NFV2NmVMSXJvZjZBa0F2bDV6Z3h0RmJaUllRYmpQVitlUXRFSG81UU1CKy9E?=
 =?utf-8?B?eTdkOTduTVlrdlUxbzNlRFVyWXVXNlpVOGRERlRmQWtKREswWlllR0lkcWxE?=
 =?utf-8?B?eFZhQVBSSGtyN1FTMnRIbVNUVE1KcWZqdmFyakdkbzExZ0hweFJEbmYvSkpD?=
 =?utf-8?B?cUREK0tSSTlzdmdhdGpkaHBJOHREUHlBKzgwc0ZmQ3BFM0JuNFNWYkU2ckRy?=
 =?utf-8?B?RnlkeUxsMkhtaHAvMlRpeFJ6emlIa2NsU1BBaG1KcCthQjkrOTBaTVFQWjZG?=
 =?utf-8?B?Z1dEeDY2K2Zsd2VEcVVXWEh5Ui9ZS21ORm8zRVA1WG5DelBod2xzc3dILzNz?=
 =?utf-8?B?azZsM0tpaVArMC9FWnpjWkg3ZzFDS3NXSWtmdkJaT0xpV1lpTWdtNExqcFJT?=
 =?utf-8?B?QVUycFhUK2kyeVZBOFk2NVljMnl1ek5IakxkVG8rM05ZZlp4UTRoVlc1MWpw?=
 =?utf-8?B?eE5oY0hFSEdOanVFLzFGWkppV0FGZkZyY2pkYXVtUVFTaWpsVHZhcjRDUWxs?=
 =?utf-8?Q?N9Pn+jZMs+xL6Xfg=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e05c7a-b154-4cbe-84ab-08da49ea4dfa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 07:33:10.6878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHUdBZIl61ubhUZtXDRZL81y3QFyY2PAavf6hFhI2/z4ksplU4QSsoGWroPWpdFGgeooyRgyiuzxWkFHwC9L/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8639
X-Proofpoint-ORIG-GUID: eFMXHO4QSUrGHj4Ap1I7AN8U1A1aLlZD
X-Proofpoint-GUID: eFMXHO4QSUrGHj4Ap1I7AN8U1A1aLlZD
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
X-Mailman-Approved-At: Thu, 09 Jun 2022 09:30:28 -0400
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


As of now, the multi-FD feature supports connection over the default network
only. This Patchset series is a Qemu side implementation of providing multiple
interfaces support for multi-FD. This enables us to fully utilize dedicated or
multiple NICs in case bonding of NICs is not possible.


Introduction
-------------
Multi-FD Qemu implementation currently supports connection only on the default
network. This forbids us from advantages like:
- Separating VM live migration traffic from the default network.
- Fully utilize all NICs’ capacity in cases where creating a LACP bond (Link
  Aggregation Control Protocol) is not supported.

Multi-interface with Multi-FD
-----------------------------
Multiple-interface support over basic multi-FD has been implemented in the
patches. Advantages of this implementation are:
- Able to separate live migration traffic from default network interface by
  creating multiFD channels on ip addresses of multiple non-default interfaces.
- Can optimize the number of multi-FD channels on a particular interface
  depending upon the network bandwidth limit on a particular interface.

Implementation
--------------

Earlier the 'migrate' qmp command:
{ "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }

Modified qmp command:
{ "execute": "migrate",
             "arguments": { "uri": "tcp:0:4446", "multi-fd-uri-list": [ {
             "source-uri": "tcp::6900", "destination-uri": "tcp:0:4480",
             "multifd-channels": 4}, { "source-uri": "tcp:10.0.0.0: ",
             "destination-uri": "tcp:11.0.0.0:7789",
             "multifd-channels": 5} ] } }
------------------------------------------------------------------------------

Earlier the 'migrate-incoming' qmp command:
{ "execute": "migrate-incoming", "arguments": { "uri": "tcp::4446" } }

Modified 'migrate-incoming' qmp command:
{ "execute": "migrate-incoming",
            "arguments": {"uri": "tcp::6789",
            "multi-fd-uri-list" : [ {"destination-uri" : "tcp::6900",
            "multifd-channels": 4}, {"destination-uri" : "tcp:11.0.0.0:7789",
            "multifd-channels": 5} ] } }
------------------------------------------------------------------------------

Introduced a new flag while spawning a qemu process for 'migrate-incoming' ip
addresses (-multi-fd-incoming flag):
-multi-fd-incoming "tcp::6900:4,tcp:11.0.0.0:7789:5"

---
Het Gala (4):
  Modifying ‘migrate’ qmp command to add multi-FD socket on particular
    source and destination pair
  Adding multi-interface support for multi-FD on destination side
  Establishing connection between any non-default source and destination
    pair
  Adding support for multi-FD connections dynamically

 chardev/char-socket.c               |   4 +-
 include/io/channel-socket.h         |  26 ++--
 include/qapi/util.h                 |  10 ++
 include/qemu/sockets.h              |   6 +-
 io/channel-socket.c                 |  50 +++++--
 migration/migration.c               | 211 ++++++++++++++++++++++------
 migration/migration.h               |   3 +-
 migration/multifd.c                 |  42 +++---
 migration/socket.c                  | 119 ++++++++++++----
 migration/socket.h                  |  24 +++-
 monitor/hmp-cmds.c                  |  68 ++++-----
 nbd/client-connection.c             |   2 +-
 qapi/migration.json                 |  92 +++++++++---
 qapi/qapi-util.c                    |  27 ++++
 qemu-nbd.c                          |   4 +-
 qemu-options.hx                     |  18 +++
 scsi/pr-manager-helper.c            |   1 +
 softmmu/vl.c                        |  30 +++-
 tests/unit/test-char.c              |   8 +-
 tests/unit/test-io-channel-socket.c |   4 +-
 tests/unit/test-util-sockets.c      |  16 +--
 ui/input-barrier.c                  |   2 +-
 ui/vnc.c                            |   3 +-
 util/qemu-sockets.c                 |  71 +++++++---
 24 files changed, 626 insertions(+), 215 deletions(-)

-- 
2.22.3


