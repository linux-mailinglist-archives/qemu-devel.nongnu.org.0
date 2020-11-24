Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C292C2AC6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 16:06:26 +0100 (CET)
Received: from localhost ([::1]:33814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khZth-0005Qn-Qj
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 10:06:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khZsN-0004lk-Kh; Tue, 24 Nov 2020 10:05:03 -0500
Received: from mail-vi1eur05on2090.outbound.protection.outlook.com
 ([40.107.21.90]:21056 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khZsK-0001xL-Cu; Tue, 24 Nov 2020 10:05:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RY1we6sofq9ma7AxyFqJn1BaqaEFRsXEcioaHMmGmAsaD3379bQAWThqXq//McGbTH9vfihIAP6nm6/nvIn5GW6uiOJP1UxejGLpEGur6hvtnpPqKEWO5jnSqBOewXRbotFClgXsN+R+jc24Qru4jdaeNU/WiZOn1gkFFe0R22L9wLaYWWhdl3FwDY5NwWPFPoptXBQ2MQaBCNevhaYI4J/BXshfdJxUlsTOs7IHya3ISfvFA+IjqHEGXp7M65+heSEPfWQ4W8CSobjLFPU/jtf4ECVg9JAJjQdjPCobvZSgy2Mf6lwj2mMmFKbhoWY2NvMQlg/wq3ErRRDtBt3mgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kkj27t/wncRnSaXkwy8SwLcS6jOBarGYkc5UmyA4bvI=;
 b=mweDICssi69d1hZQcP3SsUkYDrYbjKp+4mjGKO+pQB8uTV/Y/ZNPyeTNfVQxPcNnsqcx47ldcHiTW4J9lFoeYIUZIl4oZYmtlmAU+UbCKeigjCHTWsFc+lFi67HZ6sw8B7tepbMOLKUeknghH82lO9cENbw65rv7//TrV91fjE/CD3BhR6Zhr1HkkZK2iKV6F3CS6qkIuTRQ92lEfg0J4JJR+DPMpXWY4WHY/nO1s8YDGkAm+9rw1KSHbzLjo2Sv3orwWFOgcDnxgFg2B47QIhdxF3De0NR98ZjYrFbqd31ju73CRV6GM9iFILX14MbYHUWwUPs41KzXdUzDcKtXYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kkj27t/wncRnSaXkwy8SwLcS6jOBarGYkc5UmyA4bvI=;
 b=qYa84rw1jMkAazt1ew9k3uBBvijbRX4s4DuKxVd5sxgFWgz2dJjL4KNcInmYTElhzV/LKGJzhogK7CSO4w6CHiW08Sa21DRc6eiNCnBdkWhMSm41NBjHL2Fe/zRy97zQphngU2Q6tz5iWrEkLoG3gPKxt1UISq47SDPyc8pwFQ8=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4849.eurprd08.prod.outlook.com (2603:10a6:20b:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.28; Tue, 24 Nov
 2020 15:04:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 15:04:56 +0000
Subject: Re: [PATCH v2 2/2] monitor: increase amount of data for monitor to
 read
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, armbru@redhat.com, dgilbert@redhat.com,
 den@openvz.org
References: <1606146274-246154-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1606146274-246154-3-git-send-email-andrey.shinkevich@virtuozzo.com>
 <edb0cc5c-62e6-7277-59ae-e49e721fa596@virtuozzo.com>
Message-ID: <3e73a07d-bafe-33cb-c4ed-3942c0abc853@virtuozzo.com>
Date: Tue, 24 Nov 2020 18:04:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <edb0cc5c-62e6-7277-59ae-e49e721fa596@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.100]
X-ClientProxiedBy: AM9P193CA0012.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.100) by
 AM9P193CA0012.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Tue, 24 Nov 2020 15:04:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f7660ba-9da1-4f65-59b2-08d8908a4de6
X-MS-TrafficTypeDiagnostic: AM6PR08MB4849:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4849BCD2FC2B982973CE85F4C1FB0@AM6PR08MB4849.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PmPfYWW3RZ2XAlnbZmOGucHAB8MBd68lYpnTSZGN6Dm5/WO7uLwWTspE+4W3wq2I/zdTxtiF6Ub+CPemOktGEC0TGVGKqi5jsArzkRDA3CbIrfHK6NFg6II99Z4EuMPeb8VLgFK3v56VtQKhwTuwBm86ev6COBWlBztlss25QWJaH9uhD3w9n8kenpzbUCbO+Uk3BRQB4Vd0+l398MLMdqfd86qyzENIPzbGE5OybYHz6jbBHHkW84B8M++tRa3LylA+9hEsHxu3Aa5Y/xxa6Q/7Ix4CndK+mC25NHu3zDYm6vJcjBg3nNmCaNz3xjffwCMDHkQCTlwjwwUrDVEow5iIYdNcd9YWzM0qfvBnY3aDa7ERdY9loHkERFRYkn6R6JJbL+6YwbCPvCSfSDtGjKnlvnsbXMI5SFeaYEYNWFTRCNzzFydIhMvI9MixTcrAgQErfC51osRquObEL0iYwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(396003)(376002)(39840400004)(83380400001)(31696002)(66476007)(31686004)(66946007)(66556008)(2906002)(107886003)(8676002)(86362001)(52116002)(966005)(26005)(4326008)(478600001)(36756003)(316002)(16526019)(8936002)(2616005)(956004)(16576012)(5660300002)(186003)(6486002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: Ns3gXqAxUeN/aMuTcE7/aotTCxjnnbnQuJb6uBaqqia2LgSS6ddV20Yqo7NWmvd9qdESYRIUFxhnorw5mH35BZ3YEPQ4kaZL6V4XssvUbF0aoN3XlbTLlVUdETYcPV2ovi/n34TNHd7NaUIM35mo4WONRXLZDStYRUlLIHrWS42pKDrfXbuL0Lom8cwsQ8DTtH9CGAeHhYMHwrfd2NwH4l5rmGx+JAxN/gj3SbL8SxoTHhY1fmAl8HCfmFwKpobAycvAd3ngDHLu2I8g7L/0MNy7ZGhwqA1TKMYnrZd6nCjJD5mi1NItI61IIAOENX2VqxsbNcH86QS8vMK8jXgoFZtf8Jv/IvAMm64cIVz0HExTpU3dN/A3xgLlJL9r37H0XNVIkTD0ER89oX6Am0V6klrhsuH8zuRZPcgEEf+H1fBNpnKP49cFFgmEIWQXCnFjvBya6Kb/mCv+/tZw4z/X4XbBHbz+/Zg2QP6DHUuKnR8kNtJ5mWVgBtpI3xBFcHj2Bq1/wXUVsFhCMF9JYH9MPv1IXBOFHL10/CIPw3jnyU8Vkicyis9VDUcQYIG8z3VOqFMiwwFT5EjU+JEEbZcqRk2Ponc1USvo68XjPYZ9R7HQ5Au/jO6Y56wnoJt9XxOX+8RltqgexlDXEv8E0gRhlYiNuOG50pMBYoblZcN0Q7SWcKZXT/cDBmTCCt0LV0idPhpCVlvUw7q0SdUSNgpKTU7udPoTVysPkwhYBhiHo+r1sVoyUS8pp46sfLxFHo9T3iojifs02TsxwQmRAgVcefK71jhZ8EwLoxzm4MRoCJN7Ls3DtOXguOFftXXJMPIOY9m7E9yAr9D8vm7tGGB7lWJn4lgzv5Dnn+r5DTXBGagv3JxepRqF0YWB3P9VzCTEEbv6cX+BVq3FugDREfUYTA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7660ba-9da1-4f65-59b2-08d8908a4de6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 15:04:56.3098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1+AHpHVwTlQLjQj7Z+GhnpXD38lSt49Gz7GiVP9T7eKk+upJMhNZ5elhlU3cT1SVDnbI/I90288HKa0M1+tDvE6ww4+fM6+xkn3kqFQX6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4849
Received-SPF: pass client-ip=40.107.21.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

24.11.2020 14:03, Vladimir Sementsov-Ogievskiy wrote:
> 23.11.2020 18:44, Andrey Shinkevich wrote:
>> QMP and HMP monitors read one byte at a time from the socket or stdin,
>> which is very inefficient. With 100+ VMs on the host, this results in
>> multiple extra system calls and CPU overuse.
>> This patch increases the amount of read data up to 4096 bytes that fits
>> the buffer size on the channel level.
>> A JSON little parser is introduced to throttle QMP commands read from
>> the buffer so that incoming requests do not overflow the monitor input
>> queue.
>>
>> Suggested-by: Denis V. Lunev<den@openvz.org>
>> Signed-off-by: Andrey Shinkevich<andrey.shinkevich@virtuozzo.com>
> 
> 
> Can't we just increase qmp queue instead? It seems a lot simpler:
> 
> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> index 348bfad3d5..7e721eee3f 100644
> --- a/include/monitor/monitor.h
> +++ b/include/monitor/monitor.h
> @@ -8,7 +8,7 @@
>   typedef struct MonitorHMP MonitorHMP;
>   typedef struct MonitorOptions MonitorOptions;
> 
> -#define QMP_REQ_QUEUE_LEN_MAX 8
> +#define QMP_REQ_QUEUE_LEN_MAX 4096
> 
>   extern QemuOptsList qemu_mon_opts;
> 
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index 84222cd130..1588f00306 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -566,7 +566,7 @@ int monitor_can_read(void *opaque)
>   {
>       Monitor *mon = opaque;
> 
> -    return !qatomic_mb_read(&mon->suspend_cnt);
> +    return !qatomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
>   }
> 
> 
> - with this patch tests pass and performance is even better.
> 
> 

Suddenly I found, that this patch ^^ was sent a year ago:

   https://patchew.org/QEMU/20190610105906.28524-1-dplotnikov@virtuozzo.com/

some questions were asked, so I think we should start from it.


-- 
Best regards,
Vladimir

