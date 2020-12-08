Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F7F2D312F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 18:35:37 +0100 (CET)
Received: from localhost ([::1]:32816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmgtk-00046j-4H
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 12:35:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmgqu-0002p5-Bl; Tue, 08 Dec 2020 12:32:40 -0500
Received: from mail-am6eur05on2090.outbound.protection.outlook.com
 ([40.107.22.90]:44531 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmgqp-00021a-DX; Tue, 08 Dec 2020 12:32:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUkpwBHSULUtaqBajbVzbyPaSdZ9MV+78Fol+3h7i+ag2xXi11F9rU1dOY3wLBqVQmhgH2AVbye/XPmou4SCuXWRdm4d+MPBp8BDy2W8xocEkErN0r/b9sP1EAVEmeEYiU3voeOAGH1YQbbDJff0Mvp/OQjFz9MZzJSazryOvOcm2XfSoK7HROZaf0FNqMY09MER/Q+VDwN+00f8Ih1U8xlrrt8gQ+KqXZJrkkzmQ/R9YI+wG2RQmgY9AdXN0jNHCcseJ4Tuf36ZpG/Ol+Y9JnFNLws9ln+9+PlN3/iMtq5bzr241mCUP1m0ME6Kwy8epK+iiEYEfkvaQuQZfGa//Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSd+YwbZ2NWu/B36dzrNB7vfJxlKkJUDjcbxr2pDojM=;
 b=PphJJltNDEgg/80WLjNW8aoSNjac8CYgVEjD2jOiWEkuWhPwCkb7v2VNmIGCQy/hT3XfVUzKjBLT4ZD80MrHgxnQ19pGpbDpzHWQ3c6ZLEvSloT51d/9o/oIUn6W3rUQhGLQ71uHxEanlYwcetTiEmyoHcZcEdAYVaAEC8ZaRdH9FpUawXgQ9/3Mwvye8a+f5u+Wh6o2oCuZScFwL9dzu/W19kA+y9VmVTdolluZNvXzkI3ITjYdTK8LGSYcJbAKa13pq+VdpiZm6v7z/7GHL/mcYqBRE9id2Uoa9lrUH0rpuw9QgmE1dFZJLA+pRNWrFhyo9zjjsaOB58gwfY09Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSd+YwbZ2NWu/B36dzrNB7vfJxlKkJUDjcbxr2pDojM=;
 b=nWeTsd9xVpZfPKTwTk3t58I1F53ROzuZ3F557p5kimDvSolq/24WKvAIZNEx7WI1EuzMJYd/p4oYZH+il9YL9uRb0o4O2ifhB9oHNW64lZ74PVwg/xitaPmiK0J3SVK2ZP8Q1rGldqmuARp0ncqb8A7pcsxv0W1x0XC3TKFQgfw=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR0801MB1661.eurprd08.prod.outlook.com (2603:10a6:800:56::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Tue, 8 Dec
 2020 17:32:31 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%4]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 17:32:31 +0000
Subject: Re: [PATCH 0/4] block: prepare for 64bit
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, eblake@redhat.com, berto@igalia.com,
 den@openvz.org
References: <20201203222713.13507-1-vsementsov@virtuozzo.com>
 <20201208171317.GA24068@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <17738357-10da-5402-dbfa-47c4112d7ba4@virtuozzo.com>
Date: Tue, 8 Dec 2020 20:32:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201208171317.GA24068@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM3PR07CA0121.eurprd07.prod.outlook.com
 (2603:10a6:207:7::31) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM3PR07CA0121.eurprd07.prod.outlook.com (2603:10a6:207:7::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.7 via Frontend Transport; Tue, 8 Dec 2020 17:32:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 468fe378-967d-4826-4eb1-08d89b9f3e2a
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1661:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1661D8971733229EDC220186C1CD0@VI1PR0801MB1661.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G91LL3HJ7ny4bEIV/6ZY6oNe72TkXl1rS2ZadzJPkhdaKnF9YQAV9MoNY6ndVzLqxH8i+bYwuENb/CcUEBXxp1URstKm5iM8O9tAl2Sk4lMepl9icneWjuOPDp9A0IZKmV0iZ2wL4XIy4UMFjwYsVNFy3z38rh5B7K/3X0sMPJRJTIuPxdGoLS3RMvyEAWRz7RouzGe+Vv7ij07K9ft3KA9f4LVvIWicfBHPCWXjlIdiwXMCXN0wlEai6Dmvpvw2aC3rrvARYs6h4CgnJdUFQ9H7cbni5STt/BhkYL2o/4BIWOKKtHV5KPCG4y5UqYC1WRSLZxCpAuh0H+unBxIiu+DDRNV0bwZugjrI7EOf/ePDxBi3gc1XM4LUr3AMisPceD03s2Kg6P7eZlf27jpZk5d2RIM3gz8F5Mobrw48CDEiiUScAmf+kToqu299L+mH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(6916009)(956004)(16576012)(26005)(16526019)(8676002)(31696002)(2616005)(52116002)(4744005)(66946007)(6486002)(36756003)(66476007)(4326008)(34490700003)(107886003)(8936002)(86362001)(508600001)(186003)(66556008)(83380400001)(5660300002)(31686004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QmhEQTRsclVqSGFpbWxlUGpMdWQ0Q0Y3enFxanhqeldMSVlQcGdRT1JQeWlL?=
 =?utf-8?B?b0IveTBGMnFSSFBiam9NcHhxMDBZVWJiclNrUHRmWjJranpiUGR0MmhoZklJ?=
 =?utf-8?B?bGMrY3UrMmkzblR2NlQwQUdCMU5NTFEzS3VaS1Uzd3Y5Zlpnb2lnYkZDQTFX?=
 =?utf-8?B?elFBUWpxUVp2dk5QdzM3TDdyVG94UTQvY1Fwak05QmNsSGcySkNsNTlyQkZt?=
 =?utf-8?B?anpXcWo5VjNxMkxEVjRqYW04c0xNYXZVakdzb2tyY2xudkphb3FONUpqaGtV?=
 =?utf-8?B?RkJHaVFOUGtnZFNmRTdJd2dtUEVaWEpuUGtSQVkwOHRiZUpHZmFTelpJdHVX?=
 =?utf-8?B?L0FDdFF5NVBUbnlqQVVBTisrN2xWV1dCTEkzdGRFRXJPSGlzY2NUemM4dFVO?=
 =?utf-8?B?dHZXU1F1SXdsZGdKMGRWb3UxLytXS3ZtRHV0WGVLdU5YSHdhcjRWRVdQYUdC?=
 =?utf-8?B?c2JrRGVJTXh6dkM2UVd1YWcrQVRYVTN1MXI1T0RlZGd2Y0JXdkxhejhGa3px?=
 =?utf-8?B?NExKUmRxM1JSK1lRYkNLQkpJa1BrbUNxM2JCRm00SkRZK0dnMUVxTXhvV3hx?=
 =?utf-8?B?ZmhTbDMrOGUzL0dVeHc2Sng0Y0w4Tlp4VkVqM0dxLzllODE3RnY1OVdCRTdX?=
 =?utf-8?B?ZlFidDBpTWlFVFhjcDRlandwSk9YTml5TDBjL0tHVVBOQ0QzcWMxMjUxVDlX?=
 =?utf-8?B?ZjhiS1ZFY1JlaUlIZFQ5Qm9EN3d0bXllSEU3K1M2TVlpdnNBVzF1ZmNQMUEz?=
 =?utf-8?B?blEyYUltSk9ocThsU2U4M0MvQ2k4VWlqTnVqY2U2S0FSQVJmQUQwY04xdjBN?=
 =?utf-8?B?Z1VycFVZOVoyUUFIQURzYXJ1WDlBVDZhcXNJY1U4ekQxbWhVUVdJWFdhV0NP?=
 =?utf-8?B?RWRjVnZGT2JMRmM4LzJJVjRGY1IvSWo0c3Q1cGJML3IveGxZQmFiT3ViWVRZ?=
 =?utf-8?B?dVRRWkdZR3N1VWd2MUFjdXNYbC9SQlp5UGdEbTRGN1lUQU11TWpCSUJoeVdm?=
 =?utf-8?B?TnJCeUI4azNDMjVuQldpU2o0aW8xdVMzQk5mTGRwZ2h4amszckMva1VyQzJk?=
 =?utf-8?B?ZDhDVXlySUdOR21FUTZpMlpzR0NEcHN1bURBbkpENkhWV2pqV09Uc1laUDB2?=
 =?utf-8?B?R21DWW1JK01FV2lBZFU0a0Jjbis4Y1EyeW1SQVNzS0ZhcnNKUlZQS3BBbE9S?=
 =?utf-8?B?RlFKZSs2Q2UyK3RZcnorRzdwSXJiczdFSTlTQVdUSzhRZzlubTgzeXFJbjJw?=
 =?utf-8?B?REJMaGx6cEtDNnhaUUo0QzFxdFZiODFKQXp4WDFtdzMzc3lyTmZ1UmlaZjdN?=
 =?utf-8?Q?VEdtTxA3ltWeXc0+iQ/hkUSwmhO6NEbTVf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 17:32:31.7423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 468fe378-967d-4826-4eb1-08d89b9f3e2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +nepx211+I17Om+RwNxtlACczdVrz7xDeptbxxige7Wr6ixaM85NG9BacugTF+cNhB1xn+0fZO158MVtA8wCrXxo0um9jyFUSt72MkW2jfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1661
Received-SPF: pass client-ip=40.107.22.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

08.12.2020 20:13, Kevin Wolf wrote:
> Am 03.12.2020 um 23:27 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Hi all!
>>
>> This is a preparation series for v4 of "[PATCH v3 00/17] 64bit
>> block-layer".
>>
>> The whole thing is in 04, and 01-03 are small preparations.
> 
> Thanks, applied to the block branch.
> 

Thank you!

-- 
Best regards,
Vladimir

