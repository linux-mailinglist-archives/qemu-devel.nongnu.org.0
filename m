Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CCE3E0944
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 22:24:05 +0200 (CEST)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBNQp-0006f5-NV
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 16:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mBNPr-0005xc-Vp
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 16:23:04 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:18572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mBNPp-0006Re-S0
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 16:23:03 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 174KFeRI019486; Wed, 4 Aug 2021 20:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=BozHT0spOVk9adhJXdVfUFn2Uoj0kecX7jSrXSZ4Vv0=;
 b=wtZOf4y+iLHGxMwjpbsmM4mZvrk9KEPYOEzGxch8VWFcGu9sdGETBC/KX0OpC9cjhZKd
 tWOUwdbOUvSLLZ44DatsXue6NuB/Jcf2PKMNTfSgTnDsVfSW0OidneUW1uGSbjVz5frh
 Z2/4CZz6K7VYK56zz3QcPAIq8sKqL3YhA/iZB0CjPKSHD2duYLnLYkJarMgJIe5MQDAy
 INiJP2qmjejA4a0DK/1K+hxg4354/znGi39EsIpJ3b93etz4Gf8h4XM4G99Mxq3vxKgF
 nrjhu8BrTltB1/XFEdSOSpfXvVTfD2MjNfds9G/q1TlN9PCIvouuI0/Js/ksEimYHMzT hw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=BozHT0spOVk9adhJXdVfUFn2Uoj0kecX7jSrXSZ4Vv0=;
 b=llZwiwj94xbURMhrYUQj6zjWSCQO/xUL1/5vKz2QWBb81RFf4DiKBNyk5vLiTKDXFXu0
 6DX5AOm9xFR437mDbTHrOpO41kjOihmcXEfFpoTpaNAEOJF+KawbVhYKme1Y6j4fFnMC
 ud1IA1S6YglN4ED8tWKg6rYL15S79ygQFsUf6eouByhAEDvUcqIpY4bLHWwJpxDRga+A
 KFy6hU0W6xomId2JBIpYTsBDoJ//q5WRn4pIKExBAEjIhitvCz/ug9MWmA3XBGWFySiP
 pvPl3T9uWwFLVWYUl7tM5EkyUc7LgUJWdpD4cwZatPugF3QIkzKFpQzUaOY5wymx4JvV Vw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a7aq0b1xr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Aug 2021 20:22:54 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 174KLRUS185540;
 Wed, 4 Aug 2021 20:22:52 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by userp3020.oracle.com with ESMTP id 3a5g9xtqfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Aug 2021 20:22:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7orRrHxTGNmB9ciuodP81dJS9UL1jMiFWTvnVOYzS6OlfCmvosx8Prs2ZSJrg96AI4lb3nnJjsNy4aNUgBLooTCZlHCNOFTB8MLUIo//KYdurkzCCAmtBFoy40Gi+Ef0ZJ2Uv1MsZqES/aIu1cS/6VGCUnP+PxqAkX6XbKZQaa8xgZ69Hma91ZO6LuScYQ7bg70ofdp2spJphtFUrFNWF+7l7WVxjAJwA/SLf5U7pS1E2u8/4bsBeiwwGN7wuqso0yX2xfZyQ2278U9gqk1Ec807kvNY0WctzwJ+rSY+iKxhLAcUuxYGS6nIgUfY+HllvTVLESO/Y6DNfksOe5cIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BozHT0spOVk9adhJXdVfUFn2Uoj0kecX7jSrXSZ4Vv0=;
 b=Snbwzfm+EjPd4S7IgNXtdVvFuYGz/F/TzzXVaKVXleO6zsM/UUp82i17tkXDRdJ1rtQcJWxJ3MgP5wIuUHBnF4nbAxTFs1m9CDFfwKF5C+icUJNrWrhYH6d1PgGajAb+yiEpQRizt5my2nmRy0POjItjwVCBuuLmb+cjoEutiw/HB7tHIG9hKXhRV5HBEv2bsAgx/wZepzkNgVQAgRlDL+4H4llAcAN1OiapPAr2zJ51K1UmL3twhme+G1gGg8H9+1yqPR+8CXBPKw9bs1fmjkvvE7f74MJfekVwPvkuYmSOUjzA2CVXU0TH010C42YcJgv7Lw3DS6Zwe1NJjneW+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BozHT0spOVk9adhJXdVfUFn2Uoj0kecX7jSrXSZ4Vv0=;
 b=w9uhDrw7W83K4AuXY8HJdSlcxC+8pM1AI7xrZwxZwzhxAsQZFGg2Ydn2J+zmGEZcxKt7nE8MXwDqZF6mRKybCuJM+nc4Xxtd+EDeDLq8Zo0f3GIygAvvXO82UFGxpvH1Fn8lrpu4s7XXuGI9WSbRP/vkWGNIl/Ln67FrTNYDShE=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3286.namprd10.prod.outlook.com (2603:10b6:a03:153::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 20:22:50 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 20:22:50 +0000
Subject: Re: [PATCH V5 12/25] cpr: QMP interfaces for restart
To: Eric Blake <eblake@redhat.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-13-git-send-email-steven.sistare@oracle.com>
 <20210804160056.c4k4hwbhewdy3lfg@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <b6e75e01-9300-e4fd-2041-fd61f65bee59@oracle.com>
Date: Wed, 4 Aug 2021 16:22:44 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210804160056.c4k4hwbhewdy3lfg@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR08CA0036.namprd08.prod.outlook.com
 (2603:10b6:805:66::49) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.21] (73.219.99.178) by
 SN6PR08CA0036.namprd08.prod.outlook.com (2603:10b6:805:66::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 20:22:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de5ccfed-1290-40a7-a275-08d95785a156
X-MS-TrafficTypeDiagnostic: BYAPR10MB3286:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3286DA1D507A393CD15B2D6EF9F19@BYAPR10MB3286.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WyTii3W4HCuDKr33f65D3N5PYPwWM26cFbCaZ+jAuOLvXoswbSnEXs9jU/lVddiAcVgRBP3AknkvnoPywySTgMQHDQYGqkh8iDuVIJReJ60Zb+DImVwwmaXhAIPCx7aMGNg7aoHZXEnX5HZc5ZZBTzRjVn6ZrcyI/PaKp7f6b1wr9cbW2ErtSSjJ/EZb7w1hFqv2qcL4GXrXFjuvjLwo3r2qmM4aMqEDCjDwZhh3Twcc9RQAh/HBByAF3oOJu0O6ZUb6v6tovKjODleVIri88fb/4bkDAXzGkmSs/9qRNBn5Qo0rD5Rq6mSeFn9w2Kycye4SGPZRMMJEpN94a0eXeIjkXo97ESCVsHQGXpYlkqXdwF3hs0PpSK2R0qk6BPHf9q2fnu8rSzMZ8DcoMCbnuUljPcZx+RLlldKMFt08W8oAhheyAFh4qzaEqYLbaOJG/EvR5a1nVIiJmpY6FpdbHki6RxlbT86Q3Rfhq/KgXz1jAXEq/YVCVokon3Ak0f76rJQfYyb4hDnF9zfAVWq8PCLno4jqQrjy0QePCOyblW3P72RamoK9mvaElUZcNW+lD27Shah1hIu4MuKz8LK0TZnQw5YqIREVWGSWrys5v8MQSiWNh0wWD5J0I8mp0oKk0Nblmlad0kkiUmxavwEam1mR+MZfMehqFuy83vDRuABx5eC1tKJANIGrTRzC/dm0iHHmg5f8YoLyvKcN3u1aT/FpJ9a6ga8QQJ8HwwnTCnc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(136003)(39860400002)(346002)(366004)(8676002)(316002)(53546011)(54906003)(2906002)(36756003)(86362001)(2616005)(7416002)(8936002)(186003)(83380400001)(44832011)(956004)(36916002)(38100700002)(26005)(66476007)(6916009)(31686004)(5660300002)(31696002)(6486002)(4326008)(16576012)(107886003)(66556008)(66946007)(6666004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mlp5RkpoNFlUTnVTMWIzc2g4WXlCTkRCTU5YMTJsQktrK0NPc3FTdXhNdUE2?=
 =?utf-8?B?TitMdmpWa0VQZE1ZNDZjWWZhY3F5Y0dxS2ZxNU1LanlqM0YvTTJpQTkvanFs?=
 =?utf-8?B?M3VaaHpveUJMSHVnZWkzZktlbkxUOWhUUkNkZmR0b3cwamtDL1Z6cW0yeXN4?=
 =?utf-8?B?ZXM1eGl6eW03RkdLRzNNSnhWS2V0c3NnL01FcTc5ZGliTkV4QmJhTUdoOFVG?=
 =?utf-8?B?NU5TeWxTYzQ0dFoxRmlINEx5bTFwc3IwZndQa2h3WXhYQU5JRDdiS3hXL2dn?=
 =?utf-8?B?c0s4R1E5TE1xMXcyZW5JUnhnM0pBaXFOcnBrdHFrVnRETzgwNGptLzU0YkFw?=
 =?utf-8?B?T2llLzYzejNEaVNSZWVTSnkvZFNZRWFmK1pmTWsvdVp6UGVkemxQUmpOZkxQ?=
 =?utf-8?B?NnM5L3FJaEtVOTFIakF0elZPSk5lZnB0QnN1ZnZlY3ltY0RxQms2UDhyL0R0?=
 =?utf-8?B?UUY4dzYwTlFvcUJJY1cydU1yd1djbStqblJueVQyRFlkQkhCQkszNnRRUk54?=
 =?utf-8?B?MWZnRVlkWHlweHhOODVSSGhoRGx1QUMyRXlvNTViV2FWc2duZGRhMlk2WkQz?=
 =?utf-8?B?bTdhNjIvb2huWVN5Um83dEd2N2hoTkxnTm0zZmF3SzRLU1NWcysxSXpPYUJx?=
 =?utf-8?B?dkJzM01jVmUxZWtGRlpPZzR5RmNzVFZRMUQ2bGR3WWRWdzMxZkpXNElzRGpE?=
 =?utf-8?B?KzFhRWx5bElKdmc3b3NNMXB0ZHRzV3doNFdMTDJVQ1NFbGF1Q2xUVlE0QkNm?=
 =?utf-8?B?ZndqSFBLNGdhM3drL01kZ3c4Z2syMjNxTE5RUVJvUkpZR3M5RzFGNG5aSmhm?=
 =?utf-8?B?SEk1d1hhN3pDM2ZkL05pNDAraVRCbnkwSmdWQldKQllrS1ZTd1lGQTJveXNB?=
 =?utf-8?B?LzZLNXdNWTd5RkFocjA3S1NJekxsTTBBd0xpd1pRdERiZGdrUCtPczBha253?=
 =?utf-8?B?MVh4S09lc3Jad3R4aTJLaFJQSUNiVUhvc25XOTJ0OGFwOEg3QlA0a0N2Umxz?=
 =?utf-8?B?QjR2YVdFWkoxeTVORDNucDhPSlF2NUJCTVJ0bitKSEE3aUZVY0xVc2crZmIv?=
 =?utf-8?B?dTdpUy9RY3hyeHRaN2ZRL3dRelliUnRuNlY0RTUwWHZRSDBwK2RTc3QvRVd4?=
 =?utf-8?B?UVZQOGEyUmtxcEdubjE3VHJJWXU0SGJMck16c0U5QTJvMkZwd3JzT24zcFdK?=
 =?utf-8?B?cEp3UDZRSjVzSFo5UzAxcjJIYXYweTVPR0JBZVJOMFFUSmpnelpRdjJMNjBW?=
 =?utf-8?B?ak9BdGtucmtGQitlWUEreFAybnZVbThhR0EwVEJ4ZVdNZDF5UkppeWl2UExC?=
 =?utf-8?B?azh0UHdTSXl2NVdpRm95ajl3d3FlSm9yQlJveU1XdzAwM2ZpNmFTQjRPOEZC?=
 =?utf-8?B?ZzFBSVprblZpNEkrVUt1QWxEeWUyVXVacEVOdnNKd29ZMlk5MTNTc3dPZEh4?=
 =?utf-8?B?SnpGMDFXR2R6dFVJYlV0NlhGc21GUmNOajY1MUdBWittMDUwdGFUeVNHRitY?=
 =?utf-8?B?WHNWNHVTZkJLQUdPNDJzN3ZJTlhBRjF3blltMEY1dXcrUHVBQ00rVFhBUHZs?=
 =?utf-8?B?QVZFQ2xsRlVyRkM1YVZEUC9Pc052VHJ4TWlWU20zTFBCa1lUL2FrN2tZRlRl?=
 =?utf-8?B?VXU4Y1pjS0VZQnpINGd4T3VIand3OS82TFl2ck9IQ05mdElQTXlmV0JtVDhj?=
 =?utf-8?B?dTluSno4UUdnQjRNTTAxWUFiZTFNc1YybEFoN0lMZlVsanVFc0d0V0FlTHVx?=
 =?utf-8?Q?xgp9XSvc1hHoAa5OAbyqxmjdwlArb5D+AjU+1rN?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de5ccfed-1290-40a7-a275-08d95785a156
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 20:22:50.1710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +iKJcnhs7qyq1wpzVtOMnokDNGWlhCB9xab4hH63H0onspokRVF7doqYTuglPx+CiFHxds6Lep2UumTMHYAvfuShMxkkXX8TmcBadO8oZoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3286
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10066
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108040124
X-Proofpoint-ORIG-GUID: xuMD3aeecUcU2DRYsHODnNemxrxAicri
X-Proofpoint-GUID: xuMD3aeecUcU2DRYsHODnNemxrxAicri
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/2021 12:00 PM, Eric Blake wrote:
> On Wed, Jul 07, 2021 at 10:20:21AM -0700, Steve Sistare wrote:
>> cprexec calls cprexec().  Syntax:
>>   { 'command': 'cprexec', 'data': { 'argv': [ 'str' ] } }
>>
>> Add the restart mode:
>>   { 'enum': 'CprMode', 'data': [ 'reboot', 'restart' ] }
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  monitor/qmp-cmds.c |  5 +++++
>>  qapi/cpr.json      | 16 +++++++++++++++-
>>  2 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
>> index 1128604..7326f7d 100644
>> --- a/monitor/qmp-cmds.c
>> +++ b/monitor/qmp-cmds.c
>> @@ -179,6 +179,11 @@ void qmp_cprsave(const char *file, CprMode mode, Error **errp)
>>      cprsave(file, mode, errp);
>>  }
>>  
>> +void qmp_cprexec(strList *args, Error **errp)
>> +{
>> +    cprexec(args, errp);
>> +}
> 
> Why do you need both qmp_cprexec() and cprexec()?  Can you just name
> it qmp_cprexec() in cpr.c from the get-go, rather than having to add a
> one-line wrapper in qmp-cmds.c?

Will do.

While I'm at it, I will add an underscore to the function names and a dash to the command
names to be consistent with other compound-word commands:

qmp_cpr_save
qmp_cpr_exec
qmp_cpr_load
cpr-save
cpr-exec
cpr-load

- Steve

