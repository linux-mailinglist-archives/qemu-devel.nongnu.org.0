Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A899C3CE8F5
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 19:46:52 +0200 (CEST)
Received: from localhost ([::1]:56262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5XLv-0007Ri-8C
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 13:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m5XJX-00061G-9b
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:44:23 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:28604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m5XJV-0006cq-8k
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:44:22 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JHgWkM024171; Mon, 19 Jul 2021 17:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=qHmC8PP31zD2q24b5exiv+TaCWe4pFxK7KXHyFXEndg=;
 b=bcTcHKzTg9EkE+9VcOkUBLxLEXMNsixKUa9UOdNouDlmv+dkRDBrGAx4a9sSgxPanDFs
 j9+ShgghQo3u5EabFQ0KAE1oX4Jh6Qi09Qh28QZStYdFQHUfU9P5Vlr9VVvWC3rBJGEr
 rb5vI5T2xeMmiOQI0dfell5Am0QxAqK7T9n8A8KDYIW1w9CerzXob+hdH17jUrcNyAGQ
 RayYtUHs6O5lo57iWVOu6BNC/yeU1TIH1WgbAA5raBo+bQFLUA0gqk+zGcy7JujdySPu
 dvvhVLh6wh+33h3WMvg0hXkWjrnbsyAGPWWIzqUbGg5qptYOyXzLZl2qyUyr4wEefzZG tw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=qHmC8PP31zD2q24b5exiv+TaCWe4pFxK7KXHyFXEndg=;
 b=fLY8zaR2+Mp/X+C4KWxbnaiSJYyMiPwqoi0NOBJ3pmWHqpntizybj2z6Cn9n2tckO2Xl
 n6s0ulKW6WeKMmXc5krj5V7MOVJJM1/Z9Bz7lB7GQDvO7ayN6gr4Fr4FeaXHci76U0Ft
 lCp3K6P2hss77hlVUT/t7GS49WR3JNZa1VWqObU5lgQWKf/Dr9/ETgLCFwkGb0OjL0gK
 vW8rRX3/ZSHvt+T67RCQ5kCY3UnK/C3ur+ACkuHAc5Zx6msyLGUZX4nidfSyUG9m6vsj
 Ftt427qRM2LM16j64V54PhSpqYQmAI6pyZOSMM/cvxS9mHW83ELiB1H4nsazpTEVbEuG Vw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39w8p0rs4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 17:44:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JHeFxZ174242;
 Mon, 19 Jul 2021 17:44:15 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by userp3020.oracle.com with ESMTP id 39v8yt3ehn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 17:44:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9FImfpLHQ/iL10kSUQnuUd/kRpxPZTxZgM9LF+wXDqhGQ9nR2nLtpWl1aFKy4liabD2hRB+r9ExAajIKJxwf3f3VczgCiwV0Kx4UJE+NKlwCNIT3WmTFepj7mqoFfYkWRvV/TX455VEOGrdCWos1MOLrviNEM0D8rq/1buw/L20JiCWgvh7T3JR9e7ChGXcvfhaLDKS5cUSxkHmvcqOj4qy09yS6YV8g2AnYSc0LGXqs9riDYSPTiizipTF1eG149cbniVD2H/pSxGgbYhoxStJSImE2chfcmQ4lyWObxR4j2BW9iIIlcdCFqfnS2rekeUK5loHs8i75mfSuSeK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHmC8PP31zD2q24b5exiv+TaCWe4pFxK7KXHyFXEndg=;
 b=nDdds6gaQDvJAkKa2VEoIMepJw+nWH5vkoX0PPr3+ZSe24FoJMeIAi85flm3kUxLCcYtY7Pj/WFtCaJu144Ju4fqBcoAspTvx7Beu2/l9574d5dya/DDfCi0yQsQaBanxh0psTp8nY/ZG8cNhwcv+2RlY3F0K5hsnoosewmECcdv1dd8fb6aMkSecYbtz5DegWNGfQKDxXq1MjfzTDOeLc4RZ6Bj/wow6pl+dDt1hFVE3FkVLoV9Z2vRdOFHBYhA0AbrVM7tUSeHtUAPPxhXqzUB4yeS4CP0WQED7qHwjTVQU5KQit6zPXDelE6FPKTGxaQ+MROA3vl5cQy3xdXP6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHmC8PP31zD2q24b5exiv+TaCWe4pFxK7KXHyFXEndg=;
 b=YX7xQUbB5/Jgqf55nc8KYNwMFopaHrOAXM80+rH872lXFBq+ZXZUwTyi4WYGZZyn2WeNFbkVqJxSc14THPyKFPBAR7XXgmxNwpE8gVpQyRQg3l/KJJmQ22CSDeme4CHAZringB4RM0we0SjHhqb5Yq7RDwuik3dlt3TenBFLSQY=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3655.namprd10.prod.outlook.com (2603:10b6:a03:127::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Mon, 19 Jul
 2021 17:44:12 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 17:44:12 +0000
Subject: Re: [PATCH V5 17/25] vfio-pci: cpr part 2
To: Alex Williamson <alex.williamson@redhat.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-18-git-send-email-steven.sistare@oracle.com>
 <20210716145133.4aa3f341.alex.williamson@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <be26577b-8df6-a8b5-fe06-ea33552aa472@oracle.com>
Date: Mon, 19 Jul 2021 13:44:08 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210716145133.4aa3f341.alex.williamson@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:40::31) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 BYAPR04CA0018.namprd04.prod.outlook.com (2603:10b6:a03:40::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 17:44:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 272c1ac3-38d3-4f30-8cba-08d94adcd1a3
X-MS-TrafficTypeDiagnostic: BYAPR10MB3655:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3655F2DD65B2E77C22C74A57F9E19@BYAPR10MB3655.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g+DQsmxnEZ7vnPIyIoFDlIuX1ADJYSVtpYzN12qC8Cuy5s2/67mB6eg7yV3EuraJa+SRBUXXURl6hqmN8CcwnxdX2yOaPhyM4fdSp//yUSlHMdKf3FY9SUAFF7HLix/xtPONcJ9EvtbHivs3Nvofbr7TB6SJK1ca6RsD+9qk+v0sSLlBo++R8a/9kFZH9ZOj3RE2tBNCBNrzpzo0/+gzFWBxFN7EyrNZ0OJzSRzMXx/bCk2YMtI70ocg7/+ljzQqESbnENpRGgDL/aUoUQBbyKXybP8dbUcW9wXvSG3HwncKnt7A6r1CUwd6sn6+L/O5Zq7uk/zQU1uNjY0MkuhmCn5E5nw0u/uQoNe9VNaluMXLh5WKdYra4CPbLVuWpjlA3FIf3tXDQFwz2g4p94XAsZ/9lH06NqpO03lLaJCLqrYh0AQ60ZDfFYakdHGKbx7UK3OPQyryy4QNzLRfLArxQC+cP4XWd4DRfa6LwD9rIOoyuPimBYS022q1oWiXsAYfDv9gA62lRugOqmCZobjkJPgrhs5vVj5TZGRaoKu7QlNPvxLmgUc9Hm0AJ26HTjr7/06DpfHwZSUNuYn2ohQyFj9JkSbEPrcD2dDssK+6lwOt289DAqCHQa9apW1C8e1Rz5riepjLIPK/sBzbE+ZBSQ7L6SNmGUUD+zFqnX555EiKv3HnrI577LhrskSh2Gu+SezxhCb3dlobK2kSZBVRdTqoInfyrlj4eueGnKNILP0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(136003)(366004)(346002)(376002)(54906003)(16576012)(316002)(2906002)(66946007)(66556008)(26005)(83380400001)(7416002)(107886003)(66476007)(186003)(8936002)(956004)(36756003)(36916002)(31686004)(6916009)(4326008)(53546011)(6486002)(38100700002)(31696002)(478600001)(44832011)(86362001)(5660300002)(8676002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXFPODBxYkRPa1VzU1d4YjUwdDVINzZ2UU1YUUQwb1U4anJYRTNNSDlnZThz?=
 =?utf-8?B?QkUzWWZkWk9RaUlTVlJNb3A3dkxWZ2pvUzYvSnMwekhsQ0Urd0xLWnRLZGhz?=
 =?utf-8?B?TXhyUlIwWmJFeEhWaE9IUFlQMTgyWnBKRnpXVkJBL1U0TERNRkErZG5MS3hw?=
 =?utf-8?B?MzVuaDlpM1drTVVtbFBJRmU4SzhzZndNQkllakRZZnR2WUsycTIvK0tjSC9r?=
 =?utf-8?B?SnBCVkxvUVVhSisvZ1dBUGw0NUZUQ3F4V1BYaVNlYkI2TmVQaUlxRTU5NFpK?=
 =?utf-8?B?djMzMXorN0lNZEFKcmpDVzliWnhOZ2tnaHRqU3hRTERKeVBzLzFFZDcyUkRn?=
 =?utf-8?B?T3FoaU9WSERJOTRNRG9FQWU0U3IyYTFRdGF3a2t3UWdObjY0NGlOUm1PUitu?=
 =?utf-8?B?dk10T0NiUy9vS3AwVzgyRFlmWTYyTG13a1dENzRrb3NrRzMyZmZFeXQvQXBG?=
 =?utf-8?B?SkJGVDZRT2hpOENJSkQ0aHZCVCtla2wzQVlmUGpiSjJ6NWhOTHdpRksrQnBa?=
 =?utf-8?B?Q1ZXVWZJOGtnQ0I3WHRVNHRLR0dackFXbzYzdVBTZFpnUDF1UnpsWFJ6dnMw?=
 =?utf-8?B?OWkxckxCdXVyaWhmRE9keU9zM1JWTjloT3o4UUZkN3Q2TjljT0IzanBTdTZo?=
 =?utf-8?B?ZFV4VjdoTGRSNUpHakVXWk9xSytrdUQ2dWtXSXp5LzlsNjdobFRhTkZybnpj?=
 =?utf-8?B?bGtmMnBkRXhQMGFZaE5wNURUdzhwd1J2WGxyMDRCV2VMUFp1ZDVNVm4rREdh?=
 =?utf-8?B?dnpNSmJDeTEwRnFhVHpBYUlNb0JHMUQ4QkdVZmhQYmRzTEhYdW0wMmE0dGd2?=
 =?utf-8?B?NkFic2tSSkpUekZsYS9UR0hNUU5zWWx5dzFpcnpVa2Z6MTM4aGJtdTJJa0xm?=
 =?utf-8?B?cmYzUmZQenRTNDNZaldScWUrYXZoTGVydWp2SCsvb3pXRk43VVYwQ0djWXZU?=
 =?utf-8?B?aUZnRnViSnVzUGMyWU1MbXluc3A5WXRJc1pxaVQ0TXBmVE0rTHVPUGVjbTF3?=
 =?utf-8?B?Uyt1aVVpa1ZvUHJzVG1mUW5wck43eS94UlAxZnVacGYxODl4Ykd0Z3FoTjlT?=
 =?utf-8?B?SnErR0k0NERXdmxKVGdDQU9lR0tKQk9kLzdaSkpkQ3BpT2Y3cmRSaVM2Wnhs?=
 =?utf-8?B?LzN1VHBadU1KT25RSlZZN0ZDNnFMaGhZRDRJUTJTSStPNmNKdFB6YjlLKzAv?=
 =?utf-8?B?WmpMV0trYVBUTXpaUU1iOTk3R0xEVlYvdVZ0QXhXeWdqN0hqTTJPWTRGdmxw?=
 =?utf-8?B?YmNoa05VdTJpYzA2dEdCSG4ybWpqK0c3RzJKRG9RQ1UxVFF0NFN6NTd6L0Yr?=
 =?utf-8?B?QjllV09pVGk3ci9UOUkwZ0JzZUFkYno4WUt4b2pnQ3lBR0VEb1RRYXdhSXhW?=
 =?utf-8?B?UmR3bnJMWjlnNWk1ci9WRTBKeVRuN0FONW9WWjFXZTk4dm9DTnRUcGZYMXQ0?=
 =?utf-8?B?WXIwVU4wR3Q3d1JBc3FpYTViYkxtRmVCVnBMU2UrcHJoR2M2VzYyTy9paTdl?=
 =?utf-8?B?SFRnU2Y0OVFpUHVqdXdDNS9HUkVKb25DN2hOK21adXhHQUtjSGQ5VEdvbkRB?=
 =?utf-8?B?eVZteWtEeDRTRkx3K29wR0lXSjNwaWVOc1FZR241bGp0YXRIZWU4NVdaaEMr?=
 =?utf-8?B?b2Y1QVlDajFkdUtpLzhXNE1CeFVxYTVRVE0wdTlLTDcxUzRJUkwzcU5McFp5?=
 =?utf-8?B?NkR1cDFWWlJqZGZaTG9ZYUJGRTR4M1RMK1hnRnNrNzFSK3N6ODFMeG5pbzk3?=
 =?utf-8?Q?Ry5WCpYKR88ZmUPMhCR/n0l1XfAzw7LkOnh7HNj?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272c1ac3-38d3-4f30-8cba-08d94adcd1a3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 17:44:12.2041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZeVhx48uGJxn6dcIaVtfyZ1SND/QDem4exnb8X8PD8KeG/f47kP5ToP92ZG+BUgTK9Pkqw6Ha5+g/xu8yiwcJr+7DTwFN3ZbnrPuju3w+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3655
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190102
X-Proofpoint-GUID: OyxsfSLDOOCqsEmxpJqwxDsT7q9OweYL
X-Proofpoint-ORIG-GUID: OyxsfSLDOOCqsEmxpJqwxDsT7q9OweYL
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/16/2021 4:51 PM, Alex Williamson wrote:
> On Wed,  7 Jul 2021 10:20:26 -0700
> Steve Sistare <steven.sistare@oracle.com> wrote:
> 
>> Finish cpr for vfio-pci by preserving eventfd's and vector state.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  hw/vfio/pci.c | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 116 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index 0f5c542..07bd360 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
> ...
>> @@ -3295,14 +3329,91 @@ static void vfio_merge_config(VFIOPCIDevice
> *vdev)
>>      g_free(phys_config);
>>  }
>>  
>> +static int vfio_pci_pre_save(void *opaque)
>> +{
>> +    VFIOPCIDevice *vdev = opaque;
>> +    PCIDevice *pdev = &vdev->pdev;
>> +    int i;
>> +
>> +    if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
>> +        error_report("%s: cpr does not support vfio-pci INTX",
>> +                     vdev->vbasedev.name);
>> +    }
> 
> You're not only not supporting INTx, but devices that support INTx, so
> this only works on VFs.  Why?  Is this just out of scope or is there
> something fundamentally difficult about it?
> 
> This makes me suspect there's a gap in INTx routing setup if it's more
> than just another eventfd to store and setup.  If we hot-add a device
> using INTx after cpr restart, are we going to find problems?  Thanks,

It could be supported, but requires more code (several event fd's plus other state in VFIOINTx
to save and restore) for a case that does not seem very useful (a directly assigned device that
only supports INTx ?). 

Hot add of such a device after cpr restart is allowed and works.  The next cpr restart operation
would fail with an error message without harming the guest.  However, I should add a check
to prevent the device from being added if only-cpr-capable is specified, in device_set_realized,
like check_only_migratable.

- Steve

