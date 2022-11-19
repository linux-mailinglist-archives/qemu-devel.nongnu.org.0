Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D52630DD8
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 10:38:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owKHk-0000Qk-Qs; Sat, 19 Nov 2022 04:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1owKHS-0000Gr-HR
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 04:37:04 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1owKHQ-0007Ac-Bx
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 04:36:58 -0500
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AJ4h76Z000919; Sat, 19 Nov 2022 01:36:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=xCG9ZZXNUO+mhbVy46fzfGFleVX6kL1wjFlYBP/CUeA=;
 b=uaj/MzfWNZUoR9Uhv8Vg7YqPXAMhu50UoWB+nCEMu1QDFTHPIFNqw7qEw1PUrNxuGnaf
 VfqblchWUgBRghQuZ1DTqMASqCG7X8FgtxG5RjQbhJsM19M8ueKMswlx6EurnNAhe2G/
 VqLPC7aahaeZMUBiK1Nmqt7nAqiO0G8YjTU8tj4dWT4NtloOpKRaOTj8/qwcRRT2G2++
 tDZ+GDHHQ7w7fyp0J5AiSrZcsw+dd3jiJkZMX729HWZekx3cz7CffsfUBsF3qu1C6YB4
 ijIQVuSUzwlHAeE0Lf9oGIV/qdfSrFy02s83q1UFuweuDZIc1b4aCy0TT6JDMAOKtoEp Dw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxrc60c2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Nov 2022 01:36:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVsvVS6HLtti5JvqG2vYUvCyxPMQ8n5euGa/nEsvd37ywjK6Vlr4sg1HLe3n/yCaNgdhNUhuz7G5UpnazXltKMFHSzaEWNi+Lu5WSb3e5yRmzsLcnCHBf1v/gaL12FcXI544GxckpSwuIsSSiLG/ih8Ii2AYGzfg7tI5Em+XQ7e/WmF23/B5RFwLyEENGYVM6KxJGzm/Rl8ASd36pRF1bo/5/Xwq26kmp3SmPHd2KmXh1yKQ8V1i84EOoVwZul2ZS8rhYr7iC+/2pKmgNqkKvdLY620MUyj+GPp1ion7U54kxjHHLZGMRORCD4Y2DAkT9lYOHf1kpM45rwDBhYLchw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCG9ZZXNUO+mhbVy46fzfGFleVX6kL1wjFlYBP/CUeA=;
 b=LT4+oUz5gmsMgWR6ASnWj8YRBNlQQNFfFKX1wOPG2S8ycB1OE0BXU0314Xt21CpgDXS6czN84/6zOwYD7VJ0UQUdlidvsdp8bRivpjnRRV1sqDWXwDh4WYEuurOfJ1gWfe48T/WvDf0b9HMwgAzgWxVECJbDNvOUA4wqEssoMWy0o3UubGD+lKit/n1frfVGo3Fod2X5Q+cPpGEX9oyD2NOje7v+Tviddmv2rbLevQyWZmvh7Jfbda2wK+K+vq339rLwXKy9tiB/1i+aO3aYoJU0yepk0XDcyWxkMTG9OpOEIzgiD01jOL3pXpMj706goiaaTmLZJdgOf2nxJQ3YKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCG9ZZXNUO+mhbVy46fzfGFleVX6kL1wjFlYBP/CUeA=;
 b=CBlAavBq/kPynhiTWQT4NbA2vj8LdXmAj9SaU+kpwqDmE9kkMStvSCZ6abEobzJsUEcTjcEoHCOYOnzvGklZ3n05BkeldKO7hEPDg0s/l76ZkEknDvt1QDdgqmDg9BC5RYC0izHsmMylOP9yRI044Prmj6IleK72Tg8+274oVss6dR1W2s3tYDmM7Y0GzfNbL1HatDMLzl9RJ/2BvfW/iST9s511C+upPdN67QiBBJaWUh6H3ErsK0BA7BPJ1utV+VX1iB6NLyG4wRV983f5nDScXWf9YL5M/UFbWiapANn9ouUdfYZdgzFAR7Bht/piZYyfSt8p6D9pTlreqTYHZg==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by PH0PR02MB7479.namprd02.prod.outlook.com (2603:10b6:510:a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Sat, 19 Nov
 2022 09:36:52 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5834.009; Sat, 19 Nov 2022
 09:36:52 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com,
 "manish.mishra" <manish.mishra@nutanix.com>
Subject: check magic value for deciding the mapping of channels
Date: Sat, 19 Nov 2022 09:36:13 +0000
Message-Id: <20221119093615.158072-3-manish.mishra@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20221119093615.158072-1-manish.mishra@nutanix.com>
References: <20221119093615.158072-1-manish.mishra@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0058.prod.exchangelabs.com (2603:10b6:a03:94::35)
 To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|PH0PR02MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e84e4c6-da7f-4001-c68b-08daca119737
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NT93XgXL4F42W/SQ4cGjT8D75UfS6jZfkQUJ8/hpqPw+pQYQgldgZZguCbZmt2cwNq870jV286PPzU/hfOPf+8G+HoHyOBnI/tnfO+/ASN+blxS2dI709IKZ0EMisVYwcVwvA/Dfc6oMjWsz+tmxgUthw4+uYMlv/3ZQzvHyjHefqYX6LtsVilpwrlYWjJpThfryilNbef5/9DwmNM3S20IsprdPhyokbVBTNc0NoRZf2x6+bLFLyjYalfaiXDT1lUeliD4I1Jfd/IublHmrglpKQVimPQ99aP9rmcjFNI5qbHu5Yf6C9dhpu4ty0rlJvjJIuBGkA2ccr9ZRT6fEkSZtLymk1o0Tjs9uZaOfXLthHmRpfCbsxSo6G10JbHoY6xz7Tjm2W3EiB4GbPsaUhfzMpSAMULYuuANFMxnGpjL5bJ0tZv3ApF0apin50VTJKm2r1h4T/5CXFklrg5hAk9L1Cu/uBmFTtq1YAIeeisUY3Lx+7+jYWGKkPr9XGmkKdX9gbqAvTYjIvehAqeNA0GajdUcUfq1YhOyZgVtrUV7yKnIKfVCDuxA1HqeWU6lRKyWX07Ndx/AOg9Vn5I4EXh7XYjKADhqdL1YULTlKYS7xtqiuM3VoCUVkDgmynaU+UCwfnAbNHrcEKzaP96sUBYLY9Srf/MFUDuuIaLel4tyn8mKYqK4ZIlI9QmO7WUwMUdpV3F+ePsfkZep5EVuZzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199015)(478600001)(6512007)(6506007)(6666004)(6486002)(52116002)(107886003)(86362001)(316002)(6916009)(38350700002)(38100700002)(66476007)(66556008)(66946007)(4326008)(8676002)(36756003)(26005)(2906002)(41300700001)(83380400001)(186003)(8936002)(1076003)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b21NV0krK2FzVWU5U2UwS1VENEtheUhBQ0NoMmdzL2pkbXpkUm42S0xSS0xI?=
 =?utf-8?B?UzFwMVM4M01UMjlIeGJ2TXNGdWc4amNaM1M5SEhwV1grMnNOT2R5M0htc2Yw?=
 =?utf-8?B?RlliSEdmVVFzUE5ocldleVJQMjNuMzhGT1FXRUw1Z3lLbUZKZVliSGlsc2pj?=
 =?utf-8?B?ZHYrZVFMeVJMT3dYMlAvQ3JLbGYyemhodXp2ZVdXbWVEb0lYaE5GRU5hR3VO?=
 =?utf-8?B?Vi9leXNZNlRNcGlHeGJ0d0psRE9XcndhR3RiNC9YOHVWcFFENFBRQk5nLzFL?=
 =?utf-8?B?Vld2NUwwMXRZZ21PRGxFYllZMHl1WXdLWGs4WmhHbURJRGZveS85SUppUmFI?=
 =?utf-8?B?bWw2QVpWRUcyeE42UlhxUlJ1NDlacTl5RXd3YU5EV0N1dmRhb01nb2VwV3VK?=
 =?utf-8?B?UEl5VjhDV05VR1Uxd3Y1TXE4SjhRVGJ5MXZlNThER3pad1MvelNZeWNjaHl2?=
 =?utf-8?B?bitDQ2I0MVBTL1NjRDFTMTg1MU1ucnMxSjNrMEZXL2lTWWR4T25sQWo3UXlE?=
 =?utf-8?B?WWltcG5jTHBnd2VkTDFZY0tTYXFrakxtVHZTZ0MvbWlHSjF2Um9SeU43bWFP?=
 =?utf-8?B?eFlnK2RDNGhCRWYzTS95M1l3OGJSZFk3bFN3UjBDK2VhMFlDaHJaUGw3d01N?=
 =?utf-8?B?a2JPSkkxcStmNTg5Y0xOajJycExMMFZQN1VyYnZVVVBrR0NKQUN1bTkrdENT?=
 =?utf-8?B?M2t6WlJYYVlSdU5yVytSSFdzNlUrWnNta3EwRCt4WEV3N2VsaHpiazU3b1pS?=
 =?utf-8?B?V0txdkgvWklmOFg4aldjZ1ZGWEx6Wm5RRnlPek9xblk2emZLMm5ybXA1ZnAz?=
 =?utf-8?B?QmkxSzJ3NnJodDBuRFR4NlRqaG5rTlpYYUlITWpYS0cvdFowNU5BRlJRVFhz?=
 =?utf-8?B?ckRKUFdqNndjS0YyN0JyL21iRUY2UHRwbFhISnc2S0xnbmlXejhITGxkUFRH?=
 =?utf-8?B?N0toMlRXdHkrRHQrQ3ArL1BDYkYrQXVNVjFoTTRMTGxzTDA3NUlpKzJkNTBK?=
 =?utf-8?B?eGtBNnd0WmJzcGJnUEE2T0pkTDl2OVFjR3g2K08wbmJ3Nk9McnIvejdiTkdh?=
 =?utf-8?B?alRWOVF0QUpXRVdDajlYTXJJSDEwV2RlSlJla01hdEJXWTJULzF2bmVqb0xH?=
 =?utf-8?B?a0Myak90WkRmVGxJOVpxQXRBMTMvdkZxZ3cranlXbU84T3dJelpycU9Hd2Rw?=
 =?utf-8?B?bnJlYXdYMmJlV05BYWxmckJIbVZmSHl4U0g3ZnY2TDIrZGRJdlgwdTZZczY1?=
 =?utf-8?B?d1lxbmlmUDViczdreThrZDJnZVN6NU9wTWNJdGhOeEM1c0xSTmZ4WGtobmZy?=
 =?utf-8?B?NUt6UkQra0ZMWjFuTHhzamZpdmt6ODV0U3NsUytkdDQweVVrTUs2UEpVSzhI?=
 =?utf-8?B?Q1h2ZFZJZTc5UUR3dWRobVIrdFZaZkFTclljRENqN0pvMk83NzhReVIyVy9S?=
 =?utf-8?B?MlBmKzljVHM5UW16K1BUblJLSzFBbzZ3dU44L0NMZGQrb0MzeVVMRitQb01s?=
 =?utf-8?B?a1A1YzJMYXdyWm9md1c0UDFLS1ZwWUI2YncxaUNrOThPV2lhUGlNT0dRN0NH?=
 =?utf-8?B?WWpRZHVpZE9MMjE5cmg5QjZGTzBHdXkzZmo1Q24yaiswbFRUb05KQS9ZUmZE?=
 =?utf-8?B?Skl5S3JCQ1VJQmFOdUQ4elZOUnFpNlk0di9PZWVWOXN1a1pZUkZKTHkvQmFG?=
 =?utf-8?B?U1FvVHIxam92UkpHVVZ1ZzFWT0NaZGl3QmVpbk1kWm5JeTdDMXVQQWpiRjc3?=
 =?utf-8?B?Y2w4RWkvbW9CNmtCSE93emJ1SzBhL1M4ZU0vd3dXU0t2N0liQm94K2JJdVZM?=
 =?utf-8?B?ZTBlL1VGWlNOMExPTmwzWENBNmNqa0QvWGcxTjNLTW5KdDQzN1p1dUlob3JH?=
 =?utf-8?B?aUVpTXhuTXlCTzM2R3VPaHJ6ZjNFWU9USHJKUjY4bzh1OStib1NrcWFwandC?=
 =?utf-8?B?dWtGU2Z6Z3hrYkgzalhid3hvMldRR0RCajZFU0ptM21JY2lyNVJnM3h2TWVy?=
 =?utf-8?B?bUFKUDd2YkxTSFAwUjRHT012UGFHNzc4enZueGpOMnA1a2tGQnRNZVBiQSs5?=
 =?utf-8?B?TDlCcms4UTBZM2FqR2FoRGN2SHVURE03R1FYUWNYRTgvdndmVnBhTmNqaG5r?=
 =?utf-8?B?ci9STDJFYm51ZXIwQ0xoREpTUFgzZ1ZkQTdKQ1pmVjlRcEh6UDVBYUYzaXoz?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e84e4c6-da7f-4001-c68b-08daca119737
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2022 09:36:52.8023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdt7KApdhZiAWJbuOG1KVdS1vbU6wNY0gGRXOIdB/4va3tfkhiRUTqig9eIYLfmyFnA7nSuH/Qdl8pZqubgiplUWkxO1wRseP9/sHaZ6Ad4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7479
X-Proofpoint-GUID: TewyNVsQWQ2YQBm87E2ZcKUTjGMeTCTX
X-Proofpoint-ORIG-GUID: TewyNVsQWQ2YQBm87E2ZcKUTjGMeTCTX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_08,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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
live migrations. This patch uses MSG_PEEK to check the magic number of
channels so that current data/control stream management remains
un-effected.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: manish.mishra <manish.mishra@nutanix.com>

v2:
  TLS does not support MSG_PEEK, so V1 was broken for tls live
  migrations. For tls live migration, while initializing main channel
  tls handshake is done before we can create other channels, so this
  issue is not possible for tls live migrations. In V2 added a check
  to avoid checking magic number for tls live migration and fallback
  to older method to decide mapping of channels on destination side.

v3:
  1. Split change in two patches, io patch for read_peek routines,
     migration patch for migration related changes.
  2. Add flags to io_readv calls to get extra read flags like
     MSG_PEEK.
  3. Some other minor fixes.

manish.mishra (2):
  io: Add support for MSG_PEEK for socket channel
  migration: check magic value for deciding the mapping of channels

 chardev/char-socket.c               |  4 +-
 include/io/channel.h                | 83 +++++++++++++++++++++++++++++
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-null.c                   |  1 +
 io/channel-socket.c                 | 16 +++++-
 io/channel-tls.c                    |  1 +
 io/channel-websock.c                |  1 +
 io/channel.c                        | 73 +++++++++++++++++++++++--
 migration/channel-block.c           |  1 +
 migration/migration.c               | 44 ++++++++++-----
 migration/multifd.c                 | 12 ++---
 migration/multifd.h                 |  2 +-
 migration/postcopy-ram.c            |  5 +-
 migration/postcopy-ram.h            |  2 +-
 scsi/qemu-pr-helper.c               |  2 +-
 tests/qtest/tpm-emu.c               |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 util/vhost-user-server.c            |  2 +-
 20 files changed, 218 insertions(+), 37 deletions(-)

-- 
2.22.3


