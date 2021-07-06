Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB7A3BC8AC
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:50:29 +0200 (CEST)
Received: from localhost ([::1]:51078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0him-0006rR-Lp
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0hUZ-0002FH-NO; Tue, 06 Jul 2021 05:35:47 -0400
Received: from mail-eopbgr60130.outbound.protection.outlook.com
 ([40.107.6.130]:51156 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0hUX-0001aU-VZ; Tue, 06 Jul 2021 05:35:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAAj/4xrcccKL3cHWztlFNVlspXhY6LRb3B+5eiHP24XF0s8mNqkVIs69g49bpHtuu1d2aHaOodPXx7fxEjN0NZZL9AO7+kzavMVtAbWhD6yZKO4letWhxNI6lJwnbvRAMy5EvzV4hU/hr+yV7ctGT35vl/MxpcJ8trCbD61wn9O/mOfzWz4TK6QLznQvEFLk5Hs+1XglsITgblaGW59tzpzcINpKOGYQzj0wmGl6XjRw669Ox3cdH7Ur1O17YbiYIXQwTl5+U4XlZ28A29b8KNTPWdLKIMGg8vXqulzudbJx8yr0P4oWXF4i3RtY/B29vq47sPgNUBik33OMrWv7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp0gAak1W8NR6FDPfmHadEUl35lRynxwv/kP3HQ/+o0=;
 b=CbOOjcL7JnGYDqjpzWUf0Q5g+C0ySrwgNhWcne13/VFDJio5kqlw1sk0ynXqFcxwTXxwsYJOjpCA1DQA+1DGhhlL0impT0WKlh+xXbTTNoAaeK8M06yh3MgbR4QJFON3NIwn8LDNkH0EzU9ZyP3THhP/ZY40iiswqlAdmjjk9Wq9MHn/zGLsGB6LIuz00SFkZ4DvFBi2wBtKTubSOYyFnw2id+i0ccJ+t+NfGkiLDQ8xw8131HBtn3wxpFLqpeuv8nXtRDBljYZf4O23ToSqSj40Kj/3iZ6kZVYYBfmvfRN4CdSBmSGTaIgXG5VzVl4xsIFZPk04rUBN+0Rkg+EtUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp0gAak1W8NR6FDPfmHadEUl35lRynxwv/kP3HQ/+o0=;
 b=YG2S76bgLGo5LgUjocUiBBoSs31iJumZUcLQUdwGUpwZw3s+stesQY4mu/aUuUSZecncfMx7OB0dcIkwQv+gIpnG9EaPBTqrjdhIrBo/OJOWOIF7SOrM/vYPQ1HeVteEg2AFwooeDoClmJ2M2YHa2wedGjNSMrkdWfhx03nYNrY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6948.eurprd08.prod.outlook.com (2603:10a6:20b:347::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Tue, 6 Jul
 2021 09:35:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 09:35:40 +0000
Subject: Re: [PATCH 05/10] iotests/297: Separate environment setup from test
 execution
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210625182021.803227-1-jsnow@redhat.com>
 <20210625182021.803227-6-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4ccbb101-80ce-dda5-defa-f2852f2ad5bc@virtuozzo.com>
Date: Tue, 6 Jul 2021 12:35:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210625182021.803227-6-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR3P192CA0009.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR3P192CA0009.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Tue, 6 Jul 2021 09:35:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38402278-076b-427e-f9af-08d940616b5d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6948:
X-Microsoft-Antispam-PRVS: <AS8PR08MB694815447A40CA1CC7222DAFC11B9@AS8PR08MB6948.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X8bZxg1qS6Bix2jFlzNKPSNBhrqQiAj2PWKMFSYNNmoRHHTU8Pydsl6vfY3u+VPkmd9ucW+iVA+QcXNxcoeRqnM1vx7t3B1vlXGd8PU7T4f31TO77ksavflB3HLAnbZ3RQfU6d5UuA+GzHISnI/e00EiVsLunyJMTh64fK9w/Nd//mWpp5Kq5bUTW+Ec72owBFVRuuDDWpbMsyf1uWttoidw6INjErzfShsepciXgrzNCospSCK+32jqev+EV0BGfDSChFBtUBX9DHmKVwcdtjAC5Fz5081Ct07DMPaY53ChTKfmZz+TqvXAkOY+nUAwM6EZzaTvNPw0XZkU+8t/OICkNH/r2+ND/1ToW2jlOupkXbGmk5r0Y3nRcBt9uWJYZE/6gcHBqgPyKIuhyeT8xgpTUzYLBtVOO0ovrvMKxLuKT/7XMSIsSgKsqoRWuGddBJCAPqQ3oMHPtZH7GboC9HMyiFwfAlQeZvS+Sp564PsYtvq8sMyAy+h8MAIrnpqdBmXNv0OpGFmnekKl6oehrORV5X02acialtkCLeZStjVUOqq5JLCJkb0qjFycOAso33TaZULE9KKpy5eRLk0qPrVGIzgwZVVPNrKeintLeY11aM2pfCUi5pe+sZx4JsKwS8lRFYP9meK/Oek/x+MOiY/lsocA2f8DFJVm96/4rVp9L6yUryPihG3mc8381QRgc390t3x1BdqOxLYwdjirb+N/CS9IecfIVtasvn2sGcjorjpiI2QR1GHu112MxC8MHizDwC7ZyFWRIz6hh1FuiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(498600001)(66946007)(186003)(36756003)(38350700002)(66556008)(26005)(66476007)(4326008)(956004)(2616005)(8936002)(54906003)(16576012)(6486002)(8676002)(52116002)(38100700002)(5660300002)(2906002)(558084003)(86362001)(31686004)(16526019)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDNSMXVpbkdueVJiZXJpMWRtZFlieVI2cW9uVVlXM3hVTXplMSsrSFVOMml1?=
 =?utf-8?B?a3d1OGh3djJqcW5vOTNKNVJ1VWNzRkNwdXhlc2NTazV3OTE2QWc4WXdYU1JX?=
 =?utf-8?B?Z215YWNWNkNvVW9La2t3MjJ1bDBHTSsxbHJXeEJ4d0V6R1dGeFVsck02OEhX?=
 =?utf-8?B?QmRkNjBPMStZUWVWdStwOEZjWG5BdEpmT0V2eGJudlNTcFJUOVlsV0hwNDN2?=
 =?utf-8?B?RXZ0YTljOXNaQW85d29xd1FhNlk4ZmdFblpabTQ2Z1U4b09KclJRbkxnY2ZN?=
 =?utf-8?B?M0NSbU9TbGRFQnVjQ216ZWloL1BZVUh3RkE4TmpRNGJrdTNYNWIzNlBtblVy?=
 =?utf-8?B?ZmNzcFFha0ZLbkM2MzdxTmpvQ2EvOUd6MHJ2MUFJeWw0bnh6MnMzVEk2ZGQ1?=
 =?utf-8?B?M2JLTVIxaWpSdUp5cHlvdDIxMnBWemNkamk4a001Q3lWOHV6enhlUFU0ZWVB?=
 =?utf-8?B?VVhvOERGS20yWGxiT3hYMnhoaVFUdXhTd1h3Z250alhpYlJDNS8rb3BQNzRP?=
 =?utf-8?B?cW9NUWgrZk9JL3B5NXkzWWtHbVlrdVpEMHZXMHpTMjhLL0JTeTlCTzVaNzAx?=
 =?utf-8?B?c2w4NE1SOEQ1VlorWUI2d3VLZnFRQ0oxaFJaY1gzRDVGd2p1U08wNlF2ZEx5?=
 =?utf-8?B?VEgybmIvNndvc2g1Y3IvUFJLTy9NZGZmM0ZldFFJbmtmcjlzeHBpR2JhY3cv?=
 =?utf-8?B?OVVoZkJhalUxT1RUNzUyZEFLVXRCd1RRMlFWSG9MdEJPY2V6RmV0NjBxaGZj?=
 =?utf-8?B?dk9qT3VuYXgrcFFJR3NIdTZ5OWNndnZtTXFPaGVvNUVteHhiNFVxdHJhNkp2?=
 =?utf-8?B?REEvdDRoRW4xU1IwekhOZFR2aTlOMUk0Q0F5M0FMY3V5TFh5S2NWMHNJampU?=
 =?utf-8?B?QnZRbVJOU1MxOHFrZ1daeEFrdURNeTZHVkJPWnhIU1p3VFdybnlyc1czVmZt?=
 =?utf-8?B?UXNNWERkUGJITzluZ1M0S3kranhrcm03RFRlNmJza045TE9KTmNZQUZoZEtl?=
 =?utf-8?B?WWpsZHFvbGdockpheWdhWjdWUXp4MkgwbWdIcFYxZy9TbWVMOTJQK2VXR2U3?=
 =?utf-8?B?R2wxeGxMWXdUclNxK1Y5R0Z2ckJid2oyZ2J0NVZQU1RGQTZUVGhzU2U5OS9a?=
 =?utf-8?B?Y0JLLzhHV2IwZjRNQUZPVlI2d2hxbnNVNGFzL1JqUkdubFIyaWxSUFJDTDlX?=
 =?utf-8?B?dGVZQUpvb3ZvbFZSeXlOdTRNYXEvN0htUlc5TGxHb3dOVGZtcyt1MnFEcUFN?=
 =?utf-8?B?Y0R5dDhyT2hmUXVUU1p2MDBueUZ3SkdyTk5Ea2pvSDZ5a2xyVG12WmlsUUVZ?=
 =?utf-8?B?aHp4YTlLT1QyZXZTaS9yOFVQZ1k1WGYxdHFxTkRWR0twc3cwMmNPUFZFVTN6?=
 =?utf-8?B?OFZZUHgvdC9lNks4cHpCcm51QndYNFBWbUwvVGRveC9uY085T1JvL2NRc09Q?=
 =?utf-8?B?VjNaYnZYcWRYbUhRbWZhL2x3SHRxQjE0RmwvK2tJekVTYXR2anVoYUtoQ2JF?=
 =?utf-8?B?TndMWDk4SDI3T0VkTEV1SzExb2lvaGNWMU9aMDgwRVYyM0h2WUZJNnRmeDND?=
 =?utf-8?B?UnNIczNob2lYRDFJTnVmSkFRVWJnaGN2QnJUM3hDUU9VTElqU2JkYlNZeXgr?=
 =?utf-8?B?RHEyUWFzRnRWK3JtbXFLbGNvOXRUbVJ1NFREa21TVjROZVRBTUNsNkE1azI5?=
 =?utf-8?B?eHVMbS9iYTRTM0FJZ1cwZGt5c2dpWFFZTElubVBxYjhsRWQ0bHdxZ0pBQzFn?=
 =?utf-8?Q?ZLzYdICItF4niKmF304++6EkH1yiXRyJUxAC13H?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38402278-076b-427e-f9af-08d940616b5d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 09:35:40.8067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAsoYjKMWWyShUZsq7+r6h/UssMXIlPmjHeZIQ7QKVo3DFb0BlsTW7wR2aYAU5j5kPf/ZFsbW3KuLSdolnkdqpxYwvfMdfEfgs9hh1tIvIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6948
Received-SPF: pass client-ip=40.107.6.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

25.06.2021 21:20, John Snow wrote:
> Move environment setup into main(), leaving pure test execution behind
> in run_linters().
> 
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

