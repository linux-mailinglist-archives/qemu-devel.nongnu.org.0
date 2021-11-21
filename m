Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20012458638
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 20:56:22 +0100 (CET)
Received: from localhost ([::1]:49672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moswm-0000U8-O5
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 14:56:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1mosss-0005Dv-Tw
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 14:52:19 -0500
Received: from mail-eopbgr140139.outbound.protection.outlook.com
 ([40.107.14.139]:36193 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1mossn-0000Tu-J6
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 14:52:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aILNYLWpOGuVbELcoeDXCDJicfTk4z1bOLuzsKKZOhN/wn8SX55QBNu7Yz+UBjPUi5wPm48Q7Sgni+LsqUpOdJtyyZqfafLXORoQpkPn+rbvXPpxAVSii6FsHynjzZa2afii+Co7EjPqEinslq8Lz11QLIRMbnZx0W7zIa3Vr9pd+C50IjToBLH99IoKqm0FjrWDM2Wk0R0jjX7PFo+NmX1sVdndbCZWs83KKHOi0grEzZSuMscnN+piXJW0swgXttHnMXE72DzS3Z0omxLjK+uv458N2bky0julU6UwKM57ArxehzvNYDwRpE2W/ImouNSAjnz9T8QPfpeaNRT08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jq8dSs71YqswB52U+RebNIMQIeAPqYRRD+6QpaBu3kw=;
 b=HRX12YAr9TwH04HmW+VBqm1sNr02CcBOaz/iXNWFUrTpqUyUPkTM6Q72ysGK+7C4FLa3jLQc4v9VYkcBMsGt371DH3+7dND3r+Rz6f7ZrWKnJmjDL8ILBZW+6zOxXPtWdOos2qlM/X3iZiS2RccsFJMKyEnS5/qSQcDpIO1RKVjluKKEfZaT/dnAE8w19hhW1i3bTm7xg5QXfK6o+YexMftOK8ErMlBgOeQgYUi7S2GxDHUpzZJgGjDAEoJA0MPqjhDJp/L/re6XY6hTbjb+3CYckrfZ8wXMxfNbmBYOxw2meb3ITbh5TSigmNxeCTBCELa7p1EVmbHtbnL3ILfIyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jq8dSs71YqswB52U+RebNIMQIeAPqYRRD+6QpaBu3kw=;
 b=qXIjyH/jEp3SpkjM875CqWi4PqNFNr7gXm1R+ARuJU+brkgqfGMoM1Rkt0YwPfXRseZCqWkI6f9ay2MfA2GrFXapta7F5mVW2eaWaTtUvdS0dkWCQb5ruX4dqXJiZaawo7wc9hVtRAMqzv1rsuylu1T4quyk3O2iM+0g5U5yonQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25)
 by DB6PR08MB2933.eurprd08.prod.outlook.com (2603:10a6:6:1c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Sun, 21 Nov
 2021 19:13:48 +0000
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::c474:7da3:8492:936e]) by DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::c474:7da3:8492:936e%3]) with mapi id 15.20.4690.027; Sun, 21 Nov 2021
 19:13:48 +0000
Message-ID: <5de2287b-5c1d-7350-b4f6-eaef67095315@virtuozzo.com>
Date: Sun, 21 Nov 2021 22:12:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] ui/vnc-clipboard: fix adding notifier twice
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
Cc: kraxel@redhat.com, den@openvz.org
References: <20211110103800.2266729-1-vsementsov@virtuozzo.com>
From: Nikta Lapshin <nikita.lapshin@virtuozzo.com>
In-Reply-To: <20211110103800.2266729-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0017.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::30) To DB7PR08MB3484.eurprd08.prod.outlook.com
 (2603:10a6:10:45::25)
MIME-Version: 1.0
Received: from [192.168.0.105] (93.175.28.8) by
 AM6PR10CA0017.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 19:13:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb8b9bf6-0896-4ada-19f2-08d9ad230ba8
X-MS-TrafficTypeDiagnostic: DB6PR08MB2933:
X-Microsoft-Antispam-PRVS: <DB6PR08MB293340ACC7C33D7198CAFF4D869E9@DB6PR08MB2933.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6gUDMXUhAU3cIe0xC8IthUycUtBpeZMiYcH4h2KslPJTWJs5YFnUWyDzZ6Y1ehdaodyY2ZeURvo7Uf+X/fNoI3TKUZTJBvYA81jY1Jf7YCxNFGPJskG/AxRU8qJd+4GKssYXM3LSd9NH80rib71GqNohn1iIRVEUlhKjLw0omVxbg/I9drSdX4Z5ERRWIHGW3clBru+/FUoyftiC3fy4NNVqNh+GawZ+F7qI3lGzCjpkuoH1z3Q7Rn42fFoFUbiEPLL9mnxOCVP7UtCtX5jbsLtq3oDL/iwifxF9dgh552bUzVwnakUMD9zf4VYPprXd3YsFvhB8hJdKt0WJcXttL8cABRDVtcj1tQoPQ+3vT1nQWmJHF2GFj5PhSJR+P1qgLiWDaA4fbYYeICCOTFcaP5LZXlvMoCdt6FGjxoB6vTb2nPV2HY0AhvEM0VMpKO7nxdg2gA8OtG+ComqAmkkmh8sSD4pUH8wEoeF+ivbT0Z/8EAPl2cmRsZZ2g/PHHlrhrkbalLTZc3trMXGQ2exNcw9vxymZgzioxAkITuWXPhOXZHU+TvNv+o/IOax4kXwA7kK4gYzAgUa+sxexbe1GH2+YR7a+8DLBD/2jy2N8k0powGoF0FXB6UwSiBk2CEubtpuX+cw+HXW9GUgufpmcNtv1w+M0AlpQUE0tsxItz+YZYfsn3XpBwZRIyG4jJCpb8WMpoXnRUeY/F4pMampBLoxxeR+9tGYDhtABk1nOcs3ZmaBQtK/az93qm4+KQwz6+dz7ycjiKzRMg5UTJKresQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR08MB3484.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(6486002)(508600001)(316002)(8936002)(52116002)(186003)(38350700002)(6666004)(2616005)(66946007)(8676002)(956004)(86362001)(31686004)(66476007)(5660300002)(31696002)(26005)(36756003)(107886003)(2906002)(53546011)(66556008)(38100700002)(83380400001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVV1clN0QWJ3aHpVU2lUb2tJM0JuUlBPcTNlMlFzNWtiVDFKYlhSdWIzQ0Zs?=
 =?utf-8?B?MEdPbWFkaVkyRGdxL2lURXNQTHFIUVdKdC9kcVMrTHlBemFsUWlXcjFCQ0Zs?=
 =?utf-8?B?M05vTko2UXFyYThsMHlXa1FNMGxNT01SMWhSTk8xRjZnVWQzd0lhSDBpWEgx?=
 =?utf-8?B?YVlWcjl0VmkwTFBkVm9aaGxQTWY3OTZJN3J5ckJzTVZaUmVXT1pHQ0NEN0xE?=
 =?utf-8?B?MmRWSW40UHRXbGJ6R0t3cWJPSS81dENTcjN4TkJCT3N0ZzJlK0Flb01oL3ov?=
 =?utf-8?B?cmhIaC9PUXFYSlV1eXUrRHVTemYxSEZBSFRZQ09VU1Q5Q1Y0Qmt5ZWlEUFFN?=
 =?utf-8?B?bmRvMHVGbm1UVDJGVGZtOWxnTVQ2Ky9penplSEZQdlJiQmZhd1AxNWhDK01n?=
 =?utf-8?B?THNYNVltalpQVU5PYVFaSnB1L0drSzZGcDlvSFB0VDRBSVdUUzFOWEZFdFI2?=
 =?utf-8?B?QlordnlqbEhIaDJtWlZyTHdHNjkrSlh1OVd2R1BKZ000ajdJZGloQ0pzRGtV?=
 =?utf-8?B?akNFSlM4YmFqTkJ0V1ZrMGY2UjhpclVxRDRUVjNzK2dobHVvMWFabVVISE9j?=
 =?utf-8?B?M2Zzb05tOUZWb3J0WjE0R3RpK1ZsOWhFTWxHOVVUSWMrcGp5ZUJ5bFFhSGZP?=
 =?utf-8?B?QzhoQzFoN01qbjQzVkk0VFRWbzJvcEwrNE9JV0xTa0YzdWVtMGFVMUZUUUdE?=
 =?utf-8?B?NldsMFN6eW1PdWRCekg5NDV3dHFyV3ZGT1ExSG9STUljdUZWeDVqSXROSGZG?=
 =?utf-8?B?U28vWE8wWExXTHRCcllWSTdQbGFUUXNadTFwNTRycituREhBUUFJRDVpbEVi?=
 =?utf-8?B?N1dtbkNxOHc2RUt0Z3dkaUJDenJJWk9OUFNLaGpsZ0U4U01BRkhKNHMvQWJH?=
 =?utf-8?B?R2RWVzdpbWZUbWdzR09xK0thYzJWKzkxZGk1dHlYSUd4dDZxb0ZtaWRxMGxZ?=
 =?utf-8?B?VElNWW16d2ZsdmhDaEZSemgwc1hmWGg2bGlnbzNEQnh0VzZIbCt1ODltZHhC?=
 =?utf-8?B?MkhIZTFtWUc3OWN1S0I3UTZHbnd6a2luamZUN0lFRzBENUEwaTYxNVFNY0Rp?=
 =?utf-8?B?aldvNjg1L0xveVdGajlBK3NZSkhNcFZIZWwrYlk0TWx5RTBwdnlUY0RMWHZR?=
 =?utf-8?B?cERYMXFCQ0p0SzM1R1RFWjVoS3AwYjE1TDBpb0tzT0p1L2U3d1ROUGhuejdy?=
 =?utf-8?B?clVNWnUyQndsQXd0ODBEQXNXcUJVamtyL3RCYUcxUlBhOHVra3YrTUVDNVJK?=
 =?utf-8?B?bW1JVVk2MEU5NDZnZFlHMkxPS3BSN1AwenJBYkpNdW1hdndnOGJyL1h1ZUo1?=
 =?utf-8?B?T0JwZ2dQR0RrTDBYdjVURG1KZyttTXlRSTIvOWZaeWRoUyt4OG44ZVlCSGdI?=
 =?utf-8?B?R1BOQW9JQVhPWHRPeThZRkw3TFY5VGR4NU44cVJTcjlDMjk3QTFtTVJnSm1E?=
 =?utf-8?B?UUcyZ2QxTWlyb0RwYTNpeVd0NkNncTBzd0dZYnZKTURpTzI4c3YyWWJuT1ZM?=
 =?utf-8?B?OWZ1bFZWZUxrdndKU2lhL1lxNFBTVHM0VGFSZGVWOFF0dnlqblV0S01SaTBT?=
 =?utf-8?B?K2haYkF3WUhoMmhJblh6TngrdGhZUDNZSEZNVU41cklXV2xINzAyaFZYVU1k?=
 =?utf-8?B?TG94dlVTS2N4L1NVdFR3ZnFRL1d4OVVKL0dtWTgrU2x0ZjN3MWc0QXcxc3Fl?=
 =?utf-8?B?L3BMRkIyQU0vSW13eVJrNjk1STVLdHZsMUM1QkFpM3cxR1RvZitndmFhRlg4?=
 =?utf-8?B?UFprMGU3cnhHVGZMSGJvUmVoNVRzRDQ3S3NWdXo1MFJzSDhJMXZEamZ4OElo?=
 =?utf-8?B?SFFrYk9yRkswTVlxOG52Rm1Rd2piNEZEa2Z3dWxZZkd0MjRFdWZhZkhxVWRN?=
 =?utf-8?B?ZUdrT3JrV3NoK1NsTXhaU2lMbzZDblpjUGdLcEdrWkd1TldMeitUQk8zUTlF?=
 =?utf-8?B?dlBmNmZxbFcwWkV4S09pZXJSWU85dGlLbnp6KzBtRElPbnVFK1YrcXN5WFVp?=
 =?utf-8?B?VXNJQUtrekFZNHF1b3hvd2N2Zk9lbFhmRmFoYmk3Zm5Ub3Y5d1ViOHpIR1Fr?=
 =?utf-8?B?eW9GNTl1OEZvdHYveklzRXNreTh3T0RVRHRQWWZKWE5zZjhpN2ZnNXRORkpJ?=
 =?utf-8?B?RXpJRHpqOTNjbEUyOTZxUHZWUUR3NVdYc095eHRTdUJubVllN2VobDBWV1Y2?=
 =?utf-8?B?SEhQbDlGQkZ0NllvdVBHWnplRjh0UU4xRWRZSURCMWxrazB4UHVpR0hVK3c5?=
 =?utf-8?B?UnNBMngwMEZvd2k3VFB6bmprSG9nPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8b9bf6-0896-4ada-19f2-08d9ad230ba8
X-MS-Exchange-CrossTenant-AuthSource: DB7PR08MB3484.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2021 19:13:48.2731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFaa9cx8rWuRZYUnllWQgPWiFx1jMI4GzGYeSMeqI1PaQOQf7U54BiBXb8BvstTYrVIcM6y4jQr5Ad5wtwoV80hC04pjL+zYMnTZWHv+D0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2933
Received-SPF: pass client-ip=40.107.14.139;
 envelope-from=nikita.lapshin@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.022, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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


On 11/10/21 13:38, Vladimir Sementsov-Ogievskiy wrote:
> vnc_server_cut_text_caps() is not guaranteed to be called only once.
>
> If it called twice, we finally call notifier_list_add() twice with same
> element. Which leads to loopback QLIST. So, on next
> notifier_list_notify() we'll loop forever and QEMU stuck.
>
> So, let's only register new notifier if it's not yet registered.
>
> Note, that similar check is used in vdagent_chr_recv_caps() (before
> call qemu_clipboard_peer_register()), and also before
> qemu_clipboard_peer_unregister() call in vdagent_disconnect() and in
> vnc_disconnect_finish().
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>
> Hi all!
>
> After backporting clipboard patches to our Rhel7-based downstream, we
> faced Qemu stuck in notifier_list_notify():
>
>      (gdb) bt
>    #0  vnc_clipboard_notify (notifier=0x564427f283f8, data=0x564426c59a70) at ui/vnc-clipboard.c:193
>    #1  0x0000564423455887 in notifier_list_notify (list=list@entry=0x564423d2b258 <clipboard_notifiers>, data=data@entry=0x564426c59a70) at util/notify.c:40
>    #2  0x00005644233273bf in qemu_clipboard_update (info=info@entry=0x564426c59a70) at ui/clipboard.c:19
>    #3  0x000056442334efd2 in vnc_client_cut_text_ext (vs=vs@entry=0x564427f18000, len=len@entry=4, flags=<optimized out>,
>              data=data@entry=0x5644263cc00c "\002\f\001\251\020\377\377\377!\377\377\377\314\376\377\377\315\376\377\377 \377\377\377\316\345\241\300\307\376\377\377\310\376\377\377\376\376\377\377\a")
>              at ui/vnc-clipboard.c:256
>    #4  0x000056442333b172 in protocol_client_msg (vs=0x564427f18000, data=0x5644263cc000 "\006", len=<optimized out>) at ui/vnc.c:2396
>    #5  0x0000564423338af6 in vnc_client_read (vs=0x564427f18000) at ui/vnc.c:1537
>    #6  vnc_client_io (ioc=<optimized out>, condition=G_IO_IN, opaque=0x564427f18000) at ui/vnc.c:1559
>    #7  0x00007f07b02cf147 in g_main_dispatch (context=0x564425546bb0) at gmain.c:3192
>    #8  g_main_context_dispatch (context=context@entry=0x564425546bb0) at gmain.c:3845
>    #9  0x00005644234468f7 in glib_pollfds_poll () at util/main-loop.c:215
>    #10 os_host_main_loop_wait (timeout=<optimized out>) at util/main-loop.c:238
>    #11 main_loop_wait (nonblocking=nonblocking@entry=0) at util/main-loop.c:497
>
>
> investigations shows, that notifier list has only one element which points to itself as next. So, we are in the endless loop.
>
> Seems that it's possible, if vnc_server_cut_text_caps() called twice. Then it registers notifier twice and it added to QLIST twice, which leads to the situation.
>
>
> I don't have any reproducer and not sure that bug may be reproduced on
> master.
>
> I'm not familiar with ui code - may be vnc_server_cut_text_caps() should
> never be called twice? Or notifier should be removed somehow before the
> second call? Maybe this patch just shadows another bug?
>
> But what I do know, is that we should not put same element into QLIST
> twice. And if the check I propose is not needed we should add an
> assertion instead:
>
>    assert(!vs->cbpeer.update.notify);
>
>
>   ui/vnc-clipboard.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/ui/vnc-clipboard.c b/ui/vnc-clipboard.c
> index 9f077965d0..67284b556c 100644
> --- a/ui/vnc-clipboard.c
> +++ b/ui/vnc-clipboard.c
> @@ -316,8 +316,10 @@ void vnc_server_cut_text_caps(VncState *vs)
>       caps[1] = 0;
>       vnc_clipboard_send(vs, 2, caps);
>   
> -    vs->cbpeer.name = "vnc";
> -    vs->cbpeer.update.notify = vnc_clipboard_notify;
> -    vs->cbpeer.request = vnc_clipboard_request;
> -    qemu_clipboard_peer_register(&vs->cbpeer);
> +    if (!vs->cbpeer.update.notify) {
> +        vs->cbpeer.name = "vnc";
> +        vs->cbpeer.update.notify = vnc_clipboard_notify;
> +        vs->cbpeer.request = vnc_clipboard_request;
> +        qemu_clipboard_peer_register(&vs->cbpeer);
> +    }
>   }


Perhaps QLIST_IS_INSERTED will be suitable for such checks because I 
couldn't find any initialize of .notify pointer so it can potentially be UB.


