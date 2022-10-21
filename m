Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FE0607B68
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 17:42:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oluAI-0001fn-BX
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:42:30 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltyM-00029v-Nr
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1olty8-0000Ga-3K; Fri, 21 Oct 2022 11:29:56 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1olty5-0004jV-Lh; Fri, 21 Oct 2022 11:29:55 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29LFOVk1025871;
 Fri, 21 Oct 2022 15:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=oU7Noij1VbaOOgbdHlebwbSkhRV/ns4Af9c3PmZxEWs=;
 b=pUhIvTzklQWMsREDcQkJWIuV7D7q1tRhp+DM9RIKH0nhVp1SrhZ0+Z3U1dylrUb0MkAZ
 BHNOKgAI7Aqtxm99oOBvPeWutfb5r7HqsStXlraasBHJEJTUS8AmzvmkVay/XzLzFg0N
 BqTtoUdo3J8tLXRGg7obQmNmt0qxjlC0vp+XmjefbBaS7OWpcO/dar5RD1CzMuCfZDHC
 cbFXEsOa4XtaUcYqHsl5ZqGeV37xusujCDr2Bf3ibNyL7r+mW/H4ds4DNzNEGD2APyi3
 i23rTYlGRJLGGCNKallB69X5a+AZx355vqLeyh7lj5tIPydS53JVKn8Ug7nqoz9rY/Ct pQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k7mu091hk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Oct 2022 15:29:39 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29LDEqPS014690; Fri, 21 Oct 2022 15:29:38 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3k8hu9ukpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Oct 2022 15:29:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FD8tkAUD3g+icwIqUItcWUOOfxzr1L7Jr/fXifA6ulHTvHmTK/sA9GfXjIMsDa26VSFJg1yjtNHWyg1cSETmjdvLjoEh/smm4OeNMGfb72oZb4OHlo3jyDqf9EBzfu1Xmb1KS7oXp8V4mo4crnzong9rgr1erHc3ydwnkkX5cqSqky986SmWtROm4f7d4iBkSXeYqG1AQUZFn5VDwu+vKKt8HHpL0BtZbbtwU4sZNr2u42UyGEJcgnKIc071TQuE12e4vwa07Iey6oPu9PeJ1UEC/3PMM2ibyy0JlrPl9vd/BoPshTZbaNr4RLB3Legole1MXyQMWs9RjV5C/O/PQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oU7Noij1VbaOOgbdHlebwbSkhRV/ns4Af9c3PmZxEWs=;
 b=MGNZhidl2eulbzOhPFTaH2r8JTUodXDpEdxDhz2bdV4NSSfBuzTiPnJvZdTrJaklyB1mtyzEU9Y6w1Jox3GmRr5d+h6Tc0235QNkDIUKXGNgj+J26Q/lmc1dt3hhv6SbdUHWn4djXcJIqg/HZJ657C74vQWQBtcuBm10OgziPph4xCzosbZKU9lO8fqPdR4DhB+Gp67HcQj8s8x/UmRK0Cgf0WH+ZMmvLTX8VbJAdMKEUAJXk/NtAt26XrHZUV1u/1wqsocqqQACXcFlRG676p2nlwY8vzUjWTBpTjwf5Bc2A6F9IdHhUKnH6e5Muc1zxAoWulPfKWIuHy3LbDXEIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oU7Noij1VbaOOgbdHlebwbSkhRV/ns4Af9c3PmZxEWs=;
 b=yQxWQDuCVIFbsNf0SYzlveArkNiWMlU6hYM1ZoElOFMeahR6zesmL3ZL3cNWv6smF1xxysrTIuSi9XFcokYz84LnZaT2x9ytoWsqf7gQo9Fg7O3pmUh9hB+NkA8e3PBmdg69X/lvVeRu6SoAraAjjNLRhm7RO7u23ka5ytJJbnU=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4546.namprd10.prod.outlook.com (2603:10b6:303:6e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Fri, 21 Oct
 2022 15:29:34 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::f7b2:af85:fe37:31a7]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::f7b2:af85:fe37:31a7%9]) with mapi id 15.20.5746.021; Fri, 21 Oct 2022
 15:29:34 +0000
Message-ID: <5135b287-1d88-8fbd-7765-e717193ad9fe@oracle.com>
Date: Fri, 21 Oct 2022 10:29:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] hw/acpi/erst.c: Fix memset argument order
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, "Christian A. Ehrhardt" <lk@c--e.de>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
References: <20221019191522.1004804-1-lk@c--e.de> <87r0z3dnsn.fsf@pond.sub.org>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <87r0z3dnsn.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::13) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO1PR10MB4546:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b69eb1-abf3-4792-a559-08dab3790e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qkvGSRSMWV3iqVDP72rn4sdDzdPE9Y6auxhpSLit8zNoDB4YtCccIG59FaHOtXTD159JoPTHD/ixQoxq6Ndl4jecxtQBrZ+hW4usLSVZnflYwrs3m2Wn8bXZmnvtMakW5QzVK7vgNtSoVtGnY8ol8GS0Ac+26NS4vVOJAIz1hSDwqAOPsn4Load9yYaW6CAIZbtl9eoIcFF13/YfEQWHoDb2YFp9QWfQ8oEyGJdsCAfkHWtQhSfkgFz+LonxMumUt3RblPxAv37u8UNQeYinVCTGUQ0uU1Pscs8yYv5PDJxelWJw4zVnpN6bolsR1zkrPQoUFUaG76ehf+A9SqWaqxER9I9Vi7aDvwtjaGcO+0IUcP5GXfcvF/wogMXmBIxwee4Q9XuRNR28ikbw38MwjpTO4sP4GxOTKNb11NzZSfFrgA5ME6BW+ASw0IDsaKVvd8bPijtgJxineS+nwO7UxzmJLNxBHozCaPsOjE5T0vwgUvBF30iz5EE6MGqPe4bNGftsZqpsnppfcoYuoXpaGn+ve+b9Y0MWUZ8IZ21/qUSqGaEuoUvZj3JClbqcEjdy8ljjac5WyGG82Y7ll7z4JqyJHSBBvT0KMqES5qTOq3zRICYhLhRbPeYXZWTO2YGokMOkRu8c302gDVmrfbiC0zaIHs5rXe4wb+06Ca1Yv0MKTtRk9iczsH9zVBcRDbLDseN3TXw5j6FlVDXEdiT60SLGk77z3mjvE9hFmpuZ5X8itc5RUWd6a321AT4gBC5Czj0DGdIqFovq64Pk60ioTkq4IN9ktV3PYRG8mSrfZ/Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(316002)(2906002)(83380400001)(31696002)(86362001)(38100700002)(4326008)(66476007)(54906003)(41300700001)(66556008)(8676002)(66946007)(6486002)(8936002)(2616005)(5660300002)(110136005)(6666004)(186003)(53546011)(478600001)(6512007)(6506007)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VndOYzJuYXhvbEdudHJSUmtOWm1VUlRyWEZFZWpKWWZPU1FPUUNNOHk5S0Zs?=
 =?utf-8?B?eDY4VWlkSngvMkVRNVFmYko0TkprNTBJZm9UOFpocVZoRUs3cWZnc2FMRFdx?=
 =?utf-8?B?VkxQYVBHTTcvREdGZmVyeCsrT2FaQlIxRFlTNVBrZHk1WjQzYWM1UmdvMTIw?=
 =?utf-8?B?ZWUzZnNGQkFjb3NwSnlQMGZWZU5Bb1lWVlZuWFoyTzYzYmM1K0dseEJ2SDdR?=
 =?utf-8?B?WWV3Qm5vazM0clNhVERkZXh3THVsMG9DRDdQSlRtUHBTYzlEZm5QZEZuNGZl?=
 =?utf-8?B?UkNsOXQ5eEdqckJveWlraHhxNWloZXJDT1ExMGViYW13a3AxWkZKMVRvVzdX?=
 =?utf-8?B?azB6N2tCb2Q1SE5Db210SXRCTWxuMFRuV0VzcXd5MDRPenlUMVFReUpHU2hN?=
 =?utf-8?B?eUdBZGhqNnA3U1lDMEtFVjg1ekpMUW9ST0hsQVViVGplTVlTN0NBU0Z2Qyti?=
 =?utf-8?B?MHlHamhmODg1NzBQRlo0ZWtxbDY1WmhXL0M2TVkzUSs5YktaeElFSHM3cFNJ?=
 =?utf-8?B?UnVmeTFtVHpNcDVuM1ZNbTMzYmpCZE5tY2JlRDJab1lqbi9FQU1Kdnh2U2hQ?=
 =?utf-8?B?d1JGNE5GYUMzQnlZeGNITFBYTVlpaUtzd1VrS3B5K2lPT1pMVWVUaGV6MHRQ?=
 =?utf-8?B?Y1lHN0JVbURRWkQ4VEpUL2JQd3RSRW1CK1dPbFBWN2VlZEpjUSt1OHBsRnVW?=
 =?utf-8?B?MTE0Y0JOY0daMHBJaXYreThLM2JIZDVpWWJQdEpPdjN0NjlxOU9MYnpQRXdw?=
 =?utf-8?B?aVlrOCtZbGFCaEVTU2lTL25CZ1BLRG93dnNTSDNRM3dCeTVwNEppUmFiQ0ht?=
 =?utf-8?B?NGlYQ3VubXlhamN0RDdmUUFWN1pJQitrZjNxNTkwYUZQaHFaSk1ZNkt6Wlc5?=
 =?utf-8?B?WGJNcjV1b01tY2lBalcva0pEV00rRmFXNGtEQVJGbE9OYjU2T3paeUJjQkZt?=
 =?utf-8?B?K0tKNzQ1NGl3TjZmQTdIZStPUXQwMkJqOW1QajhaYjBuNi9PUk1Ud0tPYy9R?=
 =?utf-8?B?L0JrYmtiUG5vcmE3YzBEdHNLYWh2Rkg0V1c2VVRMNzhRcENuSW9URWsySDF0?=
 =?utf-8?B?WHVGYTFPaGNVa3cwUWxHdmh0QjNqWU03SU9SUE4ySWRWTGJycUxHcHFwODYx?=
 =?utf-8?B?ZEl4VHNGN2tUbFoyQkYrSjBWOWs0d1B6bUw4aEM3QkYzZFZ1eEZJN28wb1dv?=
 =?utf-8?B?dVU0YVBUOG5JcGhjZk0yYmZkZjJGSkFYM3IvYis5WCs5N1pnUkJnSmd0NUZl?=
 =?utf-8?B?V0JmU2tNM0p5YU1IcWxieXNSMFpFZTVWQUNDblpEMVZLQUtBZXkydGJreDN6?=
 =?utf-8?B?d3NMd0lUMC8xZUgybG5qa0VRTGlBRnlFMHlNYmFrbC95WTdGdWZQQTZkSTZv?=
 =?utf-8?B?Y3JmTTZsVFRYRytCbmVrQWI1VkFLNC9IeVAwbmltdDdFRUx6YkhoZVJJOGtp?=
 =?utf-8?B?b1NsczlabTVTVzk1SmNBRlhZdm42SFcxMDNBUlljMkZiVE5qTWx0Mlh5aHZo?=
 =?utf-8?B?MzNiZzFZTmM5bmtCRjFqUTJDWFgxR2U3ZWtGK1M3WXEzRkZQVmUxU05sUTN4?=
 =?utf-8?B?U0srUUZSM2xQdkk4d0lDWlg0eS9LaitRaTNhdmFkSDZiY04xV1lyZFowc1ow?=
 =?utf-8?B?ZHN0d3crV3BlWC9pTFpzR09ScGRpUjg0L1dIMDJ2U1IrbU9oK3hqRUx5RXBX?=
 =?utf-8?B?U3hjR3NJdkRXT2pIVWZXZ2wvODJrdXJoNVU2UVc0b3Y5UnAyNzk4aEo3cXpr?=
 =?utf-8?B?aXE1MVhWYTRwdWJHTS9zYnEyZlRBOGpMb3dQME1nL3N6SnRmNGlaQzNDaHVo?=
 =?utf-8?B?amk5S1JSWFlrWHJzWk56MXJJb3o2R0RRL0lBUkVWRzcvTnU2NllURGNQMWlI?=
 =?utf-8?B?ODVkSEhDdkVUV2ttbWZXZlc2VFJHLzFPRHFRbi9Eay9GOEJJU0RyZXNMQ3Ba?=
 =?utf-8?B?NjZkUSswcy82WDZtYzZEaHl2WkhERVg2d1pqZXJ3MVNIamMxVDZPaVFRRHo2?=
 =?utf-8?B?NFJraVUxLzNUSCtBZ0tkNXJNY1FmM056UXRnRWdIVUZqNEE3clE5SVoxWEZX?=
 =?utf-8?B?dExkb3Y4clh1bmI5emFBbGhXY21KYi8xbCtuM001UEN5VHRwQXdmY0NaeUxW?=
 =?utf-8?B?NUlxTk5nU1loMkZaaDBjM2J6dEt1YU5YR0VFbXVjbEZsbDV0STFta05qcjRp?=
 =?utf-8?Q?x6i1z5meRcP1i47ZAtJ4y+0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b69eb1-abf3-4792-a559-08dab3790e40
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:29:33.9441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YB1xsdSqPjjHvvDLJclrCkqxUU6rMxLkaGv6sgGOq8zsfLU689izKxKBsgQmaybFIH2htn/EovrNrnMmOhxijYKb96sIEbz0UgNxUcOGWZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4546
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210210092
X-Proofpoint-ORIG-GUID: vhLFodiNp7iPxqEmL6tN6j9Zmur1GPub
X-Proofpoint-GUID: vhLFodiNp7iPxqEmL6tN6j9Zmur1GPub
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/20/22 01:14, Markus Armbruster wrote:
> "Christian A. Ehrhardt" <lk@c--e.de> writes:
> 
>> Fix memset argument order: The second argument is
>> the value, the length goes last.
> 
> Impact of the bug?
> 
>> Cc: Eric DeVolder <eric.devolder@oracle.com>
>> Cc: qemu-stable@nongnu.org
>> Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
>> Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
>> ---
>>   hw/acpi/erst.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>> index df856b2669..26391f93ca 100644
>> --- a/hw/acpi/erst.c
>> +++ b/hw/acpi/erst.c
>> @@ -716,7 +716,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
>         exchange_length = memory_region_size(&s->exchange_mr);
> 
> This is the size of the exchange buffer.
> 
> Aside: it's unsigned int, but memory_region_size() returns uint64_t.
> Unclean if it fits, bug if it doesn't.
> 
>         /* Validate record_offset */
>         if (s->record_offset > (exchange_length - UEFI_CPER_RECORD_MIN_SIZE)) {
>             return STATUS_FAILED;
>         }
> 
>         /* Obtain pointer to record in the exchange buffer */
>         exchange = memory_region_get_ram_ptr(&s->exchange_mr);
>         exchange += s->record_offset;
> 
>         /* Validate CPER record_length */
>         memcpy((uint8_t *)&record_length, &exchange[UEFI_CPER_RECORD_LENGTH_OFFSET],
>             sizeof(uint32_t));
> 
> Aside: record_length = *(uint32_t *)exchange[UEFI_CPER_RECORD_LENGTH_OFFSET]
> would do, since UEFI_CPER_RECORD_LENGTH_OFFSET is a multiple of 4.

Igor requested I use memcpy() so that this would work on EB and EL hosts.

> 
>         record_length = le32_to_cpu(record_length);
>         if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
>             return STATUS_FAILED;
>         }
>         if ((s->record_offset + record_length) > exchange_length) {
>             return STATUS_FAILED;
>         }
> 
> This ensures there are at least @record_length bytes of space left in
> the exchange buffer.  Good.
> 
>         [...]
>>       if (nvram) {
>>           /* Write the record into the slot */
>>           memcpy(nvram, exchange, record_length);
> 
> This first copies @record_length bytes into the exchange buffer.
> 
>> -        memset(nvram + record_length, exchange_length - record_length, 0xFF);
>> +        memset(nvram + record_length, 0xFF, exchange_length - record_length);
> 
> The new code pads it to the full exchange buffer size.
> 
> The old code writes 0xFF bytes.
> 
> If 0xFF < exchange_length - record_length, the padding doesn't extend to
> the end of the buffer.  Impact?

The purpose of the memset() is to ensure the slot does not contain any remnants of a previous 
record. There is no functional requirement for this; other than it was intended to prevent the 
possibility of leaking data.

If there were a previously deleted/overwritten record in that slot, then the tail of that record 
would remain. However, it still isn't visible upon the record read; it would only be visible by 
directly accessing the backing file/memory.

> 
> If 0xFF > exchange_length - record_length, we write beyond the end of
> the buffer.  Impact?

There are two cases here, if the record is stored in any slot but the last, then it has the 
opportunity to corrupt the next adjacent slot/record. Given that the CPER format places the magic 
'CPER' as the first 4 bytes, then I believe that upon next read of this corrupted record, it will be 
rejected as it does not have a valid CPER header.

If the record is the last in the backing storage, then it would attempt to write beyond the end. The 
backing store is memory mapped into the guest, so I believe that an attempt to write beyond the end 
will result in a segfault.

Previously stated: "Well, this is a memory error, i.e. the potential impact is
anything from silent data corruption to arbitrary code execution.
Phillipe described this accurately as "Ouch".

Yes, ouch. I had it correct until patch series v7 (of v15); not that that is helpful.

However, I do not see a path to arbitrary code execution. The erroneous memset() will write out a 
constant value (exchange_length - record_length) for 0xFF bytes.

In terms of current Linux real world impact, ERST is used as pstore backend and writes to pstore 
typically only happen on kernel panic, if configured. Furthermore, the systemd-pstore service 
attempts to keep the pstore empty, so that reduces the chances of pstore/ERST filling up and 
reaching that last slot that could cause a segfault.

ERST can be written by MCE, I think; not sure how relevant that is to guests.

eric

> 
>>           /* If a new record, increment the record_count */
>>           if (!record_found) {
>>               uint32_t record_count;
> 

