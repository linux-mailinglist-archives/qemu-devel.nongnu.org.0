Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B3D58C32D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 08:15:07 +0200 (CEST)
Received: from localhost ([::1]:55814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKw2b-0006BG-UA
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 02:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oKvzS-0004KC-05
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 02:11:50 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:64630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oKvzO-0002rp-6K
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 02:11:49 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2781VA1K032053;
 Sun, 7 Aug 2022 23:11:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=R3nVnZZB4pBXI6GC8SMsXYsk9G59YXDUR8xBsI4aPL4=;
 b=dSyEZMxp9nmO8ewfEECkPoeOv54ZrHOPU58P6+n2EYVp7en4hPvYw+G6h6zjjsBCMcFl
 bavDjYDUexbg1tVRI7F0XabXf6ACqOCgYHyK2B0MVmjY53TlfrwqSsKr1ycwGUKIwMre
 5kbf7rehcrmreDikdFDUGAWMTJz5QuxTKAFzAhrvFCs3NysQ6JZVl9aMztEtfkAY5biY
 cSl5hgl+nA0HHUqmmGlFciVJAIO79pfnVCWLIvCFmseNU+qdmDrMeycXcRIUR0gjbOfD
 VxDWtHTQRtJBt98sbrzz+mcn+d/mk7EXDTWn9YOk+Xk50csbRD0WSbukF3mdDRQS3ezb 0w== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3hsqv035ht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 07 Aug 2022 23:11:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpmBST0n23DMOT5uzR4DmtQpob3UXqtdqCR+PZd8hXycX1Jii4ZX6d96s8PnpTHkFg3Qa+EgPhB7ikoSnmVTABeEhu7ZHyomvgubuCMm1/K5XNVlmtssme9FADh27IfJU7azi6WTlJQPW4/OKL4VwwQ3aXrTy+c8fJyvyGuO2zFkR1mdiTr5A9fcENuNuZXRUEF0eCMbPU1qnvHiWO8oDcwTyPzHLLdEhimbE75Dos4t/pCUGwwXdyeBsMlOZEps4OiGWCmaYx6ozydOWbiTYp5rvONs4A0EhvC8+HzpFIXo63sUrZV51v1IgYHE7GUs3+bN1QYF1D0HM+mF0cx+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3nVnZZB4pBXI6GC8SMsXYsk9G59YXDUR8xBsI4aPL4=;
 b=Ow5qj7n8syRC5CxtI2C2W720hoN/3MaK1NKLrthBkaEJjfaV+jGyXAELgkRSg42Myd+s2Okc27qsAG6H0R7cmDUY71maVg3M+rLDIqDhmFvBb28E/BTJcGdEMp6woAO3Jqcal0PvKD9RaAYi38B8k86bINXx3QyWrwb5iqF+GvZW8Gssjhv55uz6H9aYqvOTQ8J5rOZDOP556gDOqOCGoOGnQ5AEG1tY8FcP4zeyH0du059G/PiQWa5YeHyquGO4HeFkYOwedNZF5Tax7hrw0YiYJ8bq5WlCCpkl6pTlp15c2VXyydk4JsY/FMBONz3j8epoJ/LKg362Z38EUz3Eaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by BYAPR02MB4486.namprd02.prod.outlook.com (2603:10b6:a03:10::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 06:11:37 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::b040:3fca:1bc5:c0dd]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::b040:3fca:1bc5:c0dd%4]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 06:11:37 +0000
Content-Type: multipart/alternative;
 boundary="------------adco6ZKjPApv0AGE9VwzjbHG"
Message-ID: <b20eec2e-1e33-15e3-ae84-346ceb05b673@nutanix.com>
Date: Mon, 8 Aug 2022 11:41:21 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/7] multifd: modifying 'migrate' qmp command to add
 multifd socket on particular src and dest pair
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, prerna.saxena@nutanix.com,
 Manish Mishra <manish.mishra@nutanix.com>
References: <20220721195620.123837-1-het.gala@nutanix.com>
 <20220721195620.123837-3-het.gala@nutanix.com> <Yt/MZiK3OuvQMRfF@redhat.com>
 <fb5528cf-ccf1-2c21-6899-cb503950d432@nutanix.com>
 <87sfmf84iy.fsf@pond.sub.org>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <87sfmf84iy.fsf@pond.sub.org>
X-ClientProxiedBy: MA0PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::9) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cc841c8-0f6e-489b-673b-08da7904d980
X-MS-TrafficTypeDiagnostic: BYAPR02MB4486:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ev9etEPaITx9za84zO5MtmXjtsuRQOIGu/JzT9mK6mu/PvK4HOw4eF5mP0TKOzYaGLchaaDsRI/2kKEnQ+nd3Exswv7oh+wv3LYeDOb2uj4BDuvoecpMQA6lpW0bhIkdWR81buaEJLjks3lFjWSLXUKvtNm/8LyPpugpjjP3a32hSslpIAOQF4rBiAw8bEiul3wYCqGdW0CSex6YMnD9PqU4Refa+EmNTqC77vGrJ88VvfMOA1CLf3fR7X3fN1mmYRo6aM9XCGcf6bpqmUESbTX0lP3cNrmNlWuTjFbkjU6+svTdnWsgyH+Colju8u6nmxok8kDOOo1MgHOXv+RRBYy7zrT0gneKpc6zYjfCLz8TZSexEQMVkSkCHrrQIFdxpwb4a5OZEuBchTYL2AwSPydi67rj1CLWbrjA6/N5Cdgk2k5Z/pKth7mpnUSMqGb4vNU9zfIKFvSmg6AUeLGFoTppv+UDbemefP/Pj/k1bTkmXNGArx1hJCSjoDV9VC/QUa+VW0m2pwKx/a0ZCO0ieBbXo+ZxmzbdH+b5xBtOPzeGAbThBFwDXXMHsphxK2a+3hsitJ67Qnkg/nVPi8Tb53LbI1SiRx+vy+GEplsK77evhiNZlzRSLBiFkMSmjr3k6FI82IVa1aYdYKdyjd8Az2UocwPDHhH56EBpwCcJXpoO1u9nYEt51aErrtDJ4y4qkrcdfUHa4QvMZF6M033PhOA3BL2vdx6E67/a9m4AGSyIheJXuaZgwgxM9wkIVpiHD/nzJSWYonZEk1lv+4tRmBEWS4R0R0WkOFrJbgKX17EFYy8eDAqHPV7xH2FFju0IctjTPRNG45p56d+osBkR3MmZ4605qOmfKFugYbt4Axo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39850400004)(376002)(396003)(136003)(346002)(366004)(54906003)(52116002)(31686004)(6916009)(38100700002)(478600001)(316002)(53546011)(86362001)(38350700002)(36756003)(41300700001)(2906002)(31696002)(6506007)(66946007)(44832011)(66556008)(8936002)(4326008)(83380400001)(6666004)(30864003)(33964004)(8676002)(6486002)(6512007)(66476007)(2616005)(186003)(26005)(5660300002)(107886003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3hWNk5vNElYVFVsNjRCYW9EQkVhU3dYY3JMZGRPTGJHSXUyUTR3d1NiWDM4?=
 =?utf-8?B?SnJTdXZIdG96Rk81VkdsNy93djNnNStpdjA3bzZxZ0NEZWhkdFFwcUNpb1NK?=
 =?utf-8?B?NVljaW1iSTY2SlpxM3RHM2dpV2lKd0Y5Q285YmVCV0Y3ZXZiQmdnaDUyWEUx?=
 =?utf-8?B?OXZMVE1LVUE3eE1WUWUwNi9lb01NRDZXcXRtRUhPTDlrTmRvZWwzYzh5aC9O?=
 =?utf-8?B?bXk3UXpYb0Q1UklJd2h2MzhBd1JJeSt4Ukl2T2hVQXV5WG9RZXVuUmppVXhW?=
 =?utf-8?B?dXFoZDNCYXlWeVcvVld2em9vODFXOFBPTGlMOHNQNXYwNkdxUWxMd3JSZUYy?=
 =?utf-8?B?Qi95M1U3WjBvdkF5U2Rld2FDeG8yM0xlcWZLZytvdTVtb1dwNTFiLzErcU0x?=
 =?utf-8?B?dEt1SmM1enRlYXJ0YTRrcXBKNCt1R0t3RnR2ZzZ6Um9UZmVQMXlONmF0ZDc0?=
 =?utf-8?B?eVZ2TkRMS0V6d3F2VitpZjlCdlY1c2RCVFlTVlR2cE1rNnY4S1ZzY1MrSE1S?=
 =?utf-8?B?WHFLMUNqcFB4VDNCVG9kTUFyekFFUDMza1pOUS8xb3ZiK1RRV0U4aGNIdEVX?=
 =?utf-8?B?emZ1TnZWTjdiVjRlV3dYZWM3QkpZRlVLTXdLV2NpZk0rR3ZnT0dUdjVQN0t0?=
 =?utf-8?B?b0JxaXE4TnpmeG1CT2RtdDlGbFprNkxqcmphUmZOWS9XQWRxQ21obWRIZUhq?=
 =?utf-8?B?ai9ieWhwVkhSWFRaK2g3VGlDTlZqRmI5Qkc2WU43RXEwTnJsNWRKck8yemRI?=
 =?utf-8?B?RUx5bXZ0em5iS1pEdnN2b3hpTmFmeEl1bTFPZFV1L0p3VjQ3MFBvdnpzdjNI?=
 =?utf-8?B?N2JnVnZ1M1lUcE9KVlo0VFlyV1Z2c3djTFY1VTl1cE9MelZXUDZUZDJyMldj?=
 =?utf-8?B?Z2ZnMnVLM1BkVHJxb0lYQmp0RjVSdjhEcmd4Z0JDcEdDRkh1c0ErTXV2ZEFB?=
 =?utf-8?B?N25senY4NHVFcTBMc0l4aldxQlcrRTl1dXBDS3dIWWE1NUxIcHgwTy9pQ1hp?=
 =?utf-8?B?V3FGRWxKL1htTmdFZUI1bXZkMG5zUjhnZFo3M0NKVjh4QW9jbzhsMWcxNDhU?=
 =?utf-8?B?RUJIeG1COUxxTWhMUklCTDNCeFpNUnFYcW5MZnFNSjExcCtGd0dnRWcxQm92?=
 =?utf-8?B?Mno4MTUrY0g5d01ETVlpa2VrOFFLSVpnTWhSL2ZlSG9UeXE1TlVPeFN1QkZa?=
 =?utf-8?B?N0xDZFhEalBqQTRhUFNpL2JZblFCRXJBZ0xDeWtidVNBYUhpcklqdmhxNEtB?=
 =?utf-8?B?SDlYZksrejI0YkxCQlRJeE9UZExzSHhjZlYwUnBSWEZDSVBxNk5FRVJNUFpt?=
 =?utf-8?B?QXZLd2lEMWdMV0piL0JvNEpEUSsrK1pVOVhrYUthQkhnSnJZckd6cUtRN2hF?=
 =?utf-8?B?UDVEQ0lZZmNUQ2l6Sko5NTlkYmlBYkdES2NNcWU5ZVpYY01BVmsyS25JbE5M?=
 =?utf-8?B?b0l4R2M2OTh3NWVwK1BCdUZ2QkZlQ3FOVkNTMlZSUWlDNzlIenQ4MFB0dHNR?=
 =?utf-8?B?ektIWkJwSk1oQU1Zb3VOVkZBNE0xVm9OU0plMy82NUpPbmsvalFaeW42SE5w?=
 =?utf-8?B?U0JZQ2dsSnlnck4zL2xaUXVRVUgreUdJYmNvdnJjZWdRdFZ4MGxmNENnNlho?=
 =?utf-8?B?OVZ4dXUwT0czcDk2TU44L2tmdkJwNjhZekFDMFhRMWZvTVd3QTBHeGZXQWtF?=
 =?utf-8?B?ZWs4ajBjNVZFUmUzcW5UVCt5V0VkVjBoOFg4UHhzMG1mM2hXNjErZDMxNGxL?=
 =?utf-8?B?VitKS2lsVVlCcHBmdjNWUUwyMWZnQjl2UGRJVFFYdHJ0ck9UVFBOMVdXMHFz?=
 =?utf-8?B?bGM3cTNqdGt2WXZ5L2xoZEdjaGJ5cEoyR1FEcllnSVFlQ2wvaGJvWFVlbGs1?=
 =?utf-8?B?QWN6UG9yRDhDSHlUNEtJV3hwa1FQWCtQWVpzVDIxYkl0NngzUU96emVUZmg0?=
 =?utf-8?B?ZW5hSGlaMGhiSVNuWE5YUzZpblpOaUdyMi9yWG9FRC9DRmlLRjRoYU9xRXNZ?=
 =?utf-8?B?b0g5UUUxaXM5Si9vMnFCTWRCeVdpaWoybUxmQnE3eDFBQzBXeXFxL1p4STU1?=
 =?utf-8?B?YUFtT2t1c05EMm5pVlhFWmNtdkZrTVNGL0kwMGxMblF1UWcya1N2bXN3djVN?=
 =?utf-8?Q?mrQdcPGa0fQRfGDu/f9hZqMOS?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc841c8-0f6e-489b-673b-08da7904d980
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 06:11:37.0840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48GPOnyglFYqJXXah0ya3Q9ngRyc0DcMYRNgDGLKofM1rN8eDRzpAio5iiGnborHK7MwARrhlfIoQFGXXNnavw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4486
X-Proofpoint-GUID: jfydFwPWi1NRyvxBIaAi1IIaoltdoPzE
X-Proofpoint-ORIG-GUID: jfydFwPWi1NRyvxBIaAi1IIaoltdoPzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_03,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--------------adco6ZKjPApv0AGE9VwzjbHG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 02/08/22 1:23 pm, Markus Armbruster wrote:
> Het Gala<het.gala@nutanix.com>  writes:
>
>> On 26/07/22 4:43 pm, Daniel P. Berrangé wrote:
>>> On Thu, Jul 21, 2022 at 07:56:15PM +0000, Het Gala wrote:
>>>> i) Modified the format of the qemu monitor command : 'migrate' by adding a list,
>>>>      each element in the list consisting of multifd connection parameters: source
>>>>      uri, destination uri and of the number of multifd channels between each pair.
>>>>
>>>> ii) Information of all multifd connection parameters' list and length of the
>>>>       list is stored in 'OutgoingMigrateParams' struct.
>>>>
>>>> Suggested-by: Manish Mishra<manish.mishra@nutanix.com>
>>>> Signed-off-by: Het Gala<het.gala@nutanix.com>
>>>> ---
>>>>    migration/migration.c | 52 +++++++++++++++++++++++++++++--------
>>>>    migration/socket.c    | 60 ++++++++++++++++++++++++++++++++++++++++---
>>>>    migration/socket.h    | 19 +++++++++++++-
>>>>    monitor/hmp-cmds.c    |  1 +
>>>>    qapi/migration.json   | 47 +++++++++++++++++++++++++++++----
>>>>    5 files changed, 160 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>>> index 81185d4311..456247af8f 100644
>>>> --- a/qapi/migration.json
>>>> +++ b/qapi/migration.json
>>>> @@ -1449,12 +1449,37 @@
>>>>    ##
>>>>    { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>>>>    +##
>>>> +# @MigrateUriParameter:
>>>> +#
>>>> +# Information regarding which source interface is connected to which
>>>> +# destination interface and number of multifd channels over each interface.
>>>> +#
>>>> +# @source-uri: uri of the source VM. Default port number is 0.
>>>> +#
>>>> +# @destination-uri: uri of the destination VM
>>>> +#
>>>> +# @multifd-channels: number of parallel multifd channels used to migrate data
>>>> +#                    for specific source-uri and destination-uri. Default value
>>>> +#                    in this case is 2 (Since 7.1)
>>>> +#
>>>> +##
>>>> +{ 'struct' : 'MigrateUriParameter',
>>>> +  'data' : { 'source-uri' : 'str',
>>>> +             'destination-uri' : 'str',
>>>> +             '*multifd-channels' : 'uint8'} }
>>>> +
>>>>    ##
>>>>    # @migrate:
>>>>    #
>>>>    # Migrates the current running guest to another Virtual Machine.
>>>>    #
>>>>    # @uri: the Uniform Resource Identifier of the destination VM
>>>> +#       for migration thread
>>>> +#
>>>> +# @multi-fd-uri-list: list of pair of source and destination VM Uniform
>>>> +#                     Resource Identifiers with number of multifd-channels
>>>> +#                     for each pair
>>>>    #
>>>>    # @blk: do block migration (full disk copy)
>>>>    #
>>>> @@ -1474,20 +1499,32 @@
>>>>    # 1. The 'query-migrate' command should be used to check migration's progress
>>>>    #    and final result (this information is provided by the 'status' member)
>>>>    #
>>>> -# 2. All boolean arguments default to false
>>>> +# 2. The uri argument should have the Uniform Resource Identifier of default
>>>> +#    destination VM. This connection will be bound to default network
>>>>    #
>>>> -# 3. The user Monitor's "detach" argument is invalid in QMP and should not
>>>> +# 3. All boolean arguments default to false
>>>> +#
>>>> +# 4. The user Monitor's "detach" argument is invalid in QMP and should not
>>>>    #    be used
>>>>    #
>>>>    # Example:
>>>>    #
>>>> -# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>>>> +# -> { "execute": "migrate",
>>>> +#      "arguments": {
>>>> +#          "uri": "tcp:0:4446",
>>>> +#          "multi-fd-uri-list": [ { "source-uri": "tcp::6900",
>>>> +#                                   "destination-uri": "tcp:0:4480",
>>>> +#                                   "multifd-channels": 4},
>>>> +#                                 { "source-uri": "tcp:10.0.0.0: ",
>>>> +#                                   "destination-uri": "tcp:11.0.0.0:7789",
>>>> +#                                   "multifd-channels": 5} ] } }
>>>>    # <- { "return": {} }
>>>>    #
>>>>    ##
>>>>    { 'command': 'migrate',
>>>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>>>> -           '*detach': 'bool', '*resume': 'bool' } }
>>>> +  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'],
>>>> +           '*blk': 'bool', '*inc': 'bool', '*detach': 'bool',
>>>> +           '*resume': 'bool' } }
>>> Considering the existing migrate API from a QAPI design POV, I
>>> think there are several significant flaws with it
>>>
>>> The use of URIs is the big red flag. It is basically a data encoding
>>> scheme within a data encoding scheme.  QEMU code should be able to
>>> directly work with the results from QAPI, without having todo a
>>> second level of parsing.
> Concur.
>
>>> URIs made sense in the context of HMP or the QemuOpts CLI, but do not
>>> make sense in QMP. We made a mistake in this respect when we first
>>> introduced QMP and implemented 'migrate'.
>>>
>>> If we going to extend the migrate API I think we should stop using URIs
>>> for the new fields, and instead define a QAPI discriminated union for
>>> the different data transport backends we offer.
>>>
>>>        { 'enum': 'MigrateTransport',
>>>          'data': ['socket', 'exec'] }
>>>
>>>        { 'union': 'MigrateAddress',
>>>          'base': { 'transport': 'MigrateTransport'},
>>>          'discriminator': 'transport',
>>>          'data': {
>>>              'socket': 'SocketAddress',
>>> 	   'exec': ['str'],
>>>          }
>>>
>>> NB, 'socket' should be able to cover all of  'tcp', 'unix', 'vsock'
>>> and 'fd' already. I'm fuzzy on best way to represent RDMA.
>>>
>>>
>>> IIUC, the desire of migration maintainers is that we can ultimately
>>> have multifd as the preferred, or even only, mechanism. Aside from
>>> the main outbound migration control channel, and the multifd
>>> data channels, IIUC we have a potential desire to have more channels
>>> for post-copy async requests.
>>>
>>> This all suggests to me a more general representation along the
>>> lines of:
>>>
>>>     { 'enum': 'MigrateChannelType',
>>>       'data': ['control', 'data', 'async'] }
>>>
>>>     { 'struct': 'MigrateChannel',
>>>       'data': {
>>>          'type': 'MigrateChannelType',
>>>          'src-addr': 'MigrateAddress',
>>>          'dst-addr': 'MigrateAddress',
>>>          'count': 'int',
>>>       } }
>>>
>>>     { 'comand': 'migrate',
>>>       'data': {
>>>         '*uri': 'str'
>>>         '*channels': ['MigrateChannel']
>>>       }
>>>     }
>>>
>>> With 'uri' and 'channels' being mutually exclusive here.
>>>
>>> This whole scheme brings in redundancy wrt to the 'migrate-set-parameters'
>>> API wrt multifd - essentally the same data is now being set in two
>>> different places. IMHO, we should declare the 'multifd' capability
>>> and the 'multifd-chanels' parameter deprecated, since the information
>>> they provide is totally redundant, if you're giving an explicit list
>>> of channels to 'migrate'.
>> Hi Daniel. Initially while brainstorming this idea for the first time, we also came up with the same thought of depricating the migrate
>> API. But how will we achieve this now and how is it going to work. Is it like we will be making migate V2 APIs initially, integrate it and then
>> depricate the old one? would be happy to get some pointers from your end.
> Migration maintainers, please advise.

Hi Daniel and other migraton maintainers: Dr. David and Juan, what is your opinion on this. And how can we go forward implementing this. Some pointers and ideas from your end would be helpful too.

Regards,
Het Gala

--------------adco6ZKjPApv0AGE9VwzjbHG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02/08/22 1:23 pm, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87sfmf84iy.fsf@pond.sub.org">
      <pre class="moz-quote-pre" wrap="">Het Gala <a class="moz-txt-link-rfc2396E" href="mailto:het.gala@nutanix.com">&lt;het.gala@nutanix.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 26/07/22 4:43 pm, Daniel P. Berrangé wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Thu, Jul 21, 2022 at 07:56:15PM +0000, Het Gala wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">i) Modified the format of the qemu monitor command : 'migrate' by adding a list,
    each element in the list consisting of multifd connection parameters: source
    uri, destination uri and of the number of multifd channels between each pair.

ii) Information of all multifd connection parameters' list and length of the
     list is stored in 'OutgoingMigrateParams' struct.

Suggested-by: Manish Mishra <a class="moz-txt-link-rfc2396E" href="mailto:manish.mishra@nutanix.com">&lt;manish.mishra@nutanix.com&gt;</a>
Signed-off-by: Het Gala <a class="moz-txt-link-rfc2396E" href="mailto:het.gala@nutanix.com">&lt;het.gala@nutanix.com&gt;</a>
---
  migration/migration.c | 52 +++++++++++++++++++++++++++++--------
  migration/socket.c    | 60 ++++++++++++++++++++++++++++++++++++++++---
  migration/socket.h    | 19 +++++++++++++-
  monitor/hmp-cmds.c    |  1 +
  qapi/migration.json   | 47 +++++++++++++++++++++++++++++----
  5 files changed, 160 insertions(+), 19 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 81185d4311..456247af8f 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1449,12 +1449,37 @@
  ##
  { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
  +##
+# @MigrateUriParameter:
+#
+# Information regarding which source interface is connected to which
+# destination interface and number of multifd channels over each interface.
+#
+# @source-uri: uri of the source VM. Default port number is 0.
+#
+# @destination-uri: uri of the destination VM
+#
+# @multifd-channels: number of parallel multifd channels used to migrate data
+#                    for specific source-uri and destination-uri. Default value
+#                    in this case is 2 (Since 7.1)
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
@@ -1474,20 +1499,32 @@
  # 1. The 'query-migrate' command should be used to check migration's progress
  #    and final result (this information is provided by the 'status' member)
  #
-# 2. All boolean arguments default to false
+# 2. The uri argument should have the Uniform Resource Identifier of default
+#    destination VM. This connection will be bound to default network
  #
-# 3. The user Monitor's &quot;detach&quot; argument is invalid in QMP and should not
+# 3. All boolean arguments default to false
+#
+# 4. The user Monitor's &quot;detach&quot; argument is invalid in QMP and should not
  #    be used
  #
  # Example:
  #
-# -&gt; { &quot;execute&quot;: &quot;migrate&quot;, &quot;arguments&quot;: { &quot;uri&quot;: &quot;tcp:0:4446&quot; } }
+# -&gt; { &quot;execute&quot;: &quot;migrate&quot;,
+#      &quot;arguments&quot;: {
+#          &quot;uri&quot;: &quot;tcp:0:4446&quot;,
+#          &quot;multi-fd-uri-list&quot;: [ { &quot;source-uri&quot;: &quot;tcp::6900&quot;,
+#                                   &quot;destination-uri&quot;: &quot;tcp:0:4480&quot;,
+#                                   &quot;multifd-channels&quot;: 4},
+#                                 { &quot;source-uri&quot;: &quot;tcp:10.0.0.0: &quot;,
+#                                   &quot;destination-uri&quot;: &quot;tcp:11.0.0.0:7789&quot;,
+#                                   &quot;multifd-channels&quot;: 5} ] } }
  # &lt;- { &quot;return&quot;: {} }
  #
  ##
  { 'command': 'migrate',
-  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
-           '*detach': 'bool', '*resume': 'bool' } }
+  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'],
+           '*blk': 'bool', '*inc': 'bool', '*detach': 'bool',
+           '*resume': 'bool' } }
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Considering the existing migrate API from a QAPI design POV, I
think there are several significant flaws with it

The use of URIs is the big red flag. It is basically a data encoding
scheme within a data encoding scheme.  QEMU code should be able to
directly work with the results from QAPI, without having todo a
second level of parsing.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Concur.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">URIs made sense in the context of HMP or the QemuOpts CLI, but do not
make sense in QMP. We made a mistake in this respect when we first
introduced QMP and implemented 'migrate'.

If we going to extend the migrate API I think we should stop using URIs
for the new fields, and instead define a QAPI discriminated union for
the different data transport backends we offer.

      { 'enum': 'MigrateTransport',
        'data': ['socket', 'exec'] }

      { 'union': 'MigrateAddress',
        'base': { 'transport': 'MigrateTransport'},
        'discriminator': 'transport',
        'data': {
            'socket': 'SocketAddress',
	   'exec': ['str'],
        }

NB, 'socket' should be able to cover all of  'tcp', 'unix', 'vsock'
and 'fd' already. I'm fuzzy on best way to represent RDMA.


IIUC, the desire of migration maintainers is that we can ultimately
have multifd as the preferred, or even only, mechanism. Aside from
the main outbound migration control channel, and the multifd
data channels, IIUC we have a potential desire to have more channels
for post-copy async requests.

This all suggests to me a more general representation along the
lines of:

   { 'enum': 'MigrateChannelType',
     'data': ['control', 'data', 'async'] }

   { 'struct': 'MigrateChannel',
     'data': {
        'type': 'MigrateChannelType',
        'src-addr': 'MigrateAddress',
        'dst-addr': 'MigrateAddress',
        'count': 'int',
     } }

   { 'comand': 'migrate',
     'data': {
       '*uri': 'str'
       '*channels': ['MigrateChannel']
     }
   }

With 'uri' and 'channels' being mutually exclusive here.

This whole scheme brings in redundancy wrt to the 'migrate-set-parameters'
API wrt multifd - essentally the same data is now being set in two
different places. IMHO, we should declare the 'multifd' capability
and the 'multifd-chanels' parameter deprecated, since the information
they provide is totally redundant, if you're giving an explicit list
of channels to 'migrate'.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hi Daniel. Initially while brainstorming this idea for the first time, we also came up with the same thought of depricating the migrate 
API. But how will we achieve this now and how is it going to work. Is it like we will be making migate V2 APIs initially, integrate it and then 
depricate the old one? would be happy to get some pointers from your end.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Migration maintainers, please advise.
</pre>
    </blockquote>
    <pre>Hi Daniel and other migraton maintainers: Dr. David and Juan, what is your opinion on this. And how can we go forward implementing this. Some pointers and ideas from your end would be helpful too. </pre>
    <pre class="moz-quote-pre" wrap="">Regards,
Het Gala
</pre>
  </body>
</html>

--------------adco6ZKjPApv0AGE9VwzjbHG--

