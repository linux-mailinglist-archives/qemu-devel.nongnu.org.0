Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA1C3D13CD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 18:17:59 +0200 (CEST)
Received: from localhost ([::1]:34642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Ev0-0000vY-4A
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 12:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6Es0-0007M3-LM
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:14:52 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:17260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6Ery-0003SF-Pp
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:14:52 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LGCjV9018132; Wed, 21 Jul 2021 16:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=CyLugtTqgjpU3JYwLMN3ET/TwtnJscJllUIsBQJyEwc=;
 b=B0gQ3EBi3iFlU9xUf6AiUEvouSLUezhgYtOH1dWlvRc2VZBU55bbQoYIl3yD5cq7T5Qw
 //0wKUHhHAVK2Oal0vbPBM6e3DZxL6qtqNBTbzLmKMitBTFp+2xubLgsHNWzvb7uzD7U
 QVECBg6HQjgwCWD6IFNNI12MGZKx7zroe3jIG9fLgX7xTCtap7ND2o1M2y+35LWa69oV
 oY9noLWyyKRSCWW9ukjgvZLaABtRRuozJALviUh1eaOTR3qDlXuiNXPuUBjI9klaS1tL
 96m9rMHzv10bI6SvNcR8zqvu+njvwqwxO6T7i8lQbN87VKwotqRQrU6J+8is97yCR4V4 aQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=CyLugtTqgjpU3JYwLMN3ET/TwtnJscJllUIsBQJyEwc=;
 b=GUC+XiCT3bgfX6r3tYB5kQ2CAOu2jZHHmTBJZW4af/tBPu7sKc9uFat4kFXEgkyrv97r
 S1IG7DsNWmn9nxmHhYD74xtuIoIv83f9Hf/84en/jk3J8SJdpL9VKeVNpx9I5zHaNPt2
 8scNDERI84QDljzJCAjd6pjRUmM381h664gh23BXxJG+XWo6lrOjS9MHdfKCudJQu6A9
 0RKenv0gyiL2U0cXJHNWo6MtB9c+rSeel4BcITs2zvHgTVuecqZr7BmzxhcvAJnF2Kue
 aTN4+wp4upo6qG4Dc7QPpGCyoUF1JFT+mSyDRespFVPjtpww4nS/ogYvpZvVdJCYPxL0 UQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39wvr8b9ds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 16:14:49 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16LG6Q97136063;
 Wed, 21 Jul 2021 16:14:48 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by userp3020.oracle.com with ESMTP id 39v8yxpq8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 16:14:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvY6TBdo57uQup+SeoWh2wa9F0sPZNQ0c7vEAEWupi6JgUy6gNNTkelIMhs8Mc7qYuJTugqYxKKBMsZtWejr5N8c1ZIxq/+R4uSJ2n/cF1wOBKlUtQ/RTckROb5bh4ddGATJwfGaZSczOhIPB4AgXehknAm5FqwmKiQydMiXO9vBmzGCR+4tBhroVPVytFC73pwEIjIm0IQivfINAJ9mqY1nit2G3zaTryFNiUMT2mVYwEc+wTJyC0KvcAFtUEifz8g+DxMSAMFoFmzDJnRj/SkGZV9UvPlSzMwNqSLQZMMI25BD3U3RxCFsJKKyqYkoMfMQaT+Ho2fbS6OEyaFTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyLugtTqgjpU3JYwLMN3ET/TwtnJscJllUIsBQJyEwc=;
 b=HMpIluPUjKEbhqKt9PciqZAEpNkgUR5XOWHnnMmoVGgtsXBzSFVnBcDL0Nt7xIsSnoXtMqbZ8Vle6fPd3m/BPiEmknin6xw39CFOIjZYl3fCbhebJ5t6fhaut+RogU8m9DFHhgVU0S9gG0wKbTePoLkqozl1/qMBwaPrny1zDINs3Z+XjEQEuTHrc4JPz0ly72D4C/UladJxSimWh9HYr7B77SRxwStculxKjy9y/2ZLyW5IBHH2yFZGP/md1iuxCUzxouPBNVwg8b0dyLRYW8xWn22F0RCQTaKWt3O+EfcZp3sj3SDxHJATNA7/R9ejEXOf77jLUiOLLBqbnECuow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyLugtTqgjpU3JYwLMN3ET/TwtnJscJllUIsBQJyEwc=;
 b=gxv1pMiKeKLpudIUt9dZFUsPjG0zxMR/lcJIYWfba45WANLBELS1dV1sdpdqEMYyoC/+4dhc6mObXK5av9LMZ2t3y8UJ79nzsI+/UX6z/Uz9+wMFbZZikgTsdWANiX9CyPfIbLIWlyoHeUikBhtAYs13q7IzQCBo1jV0O9zqssU=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by BYAPR10MB3655.namprd10.prod.outlook.com (2603:10b6:a03:127::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Wed, 21 Jul
 2021 16:14:45 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5%9]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 16:14:45 +0000
Subject: Re: [PATCH v5 07/10] ACPI ERST: trace support
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-8-git-send-email-eric.devolder@oracle.com>
 <20210720151509.7fd47f31@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <00e755de-0435-9eab-e447-e199f40e328c@oracle.com>
Date: Wed, 21 Jul 2021 11:14:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210720151509.7fd47f31@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SC1PR80CA0074.lamprd80.prod.outlook.com
 (2603:10d6:4:67::25) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SC1PR80CA0074.lamprd80.prod.outlook.com
 (2603:10d6:4:67::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Wed, 21 Jul 2021 16:14:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddfd918e-c297-4cb2-ac25-08d94c62a7d5
X-MS-TrafficTypeDiagnostic: BYAPR10MB3655:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3655A1C9E73E834BB30A8F7597E39@BYAPR10MB3655.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5x4tTL76OQ8skWYsj2T8QsnlHdAcIDZUM3HENplLRIThUEoN6pKNS5NqZAN3hYKwS6/5StB/vwwjhWyQ0q3r6975RuCaeULzPsNqwkYn+HtScmezMTHuw+J7OFdp1USnmA2vzEfLlBDzyvhMPmdWSSgG6sE+zokEy+FeuXFJG8NEkozKMEr0kPrZ6MvurGfkQvIykCRQf2CDjVJxgvN0bL2E9YWKziZcl2JeZ52CDW23d3mluWe1cFiVwloMXyFyrL6x7jPMrDrF5szIqBmwTMDiGGbXobGd7v45YbSNjoBCBQ7tmLSNYM0u0a/6gdNLd8TkZK1l+AMPfZlPJpQXbnXdIyDK8odffRXYOh1ZazrKqKt3lPnASxfUwpmxnEwjydTqdwvTr5JEVBTCIFBsMcTkOWjXZeqxbRKhkk//rbxv9mtJ/z9UEJibt/B5SKyjjapAk+klwcds/o6A0ucG4gfND/YehNPYmeVux30KoW7DjEF90nGkm91k43IK1e4jOo/KF1RRGzJQhblndR0jCw3BOBlOvC5Bx574iCB7lFzO9sHh0usqbUDEgaFpGT8jNIOX4UMZHxbakGn3wD8iBLSmvrEc+spnaGdK8wG6I4qE9CU4fzv6jU0AOujWebXlygkTEK44ysjLLRVzM+a2wWA60jGgkYZfKzpYy1A8vtdYbAzK3ES0iGud27H1V7I20hLC9TCY+w8RNj35wOLoeeb1u8KxiQGEjM0dErDeTK8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(39860400002)(376002)(366004)(346002)(86362001)(6916009)(2906002)(316002)(107886003)(66556008)(83380400001)(186003)(8936002)(6666004)(36756003)(66946007)(6486002)(4326008)(2616005)(478600001)(31696002)(5660300002)(38100700002)(31686004)(66476007)(8676002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU9GYWp6VHJ6ZHdoT0lQYjV6MEkwVzN3SHVoZE44REJRbS9RWEhENE9vT1J1?=
 =?utf-8?B?OEtleHNja1YyK05nSDJlR0o3WjREL01ZbkYvcGl5MzBNb3VlbDgvT0YzU0FX?=
 =?utf-8?B?czljRFRMbUJPV1Zpdk50ZTVIUnBoa2VBaVBraEV3TGhHTEZuMTlnTUNFYXV2?=
 =?utf-8?B?SXFoK05uSVY0R05PZ3pTcmcrcWwyS3BsYnlSTVVwTis0ZTdNZFA5MW1Uc3g4?=
 =?utf-8?B?eHNScytGUWJ6MjBwSWZPRXh1YTNPcFUxL21SeElnM2pZWVpJbVoxMm42bzBn?=
 =?utf-8?B?RDVISDZyMFBRWmQwZVN6UDFPY1NzSDFMVDhLd2RuYXd3S2RQdVRyNDNuSnFK?=
 =?utf-8?B?TTJnNDdiVVpyZ1dYcDZ3WWUza2tBQ0U2bjllMHlKMTZzQnhJNE5IOXNmYWcz?=
 =?utf-8?B?emdhbXJvM1crbXpoalpXbWI4aWFLOHBXM3d5T1NFdExtamZlQm0yZnBYWE9o?=
 =?utf-8?B?ZDd1eHlqS0FYUFpyb1kvazd1aWZIS3M3YlljMzNHR0FnRFU5T0JlaXBwU2Y4?=
 =?utf-8?B?YUhqbkpUVGdpb2N3amR5L05IQ3NmSWFsZVlhbFRRdGlrRENUcWQxS1pqVVFD?=
 =?utf-8?B?WlBzQS9BOFdRSVVXdENCL0p5Szc3cUtpNmVLclBDc203ZFBHem1NL3Bnd1dY?=
 =?utf-8?B?bmFDcFNUY3J6K1Vic0ZYVWlrWS9relhjUVYvT3hCa3pCWDhCOXVESW8wKzhX?=
 =?utf-8?B?a1phQUJIaTRXYXNyejBiV1dnWFR5K01WU0JJYmdBM3hRc0NRUitqYnBkbk1m?=
 =?utf-8?B?K3A1QzVIQkcwMkJPd2k2UUlmQWY2a2lXUDV1SFJlZ1hxOXNWOFZGcVNTUnhX?=
 =?utf-8?B?R2Q1cGtuYW1KMXFSeTRoN0Z4NnFpWWdMQ3AwZ21wMXlMbUJzOWVhb3JqcWNp?=
 =?utf-8?B?U2NrTzc3VUZNZTZ2N1hkNS8vRlJFOUdLQ2pZc1ZMbExTUmZSSmFxcG5EeDhq?=
 =?utf-8?B?bHQxUmVPdFIzUXA1L0I5WHF6eFMyWkZ0MUpBSjRLVTNJNXFCM3BsUmZ3aE5U?=
 =?utf-8?B?UVRBQ1RPcENZN0UvWlYwWTIyS2hhbWlBZFE3Tyt0dVRvTmpPMjQxazhrUkcx?=
 =?utf-8?B?N21tRitZNkt6VExEbjdGL1RacEVsMDJyRVJPUGFNcXJPZHZmYTBNSGs4VkVM?=
 =?utf-8?B?NWhpblQwOVNlaGhkcURWU0NEa0ViWks0UER1QXpQM09pd1JrNjcwNUdic3pm?=
 =?utf-8?B?ei9xVG50WnZLamVkWHVQUFZpMXMrQ2xuQ0tRSTBKdGQ1RXQ0RSs1TTJ0T0xl?=
 =?utf-8?B?bmx0NmZpY3hhZXVxamdzSm1IRTZES2FiKzdLemIveFRSazV1WWlTdkJERkxX?=
 =?utf-8?B?bFBUSXR0emk4NE1MY1g4ZW5HV2tIVzhVeUQ1RXM4OFMwSDJzZ21jcEtkNUtM?=
 =?utf-8?B?NlBrbDViZU9HelhMejA1cExLdmUxRjdaVUhIb1FROCtna1BoQkZ0UlJUMEpa?=
 =?utf-8?B?bU9jUjliUUxiSG9uZ2QycDQ0Q0hQZXRScU9OR3JIM0s1SktWSXdJNGZwZUJ3?=
 =?utf-8?B?Ni9xbE00WWQ1cG1jZ2Vtb1lMT1RHTVFqeEh4akMwVzJnOWpLRkRveDEwZFRH?=
 =?utf-8?B?REZLbFdzcUhKUkZHK0lJVytoc01pL0haZVVDM3hRTXl4blFmWWl6QVRta01E?=
 =?utf-8?B?VTdENlU4c1JtczVGWlM3UGFWTFFTbWxMT01rMEpXUzZnNlVVOWcrbHljWUJt?=
 =?utf-8?B?QlhEV1k2STdOYzkrZFY2MHZiMzIrODNlcHZ1R3ZGUWx3bm9TTURDNy9ILzJW?=
 =?utf-8?B?TldROXJvb21TSmM2dDRIMXF3Q0xhOWw5bTVHMm0wdFFQUnpudVRwTjdkaHN2?=
 =?utf-8?B?L2hTSHo4OU43WmUwN2Z6Zz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfd918e-c297-4cb2-ac25-08d94c62a7d5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 16:14:45.7254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g054CyqJx4h9gmDXw7HHX3/NjHE76Qh+Zv8gC1lCWHLVyqqF4gwYuj945b7ogouvph8nC+kUx4ICKjti0snEcWXpgalX7fglFG5KWV3AHwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3655
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10052
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210094
X-Proofpoint-GUID: qiIevqBcb8e8WgsB_xk1L7_KJbIukIly
X-Proofpoint-ORIG-GUID: qiIevqBcb8e8WgsB_xk1L7_KJbIukIly
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/20/21 8:15 AM, Igor Mammedov wrote:
> On Wed, 30 Jun 2021 15:07:18 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> Provide the definitions needed to support tracing in ACPI ERST.
> trace points should be introduced in patches that use them for the first time,
> as it stands now series breaks bisection.

Are you asking to move this patch before the patch that introduces erst.c (which
uses these trace points)?
Or are you asking to include this patch with the patch that introduces erst.c?

Also, you requested I separate the building of ERST table from the implemenation
of the erst device as separate patches. Doesn't that also break bisection?


> 
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   hw/acpi/trace-events | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
>> index dcc1438..a5c2755 100644
>> --- a/hw/acpi/trace-events
>> +++ b/hw/acpi/trace-events
>> @@ -55,3 +55,17 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
>>   # tco.c
>>   tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
>>   tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
>> +
>> +# erst.c
>> +acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%04" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_reg_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%04" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_mem_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%06" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_mem_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%06" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_pci_bar_0(uint64_t addr) "BAR0: 0x%016" PRIx64
>> +acpi_erst_pci_bar_1(uint64_t addr) "BAR1: 0x%016" PRIx64
>> +acpi_erst_realizefn_in(void)
>> +acpi_erst_realizefn_out(unsigned size) "total nvram size %u bytes"
>> +acpi_erst_reset_in(unsigned record_count) "record_count %u"
>> +acpi_erst_reset_out(unsigned record_count) "record_count %u"
>> +acpi_erst_class_init_in(void)
>> +acpi_erst_class_init_out(void)
> 

