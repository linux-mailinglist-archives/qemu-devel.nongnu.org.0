Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D15D2D58C0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:02:17 +0100 (CET)
Received: from localhost ([::1]:55028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knJiA-00011X-SN
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:02:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knJgG-0000MS-7K; Thu, 10 Dec 2020 06:00:16 -0500
Received: from mail-eopbgr50114.outbound.protection.outlook.com
 ([40.107.5.114]:51196 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knJgD-0007Aw-Vb; Thu, 10 Dec 2020 06:00:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ea0b+0RURkGFUn17zXdPY+ysC/710WdCd9n8KawgeOFWm8e9ACRr2j7GJCHGJFJEb0ubwaMIit5W2z6MIIFqJOgMf9FaxTOe+Jr/qxjt1SqIgU8AaH+yu31ywpLeRskVN7vHwPeB/+0BX1Ty3zAgbLMqICHx4IAETq35xPc9HgUZOITkJ5okItYg5oyy0Lb+wvmOAB5zsnqkcotFOUPkiXhHDi9xP2UXUSLyilDq0k5EBnZRKQx87oxAu/M1kOS/uUeNCqyd/Jyr5SWep5Ec3sknpcxNsdXgm2O1w08a8XcXrZDBQZmQqO3hN4/TW/V/2IF3h2erVPGXH9B7esvLAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqPk4MaWtY+z41i9s8MZd7t1cPJdqMzCL04nYoQBho8=;
 b=WsQ7gzUFiygjrdOi1pC6kzgeKB2b6m/2CBlsNGBHKnoDbLfd946x3OIOR7gEliwXoXNQGLsJd5KqKUoIyaLKVE4dlm4tCbrljfn8PCC+BRFB+EkndDumq4uNSU6ulzEDXgkoZMSP1/SM6DAn6SNRj4ZoNYHnTW1Be1EkIJX9SZX+RJSaqkKbMhLfZ4Lwp5Wqn8TRUAY7ePvkot98IY5WC5+3s0WEHCP4/8nA6d79d9Bp6q4A7nDMhY19NOX1g6LXuNFxHDpn+J1V7U9K1BC55ovqLzJKVj15C9Fh94J40C2umFvtWViGnYH0Xtkj+rqxTINnDxlZhL9s9aq/+AgXqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqPk4MaWtY+z41i9s8MZd7t1cPJdqMzCL04nYoQBho8=;
 b=bfTGSYzk6tFtvHcvWgR5zhIhq/6IjgGgFsSoC+L+7rHw9fc8p1+/D6faZB6zZTHCyb1pT3mpz0QH8M7PE5Ve4PtbibtBH3ZswAs6DEwSxOn8VhXc53YXGXcFRegsjOb3bdm38vXBSovcwJ+WRtz3RYizPUwxR8UBTHTb202Lf/Q=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4024.eurprd08.prod.outlook.com (2603:10a6:20b:a5::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 10 Dec
 2020 11:00:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.012; Thu, 10 Dec 2020
 11:00:09 +0000
Subject: Re: [PATCH v5 4/4] block: qcow2: remove the created file on
 initialization error
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20201209203326.879381-1-mlevitsk@redhat.com>
 <20201209203326.879381-5-mlevitsk@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8a89f793-23a9-e209-bc34-fe273897143e@virtuozzo.com>
Date: Thu, 10 Dec 2020 14:00:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201209203326.879381-5-mlevitsk@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.5 via Frontend Transport; Thu, 10 Dec 2020 11:00:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 727e08a2-28a8-4e5a-660a-08d89cfac2b2
X-MS-TrafficTypeDiagnostic: AM6PR08MB4024:
X-Microsoft-Antispam-PRVS: <AM6PR08MB40246A219C2D640B99CE155CC1CB0@AM6PR08MB4024.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V6aU9ZIIPmNnfvu7A/RkuTZUgpskRZ5CizOkaxhB5RkC6Q+ixCBC763IhmndCNAgzG8zb9rO5r4Rk8Mko32AHuTbJJMqoIR8od/GheWRLZH6gJZge9UA4WANnnjxjX9XtPmby5y0h1PWk7R1jslanDuAY1BCbMPTg3if8ljRcYyeoFpQxG6rYD+YAPWmVbzTTA/hBHK+8wIN2y7V+zDHoOmqfKPJDmse//gVfliAbH309iMrflu0Wn/NeymBQ5L96/UBONiyCe4Q8rLn0iN0o74OJQO+kGhCMhF6rokOitiwCxfwnF4kBwKmunCj5pbWW5wYs4ysoP7KDwziAPLac+1nCnFab5P+t8olY0VV6wZSZjPwvLLyXz19TSZS+ohoKA291pEpAGordePyMzT8PJTLQh76Gjt11I9fJSMiIHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(136003)(346002)(376002)(366004)(66946007)(66476007)(66556008)(52116002)(2616005)(956004)(478600001)(2906002)(31686004)(86362001)(8676002)(26005)(316002)(31696002)(16576012)(186003)(16526019)(8936002)(4326008)(83380400001)(6486002)(5660300002)(54906003)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZlA5S0FwWTBrdUhabTBPSnhkdW1PWXgzY1F5YmQxVFlQM0V4dlFrVDdEemwx?=
 =?utf-8?B?WTFsb05hOTFFeU9qczFOSzI1alZIY1VmeEZnaUVMbFpyTTZ4NEEzT0w1Z2Fa?=
 =?utf-8?B?T0V2elNwalFjZ2dMUGtIT0F5eTI0YXRORXhiMytwdjJoR01kVFZzbkZmYWJx?=
 =?utf-8?B?bloweS9rUXRNbk9TTXEyekgyZ2pJTkdGTmFXeXdWWnMxL2VKL3ZEQ2dMcmZa?=
 =?utf-8?B?MmIvTXphNFBkZGpsOC9OdFZpVldSVmVaaVZzK2NxalJqcklFem9FbDNTek5V?=
 =?utf-8?B?K3l5WGdQQnhvbGRDbUl5TElycEwyMVlkanJKTnRmaXFOK0Z0RFRLL3pNTUxF?=
 =?utf-8?B?QzZjS2JjaU8zNUFJWEJYT2FGbkQ4VW1PMGpuVzh4RWJKR0FwMXkremcxbmpt?=
 =?utf-8?B?a05OdzhNYUdTQnZxS1JTS05FL25DTnNLSE1yMStLTWZhWS8rZm5IMzQ0alEy?=
 =?utf-8?B?VVM2MlFaN3AwSFViQVVLN1hwWG1XL2locVRZZ2t3OVRnSVdKcE5oQ0laQ21X?=
 =?utf-8?B?OFRhVEJwWUNRSUtLRnFkUmN0dGR3OHl1d3JyWEMzcDcyZzNvK1NXTStrR2F5?=
 =?utf-8?B?WE00L3hzSjgwTXJLcEJWVE9SR2dSOXdaemVBT0hQdGFnM3l3THNVZGs0TS8z?=
 =?utf-8?B?cDRBaC9hRGVMNlJXQnEvK2JVSXhaUExsd3FVZzZjV1ZWdS95VDBpeWR6UjFi?=
 =?utf-8?B?OGVHSjR5eDdlZ3g1a3Y4N3lxeWRUcTdEWVlWc21JTDJ5N1RlYkg1SSt2Zkd4?=
 =?utf-8?B?TFlPOWMyRUl2NXJSMEpDSkZYbGdraFRzc3VHMGhhZmdJY0doSzJ6N3RjTDlY?=
 =?utf-8?B?YzBqRjFjbThyTmpHY3ppVDQzcGFuSjNSVUFiTXptL2NRazc4WHJLSmtsdDYw?=
 =?utf-8?B?cmMxOTNwajBudXFIN1VMTTQyTHl0UGxmaTNCaTY0dGNQdmordjNkRlR1ZXVi?=
 =?utf-8?B?VjJLM0ozaWFHQUJoU3lWamtBUFJ1dHhaOGhnbTFGc0NwWmV2bU9QSHk5c2ZJ?=
 =?utf-8?B?MmZHRllEVFIxZkxPRTNJM3M3VWVGd3dreFJKZEIwSmR5eGdpbHcrUmJaSzJ4?=
 =?utf-8?B?NGxnbXFyV0dyY0RSTkJUWUNrc0d2OGlySi9Kc0pxeUpwa2dBTGdKaUd3d0ZG?=
 =?utf-8?B?Nk9INWZ5MllzR2VBb2swSE5VNkp1aEVVcWcvL1pncExiK3doc1pySjJwYXhB?=
 =?utf-8?B?QUh4bmU3bU5EUS8yTGV2WFEwZlN2RnlLbFdlbUxnNmFnRFFncUVxTC9LU3hB?=
 =?utf-8?B?WVZCOG9vTWhYaU5yQ3J5MDNDbXJXMFNZNVpQV0VLWVRLTlpBYTlKNjgveUVr?=
 =?utf-8?Q?v9pLX9SxW+tKnNkwG4BbGLb+QBw6CGt898?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 11:00:09.4675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 727e08a2-28a8-4e5a-660a-08d89cfac2b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgKWfDVs4H1KrNr6GfIWyq3RxSBNNp4vvMTkjKgEQWKslnZ1X6HFDJISSCfZ2199jWdW7p7qPa6HR5sZOUXHJ/XyMz5I2jg7A6H6M1P6CtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4024
Received-SPF: pass client-ip=40.107.5.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

09.12.2020 23:33, Maxim Levitsky wrote:
> If the qcow initialization fails, we should remove the file if it was
> already created, to avoid leaving stale files around.
> 
> We already do this for luks raw images.
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> Reviewed-by: Alberto Garcia <berto@igalia.com>
> ---
>   block/qcow2.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/block/qcow2.c b/block/qcow2.c
> index 3a90ef2786..68c9182f92 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -3847,12 +3847,14 @@ static int coroutine_fn qcow2_co_create_opts(BlockDriver *drv,
>   
>       /* Create the qcow2 image (format layer) */
>       ret = qcow2_co_create(create_options, errp);
> +finish:
>       if (ret < 0) {
> -        goto finish;
> +        bdrv_co_delete_file_noerr(bs);
> +        bdrv_co_delete_file_noerr(data_bs);
>       }
>   
>       ret = 0;

Ooops :) After this patch the function always returns zero :)

> -finish:
> +
>       qobject_unref(qdict);
>       bdrv_unref(bs);
>       bdrv_unref(data_bs);
> 


-- 
Best regards,
Vladimir

