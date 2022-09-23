Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 265705E7695
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 11:15:15 +0200 (CEST)
Received: from localhost ([::1]:49484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obem9-0002tO-RS
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 05:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1obePJ-00071Q-UX
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 04:51:37 -0400
Received: from mail-vi1eur05on2091.outbound.protection.outlook.com
 ([40.107.21.91]:54369 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1obePD-0005sU-La
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 04:51:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7781aU8/AqkpV/MwjlYzdsKLcCKcu2XRLfJXpDO80lFmC90pRd0HksTCIS1CelIiyT2PDbAY8yMhTHVJ/A4ZDWrhpvisxE+i2yjrIweiH1o++1oetQ+jeUL+M3Jb7b71d9koP/2MaA6CB12Tv95K+K303crqUfQBbSi7Pqou9OAZGm6M4T5gUwa1uoNgs0m1pdhd58h/CRfGMPZLjRsLyc8LEJ/w7cmgIXIQH04eNjWtGUbUqFXExpjBflSXUO5wBlKl8doLX4KJN5aI2nz5dGRObOhvMpRI+x7eOgVHPRoAlVbaWnhOu4lKyCwub5uw6V8u6uZeWoNw+dOugK4CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjUsvFhK+kD1ajFuUvesbNW+lwfnb28XAHiMYttm+O0=;
 b=CQolROAIEt2QhWPbpVLlvk8ZrOav2XK8rkavx+yH98WFohJgJkidBxJahwBozQ7YAHSQaFaMlcLaHRG2/Q6JtzRMD//fOwqXs4NonwuJsEmT20H5a+/D69crvVzw46EyTn/eoFENc3CpfiGn7K1hJveUgSRz5r9k3mu0j6hbXTi83euAz7y9S9y39ejr8QfrKsi2vXi5gcD+2LsQvhmzaR1Rl+Zngzv9fuhps/WQ/oe+hVivGq804U/0XfPMqcYllVmQgTVNFeUOHyn79XNDsgtHQDuFT42/RLgQW6VVTp+mnNs9IQmrE5xGzg5HjSIw095yJdXupvTimc7xYU5a3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjUsvFhK+kD1ajFuUvesbNW+lwfnb28XAHiMYttm+O0=;
 b=CLuRzyvuI9yf8XuQtIsd7JsjBcAYqCEUydOz2IMkVpVU84ouG9hXq2iI6TKcaHL3cQjrjmgFjPIuN/dhb/4WExlw8tGQpgIROepSSSxkCzV652udGupPAczPfnNmtF+Hmt3Ou5YYpVsVCG5pp4zDMTb8J6ndzeqgN9NKEBqtkyDd6u432Ec6V3FduzjGT3nYojJmByvn5/0nL/yExOP7fRs8oIII+q5sqhPn4fCZKMgztj4meFq8vZtUm68Nrg1BhUSz3v3cHLD86b2HsiO+ZdLiBRT9HZeXUfzTS7ZI1ArHmZkKNUsLX8Ik3lTchFbavm65JoQsN482k6Cfzq6/Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PA4PR08MB7594.eurprd08.prod.outlook.com (2603:10a6:102:270::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 08:51:25 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5654.019; Fri, 23 Sep 2022
 08:51:25 +0000
Message-ID: <47a6adf2-d7c4-dcad-8dc0-fb94fd996679@virtuozzo.com>
Date: Fri, 23 Sep 2022 10:51:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/5] qga: Move Linux-specific commands code to separate
 file
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com,
 kkostiuk@redhat.com
References: <20220922132001.940334-1-alexander.ivanov@virtuozzo.com>
 <20220922132001.940334-2-alexander.ivanov@virtuozzo.com>
 <CAJ+F1CKNjr30P=q81uYxF0kZWc4AAFAoXuyiwULp=mYAv5FFTA@mail.gmail.com>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <CAJ+F1CKNjr30P=q81uYxF0kZWc4AAFAoXuyiwULp=mYAv5FFTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PA4PR08MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: 352bee23-efde-4ee9-4683-08da9d40cbd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4GmR40kW/PyVKlDIp7+yu03XLfeoeG4QaUt2SDCG4l6q7l4Qs/6zjoecZH3i3cBqe+cQlsL4S43YenLB83nDknrZaLSS/AU1GwNBgJP51KZkWdMUqXuT/r/4HghW0wifDEaPr1zi/Bn3fmaLVQtD6fkZhUGqHyT794+Oa/YcRhQh1Z5kVE8KKi3nQEaFzdMwr4LIQecUdkl+9Fu3TqR4sIjNE21HpccheOnTmFrq3iefQ60MZSfo1iSJa4UFvxtpnXM9RGaKefK1iH4vzYIRNA/uzV9+9xevGXEYjSbNJfhFvjTe+5wqmTWaH47cn1qoGnZd+72bTtRJuLM4iZKOTS1QLWVujz2VhWNfjm3zhhqyuAqeDcqYmykAF24b6c8o1Y4/HMmhVRe/j0/Ufoz+VdnQfqRhD1eQN0FjItTRIGbwOrGlyOUv7oz5mlwzeaeSyYt1bwrn3lRluXT0aISPlj2sk/U5VhQQBSXmeW7c0uzG0e9CdlpOeYAjWWfdmoPDiiicfRY/lxKGmHJoffHJsJ7MC69cwYMk6FwVBKXGrpc9NdlPigm46qVvhh22XQQ96+zMxzNJMQ2WgCs18piUCJgtdHKnk+58lIqHssMngmr4MbvEI8HPhMuULOyNQ2VHfevHtr7Nnf7JmMe73ZuwCK0Ce4ua52/a/o6kfp1pLL5/qvh3co1s7wg7LUHrdM2VdblgTSuWgZAkA/fMMSQjlqpLISLKZLEy1NYdyVkmouQ0v57XKGTnhxiw3ib93XF4Y9+MvzqkvzWGDQnpX4emRdz+B0gkIea552LE3HyY9GUZyplIMG86KUq9RR+IMpvlwofHA0M796MXk1eFrSwjPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(136003)(396003)(346002)(376002)(366004)(451199015)(31686004)(66476007)(83380400001)(66946007)(66556008)(36756003)(31696002)(6506007)(2906002)(38100700002)(86362001)(38350700002)(26005)(41300700001)(8676002)(4326008)(478600001)(6486002)(186003)(30864003)(8936002)(5660300002)(44832011)(2616005)(6666004)(52116002)(53546011)(6916009)(316002)(6512007)(21314003)(45980500001)(43740500002)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGEzbW1hc1N6Vk8yRVhUN2tLQmI3NU81TmhoNHh4S21hMzcrMklmQTVwa0NX?=
 =?utf-8?B?MmF3SWVVVGJ1dkhaUVNyampFMVQ0ZXdwWkpudHhHdTFHSVh0YW1JdVFyYk5y?=
 =?utf-8?B?YVpuYXk4dXhhVUJPSXpSSEZDdWpMRXBkdUJQWnVEZ0hYeEpqNGMwcFdmMDla?=
 =?utf-8?B?clFKV3pEdTlsQTR0TkNZcmtaZzB6TUFablkrV2NNQ1RGaUhUdmhFWkRzYXhm?=
 =?utf-8?B?RGdqMGhlOWNYcUFESGcrZWdVcVZmU2JLWWlLeGkzQytkOEhGOFdaY2lMRkJV?=
 =?utf-8?B?aUNtNTBOVnVhZ0VIYmcrNm5RV1hiTHE1azEyaGkvbnQ0Tmw3Ti93eG51QVJE?=
 =?utf-8?B?TW9MdFlwOWVtTUEvU1RmL2xBUzZHZE9QQVFSWjZNbGlrcjR2UWJUaDdxZXN6?=
 =?utf-8?B?UkpoUmF6VkdSTVE3czlJbDFCQ09DMmY5NmFUZjZpU0hORi9LRVlzRC9xQmVl?=
 =?utf-8?B?bmYrOXZ1elRIRG9mSzZBbURKNncwb1RVbjlycGtGYkx4aW8reEZQdWdaaHBx?=
 =?utf-8?B?b0JhWE9NQjRQcWhRY1ArZ1VSWWFsaG9kNWlWSFBDem9iU1NtQW1MTGJHdldq?=
 =?utf-8?B?MGdtS3ZPYkFleHdrSUtBRVFtM0d2Z1M4SnF2cE0xcENOQ2xNdDI0ck9LckIw?=
 =?utf-8?B?em9qUXgxOGQ2Q3ZwWVNzRUs1MStqNHF5cmZ6Wm5mV2R3V2Y0Wmw0VXIwcHlM?=
 =?utf-8?B?RXdMYllHWkIyUzl4T3BlaWlVdE5sNEkvbmoydEEwdWxzN3hRYWFVQ3BObm1T?=
 =?utf-8?B?bjBVZC9idjVoQVJpYWNzUGFIVnVhK2ZJbkl3NVVjcjUrK3NHdTk4UjNZSnVk?=
 =?utf-8?B?aGg3UGRGTVEvSVE5KzVmTVZKRlhHQ043WlN3SDdrdTJoWnZQQlhsTWxaaVYv?=
 =?utf-8?B?QVJzUU5iV25PWDQ1b0Zmb3FzVUxRM1JGYmkwUGNyRmdZWldwQUNRaENacGhI?=
 =?utf-8?B?QWVIY1hRbU41WVNUTDdHY0hRemkxbmc4dnFCRVE4OGFRRnp6WjA3K3BUcUh0?=
 =?utf-8?B?VTVuWU42NUJ6ZTFiRzdPeUxDMW9NTlZzcUFROFBoMTBINHp5c281cm9UMk1r?=
 =?utf-8?B?ampMSFpaRzlOQWpZNkFJaTdLeEhZRjMyT1pxYU9RRmRyN2s5eWtaUDFrT3Qr?=
 =?utf-8?B?eWNhTm9VVVZIdnFEbVhBU2U5WGJQc0dDS2x6VFU3U09BV2dlNFpzb0dTMXpJ?=
 =?utf-8?B?aUg2VlVBdVFtQlFXT1dFOCtocy96NDEweEJVRXVHN0w3bFpndXNrUk5sRXcr?=
 =?utf-8?B?NnY0cDVVcFYzSlJwNWxWVmVGL0tGa3pzS2ZUTUJMMnNLclg0Y2lmVmRZbitu?=
 =?utf-8?B?T0JkMi94OGxpenVRVUVyMVNJVkZMcHluSTBIeHpNNmk4N1ZISU10Q1Q1aTBl?=
 =?utf-8?B?M2g4NmtuNHV3U3hYZDdWaVNiMzkrWUdTUGtGaFZydGxXUTdMZ3l2RjRvY1g5?=
 =?utf-8?B?MDZjVEYwSDE0Nm1uUFVWalFMZXlhZGlCOTUydlFZMEl4a1kyL3dLTmk5dW5F?=
 =?utf-8?B?SlJJeWtZMWxWbDFJaHhHZW5iSjZDcnNNRTUxY1FJYVdZYzJTejJlODNQV2ZX?=
 =?utf-8?B?NmlLUFd6Z0N6WVZFNXNsMklaTTVwZVR1V2VFWkVyUWExQVh6bzEyalZpQlMv?=
 =?utf-8?B?T1VTSGphY3JlMzloUWhGZ0lhUlZIbUd0ZUorbzJZMVNiRzAvcnJvYk1Cbnpl?=
 =?utf-8?B?ZGpUajdraG0yS2ZxZVM0MXBLUU5veS8yb1NJQkt3RGphNDNzQlIxKzFHRXVx?=
 =?utf-8?B?UzYxeFBUVjV2dlZCWjBpZVQzZVRXMGgvTXV0d1RZdVY5NVFwT1BGM0xiV05y?=
 =?utf-8?B?TkdrcnhSNmgycnl2amNIMWdGWDcxSStGdk5XVGNJTmFYWE5zTE1vek5ReHpO?=
 =?utf-8?B?dk1hQ1hwbVdsR1BobzNZaE5OYkUvSHdsTmlzZ05xdXh0aUlUWjhZRVlwWTE1?=
 =?utf-8?B?ZmJkTWg0Umk2WmhMMFZwbm5lT240eGZYRU5YcjFDcFJXUUQzbjRlcmY3K09I?=
 =?utf-8?B?U0xiZlRVdnBUdXl1azFGcytRcTgyajcrR1NQVnJyeUhqc1BYbVdsYW9tNVZN?=
 =?utf-8?B?MUNPYS9TSml3UmFpVGYwckViVkVXYzJaM3RGcS9LcE4xc2pCWUt5RWUzbTBT?=
 =?utf-8?B?VW1oZElINHZQQ0RYZW4zZ0c2MEg2U3E3N3FxOXdrbUptQ0JFWlFqRW1Kaktp?=
 =?utf-8?B?WUE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352bee23-efde-4ee9-4683-08da9d40cbd3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 08:51:25.1481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQ+fAuGPQ+q0SAGkHfGUD6YQ4IYhdxgJAcJJaVv6EaAW46/jKh2Pz9lLk7bPM4GTIK+p28QqjjtYhIUTAfzvgmvHZeiFClrVVRU6FssQtlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7594
Received-SPF: pass client-ip=40.107.21.91;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.893,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Hi,

thank you for your review.

On 23.09.2022 09:59, Marc-André Lureau wrote:
> Hi
>
> On Thu, Sep 22, 2022 at 4:33 PM Alexander Ivanov 
> <alexander.ivanov@virtuozzo.com> wrote:
>
>     In the next patches we are going to add FreeBSD support for QEMU Guest
>     Agent. In the result, code in commands-posix.c will be too cumbersome.
>     Move Linux-specific code to a separate file keeping common POSIX
>     code in
>     commands-posix.c.
>
>     Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>
>
> lgtm, but moving 2000 lines in one patch is a bit hard to review.. 
> Maybe you can split this patch for the various moved commands? 
> Although if enough maintainers ack this patch, it's fine for me.
OK, I will split the patch.
>
>     ---
>      qga/commands-common.h |   34 +
>      qga/commands-linux.c  | 2242 ++++++++++++++++++++++++++++++++++++
>      qga/commands-posix.c  | 2558
>     +++--------------------------------------
>      qga/meson.build       |    3 +
>      4 files changed, 2447 insertions(+), 2390 deletions(-)
>      create mode 100644 qga/commands-linux.c
>
>     diff --git a/qga/commands-common.h b/qga/commands-common.h
>     index d0e4a9696f..aa0472ea4c 100644
>     --- a/qga/commands-common.h
>     +++ b/qga/commands-common.h
>     @@ -29,4 +29,38 @@ GuestFileRead
>     *guest_file_read_unsafe(GuestFileHandle *gfh,
>       */
>      char *qga_get_host_name(Error **errp);
>
>     +void ga_wait_child(pid_t pid, int *status, Error **errp);
>     +
>     +#if defined(__linux__)
>     +#include <linux/fs.h>
>     +#ifdef FIFREEZE
>     +#define CONFIG_FSFREEZE
>      #endif
>     +#ifdef FITRIM
>     +#define CONFIG_FSTRIM
>     +#endif
>     +#endif /* __linux__*/
>     +
>     +#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
>     +typedef struct FsMount {
>     +    char *dirname;
>     +    char *devtype;
>     +    unsigned int devmajor, devminor;
>     +    QTAILQ_ENTRY(FsMount) next;
>     +} FsMount;
>     +
>     +typedef QTAILQ_HEAD(FsMountList, FsMount) FsMountList;
>     +
>     +bool build_fs_mount_list(FsMountList *mounts, Error **errp);
>     +void free_fs_mount_list(FsMountList *mounts);
>     +#endif
>     +
>     +#if defined(CONFIG_FSFREEZE)
>     +int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
>     +                                          strList *mountpoints,
>     +                                          FsMountList mounts,
>     +                                          Error **errp);
>     +int qmp_guest_fsfreeze_do_thaw(Error **errp);
>     +#endif
>     +
>     +#endif /* QGA_COMMANDS_COMMON_H */
>     diff --git a/qga/commands-linux.c b/qga/commands-linux.c
>     new file mode 100644
>     index 0000000000..615e9a0027
>     --- /dev/null
>     +++ b/qga/commands-linux.c
>     @@ -0,0 +1,2242 @@
>     +/*
>     + * QEMU Guest Agent Linux-specific command implementations
>     + *
>     + * Copyright IBM Corp. 2011
>     + *
>     + * Authors:
>     + *  Michael Roth      <mdroth@linux.vnet.ibm.com>
>     + *  Michal Privoznik  <mprivozn@redhat.com>
>     + *
>     + * This work is licensed under the terms of the GNU GPL, version
>     2 or later.
>     + * See the COPYING file in the top-level directory.
>     + */
>     +
>     +#include "qemu/osdep.h"
>     +#include <sys/ioctl.h>
>     +#include "guest-agent-core.h"
>     +#include "qga-qapi-commands.h"
>     +#include "qapi/qmp/qerror.h"
>     +#include "qapi/error.h"
>     +#include "qemu/queue.h"
>     +#include "qemu/base64.h"
>     +#include "commands-common.h"
>     +#include "block/nvme.h"
>     +#include "cutils.h"
>     +
>     +#include <mntent.h>
>     +#include <sys/statvfs.h>
>     +#include <linux/nvme_ioctl.h>
>     +
>     +#ifdef CONFIG_LIBUDEV
>     +#include <libudev.h>
>     +#endif
>     +
>     +#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
>     +static int dev_major_minor(const char *devpath,
>     +                           unsigned int *devmajor, unsigned int
>     *devminor)
>     +{
>     +    struct stat st;
>     +
>     +    *devmajor = 0;
>     +    *devminor = 0;
>     +
>     +    if (stat(devpath, &st) < 0) {
>     +        slog("failed to stat device file '%s': %s", devpath,
>     strerror(errno));
>     +        return -1;
>     +    }
>     +    if (S_ISDIR(st.st_mode)) {
>     +        /* It is bind mount */
>     +        return -2;
>     +    }
>     +    if (S_ISBLK(st.st_mode)) {
>     +        *devmajor = major(st.st_rdev);
>     +        *devminor = minor(st.st_rdev);
>     +        return 0;
>     +    }
>     +    return -1;
>     +}
>     +
>     +/*
>     + * Walk the mount table and build a list of local file systems
>     + */
>     +static bool build_fs_mount_list_from_mtab(FsMountList *mounts,
>     Error **errp)
>     +{
>     +    struct mntent *ment;
>     +    FsMount *mount;
>     +    char const *mtab = "/proc/self/mounts";
>     +    FILE *fp;
>     +    unsigned int devmajor, devminor;
>     +
>     +    fp = setmntent(mtab, "r");
>     +    if (!fp) {
>     +        error_setg(errp, "failed to open mtab file: '%s'", mtab);
>     +        return false;
>     +    }
>     +
>     +    while ((ment = getmntent(fp))) {
>     +        /*
>     +         * An entry which device name doesn't start with a '/' is
>     +         * either a dummy file system or a network file system.
>     +         * Add special handling for smbfs and cifs as is done by
>     +         * coreutils as well.
>     +         */
>     +        if ((ment->mnt_fsname[0] != '/') ||
>     +            (strcmp(ment->mnt_type, "smbfs") == 0) ||
>     +            (strcmp(ment->mnt_type, "cifs") == 0)) {
>     +            continue;
>     +        }
>     +        if (dev_major_minor(ment->mnt_fsname, &devmajor,
>     &devminor) == -2) {
>     +            /* Skip bind mounts */
>     +            continue;
>     +        }
>     +
>     +        mount = g_new0(FsMount, 1);
>     +        mount->dirname = g_strdup(ment->mnt_dir);
>     +        mount->devtype = g_strdup(ment->mnt_type);
>     +        mount->devmajor = devmajor;
>     +        mount->devminor = devminor;
>     +
>     +        QTAILQ_INSERT_TAIL(mounts, mount, next);
>     +    }
>     +
>     +    endmntent(fp);
>     +    return true;
>     +}
>     +
>     +static void decode_mntname(char *name, int len)
>     +{
>     +    int i, j = 0;
>     +    for (i = 0; i <= len; i++) {
>     +        if (name[i] != '\\') {
>     +            name[j++] = name[i];
>     +        } else if (name[i + 1] == '\\') {
>     +            name[j++] = '\\';
>     +            i++;
>     +        } else if (name[i + 1] >= '0' && name[i + 1] <= '3' &&
>     +                   name[i + 2] >= '0' && name[i + 2] <= '7' &&
>     +                   name[i + 3] >= '0' && name[i + 3] <= '7') {
>     +            name[j++] = (name[i + 1] - '0') * 64 +
>     +                        (name[i + 2] - '0') * 8 +
>     +                        (name[i + 3] - '0');
>     +            i += 3;
>     +        } else {
>     +            name[j++] = name[i];
>     +        }
>     +    }
>     +}
>     +
>     +bool build_fs_mount_list(FsMountList *mounts, Error **errp)
>     +{
>     +    FsMount *mount;
>     +    char const *mountinfo = "/proc/self/mountinfo";
>     +    FILE *fp;
>     +    char *line = NULL, *dash;
>     +    size_t n;
>     +    char check;
>     +    unsigned int devmajor, devminor;
>     +    int ret, dir_s, dir_e, type_s, type_e, dev_s, dev_e;
>     +
>     +    fp = fopen(mountinfo, "r");
>     +    if (!fp) {
>     +        return build_fs_mount_list_from_mtab(mounts, errp);
>     +    }
>     +
>     +    while (getline(&line, &n, fp) != -1) {
>     +        ret = sscanf(line, "%*u %*u %u:%u %*s %n%*s%n%c",
>     +                     &devmajor, &devminor, &dir_s, &dir_e, &check);
>     +        if (ret < 3) {
>     +            continue;
>     +        }
>     +        dash = strstr(line + dir_e, " - ");
>     +        if (!dash) {
>     +            continue;
>     +        }
>     +        ret = sscanf(dash, " - %n%*s%n %n%*s%n%c",
>     +                     &type_s, &type_e, &dev_s, &dev_e, &check);
>     +        if (ret < 1) {
>     +            continue;
>     +        }
>     +        line[dir_e] = 0;
>     +        dash[type_e] = 0;
>     +        dash[dev_e] = 0;
>     +        decode_mntname(line + dir_s, dir_e - dir_s);
>     +        decode_mntname(dash + dev_s, dev_e - dev_s);
>     +        if (devmajor == 0) {
>     +            /* btrfs reports major number = 0 */
>     +            if (strcmp("btrfs", dash + type_s) != 0 ||
>     +                dev_major_minor(dash + dev_s, &devmajor,
>     &devminor) < 0) {
>     +                continue;
>     +            }
>     +        }
>     +
>     +        mount = g_new0(FsMount, 1);
>     +        mount->dirname = g_strdup(line + dir_s);
>     +        mount->devtype = g_strdup(dash + type_s);
>     +        mount->devmajor = devmajor;
>     +        mount->devminor = devminor;
>     +
>     +        QTAILQ_INSERT_TAIL(mounts, mount, next);
>     +    }
>     +    free(line);
>     +
>     +    fclose(fp);
>     +    return true;
>     +}
>     +#endif
>     +
>     +#if defined(CONFIG_FSFREEZE)
>     +
>     +static char *get_pci_driver(char const *syspath, int pathlen,
>     Error **errp)
>     +{
>     +    char *path;
>     +    char *dpath;
>     +    char *driver = NULL;
>     +    char buf[PATH_MAX];
>     +    ssize_t len;
>     +
>     +    path = g_strndup(syspath, pathlen);
>     +    dpath = g_strdup_printf("%s/driver", path);
>     +    len = readlink(dpath, buf, sizeof(buf) - 1);
>     +    if (len != -1) {
>     +        buf[len] = 0;
>     +        driver = g_path_get_basename(buf);
>     +    }
>     +    g_free(dpath);
>     +    g_free(path);
>     +    return driver;
>     +}
>     +
>     +static int compare_uint(const void *_a, const void *_b)
>     +{
>     +    unsigned int a = *(unsigned int *)_a;
>     +    unsigned int b = *(unsigned int *)_b;
>     +
>     +    return a < b ? -1 : a > b ? 1 : 0;
>     +}
>     +
>     +/* Walk the specified sysfs and build a sorted list of host or
>     ata numbers */
>     +static int build_hosts(char const *syspath, char const *host,
>     bool ata,
>     +                       unsigned int *hosts, int hosts_max, Error
>     **errp)
>     +{
>     +    char *path;
>     +    DIR *dir;
>     +    struct dirent *entry;
>     +    int i = 0;
>     +
>     +    path = g_strndup(syspath, host - syspath);
>     +    dir = opendir(path);
>     +    if (!dir) {
>     +        error_setg_errno(errp, errno, "opendir(\"%s\")", path);
>     +        g_free(path);
>     +        return -1;
>     +    }
>     +
>     +    while (i < hosts_max) {
>     +        entry = readdir(dir);
>     +        if (!entry) {
>     +            break;
>     +        }
>     +        if (ata && sscanf(entry->d_name, "ata%d", hosts + i) == 1) {
>     +            ++i;
>     +        } else if (!ata && sscanf(entry->d_name, "host%d", hosts
>     + i) == 1) {
>     +            ++i;
>     +        }
>     +    }
>     +
>     +    qsort(hosts, i, sizeof(hosts[0]), compare_uint);
>     +
>     +    g_free(path);
>     +    closedir(dir);
>     +    return i;
>     +}
>     +
>     +/*
>     + * Store disk device info for devices on the PCI bus.
>     + * Returns true if information has been stored, or false for failure.
>     + */
>     +static bool build_guest_fsinfo_for_pci_dev(char const *syspath,
>     +                                           GuestDiskAddress *disk,
>     +                                           Error **errp)
>     +{
>     +    unsigned int pci[4], host, hosts[8], tgt[3];
>     +    int i, nhosts = 0, pcilen;
>     +    GuestPCIAddress *pciaddr = disk->pci_controller;
>     +    bool has_ata = false, has_host = false, has_tgt = false;
>     +    char *p, *q, *driver = NULL;
>     +    bool ret = false;
>     +
>     +    p = strstr(syspath, "/devices/pci");
>     +    if (!p || sscanf(p + 12, "%*x:%*x/%x:%x:%x.%x%n",
>     +                     pci, pci + 1, pci + 2, pci + 3, &pcilen) < 4) {
>     +        g_debug("only pci device is supported: sysfs path '%s'",
>     syspath);
>     +        return false;
>     +    }
>     +
>     +    p += 12 + pcilen;
>     +    while (true) {
>     +        driver = get_pci_driver(syspath, p - syspath, errp);
>     +        if (driver && (g_str_equal(driver, "ata_piix") ||
>     +                       g_str_equal(driver, "sym53c8xx") ||
>     +                       g_str_equal(driver, "virtio-pci") ||
>     +                       g_str_equal(driver, "ahci") ||
>     +                       g_str_equal(driver, "nvme"))) {
>     +            break;
>     +        }
>     +
>     +        g_free(driver);
>     +        if (sscanf(p, "/%x:%x:%x.%x%n",
>     +                          pci, pci + 1, pci + 2, pci + 3,
>     &pcilen) == 4) {
>     +            p += pcilen;
>     +            continue;
>     +        }
>     +
>     +        g_debug("unsupported driver or sysfs path '%s'", syspath);
>     +        return false;
>     +    }
>     +
>     +    p = strstr(syspath, "/target");
>     +    if (p && sscanf(p + 7, "%*u:%*u:%*u/%*u:%u:%u:%u",
>     +                    tgt, tgt + 1, tgt + 2) == 3) {
>     +        has_tgt = true;
>     +    }
>     +
>     +    p = strstr(syspath, "/ata");
>     +    if (p) {
>     +        q = p + 4;
>     +        has_ata = true;
>     +    } else {
>     +        p = strstr(syspath, "/host");
>     +        q = p + 5;
>     +    }
>     +    if (p && sscanf(q, "%u", &host) == 1) {
>     +        has_host = true;
>     +        nhosts = build_hosts(syspath, p, has_ata, hosts,
>     +                             ARRAY_SIZE(hosts), errp);
>     +        if (nhosts < 0) {
>     +            goto cleanup;
>     +        }
>     +    }
>     +
>     +    pciaddr->domain = pci[0];
>     +    pciaddr->bus = pci[1];
>     +    pciaddr->slot = pci[2];
>     +    pciaddr->function = pci[3];
>     +
>     +    if (strcmp(driver, "ata_piix") == 0) {
>     +        /* a host per ide bus, target*:0:<unit>:0 */
>     +        if (!has_host || !has_tgt) {
>     +            g_debug("invalid sysfs path '%s' (driver '%s')",
>     syspath, driver);
>     +            goto cleanup;
>     +        }
>     +        for (i = 0; i < nhosts; i++) {
>     +            if (host == hosts[i]) {
>     +                disk->bus_type = GUEST_DISK_BUS_TYPE_IDE;
>     +                disk->bus = i;
>     +                disk->unit = tgt[1];
>     +                break;
>     +            }
>     +        }
>     +        if (i >= nhosts) {
>     +            g_debug("no host for '%s' (driver '%s')", syspath,
>     driver);
>     +            goto cleanup;
>     +        }
>     +    } else if (strcmp(driver, "sym53c8xx") == 0) {
>     +        /* scsi(LSI Logic): target*:0:<unit>:0 */
>     +        if (!has_tgt) {
>     +            g_debug("invalid sysfs path '%s' (driver '%s')",
>     syspath, driver);
>     +            goto cleanup;
>     +        }
>     +        disk->bus_type = GUEST_DISK_BUS_TYPE_SCSI;
>     +        disk->unit = tgt[1];
>     +    } else if (strcmp(driver, "virtio-pci") == 0) {
>     +        if (has_tgt) {
>     +            /* virtio-scsi: target*:0:0:<unit> */
>     +            disk->bus_type = GUEST_DISK_BUS_TYPE_SCSI;
>     +            disk->unit = tgt[2];
>     +        } else {
>     +            /* virtio-blk: 1 disk per 1 device */
>     +            disk->bus_type = GUEST_DISK_BUS_TYPE_VIRTIO;
>     +        }
>     +    } else if (strcmp(driver, "ahci") == 0) {
>     +        /* ahci: 1 host per 1 unit */
>     +        if (!has_host || !has_tgt) {
>     +            g_debug("invalid sysfs path '%s' (driver '%s')",
>     syspath, driver);
>     +            goto cleanup;
>     +        }
>     +        for (i = 0; i < nhosts; i++) {
>     +            if (host == hosts[i]) {
>     +                disk->unit = i;
>     +                disk->bus_type = GUEST_DISK_BUS_TYPE_SATA;
>     +                break;
>     +            }
>     +        }
>     +        if (i >= nhosts) {
>     +            g_debug("no host for '%s' (driver '%s')", syspath,
>     driver);
>     +            goto cleanup;
>     +        }
>     +    } else if (strcmp(driver, "nvme") == 0) {
>     +        disk->bus_type = GUEST_DISK_BUS_TYPE_NVME;
>     +    } else {
>     +        g_debug("unknown driver '%s' (sysfs path '%s')", driver,
>     syspath);
>     +        goto cleanup;
>     +    }
>     +
>     +    ret = true;
>     +
>     +cleanup:
>     +    g_free(driver);
>     +    return ret;
>     +}
>     +
>     +/*
>     + * Store disk device info for non-PCI virtio devices (for example
>     s390x
>     + * channel I/O devices). Returns true if information has been
>     stored, or
>     + * false for failure.
>     + */
>     +static bool build_guest_fsinfo_for_nonpci_virtio(char const *syspath,
>     +  GuestDiskAddress *disk,
>     +                                                 Error **errp)
>     +{
>     +    unsigned int tgt[3];
>     +    char *p;
>     +
>     +    if (!strstr(syspath, "/virtio") || !strstr(syspath, "/block")) {
>     +        g_debug("Unsupported virtio device '%s'", syspath);
>     +        return false;
>     +    }
>     +
>     +    p = strstr(syspath, "/target");
>     +    if (p && sscanf(p + 7, "%*u:%*u:%*u/%*u:%u:%u:%u",
>     +                    &tgt[0], &tgt[1], &tgt[2]) == 3) {
>     +        /* virtio-scsi: target*:0:<target>:<unit> */
>     +        disk->bus_type = GUEST_DISK_BUS_TYPE_SCSI;
>     +        disk->bus = tgt[0];
>     +        disk->target = tgt[1];
>     +        disk->unit = tgt[2];
>     +    } else {
>     +        /* virtio-blk: 1 disk per 1 device */
>     +        disk->bus_type = GUEST_DISK_BUS_TYPE_VIRTIO;
>     +    }
>     +
>     +    return true;
>     +}
>     +
>     +/*
>     + * Store disk device info for CCW devices (s390x channel I/O
>     devices).
>     + * Returns true if information has been stored, or false for failure.
>     + */
>     +static bool build_guest_fsinfo_for_ccw_dev(char const *syspath,
>     +                                           GuestDiskAddress *disk,
>     +                                           Error **errp)
>     +{
>     +    unsigned int cssid, ssid, subchno, devno;
>     +    char *p;
>     +
>     +    p = strstr(syspath, "/devices/css");
>     +    if (!p || sscanf(p + 12, "%*x/%x.%x.%x/%*x.%*x.%x/",
>     +                     &cssid, &ssid, &subchno, &devno) < 4) {
>     +        g_debug("could not parse ccw device sysfs path: %s",
>     syspath);
>     +        return false;
>     +    }
>     +
>     +    disk->has_ccw_address = true;
>     +    disk->ccw_address = g_new0(GuestCCWAddress, 1);
>     +    disk->ccw_address->cssid = cssid;
>     +    disk->ccw_address->ssid = ssid;
>     +    disk->ccw_address->subchno = subchno;
>     +    disk->ccw_address->devno = devno;
>     +
>     +    if (strstr(p, "/virtio")) {
>     +        build_guest_fsinfo_for_nonpci_virtio(syspath, disk, errp);
>     +    }
>     +
>     +    return true;
>     +}
>     +
>     +/* Store disk device info specified by @sysfs into @fs */
>     +static void build_guest_fsinfo_for_real_device(char const *syspath,
>     +  GuestFilesystemInfo *fs,
>     +                                               Error **errp)
>     +{
>     +    GuestDiskAddress *disk;
>     +    GuestPCIAddress *pciaddr;
>     +    bool has_hwinf;
>     +#ifdef CONFIG_LIBUDEV
>     +    struct udev *udev = NULL;
>     +    struct udev_device *udevice = NULL;
>     +#endif
>     +
>     +    pciaddr = g_new0(GuestPCIAddress, 1);
>     +    pciaddr->domain = -1;                       /* -1 means field
>     is invalid */
>     +    pciaddr->bus = -1;
>     +    pciaddr->slot = -1;
>     +    pciaddr->function = -1;
>     +
>     +    disk = g_new0(GuestDiskAddress, 1);
>     +    disk->pci_controller = pciaddr;
>     +    disk->bus_type = GUEST_DISK_BUS_TYPE_UNKNOWN;
>     +
>     +#ifdef CONFIG_LIBUDEV
>     +    udev = udev_new();
>     +    udevice = udev_device_new_from_syspath(udev, syspath);
>     +    if (udev == NULL || udevice == NULL) {
>     +        g_debug("failed to query udev");
>     +    } else {
>     +        const char *devnode, *serial;
>     +        devnode = udev_device_get_devnode(udevice);
>     +        if (devnode != NULL) {
>     +            disk->dev = g_strdup(devnode);
>     +            disk->has_dev = true;
>     +        }
>     +        serial = udev_device_get_property_value(udevice,
>     "ID_SERIAL");
>     +        if (serial != NULL && *serial != 0) {
>     +            disk->serial = g_strdup(serial);
>     +            disk->has_serial = true;
>     +        }
>     +    }
>     +
>     +    udev_unref(udev);
>     +    udev_device_unref(udevice);
>     +#endif
>     +
>     +    if (strstr(syspath, "/devices/pci")) {
>     +        has_hwinf = build_guest_fsinfo_for_pci_dev(syspath, disk,
>     errp);
>     +    } else if (strstr(syspath, "/devices/css")) {
>     +        has_hwinf = build_guest_fsinfo_for_ccw_dev(syspath, disk,
>     errp);
>     +    } else if (strstr(syspath, "/virtio")) {
>     +        has_hwinf = build_guest_fsinfo_for_nonpci_virtio(syspath,
>     disk, errp);
>     +    } else {
>     +        g_debug("Unsupported device type for '%s'", syspath);
>     +        has_hwinf = false;
>     +    }
>     +
>     +    if (has_hwinf || disk->has_dev || disk->has_serial) {
>     +        QAPI_LIST_PREPEND(fs->disk, disk);
>     +    } else {
>     +        qapi_free_GuestDiskAddress(disk);
>     +    }
>     +}
>     +
>     +static void build_guest_fsinfo_for_device(char const *devpath,
>     + GuestFilesystemInfo *fs,
>     +                                          Error **errp);
>     +
>     +/* Store a list of slave devices of virtual volume specified by
>     @syspath into
>     + * @fs */
>     +static void build_guest_fsinfo_for_virtual_device(char const
>     *syspath,
>     + GuestFilesystemInfo *fs,
>     +                                                  Error **errp)
>     +{
>     +    Error *err = NULL;
>     +    DIR *dir;
>     +    char *dirpath;
>     +    struct dirent *entry;
>     +
>     +    dirpath = g_strdup_printf("%s/slaves", syspath);
>     +    dir = opendir(dirpath);
>     +    if (!dir) {
>     +        if (errno != ENOENT) {
>     +            error_setg_errno(errp, errno, "opendir(\"%s\")",
>     dirpath);
>     +        }
>     +        g_free(dirpath);
>     +        return;
>     +    }
>     +
>     +    for (;;) {
>     +        errno = 0;
>     +        entry = readdir(dir);
>     +        if (entry == NULL) {
>     +            if (errno) {
>     +                error_setg_errno(errp, errno, "readdir(\"%s\")",
>     dirpath);
>     +            }
>     +            break;
>     +        }
>     +
>     +        if (entry->d_type == DT_LNK) {
>     +            char *path;
>     +
>     +            g_debug(" slave device '%s'", entry->d_name);
>     +            path = g_strdup_printf("%s/slaves/%s", syspath,
>     entry->d_name);
>     +            build_guest_fsinfo_for_device(path, fs, &err);
>     +            g_free(path);
>     +
>     +            if (err) {
>     +                error_propagate(errp, err);
>     +                break;
>     +            }
>     +        }
>     +    }
>     +
>     +    g_free(dirpath);
>     +    closedir(dir);
>     +}
>     +
>     +static bool is_disk_virtual(const char *devpath, Error **errp)
>     +{
>     +    g_autofree char *syspath = realpath(devpath, NULL);
>     +
>     +    if (!syspath) {
>     +        error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
>     +        return false;
>     +    }
>     +    return strstr(syspath, "/devices/virtual/block/") != NULL;
>     +}
>     +
>     +/* Dispatch to functions for virtual/real device */
>     +static void build_guest_fsinfo_for_device(char const *devpath,
>     + GuestFilesystemInfo *fs,
>     +                                          Error **errp)
>     +{
>     +    ERRP_GUARD();
>     +    g_autofree char *syspath = NULL;
>     +    bool is_virtual = false;
>     +
>     +    syspath = realpath(devpath, NULL);
>     +    if (!syspath) {
>     +        if (errno != ENOENT) {
>     +            error_setg_errno(errp, errno, "realpath(\"%s\")",
>     devpath);
>     +            return;
>     +        }
>     +
>     +        /* ENOENT: This devpath may not exist because of
>     container config */
>     +        if (!fs->name) {
>     +            fs->name = g_path_get_basename(devpath);
>     +        }
>     +        return;
>     +    }
>     +
>     +    if (!fs->name) {
>     +        fs->name = g_path_get_basename(syspath);
>     +    }
>     +
>     +    g_debug("  parse sysfs path '%s'", syspath);
>     +    is_virtual = is_disk_virtual(syspath, errp);
>     +    if (*errp != NULL) {
>     +        return;
>     +    }
>     +    if (is_virtual) {
>     +        build_guest_fsinfo_for_virtual_device(syspath, fs, errp);
>     +    } else {
>     +        build_guest_fsinfo_for_real_device(syspath, fs, errp);
>     +    }
>     +}
>     +
>     +#ifdef CONFIG_LIBUDEV
>     +
>     +/*
>     + * Wrapper around build_guest_fsinfo_for_device() for getting just
>     + * the disk address.
>     + */
>     +static GuestDiskAddress *get_disk_address(const char *syspath,
>     Error **errp)
>     +{
>     +    g_autoptr(GuestFilesystemInfo) fs = NULL;
>     +
>     +    fs = g_new0(GuestFilesystemInfo, 1);
>     +    build_guest_fsinfo_for_device(syspath, fs, errp);
>     +    if (fs->disk != NULL) {
>     +        return g_steal_pointer(&fs->disk->value);
>     +    }
>     +    return NULL;
>     +}
>     +
>     +static char *get_alias_for_syspath(const char *syspath)
>     +{
>     +    struct udev *udev = NULL;
>     +    struct udev_device *udevice = NULL;
>     +    char *ret = NULL;
>     +
>     +    udev = udev_new();
>     +    if (udev == NULL) {
>     +        g_debug("failed to query udev");
>     +        goto out;
>     +    }
>     +    udevice = udev_device_new_from_syspath(udev, syspath);
>     +    if (udevice == NULL) {
>     +        g_debug("failed to query udev for path: %s", syspath);
>     +        goto out;
>     +    } else {
>     +        const char *alias = udev_device_get_property_value(
>     +            udevice, "DM_NAME");
>     +        /*
>     +         * NULL means there was an error and empty string means
>     there is no
>     +         * alias. In case of no alias we return NULL instead of
>     empty string.
>     +         */
>     +        if (alias == NULL) {
>     +            g_debug("failed to query udev for device alias for: %s",
>     +                syspath);
>     +        } else if (*alias != 0) {
>     +            ret = g_strdup(alias);
>     +        }
>     +    }
>     +
>     +out:
>     +    udev_unref(udev);
>     +    udev_device_unref(udevice);
>     +    return ret;
>     +}
>     +
>     +static char *get_device_for_syspath(const char *syspath)
>     +{
>     +    struct udev *udev = NULL;
>     +    struct udev_device *udevice = NULL;
>     +    char *ret = NULL;
>     +
>     +    udev = udev_new();
>     +    if (udev == NULL) {
>     +        g_debug("failed to query udev");
>     +        goto out;
>     +    }
>     +    udevice = udev_device_new_from_syspath(udev, syspath);
>     +    if (udevice == NULL) {
>     +        g_debug("failed to query udev for path: %s", syspath);
>     +        goto out;
>     +    } else {
>     +        ret = g_strdup(udev_device_get_devnode(udevice));
>     +    }
>     +
>     +out:
>     +    udev_unref(udev);
>     +    udev_device_unref(udevice);
>     +    return ret;
>     +}
>     +
>     +static void get_disk_deps(const char *disk_dir, GuestDiskInfo *disk)
>     +{
>     +    g_autofree char *deps_dir = NULL;
>     +    const gchar *dep;
>     +    GDir *dp_deps = NULL;
>     +
>     +    /* List dependent disks */
>     +    deps_dir = g_strdup_printf("%s/slaves", disk_dir);
>     +    g_debug("  listing entries in: %s", deps_dir);
>     +    dp_deps = g_dir_open(deps_dir, 0, NULL);
>     +    if (dp_deps == NULL) {
>     +        g_debug("failed to list entries in %s", deps_dir);
>     +        return;
>     +    }
>     +    disk->has_dependencies = true;
>     +    while ((dep = g_dir_read_name(dp_deps)) != NULL) {
>     +        g_autofree char *dep_dir = NULL;
>     +        char *dev_name;
>     +
>     +        /* Add dependent disks */
>     +        dep_dir = g_strdup_printf("%s/%s", deps_dir, dep);
>     +        dev_name = get_device_for_syspath(dep_dir);
>     +        if (dev_name != NULL) {
>     +            g_debug("  adding dependent device: %s", dev_name);
>     +            QAPI_LIST_PREPEND(disk->dependencies, dev_name);
>     +        }
>     +    }
>     +    g_dir_close(dp_deps);
>     +}
>     +
>     +/*
>     + * Detect partitions subdirectory, name is "<disk_name><number>" or
>     + * "<disk_name>p<number>"
>     + *
>     + * @disk_name -- last component of /sys path (e.g. sda)
>     + * @disk_dir -- sys path of the disk (e.g. /sys/block/sda)
>     + * @disk_dev -- device node of the disk (e.g. /dev/sda)
>     + */
>     +static GuestDiskInfoList *get_disk_partitions(
>     +    GuestDiskInfoList *list,
>     +    const char *disk_name, const char *disk_dir,
>     +    const char *disk_dev)
>     +{
>     +    GuestDiskInfoList *ret = list;
>     +    struct dirent *de_disk;
>     +    DIR *dp_disk = NULL;
>     +    size_t len = strlen(disk_name);
>     +
>     +    dp_disk = opendir(disk_dir);
>     +    while ((de_disk = readdir(dp_disk)) != NULL) {
>     +        g_autofree char *partition_dir = NULL;
>     +        char *dev_name;
>     +        GuestDiskInfo *partition;
>     +
>     +        if (!(de_disk->d_type & DT_DIR)) {
>     +            continue;
>     +        }
>     +
>     +        if (!(strncmp(disk_name, de_disk->d_name, len) == 0 &&
>     +            ((*(de_disk->d_name + len) == 'p' &&
>     +            isdigit(*(de_disk->d_name + len + 1))) ||
>     +                isdigit(*(de_disk->d_name + len))))) {
>     +            continue;
>     +        }
>     +
>     +        partition_dir = g_strdup_printf("%s/%s",
>     +            disk_dir, de_disk->d_name);
>     +        dev_name = get_device_for_syspath(partition_dir);
>     +        if (dev_name == NULL) {
>     +            g_debug("Failed to get device name for syspath: %s",
>     +                disk_dir);
>     +            continue;
>     +        }
>     +        partition = g_new0(GuestDiskInfo, 1);
>     +        partition->name = dev_name;
>     +        partition->partition = true;
>     +        partition->has_dependencies = true;
>     +        /* Add parent disk as dependent for easier tracking of
>     hierarchy */
>     +        QAPI_LIST_PREPEND(partition->dependencies,
>     g_strdup(disk_dev));
>     +
>     +        QAPI_LIST_PREPEND(ret, partition);
>     +    }
>     +    closedir(dp_disk);
>     +
>     +    return ret;
>     +}
>     +
>     +static void get_nvme_smart(GuestDiskInfo *disk)
>     +{
>     +    int fd;
>     +    GuestNVMeSmart *smart;
>     +    NvmeSmartLog log = {0};
>     +    struct nvme_admin_cmd cmd = {
>     +        .opcode = NVME_ADM_CMD_GET_LOG_PAGE,
>     +        .nsid = NVME_NSID_BROADCAST,
>     +        .addr = (uintptr_t)&log,
>     +        .data_len = sizeof(log),
>     +        .cdw10 = NVME_LOG_SMART_INFO | (1 << 15) /* RAE bit */
>     +                 | (((sizeof(log) >> 2) - 1) << 16)
>     +    };
>     +
>     +    fd = qga_open_cloexec(disk->name, O_RDONLY, 0);
>     +    if (fd == -1) {
>     +        g_debug("Failed to open device: %s: %s", disk->name,
>     g_strerror(errno));
>     +        return;
>     +    }
>     +
>     +    if (ioctl(fd, NVME_IOCTL_ADMIN_CMD, &cmd)) {
>     +        g_debug("Failed to get smart: %s: %s", disk->name,
>     g_strerror(errno));
>     +        close(fd);
>     +        return;
>     +    }
>     +
>     +    disk->has_smart = true;
>     +    disk->smart = g_new0(GuestDiskSmart, 1);
>     +    disk->smart->type = GUEST_DISK_BUS_TYPE_NVME;
>     +
>     +    smart = &disk->smart->u.nvme;
>     +    smart->critical_warning = log.critical_warning;
>     +    smart->temperature = lduw_le_p(&log.temperature); /*
>     unaligned field */
>     +    smart->available_spare = log.available_spare;
>     +    smart->available_spare_threshold = log.available_spare_threshold;
>     +    smart->percentage_used = log.percentage_used;
>     +    smart->data_units_read_lo = le64_to_cpu(log.data_units_read[0]);
>     +    smart->data_units_read_hi = le64_to_cpu(log.data_units_read[1]);
>     +    smart->data_units_written_lo =
>     le64_to_cpu(log.data_units_written[0]);
>     +    smart->data_units_written_hi =
>     le64_to_cpu(log.data_units_written[1]);
>     +    smart->host_read_commands_lo =
>     le64_to_cpu(log.host_read_commands[0]);
>     +    smart->host_read_commands_hi =
>     le64_to_cpu(log.host_read_commands[1]);
>     +    smart->host_write_commands_lo =
>     le64_to_cpu(log.host_write_commands[0]);
>     +    smart->host_write_commands_hi =
>     le64_to_cpu(log.host_write_commands[1]);
>     +    smart->controller_busy_time_lo =
>     le64_to_cpu(log.controller_busy_time[0]);
>     +    smart->controller_busy_time_hi =
>     le64_to_cpu(log.controller_busy_time[1]);
>     +    smart->power_cycles_lo = le64_to_cpu(log.power_cycles[0]);
>     +    smart->power_cycles_hi = le64_to_cpu(log.power_cycles[1]);
>     +    smart->power_on_hours_lo = le64_to_cpu(log.power_on_hours[0]);
>     +    smart->power_on_hours_hi = le64_to_cpu(log.power_on_hours[1]);
>     +    smart->unsafe_shutdowns_lo =
>     le64_to_cpu(log.unsafe_shutdowns[0]);
>     +    smart->unsafe_shutdowns_hi =
>     le64_to_cpu(log.unsafe_shutdowns[1]);
>     +    smart->media_errors_lo = le64_to_cpu(log.media_errors[0]);
>     +    smart->media_errors_hi = le64_to_cpu(log.media_errors[1]);
>     +    smart->number_of_error_log_entries_lo =
>     +        le64_to_cpu(log.number_of_error_log_entries[0]);
>     +    smart->number_of_error_log_entries_hi =
>     +        le64_to_cpu(log.number_of_error_log_entries[1]);
>     +
>     +    close(fd);
>     +}
>     +
>     +static void get_disk_smart(GuestDiskInfo *disk)
>     +{
>     +    if (disk->has_address
>     +        && (disk->address->bus_type == GUEST_DISK_BUS_TYPE_NVME)) {
>     +        get_nvme_smart(disk);
>     +    }
>     +}
>     +
>     +GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
>     +{
>     +    GuestDiskInfoList *ret = NULL;
>     +    GuestDiskInfo *disk;
>     +    DIR *dp = NULL;
>     +    struct dirent *de = NULL;
>     +
>     +    g_debug("listing /sys/block directory");
>     +    dp = opendir("/sys/block");
>     +    if (dp == NULL) {
>     +        error_setg_errno(errp, errno, "Can't open directory
>     \"/sys/block\"");
>     +        return NULL;
>     +    }
>     +    while ((de = readdir(dp)) != NULL) {
>     +        g_autofree char *disk_dir = NULL, *line = NULL,
>     +            *size_path = NULL;
>     +        char *dev_name;
>     +        Error *local_err = NULL;
>     +        if (de->d_type != DT_LNK) {
>     +            g_debug("  skipping entry: %s", de->d_name);
>     +            continue;
>     +        }
>     +
>     +        /* Check size and skip zero-sized disks */
>     +        g_debug("  checking disk size");
>     +        size_path = g_strdup_printf("/sys/block/%s/size",
>     de->d_name);
>     +        if (!g_file_get_contents(size_path, &line, NULL, NULL)) {
>     +            g_debug("  failed to read disk size");
>     +            continue;
>     +        }
>     +        if (g_strcmp0(line, "0\n") == 0) {
>     +            g_debug("  skipping zero-sized disk");
>     +            continue;
>     +        }
>     +
>     +        g_debug("  adding %s", de->d_name);
>     +        disk_dir = g_strdup_printf("/sys/block/%s", de->d_name);
>     +        dev_name = get_device_for_syspath(disk_dir);
>     +        if (dev_name == NULL) {
>     +            g_debug("Failed to get device name for syspath: %s",
>     +                disk_dir);
>     +            continue;
>     +        }
>     +        disk = g_new0(GuestDiskInfo, 1);
>     +        disk->name = dev_name;
>     +        disk->partition = false;
>     +        disk->alias = get_alias_for_syspath(disk_dir);
>     +        disk->has_alias = (disk->alias != NULL);
>     +        QAPI_LIST_PREPEND(ret, disk);
>     +
>     +        /* Get address for non-virtual devices */
>     +        bool is_virtual = is_disk_virtual(disk_dir, &local_err);
>     +        if (local_err != NULL) {
>     +            g_debug("  failed to check disk path, ignoring error:
>     %s",
>     +                error_get_pretty(local_err));
>     +            error_free(local_err);
>     +            local_err = NULL;
>     +            /* Don't try to get the address */
>     +            is_virtual = true;
>     +        }
>     +        if (!is_virtual) {
>     +            disk->address = get_disk_address(disk_dir, &local_err);
>     +            if (local_err != NULL) {
>     +                g_debug("  failed to get device info, ignoring
>     error: %s",
>     +                    error_get_pretty(local_err));
>     +                error_free(local_err);
>     +                local_err = NULL;
>     +            } else if (disk->address != NULL) {
>     +                disk->has_address = true;
>     +            }
>     +        }
>     +
>     +        get_disk_deps(disk_dir, disk);
>     +        get_disk_smart(disk);
>     +        ret = get_disk_partitions(ret, de->d_name, disk_dir,
>     dev_name);
>     +    }
>     +
>     +    closedir(dp);
>     +
>     +    return ret;
>     +}
>     +
>     +#else
>     +
>     +GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +    return NULL;
>     +}
>     +
>     +#endif
>     +
>     +/* Return a list of the disk device(s)' info which @mount lies on */
>     +static GuestFilesystemInfo *build_guest_fsinfo(struct FsMount *mount,
>     +                                               Error **errp)
>     +{
>     +    GuestFilesystemInfo *fs = g_malloc0(sizeof(*fs));
>     +    struct statvfs buf;
>     +    unsigned long used, nonroot_total, fr_size;
>     +    char *devpath = g_strdup_printf("/sys/dev/block/%u:%u",
>     +                                    mount->devmajor,
>     mount->devminor);
>     +
>     +    fs->mountpoint = g_strdup(mount->dirname);
>     +    fs->type = g_strdup(mount->devtype);
>     +    build_guest_fsinfo_for_device(devpath, fs, errp);
>     +
>     +    if (statvfs(fs->mountpoint, &buf) == 0) {
>     +        fr_size = buf.f_frsize;
>     +        used = buf.f_blocks - buf.f_bfree;
>     +        nonroot_total = used + buf.f_bavail;
>     +        fs->used_bytes = used * fr_size;
>     +        fs->total_bytes = nonroot_total * fr_size;
>     +
>     +        fs->has_total_bytes = true;
>     +        fs->has_used_bytes = true;
>     +    }
>     +
>     +    g_free(devpath);
>     +
>     +    return fs;
>     +}
>     +
>     +GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
>     +{
>     +    FsMountList mounts;
>     +    struct FsMount *mount;
>     +    GuestFilesystemInfoList *ret = NULL;
>     +    Error *local_err = NULL;
>     +
>     +    QTAILQ_INIT(&mounts);
>     +    if (!build_fs_mount_list(&mounts, &local_err)) {
>     +        error_propagate(errp, local_err);
>     +        return NULL;
>     +    }
>     +
>     +    QTAILQ_FOREACH(mount, &mounts, next) {
>     +        g_debug("Building guest fsinfo for '%s'", mount->dirname);
>     +
>     +        QAPI_LIST_PREPEND(ret, build_guest_fsinfo(mount,
>     &local_err));
>     +        if (local_err) {
>     +            error_propagate(errp, local_err);
>     +            qapi_free_GuestFilesystemInfoList(ret);
>     +            ret = NULL;
>     +            break;
>     +        }
>     +    }
>     +
>     +    free_fs_mount_list(&mounts);
>     +    return ret;
>     +}
>     +
>     +/*
>     + * Walk list of mounted file systems in the guest, and freeze the
>     ones which
>     + * are real local file systems.
>     + */
>     +int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
>     +                                          strList *mountpoints,
>     +                                          FsMountList mounts,
>     +                                          Error **errp)
>     +{
>     +    struct FsMount *mount;
>     +    strList *list;
>     +    int fd, ret, i = 0;
>     +
>     +    QTAILQ_FOREACH_REVERSE(mount, &mounts, next) {
>     +        /* To issue fsfreeze in the reverse order of mounts,
>     check if the
>     +         * mount is listed in the list here */
>     +        if (has_mountpoints) {
>     +            for (list = mountpoints; list; list = list->next) {
>     +                if (strcmp(list->value, mount->dirname) == 0) {
>     +                    break;
>     +                }
>     +            }
>     +            if (!list) {
>     +                continue;
>     +            }
>     +        }
>     +
>     +        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
>     +        if (fd == -1) {
>     +            error_setg_errno(errp, errno, "failed to open %s",
>     mount->dirname);
>     +            return -1;
>     +        }
>     +
>     +        /* we try to cull filesystems we know won't work in
>     advance, but other
>     +         * filesystems may not implement fsfreeze for less
>     obvious reasons.
>     +         * these will report EOPNOTSUPP. we simply ignore these
>     when tallying
>     +         * the number of frozen filesystems.
>     +         * if a filesystem is mounted more than once (aka bind
>     mount) a
>     +         * consecutive attempt to freeze an already frozen
>     filesystem will
>     +         * return EBUSY.
>     +         *
>     +         * any other error means a failure to freeze a filesystem we
>     +         * expect to be freezable, so return an error in those cases
>     +         * and return system to thawed state.
>     +         */
>     +        ret = ioctl(fd, FIFREEZE);
>     +        if (ret == -1) {
>     +            if (errno != EOPNOTSUPP && errno != EBUSY) {
>     +                error_setg_errno(errp, errno, "failed to freeze %s",
>     +                                 mount->dirname);
>     +                close(fd);
>     +                return -1;
>     +            }
>     +        } else {
>     +            i++;
>     +        }
>     +        close(fd);
>     +    }
>     +    return i;
>     +}
>     +
>     +int qmp_guest_fsfreeze_do_thaw(Error **errp)
>     +{
>     +    int ret;
>     +    FsMountList mounts;
>     +    FsMount *mount;
>     +    int fd, i = 0, logged;
>     +    Error *local_err = NULL;
>     +
>     +    QTAILQ_INIT(&mounts);
>     +    if (!build_fs_mount_list(&mounts, &local_err)) {
>     +        error_propagate(errp, local_err);
>     +        return -1;
>     +    }
>     +
>     +    QTAILQ_FOREACH(mount, &mounts, next) {
>     +        logged = false;
>     +        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
>     +        if (fd == -1) {
>     +            continue;
>     +        }
>     +        /* we have no way of knowing whether a filesystem was
>     actually unfrozen
>     +         * as a result of a successful call to FITHAW, only that
>     if an error
>     +         * was returned the filesystem was *not* unfrozen by that
>     particular
>     +         * call.
>     +         *
>     +         * since multiple preceding FIFREEZEs require multiple
>     calls to FITHAW
>     +         * to unfreeze, continuing issuing FITHAW until an error
>     is returned,
>     +         * in which case either the filesystem is in an
>     unfreezable state, or,
>     +         * more likely, it was thawed previously (and remains so
>     afterward).
>     +         *
>     +         * also, since the most recent successful call is the one
>     that did
>     +         * the actual unfreeze, we can use this to provide an
>     accurate count
>     +         * of the number of filesystems unfrozen by
>     guest-fsfreeze-thaw, which
>     +         * may * be useful for determining whether a filesystem
>     was unfrozen
>     +         * during the freeze/thaw phase by a process other than
>     qemu-ga.
>     +         */
>     +        do {
>     +            ret = ioctl(fd, FITHAW);
>     +            if (ret == 0 && !logged) {
>     +                i++;
>     +                logged = true;
>     +            }
>     +        } while (ret == 0);
>     +        close(fd);
>     +    }
>     +
>     +    free_fs_mount_list(&mounts);
>     +
>     +    return i;
>     +}
>     +#endif /* CONFIG_FSFREEZE */
>     +
>     +#if defined(CONFIG_FSTRIM)
>     +/*
>     + * Walk list of mounted file systems in the guest, and trim them.
>     + */
>     +GuestFilesystemTrimResponse *
>     +qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
>     +{
>     +    GuestFilesystemTrimResponse *response;
>     +    GuestFilesystemTrimResult *result;
>     +    int ret = 0;
>     +    FsMountList mounts;
>     +    struct FsMount *mount;
>     +    int fd;
>     +    struct fstrim_range r;
>     +
>     +    slog("guest-fstrim called");
>     +
>     +    QTAILQ_INIT(&mounts);
>     +    if (!build_fs_mount_list(&mounts, errp)) {
>     +        return NULL;
>     +    }
>     +
>     +    response = g_malloc0(sizeof(*response));
>     +
>     +    QTAILQ_FOREACH(mount, &mounts, next) {
>     +        result = g_malloc0(sizeof(*result));
>     +        result->path = g_strdup(mount->dirname);
>     +
>     +        QAPI_LIST_PREPEND(response->paths, result);
>     +
>     +        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
>     +        if (fd == -1) {
>     +            result->error = g_strdup_printf("failed to open: %s",
>     + strerror(errno));
>     +            result->has_error = true;
>     +            continue;
>     +        }
>     +
>     +        /* We try to cull filesystems we know won't work in
>     advance, but other
>     +         * filesystems may not implement fstrim for less obvious
>     reasons.
>     +         * These will report EOPNOTSUPP; while in some other
>     cases ENOTTY
>     +         * will be reported (e.g. CD-ROMs).
>     +         * Any other error means an unexpected error.
>     +         */
>     +        r.start = 0;
>     +        r.len = -1;
>     +        r.minlen = has_minimum ? minimum : 0;
>     +        ret = ioctl(fd, FITRIM, &r);
>     +        if (ret == -1) {
>     +            result->has_error = true;
>     +            if (errno == ENOTTY || errno == EOPNOTSUPP) {
>     +                result->error = g_strdup("trim not supported");
>     +            } else {
>     +                result->error = g_strdup_printf("failed to trim: %s",
>     + strerror(errno));
>     +            }
>     +            close(fd);
>     +            continue;
>     +        }
>     +
>     +        result->has_minimum = true;
>     +        result->minimum = r.minlen;
>     +        result->has_trimmed = true;
>     +        result->trimmed = r.len;
>     +        close(fd);
>     +    }
>     +
>     +    free_fs_mount_list(&mounts);
>     +    return response;
>     +}
>     +#endif /* CONFIG_FSTRIM */
>     +
>     +
>     +#define LINUX_SYS_STATE_FILE "/sys/power/state"
>     +#define SUSPEND_SUPPORTED 0
>     +#define SUSPEND_NOT_SUPPORTED 1
>     +
>     +typedef enum {
>     +    SUSPEND_MODE_DISK = 0,
>     +    SUSPEND_MODE_RAM = 1,
>     +    SUSPEND_MODE_HYBRID = 2,
>     +} SuspendMode;
>     +
>     +/*
>     + * Executes a command in a child process using g_spawn_sync,
>     + * returning an int >= 0 representing the exit status of the
>     + * process.
>     + *
>     + * If the program wasn't found in path, returns -1.
>     + *
>     + * If a problem happened when creating the child process,
>     + * returns -1 and errp is set.
>     + */
>     +static int run_process_child(const char *command[], Error **errp)
>     +{
>     +    int exit_status, spawn_flag;
>     +    GError *g_err = NULL;
>     +    bool success;
>     +
>     +    spawn_flag = G_SPAWN_SEARCH_PATH | G_SPAWN_STDOUT_TO_DEV_NULL |
>     +                 G_SPAWN_STDERR_TO_DEV_NULL;
>     +
>     +    success =  g_spawn_sync(NULL, (char **)command, NULL, spawn_flag,
>     +                            NULL, NULL, NULL, NULL,
>     +                            &exit_status, &g_err);
>     +
>     +    if (success) {
>     +        return WEXITSTATUS(exit_status);
>     +    }
>     +
>     +    if (g_err && (g_err->code != G_SPAWN_ERROR_NOENT)) {
>     +        error_setg(errp, "failed to create child process, error
>     '%s'",
>     +                   g_err->message);
>     +    }
>     +
>     +    g_error_free(g_err);
>     +    return -1;
>     +}
>     +
>     +static bool systemd_supports_mode(SuspendMode mode, Error **errp)
>     +{
>     +    const char *systemctl_args[3] = {"systemd-hibernate",
>     "systemd-suspend",
>     +  "systemd-hybrid-sleep"};
>     +    const char *cmd[4] = {"systemctl", "status",
>     systemctl_args[mode], NULL};
>     +    int status;
>     +
>     +    status = run_process_child(cmd, errp);
>     +
>     +    /*
>     +     * systemctl status uses LSB return codes so we can expect
>     +     * status > 0 and be ok. To assert if the guest has support
>     +     * for the selected suspend mode, status should be < 4. 4 is
>     +     * the code for unknown service status, the return value when
>     +     * the service does not exist. A common value is status = 3
>     +     * (program is not running).
>     +     */
>     +    if (status > 0 && status < 4) {
>     +        return true;
>     +    }
>     +
>     +    return false;
>     +}
>     +
>     +static void systemd_suspend(SuspendMode mode, Error **errp)
>     +{
>     +    Error *local_err = NULL;
>     +    const char *systemctl_args[3] = {"hibernate", "suspend",
>     "hybrid-sleep"};
>     +    const char *cmd[3] = {"systemctl", systemctl_args[mode], NULL};
>     +    int status;
>     +
>     +    status = run_process_child(cmd, &local_err);
>     +
>     +    if (status == 0) {
>     +        return;
>     +    }
>     +
>     +    if ((status == -1) && !local_err) {
>     +        error_setg(errp, "the helper program 'systemctl %s' was
>     not found",
>     +                   systemctl_args[mode]);
>     +        return;
>     +    }
>     +
>     +    if (local_err) {
>     +        error_propagate(errp, local_err);
>     +    } else {
>     +        error_setg(errp, "the helper program 'systemctl %s'
>     returned an "
>     +                   "unexpected exit status code (%d)",
>     +                   systemctl_args[mode], status);
>     +    }
>     +}
>     +
>     +static bool pmutils_supports_mode(SuspendMode mode, Error **errp)
>     +{
>     +    Error *local_err = NULL;
>     +    const char *pmutils_args[3] = {"--hibernate", "--suspend",
>     +                                   "--suspend-hybrid"};
>     +    const char *cmd[3] = {"pm-is-supported", pmutils_args[mode],
>     NULL};
>     +    int status;
>     +
>     +    status = run_process_child(cmd, &local_err);
>     +
>     +    if (status == SUSPEND_SUPPORTED) {
>     +        return true;
>     +    }
>     +
>     +    if ((status == -1) && !local_err) {
>     +        return false;
>     +    }
>     +
>     +    if (local_err) {
>     +        error_propagate(errp, local_err);
>     +    } else {
>     +        error_setg(errp,
>     +                   "the helper program '%s' returned an
>     unexpected exit"
>     +                   " status code (%d)", "pm-is-supported", status);
>     +    }
>     +
>     +    return false;
>     +}
>     +
>     +static void pmutils_suspend(SuspendMode mode, Error **errp)
>     +{
>     +    Error *local_err = NULL;
>     +    const char *pmutils_binaries[3] = {"pm-hibernate", "pm-suspend",
>     +  "pm-suspend-hybrid"};
>     +    const char *cmd[2] = {pmutils_binaries[mode], NULL};
>     +    int status;
>     +
>     +    status = run_process_child(cmd, &local_err);
>     +
>     +    if (status == 0) {
>     +        return;
>     +    }
>     +
>     +    if ((status == -1) && !local_err) {
>     +        error_setg(errp, "the helper program '%s' was not found",
>     +                   pmutils_binaries[mode]);
>     +        return;
>     +    }
>     +
>     +    if (local_err) {
>     +        error_propagate(errp, local_err);
>     +    } else {
>     +        error_setg(errp,
>     +                   "the helper program '%s' returned an
>     unexpected exit"
>     +                   " status code (%d)", pmutils_binaries[mode],
>     status);
>     +    }
>     +}
>     +
>     +static bool linux_sys_state_supports_mode(SuspendMode mode, Error
>     **errp)
>     +{
>     +    const char *sysfile_strs[3] = {"disk", "mem", NULL};
>     +    const char *sysfile_str = sysfile_strs[mode];
>     +    char buf[32]; /* hopefully big enough */
>     +    int fd;
>     +    ssize_t ret;
>     +
>     +    if (!sysfile_str) {
>     +        error_setg(errp, "unknown guest suspend mode");
>     +        return false;
>     +    }
>     +
>     +    fd = open(LINUX_SYS_STATE_FILE, O_RDONLY);
>     +    if (fd < 0) {
>     +        return false;
>     +    }
>     +
>     +    ret = read(fd, buf, sizeof(buf) - 1);
>     +    close(fd);
>     +    if (ret <= 0) {
>     +        return false;
>     +    }
>     +    buf[ret] = '\0';
>     +
>     +    if (strstr(buf, sysfile_str)) {
>     +        return true;
>     +    }
>     +    return false;
>     +}
>     +
>     +static void linux_sys_state_suspend(SuspendMode mode, Error **errp)
>     +{
>     +    Error *local_err = NULL;
>     +    const char *sysfile_strs[3] = {"disk", "mem", NULL};
>     +    const char *sysfile_str = sysfile_strs[mode];
>     +    pid_t pid;
>     +    int status;
>     +
>     +    if (!sysfile_str) {
>     +        error_setg(errp, "unknown guest suspend mode");
>     +        return;
>     +    }
>     +
>     +    pid = fork();
>     +    if (!pid) {
>     +        /* child */
>     +        int fd;
>     +
>     +        setsid();
>     +        reopen_fd_to_null(0);
>     +        reopen_fd_to_null(1);
>     +        reopen_fd_to_null(2);
>     +
>     +        fd = open(LINUX_SYS_STATE_FILE, O_WRONLY);
>     +        if (fd < 0) {
>     +            _exit(EXIT_FAILURE);
>     +        }
>     +
>     +        if (write(fd, sysfile_str, strlen(sysfile_str)) < 0) {
>     +            _exit(EXIT_FAILURE);
>     +        }
>     +
>     +        _exit(EXIT_SUCCESS);
>     +    } else if (pid < 0) {
>     +        error_setg_errno(errp, errno, "failed to create child
>     process");
>     +        return;
>     +    }
>     +
>     +    ga_wait_child(pid, &status, &local_err);
>     +    if (local_err) {
>     +        error_propagate(errp, local_err);
>     +        return;
>     +    }
>     +
>     +    if (WEXITSTATUS(status)) {
>     +        error_setg(errp, "child process has failed to suspend");
>     +    }
>     +
>     +}
>     +
>     +static void guest_suspend(SuspendMode mode, Error **errp)
>     +{
>     +    Error *local_err = NULL;
>     +    bool mode_supported = false;
>     +
>     +    if (systemd_supports_mode(mode, &local_err)) {
>     +        mode_supported = true;
>     +        systemd_suspend(mode, &local_err);
>     +    }
>     +
>     +    if (!local_err) {
>     +        return;
>     +    }
>     +
>     +    error_free(local_err);
>     +    local_err = NULL;
>     +
>     +    if (pmutils_supports_mode(mode, &local_err)) {
>     +        mode_supported = true;
>     +        pmutils_suspend(mode, &local_err);
>     +    }
>     +
>     +    if (!local_err) {
>     +        return;
>     +    }
>     +
>     +    error_free(local_err);
>     +    local_err = NULL;
>     +
>     +    if (linux_sys_state_supports_mode(mode, &local_err)) {
>     +        mode_supported = true;
>     +        linux_sys_state_suspend(mode, &local_err);
>     +    }
>     +
>     +    if (!mode_supported) {
>     +        error_free(local_err);
>     +        error_setg(errp,
>     +                   "the requested suspend mode is not supported
>     by the guest");
>     +    } else {
>     +        error_propagate(errp, local_err);
>     +    }
>     +}
>     +
>     +void qmp_guest_suspend_disk(Error **errp)
>     +{
>     +    guest_suspend(SUSPEND_MODE_DISK, errp);
>     +}
>     +
>     +void qmp_guest_suspend_ram(Error **errp)
>     +{
>     +    guest_suspend(SUSPEND_MODE_RAM, errp);
>     +}
>     +
>     +void qmp_guest_suspend_hybrid(Error **errp)
>     +{
>     +    guest_suspend(SUSPEND_MODE_HYBRID, errp);
>     +}
>     +
>     +/* Transfer online/offline status between @vcpu and the guest system.
>     + *
>     + * On input either @errp or *@errp must be NULL.
>     + *
>     + * In system-to-@vcpu direction, the following @vcpu fields are
>     accessed:
>     + * - R: vcpu->logical_id
>     + * - W: vcpu->online
>     + * - W: vcpu->can_offline
>     + *
>     + * In @vcpu-to-system direction, the following @vcpu fields are
>     accessed:
>     + * - R: vcpu->logical_id
>     + * - R: vcpu->online
>     + *
>     + * Written members remain unmodified on error.
>     + */
>     +static void transfer_vcpu(GuestLogicalProcessor *vcpu, bool sys2vcpu,
>     +                          char *dirpath, Error **errp)
>     +{
>     +    int fd;
>     +    int res;
>     +    int dirfd;
>     +    static const char fn[] = "online";
>     +
>     +    dirfd = open(dirpath, O_RDONLY | O_DIRECTORY);
>     +    if (dirfd == -1) {
>     +        error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
>     +        return;
>     +    }
>     +
>     +    fd = openat(dirfd, fn, sys2vcpu ? O_RDONLY : O_RDWR);
>     +    if (fd == -1) {
>     +        if (errno != ENOENT) {
>     +            error_setg_errno(errp, errno, "open(\"%s/%s\")",
>     dirpath, fn);
>     +        } else if (sys2vcpu) {
>     +            vcpu->online = true;
>     +            vcpu->can_offline = false;
>     +        } else if (!vcpu->online) {
>     +            error_setg(errp, "logical processor #%" PRId64 "
>     can't be "
>     +                       "offlined", vcpu->logical_id);
>     +        } /* otherwise pretend successful re-onlining */
>     +    } else {
>     +        unsigned char status;
>     +
>     +        res = pread(fd, &status, 1, 0);
>     +        if (res == -1) {
>     +            error_setg_errno(errp, errno, "pread(\"%s/%s\")",
>     dirpath, fn);
>     +        } else if (res == 0) {
>     +            error_setg(errp, "pread(\"%s/%s\"): unexpected EOF",
>     dirpath,
>     +                       fn);
>     +        } else if (sys2vcpu) {
>     +            vcpu->online = (status != '0');
>     +            vcpu->can_offline = true;
>     +        } else if (vcpu->online != (status != '0')) {
>     +            status = '0' + vcpu->online;
>     +            if (pwrite(fd, &status, 1, 0) == -1) {
>     +                error_setg_errno(errp, errno,
>     "pwrite(\"%s/%s\")", dirpath,
>     +                                 fn);
>     +            }
>     +        } /* otherwise pretend successful re-(on|off)-lining */
>     +
>     +        res = close(fd);
>     +        g_assert(res == 0);
>     +    }
>     +
>     +    res = close(dirfd);
>     +    g_assert(res == 0);
>     +}
>     +
>     +GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
>     +{
>     +    GuestLogicalProcessorList *head, **tail;
>     +    const char *cpu_dir = "/sys/devices/system/cpu";
>     +    const gchar *line;
>     +    g_autoptr(GDir) cpu_gdir = NULL;
>     +    Error *local_err = NULL;
>     +
>     +    head = NULL;
>     +    tail = &head;
>     +    cpu_gdir = g_dir_open(cpu_dir, 0, NULL);
>     +
>     +    if (cpu_gdir == NULL) {
>     +        error_setg_errno(errp, errno, "failed to list entries:
>     %s", cpu_dir);
>     +        return NULL;
>     +    }
>     +
>     +    while (local_err == NULL && (line =
>     g_dir_read_name(cpu_gdir)) != NULL) {
>     +        GuestLogicalProcessor *vcpu;
>     +        int64_t id;
>     +        if (sscanf(line, "cpu%" PRId64, &id)) {
>     +            g_autofree char *path =
>     g_strdup_printf("/sys/devices/system/cpu/"
>     +                                                    "cpu%" PRId64
>     "/", id);
>     +            vcpu = g_malloc0(sizeof *vcpu);
>     +            vcpu->logical_id = id;
>     +            vcpu->has_can_offline = true; /* lolspeak ftw */
>     +            transfer_vcpu(vcpu, true, path, &local_err);
>     +            QAPI_LIST_APPEND(tail, vcpu);
>     +        }
>     +    }
>     +
>     +    if (local_err == NULL) {
>     +        /* there's no guest with zero VCPUs */
>     +        g_assert(head != NULL);
>     +        return head;
>     +    }
>     +
>     +    qapi_free_GuestLogicalProcessorList(head);
>     +    error_propagate(errp, local_err);
>     +    return NULL;
>     +}
>     +
>     +int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus,
>     Error **errp)
>     +{
>     +    int64_t processed;
>     +    Error *local_err = NULL;
>     +
>     +    processed = 0;
>     +    while (vcpus != NULL) {
>     +        char *path =
>     g_strdup_printf("/sys/devices/system/cpu/cpu%" PRId64 "/",
>     +  vcpus->value->logical_id);
>     +
>     +        transfer_vcpu(vcpus->value, false, path, &local_err);
>     +        g_free(path);
>     +        if (local_err != NULL) {
>     +            break;
>     +        }
>     +        ++processed;
>     +        vcpus = vcpus->next;
>     +    }
>     +
>     +    if (local_err != NULL) {
>     +        if (processed == 0) {
>     +            error_propagate(errp, local_err);
>     +        } else {
>     +            error_free(local_err);
>     +        }
>     +    }
>     +
>     +    return processed;
>     +}
>     +
>     +void qmp_guest_set_user_password(const char *username,
>     +                                 const char *password,
>     +                                 bool crypted,
>     +                                 Error **errp)
>     +{
>     +    Error *local_err = NULL;
>     +    char *passwd_path = NULL;
>     +    pid_t pid;
>     +    int status;
>     +    int datafd[2] = { -1, -1 };
>     +    char *rawpasswddata = NULL;
>     +    size_t rawpasswdlen;
>     +    char *chpasswddata = NULL;
>     +    size_t chpasswdlen;
>     +
>     +    rawpasswddata = (char *)qbase64_decode(password, -1,
>     &rawpasswdlen, errp);
>     +    if (!rawpasswddata) {
>     +        return;
>     +    }
>     +    rawpasswddata = g_renew(char, rawpasswddata, rawpasswdlen + 1);
>     +    rawpasswddata[rawpasswdlen] = '\0';
>     +
>     +    if (strchr(rawpasswddata, '\n')) {
>     +        error_setg(errp, "forbidden characters in raw password");
>     +        goto out;
>     +    }
>     +
>     +    if (strchr(username, '\n') ||
>     +        strchr(username, ':')) {
>     +        error_setg(errp, "forbidden characters in username");
>     +        goto out;
>     +    }
>     +
>     +    chpasswddata = g_strdup_printf("%s:%s\n", username,
>     rawpasswddata);
>     +    chpasswdlen = strlen(chpasswddata);
>     +
>     +    passwd_path = g_find_program_in_path("chpasswd");
>     +
>     +    if (!passwd_path) {
>     +        error_setg(errp, "cannot find 'passwd' program in PATH");
>     +        goto out;
>     +    }
>     +
>     +    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
>     +        error_setg(errp, "cannot create pipe FDs");
>     +        goto out;
>     +    }
>     +
>     +    pid = fork();
>     +    if (pid == 0) {
>     +        close(datafd[1]);
>     +        /* child */
>     +        setsid();
>     +        dup2(datafd[0], 0);
>     +        reopen_fd_to_null(1);
>     +        reopen_fd_to_null(2);
>     +
>     +        if (crypted) {
>     +            execl(passwd_path, "chpasswd", "-e", NULL);
>     +        } else {
>     +            execl(passwd_path, "chpasswd", NULL);
>     +        }
>     +        _exit(EXIT_FAILURE);
>     +    } else if (pid < 0) {
>     +        error_setg_errno(errp, errno, "failed to create child
>     process");
>     +        goto out;
>     +    }
>     +    close(datafd[0]);
>     +    datafd[0] = -1;
>     +
>     +    if (qemu_write_full(datafd[1], chpasswddata, chpasswdlen) !=
>     chpasswdlen) {
>     +        error_setg_errno(errp, errno, "cannot write new account
>     password");
>     +        goto out;
>     +    }
>     +    close(datafd[1]);
>     +    datafd[1] = -1;
>     +
>     +    ga_wait_child(pid, &status, &local_err);
>     +    if (local_err) {
>     +        error_propagate(errp, local_err);
>     +        goto out;
>     +    }
>     +
>     +    if (!WIFEXITED(status)) {
>     +        error_setg(errp, "child process has terminated abnormally");
>     +        goto out;
>     +    }
>     +
>     +    if (WEXITSTATUS(status)) {
>     +        error_setg(errp, "child process has failed to set user
>     password");
>     +        goto out;
>     +    }
>     +
>     +out:
>     +    g_free(chpasswddata);
>     +    g_free(rawpasswddata);
>     +    g_free(passwd_path);
>     +    if (datafd[0] != -1) {
>     +        close(datafd[0]);
>     +    }
>     +    if (datafd[1] != -1) {
>     +        close(datafd[1]);
>     +    }
>     +}
>     +
>     +static void ga_read_sysfs_file(int dirfd, const char *pathname,
>     char *buf,
>     +                               int size, Error **errp)
>     +{
>     +    int fd;
>     +    int res;
>     +
>     +    errno = 0;
>     +    fd = openat(dirfd, pathname, O_RDONLY);
>     +    if (fd == -1) {
>     +        error_setg_errno(errp, errno, "open sysfs file \"%s\"",
>     pathname);
>     +        return;
>     +    }
>     +
>     +    res = pread(fd, buf, size, 0);
>     +    if (res == -1) {
>     +        error_setg_errno(errp, errno, "pread sysfs file \"%s\"",
>     pathname);
>     +    } else if (res == 0) {
>     +        error_setg(errp, "pread sysfs file \"%s\": unexpected
>     EOF", pathname);
>     +    }
>     +    close(fd);
>     +}
>     +
>     +static void ga_write_sysfs_file(int dirfd, const char *pathname,
>     +                                const char *buf, int size, Error
>     **errp)
>     +{
>     +    int fd;
>     +
>     +    errno = 0;
>     +    fd = openat(dirfd, pathname, O_WRONLY);
>     +    if (fd == -1) {
>     +        error_setg_errno(errp, errno, "open sysfs file \"%s\"",
>     pathname);
>     +        return;
>     +    }
>     +
>     +    if (pwrite(fd, buf, size, 0) == -1) {
>     +        error_setg_errno(errp, errno, "pwrite sysfs file \"%s\"",
>     pathname);
>     +    }
>     +
>     +    close(fd);
>     +}
>     +
>     +/* Transfer online/offline status between @mem_blk and the guest
>     system.
>     + *
>     + * On input either @errp or *@errp must be NULL.
>     + *
>     + * In system-to-@mem_blk direction, the following @mem_blk fields
>     are accessed:
>     + * - R: mem_blk->phys_index
>     + * - W: mem_blk->online
>     + * - W: mem_blk->can_offline
>     + *
>     + * In @mem_blk-to-system direction, the following @mem_blk fields
>     are accessed:
>     + * - R: mem_blk->phys_index
>     + * - R: mem_blk->online
>     + *-  R: mem_blk->can_offline
>     + * Written members remain unmodified on error.
>     + */
>     +static void transfer_memory_block(GuestMemoryBlock *mem_blk, bool
>     sys2memblk,
>     +                                  GuestMemoryBlockResponse *result,
>     +                                  Error **errp)
>     +{
>     +    char *dirpath;
>     +    int dirfd;
>     +    char *status;
>     +    Error *local_err = NULL;
>     +
>     +    if (!sys2memblk) {
>     +        DIR *dp;
>     +
>     +        if (!result) {
>     +            error_setg(errp, "Internal error, 'result' should not
>     be NULL");
>     +            return;
>     +        }
>     +        errno = 0;
>     +        dp = opendir("/sys/devices/system/memory/");
>     +        /* if there is no 'memory' directory in sysfs,
>     +         * we think this VM does not support online/offline
>     memory block,
>     +         * any other solution?
>     +         */
>     +        if (!dp) {
>     +            if (errno == ENOENT) {
>     +                result->response =
>     + GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;
>     +            }
>     +            goto out1;
>     +        }
>     +        closedir(dp);
>     +    }
>     +
>     +    dirpath =
>     g_strdup_printf("/sys/devices/system/memory/memory%" PRId64 "/",
>     +                              mem_blk->phys_index);
>     +    dirfd = open(dirpath, O_RDONLY | O_DIRECTORY);
>     +    if (dirfd == -1) {
>     +        if (sys2memblk) {
>     +            error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
>     +        } else {
>     +            if (errno == ENOENT) {
>     +                result->response =
>     GUEST_MEMORY_BLOCK_RESPONSE_TYPE_NOT_FOUND;
>     +            } else {
>     +                result->response =
>     + GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;
>     +            }
>     +        }
>     +        g_free(dirpath);
>     +        goto out1;
>     +    }
>     +    g_free(dirpath);
>     +
>     +    status = g_malloc0(10);
>     +    ga_read_sysfs_file(dirfd, "state", status, 10, &local_err);
>     +    if (local_err) {
>     +        /* treat with sysfs file that not exist in old kernel */
>     +        if (errno == ENOENT) {
>     +            error_free(local_err);
>     +            if (sys2memblk) {
>     +                mem_blk->online = true;
>     +                mem_blk->can_offline = false;
>     +            } else if (!mem_blk->online) {
>     +                result->response =
>     + GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;
>     +            }
>     +        } else {
>     +            if (sys2memblk) {
>     +                error_propagate(errp, local_err);
>     +            } else {
>     +                error_free(local_err);
>     +                result->response =
>     + GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;
>     +            }
>     +        }
>     +        goto out2;
>     +    }
>     +
>     +    if (sys2memblk) {
>     +        char removable = '0';
>     +
>     +        mem_blk->online = (strncmp(status, "online", 6) == 0);
>     +
>     +        ga_read_sysfs_file(dirfd, "removable", &removable, 1,
>     &local_err);
>     +        if (local_err) {
>     +            /* if no 'removable' file, it doesn't support offline
>     mem blk */
>     +            if (errno == ENOENT) {
>     +                error_free(local_err);
>     +                mem_blk->can_offline = false;
>     +            } else {
>     +                error_propagate(errp, local_err);
>     +            }
>     +        } else {
>     +            mem_blk->can_offline = (removable != '0');
>     +        }
>     +    } else {
>     +        if (mem_blk->online != (strncmp(status, "online", 6) == 0)) {
>     +            const char *new_state = mem_blk->online ? "online" :
>     "offline";
>     +
>     +            ga_write_sysfs_file(dirfd, "state", new_state,
>     strlen(new_state),
>     +                                &local_err);
>     +            if (local_err) {
>     +                error_free(local_err);
>     +                result->response =
>     + GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;
>     +                goto out2;
>     +            }
>     +
>     +            result->response =
>     GUEST_MEMORY_BLOCK_RESPONSE_TYPE_SUCCESS;
>     +            result->has_error_code = false;
>     +        } /* otherwise pretend successful re-(on|off)-lining */
>     +    }
>     +    g_free(status);
>     +    close(dirfd);
>     +    return;
>     +
>     +out2:
>     +    g_free(status);
>     +    close(dirfd);
>     +out1:
>     +    if (!sys2memblk) {
>     +        result->has_error_code = true;
>     +        result->error_code = errno;
>     +    }
>     +}
>     +
>     +GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
>     +{
>     +    GuestMemoryBlockList *head, **tail;
>     +    Error *local_err = NULL;
>     +    struct dirent *de;
>     +    DIR *dp;
>     +
>     +    head = NULL;
>     +    tail = &head;
>     +
>     +    dp = opendir("/sys/devices/system/memory/");
>     +    if (!dp) {
>     +        /* it's ok if this happens to be a system that doesn't expose
>     +         * memory blocks via sysfs, but otherwise we should report
>     +         * an error
>     +         */
>     +        if (errno != ENOENT) {
>     +            error_setg_errno(errp, errno, "Can't open directory"
>     +  "\"/sys/devices/system/memory/\"");
>     +        }
>     +        return NULL;
>     +    }
>     +
>     +    /* Note: the phys_index of memory block may be discontinuous,
>     +     * this is because a memblk is the unit of the Sparse Memory
>     design, which
>     +     * allows discontinuous memory ranges (ex. NUMA), so here we
>     should
>     +     * traverse the memory block directory.
>     +     */
>     +    while ((de = readdir(dp)) != NULL) {
>     +        GuestMemoryBlock *mem_blk;
>     +
>     +        if ((strncmp(de->d_name, "memory", 6) != 0) ||
>     +            !(de->d_type & DT_DIR)) {
>     +            continue;
>     +        }
>     +
>     +        mem_blk = g_malloc0(sizeof *mem_blk);
>     +        /* The d_name is "memoryXXX",  phys_index is block id,
>     same as XXX */
>     +        mem_blk->phys_index = strtoul(&de->d_name[6], NULL, 10);
>     +        mem_blk->has_can_offline = true; /* lolspeak ftw */
>     +        transfer_memory_block(mem_blk, true, NULL, &local_err);
>     +        if (local_err) {
>     +            break;
>     +        }
>     +
>     +        QAPI_LIST_APPEND(tail, mem_blk);
>     +    }
>     +
>     +    closedir(dp);
>     +    if (local_err == NULL) {
>     +        /* there's no guest with zero memory blocks */
>     +        if (head == NULL) {
>     +            error_setg(errp, "guest reported zero memory blocks!");
>     +        }
>     +        return head;
>     +    }
>     +
>     +    qapi_free_GuestMemoryBlockList(head);
>     +    error_propagate(errp, local_err);
>     +    return NULL;
>     +}
>     +
>     +GuestMemoryBlockResponseList *
>     +qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error
>     **errp)
>     +{
>     +    GuestMemoryBlockResponseList *head, **tail;
>     +    Error *local_err = NULL;
>     +
>     +    head = NULL;
>     +    tail = &head;
>     +
>     +    while (mem_blks != NULL) {
>     +        GuestMemoryBlockResponse *result;
>     +        GuestMemoryBlock *current_mem_blk = mem_blks->value;
>     +
>     +        result = g_malloc0(sizeof(*result));
>     +        result->phys_index = current_mem_blk->phys_index;
>     +        transfer_memory_block(current_mem_blk, false, result,
>     &local_err);
>     +        if (local_err) { /* should never happen */
>     +            goto err;
>     +        }
>     +
>     +        QAPI_LIST_APPEND(tail, result);
>     +        mem_blks = mem_blks->next;
>     +    }
>     +
>     +    return head;
>     +err:
>     +    qapi_free_GuestMemoryBlockResponseList(head);
>     +    error_propagate(errp, local_err);
>     +    return NULL;
>     +}
>     +
>     +GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
>     +{
>     +    Error *local_err = NULL;
>     +    char *dirpath;
>     +    int dirfd;
>     +    char *buf;
>     +    GuestMemoryBlockInfo *info;
>     +
>     +    dirpath = g_strdup_printf("/sys/devices/system/memory/");
>     +    dirfd = open(dirpath, O_RDONLY | O_DIRECTORY);
>     +    if (dirfd == -1) {
>     +        error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
>     +        g_free(dirpath);
>     +        return NULL;
>     +    }
>     +    g_free(dirpath);
>     +
>     +    buf = g_malloc0(20);
>     +    ga_read_sysfs_file(dirfd, "block_size_bytes", buf, 20,
>     &local_err);
>     +    close(dirfd);
>     +    if (local_err) {
>     +        g_free(buf);
>     +        error_propagate(errp, local_err);
>     +        return NULL;
>     +    }
>     +
>     +    info = g_new0(GuestMemoryBlockInfo, 1);
>     +    info->size = strtol(buf, NULL, 16); /* the unit is bytes */
>     +
>     +    g_free(buf);
>     +
>     +    return info;
>     +}
>     +
>     +#define MAX_NAME_LEN 128
>     +static GuestDiskStatsInfoList *guest_get_diskstats(Error **errp)
>     +{
>     +#ifdef CONFIG_LINUX
>     +    GuestDiskStatsInfoList *head = NULL, **tail = &head;
>     +    const char *diskstats = "/proc/diskstats";
>     +    FILE *fp;
>     +    size_t n;
>     +    char *line = NULL;
>     +
>     +    fp = fopen(diskstats, "r");
>     +    if (fp  == NULL) {
>     +        error_setg_errno(errp, errno, "open(\"%s\")", diskstats);
>     +        return NULL;
>     +    }
>     +
>     +    while (getline(&line, &n, fp) != -1) {
>     +        g_autofree GuestDiskStatsInfo *diskstatinfo = NULL;
>     +        g_autofree GuestDiskStats *diskstat = NULL;
>     +        char dev_name[MAX_NAME_LEN];
>     +        unsigned int ios_pgr, tot_ticks, rq_ticks, wr_ticks,
>     dc_ticks, fl_ticks;
>     +        unsigned long rd_ios, rd_merges_or_rd_sec,
>     rd_ticks_or_wr_sec, wr_ios;
>     +        unsigned long wr_merges, rd_sec_or_wr_ios, wr_sec;
>     +        unsigned long dc_ios, dc_merges, dc_sec, fl_ios;
>     +        unsigned int major, minor;
>     +        int i;
>     +
>     +        i = sscanf(line, "%u %u %s %lu %lu %lu"
>     +                   "%lu %lu %lu %lu %u %u %u %u"
>     +                   "%lu %lu %lu %u %lu %u",
>     +                   &major, &minor, dev_name,
>     +                   &rd_ios, &rd_merges_or_rd_sec, &rd_sec_or_wr_ios,
>     +                   &rd_ticks_or_wr_sec, &wr_ios, &wr_merges, &wr_sec,
>     +                   &wr_ticks, &ios_pgr, &tot_ticks, &rq_ticks,
>     +                   &dc_ios, &dc_merges, &dc_sec, &dc_ticks,
>     +                   &fl_ios, &fl_ticks);
>     +
>     +        if (i < 7) {
>     +            continue;
>     +        }
>     +
>     +        diskstatinfo = g_new0(GuestDiskStatsInfo, 1);
>     +        diskstatinfo->name = g_strdup(dev_name);
>     +        diskstatinfo->major = major;
>     +        diskstatinfo->minor = minor;
>     +
>     +        diskstat = g_new0(GuestDiskStats, 1);
>     +        if (i == 7) {
>     +            diskstat->has_read_ios = true;
>     +            diskstat->read_ios = rd_ios;
>     +            diskstat->has_read_sectors = true;
>     +            diskstat->read_sectors = rd_merges_or_rd_sec;
>     +            diskstat->has_write_ios = true;
>     +            diskstat->write_ios = rd_sec_or_wr_ios;
>     +            diskstat->has_write_sectors = true;
>     +            diskstat->write_sectors = rd_ticks_or_wr_sec;
>     +        }
>     +        if (i >= 14) {
>     +            diskstat->has_read_ios = true;
>     +            diskstat->read_ios = rd_ios;
>     +            diskstat->has_read_sectors = true;
>     +            diskstat->read_sectors = rd_sec_or_wr_ios;
>     +            diskstat->has_read_merges = true;
>     +            diskstat->read_merges = rd_merges_or_rd_sec;
>     +            diskstat->has_read_ticks = true;
>     +            diskstat->read_ticks = rd_ticks_or_wr_sec;
>     +            diskstat->has_write_ios = true;
>     +            diskstat->write_ios = wr_ios;
>     +            diskstat->has_write_sectors = true;
>     +            diskstat->write_sectors = wr_sec;
>     +            diskstat->has_write_merges = true;
>     +            diskstat->write_merges = wr_merges;
>     +            diskstat->has_write_ticks = true;
>     +            diskstat->write_ticks = wr_ticks;
>     +            diskstat->has_ios_pgr = true;
>     +            diskstat->ios_pgr = ios_pgr;
>     +            diskstat->has_total_ticks = true;
>     +            diskstat->total_ticks = tot_ticks;
>     +            diskstat->has_weight_ticks = true;
>     +            diskstat->weight_ticks = rq_ticks;
>     +        }
>     +        if (i >= 18) {
>     +            diskstat->has_discard_ios = true;
>     +            diskstat->discard_ios = dc_ios;
>     +            diskstat->has_discard_merges = true;
>     +            diskstat->discard_merges = dc_merges;
>     +            diskstat->has_discard_sectors = true;
>     +            diskstat->discard_sectors = dc_sec;
>     +            diskstat->has_discard_ticks = true;
>     +            diskstat->discard_ticks = dc_ticks;
>     +        }
>     +        if (i >= 20) {
>     +            diskstat->has_flush_ios = true;
>     +            diskstat->flush_ios = fl_ios;
>     +            diskstat->has_flush_ticks = true;
>     +            diskstat->flush_ticks = fl_ticks;
>     +        }
>     +
>     +        diskstatinfo->stats = g_steal_pointer(&diskstat);
>     +        QAPI_LIST_APPEND(tail, diskstatinfo);
>     +        diskstatinfo = NULL;
>     +    }
>     +    free(line);
>     +    fclose(fp);
>     +    return head;
>     +#else
>     +    g_debug("disk stats reporting available only for Linux");
>     +    return NULL;
>     +#endif
>     +}
>     +
>     +GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
>     +{
>     +    return guest_get_diskstats(errp);
>     +}
>     +
>     +GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
>     +{
>     +    GuestCpuStatsList *head = NULL, **tail = &head;
>     +    const char *cpustats = "/proc/stat";
>     +    int clk_tck = sysconf(_SC_CLK_TCK);
>     +    FILE *fp;
>     +    size_t n;
>     +    char *line = NULL;
>     +
>     +    fp = fopen(cpustats, "r");
>     +    if (fp  == NULL) {
>     +        error_setg_errno(errp, errno, "open(\"%s\")", cpustats);
>     +        return NULL;
>     +    }
>     +
>     +    while (getline(&line, &n, fp) != -1) {
>     +        GuestCpuStats *cpustat = NULL;
>     +        GuestLinuxCpuStats *linuxcpustat;
>     +        int i;
>     +        unsigned long user, system, idle, iowait, irq, softirq,
>     steal, guest;
>     +        unsigned long nice, guest_nice;
>     +        char name[64];
>     +
>     +        i = sscanf(line, "%s %lu %lu %lu %lu %lu %lu %lu %lu %lu
>     %lu",
>     +                   name, &user, &nice, &system, &idle, &iowait,
>     &irq, &softirq,
>     +                   &steal, &guest, &guest_nice);
>     +
>     +        /* drop "cpu 1 2 3 ...", get "cpuX 1 2 3 ..." only */
>     +        if ((i == EOF) || strncmp(name, "cpu", 3) || (name[3] ==
>     '\0')) {
>     +            continue;
>     +        }
>     +
>     +        if (i < 5) {
>     +            slog("Parsing cpu stat from %s failed, see \"man
>     proc\"", cpustats);
>     +            break;
>     +        }
>     +
>     +        cpustat = g_new0(GuestCpuStats, 1);
>     +        cpustat->type = GUEST_CPU_STATS_TYPE_LINUX;
>     +
>     +        linuxcpustat = &cpustat->u.q_linux;
>     +        linuxcpustat->cpu = atoi(&name[3]);
>     +        linuxcpustat->user = user * 1000 / clk_tck;
>     +        linuxcpustat->nice = nice * 1000 / clk_tck;
>     +        linuxcpustat->system = system * 1000 / clk_tck;
>     +        linuxcpustat->idle = idle * 1000 / clk_tck;
>     +
>     +        if (i > 5) {
>     +            linuxcpustat->has_iowait = true;
>     +            linuxcpustat->iowait = iowait * 1000 / clk_tck;
>     +        }
>     +
>     +        if (i > 6) {
>     +            linuxcpustat->has_irq = true;
>     +            linuxcpustat->irq = irq * 1000 / clk_tck;
>     +            linuxcpustat->has_softirq = true;
>     +            linuxcpustat->softirq = softirq * 1000 / clk_tck;
>     +        }
>     +
>     +        if (i > 8) {
>     +            linuxcpustat->has_steal = true;
>     +            linuxcpustat->steal = steal * 1000 / clk_tck;
>     +        }
>     +
>     +        if (i > 9) {
>     +            linuxcpustat->has_guest = true;
>     +            linuxcpustat->guest = guest * 1000 / clk_tck;
>     +        }
>     +
>     +        if (i > 10) {
>     +            linuxcpustat->has_guest = true;
>     +            linuxcpustat->guest = guest * 1000 / clk_tck;
>     +            linuxcpustat->has_guestnice = true;
>     +            linuxcpustat->guestnice = guest_nice * 1000 / clk_tck;
>     +        }
>     +
>     +        QAPI_LIST_APPEND(tail, cpustat);
>     +    }
>     +
>     +    free(line);
>     +    fclose(fp);
>     +    return head;
>     +}
>     diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>     index 954efed01b..0bb8b9e2f3 100644
>     --- a/qga/commands-posix.c
>     +++ b/qga/commands-posix.c
>     @@ -15,7 +15,6 @@
>      #include <sys/ioctl.h>
>      #include <sys/utsname.h>
>      #include <sys/wait.h>
>     -#include <dirent.h>
>      #include "guest-agent-core.h"
>      #include "qga-qapi-commands.h"
>      #include "qapi/error.h"
>     @@ -26,31 +25,12 @@
>      #include "qemu/base64.h"
>      #include "qemu/cutils.h"
>      #include "commands-common.h"
>     -#include "block/nvme.h"
>      #include "cutils.h"
>
>      #ifdef HAVE_UTMPX
>      #include <utmpx.h>
>      #endif
>
>     -#if defined(__linux__)
>     -#include <mntent.h>
>     -#include <linux/fs.h>
>     -#include <sys/statvfs.h>
>     -#include <linux/nvme_ioctl.h>
>     -
>     -#ifdef CONFIG_LIBUDEV
>     -#include <libudev.h>
>     -#endif
>     -
>     -#ifdef FIFREEZE
>     -#define CONFIG_FSFREEZE
>     -#endif
>     -#ifdef FITRIM
>     -#define CONFIG_FSTRIM
>     -#endif
>     -#endif
>     -
>      #ifdef HAVE_GETIFADDRS
>      #include <arpa/inet.h>
>      #include <sys/socket.h>
>     @@ -62,7 +42,173 @@
>      #endif
>      #endif
>
>     -static void ga_wait_child(pid_t pid, int *status, Error **errp)
>     +#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
>     +void free_fs_mount_list(FsMountList *mounts)
>     +{
>     +     FsMount *mount, *temp;
>     +
>     +     if (!mounts) {
>     +         return;
>     +     }
>     +
>     +     QTAILQ_FOREACH_SAFE(mount, mounts, next, temp) {
>     +         QTAILQ_REMOVE(mounts, mount, next);
>     +         g_free(mount->dirname);
>     +         g_free(mount->devtype);
>     +         g_free(mount);
>     +     }
>     +}
>     +#endif
>     +
>     +#if defined(CONFIG_FSFREEZE)
>     +typedef enum {
>     +    FSFREEZE_HOOK_THAW = 0,
>     +    FSFREEZE_HOOK_FREEZE,
>     +} FsfreezeHookArg;
>     +
>     +static const char *fsfreeze_hook_arg_string[] = {
>     +    "thaw",
>     +    "freeze",
>     +};
>     +
>     +static void execute_fsfreeze_hook(FsfreezeHookArg arg, Error **errp)
>     +{
>     +    int status;
>     +    pid_t pid;
>     +    const char *hook;
>     +    const char *arg_str = fsfreeze_hook_arg_string[arg];
>     +    Error *local_err = NULL;
>     +
>     +    hook = ga_fsfreeze_hook(ga_state);
>     +    if (!hook) {
>     +        return;
>     +    }
>     +    if (access(hook, X_OK) != 0) {
>     +        error_setg_errno(errp, errno, "can't access fsfreeze hook
>     '%s'", hook);
>     +        return;
>     +    }
>     +
>     +    slog("executing fsfreeze hook with arg '%s'", arg_str);
>     +    pid = fork();
>     +    if (pid == 0) {
>     +        setsid();
>     +        reopen_fd_to_null(0);
>     +        reopen_fd_to_null(1);
>     +        reopen_fd_to_null(2);
>     +
>     +        execl(hook, hook, arg_str, NULL);
>     +        _exit(EXIT_FAILURE);
>     +    } else if (pid < 0) {
>     +        error_setg_errno(errp, errno, "failed to create child
>     process");
>     +        return;
>     +    }
>     +
>     +    ga_wait_child(pid, &status, &local_err);
>     +    if (local_err) {
>     +        error_propagate(errp, local_err);
>     +        return;
>     +    }
>     +
>     +    if (!WIFEXITED(status)) {
>     +        error_setg(errp, "fsfreeze hook has terminated abnormally");
>     +        return;
>     +    }
>     +
>     +    status = WEXITSTATUS(status);
>     +    if (status) {
>     +        error_setg(errp, "fsfreeze hook has failed with status
>     %d", status);
>     +        return;
>     +    }
>     +}
>     +
>     +int64_t qmp_guest_fsfreeze_thaw(Error **errp)
>     +{
>     +    int ret;
>     +
>     +    ret = qmp_guest_fsfreeze_do_thaw(errp);
>     +    if (ret >= 0) {
>     +        ga_unset_frozen(ga_state);
>     +        execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
>     +    } else {
>     +        ret = 0;
>     +    }
>     +
>     +    return ret;
>     +}
>     +
>     +int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
>     +                                       strList *mountpoints,
>     +                                       Error **errp)
>     +{
>     +    int ret;
>     +    FsMountList mounts;
>     +    Error *local_err = NULL;
>     +
>     +    slog("guest-fsfreeze called");
>     +
>     +    execute_fsfreeze_hook(FSFREEZE_HOOK_FREEZE, &local_err);
>     +    if (local_err) {
>     +        error_propagate(errp, local_err);
>     +        return -1;
>     +    }
>     +
>     +    QTAILQ_INIT(&mounts);
>     +    if (!build_fs_mount_list(&mounts, &local_err)) {
>     +        error_propagate(errp, local_err);
>     +        return -1;
>     +    }
>     +
>     +    /* cannot risk guest agent blocking itself on a write in this
>     state */
>     +    ga_set_frozen(ga_state);
>     +
>     +    ret = qmp_guest_fsfreeze_do_freeze_list(has_mountpoints,
>     mountpoints,
>     +                                            mounts, errp);
>     +
>     +    free_fs_mount_list(&mounts);
>     +    /* We may not issue any FIFREEZE here.
>     +     * Just unset ga_state here and ready for the next call.
>     +     */
>     +    if (ret == 0) {
>     +        ga_unset_frozen(ga_state);
>     +    } else if (ret < 0) {
>     +        qmp_guest_fsfreeze_thaw(NULL);
>     +    }
>     +    return ret;
>     +}
>     +
>     +/*
>     + * Return status of freeze/thaw
>     + */
>     +GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **errp)
>     +{
>     +    if (ga_is_frozen(ga_state)) {
>     +        return GUEST_FSFREEZE_STATUS_FROZEN;
>     +    }
>     +
>     +    return GUEST_FSFREEZE_STATUS_THAWED;
>     +}
>     +
>     +int64_t qmp_guest_fsfreeze_freeze(Error **errp)
>     +{
>     +    return qmp_guest_fsfreeze_freeze_list(false, NULL, errp);
>     +}
>     +
>     +static void guest_fsfreeze_cleanup(void)
>     +{
>     +    Error *err = NULL;
>     +
>     +    if (ga_is_frozen(ga_state) == GUEST_FSFREEZE_STATUS_FROZEN) {
>     +        qmp_guest_fsfreeze_thaw(&err);
>     +        if (err) {
>     +            slog("failed to clean up frozen filesystems: %s",
>     +                 error_get_pretty(err));
>     +            error_free(err);
>     +        }
>     +    }
>     +}
>     +#endif /* CONFIG_FSFREEZE */
>     +
>     +void ga_wait_child(pid_t pid, int *status, Error **errp)
>      {
>          pid_t rpid;
>
>     @@ -617,2375 +763,7 @@ void qmp_guest_file_flush(int64_t handle,
>     Error **errp)
>          }
>      }
>
>     -/* linux-specific implementations. avoid this if at all possible. */
>     -#if defined(__linux__)
>     -
>     -#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
>     -typedef struct FsMount {
>     -    char *dirname;
>     -    char *devtype;
>     -    unsigned int devmajor, devminor;
>     -    QTAILQ_ENTRY(FsMount) next;
>     -} FsMount;
>     -
>     -typedef QTAILQ_HEAD(FsMountList, FsMount) FsMountList;
>     -
>     -static void free_fs_mount_list(FsMountList *mounts)
>     -{
>     -     FsMount *mount, *temp;
>     -
>     -     if (!mounts) {
>     -         return;
>     -     }
>     -
>     -     QTAILQ_FOREACH_SAFE(mount, mounts, next, temp) {
>     -         QTAILQ_REMOVE(mounts, mount, next);
>     -         g_free(mount->dirname);
>     -         g_free(mount->devtype);
>     -         g_free(mount);
>     -     }
>     -}
>     -
>     -static int dev_major_minor(const char *devpath,
>     -                           unsigned int *devmajor, unsigned int
>     *devminor)
>     -{
>     -    struct stat st;
>     -
>     -    *devmajor = 0;
>     -    *devminor = 0;
>     -
>     -    if (stat(devpath, &st) < 0) {
>     -        slog("failed to stat device file '%s': %s", devpath,
>     strerror(errno));
>     -        return -1;
>     -    }
>     -    if (S_ISDIR(st.st_mode)) {
>     -        /* It is bind mount */
>     -        return -2;
>     -    }
>     -    if (S_ISBLK(st.st_mode)) {
>     -        *devmajor = major(st.st_rdev);
>     -        *devminor = minor(st.st_rdev);
>     -        return 0;
>     -    }
>     -    return -1;
>     -}
>     -
>     -/*
>     - * Walk the mount table and build a list of local file systems
>     - */
>     -static bool build_fs_mount_list_from_mtab(FsMountList *mounts,
>     Error **errp)
>     -{
>     -    struct mntent *ment;
>     -    FsMount *mount;
>     -    char const *mtab = "/proc/self/mounts";
>     -    FILE *fp;
>     -    unsigned int devmajor, devminor;
>     -
>     -    fp = setmntent(mtab, "r");
>     -    if (!fp) {
>     -        error_setg(errp, "failed to open mtab file: '%s'", mtab);
>     -        return false;
>     -    }
>     -
>     -    while ((ment = getmntent(fp))) {
>     -        /*
>     -         * An entry which device name doesn't start with a '/' is
>     -         * either a dummy file system or a network file system.
>     -         * Add special handling for smbfs and cifs as is done by
>     -         * coreutils as well.
>     -         */
>     -        if ((ment->mnt_fsname[0] != '/') ||
>     -            (strcmp(ment->mnt_type, "smbfs") == 0) ||
>     -            (strcmp(ment->mnt_type, "cifs") == 0)) {
>     -            continue;
>     -        }
>     -        if (dev_major_minor(ment->mnt_fsname, &devmajor,
>     &devminor) == -2) {
>     -            /* Skip bind mounts */
>     -            continue;
>     -        }
>     -
>     -        mount = g_new0(FsMount, 1);
>     -        mount->dirname = g_strdup(ment->mnt_dir);
>     -        mount->devtype = g_strdup(ment->mnt_type);
>     -        mount->devmajor = devmajor;
>     -        mount->devminor = devminor;
>     -
>     -        QTAILQ_INSERT_TAIL(mounts, mount, next);
>     -    }
>     -
>     -    endmntent(fp);
>     -    return true;
>     -}
>     -
>     -static void decode_mntname(char *name, int len)
>     -{
>     -    int i, j = 0;
>     -    for (i = 0; i <= len; i++) {
>     -        if (name[i] != '\\') {
>     -            name[j++] = name[i];
>     -        } else if (name[i + 1] == '\\') {
>     -            name[j++] = '\\';
>     -            i++;
>     -        } else if (name[i + 1] >= '0' && name[i + 1] <= '3' &&
>     -                   name[i + 2] >= '0' && name[i + 2] <= '7' &&
>     -                   name[i + 3] >= '0' && name[i + 3] <= '7') {
>     -            name[j++] = (name[i + 1] - '0') * 64 +
>     -                        (name[i + 2] - '0') * 8 +
>     -                        (name[i + 3] - '0');
>     -            i += 3;
>     -        } else {
>     -            name[j++] = name[i];
>     -        }
>     -    }
>     -}
>     -
>     -static bool build_fs_mount_list(FsMountList *mounts, Error **errp)
>     -{
>     -    FsMount *mount;
>     -    char const *mountinfo = "/proc/self/mountinfo";
>     -    FILE *fp;
>     -    char *line = NULL, *dash;
>     -    size_t n;
>     -    char check;
>     -    unsigned int devmajor, devminor;
>     -    int ret, dir_s, dir_e, type_s, type_e, dev_s, dev_e;
>     -
>     -    fp = fopen(mountinfo, "r");
>     -    if (!fp) {
>     -        return build_fs_mount_list_from_mtab(mounts, errp);
>     -    }
>     -
>     -    while (getline(&line, &n, fp) != -1) {
>     -        ret = sscanf(line, "%*u %*u %u:%u %*s %n%*s%n%c",
>     -                     &devmajor, &devminor, &dir_s, &dir_e, &check);
>     -        if (ret < 3) {
>     -            continue;
>     -        }
>     -        dash = strstr(line + dir_e, " - ");
>     -        if (!dash) {
>     -            continue;
>     -        }
>     -        ret = sscanf(dash, " - %n%*s%n %n%*s%n%c",
>     -                     &type_s, &type_e, &dev_s, &dev_e, &check);
>     -        if (ret < 1) {
>     -            continue;
>     -        }
>     -        line[dir_e] = 0;
>     -        dash[type_e] = 0;
>     -        dash[dev_e] = 0;
>     -        decode_mntname(line + dir_s, dir_e - dir_s);
>     -        decode_mntname(dash + dev_s, dev_e - dev_s);
>     -        if (devmajor == 0) {
>     -            /* btrfs reports major number = 0 */
>     -            if (strcmp("btrfs", dash + type_s) != 0 ||
>     -                dev_major_minor(dash + dev_s, &devmajor,
>     &devminor) < 0) {
>     -                continue;
>     -            }
>     -        }
>     -
>     -        mount = g_new0(FsMount, 1);
>     -        mount->dirname = g_strdup(line + dir_s);
>     -        mount->devtype = g_strdup(dash + type_s);
>     -        mount->devmajor = devmajor;
>     -        mount->devminor = devminor;
>     -
>     -        QTAILQ_INSERT_TAIL(mounts, mount, next);
>     -    }
>     -    free(line);
>     -
>     -    fclose(fp);
>     -    return true;
>     -}
>     -#endif
>     -
>     -#if defined(CONFIG_FSFREEZE)
>     -
>     -static char *get_pci_driver(char const *syspath, int pathlen,
>     Error **errp)
>     -{
>     -    char *path;
>     -    char *dpath;
>     -    char *driver = NULL;
>     -    char buf[PATH_MAX];
>     -    ssize_t len;
>     -
>     -    path = g_strndup(syspath, pathlen);
>     -    dpath = g_strdup_printf("%s/driver", path);
>     -    len = readlink(dpath, buf, sizeof(buf) - 1);
>     -    if (len != -1) {
>     -        buf[len] = 0;
>     -        driver = g_path_get_basename(buf);
>     -    }
>     -    g_free(dpath);
>     -    g_free(path);
>     -    return driver;
>     -}
>     -
>     -static int compare_uint(const void *_a, const void *_b)
>     -{
>     -    unsigned int a = *(unsigned int *)_a;
>     -    unsigned int b = *(unsigned int *)_b;
>     -
>     -    return a < b ? -1 : a > b ? 1 : 0;
>     -}
>     -
>     -/* Walk the specified sysfs and build a sorted list of host or
>     ata numbers */
>     -static int build_hosts(char const *syspath, char const *host,
>     bool ata,
>     -                       unsigned int *hosts, int hosts_max, Error
>     **errp)
>     -{
>     -    char *path;
>     -    DIR *dir;
>     -    struct dirent *entry;
>     -    int i = 0;
>     -
>     -    path = g_strndup(syspath, host - syspath);
>     -    dir = opendir(path);
>     -    if (!dir) {
>     -        error_setg_errno(errp, errno, "opendir(\"%s\")", path);
>     -        g_free(path);
>     -        return -1;
>     -    }
>     -
>     -    while (i < hosts_max) {
>     -        entry = readdir(dir);
>     -        if (!entry) {
>     -            break;
>     -        }
>     -        if (ata && sscanf(entry->d_name, "ata%d", hosts + i) == 1) {
>     -            ++i;
>     -        } else if (!ata && sscanf(entry->d_name, "host%d", hosts
>     + i) == 1) {
>     -            ++i;
>     -        }
>     -    }
>     -
>     -    qsort(hosts, i, sizeof(hosts[0]), compare_uint);
>     -
>     -    g_free(path);
>     -    closedir(dir);
>     -    return i;
>     -}
>     -
>     -/*
>     - * Store disk device info for devices on the PCI bus.
>     - * Returns true if information has been stored, or false for failure.
>     - */
>     -static bool build_guest_fsinfo_for_pci_dev(char const *syspath,
>     -                                           GuestDiskAddress *disk,
>     -                                           Error **errp)
>     -{
>     -    unsigned int pci[4], host, hosts[8], tgt[3];
>     -    int i, nhosts = 0, pcilen;
>     -    GuestPCIAddress *pciaddr = disk->pci_controller;
>     -    bool has_ata = false, has_host = false, has_tgt = false;
>     -    char *p, *q, *driver = NULL;
>     -    bool ret = false;
>     -
>     -    p = strstr(syspath, "/devices/pci");
>     -    if (!p || sscanf(p + 12, "%*x:%*x/%x:%x:%x.%x%n",
>     -                     pci, pci + 1, pci + 2, pci + 3, &pcilen) < 4) {
>     -        g_debug("only pci device is supported: sysfs path '%s'",
>     syspath);
>     -        return false;
>     -    }
>     -
>     -    p += 12 + pcilen;
>     -    while (true) {
>     -        driver = get_pci_driver(syspath, p - syspath, errp);
>     -        if (driver && (g_str_equal(driver, "ata_piix") ||
>     -                       g_str_equal(driver, "sym53c8xx") ||
>     -                       g_str_equal(driver, "virtio-pci") ||
>     -                       g_str_equal(driver, "ahci") ||
>     -                       g_str_equal(driver, "nvme"))) {
>     -            break;
>     -        }
>     -
>     -        g_free(driver);
>     -        if (sscanf(p, "/%x:%x:%x.%x%n",
>     -                          pci, pci + 1, pci + 2, pci + 3,
>     &pcilen) == 4) {
>     -            p += pcilen;
>     -            continue;
>     -        }
>     -
>     -        g_debug("unsupported driver or sysfs path '%s'", syspath);
>     -        return false;
>     -    }
>     -
>     -    p = strstr(syspath, "/target");
>     -    if (p && sscanf(p + 7, "%*u:%*u:%*u/%*u:%u:%u:%u",
>     -                    tgt, tgt + 1, tgt + 2) == 3) {
>     -        has_tgt = true;
>     -    }
>     -
>     -    p = strstr(syspath, "/ata");
>     -    if (p) {
>     -        q = p + 4;
>     -        has_ata = true;
>     -    } else {
>     -        p = strstr(syspath, "/host");
>     -        q = p + 5;
>     -    }
>     -    if (p && sscanf(q, "%u", &host) == 1) {
>     -        has_host = true;
>     -        nhosts = build_hosts(syspath, p, has_ata, hosts,
>     -                             ARRAY_SIZE(hosts), errp);
>     -        if (nhosts < 0) {
>     -            goto cleanup;
>     -        }
>     -    }
>     -
>     -    pciaddr->domain = pci[0];
>     -    pciaddr->bus = pci[1];
>     -    pciaddr->slot = pci[2];
>     -    pciaddr->function = pci[3];
>     -
>     -    if (strcmp(driver, "ata_piix") == 0) {
>     -        /* a host per ide bus, target*:0:<unit>:0 */
>     -        if (!has_host || !has_tgt) {
>     -            g_debug("invalid sysfs path '%s' (driver '%s')",
>     syspath, driver);
>     -            goto cleanup;
>     -        }
>     -        for (i = 0; i < nhosts; i++) {
>     -            if (host == hosts[i]) {
>     -                disk->bus_type = GUEST_DISK_BUS_TYPE_IDE;
>     -                disk->bus = i;
>     -                disk->unit = tgt[1];
>     -                break;
>     -            }
>     -        }
>     -        if (i >= nhosts) {
>     -            g_debug("no host for '%s' (driver '%s')", syspath,
>     driver);
>     -            goto cleanup;
>     -        }
>     -    } else if (strcmp(driver, "sym53c8xx") == 0) {
>     -        /* scsi(LSI Logic): target*:0:<unit>:0 */
>     -        if (!has_tgt) {
>     -            g_debug("invalid sysfs path '%s' (driver '%s')",
>     syspath, driver);
>     -            goto cleanup;
>     -        }
>     -        disk->bus_type = GUEST_DISK_BUS_TYPE_SCSI;
>     -        disk->unit = tgt[1];
>     -    } else if (strcmp(driver, "virtio-pci") == 0) {
>     -        if (has_tgt) {
>     -            /* virtio-scsi: target*:0:0:<unit> */
>     -            disk->bus_type = GUEST_DISK_BUS_TYPE_SCSI;
>     -            disk->unit = tgt[2];
>     -        } else {
>     -            /* virtio-blk: 1 disk per 1 device */
>     -            disk->bus_type = GUEST_DISK_BUS_TYPE_VIRTIO;
>     -        }
>     -    } else if (strcmp(driver, "ahci") == 0) {
>     -        /* ahci: 1 host per 1 unit */
>     -        if (!has_host || !has_tgt) {
>     -            g_debug("invalid sysfs path '%s' (driver '%s')",
>     syspath, driver);
>     -            goto cleanup;
>     -        }
>     -        for (i = 0; i < nhosts; i++) {
>     -            if (host == hosts[i]) {
>     -                disk->unit = i;
>     -                disk->bus_type = GUEST_DISK_BUS_TYPE_SATA;
>     -                break;
>     -            }
>     -        }
>     -        if (i >= nhosts) {
>     -            g_debug("no host for '%s' (driver '%s')", syspath,
>     driver);
>     -            goto cleanup;
>     -        }
>     -    } else if (strcmp(driver, "nvme") == 0) {
>     -        disk->bus_type = GUEST_DISK_BUS_TYPE_NVME;
>     -    } else {
>     -        g_debug("unknown driver '%s' (sysfs path '%s')", driver,
>     syspath);
>     -        goto cleanup;
>     -    }
>     -
>     -    ret = true;
>     -
>     -cleanup:
>     -    g_free(driver);
>     -    return ret;
>     -}
>     -
>     -/*
>     - * Store disk device info for non-PCI virtio devices (for example
>     s390x
>     - * channel I/O devices). Returns true if information has been
>     stored, or
>     - * false for failure.
>     - */
>     -static bool build_guest_fsinfo_for_nonpci_virtio(char const *syspath,
>     -  GuestDiskAddress *disk,
>     -                                                 Error **errp)
>     -{
>     -    unsigned int tgt[3];
>     -    char *p;
>     -
>     -    if (!strstr(syspath, "/virtio") || !strstr(syspath, "/block")) {
>     -        g_debug("Unsupported virtio device '%s'", syspath);
>     -        return false;
>     -    }
>     -
>     -    p = strstr(syspath, "/target");
>     -    if (p && sscanf(p + 7, "%*u:%*u:%*u/%*u:%u:%u:%u",
>     -                    &tgt[0], &tgt[1], &tgt[2]) == 3) {
>     -        /* virtio-scsi: target*:0:<target>:<unit> */
>     -        disk->bus_type = GUEST_DISK_BUS_TYPE_SCSI;
>     -        disk->bus = tgt[0];
>     -        disk->target = tgt[1];
>     -        disk->unit = tgt[2];
>     -    } else {
>     -        /* virtio-blk: 1 disk per 1 device */
>     -        disk->bus_type = GUEST_DISK_BUS_TYPE_VIRTIO;
>     -    }
>     -
>     -    return true;
>     -}
>     -
>     -/*
>     - * Store disk device info for CCW devices (s390x channel I/O
>     devices).
>     - * Returns true if information has been stored, or false for failure.
>     - */
>     -static bool build_guest_fsinfo_for_ccw_dev(char const *syspath,
>     -                                           GuestDiskAddress *disk,
>     -                                           Error **errp)
>     -{
>     -    unsigned int cssid, ssid, subchno, devno;
>     -    char *p;
>     -
>     -    p = strstr(syspath, "/devices/css");
>     -    if (!p || sscanf(p + 12, "%*x/%x.%x.%x/%*x.%*x.%x/",
>     -                     &cssid, &ssid, &subchno, &devno) < 4) {
>     -        g_debug("could not parse ccw device sysfs path: %s",
>     syspath);
>     -        return false;
>     -    }
>     -
>     -    disk->has_ccw_address = true;
>     -    disk->ccw_address = g_new0(GuestCCWAddress, 1);
>     -    disk->ccw_address->cssid = cssid;
>     -    disk->ccw_address->ssid = ssid;
>     -    disk->ccw_address->subchno = subchno;
>     -    disk->ccw_address->devno = devno;
>     -
>     -    if (strstr(p, "/virtio")) {
>     -        build_guest_fsinfo_for_nonpci_virtio(syspath, disk, errp);
>     -    }
>     -
>     -    return true;
>     -}
>     -
>     -/* Store disk device info specified by @sysfs into @fs */
>     -static void build_guest_fsinfo_for_real_device(char const *syspath,
>     -  GuestFilesystemInfo *fs,
>     -                                               Error **errp)
>     -{
>     -    GuestDiskAddress *disk;
>     -    GuestPCIAddress *pciaddr;
>     -    bool has_hwinf;
>     -#ifdef CONFIG_LIBUDEV
>     -    struct udev *udev = NULL;
>     -    struct udev_device *udevice = NULL;
>     -#endif
>     -
>     -    pciaddr = g_new0(GuestPCIAddress, 1);
>     -    pciaddr->domain = -1;                       /* -1 means field
>     is invalid */
>     -    pciaddr->bus = -1;
>     -    pciaddr->slot = -1;
>     -    pciaddr->function = -1;
>     -
>     -    disk = g_new0(GuestDiskAddress, 1);
>     -    disk->pci_controller = pciaddr;
>     -    disk->bus_type = GUEST_DISK_BUS_TYPE_UNKNOWN;
>     -
>     -#ifdef CONFIG_LIBUDEV
>     -    udev = udev_new();
>     -    udevice = udev_device_new_from_syspath(udev, syspath);
>     -    if (udev == NULL || udevice == NULL) {
>     -        g_debug("failed to query udev");
>     -    } else {
>     -        const char *devnode, *serial;
>     -        devnode = udev_device_get_devnode(udevice);
>     -        if (devnode != NULL) {
>     -            disk->dev = g_strdup(devnode);
>     -            disk->has_dev = true;
>     -        }
>     -        serial = udev_device_get_property_value(udevice,
>     "ID_SERIAL");
>     -        if (serial != NULL && *serial != 0) {
>     -            disk->serial = g_strdup(serial);
>     -            disk->has_serial = true;
>     -        }
>     -    }
>     -
>     -    udev_unref(udev);
>     -    udev_device_unref(udevice);
>     -#endif
>     -
>     -    if (strstr(syspath, "/devices/pci")) {
>     -        has_hwinf = build_guest_fsinfo_for_pci_dev(syspath, disk,
>     errp);
>     -    } else if (strstr(syspath, "/devices/css")) {
>     -        has_hwinf = build_guest_fsinfo_for_ccw_dev(syspath, disk,
>     errp);
>     -    } else if (strstr(syspath, "/virtio")) {
>     -        has_hwinf = build_guest_fsinfo_for_nonpci_virtio(syspath,
>     disk, errp);
>     -    } else {
>     -        g_debug("Unsupported device type for '%s'", syspath);
>     -        has_hwinf = false;
>     -    }
>     -
>     -    if (has_hwinf || disk->has_dev || disk->has_serial) {
>     -        QAPI_LIST_PREPEND(fs->disk, disk);
>     -    } else {
>     -        qapi_free_GuestDiskAddress(disk);
>     -    }
>     -}
>     -
>     -static void build_guest_fsinfo_for_device(char const *devpath,
>     - GuestFilesystemInfo *fs,
>     -                                          Error **errp);
>     -
>     -/* Store a list of slave devices of virtual volume specified by
>     @syspath into
>     - * @fs */
>     -static void build_guest_fsinfo_for_virtual_device(char const
>     *syspath,
>     - GuestFilesystemInfo *fs,
>     -                                                  Error **errp)
>     -{
>     -    Error *err = NULL;
>     -    DIR *dir;
>     -    char *dirpath;
>     -    struct dirent *entry;
>     -
>     -    dirpath = g_strdup_printf("%s/slaves", syspath);
>     -    dir = opendir(dirpath);
>     -    if (!dir) {
>     -        if (errno != ENOENT) {
>     -            error_setg_errno(errp, errno, "opendir(\"%s\")",
>     dirpath);
>     -        }
>     -        g_free(dirpath);
>     -        return;
>     -    }
>     -
>     -    for (;;) {
>     -        errno = 0;
>     -        entry = readdir(dir);
>     -        if (entry == NULL) {
>     -            if (errno) {
>     -                error_setg_errno(errp, errno, "readdir(\"%s\")",
>     dirpath);
>     -            }
>     -            break;
>     -        }
>     -
>     -        if (entry->d_type == DT_LNK) {
>     -            char *path;
>     -
>     -            g_debug(" slave device '%s'", entry->d_name);
>     -            path = g_strdup_printf("%s/slaves/%s", syspath,
>     entry->d_name);
>     -            build_guest_fsinfo_for_device(path, fs, &err);
>     -            g_free(path);
>     -
>     -            if (err) {
>     -                error_propagate(errp, err);
>     -                break;
>     -            }
>     -        }
>     -    }
>     -
>     -    g_free(dirpath);
>     -    closedir(dir);
>     -}
>     -
>     -static bool is_disk_virtual(const char *devpath, Error **errp)
>     -{
>     -    g_autofree char *syspath = realpath(devpath, NULL);
>     -
>     -    if (!syspath) {
>     -        error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
>     -        return false;
>     -    }
>     -    return strstr(syspath, "/devices/virtual/block/") != NULL;
>     -}
>     -
>     -/* Dispatch to functions for virtual/real device */
>     -static void build_guest_fsinfo_for_device(char const *devpath,
>     - GuestFilesystemInfo *fs,
>     -                                          Error **errp)
>     -{
>     -    ERRP_GUARD();
>     -    g_autofree char *syspath = NULL;
>     -    bool is_virtual = false;
>     -
>     -    syspath = realpath(devpath, NULL);
>     -    if (!syspath) {
>     -        if (errno != ENOENT) {
>     -            error_setg_errno(errp, errno, "realpath(\"%s\")",
>     devpath);
>     -            return;
>     -        }
>     -
>     -        /* ENOENT: This devpath may not exist because of
>     container config */
>     -        if (!fs->name) {
>     -            fs->name = g_path_get_basename(devpath);
>     -        }
>     -        return;
>     -    }
>     -
>     -    if (!fs->name) {
>     -        fs->name = g_path_get_basename(syspath);
>     -    }
>     -
>     -    g_debug("  parse sysfs path '%s'", syspath);
>     -    is_virtual = is_disk_virtual(syspath, errp);
>     -    if (*errp != NULL) {
>     -        return;
>     -    }
>     -    if (is_virtual) {
>     -        build_guest_fsinfo_for_virtual_device(syspath, fs, errp);
>     -    } else {
>     -        build_guest_fsinfo_for_real_device(syspath, fs, errp);
>     -    }
>     -}
>     -
>     -#ifdef CONFIG_LIBUDEV
>     -
>     -/*
>     - * Wrapper around build_guest_fsinfo_for_device() for getting just
>     - * the disk address.
>     - */
>     -static GuestDiskAddress *get_disk_address(const char *syspath,
>     Error **errp)
>     -{
>     -    g_autoptr(GuestFilesystemInfo) fs = NULL;
>     -
>     -    fs = g_new0(GuestFilesystemInfo, 1);
>     -    build_guest_fsinfo_for_device(syspath, fs, errp);
>     -    if (fs->disk != NULL) {
>     -        return g_steal_pointer(&fs->disk->value);
>     -    }
>     -    return NULL;
>     -}
>     -
>     -static char *get_alias_for_syspath(const char *syspath)
>     -{
>     -    struct udev *udev = NULL;
>     -    struct udev_device *udevice = NULL;
>     -    char *ret = NULL;
>     -
>     -    udev = udev_new();
>     -    if (udev == NULL) {
>     -        g_debug("failed to query udev");
>     -        goto out;
>     -    }
>     -    udevice = udev_device_new_from_syspath(udev, syspath);
>     -    if (udevice == NULL) {
>     -        g_debug("failed to query udev for path: %s", syspath);
>     -        goto out;
>     -    } else {
>     -        const char *alias = udev_device_get_property_value(
>     -            udevice, "DM_NAME");
>     -        /*
>     -         * NULL means there was an error and empty string means
>     there is no
>     -         * alias. In case of no alias we return NULL instead of
>     empty string.
>     -         */
>     -        if (alias == NULL) {
>     -            g_debug("failed to query udev for device alias for: %s",
>     -                syspath);
>     -        } else if (*alias != 0) {
>     -            ret = g_strdup(alias);
>     -        }
>     -    }
>     -
>     -out:
>     -    udev_unref(udev);
>     -    udev_device_unref(udevice);
>     -    return ret;
>     -}
>     -
>     -static char *get_device_for_syspath(const char *syspath)
>     -{
>     -    struct udev *udev = NULL;
>     -    struct udev_device *udevice = NULL;
>     -    char *ret = NULL;
>     -
>     -    udev = udev_new();
>     -    if (udev == NULL) {
>     -        g_debug("failed to query udev");
>     -        goto out;
>     -    }
>     -    udevice = udev_device_new_from_syspath(udev, syspath);
>     -    if (udevice == NULL) {
>     -        g_debug("failed to query udev for path: %s", syspath);
>     -        goto out;
>     -    } else {
>     -        ret = g_strdup(udev_device_get_devnode(udevice));
>     -    }
>     -
>     -out:
>     -    udev_unref(udev);
>     -    udev_device_unref(udevice);
>     -    return ret;
>     -}
>     -
>     -static void get_disk_deps(const char *disk_dir, GuestDiskInfo *disk)
>     -{
>     -    g_autofree char *deps_dir = NULL;
>     -    const gchar *dep;
>     -    GDir *dp_deps = NULL;
>     -
>     -    /* List dependent disks */
>     -    deps_dir = g_strdup_printf("%s/slaves", disk_dir);
>     -    g_debug("  listing entries in: %s", deps_dir);
>     -    dp_deps = g_dir_open(deps_dir, 0, NULL);
>     -    if (dp_deps == NULL) {
>     -        g_debug("failed to list entries in %s", deps_dir);
>     -        return;
>     -    }
>     -    disk->has_dependencies = true;
>     -    while ((dep = g_dir_read_name(dp_deps)) != NULL) {
>     -        g_autofree char *dep_dir = NULL;
>     -        char *dev_name;
>     -
>     -        /* Add dependent disks */
>     -        dep_dir = g_strdup_printf("%s/%s", deps_dir, dep);
>     -        dev_name = get_device_for_syspath(dep_dir);
>     -        if (dev_name != NULL) {
>     -            g_debug("  adding dependent device: %s", dev_name);
>     -            QAPI_LIST_PREPEND(disk->dependencies, dev_name);
>     -        }
>     -    }
>     -    g_dir_close(dp_deps);
>     -}
>     -
>     -/*
>     - * Detect partitions subdirectory, name is "<disk_name><number>" or
>     - * "<disk_name>p<number>"
>     - *
>     - * @disk_name -- last component of /sys path (e.g. sda)
>     - * @disk_dir -- sys path of the disk (e.g. /sys/block/sda)
>     - * @disk_dev -- device node of the disk (e.g. /dev/sda)
>     - */
>     -static GuestDiskInfoList *get_disk_partitions(
>     -    GuestDiskInfoList *list,
>     -    const char *disk_name, const char *disk_dir,
>     -    const char *disk_dev)
>     -{
>     -    GuestDiskInfoList *ret = list;
>     -    struct dirent *de_disk;
>     -    DIR *dp_disk = NULL;
>     -    size_t len = strlen(disk_name);
>     -
>     -    dp_disk = opendir(disk_dir);
>     -    while ((de_disk = readdir(dp_disk)) != NULL) {
>     -        g_autofree char *partition_dir = NULL;
>     -        char *dev_name;
>     -        GuestDiskInfo *partition;
>     -
>     -        if (!(de_disk->d_type & DT_DIR)) {
>     -            continue;
>     -        }
>     -
>     -        if (!(strncmp(disk_name, de_disk->d_name, len) == 0 &&
>     -            ((*(de_disk->d_name + len) == 'p' &&
>     -            isdigit(*(de_disk->d_name + len + 1))) ||
>     -                isdigit(*(de_disk->d_name + len))))) {
>     -            continue;
>     -        }
>     -
>     -        partition_dir = g_strdup_printf("%s/%s",
>     -            disk_dir, de_disk->d_name);
>     -        dev_name = get_device_for_syspath(partition_dir);
>     -        if (dev_name == NULL) {
>     -            g_debug("Failed to get device name for syspath: %s",
>     -                disk_dir);
>     -            continue;
>     -        }
>     -        partition = g_new0(GuestDiskInfo, 1);
>     -        partition->name = dev_name;
>     -        partition->partition = true;
>     -        partition->has_dependencies = true;
>     -        /* Add parent disk as dependent for easier tracking of
>     hierarchy */
>     -        QAPI_LIST_PREPEND(partition->dependencies,
>     g_strdup(disk_dev));
>     -
>     -        QAPI_LIST_PREPEND(ret, partition);
>     -    }
>     -    closedir(dp_disk);
>     -
>     -    return ret;
>     -}
>     -
>     -static void get_nvme_smart(GuestDiskInfo *disk)
>     -{
>     -    int fd;
>     -    GuestNVMeSmart *smart;
>     -    NvmeSmartLog log = {0};
>     -    struct nvme_admin_cmd cmd = {
>     -        .opcode = NVME_ADM_CMD_GET_LOG_PAGE,
>     -        .nsid = NVME_NSID_BROADCAST,
>     -        .addr = (uintptr_t)&log,
>     -        .data_len = sizeof(log),
>     -        .cdw10 = NVME_LOG_SMART_INFO | (1 << 15) /* RAE bit */
>     -                 | (((sizeof(log) >> 2) - 1) << 16)
>     -    };
>     -
>     -    fd = qga_open_cloexec(disk->name, O_RDONLY, 0);
>     -    if (fd == -1) {
>     -        g_debug("Failed to open device: %s: %s", disk->name,
>     g_strerror(errno));
>     -        return;
>     -    }
>     -
>     -    if (ioctl(fd, NVME_IOCTL_ADMIN_CMD, &cmd)) {
>     -        g_debug("Failed to get smart: %s: %s", disk->name,
>     g_strerror(errno));
>     -        close(fd);
>     -        return;
>     -    }
>     -
>     -    disk->has_smart = true;
>     -    disk->smart = g_new0(GuestDiskSmart, 1);
>     -    disk->smart->type = GUEST_DISK_BUS_TYPE_NVME;
>     -
>     -    smart = &disk->smart->u.nvme;
>     -    smart->critical_warning = log.critical_warning;
>     -    smart->temperature = lduw_le_p(&log.temperature); /*
>     unaligned field */
>     -    smart->available_spare = log.available_spare;
>     -    smart->available_spare_threshold = log.available_spare_threshold;
>     -    smart->percentage_used = log.percentage_used;
>     -    smart->data_units_read_lo = le64_to_cpu(log.data_units_read[0]);
>     -    smart->data_units_read_hi = le64_to_cpu(log.data_units_read[1]);
>     -    smart->data_units_written_lo =
>     le64_to_cpu(log.data_units_written[0]);
>     -    smart->data_units_written_hi =
>     le64_to_cpu(log.data_units_written[1]);
>     -    smart->host_read_commands_lo =
>     le64_to_cpu(log.host_read_commands[0]);
>     -    smart->host_read_commands_hi =
>     le64_to_cpu(log.host_read_commands[1]);
>     -    smart->host_write_commands_lo =
>     le64_to_cpu(log.host_write_commands[0]);
>     -    smart->host_write_commands_hi =
>     le64_to_cpu(log.host_write_commands[1]);
>     -    smart->controller_busy_time_lo =
>     le64_to_cpu(log.controller_busy_time[0]);
>     -    smart->controller_busy_time_hi =
>     le64_to_cpu(log.controller_busy_time[1]);
>     -    smart->power_cycles_lo = le64_to_cpu(log.power_cycles[0]);
>     -    smart->power_cycles_hi = le64_to_cpu(log.power_cycles[1]);
>     -    smart->power_on_hours_lo = le64_to_cpu(log.power_on_hours[0]);
>     -    smart->power_on_hours_hi = le64_to_cpu(log.power_on_hours[1]);
>     -    smart->unsafe_shutdowns_lo =
>     le64_to_cpu(log.unsafe_shutdowns[0]);
>     -    smart->unsafe_shutdowns_hi =
>     le64_to_cpu(log.unsafe_shutdowns[1]);
>     -    smart->media_errors_lo = le64_to_cpu(log.media_errors[0]);
>     -    smart->media_errors_hi = le64_to_cpu(log.media_errors[1]);
>     -    smart->number_of_error_log_entries_lo =
>     -        le64_to_cpu(log.number_of_error_log_entries[0]);
>     -    smart->number_of_error_log_entries_hi =
>     -        le64_to_cpu(log.number_of_error_log_entries[1]);
>     -
>     -    close(fd);
>     -}
>     -
>     -static void get_disk_smart(GuestDiskInfo *disk)
>     -{
>     -    if (disk->has_address
>     -        && (disk->address->bus_type == GUEST_DISK_BUS_TYPE_NVME)) {
>     -        get_nvme_smart(disk);
>     -    }
>     -}
>     -
>     -GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
>     -{
>     -    GuestDiskInfoList *ret = NULL;
>     -    GuestDiskInfo *disk;
>     -    DIR *dp = NULL;
>     -    struct dirent *de = NULL;
>     -
>     -    g_debug("listing /sys/block directory");
>     -    dp = opendir("/sys/block");
>     -    if (dp == NULL) {
>     -        error_setg_errno(errp, errno, "Can't open directory
>     \"/sys/block\"");
>     -        return NULL;
>     -    }
>     -    while ((de = readdir(dp)) != NULL) {
>     -        g_autofree char *disk_dir = NULL, *line = NULL,
>     -            *size_path = NULL;
>     -        char *dev_name;
>     -        Error *local_err = NULL;
>     -        if (de->d_type != DT_LNK) {
>     -            g_debug("  skipping entry: %s", de->d_name);
>     -            continue;
>     -        }
>     -
>     -        /* Check size and skip zero-sized disks */
>     -        g_debug("  checking disk size");
>     -        size_path = g_strdup_printf("/sys/block/%s/size",
>     de->d_name);
>     -        if (!g_file_get_contents(size_path, &line, NULL, NULL)) {
>     -            g_debug("  failed to read disk size");
>     -            continue;
>     -        }
>     -        if (g_strcmp0(line, "0\n") == 0) {
>     -            g_debug("  skipping zero-sized disk");
>     -            continue;
>     -        }
>     -
>     -        g_debug("  adding %s", de->d_name);
>     -        disk_dir = g_strdup_printf("/sys/block/%s", de->d_name);
>     -        dev_name = get_device_for_syspath(disk_dir);
>     -        if (dev_name == NULL) {
>     -            g_debug("Failed to get device name for syspath: %s",
>     -                disk_dir);
>     -            continue;
>     -        }
>     -        disk = g_new0(GuestDiskInfo, 1);
>     -        disk->name = dev_name;
>     -        disk->partition = false;
>     -        disk->alias = get_alias_for_syspath(disk_dir);
>     -        disk->has_alias = (disk->alias != NULL);
>     -        QAPI_LIST_PREPEND(ret, disk);
>     -
>     -        /* Get address for non-virtual devices */
>     -        bool is_virtual = is_disk_virtual(disk_dir, &local_err);
>     -        if (local_err != NULL) {
>     -            g_debug("  failed to check disk path, ignoring error:
>     %s",
>     -                error_get_pretty(local_err));
>     -            error_free(local_err);
>     -            local_err = NULL;
>     -            /* Don't try to get the address */
>     -            is_virtual = true;
>     -        }
>     -        if (!is_virtual) {
>     -            disk->address = get_disk_address(disk_dir, &local_err);
>     -            if (local_err != NULL) {
>     -                g_debug("  failed to get device info, ignoring
>     error: %s",
>     -                    error_get_pretty(local_err));
>     -                error_free(local_err);
>     -                local_err = NULL;
>     -            } else if (disk->address != NULL) {
>     -                disk->has_address = true;
>     -            }
>     -        }
>     -
>     -        get_disk_deps(disk_dir, disk);
>     -        get_disk_smart(disk);
>     -        ret = get_disk_partitions(ret, de->d_name, disk_dir,
>     dev_name);
>     -    }
>     -
>     -    closedir(dp);
>     -
>     -    return ret;
>     -}
>     -
>     -#else
>     -
>     -GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
>     -{
>     -    error_setg(errp, QERR_UNSUPPORTED);
>     -    return NULL;
>     -}
>     -
>     -#endif
>     -
>     -/* Return a list of the disk device(s)' info which @mount lies on */
>     -static GuestFilesystemInfo *build_guest_fsinfo(struct FsMount *mount,
>     -                                               Error **errp)
>     -{
>     -    GuestFilesystemInfo *fs = g_malloc0(sizeof(*fs));
>     -    struct statvfs buf;
>     -    unsigned long used, nonroot_total, fr_size;
>     -    char *devpath = g_strdup_printf("/sys/dev/block/%u:%u",
>     -                                    mount->devmajor,
>     mount->devminor);
>     -
>     -    fs->mountpoint = g_strdup(mount->dirname);
>     -    fs->type = g_strdup(mount->devtype);
>     -    build_guest_fsinfo_for_device(devpath, fs, errp);
>     -
>     -    if (statvfs(fs->mountpoint, &buf) == 0) {
>     -        fr_size = buf.f_frsize;
>     -        used = buf.f_blocks - buf.f_bfree;
>     -        nonroot_total = used + buf.f_bavail;
>     -        fs->used_bytes = used * fr_size;
>     -        fs->total_bytes = nonroot_total * fr_size;
>     -
>     -        fs->has_total_bytes = true;
>     -        fs->has_used_bytes = true;
>     -    }
>     -
>     -    g_free(devpath);
>     -
>     -    return fs;
>     -}
>     -
>     -GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
>     -{
>     -    FsMountList mounts;
>     -    struct FsMount *mount;
>     -    GuestFilesystemInfoList *ret = NULL;
>     -    Error *local_err = NULL;
>     -
>     -    QTAILQ_INIT(&mounts);
>     -    if (!build_fs_mount_list(&mounts, &local_err)) {
>     -        error_propagate(errp, local_err);
>     -        return NULL;
>     -    }
>     -
>     -    QTAILQ_FOREACH(mount, &mounts, next) {
>     -        g_debug("Building guest fsinfo for '%s'", mount->dirname);
>     -
>     -        QAPI_LIST_PREPEND(ret, build_guest_fsinfo(mount,
>     &local_err));
>     -        if (local_err) {
>     -            error_propagate(errp, local_err);
>     -            qapi_free_GuestFilesystemInfoList(ret);
>     -            ret = NULL;
>     -            break;
>     -        }
>     -    }
>     -
>     -    free_fs_mount_list(&mounts);
>     -    return ret;
>     -}
>     -
>     -
>     -typedef enum {
>     -    FSFREEZE_HOOK_THAW = 0,
>     -    FSFREEZE_HOOK_FREEZE,
>     -} FsfreezeHookArg;
>     -
>     -static const char *fsfreeze_hook_arg_string[] = {
>     -    "thaw",
>     -    "freeze",
>     -};
>     -
>     -static void execute_fsfreeze_hook(FsfreezeHookArg arg, Error **errp)
>     -{
>     -    int status;
>     -    pid_t pid;
>     -    const char *hook;
>     -    const char *arg_str = fsfreeze_hook_arg_string[arg];
>     -    Error *local_err = NULL;
>     -
>     -    hook = ga_fsfreeze_hook(ga_state);
>     -    if (!hook) {
>     -        return;
>     -    }
>     -    if (access(hook, X_OK) != 0) {
>     -        error_setg_errno(errp, errno, "can't access fsfreeze hook
>     '%s'", hook);
>     -        return;
>     -    }
>     -
>     -    slog("executing fsfreeze hook with arg '%s'", arg_str);
>     -    pid = fork();
>     -    if (pid == 0) {
>     -        setsid();
>     -        reopen_fd_to_null(0);
>     -        reopen_fd_to_null(1);
>     -        reopen_fd_to_null(2);
>     -
>     -        execl(hook, hook, arg_str, NULL);
>     -        _exit(EXIT_FAILURE);
>     -    } else if (pid < 0) {
>     -        error_setg_errno(errp, errno, "failed to create child
>     process");
>     -        return;
>     -    }
>     -
>     -    ga_wait_child(pid, &status, &local_err);
>     -    if (local_err) {
>     -        error_propagate(errp, local_err);
>     -        return;
>     -    }
>     -
>     -    if (!WIFEXITED(status)) {
>     -        error_setg(errp, "fsfreeze hook has terminated abnormally");
>     -        return;
>     -    }
>     -
>     -    status = WEXITSTATUS(status);
>     -    if (status) {
>     -        error_setg(errp, "fsfreeze hook has failed with status
>     %d", status);
>     -        return;
>     -    }
>     -}
>     -
>     -/*
>     - * Return status of freeze/thaw
>     - */
>     -GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **errp)
>     -{
>     -    if (ga_is_frozen(ga_state)) {
>     -        return GUEST_FSFREEZE_STATUS_FROZEN;
>     -    }
>     -
>     -    return GUEST_FSFREEZE_STATUS_THAWED;
>     -}
>     -
>     -int64_t qmp_guest_fsfreeze_freeze(Error **errp)
>     -{
>     -    return qmp_guest_fsfreeze_freeze_list(false, NULL, errp);
>     -}
>     -
>     -/*
>     - * Walk list of mounted file systems in the guest, and freeze the
>     ones which
>     - * are real local file systems.
>     - */
>     -int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
>     -                                       strList *mountpoints,
>     -                                       Error **errp)
>     -{
>     -    int ret = 0, i = 0;
>     -    strList *list;
>     -    FsMountList mounts;
>     -    struct FsMount *mount;
>     -    Error *local_err = NULL;
>     -    int fd;
>     -
>     -    slog("guest-fsfreeze called");
>     -
>     -    execute_fsfreeze_hook(FSFREEZE_HOOK_FREEZE, &local_err);
>     -    if (local_err) {
>     -        error_propagate(errp, local_err);
>     -        return -1;
>     -    }
>     -
>     -    QTAILQ_INIT(&mounts);
>     -    if (!build_fs_mount_list(&mounts, &local_err)) {
>     -        error_propagate(errp, local_err);
>     -        return -1;
>     -    }
>     -
>     -    /* cannot risk guest agent blocking itself on a write in this
>     state */
>     -    ga_set_frozen(ga_state);
>     -
>     -    QTAILQ_FOREACH_REVERSE(mount, &mounts, next) {
>     -        /* To issue fsfreeze in the reverse order of mounts,
>     check if the
>     -         * mount is listed in the list here */
>     -        if (has_mountpoints) {
>     -            for (list = mountpoints; list; list = list->next) {
>     -                if (strcmp(list->value, mount->dirname) == 0) {
>     -                    break;
>     -                }
>     -            }
>     -            if (!list) {
>     -                continue;
>     -            }
>     -        }
>     -
>     -        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
>     -        if (fd == -1) {
>     -            error_setg_errno(errp, errno, "failed to open %s",
>     mount->dirname);
>     -            goto error;
>     -        }
>     -
>     -        /* we try to cull filesystems we know won't work in
>     advance, but other
>     -         * filesystems may not implement fsfreeze for less
>     obvious reasons.
>     -         * these will report EOPNOTSUPP. we simply ignore these
>     when tallying
>     -         * the number of frozen filesystems.
>     -         * if a filesystem is mounted more than once (aka bind
>     mount) a
>     -         * consecutive attempt to freeze an already frozen
>     filesystem will
>     -         * return EBUSY.
>     -         *
>     -         * any other error means a failure to freeze a filesystem we
>     -         * expect to be freezable, so return an error in those cases
>     -         * and return system to thawed state.
>     -         */
>     -        ret = ioctl(fd, FIFREEZE);
>     -        if (ret == -1) {
>     -            if (errno != EOPNOTSUPP && errno != EBUSY) {
>     -                error_setg_errno(errp, errno, "failed to freeze %s",
>     -                                 mount->dirname);
>     -                close(fd);
>     -                goto error;
>     -            }
>     -        } else {
>     -            i++;
>     -        }
>     -        close(fd);
>     -    }
>     -
>     -    free_fs_mount_list(&mounts);
>     -    /* We may not issue any FIFREEZE here.
>     -     * Just unset ga_state here and ready for the next call.
>     -     */
>     -    if (i == 0) {
>     -        ga_unset_frozen(ga_state);
>     -    }
>     -    return i;
>     -
>     -error:
>     -    free_fs_mount_list(&mounts);
>     -    qmp_guest_fsfreeze_thaw(NULL);
>     -    return 0;
>     -}
>     -
>     -/*
>     - * Walk list of frozen file systems in the guest, and thaw them.
>     - */
>     -int64_t qmp_guest_fsfreeze_thaw(Error **errp)
>     -{
>     -    int ret;
>     -    FsMountList mounts;
>     -    FsMount *mount;
>     -    int fd, i = 0, logged;
>     -    Error *local_err = NULL;
>     -
>     -    QTAILQ_INIT(&mounts);
>     -    if (!build_fs_mount_list(&mounts, &local_err)) {
>     -        error_propagate(errp, local_err);
>     -        return 0;
>     -    }
>     -
>     -    QTAILQ_FOREACH(mount, &mounts, next) {
>     -        logged = false;
>     -        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
>     -        if (fd == -1) {
>     -            continue;
>     -        }
>     -        /* we have no way of knowing whether a filesystem was
>     actually unfrozen
>     -         * as a result of a successful call to FITHAW, only that
>     if an error
>     -         * was returned the filesystem was *not* unfrozen by that
>     particular
>     -         * call.
>     -         *
>     -         * since multiple preceding FIFREEZEs require multiple
>     calls to FITHAW
>     -         * to unfreeze, continuing issuing FITHAW until an error
>     is returned,
>     -         * in which case either the filesystem is in an
>     unfreezable state, or,
>     -         * more likely, it was thawed previously (and remains so
>     afterward).
>     -         *
>     -         * also, since the most recent successful call is the one
>     that did
>     -         * the actual unfreeze, we can use this to provide an
>     accurate count
>     -         * of the number of filesystems unfrozen by
>     guest-fsfreeze-thaw, which
>     -         * may * be useful for determining whether a filesystem
>     was unfrozen
>     -         * during the freeze/thaw phase by a process other than
>     qemu-ga.
>     -         */
>     -        do {
>     -            ret = ioctl(fd, FITHAW);
>     -            if (ret == 0 && !logged) {
>     -                i++;
>     -                logged = true;
>     -            }
>     -        } while (ret == 0);
>     -        close(fd);
>     -    }
>     -
>     -    ga_unset_frozen(ga_state);
>     -    free_fs_mount_list(&mounts);
>     -
>     -    execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
>     -
>     -    return i;
>     -}
>     -
>     -static void guest_fsfreeze_cleanup(void)
>     -{
>     -    Error *err = NULL;
>     -
>     -    if (ga_is_frozen(ga_state) == GUEST_FSFREEZE_STATUS_FROZEN) {
>     -        qmp_guest_fsfreeze_thaw(&err);
>     -        if (err) {
>     -            slog("failed to clean up frozen filesystems: %s",
>     -                 error_get_pretty(err));
>     -            error_free(err);
>     -        }
>     -    }
>     -}
>     -#endif /* CONFIG_FSFREEZE */
>     -
>     -#if defined(CONFIG_FSTRIM)
>     -/*
>     - * Walk list of mounted file systems in the guest, and trim them.
>     - */
>     -GuestFilesystemTrimResponse *
>     -qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
>     -{
>     -    GuestFilesystemTrimResponse *response;
>     -    GuestFilesystemTrimResult *result;
>     -    int ret = 0;
>     -    FsMountList mounts;
>     -    struct FsMount *mount;
>     -    int fd;
>     -    struct fstrim_range r;
>     -
>     -    slog("guest-fstrim called");
>     -
>     -    QTAILQ_INIT(&mounts);
>     -    if (!build_fs_mount_list(&mounts, errp)) {
>     -        return NULL;
>     -    }
>     -
>     -    response = g_malloc0(sizeof(*response));
>     -
>     -    QTAILQ_FOREACH(mount, &mounts, next) {
>     -        result = g_malloc0(sizeof(*result));
>     -        result->path = g_strdup(mount->dirname);
>     -
>     -        QAPI_LIST_PREPEND(response->paths, result);
>     -
>     -        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
>     -        if (fd == -1) {
>     -            result->error = g_strdup_printf("failed to open: %s",
>     - strerror(errno));
>     -            result->has_error = true;
>     -            continue;
>     -        }
>     -
>     -        /* We try to cull filesystems we know won't work in
>     advance, but other
>     -         * filesystems may not implement fstrim for less obvious
>     reasons.
>     -         * These will report EOPNOTSUPP; while in some other
>     cases ENOTTY
>     -         * will be reported (e.g. CD-ROMs).
>     -         * Any other error means an unexpected error.
>     -         */
>     -        r.start = 0;
>     -        r.len = -1;
>     -        r.minlen = has_minimum ? minimum : 0;
>     -        ret = ioctl(fd, FITRIM, &r);
>     -        if (ret == -1) {
>     -            result->has_error = true;
>     -            if (errno == ENOTTY || errno == EOPNOTSUPP) {
>     -                result->error = g_strdup("trim not supported");
>     -            } else {
>     -                result->error = g_strdup_printf("failed to trim: %s",
>     - strerror(errno));
>     -            }
>     -            close(fd);
>     -            continue;
>     -        }
>     -
>     -        result->has_minimum = true;
>     -        result->minimum = r.minlen;
>     -        result->has_trimmed = true;
>     -        result->trimmed = r.len;
>     -        close(fd);
>     -    }
>     -
>     -    free_fs_mount_list(&mounts);
>     -    return response;
>     -}
>     -#endif /* CONFIG_FSTRIM */
>     -
>     -
>     -#define LINUX_SYS_STATE_FILE "/sys/power/state"
>     -#define SUSPEND_SUPPORTED 0
>     -#define SUSPEND_NOT_SUPPORTED 1
>     -
>     -typedef enum {
>     -    SUSPEND_MODE_DISK = 0,
>     -    SUSPEND_MODE_RAM = 1,
>     -    SUSPEND_MODE_HYBRID = 2,
>     -} SuspendMode;
>     -
>     -/*
>     - * Executes a command in a child process using g_spawn_sync,
>     - * returning an int >= 0 representing the exit status of the
>     - * process.
>     - *
>     - * If the program wasn't found in path, returns -1.
>     - *
>     - * If a problem happened when creating the child process,
>     - * returns -1 and errp is set.
>     - */
>     -static int run_process_child(const char *command[], Error **errp)
>     -{
>     -    int exit_status, spawn_flag;
>     -    GError *g_err = NULL;
>     -    bool success;
>     -
>     -    spawn_flag = G_SPAWN_SEARCH_PATH | G_SPAWN_STDOUT_TO_DEV_NULL |
>     -                 G_SPAWN_STDERR_TO_DEV_NULL;
>     -
>     -    success =  g_spawn_sync(NULL, (char **)command, NULL, spawn_flag,
>     -                            NULL, NULL, NULL, NULL,
>     -                            &exit_status, &g_err);
>     -
>     -    if (success) {
>     -        return WEXITSTATUS(exit_status);
>     -    }
>     -
>     -    if (g_err && (g_err->code != G_SPAWN_ERROR_NOENT)) {
>     -        error_setg(errp, "failed to create child process, error
>     '%s'",
>     -                   g_err->message);
>     -    }
>     -
>     -    g_error_free(g_err);
>     -    return -1;
>     -}
>     -
>     -static bool systemd_supports_mode(SuspendMode mode, Error **errp)
>     -{
>     -    const char *systemctl_args[3] = {"systemd-hibernate",
>     "systemd-suspend",
>     -  "systemd-hybrid-sleep"};
>     -    const char *cmd[4] = {"systemctl", "status",
>     systemctl_args[mode], NULL};
>     -    int status;
>     -
>     -    status = run_process_child(cmd, errp);
>     -
>     -    /*
>     -     * systemctl status uses LSB return codes so we can expect
>     -     * status > 0 and be ok. To assert if the guest has support
>     -     * for the selected suspend mode, status should be < 4. 4 is
>     -     * the code for unknown service status, the return value when
>     -     * the service does not exist. A common value is status = 3
>     -     * (program is not running).
>     -     */
>     -    if (status > 0 && status < 4) {
>     -        return true;
>     -    }
>     -
>     -    return false;
>     -}
>     -
>     -static void systemd_suspend(SuspendMode mode, Error **errp)
>     -{
>     -    Error *local_err = NULL;
>     -    const char *systemctl_args[3] = {"hibernate", "suspend",
>     "hybrid-sleep"};
>     -    const char *cmd[3] = {"systemctl", systemctl_args[mode], NULL};
>     -    int status;
>     -
>     -    status = run_process_child(cmd, &local_err);
>     -
>     -    if (status == 0) {
>     -        return;
>     -    }
>     -
>     -    if ((status == -1) && !local_err) {
>     -        error_setg(errp, "the helper program 'systemctl %s' was
>     not found",
>     -                   systemctl_args[mode]);
>     -        return;
>     -    }
>     -
>     -    if (local_err) {
>     -        error_propagate(errp, local_err);
>     -    } else {
>     -        error_setg(errp, "the helper program 'systemctl %s'
>     returned an "
>     -                   "unexpected exit status code (%d)",
>     -                   systemctl_args[mode], status);
>     -    }
>     -}
>     -
>     -static bool pmutils_supports_mode(SuspendMode mode, Error **errp)
>     -{
>     -    Error *local_err = NULL;
>     -    const char *pmutils_args[3] = {"--hibernate", "--suspend",
>     -                                   "--suspend-hybrid"};
>     -    const char *cmd[3] = {"pm-is-supported", pmutils_args[mode],
>     NULL};
>     -    int status;
>     -
>     -    status = run_process_child(cmd, &local_err);
>     -
>     -    if (status == SUSPEND_SUPPORTED) {
>     -        return true;
>     -    }
>     -
>     -    if ((status == -1) && !local_err) {
>     -        return false;
>     -    }
>     -
>     -    if (local_err) {
>     -        error_propagate(errp, local_err);
>     -    } else {
>     -        error_setg(errp,
>     -                   "the helper program '%s' returned an
>     unexpected exit"
>     -                   " status code (%d)", "pm-is-supported", status);
>     -    }
>     -
>     -    return false;
>     -}
>     -
>     -static void pmutils_suspend(SuspendMode mode, Error **errp)
>     -{
>     -    Error *local_err = NULL;
>     -    const char *pmutils_binaries[3] = {"pm-hibernate", "pm-suspend",
>     -  "pm-suspend-hybrid"};
>     -    const char *cmd[2] = {pmutils_binaries[mode], NULL};
>     -    int status;
>     -
>     -    status = run_process_child(cmd, &local_err);
>     -
>     -    if (status == 0) {
>     -        return;
>     -    }
>     -
>     -    if ((status == -1) && !local_err) {
>     -        error_setg(errp, "the helper program '%s' was not found",
>     -                   pmutils_binaries[mode]);
>     -        return;
>     -    }
>     -
>     -    if (local_err) {
>     -        error_propagate(errp, local_err);
>     -    } else {
>     -        error_setg(errp,
>     -                   "the helper program '%s' returned an
>     unexpected exit"
>     -                   " status code (%d)", pmutils_binaries[mode],
>     status);
>     -    }
>     -}
>     -
>     -static bool linux_sys_state_supports_mode(SuspendMode mode, Error
>     **errp)
>     -{
>     -    const char *sysfile_strs[3] = {"disk", "mem", NULL};
>     -    const char *sysfile_str = sysfile_strs[mode];
>     -    char buf[32]; /* hopefully big enough */
>     -    int fd;
>     -    ssize_t ret;
>     -
>     -    if (!sysfile_str) {
>     -        error_setg(errp, "unknown guest suspend mode");
>     -        return false;
>     -    }
>     -
>     -    fd = open(LINUX_SYS_STATE_FILE, O_RDONLY);
>     -    if (fd < 0) {
>     -        return false;
>     -    }
>     -
>     -    ret = read(fd, buf, sizeof(buf) - 1);
>     -    close(fd);
>     -    if (ret <= 0) {
>     -        return false;
>     -    }
>     -    buf[ret] = '\0';
>     -
>     -    if (strstr(buf, sysfile_str)) {
>     -        return true;
>     -    }
>     -    return false;
>     -}
>     -
>     -static void linux_sys_state_suspend(SuspendMode mode, Error **errp)
>     -{
>     -    Error *local_err = NULL;
>     -    const char *sysfile_strs[3] = {"disk", "mem", NULL};
>     -    const char *sysfile_str = sysfile_strs[mode];
>     -    pid_t pid;
>     -    int status;
>     -
>     -    if (!sysfile_str) {
>     -        error_setg(errp, "unknown guest suspend mode");
>     -        return;
>     -    }
>     -
>     -    pid = fork();
>     -    if (!pid) {
>     -        /* child */
>     -        int fd;
>     -
>     -        setsid();
>     -        reopen_fd_to_null(0);
>     -        reopen_fd_to_null(1);
>     -        reopen_fd_to_null(2);
>     -
>     -        fd = open(LINUX_SYS_STATE_FILE, O_WRONLY);
>     -        if (fd < 0) {
>     -            _exit(EXIT_FAILURE);
>     -        }
>     -
>     -        if (write(fd, sysfile_str, strlen(sysfile_str)) < 0) {
>     -            _exit(EXIT_FAILURE);
>     -        }
>     -
>     -        _exit(EXIT_SUCCESS);
>     -    } else if (pid < 0) {
>     -        error_setg_errno(errp, errno, "failed to create child
>     process");
>     -        return;
>     -    }
>     -
>     -    ga_wait_child(pid, &status, &local_err);
>     -    if (local_err) {
>     -        error_propagate(errp, local_err);
>     -        return;
>     -    }
>     -
>     -    if (WEXITSTATUS(status)) {
>     -        error_setg(errp, "child process has failed to suspend");
>     -    }
>     -
>     -}
>     -
>     -static void guest_suspend(SuspendMode mode, Error **errp)
>     -{
>     -    Error *local_err = NULL;
>     -    bool mode_supported = false;
>     -
>     -    if (systemd_supports_mode(mode, &local_err)) {
>     -        mode_supported = true;
>     -        systemd_suspend(mode, &local_err);
>     -    }
>     -
>     -    if (!local_err) {
>     -        return;
>     -    }
>     -
>     -    error_free(local_err);
>     -    local_err = NULL;
>     -
>     -    if (pmutils_supports_mode(mode, &local_err)) {
>     -        mode_supported = true;
>     -        pmutils_suspend(mode, &local_err);
>     -    }
>     -
>     -    if (!local_err) {
>     -        return;
>     -    }
>     -
>     -    error_free(local_err);
>     -    local_err = NULL;
>     -
>     -    if (linux_sys_state_supports_mode(mode, &local_err)) {
>     -        mode_supported = true;
>     -        linux_sys_state_suspend(mode, &local_err);
>     -    }
>     -
>     -    if (!mode_supported) {
>     -        error_free(local_err);
>     -        error_setg(errp,
>     -                   "the requested suspend mode is not supported
>     by the guest");
>     -    } else {
>     -        error_propagate(errp, local_err);
>     -    }
>     -}
>     -
>     -void qmp_guest_suspend_disk(Error **errp)
>     -{
>     -    guest_suspend(SUSPEND_MODE_DISK, errp);
>     -}
>     -
>     -void qmp_guest_suspend_ram(Error **errp)
>     -{
>     -    guest_suspend(SUSPEND_MODE_RAM, errp);
>     -}
>     -
>     -void qmp_guest_suspend_hybrid(Error **errp)
>     -{
>     -    guest_suspend(SUSPEND_MODE_HYBRID, errp);
>     -}
>     -
>     -/* Transfer online/offline status between @vcpu and the guest system.
>     - *
>     - * On input either @errp or *@errp must be NULL.
>     - *
>     - * In system-to-@vcpu direction, the following @vcpu fields are
>     accessed:
>     - * - R: vcpu->logical_id
>     - * - W: vcpu->online
>     - * - W: vcpu->can_offline
>     - *
>     - * In @vcpu-to-system direction, the following @vcpu fields are
>     accessed:
>     - * - R: vcpu->logical_id
>     - * - R: vcpu->online
>     - *
>     - * Written members remain unmodified on error.
>     - */
>     -static void transfer_vcpu(GuestLogicalProcessor *vcpu, bool sys2vcpu,
>     -                          char *dirpath, Error **errp)
>     -{
>     -    int fd;
>     -    int res;
>     -    int dirfd;
>     -    static const char fn[] = "online";
>     -
>     -    dirfd = open(dirpath, O_RDONLY | O_DIRECTORY);
>     -    if (dirfd == -1) {
>     -        error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
>     -        return;
>     -    }
>     -
>     -    fd = openat(dirfd, fn, sys2vcpu ? O_RDONLY : O_RDWR);
>     -    if (fd == -1) {
>     -        if (errno != ENOENT) {
>     -            error_setg_errno(errp, errno, "open(\"%s/%s\")",
>     dirpath, fn);
>     -        } else if (sys2vcpu) {
>     -            vcpu->online = true;
>     -            vcpu->can_offline = false;
>     -        } else if (!vcpu->online) {
>     -            error_setg(errp, "logical processor #%" PRId64 "
>     can't be "
>     -                       "offlined", vcpu->logical_id);
>     -        } /* otherwise pretend successful re-onlining */
>     -    } else {
>     -        unsigned char status;
>     -
>     -        res = pread(fd, &status, 1, 0);
>     -        if (res == -1) {
>     -            error_setg_errno(errp, errno, "pread(\"%s/%s\")",
>     dirpath, fn);
>     -        } else if (res == 0) {
>     -            error_setg(errp, "pread(\"%s/%s\"): unexpected EOF",
>     dirpath,
>     -                       fn);
>     -        } else if (sys2vcpu) {
>     -            vcpu->online = (status != '0');
>     -            vcpu->can_offline = true;
>     -        } else if (vcpu->online != (status != '0')) {
>     -            status = '0' + vcpu->online;
>     -            if (pwrite(fd, &status, 1, 0) == -1) {
>     -                error_setg_errno(errp, errno,
>     "pwrite(\"%s/%s\")", dirpath,
>     -                                 fn);
>     -            }
>     -        } /* otherwise pretend successful re-(on|off)-lining */
>     -
>     -        res = close(fd);
>     -        g_assert(res == 0);
>     -    }
>     -
>     -    res = close(dirfd);
>     -    g_assert(res == 0);
>     -}
>     -
>     -GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
>     -{
>     -    GuestLogicalProcessorList *head, **tail;
>     -    const char *cpu_dir = "/sys/devices/system/cpu";
>     -    const gchar *line;
>     -    g_autoptr(GDir) cpu_gdir = NULL;
>     -    Error *local_err = NULL;
>     -
>     -    head = NULL;
>     -    tail = &head;
>     -    cpu_gdir = g_dir_open(cpu_dir, 0, NULL);
>     -
>     -    if (cpu_gdir == NULL) {
>     -        error_setg_errno(errp, errno, "failed to list entries:
>     %s", cpu_dir);
>     -        return NULL;
>     -    }
>     -
>     -    while (local_err == NULL && (line =
>     g_dir_read_name(cpu_gdir)) != NULL) {
>     -        GuestLogicalProcessor *vcpu;
>     -        int64_t id;
>     -        if (sscanf(line, "cpu%" PRId64, &id)) {
>     -            g_autofree char *path =
>     g_strdup_printf("/sys/devices/system/cpu/"
>     -                                                    "cpu%" PRId64
>     "/", id);
>     -            vcpu = g_malloc0(sizeof *vcpu);
>     -            vcpu->logical_id = id;
>     -            vcpu->has_can_offline = true; /* lolspeak ftw */
>     -            transfer_vcpu(vcpu, true, path, &local_err);
>     -            QAPI_LIST_APPEND(tail, vcpu);
>     -        }
>     -    }
>     -
>     -    if (local_err == NULL) {
>     -        /* there's no guest with zero VCPUs */
>     -        g_assert(head != NULL);
>     -        return head;
>     -    }
>     -
>     -    qapi_free_GuestLogicalProcessorList(head);
>     -    error_propagate(errp, local_err);
>     -    return NULL;
>     -}
>     -
>     -int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus,
>     Error **errp)
>     -{
>     -    int64_t processed;
>     -    Error *local_err = NULL;
>     -
>     -    processed = 0;
>     -    while (vcpus != NULL) {
>     -        char *path =
>     g_strdup_printf("/sys/devices/system/cpu/cpu%" PRId64 "/",
>     -  vcpus->value->logical_id);
>     -
>     -        transfer_vcpu(vcpus->value, false, path, &local_err);
>     -        g_free(path);
>     -        if (local_err != NULL) {
>     -            break;
>     -        }
>     -        ++processed;
>     -        vcpus = vcpus->next;
>     -    }
>     -
>     -    if (local_err != NULL) {
>     -        if (processed == 0) {
>     -            error_propagate(errp, local_err);
>     -        } else {
>     -            error_free(local_err);
>     -        }
>     -    }
>     -
>     -    return processed;
>     -}
>     -
>     -void qmp_guest_set_user_password(const char *username,
>     -                                 const char *password,
>     -                                 bool crypted,
>     -                                 Error **errp)
>     -{
>     -    Error *local_err = NULL;
>     -    char *passwd_path = NULL;
>     -    pid_t pid;
>     -    int status;
>     -    int datafd[2] = { -1, -1 };
>     -    char *rawpasswddata = NULL;
>     -    size_t rawpasswdlen;
>     -    char *chpasswddata = NULL;
>     -    size_t chpasswdlen;
>     -
>     -    rawpasswddata = (char *)qbase64_decode(password, -1,
>     &rawpasswdlen, errp);
>     -    if (!rawpasswddata) {
>     -        return;
>     -    }
>     -    rawpasswddata = g_renew(char, rawpasswddata, rawpasswdlen + 1);
>     -    rawpasswddata[rawpasswdlen] = '\0';
>     -
>     -    if (strchr(rawpasswddata, '\n')) {
>     -        error_setg(errp, "forbidden characters in raw password");
>     -        goto out;
>     -    }
>     -
>     -    if (strchr(username, '\n') ||
>     -        strchr(username, ':')) {
>     -        error_setg(errp, "forbidden characters in username");
>     -        goto out;
>     -    }
>     -
>     -    chpasswddata = g_strdup_printf("%s:%s\n", username,
>     rawpasswddata);
>     -    chpasswdlen = strlen(chpasswddata);
>     -
>     -    passwd_path = g_find_program_in_path("chpasswd");
>     -
>     -    if (!passwd_path) {
>     -        error_setg(errp, "cannot find 'passwd' program in PATH");
>     -        goto out;
>     -    }
>     -
>     -    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
>     -        error_setg(errp, "cannot create pipe FDs");
>     -        goto out;
>     -    }
>     -
>     -    pid = fork();
>     -    if (pid == 0) {
>     -        close(datafd[1]);
>     -        /* child */
>     -        setsid();
>     -        dup2(datafd[0], 0);
>     -        reopen_fd_to_null(1);
>     -        reopen_fd_to_null(2);
>     -
>     -        if (crypted) {
>     -            execl(passwd_path, "chpasswd", "-e", NULL);
>     -        } else {
>     -            execl(passwd_path, "chpasswd", NULL);
>     -        }
>     -        _exit(EXIT_FAILURE);
>     -    } else if (pid < 0) {
>     -        error_setg_errno(errp, errno, "failed to create child
>     process");
>     -        goto out;
>     -    }
>     -    close(datafd[0]);
>     -    datafd[0] = -1;
>     -
>     -    if (qemu_write_full(datafd[1], chpasswddata, chpasswdlen) !=
>     chpasswdlen) {
>     -        error_setg_errno(errp, errno, "cannot write new account
>     password");
>     -        goto out;
>     -    }
>     -    close(datafd[1]);
>     -    datafd[1] = -1;
>     -
>     -    ga_wait_child(pid, &status, &local_err);
>     -    if (local_err) {
>     -        error_propagate(errp, local_err);
>     -        goto out;
>     -    }
>     -
>     -    if (!WIFEXITED(status)) {
>     -        error_setg(errp, "child process has terminated abnormally");
>     -        goto out;
>     -    }
>     -
>     -    if (WEXITSTATUS(status)) {
>     -        error_setg(errp, "child process has failed to set user
>     password");
>     -        goto out;
>     -    }
>     -
>     -out:
>     -    g_free(chpasswddata);
>     -    g_free(rawpasswddata);
>     -    g_free(passwd_path);
>     -    if (datafd[0] != -1) {
>     -        close(datafd[0]);
>     -    }
>     -    if (datafd[1] != -1) {
>     -        close(datafd[1]);
>     -    }
>     -}
>     -
>     -static void ga_read_sysfs_file(int dirfd, const char *pathname,
>     char *buf,
>     -                               int size, Error **errp)
>     -{
>     -    int fd;
>     -    int res;
>     -
>     -    errno = 0;
>     -    fd = openat(dirfd, pathname, O_RDONLY);
>     -    if (fd == -1) {
>     -        error_setg_errno(errp, errno, "open sysfs file \"%s\"",
>     pathname);
>     -        return;
>     -    }
>     -
>     -    res = pread(fd, buf, size, 0);
>     -    if (res == -1) {
>     -        error_setg_errno(errp, errno, "pread sysfs file \"%s\"",
>     pathname);
>     -    } else if (res == 0) {
>     -        error_setg(errp, "pread sysfs file \"%s\": unexpected
>     EOF", pathname);
>     -    }
>     -    close(fd);
>     -}
>     -
>     -static void ga_write_sysfs_file(int dirfd, const char *pathname,
>     -                                const char *buf, int size, Error
>     **errp)
>     -{
>     -    int fd;
>     -
>     -    errno = 0;
>     -    fd = openat(dirfd, pathname, O_WRONLY);
>     -    if (fd == -1) {
>     -        error_setg_errno(errp, errno, "open sysfs file \"%s\"",
>     pathname);
>     -        return;
>     -    }
>     -
>     -    if (pwrite(fd, buf, size, 0) == -1) {
>     -        error_setg_errno(errp, errno, "pwrite sysfs file \"%s\"",
>     pathname);
>     -    }
>     -
>     -    close(fd);
>     -}
>     -
>     -/* Transfer online/offline status between @mem_blk and the guest
>     system.
>     - *
>     - * On input either @errp or *@errp must be NULL.
>     - *
>     - * In system-to-@mem_blk direction, the following @mem_blk fields
>     are accessed:
>     - * - R: mem_blk->phys_index
>     - * - W: mem_blk->online
>     - * - W: mem_blk->can_offline
>     - *
>     - * In @mem_blk-to-system direction, the following @mem_blk fields
>     are accessed:
>     - * - R: mem_blk->phys_index
>     - * - R: mem_blk->online
>     - *-  R: mem_blk->can_offline
>     - * Written members remain unmodified on error.
>     - */
>     -static void transfer_memory_block(GuestMemoryBlock *mem_blk, bool
>     sys2memblk,
>     -                                  GuestMemoryBlockResponse *result,
>     -                                  Error **errp)
>     -{
>     -    char *dirpath;
>     -    int dirfd;
>     -    char *status;
>     -    Error *local_err = NULL;
>     -
>     -    if (!sys2memblk) {
>     -        DIR *dp;
>     -
>     -        if (!result) {
>     -            error_setg(errp, "Internal error, 'result' should not
>     be NULL");
>     -            return;
>     -        }
>     -        errno = 0;
>     -        dp = opendir("/sys/devices/system/memory/");
>     -         /* if there is no 'memory' directory in sysfs,
>     -         * we think this VM does not support online/offline
>     memory block,
>     -         * any other solution?
>     -         */
>     -        if (!dp) {
>     -            if (errno == ENOENT) {
>     -                result->response =
>     - GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;
>     -            }
>     -            goto out1;
>     -        }
>     -        closedir(dp);
>     -    }
>     -
>     -    dirpath =
>     g_strdup_printf("/sys/devices/system/memory/memory%" PRId64 "/",
>     -                              mem_blk->phys_index);
>     -    dirfd = open(dirpath, O_RDONLY | O_DIRECTORY);
>     -    if (dirfd == -1) {
>     -        if (sys2memblk) {
>     -            error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
>     -        } else {
>     -            if (errno == ENOENT) {
>     -                result->response =
>     GUEST_MEMORY_BLOCK_RESPONSE_TYPE_NOT_FOUND;
>     -            } else {
>     -                result->response =
>     - GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;
>     -            }
>     -        }
>     -        g_free(dirpath);
>     -        goto out1;
>     -    }
>     -    g_free(dirpath);
>     -
>     -    status = g_malloc0(10);
>     -    ga_read_sysfs_file(dirfd, "state", status, 10, &local_err);
>     -    if (local_err) {
>     -        /* treat with sysfs file that not exist in old kernel */
>     -        if (errno == ENOENT) {
>     -            error_free(local_err);
>     -            if (sys2memblk) {
>     -                mem_blk->online = true;
>     -                mem_blk->can_offline = false;
>     -            } else if (!mem_blk->online) {
>     -                result->response =
>     - GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;
>     -            }
>     -        } else {
>     -            if (sys2memblk) {
>     -                error_propagate(errp, local_err);
>     -            } else {
>     -                error_free(local_err);
>     -                result->response =
>     - GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;
>     -            }
>     -        }
>     -        goto out2;
>     -    }
>     -
>     -    if (sys2memblk) {
>     -        char removable = '0';
>     -
>     -        mem_blk->online = (strncmp(status, "online", 6) == 0);
>     -
>     -        ga_read_sysfs_file(dirfd, "removable", &removable, 1,
>     &local_err);
>     -        if (local_err) {
>     -            /* if no 'removable' file, it doesn't support offline
>     mem blk */
>     -            if (errno == ENOENT) {
>     -                error_free(local_err);
>     -                mem_blk->can_offline = false;
>     -            } else {
>     -                error_propagate(errp, local_err);
>     -            }
>     -        } else {
>     -            mem_blk->can_offline = (removable != '0');
>     -        }
>     -    } else {
>     -        if (mem_blk->online != (strncmp(status, "online", 6) == 0)) {
>     -            const char *new_state = mem_blk->online ? "online" :
>     "offline";
>     -
>     -            ga_write_sysfs_file(dirfd, "state", new_state,
>     strlen(new_state),
>     -                                &local_err);
>     -            if (local_err) {
>     -                error_free(local_err);
>     -                result->response =
>     - GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;
>     -                goto out2;
>     -            }
>     -
>     -            result->response =
>     GUEST_MEMORY_BLOCK_RESPONSE_TYPE_SUCCESS;
>     -            result->has_error_code = false;
>     -        } /* otherwise pretend successful re-(on|off)-lining */
>     -    }
>     -    g_free(status);
>     -    close(dirfd);
>     -    return;
>     -
>     -out2:
>     -    g_free(status);
>     -    close(dirfd);
>     -out1:
>     -    if (!sys2memblk) {
>     -        result->has_error_code = true;
>     -        result->error_code = errno;
>     -    }
>     -}
>     -
>     -GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
>     -{
>     -    GuestMemoryBlockList *head, **tail;
>     -    Error *local_err = NULL;
>     -    struct dirent *de;
>     -    DIR *dp;
>     -
>     -    head = NULL;
>     -    tail = &head;
>     -
>     -    dp = opendir("/sys/devices/system/memory/");
>     -    if (!dp) {
>     -        /* it's ok if this happens to be a system that doesn't expose
>     -         * memory blocks via sysfs, but otherwise we should report
>     -         * an error
>     -         */
>     -        if (errno != ENOENT) {
>     -            error_setg_errno(errp, errno, "Can't open directory"
>     -  "\"/sys/devices/system/memory/\"");
>     -        }
>     -        return NULL;
>     -    }
>     -
>     -    /* Note: the phys_index of memory block may be discontinuous,
>     -     * this is because a memblk is the unit of the Sparse Memory
>     design, which
>     -     * allows discontinuous memory ranges (ex. NUMA), so here we
>     should
>     -     * traverse the memory block directory.
>     -     */
>     -    while ((de = readdir(dp)) != NULL) {
>     -        GuestMemoryBlock *mem_blk;
>     -
>     -        if ((strncmp(de->d_name, "memory", 6) != 0) ||
>     -            !(de->d_type & DT_DIR)) {
>     -            continue;
>     -        }
>     -
>     -        mem_blk = g_malloc0(sizeof *mem_blk);
>     -        /* The d_name is "memoryXXX",  phys_index is block id,
>     same as XXX */
>     -        mem_blk->phys_index = strtoul(&de->d_name[6], NULL, 10);
>     -        mem_blk->has_can_offline = true; /* lolspeak ftw */
>     -        transfer_memory_block(mem_blk, true, NULL, &local_err);
>     -        if (local_err) {
>     -            break;
>     -        }
>     -
>     -        QAPI_LIST_APPEND(tail, mem_blk);
>     -    }
>     -
>     -    closedir(dp);
>     -    if (local_err == NULL) {
>     -        /* there's no guest with zero memory blocks */
>     -        if (head == NULL) {
>     -            error_setg(errp, "guest reported zero memory blocks!");
>     -        }
>     -        return head;
>     -    }
>     -
>     -    qapi_free_GuestMemoryBlockList(head);
>     -    error_propagate(errp, local_err);
>     -    return NULL;
>     -}
>     -
>     -GuestMemoryBlockResponseList *
>     -qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error
>     **errp)
>     -{
>     -    GuestMemoryBlockResponseList *head, **tail;
>     -    Error *local_err = NULL;
>     -
>     -    head = NULL;
>     -    tail = &head;
>     -
>     -    while (mem_blks != NULL) {
>     -        GuestMemoryBlockResponse *result;
>     -        GuestMemoryBlock *current_mem_blk = mem_blks->value;
>     -
>     -        result = g_malloc0(sizeof(*result));
>     -        result->phys_index = current_mem_blk->phys_index;
>     -        transfer_memory_block(current_mem_blk, false, result,
>     &local_err);
>     -        if (local_err) { /* should never happen */
>     -            goto err;
>     -        }
>     -
>     -        QAPI_LIST_APPEND(tail, result);
>     -        mem_blks = mem_blks->next;
>     -    }
>     -
>     -    return head;
>     -err:
>     -    qapi_free_GuestMemoryBlockResponseList(head);
>     -    error_propagate(errp, local_err);
>     -    return NULL;
>     -}
>     -
>     -GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
>     -{
>     -    Error *local_err = NULL;
>     -    char *dirpath;
>     -    int dirfd;
>     -    char *buf;
>     -    GuestMemoryBlockInfo *info;
>     -
>     -    dirpath = g_strdup_printf("/sys/devices/system/memory/");
>     -    dirfd = open(dirpath, O_RDONLY | O_DIRECTORY);
>     -    if (dirfd == -1) {
>     -        error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
>     -        g_free(dirpath);
>     -        return NULL;
>     -    }
>     -    g_free(dirpath);
>     -
>     -    buf = g_malloc0(20);
>     -    ga_read_sysfs_file(dirfd, "block_size_bytes", buf, 20,
>     &local_err);
>     -    close(dirfd);
>     -    if (local_err) {
>     -        g_free(buf);
>     -        error_propagate(errp, local_err);
>     -        return NULL;
>     -    }
>     -
>     -    info = g_new0(GuestMemoryBlockInfo, 1);
>     -    info->size = strtol(buf, NULL, 16); /* the unit is bytes */
>     -
>     -    g_free(buf);
>     -
>     -    return info;
>     -}
>     -
>     -#define MAX_NAME_LEN 128
>     -static GuestDiskStatsInfoList *guest_get_diskstats(Error **errp)
>     -{
>     -#ifdef CONFIG_LINUX
>     -    GuestDiskStatsInfoList *head = NULL, **tail = &head;
>     -    const char *diskstats = "/proc/diskstats";
>     -    FILE *fp;
>     -    size_t n;
>     -    char *line = NULL;
>     -
>     -    fp = fopen(diskstats, "r");
>     -    if (fp  == NULL) {
>     -        error_setg_errno(errp, errno, "open(\"%s\")", diskstats);
>     -        return NULL;
>     -    }
>     -
>     -    while (getline(&line, &n, fp) != -1) {
>     -        g_autofree GuestDiskStatsInfo *diskstatinfo = NULL;
>     -        g_autofree GuestDiskStats *diskstat = NULL;
>     -        char dev_name[MAX_NAME_LEN];
>     -        unsigned int ios_pgr, tot_ticks, rq_ticks, wr_ticks,
>     dc_ticks, fl_ticks;
>     -        unsigned long rd_ios, rd_merges_or_rd_sec,
>     rd_ticks_or_wr_sec, wr_ios;
>     -        unsigned long wr_merges, rd_sec_or_wr_ios, wr_sec;
>     -        unsigned long dc_ios, dc_merges, dc_sec, fl_ios;
>     -        unsigned int major, minor;
>     -        int i;
>     -
>     -        i = sscanf(line, "%u %u %s %lu %lu %lu"
>     -                   "%lu %lu %lu %lu %u %u %u %u"
>     -                   "%lu %lu %lu %u %lu %u",
>     -                   &major, &minor, dev_name,
>     -                   &rd_ios, &rd_merges_or_rd_sec, &rd_sec_or_wr_ios,
>     -                   &rd_ticks_or_wr_sec, &wr_ios, &wr_merges, &wr_sec,
>     -                   &wr_ticks, &ios_pgr, &tot_ticks, &rq_ticks,
>     -                   &dc_ios, &dc_merges, &dc_sec, &dc_ticks,
>     -                   &fl_ios, &fl_ticks);
>     -
>     -        if (i < 7) {
>     -            continue;
>     -        }
>     -
>     -        diskstatinfo = g_new0(GuestDiskStatsInfo, 1);
>     -        diskstatinfo->name = g_strdup(dev_name);
>     -        diskstatinfo->major = major;
>     -        diskstatinfo->minor = minor;
>     -
>     -        diskstat = g_new0(GuestDiskStats, 1);
>     -        if (i == 7) {
>     -            diskstat->has_read_ios = true;
>     -            diskstat->read_ios = rd_ios;
>     -            diskstat->has_read_sectors = true;
>     -            diskstat->read_sectors = rd_merges_or_rd_sec;
>     -            diskstat->has_write_ios = true;
>     -            diskstat->write_ios = rd_sec_or_wr_ios;
>     -            diskstat->has_write_sectors = true;
>     -            diskstat->write_sectors = rd_ticks_or_wr_sec;
>     -        }
>     -        if (i >= 14) {
>     -            diskstat->has_read_ios = true;
>     -            diskstat->read_ios = rd_ios;
>     -            diskstat->has_read_sectors = true;
>     -            diskstat->read_sectors = rd_sec_or_wr_ios;
>     -            diskstat->has_read_merges = true;
>     -            diskstat->read_merges = rd_merges_or_rd_sec;
>     -            diskstat->has_read_ticks = true;
>     -            diskstat->read_ticks = rd_ticks_or_wr_sec;
>     -            diskstat->has_write_ios = true;
>     -            diskstat->write_ios = wr_ios;
>     -            diskstat->has_write_sectors = true;
>     -            diskstat->write_sectors = wr_sec;
>     -            diskstat->has_write_merges = true;
>     -            diskstat->write_merges = wr_merges;
>     -            diskstat->has_write_ticks = true;
>     -            diskstat->write_ticks = wr_ticks;
>     -            diskstat->has_ios_pgr = true;
>     -            diskstat->ios_pgr = ios_pgr;
>     -            diskstat->has_total_ticks = true;
>     -            diskstat->total_ticks = tot_ticks;
>     -            diskstat->has_weight_ticks = true;
>     -            diskstat->weight_ticks = rq_ticks;
>     -        }
>     -        if (i >= 18) {
>     -            diskstat->has_discard_ios = true;
>     -            diskstat->discard_ios = dc_ios;
>     -            diskstat->has_discard_merges = true;
>     -            diskstat->discard_merges = dc_merges;
>     -            diskstat->has_discard_sectors = true;
>     -            diskstat->discard_sectors = dc_sec;
>     -            diskstat->has_discard_ticks = true;
>     -            diskstat->discard_ticks = dc_ticks;
>     -        }
>     -        if (i >= 20) {
>     -            diskstat->has_flush_ios = true;
>     -            diskstat->flush_ios = fl_ios;
>     -            diskstat->has_flush_ticks = true;
>     -            diskstat->flush_ticks = fl_ticks;
>     -        }
>     -
>     -        diskstatinfo->stats = g_steal_pointer(&diskstat);
>     -        QAPI_LIST_APPEND(tail, diskstatinfo);
>     -        diskstatinfo = NULL;
>     -    }
>     -    free(line);
>     -    fclose(fp);
>     -    return head;
>     -#else
>     -    g_debug("disk stats reporting available only for Linux");
>     -    return NULL;
>     -#endif
>     -}
>     -
>     -GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
>     -{
>     -    return guest_get_diskstats(errp);
>     -}
>     -
>     -GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
>     -{
>     -    GuestCpuStatsList *head = NULL, **tail = &head;
>     -    const char *cpustats = "/proc/stat";
>     -    int clk_tck = sysconf(_SC_CLK_TCK);
>     -    FILE *fp;
>     -    size_t n;
>     -    char *line = NULL;
>     -
>     -    fp = fopen(cpustats, "r");
>     -    if (fp  == NULL) {
>     -        error_setg_errno(errp, errno, "open(\"%s\")", cpustats);
>     -        return NULL;
>     -    }
>     -
>     -    while (getline(&line, &n, fp) != -1) {
>     -        GuestCpuStats *cpustat = NULL;
>     -        GuestLinuxCpuStats *linuxcpustat;
>     -        int i;
>     -        unsigned long user, system, idle, iowait, irq, softirq,
>     steal, guest;
>     -        unsigned long nice, guest_nice;
>     -        char name[64];
>     -
>     -        i = sscanf(line, "%s %lu %lu %lu %lu %lu %lu %lu %lu %lu
>     %lu",
>     -                   name, &user, &nice, &system, &idle, &iowait,
>     &irq, &softirq,
>     -                   &steal, &guest, &guest_nice);
>     -
>     -        /* drop "cpu 1 2 3 ...", get "cpuX 1 2 3 ..." only */
>     -        if ((i == EOF) || strncmp(name, "cpu", 3) || (name[3] ==
>     '\0')) {
>     -            continue;
>     -        }
>     -
>     -        if (i < 5) {
>     -            slog("Parsing cpu stat from %s failed, see \"man
>     proc\"", cpustats);
>     -            break;
>     -        }
>     -
>     -        cpustat = g_new0(GuestCpuStats, 1);
>     -        cpustat->type = GUEST_CPU_STATS_TYPE_LINUX;
>     -
>     -        linuxcpustat = &cpustat->u.q_linux;
>     -        linuxcpustat->cpu = atoi(&name[3]);
>     -        linuxcpustat->user = user * 1000 / clk_tck;
>     -        linuxcpustat->nice = nice * 1000 / clk_tck;
>     -        linuxcpustat->system = system * 1000 / clk_tck;
>     -        linuxcpustat->idle = idle * 1000 / clk_tck;
>     -
>     -        if (i > 5) {
>     -            linuxcpustat->has_iowait = true;
>     -            linuxcpustat->iowait = iowait * 1000 / clk_tck;
>     -        }
>     -
>     -        if (i > 6) {
>     -            linuxcpustat->has_irq = true;
>     -            linuxcpustat->irq = irq * 1000 / clk_tck;
>     -            linuxcpustat->has_softirq = true;
>     -            linuxcpustat->softirq = softirq * 1000 / clk_tck;
>     -        }
>     -
>     -        if (i > 8) {
>     -            linuxcpustat->has_steal = true;
>     -            linuxcpustat->steal = steal * 1000 / clk_tck;
>     -        }
>     -
>     -        if (i > 9) {
>     -            linuxcpustat->has_guest = true;
>     -            linuxcpustat->guest = guest * 1000 / clk_tck;
>     -        }
>     -
>     -        if (i > 10) {
>     -            linuxcpustat->has_guest = true;
>     -            linuxcpustat->guest = guest * 1000 / clk_tck;
>     -            linuxcpustat->has_guestnice = true;
>     -            linuxcpustat->guestnice = guest_nice * 1000 / clk_tck;
>     -        }
>     -
>     -        QAPI_LIST_APPEND(tail, cpustat);
>     -    }
>     -
>     -    free(line);
>     -    fclose(fp);
>     -    return head;
>     -}
>     -
>     -#else /* defined(__linux__) */
>     +#if !defined(__linux__)
>
>      void qmp_guest_suspend_disk(Error **errp)
>      {
>     diff --git a/qga/meson.build b/qga/meson.build
>     index 65c1e93846..409f49a000 100644
>     --- a/qga/meson.build
>     +++ b/qga/meson.build
>     @@ -72,6 +72,9 @@ qga_ss.add(when: 'CONFIG_POSIX', if_true: files(
>        'commands-posix.c',
>        'commands-posix-ssh.c',
>      ))
>     +qga_ss.add(when: 'CONFIG_LINUX', if_true: files(
>     +  'commands-linux.c',
>     +))
>      qga_ss.add(when: 'CONFIG_WIN32', if_true: files(
>        'channel-win32.c',
>        'commands-win32.c',
>     -- 
>     2.34.1
>
>
>
>
> -- 
> Marc-André Lureau

