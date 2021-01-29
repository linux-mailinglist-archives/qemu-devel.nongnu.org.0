Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533AB30854F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 06:51:00 +0100 (CET)
Received: from localhost ([::1]:56866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5MgN-0002Fq-Cs
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 00:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5Med-0001eC-Cy; Fri, 29 Jan 2021 00:49:11 -0500
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com
 ([40.107.21.95]:16799 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5Mea-0006BM-C0; Fri, 29 Jan 2021 00:49:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoEjAwkO6nRzEQPyr3+/SHI32KeNKAfRJeDT10Aj4lqd2ncijBHlFV0Aidm61fgNaRTtYneq5oobheEJmF/0ORhFHFtmkWQOWxguKHxCR42ZkX5KojSkmCySYuNxqUFBh1LjTcNRzlT3YTk1PG6UVAUQIfdpA+v5aboBOPLbl0BHMQdAmzzJ8lfRPfWl/hFGu8eurETy/fFJ6gRFv7yoNoiATRthui/dEOt+aeMRGHfYDmFE/93xRPpxOYHE4FvAm27sMTNBbkWzvV1fIaZdWaIlQ4xh7+1FvvBX4ffWOgy4FQ+d/5IUp+0CBfoOahaWeYzvmo6mr13BNOtbSCaIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKNCAmPLJO55XLeWV39pqRJKsP7lcOL+LhTwb0xrxhA=;
 b=JVpb8hGt/wZqYp5GYea2YC0oh8nsFtqjHDzfPfG81MMYYxjWWS9PUu2f0hg/cpZDJvyiA45LVqC5CkaDm8EzFEGOC2ggyzN9GLJpI2+CEVXfJcYnIb+aR8KQc/d+jfT5uSDqg57Rt3MHlLO8SGpYwzKtGHGXo1WQNHh0A6cB16zZMY2rkjbfJqbBuCu1BqKdH30GSMUvxyopftLpQZEmoDYaNkNM+9lfm/lDb1XraL4yzjBWX9GWJhWBfXDdrMaluFTzsw1+qhRpcv3gbVkQmrbRK/wdVV3t6eQCuztqRs3mDUGTPvSuwo2ipR8Nl9QSEbEh1qWnspSYz//odjDKjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKNCAmPLJO55XLeWV39pqRJKsP7lcOL+LhTwb0xrxhA=;
 b=pLEouSOnP7au4/XqAzeRoOXPcujTqofc3HANpoG0drwHo2jx6xVBUkDeS8N9Q51v4doKyG/EaRWMlkl5sw3/45y1UDYsv67jB6ca1b9udlJ3qcf4l0fjf59MGQL8OVrEf7g74y6FUt36jS9dRhXkG1aQNLTyC4AFuAQQTfDMTac=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2611.eurprd08.prod.outlook.com (2603:10a6:203:a2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 29 Jan
 2021 05:49:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 05:49:01 +0000
Subject: Re: [PATCH 3/3] nbd: make nbd_read* return -EIO on error
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
References: <20210128201418.607640-1-rvkagan@yandex-team.ru>
 <20210128201418.607640-4-rvkagan@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b647a64f-5cdc-db8d-9117-feed5e955057@virtuozzo.com>
Date: Fri, 29 Jan 2021 08:48:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210128201418.607640-4-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.77.43]
X-ClientProxiedBy: AM0PR10CA0035.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.42.193] (178.176.77.43) by
 AM0PR10CA0035.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend
 Transport; Fri, 29 Jan 2021 05:49:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30098c50-a722-4be0-0c10-08d8c4199456
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2611:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2611CA637522B43CDDC65697C1B99@AM5PR0802MB2611.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9iUM3ur8onI0mIhyoTC4dCasbjM1PfIoVXlFVPf5EHCKq70pzVacWpEIlEwUNORw2Ymo03YW1ODC+a1Y718VMRRnof4p9qeYK6Lc0tb3VF/Nrz8Ag70qq/9im0LzK7E2ODQltuz9VYb+EmWN8rq9LgOIZsJeiH78mb102aFrE0CL2A08WW3hpnOrJjkJzqwA+UKGwE6gVxFsd10M228+iMo41t7ksko9MZ2T5h8xM29F8yHBEI9mT0CPzE4UTya8u4uVgqryJ3XhVJAIcpvErBn437dFsKH1gxQKF3jke9Vmp7F/DYTYcds2jU3D/fZsSH7EiuyM/BQXmP+amIQgvwbUkm2k5PZAjhKkabig5BOOmSvup4phEy6iiJmG5RchnIoOCVFa5ZqLvDU06euAxgwf2mJ/CJBpF1iqLNvEzyJRB1gZjGi3nt9jzIwSoOoZTuKzNNQxr/TrlkwFiAitG72Wprb3pXKjtexqqjnRWp44/+o5cRH73r+8uY9lBsLFNcckVRplgPK2XAbtRQEQVNdHji0jx2nxICNovsR9r03HvZ6As8Q96PCDTvavaam6WGf7Dp/4Y9FRoYPWDb82XU5OA8LZ0zX+0WSRZkx7z9g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(346002)(136003)(376002)(366004)(2906002)(5660300002)(26005)(52116002)(186003)(54906003)(31686004)(36756003)(6486002)(478600001)(316002)(66556008)(16526019)(16576012)(4326008)(83380400001)(8936002)(8676002)(66476007)(956004)(31696002)(86362001)(66946007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M3Q2VzZ5NEJFaXVUOFlwc2Z0SjdiVWNqanRxRkE0YUc1eDA0ajZpMTFpSWFx?=
 =?utf-8?B?S0F1dlh5MUJmRHNwUmIyaDZ3enlqak9Gc2gybjIzS08xdWJpNWJ0emY3bytq?=
 =?utf-8?B?SjY3bVpydXN0SnpneW1DT2k2clVJcmtaZEdycTFyeHZTOFNhckI5SjFNZzlk?=
 =?utf-8?B?dFBmNk5obG1vZVNHVUl0V0x4ajhHbmRrSE5lNzl4MHJVTUNIbDlPVENmWHlt?=
 =?utf-8?B?dEFZeGtnRGN5T216NHhCSjU5UGRlcGpyTmpuR0dzc2pDZDlCbVF4d3RWZ1BG?=
 =?utf-8?B?QjdFeEp6N20xZVFTVkZhMFZoejlQVWg0bkF2T2RXZzIya3AyYXJPejA4dHQ3?=
 =?utf-8?B?UDJpckVCMXE4dm9DNGtTTG9RcHROYWhYMHNxMnMrTmpHTHJBRmJpcHNhUE9a?=
 =?utf-8?B?Q0Myb3U3SG9WSkpTUFlhUG1CWDlzaTdGMElSYTR2cGRqZm5oMVhnYjBYZ0Q4?=
 =?utf-8?B?bzd1WXo1MklGb2p5YWZNemJxcGl1dmt4Ui8vSWEzS0xiN3BMdlM5NEMvUXpu?=
 =?utf-8?B?RmNBR0gxRVBnMGVTdEMrcFdJeWhXanNSbmVscnFBRVg4TFZLaU1LMEtkSDJY?=
 =?utf-8?B?dWl2THphOEgza2podVcxdENwcTJWUmVhYnVMd0x2T3ovYjhwVWt4cXN5WWlG?=
 =?utf-8?B?aTdYRWtyR0J4aUlOWm1BUkJ3c2hvdy83MFdMSlF4dXpRZllVSU9iWW9SN2Fz?=
 =?utf-8?B?ZDVaMVRCTU9jbmV5enF3VmQ0aDRSRThPRjFtdGwzVGZBVTJUYUxkNjlESXNB?=
 =?utf-8?B?TVc4OUFhTDBGQUF5aTRqb1pHT0hKY3k1bHErTzdBbzJYT2dMdlYwODE2aS9Q?=
 =?utf-8?B?TnpTL3MyZit5THdFd0l3aWM1R2pJK1djWkJMemVIMi82U2g0Skx4bGh2bWkz?=
 =?utf-8?B?cG5BM1pwKzBCaHZSWXVpSkVMSEh1aUNadSt1cUVOTVRmUk5jTUN0bUFlbEJt?=
 =?utf-8?B?UHRUN083RTNCMlhFRUxwRWNJMEpVblVQUzlzSWl2eFBUblR6U052dHFCWXlp?=
 =?utf-8?B?N2FEenROekw0TlBnOGNIQnRoWUxpamZuY1VET1FWYUVnMlFTZXpNakJpbFdL?=
 =?utf-8?B?ejdaeHh1TlRpaE5IekhtMGQvb2QyQWxxaytvT2NUc0xmQWYvc2NIdTZoYThK?=
 =?utf-8?B?ZkFwUkZCZUVNbUMySEpNR1RxeWJvL0hheHIwMDBmMmNzNytDVlFZcDlQQjlk?=
 =?utf-8?B?Smo5Wi85SHl4Q2x1WnlUK2kycklmem00L2VqaUo1dEJ6VE1OVjRQRXpSVkFt?=
 =?utf-8?B?VzV0elFyZW1hZkZQQnhoQ0tvcEVFM3BMNFljRzN1R2JiVnArR2kvL3NkRlVB?=
 =?utf-8?B?dWZVa1JhY0Q2WmtyaDhWQm9ZM25pUHBBbnNXRjNPMFRBNUdUdDZVWXlGdDRs?=
 =?utf-8?B?WGd1aHJHK0szc2dKTUVwY0ZHZ0EvMmVWQWlCaTVIV0ttanh4ZXREWmI2dVRk?=
 =?utf-8?Q?c591Io4K?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30098c50-a722-4be0-0c10-08d8c4199456
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 05:49:01.6093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HvkQZPuGdA5JeSx+YCEBvt1uaCY39fbL2xJTmQNiVIELdRjslK09USEo/WI+BVMCv3BI0G235dsYCUg2Z6CgEdjeSfhtUIZfQkVn30eBstA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2611
Received-SPF: pass client-ip=40.107.21.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

28.01.2021 23:14, Roman Kagan wrote:
> NBD reconnect logic considers the error code from the functions that
> read NBD messages to tell if reconnect should be attempted or not: it is
> attempted on -EIO, otherwise the client transitions to NBD_CLIENT_QUIT
> state (see nbd_channel_error).  This error code is propagated from the
> primitives like nbd_read.
> 
> The problem, however, is that nbd_read itself turns every error into -1
> rather than -EIO.  As a result, if the NBD server happens to die while
> sending the message, the client in QEMU receives less data than it
> expects, considers it as a fatal error, and wouldn't attempt
> reestablishing the connection.
> 
> Fix it by turning every negative return from qio_channel_read_all into
> -EIO returned from nbd_read.  Apparently that was the original behavior,
> but got broken later.  Also adjust nbd_readXX to follow.
> 
> Fixes: e6798f06a6 ("nbd: generalize usage of nbd_read")
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Really looks like a bug in e6798f06a6: it changes error code from -EIO to -1 without any reasoning.

> ---
>   include/block/nbd.h | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/include/block/nbd.h b/include/block/nbd.h
> index 4a52a43ef5..5f34d23bb0 100644
> --- a/include/block/nbd.h
> +++ b/include/block/nbd.h
> @@ -364,7 +364,7 @@ static inline int nbd_read(QIOChannel *ioc, void *buffer, size_t size,
>           if (desc) {
>               error_prepend(errp, "Failed to read %s: ", desc);
>           }
> -        return -1;
> +        return ret;
>       }
>   
>       return 0;
> @@ -375,8 +375,9 @@ static inline int nbd_read##bits(QIOChannel *ioc,                       \
>                                    uint##bits##_t *val,                   \
>                                    const char *desc, Error **errp)        \
>   {                                                                       \
> -    if (nbd_read(ioc, val, sizeof(*val), desc, errp) < 0) {             \
> -        return -1;                                                      \
> +    int ret = nbd_read(ioc, val, sizeof(*val), desc, errp);             \
> +    if (ret < 0) {                                                      \
> +        return ret;                                                     \
>       }                                                                   \
>       *val = be##bits##_to_cpu(*val);                                     \
>       return 0;                                                           \
> 


-- 
Best regards,
Vladimir

