Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A8D2D2C25
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 14:43:44 +0100 (CET)
Received: from localhost ([::1]:34344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmdHL-0004DX-99
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 08:43:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmdFp-0003W4-QD; Tue, 08 Dec 2020 08:42:10 -0500
Received: from mail-vi1eur05on2107.outbound.protection.outlook.com
 ([40.107.21.107]:29920 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmdFm-0008Ea-PD; Tue, 08 Dec 2020 08:42:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaH0fAGhgruxPXS0QEdN4UBvbpMMDkfWF81QI7RgiSCBuo1gtPRrBg4JZp03X8tTCVyZ/pbKUwAxzISmE+a+16woDGL6x9Icl9sl9fjswe+jpreRccHVNUg9Lz6SDEr1tqh/2iacrQ8M/1R1fGGOIzDZuk6rJNtexrvJf8cAlInoEjYRMB0EleZlamDbilwMwRbmv41W3jPFFJfEz5ttzokIDs1NZSiHICBFjXlMue66p38l/tqOsQABpoCbuZLz2ciATGJuecF1ZbPX/fuBMbPMZ8gGXK1P0wBmW7r+Z0IpKxeuFBY+OXt9ya9hHK7O4peKOaaNij+wGbWbfTM2FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laprLwo+4PPyWVxOVRCeE5oHEh3hBPFUy/+8L+oA+UY=;
 b=RWH+QAZGMAsnbyaqGneVJzyCGrFHczkiZm0NalQrPEfsgQmQuof4zPnzxMSBcCb+Utzs6hQENVfL2IlSX3ndd7BtfbK7CklXOGyEqjmBaHCzfo0ip5Ey27d2fOD92Vq6BACBwudF4n0pkpMescOzCM8JBAJ8uEfzSB4NbjvSSqhu+821ZC5NKX4W94H+zdW4wsJ9m6zUNlUEugkPU8gikguQMew5FzIrPBgC+aGKnAfhgNLr+an+itGpBIfSF1ol/KmrJJ838YROLbu7bphF2rwp33wpcIMATrwFCTzXgkN40nG2jxtZkPadJgExE0UVimXtBXeJo28GkoqHWO9tvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laprLwo+4PPyWVxOVRCeE5oHEh3hBPFUy/+8L+oA+UY=;
 b=fqy44zmNdcY6cMf2kMb+NiOAZIafp5AURzAssQegoEMSg3Tdd/+yFfIo5ZXIhoNivsz/FRYQQqdpieodfmnleLnOSl4nhbQib3zJSIUdSj1uBiDCDma0j75iMzN97jMnBqmAVEZhKPJt1P5PQn8juQubHZT0SEX8hKU9mlLq8yY=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB3792.eurprd08.prod.outlook.com (2603:10a6:803:bf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 13:42:00 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%4]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 13:42:00 +0000
Subject: Re: [PATCH v2] qemu-nbd: Fix a memleak in nbd_client_thread()
To: Alex Chen <alex.chen@huawei.com>, eblake@redhat.com
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 zhang.zhanghailiang@huawei.com
References: <20201203135855.70136-1-alex.chen@huawei.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <71e57a20-1a4f-5931-25df-b2740b3a5834@virtuozzo.com>
Date: Tue, 8 Dec 2020 16:41:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201203135855.70136-1-alex.chen@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR07CA0001.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::14) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR07CA0001.eurprd07.prod.outlook.com (2603:10a6:208:ac::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.8 via Frontend Transport; Tue, 8 Dec 2020 13:41:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 796f84fe-d9fb-40c5-4278-08d89b7f09f9
X-MS-TrafficTypeDiagnostic: VI1PR08MB3792:
X-Microsoft-Antispam-PRVS: <VI1PR08MB37929CB9DCD84EBA724E686DC1CD0@VI1PR08MB3792.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EoDl2QvorguQYQ5tmwT33CqetjWHq724DEt9D7YuFp6u5y4lgY84lLSDingLKxCnZCm3EYI0rqfwsJ/qz+jegzUD76bbt+k4Gjx+a+zcG2WatgwmyI0b0IQzKDlxlOGRrWuU0Hq7866dhCCKvGz6Dw70STbj4fc9U+sITUOk3ybRoBdnIpVFQMux6NIXD3jdw6vuN1PyweiaT4yKnQLdBFDz99C3ni+/t+trWL2ixH1kdWdCgDQ6UA43Nlm9alUBL2iJ9/Uprc2d/16i5RrQpxSLFmUyKXRAhaYpKZwkxXP5xm5MW5sUO/0Ixj0egUSIWF9jL7bZqH4s+BvXAZhod76kZH2vuNK/OUbvvJZqpgYiPchTKA2QH0PMMWNQGAKKwsRDGDdiyK7TdQm9u3+BeTUY81yNVcD8XpZZPgF1lmZfIEKiNugwHrvfNi+nriB4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(31686004)(26005)(8676002)(4326008)(2906002)(186003)(31696002)(34490700003)(52116002)(36756003)(66556008)(16576012)(508600001)(5660300002)(83380400001)(66946007)(16526019)(86362001)(956004)(66476007)(2616005)(6486002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZStaQnZ4Q1FQTXduRHZPd250Tkpjby9xc3N2Nk9TVFNwME9VL1Zrd1ZPYnFP?=
 =?utf-8?B?M1AwN3doZkNqTjBBK01qN3BiTEd6L2RTVElzd2tBbVN0WEUwVDdJSUU3dmMx?=
 =?utf-8?B?cGpPVEdzayswRmEvZVB4R3VvcEZtN1NvU01Sc25QbHBQbERKT0QrSTJFTlI5?=
 =?utf-8?B?bEQ5ekdKcmZYMjJ0QmZXZnk0bm5SN1U5cU5WdkFjamVtSk9yN0QxYnNBWVB5?=
 =?utf-8?B?K0kyUkNwNE0yK284d1RpSWZyWXJFRmpnSE5TTTR0eTdveTBJTEZWMTkwWTJZ?=
 =?utf-8?B?TmhkRDdIOFhFL1VsSWk2K3BWaWE5c3hncUMxb3c5a0YwMDdVQ0Ircmcvdm1C?=
 =?utf-8?B?ejVERFJXcVhrajJTRHg4RXE2bkFZdmhXbmFOK1VyMUczMlVMUnQzYWNWUUtG?=
 =?utf-8?B?ZFYvTkdmalBXWkd5U21vTXJkUEMvd0o5R0kva29zNTdIMUc3RDhtSzZaNlZn?=
 =?utf-8?B?YlZJZHl2bnE3SGd1ZEF5em1HdGltamh5dkxnd0xEU0U2T3JhRkRqc2N2cFRI?=
 =?utf-8?B?UjFqNTY0WkwzTS91YUcyR21Kd20ybWV0MHdyNHJTMkE3RG9yZnRUK1d1WEcx?=
 =?utf-8?B?VWNMOWFnKzFSc1ZmOGlRcHUwemRlMlk3QVUyOC92NnhNc0k2ZWsxaVV1MTgz?=
 =?utf-8?B?a2dNc0xNOEFwVXk1Z1JhM1BtQUl1cTRmYUxHeDQ3U0pna0xic3NJRFdCcDRW?=
 =?utf-8?B?VmkvZEVTZDd4bFdUVVZLYnVjWkJTbEN3ZkdGbDNxc25Gb1dSU1ZrVElKeklj?=
 =?utf-8?B?bTNMOXVxdFIrVW9VOFViekRiUzhBUDF0OXp4U1p5SVR0LzdyeTd3RjNFUmwr?=
 =?utf-8?B?NnVPVDl1WmFSSDRSUDZnUHFGY1VPMWZtRnYzZXl5TnFKSlRJaFAyamtOM1VB?=
 =?utf-8?B?ZmZFVVprQ3ZVWG43SndhcjIybFN2NkZERUVQYXJlYUZtNVIwS2R0UWplMHk3?=
 =?utf-8?B?bDJWcUhVVmVKTVd6cndRRVFidGZ0MFowMllseUhvUGlXeUUzN0JHczdwWUI4?=
 =?utf-8?B?VXhSd1NlQ1BLVTFWMm5KZWJWUXhwZXV0UnYxbU51a29zNUJ5TUlzVWo3Lzhh?=
 =?utf-8?B?aU1JcU1sYnh4WWxwNWZGenRKSWw1UWhCbTNmNXRNSllEM0hMcjBmOU5PRjJ0?=
 =?utf-8?B?UVhaaGxKS2VUd3h1UzRCVFpDVS9EbE9FTDRKZTA1a2I2cnM0eEV2QTJmbDBa?=
 =?utf-8?B?blBRd2JaaW1rdVdoRU1PYzVtZzdwckxJODQ4NVQzZldmVGRYS2pMMDh6WnMx?=
 =?utf-8?B?YklqTnZlSm5aeHpZRTlxU0hUNmJCYVJ2bENGL3kwY0Y4ZFdVU0VVNkwwZGhr?=
 =?utf-8?Q?1g+UwKlc39zeE3V5NQFa4Qkl0vEdiKl/bh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796f84fe-d9fb-40c5-4278-08d89b7f09f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 13:42:00.5169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NNkRc6cNFSbfaMWQyhe8lA+XHySVI1/uwSRSQK/aN53T1Xdy+VzXoLKthZJ5DcMTHqbrdOTqyCLv1aniaPHajYTiW+LzoPf1KzSzZ2SvWAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3792
Received-SPF: pass client-ip=40.107.21.107;
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

03.12.2020 16:58, Alex Chen wrote:
> When the qio_channel_socket_connect_sync() fails
> we should goto 'out_socket' label to free the 'sioc' instead of
> goto 'out' label.
> In addition, there's a lot of redundant code in the successful branch
> and the error branch, optimize it.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   qemu-nbd.c | 38 +++++++++++++++-----------------------
>   1 file changed, 15 insertions(+), 23 deletions(-)
> 
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index a7075c5419..9583ee1af6 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -265,8 +265,8 @@ static void *nbd_client_thread(void *arg)
>       char *device = arg;
>       NBDExportInfo info = { .request_sizes = false, .name = g_strdup("") };
>       QIOChannelSocket *sioc;
> -    int fd;
> -    int ret;
> +    int fd = -1;
> +    int ret = EXIT_FAILURE;
>       pthread_t show_parts_thread;
>       Error *local_error = NULL;
>   
> @@ -278,26 +278,24 @@ static void *nbd_client_thread(void *arg)
>           goto out;
>       }
>   
> -    ret = nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc),
> -                                NULL, NULL, NULL, &info, &local_error);
> -    if (ret < 0) {
> +    if (nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc),
> +                              NULL, NULL, NULL, &info, &local_error) < 0) {
>           if (local_error) {
>               error_report_err(local_error);
>           }
> -        goto out_socket;
> +        goto out;
>       }
>   
>       fd = open(device, O_RDWR);
>       if (fd < 0) {
>           /* Linux-only, we can use %m in printf.  */
>           error_report("Failed to open %s: %m", device);
> -        goto out_socket;
> +        goto out;
>       }
>   
> -    ret = nbd_init(fd, sioc, &info, &local_error);
> -    if (ret < 0) {
> +    if (nbd_init(fd, sioc, &info, &local_error) < 0) {
>           error_report_err(local_error);
> -        goto out_fd;
> +        goto out;
>       }
>   
>       /* update partition table */
> @@ -311,24 +309,18 @@ static void *nbd_client_thread(void *arg)
>           dup2(STDOUT_FILENO, STDERR_FILENO);
>       }
>   
> -    ret = nbd_client(fd);
> -    if (ret) {
> -        goto out_fd;
> +    if (nbd_client(fd) == 0) {
> +        ret = EXIT_SUCCESS;

It's not obvious that nbd_client() returns 0 on success, it calls ioctl(), which may return something positive in theory..

So, with s/==/>=/, or with just

if (nbd_client(fd) < 0) {
   goto out;
}

ret = EXIT_SUCCESS;


(which is good common pattern I think)

:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

