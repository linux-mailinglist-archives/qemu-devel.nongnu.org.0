Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515D34761A6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:24:31 +0100 (CET)
Received: from localhost ([::1]:48728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZt8-00057E-77
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:24:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mxZpb-00024o-OB
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:20:51 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:35592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mxZpX-00017K-SK
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:20:51 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFIGVsv003850; 
 Wed, 15 Dec 2021 19:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ppVZHsSRAFhFZ9w6sJb7UpdTOZLt421myeJFj6mrRig=;
 b=Fx3TxrcZ+DJOoQm6DoyOX8x7KMTHdb93116ckgYhw4VHQhvCFwpn6DPZVJhCZWRyKHkA
 fLFIQSPxYLhVRGw0BP2eTdTEITAJblv/QCWYHKBFjDZjI1RgEZvAxn2AtBQIw0MVlBd1
 GrI3A/8Ktxs5dvoSFi1ayQuVenRb8pCtxdLo07MsjLOPkTy7zilHm5PLredI5uU+X+a+
 2GGlYGr6EgtRdnhA7pABztj7FZMJQmATe7RmA+g7kH2hNFOBbrneV4CtzAA24FFQkTRY
 cIj8jzrVS7bzmoN9ols+jjNjFCDd6W9U9X72stjJIhSXismJve1eWVbfNZJcJbqPuNlZ 2A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cykmbgk6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 19:20:43 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFJGXc0048001;
 Wed, 15 Dec 2021 19:20:34 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by userp3030.oracle.com with ESMTP id 3cvh40nadb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 19:20:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0YI4ppSpEl9Hy5Oo8GRBjX1wnUXSjFddE8JsIkrlqOinWAIOOn0QnJN6kVt/bi8kF3KZUQVF0Yy3fojYayC2ZfiVq9d+DVIACeiGy167TFLQNUXMmdE5vnK3O5lMudk3bPyRHx4k50PV4TjTj5FHTfTL6HAJT1x1yjlpY2t13PBV/d4W/vGR5u434YDDNxeylGAkAQQxDW/Xb/eqW4bGOral0cKgue2ejCAnaXvOUMa2pOIfjy3oG1cSb5jQaanK1GONXhaeqBKgRw9yJMqsXr7AYQB4IysfUmFbiyoTp4jCt7IJNGjGacKIDlwG2+vcJjpGyKx86gfyvboTzeYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppVZHsSRAFhFZ9w6sJb7UpdTOZLt421myeJFj6mrRig=;
 b=buaauYrVnf9BsMVqB9A3YDywdr2WIUEOCPixP5K236oCKG8TCpCBuihCWZEwKWCDCuDXNrFlq8AMT2Mqx/r5bCV+Xvdw3h4d24uryZgMPghOzfR0013Pa+BvIjncrlEwM/EEkFnrkNj+1iAYLlzvQpWzVUxnWaTYpXZeEWfQNvvJRnpIBKvE0nydBpRT2mGy5mAsrfxTFOCzSx7h4MI8FPfnus5Y+laRizEHhA19uV4sPYw3k1OWYFR7MaNpeM7Qzz/4FS7Pu+p20WzXojTcXyKVfzm12OqoI8rwbOrn2rkHL9g5vyaxZvpssquZmd04aJI6I2ZvwbsuDtVyhS8ACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppVZHsSRAFhFZ9w6sJb7UpdTOZLt421myeJFj6mrRig=;
 b=L0Cprg4hZg1i/8oQkjDX7m/ZycwsT3hk5vDiKFK3mRGSmnaOfW6ZSYL+LV+JRTmpR1k2bRNgXoDmIicXQX0PhAUqSR8orRLDe87UL44ly3qJeujcZUqLz88HFuDwqMlXCDbFLGdihxLIZmz1OWrYKoxaLdDzPN1c1ViKKah5xaM=
Received: from DM6PR10MB2523.namprd10.prod.outlook.com (2603:10b6:5:b2::27) by
 DM6PR10MB4266.namprd10.prod.outlook.com (2603:10b6:5:210::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Wed, 15 Dec 2021 19:20:32 +0000
Received: from DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::99f0:c772:4eda:d1e8]) by DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::99f0:c772:4eda:d1e8%6]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 19:20:32 +0000
Message-ID: <1f85fe9e-0753-c35a-668d-3b6779bc703b@oracle.com>
Date: Wed, 15 Dec 2021 14:20:28 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/1] pcie: Do not set power state for some hot-plugged
 devices
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20211214215312.944-1-annie.li@oracle.com>
 <20211215060513.kugy3y32nj2te7ui@sirius.home.kraxel.org>
From: "Annie.li" <annie.li@oracle.com>
In-Reply-To: <20211215060513.kugy3y32nj2te7ui@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::13) To DM6PR10MB2523.namprd10.prod.outlook.com
 (2603:10b6:5:b2::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b171d2b-8076-4d12-61be-08d9bffff682
X-MS-TrafficTypeDiagnostic: DM6PR10MB4266:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB4266F89B23D1382C98FA835DE5769@DM6PR10MB4266.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lXaGAIjRcmKp6z7GVsgKRAGBUMmwC99JghExldEUK1Ay6PCC9NhLLvKOybkVBHgYAejFwEUR4RKf2EKSevdR7SjivyI36T5wtV0jcfZeDNAv/CU5YJpQWCAP+a4i9W7K6NFcMXbz3DIZ9PwwSjrjB4ePwDz14JDlCtFyMpVgLTWEys5i+WkYchIl9qpx/6BRXTUyuvwATwzq2Zv1dVxKfhT7dcw5A5fSJyMH2ua8rkfgcAUAQ3jWzFMqv4Kb5KlgEHoaGOznbwLqsJDQ8YcgBz9TobSm2rhb4rtEmkDCYw421Wd3SA4mFrtW0EAHJX/CudYrQFk9oCISrz1pSHg9U6fnmqWTiAPUTRYj0booxTsCh67Yx7Ud55g6i9wLMO3BANGBzVssZQOwa9LPEVSSlWgyncSb+uFLnTpQYdKyEjIBhWjIx9xI2pujlRKvq1fHpl/i6adtz3q3e1swXg7S08/zE5WcYdOCNsFzTXEFPI0NqKl6wsUTuoX95PMQmdbCjIm05BmBus7qpIoyinlb46c87VQ9MBsjmrL6oby0eTGwV9twmmBy3NTDfQWMw8iEN2Wwxh1HrVAD6e8g+i5pxCrZXrPk6eufi9vj5eClNmXOWbayG1L5/gvpzVN5TvIg9c6eREDVpCIF5mGEW15hN6VL1xlPNxUlQyzA9YMqdcpk4wbQq2yeshWCHYuZUOUx01Vz8Lrzoje8yTqYSYxXBxGcllZpeliOxSY4NwRR8sQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2523.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(26005)(8936002)(86362001)(66946007)(31686004)(508600001)(66556008)(53546011)(38100700002)(2616005)(36756003)(6666004)(5660300002)(8676002)(2906002)(4326008)(31696002)(186003)(6506007)(316002)(6486002)(6512007)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkNWMWhrZmZ0bzkxWWl2R3VRaC92WUhPZUtzNVhHNTUyQ0NETi9qMHE2RS9j?=
 =?utf-8?B?TFlFQlorVEJUVVp3QlYvb29EQkoyYkJOZTJlZE9FK2RrSjgxVGdnamROM01K?=
 =?utf-8?B?aGtVWGQzcmVURE9ibWVXU3BGQUFlTHpkNE8ySmg4dTg5d3hnK3VyWmNPS0Fi?=
 =?utf-8?B?SWRscnFmV0JYN2R5SE1OV2N3Qk1GMlQrQWRRVkdJcVVrMWY5QkpqbGt3TmVB?=
 =?utf-8?B?ZDFuc2JxZ1VQTkhqUWhnQUNnRlc1K0ZoWkhlbW8wbW81YWtEN29OVVZRL2xN?=
 =?utf-8?B?cDBaaitmSU9jSzhFQ29jK1ZjUE5xa2Z2U1VLdHloSVpBRjV0UDUxcEJxNGo1?=
 =?utf-8?B?NWtTM1pDa3prS3BxR2Z0bTdWNC9mOUFnRVVEdUUzT2R0SEIxRUNlOW9hb3Ro?=
 =?utf-8?B?N3FTdGFBWThwQ1IvLy9KZlJ3dVpzNzJ3eXBpTVZzS0pxVTc4RXRqbWlXdnVK?=
 =?utf-8?B?Si9CVHI3R0tlSmlJa3F2ZUNldW93bk5OcC9Vc3hVbWlQVFdPSk50eldXdHFo?=
 =?utf-8?B?Y2FINllRL0pQRjJ3bFh1TjNrcVFqTjlCc2NGRCtNUlpQR0sxejc5TWd1Lyt1?=
 =?utf-8?B?eFhMdVdRVVR2ZDdPUlBEU1FyaW1kbVA2dHhDM2lKY2VwOWtVK1lJR1RLKytn?=
 =?utf-8?B?VGJ6dUxCWHkyRXRYY1lWV01BaEkvQlV6MnR4ajNqSlg4U3BsaTVhUStmSHFu?=
 =?utf-8?B?TTEzL2lrTVpIaXJEcVlxSGRCU1BTOVlyellmbDNYNnZPMTlGbTZuZ0tZaWRR?=
 =?utf-8?B?QnJhY0ZWN0ZCVC9LN0txbUVMRE1HN1F2KzhPdFI3bjltb1lKWG9tdW40S3kz?=
 =?utf-8?B?UWN6RHZPTitmdnJoRGRUZzBWZzhyanFDa2FrR1R1Mm0wMmFKYjJxYUFmTDhq?=
 =?utf-8?B?aHpVbXV2cnBva0FmUUo4K05yQythZTBuZElld2d1eTBxb0VKSHQ2NFQ2YWdw?=
 =?utf-8?B?czZMVWpJSVFEcGI2RE9MR3RPUjdUbmV0aW5pbXpveStiRkV0UTJaRVNtc0g5?=
 =?utf-8?B?dE5TYnlFVkJkTlBwczJBaDVENHMvVjgzS3pYOUwwMElPY0dXbytsSVBKMDk4?=
 =?utf-8?B?UkhoQnBveUMxQk5xR1lxVXNMd1lMbVRXRlRPVG42TitINTE0MGpHMXBmcnV3?=
 =?utf-8?B?ZDgveTVvVVA1c0FYZzNPWit3bnBOQVcxcW1STWdGQVpwaE5UM3dGTUlpcE8x?=
 =?utf-8?B?WUtWQVFtVTRqWUd5N01SNDZuVG43bFZtc3FoKytaNG0vTWJvMnFicEVlZHVv?=
 =?utf-8?B?KzZJbVowZmI4V0tTL2dVS0hsaERGQm1xc0tBZlBVVXlPVGorbEN4SHZYYnB6?=
 =?utf-8?B?eGkrNkcxZ05DSGlydHVscmlSMXdQOFpiaUpzOEt2S21IZHBrTFFBQktNOERB?=
 =?utf-8?B?WnVJNWRRdmxqdXNkTDJ3d3FlVVkveVZrWEsrNXNuYmdIZHg0QkR0Vy9xZEVx?=
 =?utf-8?B?elBFTkgvVlZwV2xudjRlQjFNdUFNUjhsbmVrNWg1REFKZVVpTDFxMVdYVSt4?=
 =?utf-8?B?ZXJXT0xKNW1nMVhrNUJSQmlJV2tCWld3cEczT3hCalZ4Ly8wbmY4VXpYZjBB?=
 =?utf-8?B?QmV1ZjgxOWJJMTJRaTIyREM5NVlpbG0wcDJwMnFtZm1zT2grd3hreFBncnJR?=
 =?utf-8?B?WWdweENEbnpXSm1keU8zRURaWnJ2VXJ2akVzL2poc0FmYVlUa05pNG1zNDZs?=
 =?utf-8?B?bWRZWlZRNUVLUnZsendBWENmUDNCT1hLK1lOVHp4NnBjZFpRQ01sc3N3YlI0?=
 =?utf-8?B?WTdKTUk3Y2lsVXArMjNUZ1FNNnFidHZKeG55SzZpeS84OStLekhpNHIvNWQr?=
 =?utf-8?B?am90T0ZWbEFlejl5ZHRTaDQ1RU41Z1BaMHhaSHBMQ1dCdlhLOGhSalpDVTht?=
 =?utf-8?B?RUhzU0wrY0d4eFhjQTJZYVBUMThOR3JydlZpZFFocnpzbGRYYy9hNDMvbGRm?=
 =?utf-8?B?MGRSUkJtUjdnNkdheUF0MGJrUndBUENrbVE1Y1Zid205V3FmSE51THMrTVlM?=
 =?utf-8?B?ZnlUK3JlTktaT2MzV2g1cVkveXRrSVZERS9PSUpjRmx0SkQ2bkFKeGt0Nnpl?=
 =?utf-8?B?MTg4QXNGUWd2NHdQUzZlQlB4S2IyOTJkcWs2Z0dRbHVScnhkWkdLZlNMcWNw?=
 =?utf-8?B?QUYyWThsNkVqYUtTNDVRbmx3UDZzcVh0SDUwMmZWK0Z4YWVJdXY3aDdTeElt?=
 =?utf-8?Q?WRk7sPf5iVx3bQi2n+jgmPI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b171d2b-8076-4d12-61be-08d9bffff682
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2523.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 19:20:32.5441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9WFN0PnQszuAD8RZ5yipSNIR3Q3wbe117F6aO84v7ZKp038K4kNpfHDg+L+LuQXitr3lKMp82587LcYkGU20Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4266
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10199
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150107
X-Proofpoint-ORIG-GUID: Ma85IIis64vLFHyDABG5QIrhMZ7BGjp6
X-Proofpoint-GUID: Ma85IIis64vLFHyDABG5QIrhMZ7BGjp6
Received-SPF: pass client-ip=205.220.177.32; envelope-from=annie.li@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/15/2021 1:05 AM, Gerd Hoffmann wrote:
> On Tue, Dec 14, 2021 at 09:53:12PM +0000, Annie Li wrote:
>> After the PCIe device is hot-plugged, the device's power state is
>> initialized as ON. However, the device isn't powered on yet, i.e.
>> the PCI_EXP_SYSCTL_PCC bit isn't set to PCI_EXP_SLTCTL_PWR_ON.
>> Later on, its power state will set back to OFF due to the non
>> PCI_EXP_SLTCTL_PWR_ON state. The device is invisible until
>> PCI_EXP_SLTCTL_PWR_ON is set.
>>
>> This may be appropriate for general PCIe hot-plug cases. However,
>> if the device is hot-plugged when the VM is in VM_STATE_PRELAUNCH
>> state, especially the system disk device, the firmware will fail
>> to find the system disk. As a result, the guest fails to boot.
> Maybe we should just not set DeviceState->hotplugged = true for devices
> added in VM_STATE_PRELAUNCH?  It's not actual hotplug (i.e. device added
> while the system is running) after all ...
Simply not setting "DeviceState->hotplugged" doesn't work. Devices 
created in
PHASE_MACHINE_READY phase are treated as hot-plugged devices. So I just 
tried
following change for the quick test, the device is still invisible to 
the firmware with
this change.

static void device_initfn(Object *obj)
{
...snip...
-     if (phase_check(PHASE_MACHINE_READY)) {
+    if (phase_check(PHASE_MACHINE_READY) && 
!runstate_check(RUN_STATE_PRELAUNCH)) {
         dev->hotplugged = 1;
         qdev_hot_added = true;
     }
...snip...
}

Thanks
Annie
>
> There are lots of places checking DeviceState->hotplugged, and I suspect
> we have similar issues elsewhere.
>
> take care,
>    Gerd
>

