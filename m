Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909F1422F92
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 20:02:28 +0200 (CEST)
Received: from localhost ([::1]:37558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoln-0004a5-Kz
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 14:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mXnGC-0003LB-Nu; Tue, 05 Oct 2021 12:25:46 -0400
Received: from mail-eopbgr70118.outbound.protection.outlook.com
 ([40.107.7.118]:26247 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mXnG8-0001qr-FN; Tue, 05 Oct 2021 12:25:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrpIsZDNdXyGJiK+dz99zW/YFKMunkQU3vvDF6wrZquCyzEcPR+b78LOkZNCJq1faFjB/I8l/5MeXWZx79bpEcFQhco7aaI7n6GnlY7kiSUhDIBdUpXa/SDFPu6LvvIx5PSj68BwRWJ9Wxm33dtEd7hkMwQVs9nD8yejrY/XY+lwld0Z5FCBTA0ovXnkrgJzFMUKLjT0baE1H+NATx6IOb3Zdz9828Rg25FrymrakBFRhgt0bU3jGKbMrUWeqlxn3KzUo2sYuPlAPx9Ue7cUPluWWZOqh/xdx//Gj/G4canLDgv5fUVrsCUTs1GIdxLwhAoBhP5K0vlYbO1PHuSc9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykH7KdN1299MYoh8nmrvnMIikAGyklQOYaKmWsuiXCI=;
 b=ahOrtWvffgGRlxziEIcA4DoGDZp8wRHXgXzdTw0iGkxSHetlhoZNx77BLavmI2CkVsBtmXDwVn12VwxZwPoO0zkGJqEaJbn01mBx+97LSL+6JKoFxT6KIo5CBuNnGRoqcznauVQ6qpdF57CyCbkm4ylAlmSgVBoFW5fWO6FJ0NdDDOt2Ds0zvKUfobx3CQOZhaj7TwYr2MB2/gNf3h/x3Vurasgx7SOwgBFYlvdSar1xVBFtcypkOzYfTigg1+rbSFvDs5geBjoFdcKbUNsDa7XQtmFfrQYEiukECFDan6Q4HXxIJqbk4pcxXdn7WB4O0RUDBGC5h6s3RzzttXJs8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykH7KdN1299MYoh8nmrvnMIikAGyklQOYaKmWsuiXCI=;
 b=RJUa3m/8c6fjzBNY65zMDgZn/bvYBwg6KsAHpiAOQe/JtSuWr1I7Y0aWJB7lKCKSvp9wR/ICEUwdiOk93Y3IdHya+9qfwjocQ/7kbYFnsllsugl5Bd8i0a6yGEOVOQF1JZB/pgRfqVph3veICO6jE3nMSywgcqjY++qIQXEOhh0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5206.eurprd08.prod.outlook.com (2603:10a6:20b:e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Tue, 5 Oct
 2021 16:25:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 16:25:36 +0000
Message-ID: <ab53f4f8-da8a-df72-37b7-36714bd17f43@virtuozzo.com>
Date: Tue, 5 Oct 2021 19:25:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] block/backup: avoid integer overflow of `max-workers`
Content-Language: en-US
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20211005161157.282396-1-sgarzare@redhat.com>
 <20211005161157.282396-2-sgarzare@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211005161157.282396-2-sgarzare@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0007.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.207) by
 AS8P189CA0007.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15 via Frontend Transport; Tue, 5 Oct 2021 16:25:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bd886c8-2dc7-48f2-e213-08d9881cc2f6
X-MS-TrafficTypeDiagnostic: AM6PR08MB5206:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5206990567D533425FA8851EC1AF9@AM6PR08MB5206.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LA8buvCcLhCquaImExMX6BlhxoVlq7fbKSUzkjzHbiW5xCPCpAVo6RPMK18VX+ZEScQTidQUF//nDk1zWiWLT09fB8Nx9bgLxFWeqiVCfdkcUJ8Z9lq6yzxCpYnrAn6rDiQTtZQ/XtQeC8sIm1xjiqfyKSfC22u5KPp0rKY2gtVe8aXIBo//FqlgYHzYdMttuL/KRClF6ZKDVrp9xkmt3f6MQbAjmHkOK7AHfzJnBHcbSgkparmHnlz3SwAShU9o9oZtbZ8kJLje5tBOnim92yZdsL+UcAWRbQWFmynRe7mRq5YNiq07fugllAN2v2jbd49tPxEE/lUvi/slbAncTTKpBhSiCylHks3Tbl9hIAIny8MFKIqtPeVvTIcfE57IMcnh2/0iusvVFUFwpRxy2BIJsCrTLt174swtAG3zrsB6f9D8U0I8vRm0jWTJ1j4Jj0gEy+TX7K7oNasNyxP27TjVqdQ9mP2CXdaMQp1hGJnNZJaH+l1Ucbga5KjSlvNK169zLnX1BPwd44ZcpB3ke2Z712SaLNujxmr9UtSUMp6v/5yHkYtY3cjP+RWtCXzA2UI8cr+sQOhD6n+kougTGy5Oh3t/tfsPFt3o1gmJCtE7wL2uQoDP99wvhT0EFN98HMn9qMLoI2ZUxYR8ghAGg+s+ibfzsaaKSLukp0UtSJbgkulAmjL4YiXJns20kKx2h/jWKg3iu/2UVu18BC83k8DrgePoKyfYHZr5/oCTUIcC2gN8ui9Jy9hl3aH1D6AS2TllW6SHZyKrSBKlPlrckEHvFTxeOTWyorhv/wkA3/eJXO8WbhNBlsgqI0rTy4KrqdVWFfCeDFwYYupHo3/2Ot73cNQBZBFgAya6RT0ueBRw4bZeEn4hbLcFs0vYYfDu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(4326008)(508600001)(86362001)(66946007)(83380400001)(2616005)(966005)(66476007)(8676002)(186003)(31696002)(31686004)(38350700002)(38100700002)(66556008)(54906003)(6486002)(16576012)(8936002)(316002)(5660300002)(2906002)(52116002)(26005)(956004)(81973001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SC9KdUxIQ2VFNURwem5FK0NEbTkrU2VkdjNlTFVDYlg5cnRaKzFFbjJUaEo1?=
 =?utf-8?B?NTR4cUw5N2hYZE9UeFRmMjhpOE44cC83ZW0vU01hNUpxMHVPWXJrb2EzL2Js?=
 =?utf-8?B?WTRTMm1GVWw3M1V1YytiRkZLQmNhUlBOVkNOYXVVZ1V5L1pzM056am5XUnF3?=
 =?utf-8?B?NVBoYUw4ODM3SWQwcjZlYUlyaFM1RXhxYjVIcWl1Nmg2MnRremNWMW5TOVZT?=
 =?utf-8?B?bFEyU2xyS3VpSEJEbmRWUkJiMGxWY2lYZ0diMWljYTQ2ZDVQNS9objh3RlZF?=
 =?utf-8?B?YWs5cjlKWHVoYmxRdkNRaGZIOTlvcmxjenFYYks4T3VMY1ZsNzFqRG44Slpu?=
 =?utf-8?B?dXZZbVFGSDlDYmdFbXUwbGwrbWNpbmtIR1JRSHNmN3Y4ckNNT1Ywa2ZVUDhE?=
 =?utf-8?B?RG9lYzc0WHMwckVxK0ppUzI3OFhvUEhLZmNwb3hEOStXYUxTcmtMQStIZEVL?=
 =?utf-8?B?UjhtTmo2RTZFVkFiYjRlRXFGcy9kNUR2NHQrZTh4SUZBTHhqM0M5NEdwTTI4?=
 =?utf-8?B?NzRVMUpFRElQcCtQMzVKR1JRMjgwVjA3VDVkSXM3ZFh6MjdES0p4NXlzcDNO?=
 =?utf-8?B?VUR4R1VrOUZ6MlNndjFBZktmNnpVenNNRjcxaEl5WVQ4enRLWXF5a01obmt3?=
 =?utf-8?B?aTd5UjFvTXNpQVZKWGVKZDVXdmdFdUFLYmtaOUpGRVEwRjdqRVBKSDBHUEZY?=
 =?utf-8?B?YnlLeVpiZUdCMi9uWnB2aG95cXBEaHRneXlMVFpJa2l0bjFZa1IwM21tY1dL?=
 =?utf-8?B?dFY0Rnd1S3QrbDlQb2JJbUw3YWtZNmpuTlpBSGhkbXUrUlBrWGEzeTN2dWdu?=
 =?utf-8?B?VjB1bzdqNjhsMXN0cEtFMEdqemhoWkQzTU1zazNvZXp0RkluUXNoMVhQSHpQ?=
 =?utf-8?B?RGwzbDkzaG9LbEtlZWF2TFkwM1FWUVU4T1pWbTZncElHc0twUldGM1NZUEln?=
 =?utf-8?B?bGdIUnB0QTF0TkE0MFQ0UU1ZMFRDMzdRMUE4TzZ3eDJBUWdLYlpCSm05QzB4?=
 =?utf-8?B?VnN3WWg1Zy9rYWFWaHJqcXFjQUptOWswKzl3VlRzb0xTWXgvcjZFbTZkNEZn?=
 =?utf-8?B?NGJ1dXdjcC9YekZSdkt1UnpBdnVpRlp6YU9wbHBpNVcwZ3lwYTJMZHBPeXB6?=
 =?utf-8?B?aTlUZFNlSktzWTdmYzQxenloTEhZVGlHZ2kyL21Uc3BLYldISXdWeGVmazhP?=
 =?utf-8?B?RlhubVlrVUIwK2NWcitwUmpsRG1hUDNtbUtJamY1eVpUQUlrUFh4S3pGVStl?=
 =?utf-8?B?ZmJqdmhhcW1sTktkWXlSMzRUdURIUGZ2WmFYelZlcEk0YUgyckZKdWV4OWJL?=
 =?utf-8?B?ckNQa1k5U2JyZlpXTVZFZURGL2x3M0NKVk5mQ2w4Wnp4RzlqeXl6M3JuWnVZ?=
 =?utf-8?B?K1RDVXRiVytObUFiWlRyK09NTHp5RE0vNnpabkR5Mk5hUUp3TjlyV0hsbzZ1?=
 =?utf-8?B?b1RzOU90aWlEcUNlSFZGYUloY3BtR0J5QWRZQTg1am9PZVI3b0U2Mk5SSHpw?=
 =?utf-8?B?UDlqQ0V3cThjaGowdGFRV0ZKVkdTUlpYRWJyTXpnVlY0RS8rMzl0U0JYMHNx?=
 =?utf-8?B?eW9ITDloZ2pYaGlNU0l0Nkg1U3drbWVjQlJlaEh2REVwMGxJSGxMU3FpNDZl?=
 =?utf-8?B?M0xwQWVLZXVLVEh1azdQdVFkMWRzOVVHTGswekVmTEMxS2NXU2QyT1Nuckx6?=
 =?utf-8?B?dmsyK21sUWRsbWpjTGVhM2pqb1VtbGlQc2ZIbnZ3dzVDRXRrR0VUOGU1cVVH?=
 =?utf-8?Q?zSfI3TDOQDzTiEvMq0BDph6otZL/18g/LP/C/28?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd886c8-2dc7-48f2-e213-08d9881cc2f6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 16:25:36.3357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5IiQXTW5dGsELmWks1jfQmBfu4zVR9TFq0fJVx1b8Zb16pvmoGjECTxqrPRk9JguwxhO5SQirMH+KE7l39a6pU3szxauTVshhM2YxqOfSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5206
Received-SPF: pass client-ip=40.107.7.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

10/5/21 19:11, Stefano Garzarella wrote:
> QAPI generates `struct BackupPerf` where `max-workers` value is stored
> in an `int64_t` variable.
> But block_copy_async(), and the underlying code, uses an `int` parameter.
> 
> At the end that variable is used to initialize `max_busy_tasks` in
> block/aio_task.c causing the following assertion failure if a value
> greater than INT_MAX(2147483647) is used:
> 
>    ../block/aio_task.c:63: aio_task_pool_wait_one: Assertion `pool->busy_tasks > 0' failed.
> 
> Let's check that `max-workers` doesn't exceed INT_MAX and print an
> error in that case.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2009310

I glad to see that someone experiments with my experimental API :)

> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   block/backup.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/block/backup.c b/block/backup.c
> index 687d2882bc..8b072db5d9 100644
> --- a/block/backup.c
> +++ b/block/backup.c
> @@ -407,8 +407,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
>           return NULL;
>       }
>   
> -    if (perf->max_workers < 1) {
> -        error_setg(errp, "max-workers must be greater than zero");
> +    if (perf->max_workers < 1 || perf->max_workers > INT_MAX) {
> +        error_setg(errp, "max-workers must be between 1 and %d", INT_MAX);
>           return NULL;
>       }
>   
> 


-- 
Best regards,
Vladimir

