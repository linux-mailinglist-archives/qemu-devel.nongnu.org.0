Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A215C01EA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 17:43:39 +0200 (CEST)
Received: from localhost ([::1]:35650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob1sw-0001xW-EY
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 11:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1ob1mP-00060B-05
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:37:00 -0400
Received: from mail-dbaeur03on20701.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::701]:48675
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1ob1mI-0003qy-MA
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:36:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtFtFSMhAwsObpGBRmMDGFdDK4JlLZvYbjoOacv2Vk9a0GpTTFWZpV9zyealcIF5KHOdQ/evehS0edPiFP+fAioCudJBmigTTbWcmFoyHPHz9Lo0rlWe9O3eq8qSLWLS46eTi2Go309UzLLV0hHXc0Y/3B+jUJ2+W3lT+gDOu4zCPB6bNpp0SE5ee1kMhj+QjuVhOIhIaOkYUq7y8hzngPKK/TdbE4pF5ywgjoaXKS2zO1eobue/qF1dik4Bv1/cCmsMKTKWAzK4J0JaLEthxbEey4+ROZ7zv790ZZ01Ca+kSe3mS0z2N0Cb+hUVJ0przqejzghTl2c+6scsyr8JcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXMn9QW3satLwvG88hbZQiZr77TSIgDLcjnPotSDTuM=;
 b=IuqKcbw14H9OpjYAQUpSawDnu6Fo0yH0Jk01aJBsY7lLi+u+u2UJLqR9NNDzhP8Wh0Zwh1JvcjYFpkMWm2FyVIzk6Ufd5G8Cess6z8yJ2X3cSucbDK3a/gpHsaxBvXUDYrOSPHGWRYSrn/sjr63+sHB8Yf/CPkGX8eDvgsrCMpv2xnXDo8pd62v8rt4AWrjPx/6/NxgW14bJ3dAV8vbXj3ETLd7d08cSiakHB4QBLQMBa+IFD+58ea7EYHkI0Y1tA/kbCn1IK3UIgBgBr1zCLikBNNkxrVZ8m77uttzkJntGy8fW33LJbdQeqcc7WD5DOYkZr82O2kzYY2XPb+rFRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXMn9QW3satLwvG88hbZQiZr77TSIgDLcjnPotSDTuM=;
 b=p0x+qUJJOVrmjrfbUxgE2ONgw+DWru3MqU2HKHC78KNny7284GiU9uW+AMskLX+YIGmlIUXWL6bAuUmlK1Lp34sZYB/drHIt/G/7g8R+ilLWUGvkC0NcJuXqFe2wBDW5eHfFchMQ+tVe8C3+m8bT3h6Eiujehi/VvI2rXhUZYep2Nuc6jNG5Z7UQc6uz+snPMca168sbxnkyGaq2gyRF3dwyt9r4ZytSXpEme1sSyH7y1zJ9GL5Stb+IOC1AaYlvgGIuNyu15BSQXxZSz4Ln3ZtUiw8h4FeOvY9TvAgsarMM7uaEtWQSEyWGyeGeBYRzgIDGVQpE9Rj6ufVRtEbbjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DU0PR08MB7567.eurprd08.prod.outlook.com (2603:10a6:10:317::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Wed, 21 Sep
 2022 15:34:08 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::c82b:333d:9400:dbc9]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::c82b:333d:9400:dbc9%4]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 15:34:08 +0000
Message-ID: <09e2a607-695e-7cb5-17cd-fcb84fd71815@virtuozzo.com>
Date: Wed, 21 Sep 2022 17:34:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] add keepalive for qemu-nbd
Content-Language: en-US
To: songlinfeng <slf553@126.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com, songlinfeng <songlinfeng@inspur.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
References: <1663749369-3057-1-git-send-email-slf553@126.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <1663749369-3057-1-git-send-email-slf553@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0801CA0074.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::18) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|DU0PR08MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: bb3e819a-8b93-4d56-7e29-08da9be6b98f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZoN5fE1od/x2IWiQBSFuSBQD75w7y67kdQgkyEqKeKQDKUrTNknRHKpdDih9bt6hQWNX960zmHhbt0xa8p+/vUdwp1VTbf6Us5zDKrkJngRGI/izygB//626E9Vm4Q7OJiUht7c20uOp8tgzuzKkT7OApsVI0FWD2o0lxixof9oisznaj9toYNu7Zq5yCI1JhcHvAwjSOQbrb/KWg/4ZdwY7IkO3lsrvhJwr2B3fppdkM8AU+PwgshMfcHmAl45hLkBxgY5ELm6QKGEffBik1mvmtXIF1j//D99L8izXxPBpdUjVbPULEJ0/VbMMsIF3cH9xmihyBcAYscEc5a05+ATNfz7ImDL6N9FKhiDUWkrk5sKj7ykNKVXOrcQM2xmJnTe55GWDI/snbd01hXTAXqE9fo3ZBAU4KRwasu059dzGJbhvTePvtgNs/ctgT0Wd+eOjrN4IgiukBV5Ml4qm85+n7GG1cz4IxakPr4Tgt1srrPXBTvl4HUiGcnwJwgUHBujnlxHoLtuSERoVXBITEMr2n+iXSr3OTtpK2olzBuWTqhlHR+aM6XqO0BsaE/2/BiMkINQpG7cSQ4msFVIUgS6P6MZ6OKcSPUEfPzdbUGnY7K/LKhjXzjDceFZo1TtgT3aC/XibO2iEXfDe26GEAbn0PV6MKQ953I9nrfyNDEPaEQWAA8Byazex+teJXOz5NtODxDuC9yMk99bm8WfzXJF0oeYOcMroAssWlbVG/e6t484IeeW3hbsMQpI0+pGBptpmU18kslEEF0lukpa04lSCvhgRhMTiRC+0A8SS75GXuU6btK9RSgajrMFza7q5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39850400004)(396003)(376002)(136003)(346002)(451199015)(6512007)(2906002)(36756003)(186003)(38100700002)(31696002)(38350700002)(2616005)(53546011)(66556008)(52116002)(4326008)(83380400001)(66946007)(6506007)(8676002)(41300700001)(86362001)(66476007)(8936002)(26005)(478600001)(54906003)(316002)(6486002)(31686004)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjRpVW9wc09ENzJrUjI1SW1BeWpXS3RKRnc0Qi9icjRaek5IcGc5WFdzYzB2?=
 =?utf-8?B?Yi9GbmtzOStVVTZhSWd5R1pXLzl5WjVUTmtuckoxMERtZmduWHZ6Q3lnZkNm?=
 =?utf-8?B?OEZlcjBxY1BLanNjV1ZVVnZLcUF2RVFIQ3dtd2ZTUTIxcG0zQVdJd1d1ODUy?=
 =?utf-8?B?bkQ5UGhnTzdWZkF2czd5MzRVS3p1YWhsY3BCSGZBeVVXWkxDNUdNTnhTSDN6?=
 =?utf-8?B?V1lwZGVId0s5dEdSemdTdUh3RTJZTWcvcEkwaEkwYlg5NlBYT0d6N1ZDZ1ov?=
 =?utf-8?B?Mmg1aG9xR3Vxam5TVVVwK3RBODZHVDVXTG5pZkQrcDY3MG9kZ0tFNENnVkhD?=
 =?utf-8?B?YXcyK09aWXVqcnhaa3pXcDJ1WFJxdVBiV3I4L3RRUm9GSHRVOFhhck1VQzA3?=
 =?utf-8?B?TmpjQWlnNkQzSXl4WElTZzgvYTU3dkh6azVmbHUzMTNhbXNSMFR5VWUrbHZy?=
 =?utf-8?B?NnNBZ3NGYjF1RWhZUHNuenpQVE14SHdMTTJDTnBNWmlXUFNqbW1KLzBINktW?=
 =?utf-8?B?OHBPYmhGTm5leVpVSjVtUkMvZHUrTThLRjRNUVMxeDlmZnRCUFZORS9PU2Nr?=
 =?utf-8?B?a25XbWk0WXVWV05hdW9NVXdMVUhkK3JBbnl2eS9IQUdJcWNSRzAyWi90R1po?=
 =?utf-8?B?dDVMWHFBZkF3TytORitXTUVsUWZ4N3ZTanBGUCtNMS83bXlSb1dHQ2JiWEpY?=
 =?utf-8?B?QXB4cDNNYVRUQkg0NlZ4SDU1MTN0MWdKenNRSG1TdzVLTHJ3cVdVV1pFbVdp?=
 =?utf-8?B?UWM4WTUwcSs3elozR1l4RU5VcjJOZEdIbjJRUHBRNHZaQkZnMGhqVHBSUG5J?=
 =?utf-8?B?YnlueHgrS25pZHkxUFA4eklzL0l6bFZidlVqNnk0UUs1SkxTQXB0bjM0U3Fp?=
 =?utf-8?B?SnUrRFYrNUhzTGE5NDRPU0JxamtVY0VRdVZSNXlOMUN4WkxiU3VWNDgwcy9F?=
 =?utf-8?B?bWdKdGVCT0Y3R1pSdTRUQlJVU2hRVW96b3FYeCtwd00xSlNGOVVRUkdzRFFr?=
 =?utf-8?B?bm82WUhiRGhCckU4OWFrWE9Lb3UyZUd1TTFDRk9HL0tZeXdRbzloRUxYMGxR?=
 =?utf-8?B?ODZvSHc5eERNY1NJMTFHQmttVWZhdEtXQ1FCUExZbXlFMGhzd3U5OHJRbkdS?=
 =?utf-8?B?WnQzM1VRN00xRldzTTNCeUFVY09VTEM0K0VYaUU0VG9vOG5rM0szZEg0QTg1?=
 =?utf-8?B?bVFvRjdwU0hFcDdjaUI1L2xELytBK0hyTUFKcEN4ZlV0T0IrY2lGYVZzbDlx?=
 =?utf-8?B?a21QUE1aNm9oeFpaS1crZXpyRG5KQnpjcmtwWll5Nk1qRzJJRGt4N3dJSEQz?=
 =?utf-8?B?QjNGV0RDV3dqQ0JWNXBJUGlFVWY3cFQyblpyR21sSDFuT2ZhQXY2N3JodWtU?=
 =?utf-8?B?blJybkxRRmNkeTdqU3A1Z3p3WDduYzJLVXhtdm1tYmplUmtLUGR1bGNyaHNH?=
 =?utf-8?B?TjRUeGJkcDlPK3M4dU9Ra0pwaVJvUWgzaHgxTDBtMkJEMmRiUS83UC9xMEdZ?=
 =?utf-8?B?R3JFK1RaOWp4MThXRy9yVG9ZWDRzcGkyWnFyT1Z0TmJ5UHBqdzNNREo4aDdD?=
 =?utf-8?B?bitjVTZ2UnpaU2JLZGEyaGlLQ0sxQXczdklNbUhnZXBHQ0xBdGRjL1lZaUdy?=
 =?utf-8?B?ZUJrL3BFaXZEWGltdE5EVGFyWlkrYnVoVjRFajhaTXpYeEhhczRvajhJbHov?=
 =?utf-8?B?b0lWN0R4cTZ1YVM2c2I2SW1ZcmtTajZudTd2VmR1VjJBZXRnekV1cFRENisx?=
 =?utf-8?B?Rkxkdi9rZng4bnp6Zk54WHliT1MvUU4zQ3Z3dm10Szk2UUJjb2FlZjU3Ukgy?=
 =?utf-8?B?bVlINGs2TWRtL2ZNa2p2clNWSkdsL1l1YXpNYjFIUi8vZmp6MlRuOWs4ZVdu?=
 =?utf-8?B?SStnLzBIMThSdnBTU3RGamY2bnF1YWRjT3l6eFkxNmlzMG5CRHdQQ1VjUnVq?=
 =?utf-8?B?Ui9qWW4wckhQVFB0bkpGSjlWSmRsQVB2NUNYNWx5RlNmV2xUYVNzYlRoRWdh?=
 =?utf-8?B?TUloUk9zU29YekJuUVVaYnhyNnNxc3duUGhmeGwvY2tpbnd3UUFhNHFGZWhi?=
 =?utf-8?B?Lzd2WEVNalJWLy9VUlNKNUxscG5PeWE5TWtZZ1hyY0p0QU42WG9FblpHS1M1?=
 =?utf-8?Q?v0e3Sfdjbf6PEXk+a+XGPXa+X?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3e819a-8b93-4d56-7e29-08da9be6b98f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 15:34:08.5412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VscW2Ca0lAVIUF9fIg2BbGrlfcc74Nf8QhTmw96LzWDFclLpnU+3/XYR2j47NbZ6IIvmH/fK4K3aRzjTCcC9/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7567
Received-SPF: pass client-ip=2a01:111:f400:fe1a::701;
 envelope-from=den@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.702,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/21/22 10:36, songlinfeng wrote:
> From: songlinfeng <songlinfeng@inspur.com>
>
> we want to export a image with qemu-nbd as server, in client we use libnbd to connect qemu-nbd,but when client power down,the server is still working.
> qemu-nbd will exit when last client exit.so,we still want server exit when client power down.maybe qmp can handle it,but i don't know how to do .
> Signed-off-by: songlinfeng <songlinfeng@inspur.com>
> ---
>   qemu-nbd.c | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index 0cd5aa6..115ef2b 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -20,7 +20,8 @@
>   #include <getopt.h>
>   #include <libgen.h>
>   #include <pthread.h>
> -
> +#include <sys/types.h>
> +#include <sys/socket.h>
>   #include "qemu/help-texts.h"
>   #include "qapi/error.h"
>   #include "qemu/cutils.h"
> @@ -365,6 +366,26 @@ static void nbd_accept(QIONetListener *listener, QIOChannelSocket *cioc,
>       nb_fds++;
>       nbd_update_server_watch();
>       nbd_client_new(cioc, tlscreds, tlsauthz, nbd_client_closed);
> +    int tcp_keepalive_intvl = 5;
> +    int tcp_keepalive_probes = 5;
> +    int tcp_keepalive_time = 60;
> +    int tcp_keepalive_on = 1;
> +    if (setsockopt(cioc->fd, SOL_TCP, TCP_KEEPINTVL,
> +                   &tcp_keepalive_intvl, sizeof(tcp_keepalive_intvl)) < 0) {
> +        perror("setsockopt failed\n");
> +    }
> +    if (setsockopt(cioc->fd, SOL_TCP, TCP_KEEPCNT,
> +                   &tcp_keepalive_probes, sizeof(tcp_keepalive_probes)) < 0) {
> +        perror("setsockopt failed\n");
> +    }
> +    if (setsockopt(cioc->fd, SOL_TCP, TCP_KEEPIDLE,
> +                   &tcp_keepalive_time, sizeof(tcp_keepalive_time)) < 0) {
> +        perror("setsockopt failed\n");
> +    }
> +    if (setsockopt(cios->fd, SOL_SOCKET, SO_KEEPALIVE,
> +                   &tcp_keepalive_on, sizeof(tcp_keepalive_on)) < 0) {
> +        perror("setsockopt failed\n");
> +    }
>   }
>   
>   static void nbd_update_server_watch(void)
I tend to so no. Not in this exact form.

In general we have NBD server which could be created and configured
in several different ways. Through qemu-nbd and through QMP.

At the moment we do set KEEP_ALIVE for outgoing connections
only and that is configurable, please refer to

int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)

which I believe should be called for the any real configuration
setting with an IP address specified. This option will get
InetSocketAddress->keep_alive/has_keep_alive set.

Though this option has no effect for the listen socket and
this is wrong for you case. You are absolutely right,
as specified in
static int inet_listen_saddr(InetSocketAddress *saddr,
                              int port_offset,
                              int num,
                              Error **errp)
{
     struct addrinfo ai,*res,*e;
     char port[33];
     char uaddr[INET6_ADDRSTRLEN+1];
     char uport[33];
     int rc, port_min, port_max, p;
     int slisten = -1;
     int saved_errno = 0;
     bool socket_created = false;
     Error *err = NULL;

     if (saddr->keep_alive) {
         error_setg(errp, "keep-alive option is not supported for passive "
                    "sockets");
         return -1;
     }

thus you should technically remove this pitfall and set keep_alive
in the generic accept code if you have it specified for the listen
socket.

This seems consistent to me. Adding Vladimir to the loop as
the submitter of the original keep-alive code (if my memory
does not fail me :).

Den

