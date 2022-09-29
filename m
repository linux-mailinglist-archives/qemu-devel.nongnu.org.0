Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB53C5EFB22
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 18:44:24 +0200 (CEST)
Received: from localhost ([::1]:58768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwe6-0002Bt-Rr
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 12:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oduGh-0008KQ-VV
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 10:12:04 -0400
Received: from mail-eopbgr80095.outbound.protection.outlook.com
 ([40.107.8.95]:46720 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oduGe-0002T0-KN
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 10:12:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaoYfgJqbzYLpIeAUjw7O+4a6m9I1mPrDvrqEU+UjmZ0Wbpo7q6PXEhU2xmrsDeY1uiUUBwVzEDg5JbS/IE3d2TMOwI5PjbPmPNgRWGZB+Tn1dRoMnyLkfIFUo7nrO3dcshjYp4w8D5rc3J0bR7LxuFTDTIglCL4QxMPQcAmIHaUJE7EB7n10+UqJzGlp9PSdcY2kNQ8f7mEYiGLeshdjMB5R+7+AwJtorTWRFvEf6NowPwzonBIaVMYYbspTSFRx53Koi8AM1+EvPe/QLM0BMLhVlxjlC7JzsenLY2qznLfuU18ejwNcRwXRt3VjIC3TLbFxe7FEx/QUoWHPKd6Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jj91h9RzZ++gt0zGw09Gu0A6ipTr/6RMI6PUmVTK8Dk=;
 b=cQpn930GgPOkLHMNGXKcgFpynfsP1TxhFzENtXh5SjGPa2oaesABevhU0mW0+bzsETaqPrQ3y9ZP56C9IUzB6biwKrUujiffD0p1zVBWqNo4ViCoQbbRe75XnxfXCRI+PQy9oKFkQHFPFdB/syhqNpY69AJlE2BuHNVF+fRHOE/dv2wShJ5MRAy1vdFZeIAYZquYPN7B2A9vyFNwQARWDHLfarGIVPl6IS+kwNc23L6DwAFKvlJoYcqlb9pFoEu5U3LFP/Nd4cX+USOInHQllqWsLlzB3A6TjDFZzcjV7lY04RfCAPk6vGzq92YlNHe7X5DZnlogD9B03qJ0VCD6Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jj91h9RzZ++gt0zGw09Gu0A6ipTr/6RMI6PUmVTK8Dk=;
 b=b3nkXHX0LFX5hjyTXNYzlqWljRNR3HFlcnxECiGbxNYeeMI3dhrOutZcojP68oUHUFPaYfn9WTA6/g0pRTRtNhrm+/QHJooGt2dysyv38W1j/XTJsfgJuhTqtw0NYBCrMIuUbC2CYkjGI13c2ch21ngAoAgFDMYuShDjB6fCQafkPWpHVHN7za36pV+IC+K9y6nXRNk3VQgiSeiOnVfT1Vaecnsdjcz0ZK14adKR3qw2ARLcT7kHJk08C8sfXI/rLcuIstq6joselKA18qnJuZFx1LK1NgaayS7f0WVBGpcqYoM0MdVYjW4ODFMLKKpOaJ80eFXsm+s5L+aIDw09hQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAWPR08MB9518.eurprd08.prod.outlook.com (2603:10a6:102:2ed::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Thu, 29 Sep
 2022 14:11:55 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 14:11:55 +0000
Message-ID: <045fe8ca-cc7b-7b9e-894e-5a4022c44e62@virtuozzo.com>
Date: Thu, 29 Sep 2022 16:11:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/7] qga: Add initial FreeBSD support
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com,
 kkostiuk@redhat.com
References: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
 <20220929075239.1675374-2-alexander.ivanov@virtuozzo.com>
 <CAJ+F1CK7ksUETpJteO1Uw_uS4VwiH5A9FRNKytvRmMFi0eyPOg@mail.gmail.com>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <CAJ+F1CK7ksUETpJteO1Uw_uS4VwiH5A9FRNKytvRmMFi0eyPOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0502CA0043.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::20) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PAWPR08MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: a5e92a9a-fdd8-466d-8855-08daa2249057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FAzjQ+4f5dAk/eZ1gwR8aEHVHpSb43GjVE5K83N4lnSFEkQ5mgfkp2ajpqqWae0I1V0114kdlAtYKQOuub1RilCNCGUH3B17Zp+MCiF9t7H1Y8Tm7+BWQdiftZpogo8x8rXQZHh3u65iE98WKTSMFQbH7cDdPDggE7EnvJg61C0ZPjdxPaE4xbrQCIA1+nm0JWzyUE0c4VtM2EU3vtFdYvM25ujIGXNsOt5BKRDFrTn8S2QrQKK0iTTOyTQkklnM2XTIcTcj6O45zFU1gKAlo6H3IA7mb8KL8CV+Wx3zIWswpd6KWsn/KfIesTjMIcXUuBOyQEgr0VxNFojOOCo/OHr9V28Vlq/uUysHlB91z+G9RmgO5bff+wrFdTOgvRkk43ud1AZ1r2mXFxER7cqqfxmj/6oXib6xRsr4xUFmHGiKHYwhk64LRT+W2KrAzVjG8VEsja+uxLgLi+bV8GfhV1aYjtyU4vdNMTkgI/39MuLX6f3HfEuV68sfFtIw3MRsX5L4CD+fN12H9Q50I5e0LjPq0VqeouJj50a6/a9jSSVTylynTLqjKefIQEBjA2oWHJ15VjBMMkziWPRiy0EUhPlZEN4SGSyJmCwxQq+QUgsHPv1zLafz8DOY9c2bE7bTkPpXEHd0v5nnLIR+wNRDB7U6ELcohYuNJl27N5D/PjRYMnjmQ2QUtklMkdE5BF4DJDLTs4EGz4EqI153YVvd6Lk+w/Z89Jda3yDRULl1ypMX78EERwmte94fqXu0fw37zQ6rvkE8RPzsxbopp4JuCj12mNSCZbfkwjodop8QeXvMVucTA2apzmOb2S8Pjp7bVbECoBX0jpcGqfc/shVtLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(376002)(396003)(136003)(39850400004)(451199015)(26005)(31686004)(6512007)(2616005)(186003)(44832011)(2906002)(5660300002)(6506007)(8936002)(53546011)(52116002)(83380400001)(66946007)(8676002)(6666004)(36756003)(41300700001)(4326008)(66476007)(66556008)(478600001)(38350700002)(316002)(31696002)(86362001)(6916009)(38100700002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHo3M3JjeXB3VlZXdUJjZzBWVlR2WnVlQlZOQVd1K3BZeU9KVEVydzBDTS9U?=
 =?utf-8?B?RUJEODFNOWZuQzV3Q05aaUFYTThKM080RDdJbzVXbXdiL3lqOTVVc3NDQnd4?=
 =?utf-8?B?Z3pUeFAvRTk2NkkwTlhscWxPK2FJUXE2M0VCNEdUVzlmTUt1VEVhYmpJTlpx?=
 =?utf-8?B?S0VVQkt0c0YzL2h6RkR3cXE0VGdDZ281RjZhaGlWeGNWanI2NnBlaXBCaTl5?=
 =?utf-8?B?eWhZM01QQXBuRk10UnhienlkRFg3WGRaeXlUMVNGWmk0cXU5TG42blBRc1N0?=
 =?utf-8?B?SVF6YXptNzVBNXF2ak9IS2MyWEtYSmFLRVlNakg2aGtVTHFZN2hVamtIeERn?=
 =?utf-8?B?MzFHTXNhM1NxNE9lMy8xYlVWelhVNEs3OHpDbURNTFRTa1JMaGdzaXBUODVr?=
 =?utf-8?B?NXJERWtSd21ocmphVktHQURyUWpLemZPbjdrQWszeU8ybWR1Q2JnS0lPMVNk?=
 =?utf-8?B?V3RlWFFRNXZOMy80bkpZQndsa1VPTFR4L0N3VlFSWlJVTUFzSlEwN0l5OHJl?=
 =?utf-8?B?K0thNkpZOURuNUJFUmJqWldSTnpwZjFxUSs3RlJEZ2svbnBOT2FUYnF5eHN3?=
 =?utf-8?B?TncrTWIwVzBZbmVMREYwQlVHWWdROXRFQjNZMnVrbFFPTks5WURaZ3hzQzl3?=
 =?utf-8?B?alh3SHNQQjJmVjQ4WHoybzR2NkR5SVpwNkxaaXhyc3h1S29jRmNkYXZxSklx?=
 =?utf-8?B?M0ZiUWJYVFJ2M0JDc3RlNGowK0M1Z2R6dEMrbWFMcjlqRmxrRHV2eHE4RGxM?=
 =?utf-8?B?NW85dURPbU93VFc1M25tbzdKUlpsa0RORGFnTEIycmowWG4zNnhEVHJGeUVR?=
 =?utf-8?B?N3RVSUlVSjZqK0s3NGFlU20wWUJ3WC83ci9LczZLbVNrVmRzb29OekNCbVNn?=
 =?utf-8?B?Tms1ZnJ4d08zbVUwdWd1Ky9qcFVTRG84Z1kzRGljdzl2V3VaWUhZNlF0NFor?=
 =?utf-8?B?WDdGM1d0dUF5SjFlU0NBcXJudi85cEJIMjRLb3ViWVU5bW9HOUtKa0xFcHAw?=
 =?utf-8?B?N21oSFBMUkNVeUhsK0FMNWwvOWVpdnJVdEI0S3Z4d2tCNGNkUnFkc21pYmJG?=
 =?utf-8?B?WlRtMk4rbjdiRXVNV1BNRHhDRWE0TEVpZWpXQVNkVk1sN3VnTGFjMzVNN2VU?=
 =?utf-8?B?TUlBZS9lZ3dQZ0xyWGhkUW52Y2orUElobEdpc1VIb1VyOU53L1hLRGFUT1Fw?=
 =?utf-8?B?U01YRHAvRVdjMnIweEdSa3gwUVFEUDNFNW51U0tnLzBaSmpkTUN2TEhod0E0?=
 =?utf-8?B?SUFDZkJLRy93U2E3cHdGSThNdnd6Tk80dEh2dlFjL0E1SnlwZUhZSlN4TU01?=
 =?utf-8?B?eFl5TVN4QTUwRVNtd2tkOW9qa2FvZU1iaUVLTlI5c3p3MjR3MDNKZXFIRlNj?=
 =?utf-8?B?SGlWanByb21temV4emxKQ3JOZFE5T2pndnJlNmNiWTF0ck1DNDU2S0duMnBX?=
 =?utf-8?B?bk9rUXhuNlJDSndCOU83MXhpeTl4MTF6ekJYQ1Nxd1ZwWDBkbVphR3BYWnF3?=
 =?utf-8?B?MVNPQndYR0g3d3pJTFl2b0Voa1ZOTWtkaDZudXh5RmIzYncwaGZjeVBwdGVr?=
 =?utf-8?B?d2N4aE56eVlHd2tBTXpoQzhPZi8zSG1YZ2YzUnkzWHFUblRNTjRJclRnVUpI?=
 =?utf-8?B?bmRPSG1DbmNxUEhuajcyVGczSmpzRXJIVmZ6UHcvby9KMjlRZEUrenk3eGd1?=
 =?utf-8?B?clo3TStuWDVHVVNlOWRUNWFxakI2K0gxQ3dFMXloc2tqQ0JFcXU2WTJoY0Q2?=
 =?utf-8?B?U1RJY0h0OFBkVUJlNi9pZ1ZkanE2bmkxYkdnOXRtUFQ2UGowOWlZMUZWYmcy?=
 =?utf-8?B?MW5TbzN6NEpUMjVYOUJWNi95YW84RmJKQmZFRUdiTzMveGQrZTdmbU1tSnJi?=
 =?utf-8?B?MVVERmczUjQ4ZFBzcFlQUWJuTUh1Y3VvalgwR0JLbE9jSU5HM0hpVGJET2NC?=
 =?utf-8?B?NkRuNDFnNHJscVZwR0hwNVZPOSt6Vmg3cWVUTkFSWmtSakE3MkZNTmhZbElt?=
 =?utf-8?B?NjUwMThiejVuZFhUdmtIVzJrY2dIcDR3N1ZpbjVkNEVhanlTYnZuYnNaRXR1?=
 =?utf-8?B?VEQ1WE5QV2p5eFh4NVdtQyt6cUJmb0c5d1BVeGF6eXZWc0hSb0lXb2dJUnlT?=
 =?utf-8?B?Q1FWZnplVHBNQ3NDSzdpSUVOREFBajdoQkNQbURGaDFpaTlESlQvOVVJYndw?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e92a9a-fdd8-466d-8855-08daa2249057
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 14:11:55.1930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QpgW21+g8Il37e51A2/taZDcwwGuHpxgzBuMb8X8Wsi0X+sx3bbeFTMGTfuqT5KjfCQk18ryZmu0rB0+/y/2FINmJWdR25HfgVcyLI8v4e8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9518
Received-SPF: pass client-ip=40.107.8.95;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.099,
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

Hi Marc-André,

Thank you for the review.

On 29.09.2022 13:29, Marc-André Lureau wrote:
>
>
> On Thu, Sep 29, 2022 at 11:56 AM Alexander Ivanov 
> <alexander.ivanov@virtuozzo.com> wrote:
>
>     - Fix device path.
>     - Fix virtio-serial channel initialization.
>     - Make the code buildable in FreeBSD.
>
>     Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>     ---
>      meson.build          |  2 +-
>      qga/channel-posix.c  | 14 ++++++++++++++
>      qga/commands-posix.c |  8 ++++++++
>      qga/main.c           |  6 +++++-
>      4 files changed, 28 insertions(+), 2 deletions(-)
>
>     diff --git a/meson.build b/meson.build
>     index 8dc661363f..5c11abc8aa 100644
>     --- a/meson.build
>     +++ b/meson.build
>     @@ -75,7 +75,7 @@ have_tools = get_option('tools') \
>        .allowed()
>      have_ga = get_option('guest_agent') \
>        .disable_auto_if(not have_system and not have_tools) \
>     -  .require(targetos in ['sunos', 'linux', 'windows'],
>     +  .require(targetos in ['sunos', 'linux', 'windows', 'freebsd'],
>                 error_message: 'unsupported OS for QEMU guest agent') \
>        .allowed()
>      have_block = have_system or have_tools
>     diff --git a/qga/channel-posix.c b/qga/channel-posix.c
>     index 6796a02cff..0f14246563 100644
>     --- a/qga/channel-posix.c
>     +++ b/qga/channel-posix.c
>     @@ -149,6 +149,20 @@ static gboolean ga_channel_open(GAChannel *c,
>     const gchar *path,
>                  return false;
>              }
>      #endif
>     +#ifdef __FreeBSD__
>     +        struct termios tio;
>     +        if (tcgetattr(fd, &tio) < 0) {
>     +            error_setg_errno(errp, errno, "error getting channel
>     termios attrs");
>     +            close(fd);
>     +            return false;
>     +        }
>     +        tio.c_lflag &= ~ECHO;
>     +        if (tcsetattr(fd, TCSAFLUSH, &tio) < 0) {
>     +            error_setg_errno(errp, errno, "error setting channel
>     termios attrs");
>     +            close(fd);
>     +            return false;
>     +        }
>     +#endif /* __FreeBSD__ */
>
It is for echo suppressing. In other way a host client gets in return 
the commands it sends and raises an error. Will add a comment.

> It could help to document why this is needed. I assume this is 
> correct, so:
>
> Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>
>
>
>              ret = ga_channel_client_add(c, fd);
>              if (ret) {
>                  error_setg(errp, "error adding channel to main loop");
>     diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>     index eea819cff0..16d67e9f6d 100644
>     --- a/qga/commands-posix.c
>     +++ b/qga/commands-posix.c
>     @@ -51,6 +51,14 @@
>      #endif
>      #endif
>
>     +#ifdef __FreeBSD__
>     +/*
>     + * The code under HAVE_GETIFADDRS condition can't be compiled in
>     FreeBSD.
>     + * Fix it in one of the following patches.
>     + */
>     +#undef HAVE_GETIFADDRS
>     +#endif
>     +
>      #ifdef HAVE_GETIFADDRS
>      #include <arpa/inet.h>
>      #include <sys/socket.h>
>     diff --git a/qga/main.c b/qga/main.c
>     index 5a9d8252e0..0d27c97d38 100644
>     --- a/qga/main.c
>     +++ b/qga/main.c
>     @@ -45,9 +45,13 @@
>      #endif
>
>      #ifndef _WIN32
>     +#ifdef __FreeBSD__
>     +#define QGA_VIRTIO_PATH_DEFAULT "/dev/vtcon/org.qemu.guest_agent.0"
>     +#else /* __FreeBSD__ */
>      #define QGA_VIRTIO_PATH_DEFAULT
>     "/dev/virtio-ports/org.qemu.guest_agent.0"
>     -#define QGA_STATE_RELATIVE_DIR  "run"
>     +#endif /* __FreeBSD__ */
>      #define QGA_SERIAL_PATH_DEFAULT "/dev/ttyS0"
>     +#define QGA_STATE_RELATIVE_DIR  "run"
>      #else
>      #define QGA_VIRTIO_PATH_DEFAULT
>     "\\\\.\\Global\\org.qemu.guest_agent.0"
>      #define QGA_STATE_RELATIVE_DIR  "qemu-ga"
>     -- 
>     2.34.1
>
>
>
>
> -- 
> Marc-André Lureau

