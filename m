Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AFD4FDD92
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 13:13:08 +0200 (CEST)
Received: from localhost ([::1]:56218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neESK-00039a-4I
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 07:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <divya.garg@nutanix.com>)
 id 1neEKb-0001ey-DC
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 07:05:09 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:6390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <divya.garg@nutanix.com>)
 id 1neEKO-0004cq-Ha
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 07:05:02 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23C9Rphu008932;
 Tue, 12 Apr 2022 04:04:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 to : subject : from : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=P/dXRaooa8ahMnT6kWDQm5Co2YaBcCsYnPgmPq9GEpU=;
 b=qbEpmrrpaEY/FPSL5lsPei+vGXjiHx3E6mh5wMZ6IQ+RupaFEmF1rwYAiFaOdSvGMsYJ
 Eq2Wc3RtNHqWO2cpuo+O5pZIZ1X4vWKnpG/yNS+hACaDxhEeQfqjXH5mxQIgR05vjMx+
 5O/HjmXDvqG6G70itPc5POMAGz1o3odvwZac4Ms61Nw5FXz6c+pM/TrV3RSoI51lEmur
 7ePXF+tY6aRR5JczCvGQj6VtLomCsM5w6JH1Oe5S6CF/LZoHi9vgYFUUreYgqMuTBsI+
 sXsP43CJGWmZLs02FwhZ3LwVKpID6+sNJpSIpDsYGivKafZjkGmIjTaih4Ikis6CX9PB kQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3fb7p6e32c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 04:04:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8QR2N1U8uAwLc4RBDNwF5cB5PRJWNmX2hIB3giBct0QTW6hThR1TsmlTlfEIuZ4BNP47WPCWEY8ByJ8RgfNFMMxMp7n54PSyTDWU2u1w0YCWDr4RKJyz9bZddPiP2HiOqL3iqg6kLT/CwPyf5XAoYpsRFQtYs++xlKTOQfJzxF1yu+ko7ltV6InAdH93pxsNekfO/3j+Ferpp+8fr0BFA7oEPvoKlvFl5TUsstz/USHDqLHlf8+2gaymDy54iZqmEBzRn4Nepb9UjQod9gGPVpN22Y32XuHMWwvANa5wuVoEpXwJb77/lWRU/ju5eC5LXySHDaPpYZ7OhEcQZvxCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/dXRaooa8ahMnT6kWDQm5Co2YaBcCsYnPgmPq9GEpU=;
 b=nBGUDnzVu8NDdRcKfxxM6I7dfyEJs7/CtjU0Cx15anD1VserseXbURIzHfjqXXMPHSSVFTQ2rkfQO5HuORnRXbaj6i3CXHR0iAhakQPx9FBmelJiDj8tEOlPidFckcEeJrfQSsaDenM/5fcTFkapI68KqjT8ETHohGzwIgVBSmLEy9kml/0sPUJwG0k8xG4INLbcRVV3ZzNC1JHf9LzTEAj2tALXpUcpAASmBha1t8i8cnLawHRgB+jk5ZKbcQErbKi+LXZ5dcwfKWKWGsOmMa7aI3RKKWiWTOsPSarRCjVbg5o01RPSCDmrnxu4GUCJl8fjdzhgdyJaxp4cl3RnOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SJ0PR02MB7775.namprd02.prod.outlook.com (2603:10b6:a03:326::12)
 by SA2PR02MB7785.namprd02.prod.outlook.com (2603:10b6:806:14b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 11:04:09 +0000
Received: from SJ0PR02MB7775.namprd02.prod.outlook.com
 ([fe80::3dbb:6b0e:599:f05c]) by SJ0PR02MB7775.namprd02.prod.outlook.com
 ([fe80::3dbb:6b0e:599:f05c%7]) with mapi id 15.20.5164.018; Tue, 12 Apr 2022
 11:04:08 +0000
Message-ID: <2dde6caa-8d02-7022-d2c2-aa56c408f5f2@nutanix.com>
Date: Tue, 12 Apr 2022 16:34:00 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
To: vkuznets@redhat.com, qemu-devel@nongnu.org
Subject: [Qemu-devel] [PATCH 6/8] i386/kvm: hv-stimer requires hv-time and
 hv-synic
From: Divya Garg <divya.garg@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0069.prod.exchangelabs.com (2603:10b6:a03:94::46)
 To SJ0PR02MB7775.namprd02.prod.outlook.com
 (2603:10b6:a03:326::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fe976b6-d88a-4980-9cb6-08da1c742add
X-MS-TrafficTypeDiagnostic: SA2PR02MB7785:EE_
X-Microsoft-Antispam-PRVS: <SA2PR02MB77858FA9D0CC5A4BB56026489AED9@SA2PR02MB7785.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7EEgP64QHOmbdbvHjAN+xgrPjys7JBXboCtBf/PUg3DHebHXsgIUDc51Fza130kWctRWg04lUb+wYcvf+O64ecEdq5Y7NTNItY9+NaFlAi/nxuxSLKjM71jOC6LyTnCd2Y5+b6gAahZE0TxrcUsagD5E3dI1hkvl799nAGpeS51Hy1pVXfkwM2By7kKrwnHSsZN6V0JX+oJ7+7+cAmVKJlExWw74Yk24OsQ1xMFt/eI7e7N7WEaBJRQZuwfnf0Cr5bwsp/SmZGlt9utDnXmsEGCKGB11h5LYveA/seIpNB0sTrbYwS1zMGjIyVgRtwGcxwtAtiyv7nGhykOkPFOESYT6aS0N0X0TWJMGvbqFBv78QAiUgAQfqi2lMf7Z+fyGdIJyHWoYPYpNedRJ58KaEpUYrIZDmPGu7bpTdc/Jd40tcNI47a45CKfAlkWUUhRJ2NrtcO2D+IYJtJMp9U+OPRndPx6z8B9tnrxN6uQWqkrMetPXeZQCdmO87CSVis/sUfBD/Hdudit48IZTimvMd+0wHzhjdd2q4OdniwbW3FUN+MtbY4WJB71PqXhWT8qRCF0einxof5/fyN9B82jC8vBA+bJxGOawWM5mfPFew35vpzGg38k0mzvPKuLCAf/TwouHKq6+/7LCe6ZAmClKrfP/vUAvLVOvbU83HDVlA83W1U6KLhBsLzzUim6QTQDjVY/+n8enb5EdEi2NtWbkj9Nyq/O9VzgTxLt85o9mHIi9Cy6Ud/nZeaFhwX03LxlyxUuJpqrZ8/342RHk0T76SbM5CRWE6YZe16C1X+RhpspywInddz0Khxqx+Kuhlq3aATBXm1+9gCy4yj8emhPB3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7775.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(6486002)(2616005)(38100700002)(4744005)(5660300002)(26005)(186003)(508600001)(44832011)(36756003)(2906002)(31686004)(8676002)(86362001)(66946007)(31696002)(66476007)(66556008)(316002)(6506007)(6512007)(38350700002)(52116002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UktrVzdHNGlibGpKN2tCamkxZEZZY1ZpWGRYMW51b1VqL3lVMEhkcEVIUEF3?=
 =?utf-8?B?Y2MyNUloUDg5T3FJdzYxODlMQUd5bGZpeThQUmx2L3BRQ0RQZlRvc1VmYThw?=
 =?utf-8?B?Z1JqMWxYZHlYWE43SWZDSXhEOENCcmhIOVJFeDE2SFNHMlBXZUpveTBGb24v?=
 =?utf-8?B?OTB3dUVTM2dtMkRqaVRLc1ArK2pmNEFCTzQ1MWl3S0QxYUNlSE9kOGUrS1hx?=
 =?utf-8?B?aExib0ZZVHVseDE2WWtLVlp2RkJJbGNqdUJDWUdUMllkNnJWVE8zRHA5U0F6?=
 =?utf-8?B?N24vdFdhL3lLVGhFZWVudHNrY3dBZy83eUZFeGF3eGo0ZU5EQ2gzZUN4RU9Z?=
 =?utf-8?B?empvaHhZM3p1cERNS1lyL29GdzRyV3ZpRGYvNXRjazFrZkdBSWkvOFY5YkEx?=
 =?utf-8?B?YTlBczRmK0x0MEtheXkzZjVWOWVPd1NYUU1Za2QvWHNwMUlCR2h2eVV6WlZ1?=
 =?utf-8?B?K3Zab2dXYXNSaG1OY3d0aHpnSmN4dUZxWkpjemNocDFlc0Z5aW5jOHhTQ0R3?=
 =?utf-8?B?YVE5YUwvRFg0Skc0cndWZUlBMUM3TVkvMU1BRWVsSTZ5UVMvOUJoNWh5Qmtk?=
 =?utf-8?B?dERPMmU2MnFCUFBJWCtNazVEWGI2OHZPRjRpdEIvZ1FyTnNVQlN2VXhzM0ZV?=
 =?utf-8?B?a3UzTXV2ZEtyNEZMMXl6cjZyWC9id2c1Y2ltVnB5ZENaSUFwcnlpYW1tSUhK?=
 =?utf-8?B?eldYTmNyNHdwc0U4QWNFSzY1NTRtOHlJVkRiSmZrMlVKNkZLODVKRWtMRDdF?=
 =?utf-8?B?QmI3ckVNeUUvL1dId3JzODk5VzVXenpWTkdoNGhYMC9Zcm9LYXZlZ2NWdkww?=
 =?utf-8?B?NXhqQkZEM0ZPU0kxOWh6dkxEei9PLytVVEhESlFvckhiYmExekpDSFZrRk8x?=
 =?utf-8?B?WndCaEM2WEFZdC9abEl6bXVPaFdrUVNkZWRsU3FhMUlqamxMUWdNamd6b0tO?=
 =?utf-8?B?cERhYUR1UlZVa21JYXRGcVg1MXhJY3NzQW0wRUtwTjM2Z0c5Slg4MWxJd1Zv?=
 =?utf-8?B?dUEvME4rLzFDSEx2NzV5aHZ6ZjA1bk9CL0J1ZUZDdU9ybVFPQTBGeEk5VURh?=
 =?utf-8?B?MWZaZjF5ZFhmY2Y1S1RCOVZlY1V0UmpwUW92T3BIU01KQnZUcVU3TDZuZ2R6?=
 =?utf-8?B?d0ROOHFqYjlhNDhqVERJa0l0NUZTaWw3d3dyWnpUd2swY1BySi9kSmtnT1lz?=
 =?utf-8?B?RXY1Y1NmZXc3dGpGS3hsZEx1YXkvMERXYmFUaTA2YXhXbWxGbDJManVZMkZM?=
 =?utf-8?B?SW1TcE1IeHJwdlJ6THhTRTEwWStmUENCY3V5VFArKzRCVUcraW5TZzNPazcw?=
 =?utf-8?B?MmpJbVdjcm9UWVdlVWxiazRpYnFITzNPTCswOTRjWTBRYkxuOTZNTXJ6SW5i?=
 =?utf-8?B?NlhRMjc3VHhBeGxMRk9jRE8rc2R5dkhjTUZDYTdoV1RNbWVZd2lwdzNYUmNi?=
 =?utf-8?B?RTVXbUFNKzZrNkZFN3ZybUdUS0ZOd1FqMDE3UXJuMEJRUGtoWHNNQjIzWVlL?=
 =?utf-8?B?emZuUld5TlNqakk3RGNaZjdCYyt3SXh0dmZwTFRXZFBscTNhbjFZQ2ttQUJ1?=
 =?utf-8?B?ZHA4R0Q2Vm04ZkFiSXRPRGlyMHhTVENwd3JqZi9FSGJZT1FMMnVSTUVkVHV2?=
 =?utf-8?B?aE53QWtUS3pLbmthdlh5T0IzTHJVMW8za1JPUnJuU214K2JhbU5wUU1EdWsv?=
 =?utf-8?B?anpuRzlJYXNuaHBrNmVVRnJTY1NsVCtCY3ZqSmZIL0xwWnY2S1M4Y2IzRldj?=
 =?utf-8?B?c1Fnc2Y2MHhUK0d5QU9TcURCUTBERzF0UlFtUGoxVXc1WU1BWHRRRm5hbHo3?=
 =?utf-8?B?bXBwOTZmd2tjZndxYWRraHRwcnd4a0hGRWFRVUJyUHk4L1Z5TlpKUGNhaG40?=
 =?utf-8?B?UzdoaWdiWXlDcHlGVG12VzRldTlvRkxLUWZ4Q2NxWStkZnd2VEFJMEZ2ZWNE?=
 =?utf-8?B?TFR1M1p0MUlsZkE0Q3VvUWJ5OHUzSEVqTFJsaXVnR1pDc1J4NHFpOGhxVTc4?=
 =?utf-8?B?ZS95UHpzSHgxRTR6OXZRbFFvTHZldTU3TitaakhXMTcyVVNEck4rU1RsaFlu?=
 =?utf-8?B?STRlMEMyeVppSkx6TzZRejhyMDBkUFRZcU1Bb042bytQN0ZsUXpFWlZnZzI4?=
 =?utf-8?B?U1JPbmt1QlVYaThEUGFKbEY0VGV5LzNub3pheVlod3hDOTJKak1FdzlRdS9o?=
 =?utf-8?B?KzZZeUZjR2dRQmNiZXlnQ3BPY3pNaWlnQjNiYW91OGNSTVBxbXNqbk51Vzdm?=
 =?utf-8?B?SE9sOWtLT0VuUG1URGhTTytiMVBuWDhKM01vaXpvMmFHSmE4VXFhUVo1YWxG?=
 =?utf-8?B?UTZFYTk3ZEt4VlJrVk85RGJzRzBhWUdHQWhiTU9xOWVZOTd5Wjd2WjhRSGFH?=
 =?utf-8?Q?sN5a9rXANPdKxTNU=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe976b6-d88a-4980-9cb6-08da1c742add
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7775.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 11:04:08.8703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CpmRHKtQVTNwyJs3hDxcRKYO/oqtFtdfREonwPr94Uw4smm6El7WnTLE6Jh4pXHVIeqxehyNOtIeApKMzUvcXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7785
X-Proofpoint-GUID: Qg5DkIxBXmt6pnSK29-WtclvAWjjAwm0
X-Proofpoint-ORIG-GUID: Qg5DkIxBXmt6pnSK29-WtclvAWjjAwm0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_03,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=divya.garg@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Vitaly Kuznetsov !
I was working on hyperv flags and saw that we introduced new 
dependencies some
time back 
(https://sourcegraph.com/github.com/qemu/qemu/-/commit/c686193072a47032d83cb4e131dc49ae30f9e5d7?visible=1).
After these changes, if we try to live migrate a vm from older qemu to newer
one having these changes, it fails showing dependency issue.

I was wondering if this is the expected behaviour or if there is any work
around for handing it ? Or something needs to be done to ensure backward
compatibility ?

Thankyou
Regards
Divya Garg

