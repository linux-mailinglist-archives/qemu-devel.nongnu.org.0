Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B853A0141
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:15:54 +0200 (CEST)
Received: from localhost ([::1]:57794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqhCb-00044n-HE
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqhAv-0002Lu-AZ; Tue, 08 Jun 2021 15:14:09 -0400
Received: from mail-eopbgr140137.outbound.protection.outlook.com
 ([40.107.14.137]:25801 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqhAs-0001Ld-Kj; Tue, 08 Jun 2021 15:14:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLIQxMyEyQCsiRIHami4w363o+8YRrFlpzJ09IqkbdUR9xwttBGMYfNswwypgXmINri6dB+BAwSJULlt7nO+qroGk1fYMyBcEdqSNK7ZizOYT6E5gph7Q2z1Nsh6O2q28Qxa/uCBlpkar0gV1MAYC4JjacVU4CGAjvJfM2RIoxi6QUcEK5WkzvIF6NScX2Q9HjcFPQri4DlnZuEm/vdB+QqOkMM53nt8MOs6tctvfzGJrjq5a2uY1hz2kimDI2bSULBvO/rx9y2OnNok0VTkC88E/f4nuOHK6yMQBqFHanNGUrN0W60T+obbpRn5sOZfeqkPJkt2uROUknK0qQpx2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qO6zH+r3R1V7b2cf2UVy0LW81XEFfvPhyfnwwhuKJU=;
 b=I7mCmPzqGk+XIMTC+oJdpMDust5ZEBqnlOyfsR1BjTiFeZEWbl4JARqCM+oL1lfbZy7qDXL9OQzIkVrAFioqlaEZOuZvm7pw0csqEBh5lim0flzvAvMt9RGLmzOeY+3+4xCrV+5cZlVp6BQQREfesuCrWo2fIvX8wFy/ASCPZ6qZ4NDT0PIvxYOLmul5pr62eI+4i2lI72vfnsIEZviTcn1ade2kUrVicAhowBGh0vJHnS2ZiZvWlyfxtWpuccy1ohQEUtNfWjszpWROEypcRiXYybgzGcOiYFBfZEdTMT62qvMgdqfvySNKGQZllN2VoymQD32DWhHqqqnq1VRBxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qO6zH+r3R1V7b2cf2UVy0LW81XEFfvPhyfnwwhuKJU=;
 b=dnSmU7u9TpxbaFb+ib0Bbw8wqG3JEXyfs+jCjDvNRvOoVxyLoYQZ4iwqsQ4EQEqTXbi+3nnun8eMcEMjvuFwj3TidsTJiqtxFfnL6vMSzjJmgw7j4PiPqJ8Ai8h4oo+Ok30bmJGYT4oGhWsUuIh8O03iHXgVS3qnz3s3LOamogc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6533.eurprd08.prod.outlook.com (2603:10a6:20b:33e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21; Tue, 8 Jun
 2021 19:14:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 19:14:03 +0000
Subject: Re: [PATCH v4 1/7] file-posix: fix max_iov for /dev/sg devices
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, kwolf@redhat.com
References: <20210608131634.423904-1-pbonzini@redhat.com>
 <20210608131634.423904-2-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c8fcf5db-fe39-a2f7-08a6-95ed29619704@virtuozzo.com>
Date: Tue, 8 Jun 2021 22:14:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210608131634.423904-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR0P264CA0158.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR0P264CA0158.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Tue, 8 Jun 2021 19:14:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24cd62ed-57a8-46de-6e83-08d92ab1943d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6533:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6533999A54C792AB8A99D51FC1379@AS8PR08MB6533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7nAQnujoMw+hTjuK2eUI8T5BLZqHsnQ4JJ3K3h2ZAkWdG61sFMZJvFpwgRzEBBmqiuc1YVHlW8juxqQpDHYXc3yRvFZEYf1kvG/BKxkvOuerjVLHFs+nN2/WYOx3xWtHbUA/0RcgxoHGjIrczB7dt/pH5y8zC4Qa2xMQZkkB9skYV9Ei4aZW9dqSl0z6H/ZgLtCBrNtHLZtZhmK/2mfjuSbgY6CWRsMQcU+5eK1HbvU8K9BclvsoEAaUGi6QL2QjUlFayIEF9UBsrQyLcrou21m/ma1jT78WgkV5XmhokXaBW9WwQlMHf8N2Ogoawn39EtXWbiJ7zs3GPN7SPtKZcpOzAWp41wCE1OdSzf7SaQV3D/odI2tIOQbeg+qIUmtkacGkw1C6IsUjn+TEpB/MdWNmOrcqMpA3IJIsPDzxA9uvkX8T5SQ9cdwvdsbHwnzhK7B0COOSf3+zrhQMntdRs6/dZMgw426KEQ/aYqnQ/nbkNIINoxw5w3mHoZI1UgIxl2w11/hm/VlJNfrfxTMdML9K0goLrOAV3Un92knbd5MBqRJWtzFhUqBQB/51xcCpRXPpotqJIo5BBDuPilC8w4Yh8e31NzfqQ+bHlbzOn0ohGgEvRgbYmZ2JxOdLh7BAYRf4P26aCkL/QPgE4OnNm5Jgek7AEa/hUyNvk5zsFwudlBlmqxex94V2/BbeJrHmLBiqd/73ITvPP0Cy803ANLEOTALfK+uSVGxauOh4xgE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(366004)(376002)(136003)(396003)(52116002)(31696002)(66476007)(66946007)(2616005)(8676002)(956004)(4326008)(26005)(16526019)(316002)(16576012)(5660300002)(186003)(478600001)(36756003)(38100700002)(38350700002)(31686004)(8936002)(86362001)(2906002)(6486002)(83380400001)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SUdhQ0dUbnVEaWdRT2xRMFNvNm1Kb1pLQjlaZnhXY0tPRVJWYittdExvUW9u?=
 =?utf-8?B?S0hnMFA0UWsvTFM2TVNKVm5WZW5Tb2gvNVZOUkJyWUtGRFh1bU9DbEUrYktZ?=
 =?utf-8?B?bnB2TXptcnVHRnFwcUh2OHpvQnFLd1dvK3NKVWhITjJXaUpuYlZCNlFPaVJT?=
 =?utf-8?B?Rk9CcTE5ZVhKNDNBWEpOa20wK3o0dU5mcHRocjNTZnkxQTBOWGdIVmR6cXhY?=
 =?utf-8?B?Vko1OFdZRytwcE55eFBYUjNDR3JrYmNFSnE4YlIzV1FNRThmTFl4bGk2bVlX?=
 =?utf-8?B?dFpsZURwU0loS1VSdmtOYUlrdjhJdXhsVUpjY015MUdNTVBYa2VtYlRkS3ky?=
 =?utf-8?B?RTNiMkhWTXpsdTNlWm5QRkhoMHdNUlZSRC8xNFpkTU5SZDkyS25OM0ppQUla?=
 =?utf-8?B?UFFWL1NrcXdieEVwcUJJTmlTcExiUzFLOHMyR0ZSMmsxUDlWdTZBbVVoYmRD?=
 =?utf-8?B?cFRRUzhGMTFwSHo4TDRXZU1VeGhRdWQrVk5UUTdqaGEvVWlMT3Z6VzZaamhz?=
 =?utf-8?B?akN0N1JqcG9KWWpiZnZHU3ZJRHI5NVVOZy9FWjZLU2lDZkRZVStUa2lwYWNq?=
 =?utf-8?B?elNWR2U0SFp6czNNQ0M0Z0YrczRUUEdWcnR5NDhDNnJQOFRCUU5LNTNWdisz?=
 =?utf-8?B?V1RCelIzRzEzekhPa1lBWjFaRDI2NXd6d0VKaFBTWGdRYU5jQmZSVTBrQnBI?=
 =?utf-8?B?MVVjUTJkdEtkaDBxM2hmQTlkMjhOSlNjNnZvZkd2OEZaQ241ZERIUmI2bzB4?=
 =?utf-8?B?a0YveTJjRlVZNDRvMzdDQU1Ec05Jb0RiME5CekphVzdDMk55cDlISHd0bk0x?=
 =?utf-8?B?YWgwQXhsUXRvVUZSUFhnYjJ2RGQ5cnZDdS9USXJyMXJaSHRqQXBDVlJranJG?=
 =?utf-8?B?VlVlSUxPeWhWQXpwVlFEWFRvb1JSTFEySmNSUFM3M3ZUb3BZaW9KaFVtK2xi?=
 =?utf-8?B?T3JQYldlNXJKTTlCU25Jc1pRZ1o4NHFReFU5b2ZwYTg3bUdHRG9MdmNkZmFX?=
 =?utf-8?B?b3MwYnRCQUhoUlBOUTF6NzV6YWZ5NXQxY04zcnFDN2FDQ3pFc0YySWxvUk04?=
 =?utf-8?B?anFlMlpVNWYyWTFLbGNhRVRyamc4bldtRy9HUEFBcmREZWw0WDNkQ0xTaWxY?=
 =?utf-8?B?MSthN3RyK3YzeWNGSG5rZzQ1cmM4K0tycklaMzFPaFNTMnFORGNpT0VWUFlY?=
 =?utf-8?B?YldYTWw5R05CUEIzbzNYVXJ2eVVtaWhKZmVQWjBHcjJiSUxvWjlwMDBCYi9m?=
 =?utf-8?B?NzlXeHpHaU5YZXJjc09hVVFCQ202Mm5oSHRFN243Z25aSDJJdzFnMFAxVlJ3?=
 =?utf-8?B?ZitQdXV5b3lWOGZCV2V3L1pWcDFEbXlqMllaWjZBYmhCNlpzYTdEU2wvQ2RE?=
 =?utf-8?B?MkNQbDh2U29wOFlJYUh5VzRLR1ZLMGJkT1JMYXpYWkJXZmc2cnd3Z0MwcUQz?=
 =?utf-8?B?WGZ6TlE2WU9XZVkxem56YjltV3NBazhwbDZiMmhMbG9PL0F1S1Z3TnY4SERo?=
 =?utf-8?B?eFJIVi90ZUZxSGhQVDd0Z1V4UEFHMllKNFlRUlNJWDNxZzRUUTFsT3RhNlp0?=
 =?utf-8?B?ZnNvMWlqbC90ODhYU2VUck1tK2ZYZ0VkaUVBNk5rcThKeTlaZDlNUVBFZzhs?=
 =?utf-8?B?Ymx6RDVvMkpkYTBYYmMySGg1TmFrYkp6MVV0d0REOGhRZ2hHdmZMVEJZZXd5?=
 =?utf-8?B?eHMzLy9vOVp4L1RielB0a3Y5QWVydmV4L3NXT2I5aUpOV28xdFVkeTc2OHg1?=
 =?utf-8?Q?hIzmvWaVSjp93VIa9ojpHxRMcaGizUgGzK/zhiB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24cd62ed-57a8-46de-6e83-08d92ab1943d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 19:14:03.5761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCsKawVH5tVe22f/vYzzT3/HYb9zZ1dPMqJEw5FsjJuQ+KAmEpjbvVaFVge39YR/Sy/m7g3aZZet85Hz6j5r8dceamcc+NUXqGxZkojdMMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6533
Received-SPF: pass client-ip=40.107.14.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

08.06.2021 16:16, Paolo Bonzini wrote:
> Even though it was only called for devices that have bs->sg set (which
> must be character devices), sg_get_max_segments looked at /sys/dev/block
> which only works for block devices.
> 
> On Linux the sg driver has its own way to provide the maximum number of
> iovecs in a scatter/gather list, so add support for it.  The block device
> path is kept because it will be reinstated in the next patches.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/file-posix.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index f37dfc10b3..536998a1d6 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1180,6 +1180,17 @@ static int sg_get_max_segments(int fd)
>           goto out;
>       }
>   
> +    if (S_ISCHR(st.st_mode)) {

Why not check "if (bs->sg) {" instead? It seems to be more consistent with issuing SG_ ioctl. Or what I miss?

> +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
> +            return ret;
> +        }
> +        return -ENOTSUP;
> +    }
> +
> +    if (!S_ISBLK(st.st_mode)) {
> +        return -ENOTSUP;
> +    }
> +
>       sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
>                                   major(st.st_rdev), minor(st.st_rdev));
>       sysfd = open(sysfspath, O_RDONLY);
> 


-- 
Best regards,
Vladimir

