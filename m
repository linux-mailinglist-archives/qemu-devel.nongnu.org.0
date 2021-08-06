Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47F83E28D2
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 12:43:28 +0200 (CEST)
Received: from localhost ([::1]:45964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBxK3-0000q3-Nf
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 06:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1mBxIv-0007mB-PX
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 06:42:17 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:36832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1mBxIt-0006os-4B
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 06:42:17 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176Aexkp000825; Fri, 6 Aug 2021 10:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=J6R00PlfNQv/EykShvzVEJcS2binxz6LvNjH6eAjRHU=;
 b=vtnHW0e3996udbUO0YjFnKxRWdrN07VA99x6SMEH5sszS47vzo/GsNh/oMcQ0RO5ouWu
 jdoaCWlSSwWvofdw6w8ywsEQ3QegF1IMUyCIgf1LjLZG2H6SCX6orKhAk4wLXGo2MFRn
 PRWlF6T0TbhxG5xwQIWmMLAWLv0MfGmaSyQzW1kGK7mShf6Sv2jLFbIeN+R4fVxXdOve
 PU1B7QdfAo16U7JrCeOB3VU3U7KUJSsXP9a5NOYztjn9UnZNYjsBF8NnqfPhp1GyO2ZK
 antPFK20sF4ZBFEEhRikq2jwgI4LAwYsAIyJzTPLiY9osamH/B9NW3M0RcPmIvbqCQuq Dg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=J6R00PlfNQv/EykShvzVEJcS2binxz6LvNjH6eAjRHU=;
 b=nbUdwTGfAC0GNMih4KK/H7zss600215yenUCD3Q2EB8UxQvezEGuQQuZgonGXuTm+LOP
 bRD2bwRFTm85IMTL3u/awiC9AxMPGe9d8Byd1a9JlbPE7HCgUaHLl5S39kU8PfXcbwWV
 wio/e7TWMsEGRYxKoNbHXFa9Jy0ckqSkA/KzsYw8XReNVnnQpD/fJmeAJT/1gcOxArEi
 WZaigM0aybbI+tJMSYVPC6UTCL7OfFtGJFnkI4V6E2WqkagZTSH8bYk4ZWi+c7X+ggFv
 tZhbTDqnL6Rl2Yxb2238RY+6XaIhb1hpHf450KcOehe1YxwUTWApdNRZxtIWSEYbDsl3 Xw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a90jurf6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 10:42:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176AfjSf128619;
 Fri, 6 Aug 2021 10:42:04 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2173.outbound.protection.outlook.com [104.47.73.173])
 by userp3030.oracle.com with ESMTP id 3a4un5j410-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 10:42:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikKZJAFXp5zJ98UzQLGYtY3XvnKa89Y+xowP738HHdci+dZ6tUDUFTY7u87Qs6bkw60CbAQ7yQGQK6EUB9kXhkzzMqhocPwPjmJ+sdHgocls3XcZTFInbDxLl2hLPKzmY9nDjm/5iZGtz/DhI0VvKjoK9+q8bzgA0vGzYmdRKiJvXAqdOyaHnMfk/tk+hmHTD1RJErtBbNwrZKf5hILem39h+/uyU3XqdOhaeeYZHAnPVsQ/HG2py6bhOD0OfuPhbJMSiYpJl7+f/OmQUjPzxtaWvSawHKCtmzCI1f6sa5BeYlRqAN6QtTmBODqBQWQlHkdQlmwVzYsiGkvMCK/NCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6R00PlfNQv/EykShvzVEJcS2binxz6LvNjH6eAjRHU=;
 b=FLesato4xLIVjp4GhFwZ8ue09Z7l6zzl47+4iIdET2dPSyCoWF5lxNCilxDQGB/tp5+0Rtsl2y48lX7j6Yxe4fC5pJJ7WijC11jOHQ7wYpw2QDUi/WxRKzccJg3oj1jwjmihHdhHG9Er1EYGu6CewcpWbEpJpAnsMumGvEJIptUdK7S6PY3CFXBV3dgaAorao+VZ3rnhPpf/8FTFkvO2DJ7uxqeBzDfQH90OuMpFUd8jzE2MyLozDqrpEPrBiIwEbilrqQPT/bhnxtBwKAFf/yZPm7EVRkOQIBZL4MzxZ5MqFEJWAa//FOB2sbWbLa0w0T8UDEutYCD7apsq2Y/iKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6R00PlfNQv/EykShvzVEJcS2binxz6LvNjH6eAjRHU=;
 b=MOLK+Fqs9O/ZRhY6jIB3oKHWuKyWRw2z0iYcAHC4ZUNL9AOpsU7/oB/x18q9SF0UNEzBZV82SY0l4YxxkSOSg+BjRRB5yUQoB4jZjRW0jgZGkCjP820LiZ64b6b5/sLF/7JpMA8Yj5+8RVCSzCp+GNufT9v/0QqHx9RcuYxelyM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MN2PR10MB3791.namprd10.prod.outlook.com (2603:10b6:208:1bb::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Fri, 6 Aug
 2021 10:42:01 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::31f7:93c3:6886:1981]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::31f7:93c3:6886:1981%4]) with mapi id 15.20.4394.018; Fri, 6 Aug 2021
 10:42:01 +0000
Subject: Re: [PATCH RFC 1/6] i386/pc: Account IOVA reserved ranges above 4G
 boundary
To: Igor Mammedov <imammedo@redhat.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622154905.30858-2-joao.m.martins@oracle.com>
 <20210623091138.2f7828dd@redhat.com>
 <ea55dc1b-b48a-3af1-be03-e72abc358f46@oracle.com>
 <20210623133954.2be8f24e@redhat.com>
 <a8668c8d-22c5-6168-3f29-3f5055d99c32@oracle.com>
 <20210628163232.5669563c@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
Message-ID: <4bd8bccb-37e0-bf57-3848-1f00ef14e1ad@oracle.com>
Date: Fri, 6 Aug 2021 11:41:56 +0100
In-Reply-To: <20210628163232.5669563c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0448.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::21) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.67] (94.61.1.144) by
 LO4P123CA0448.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a9::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 10:41:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3160086-61a2-4f2f-c56f-08d958c6d23b
X-MS-TrafficTypeDiagnostic: MN2PR10MB3791:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB3791E3FC56E4F4D1451CD24BBBF39@MN2PR10MB3791.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: evHrAworTn6gmecrP6TrlgJGGbLYli5BHiCtYPNIyjVkXrWmVOTQgq8r8tg6S+LXqkTtHRGLUFMB2qpMLd0LJuR63fUMDUEX8clTbzP7Bniz9zjg6m2z4/8DG7puoQmW9Nhr929Dak9dnkApFWldICcDpG3vA93xNjR1t/3IWfgGCRjsETXD9/+vrwJDgC9smeT0j1PFC/bw/QeT74o/wx7rUWuM6d4hl0C0szYqtrNwoUEswd7G73gMWQmQtocnYs5u9o1IPyln11aW8dKwdb7PpmSYkzPr/f88iwtPXF2GWrzAImlzYlcTcN3OSqCDbVY2eZjrVyFy5eAGRhYdYo/KDqxFxjGFW5Ch0HnoqQN+K8W3ZxpjsJR5sEL8eF0ohvfHIzTDZno6bvII6DE22SbpYc6Ra/lXq9uwT/3aKvqFlPj96roJUcmHMUXC3qIak7nI3aJyQFIkaw5qxMlLIP7f+cC8NsFly7cMVgqUGzLMtrUWxwCh0KvbwWtpE34cSG4ZSJMg/B0wVoD5nsRjw/U6vOu/sQ6ZjMnW3rh/9/NQp8W8qjLgXgUw4I4ql3NqDeFV1N7G/8hOKnU0ZNkrZGIJWh6BSnqiaUkdhbyi7SgFFzRaKEMXvfZbyJNqiCt2j9mUi9mrodjYc5BiWr46mHwh8lRVHyoECB4XmCQC2y2Jw0G42IlWx7gBghzQnF5x4R/KNonUiH1SjOifMYSK4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(136003)(396003)(39860400002)(15650500001)(478600001)(316002)(16576012)(31696002)(86362001)(83380400001)(38100700002)(956004)(2906002)(2616005)(4326008)(36756003)(66556008)(66946007)(186003)(8936002)(66476007)(26005)(8676002)(5660300002)(53546011)(6916009)(31686004)(54906003)(6486002)(6666004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEh4UnNBMjN0aTFGWWIvSnludXJ0TDh1MkErNVA1T3lmMkdRTW4xNnVUTVpq?=
 =?utf-8?B?MTZFVlJuY0hjTnh6OUtSaGx3Snh3d1JmWHE1bXJsRGxnT2NHMkRIRlhleFhl?=
 =?utf-8?B?WE5QUXBPSWZWbFV0b0lNZTkwMTJ3VytucW5jMlRBQWp5VXoyaFdrTTlIZTFu?=
 =?utf-8?B?VTFSV3NXYWxSVGF0RngzcEZNakE1SndjN3F4dHFkVUZFRk1GbWdlSjlvNzEr?=
 =?utf-8?B?L3V6WkJlMTJpc2RxRlJaQWVsTG45M0tWSnY1dUZnUnI0dU1iV0NkWXBEVTll?=
 =?utf-8?B?Zzd5YXlNdStXUjQyUGpRVS9ZclRUd1BTZitvWHpmS3lsSHBxeWNtNW45QnpS?=
 =?utf-8?B?RWVKYmgzWnZ2YlU3QXJPYVVEUnZlMTlBY21lRzZkY1c4N3V3Q3Z0d1czdU92?=
 =?utf-8?B?aEJRd3lqQllNeWVwdS9SVDNzWGxiM0h1M1pJSGdjV0VESTFRWFNwQTh1R1Nl?=
 =?utf-8?B?VllOU2txYXZONnFwcGd5NERBT200bXVNT2YrUzFBbGN4OVRRdHVZQWYvWk1G?=
 =?utf-8?B?aERuL1NRQ1hVL1VLTHcxR0Urb1hvRTdMSkVGckNneldmRWI0THN0c0NqUkh1?=
 =?utf-8?B?ZXRIVTBpWjF4TmFJdUZEOHhUYTNUWW1KbzRpZVhRYlNZajNkcm5YRzBtM0Q2?=
 =?utf-8?B?eXF0NWZ3RmZKaCtXaHlUVk0wYlM4RHhyaHNBUWhXeVA0dnNub2ZmeWJNZm4w?=
 =?utf-8?B?ZFhLZ3BrbFZvbVIrWS9Zc0l4VnFsMjJBWGlGMElYTmcvNFA3bU9IZkFUUDhW?=
 =?utf-8?B?QVQ3YUcxcTdZRER6VDAxSDYrYURmWnhUb1o2Y0FoOE5FVEk1aiszWStZTXFi?=
 =?utf-8?B?dThjbzAxWGxBNjFPNHFSQlZQbTRaWDlhTXlaaHNrMDBYMC9MSzk0NlRaeHBl?=
 =?utf-8?B?TklEenE1eURjdDF6c05GQVFZeHZnemVCcjFkRGxNYUN2ZXZRNzl2L1AyS1Vw?=
 =?utf-8?B?TWhJSW42VThQM3pJU0xMZlhmOUtZaWx2OTJ3aW1SNit1cGdNZ3VkOEV0ZGpL?=
 =?utf-8?B?Ry9tcGFlb2RZblp6YktQV0ZnVGxWMk1tOGd6WkNPSkFPaEZ4dm9yazY4Z0xJ?=
 =?utf-8?B?NWlXMTZZUjRlejBuaXVjOThzbkMvOTF0bGc0Nk5sejBNdU5GK0VZWmM4Zys1?=
 =?utf-8?B?MG9NazM4THdwWHhPcmRtRHZaZlNoYmZWbldTWTQ2OG4vMnZpQkxuNkR4SEdi?=
 =?utf-8?B?Qnl2Qk1HcEJOdm9IWGpraUloclp1ajFoSURRZHAraWdJNTVJcWMwU2pjbWYx?=
 =?utf-8?B?bDdVN1FRb3c5K2JKd0svVE5Ta004S3BMeXNCblM2YlZVOHBJNDVGbnNVNUhz?=
 =?utf-8?B?QmlqeFpXNVFrbEx4Q3prVFUyWTI4S1ZyZ1BhTjJjWHZRMUJ3UnErZlVPdzh4?=
 =?utf-8?B?OWQvcXpadUE1ZFZFZjZxNFJNK2l2OC8yb2FnUERYYjdlNUEwUis0ZldENFRk?=
 =?utf-8?B?bDdvbFFjM0pBWFpwS2l3cXplOTExR25FM29lbFZGZU5reGVySXVKTFlPYldn?=
 =?utf-8?B?cGVtRE9GM2srWFNwZWt1dFc4c1N2TmJUem5qNEFlYVJHeXdVcG5zZXJzdjF1?=
 =?utf-8?B?RjNUUUo1MGlpY0MrWmlQN0tidlNZZk9SbEJFcE5pVVZUVHgxblEwMWRESFMx?=
 =?utf-8?B?Qnd4QVBzU3FrR3M2bHpVOVVqdDlPcG9BYjhvcDRBd3NYbVF0SmhMZldjRHZS?=
 =?utf-8?B?cXVtMy9FUTV2TjM1M2xBaGgxaFh0SWt0UkdvaGV4TW5xbHFTRHZMcE4rTkpY?=
 =?utf-8?Q?rm1eRfSONsUdl5tMZdg7zg499Ru/JpHd8F33/Hp?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3160086-61a2-4f2f-c56f-08d958c6d23b
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 10:42:00.6225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elZnv+gP3vOuP7ryS6D4NN8pLzXJ6BhICxOpyxTnAWBZb4AcwtEmpOK4UvC1Wvb1ZrRXSP4xP/vQYHsbdvUMRFW7yGPRhv9GLkiH4/+Oto4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3791
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10067
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060076
X-Proofpoint-ORIG-GUID: apvdpJGHEW_-9Rs6UkZ6EfCLG0nAv_Dl
X-Proofpoint-GUID: apvdpJGHEW_-9Rs6UkZ6EfCLG0nAv_Dl
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[sorry for the thread necromancy -- got preempted in other stuff
 and am slowly coming back to this]

On 6/28/21 3:32 PM, Igor Mammedov wrote:
> On Wed, 23 Jun 2021 14:04:19 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 6/23/21 12:39 PM, Igor Mammedov wrote:
>>> On Wed, 23 Jun 2021 10:37:38 +0100
>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>   
>>>> On 6/23/21 8:11 AM, Igor Mammedov wrote:  
>>>>> On Tue, 22 Jun 2021 16:49:00 +0100
>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>>>     
>>>>>> It is assumed that the whole GPA space is available to be
>>>>>> DMA addressable, within a given address space limit. Since
>>>>>> v5.4 based that is not true, and VFIO will validate whether
>>>>>> the selected IOVA is indeed valid i.e. not reserved by IOMMU
>>>>>> on behalf of some specific devices or platform-defined.
>>>>>>
>>>>>> AMD systems with an IOMMU are examples of such platforms and
>>>>>> particularly may export only these ranges as allowed:
>>>>>>
>>>>>> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
>>>>>> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
>>>>>> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb)
>>>>>>
>>>>>> We already know of accounting for the 4G hole, albeit if the
>>>>>> guest is big enough we will fail to allocate a >1010G given
>>>>>> the ~12G hole at the 1Tb boundary, reserved for HyperTransport.
>>>>>>
>>>>>> When creating the region above 4G, take into account what
>>>>>> IOVAs are allowed by defining the known allowed ranges
>>>>>> and search for the next free IOVA ranges. When finding a
>>>>>> invalid IOVA we mark them as reserved and proceed to the
>>>>>> next allowed IOVA region.
>>>>>>
>>>>>> After accounting for the 1Tb hole on AMD hosts, mtree should
>>>>>> look like:
>>>>>>
>>>>>> 0000000100000000-000000fcffffffff (prio 0, i/o):
>>>>>> 	alias ram-above-4g @pc.ram 0000000080000000-000000fc7fffffff
>>>>>> 0000010000000000-000001037fffffff (prio 0, i/o):
>>>>>> 	alias ram-above-1t @pc.ram 000000fc80000000-000000ffffffffff    
>>>>>
>>>>> why not push whole ram-above-4g above 1Tb mark
>>>>> when RAM is sufficiently large (regardless of used host),
>>>>> instead of creating yet another hole and all complexity it brings along?
>>>>>     
>>>>
>>>> There's the problem with CMOS which describes memory above 4G, part of the
>>>> reason I cap it to the 1TB minus the reserved range i.e. for AMD, CMOS would
>>>> only describe up to 1T.
>>>>
>>>> But should we not care about that then it's an option, I suppose.  
>>> we probably do not care about CMOS with so large RAM,
>>> as long as QEMU generates correct E820 (cmos mattered only with old Seabios
>>> which used it for generating memory map)
>>>   
>> OK, good to know.
>>
>> Any extension on CMOS would probably also be out of spec.
> ram size in CMOS is approximate at best as doesn't account for all holes,
> anyways it's irrelevant if we aren't changing RAM size.
> 
/me nods

>>>> We would waste 1Tb of address space because of 12G, and btw the logic here
>>>> is not so different than the 4G hole, in fact could probably share this
>>>> with it.  
>>> the main reason I'm looking for alternative, is complexity
>>> of making hole brings in. At this point, we can't do anything
>>> with 4G hole as it's already there, but we can try to avoid that
>>> for high RAM and keep rules there simple as it's now.
>>>   
>> Right. But for what is worth, that complexity is spread in two parts:
>>
>> 1) dealing with a sparse RAM model (with more than one hole)
>>
>> 2) offsetting everything else that assumes a linear RAM map.
>>
>> I don't think that even if we shift start of RAM to after 1TB boundary that
>> we would get away top solving item 2 -- which personally is where I find this
>> a tad bit more hairy. So it would probably make this patch complexity smaller, but
>> not vary much in how spread the changes get.
> 
> you are already shifting hotplug area behind 1Tb in [2/6],
> so to be consistent just do the same for 4Gb+ alias a well.
> That will automatically solve issues in patch 4/6, and all
> that at cost of several lines in one place vs this 200+ LOC series.
> Both approaches are a kludge but shifting everything over 1Tb mark
> is the simplest one.
> 

I understand that shifting above-4g-mem region to start at 1T would
be simpler and a lot less to maintain considering we can eliminate
most complexity from finding holes to place RAM ranges.

Let me try your suggestion.

But I'm still somewhat at odds that we have a gigantic hole from below
[<4G ... 1T]. I have nothing to base upon *right now* so nothing more
than a void concern, but hopefully there isn't assumptions elsewhere
in OSes/firmware and etc.


> If there were/is actual demand for sparse/non linear RAM layouts,
> I'd switch to pc-dimm based RAM (i.e. generalize it to handle
> RAM below 4G and let users specify their own memory map,
> see below for more).
> 
It seems less prone to error if we learn to deal with these odities
with the pc-dimm based RAM (longterm). At least it would open
other avenues Alex suggested in the cover letter. And more importantly,
let represent all this closer to what hardware actually does (which is
what I was attempting with this series)

>>> Also partitioning/splitting main RAM is one of the things that
>>> gets in the way converting it to PC-DIMMMs model.
>>>   
>> Can you expand on that? (a link to a series is enough)
> There is no series so far, only a rough idea.
> 
> current initial RAM with rather arbitrary splitting rules,
> doesn't map very well with pc-dimm device model.
> Unfortunately I don't see a way to convert initial RAM to
> pc-dimm model without breaking CLI/ABI/migration.
> 
> As a way forward, we can restrict legacy layout to old
> machine versions, and switch to pc-dimm based initial RAM
> for new machine versions.
> 
> Then users will be able to specify GPA where each pc-dimm shall
> be mapped. For reserving GPA ranges we can change current GPA
> allocator. Alternatively a bit more flexible approach could be
> a dummy memory device that would consume a reserved range so
> that no one could assign pc-dimm there, this way user can define
> arbitrary (subject to alignment restrictions we put on it) sparse
> memory layouts without modifying QEMU for yet another hole.
> 
Yeap -- sounds a whole lot more flexible longterm.

> 
>>> Loosing 1Tb of address space might be acceptable on a host
>>> that can handle such amounts of RAM



