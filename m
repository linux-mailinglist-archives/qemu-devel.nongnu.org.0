Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47D62C2280
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 11:08:03 +0100 (CET)
Received: from localhost ([::1]:51346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khVEw-0004KI-AT
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 05:08:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khVC9-0003Gj-3L; Tue, 24 Nov 2020 05:05:09 -0500
Received: from mail-eopbgr70135.outbound.protection.outlook.com
 ([40.107.7.135]:13537 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khVC4-0003Gi-68; Tue, 24 Nov 2020 05:05:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHDdahieVBja0kn5JUWlIUnc4Q128XpsYayfsPm/61RsWAyh2Q40oHCKj85JTowm6UOce9+hBIypfoA9D/cr60ijcSk7OL0iOQ5DooHCOBOlWQ0/d4T89M1Of/U6xfycYmgbla3ctPu1tF2n9GnTwHEWClEmK3xQucvTwAmh6QL80BHTjPLVk9mweF6tTYDge59xvdL9hzo3CGJYMTlLs8G+7nwu6hcZeq7N6sg0vdnVqevsHLVs/Gr047LYvcMajA9zD6i/Nv8/rcDEXkEaO8UeMMsxzfzXJuaoVlAbYRHp5NGGXhk+eB4hwTupEG79F4aHwL2SR2XxF/0wZCz64Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moY/byPmz5ohHDiBaKrySB+7VJzvuHpO0lnXuMR0UAo=;
 b=kRFL2CdhDjHHHR1U1MF5BgVabazviqaj9PWuXB+rTc8oOhZ1h4yTxlPUOPFmWd2l6iqI4SE8PTi1Tg/X8qOGYNP2pocmS6Vg3ENcq6OIFIJL8oLwylzpzcQFvUNd9CjS0p4mVlLXEeigwJTkJLQqTi52b7ljNDbE8Clza92Weirv0e2Z7Iu+u28JHOaCm5LZpFcW1dU1hKHcklmEIPtoe97cFTRvkOpyxoJag9NAiQuDc32M0P2BDgNKW4KU03p2v642mdLMh9jzMTk4Otk9jUb6hD9EcWO9XfqHcsk5Z4pwZoGEm+x8d/gipqfT8Y5BTD625nWmmHM7hkIbmumrKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moY/byPmz5ohHDiBaKrySB+7VJzvuHpO0lnXuMR0UAo=;
 b=owOYUi+8cPfqH/0O06wO8Sd8np4pGXlVeUl1Sf3VsnnIKn6OoLAp5ghtfDk20WJyqucU915qFHtagKfs2+ohAfkv/QGUHz1PMAeYRsMFpQWmfhixaOZXzS5xX923Hgj/lpXNcZSrnwYDb4aXWUeh8ncQ/7GB4tr6Na7DAVWw8yk=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5079.eurprd08.prod.outlook.com (2603:10a6:20b:e8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Tue, 24 Nov
 2020 10:05:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 10:04:59 +0000
Subject: Re: [PATCH v2 1/2] iotests: add another bash sleep command to 247
To: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, armbru@redhat.com, dgilbert@redhat.com,
 den@openvz.org
References: <1606146274-246154-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1606146274-246154-2-git-send-email-andrey.shinkevich@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7fa343b4-cb87-cb64-956a-87c3a32f75cc@virtuozzo.com>
Date: Tue, 24 Nov 2020 13:04:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <1606146274-246154-2-git-send-email-andrey.shinkevich@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.100]
X-ClientProxiedBy: AM0PR10CA0109.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.100) by
 AM0PR10CA0109.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 10:04:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3a02429-1252-423f-683c-08d890606757
X-MS-TrafficTypeDiagnostic: AM6PR08MB5079:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5079ED503A851D9D639750BCC1FB0@AM6PR08MB5079.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 39YNYhZwfKynGbQUVdX2PoMzldYo4XhRpWgZEHI1vneWAidjNhR9PpMSJGfY3JL+shEk3FLUmFjT9VN8Q0hRIMj9Omd/Aich9SriIJ+A1X2487M6RSG4xK/J5j46U8qNLv6hGgi6QVuM783lGQXo0Eot3S+B/iNxLYBNt33CvkG+6GV2TSCQILIB+M+60jP0kDnML+1y7myh5Aq9VEYmWGBdUy3m+IFyYvYlG2iF0s+fZdcU7/0O8sbcSXuPYJQyvoHxRDRwvY/AEaGLSG8SmnJAL8DCnT0dDTvdcUpJIt9u4H0QJrO3VXCZdWawZYxiFU3Pw6wEHXQhmpD8GYp7z13KGXPpfRA1kK4Ox2SHG79aaZimr2l75MDNn7U34QZZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(136003)(346002)(366004)(376002)(66946007)(4326008)(16526019)(478600001)(31696002)(86362001)(186003)(6486002)(2616005)(83380400001)(956004)(316002)(16576012)(36756003)(5660300002)(31686004)(66476007)(66556008)(107886003)(8676002)(8936002)(26005)(52116002)(2906002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: IeMjh4HwlYPnPrPlR9/gz2+EHM/1MCsJnHtEcanIlS76nNDSRLjYlUzCTA80Gj4qBNd0u1EOuwjNCqhExBg6qnA8JZLGzBW4jr/c0E3Mkox5GpsOFUaZ48cWUvSLVBq2CYjUeuFswHveuAiFsFSTuYm8Foc14Cz2ZmV7QnBd6Ar6NJAH+S4hyHYYGyB/G/huWMsS5w1/nxGou5LRZwFBpG+kjD3fyQo8P+mdBL2B1eutf2SrXdiW9q2Pn2lfkpLurFL5W0ZinZQQJ11aOIdfyWIF/KjX3nBkOPHvhbN9guEChoF5FZq13PRe8gCJvVFXwuOdPnzeemJyAmPwBaKuBTCETxw2/xnotDwV7BcPdGnQ94zGMWIGocbFIk4Et4i68v/JZSxWKOYOHzsHo7tB+PHnqfuyHIuHVkwRXBGKFZQ+WasdcHrhBVopTlFNXyqKpT1neqsSkpXW29c458IqG5uZoy+O5YTK/A4+Pwe7i4Z043yDHqXCnwRBYyPW59TYf0tXYkrAWEhYUZdAvHi2x461TsRM+rpBuGUnFf3AHUj0a2s4IOaVLbjFJhRPMq/D2Eu7g2sW7QcNOjcWuDKUpYgc7LbYTWqR1qb7ucpX92Mv99NrqfHsmQpbqlb1BLk1ODCQrcTaCtndP2u4ORVNZ6EfzwySTDPsnIM6AjMPei7fJBa1CL0axLQZh2yT4B5pyK9GpiQlmePqUrsuHX6R9xFjSH5/F6UyMUNm8/4U6jcNYF1O4JK9UMWKtvOjTagN8igbBrmTV81AisPcUi40z6otVs6LvOWNAvU3gn5xiES2LpCneGpvtx+yS+cBfV6w7SqA+Dhl/A4A4YCy1vcdPI1NTJ+QfOy+0LY5VJiRUgw2pHO/4Ebp1imXRSvfgtHqPNnUFI4VM838unrr3BePJg==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a02429-1252-423f-683c-08d890606757
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 10:04:59.8872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8J6KJBl/oeVJ1DKKX2M4jH+F+peuDrq1ejE9hlYwrLgzs92kRdtdFSZfHPBr64aCah9l2NL0fc42Ted3RrGgOHYQf9rEoB9VqnCGLXOS3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5079
Received-SPF: pass client-ip=40.107.7.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

23.11.2020 18:44, Andrey Shinkevich wrote:
> This patch paves the way for the one that follows. The following patch
> makes the QMP monitor to read up to 4K from stdin at once. That results
> in running the bash 'sleep' command before the _qemu_proc_exec() starts

But how? Before _qemu_proc_exec() starts, qemu monitor is not runnning,
and its new behavior can't influence..

If bash subshell work in unpredictable way, may be better is refactor test
to send commands one by one with help of _send_qemu_cmd. Then sleep will
be natively executed between sending commands.

> in subshell. Another 'sleep' command with an unobtrusive 'query-status'
> plays as a workaround.
> 
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> ---
>   tests/qemu-iotests/247     | 2 ++
>   tests/qemu-iotests/247.out | 1 +
>   2 files changed, 3 insertions(+)
> 
> diff --git a/tests/qemu-iotests/247 b/tests/qemu-iotests/247
> index 87e37b3..7d316ec 100755
> --- a/tests/qemu-iotests/247
> +++ b/tests/qemu-iotests/247
> @@ -59,6 +59,8 @@ TEST_IMG="$TEST_IMG.4" _make_test_img $size
>   {"execute":"block-commit",
>    "arguments":{"device":"format-4", "top-node": "format-2", "base-node":"format-0", "job-id":"job0"}}
>   EOF
> +sleep 1
> +echo '{"execute":"query-status"}'
>   if [ "${VALGRIND_QEMU}" == "y" ]; then
>       sleep 10
>   else
> diff --git a/tests/qemu-iotests/247.out b/tests/qemu-iotests/247.out
> index e909e83..13d9547 100644
> --- a/tests/qemu-iotests/247.out
> +++ b/tests/qemu-iotests/247.out
> @@ -17,6 +17,7 @@ QMP_VERSION
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "job0", "len": 134217728, "offset": 134217728, "speed": 0, "type": "commit"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
> +{"return": {"status": "running", "singlestep": false, "running": true}}
>   {"return": {}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
>   *** done
> 


-- 
Best regards,
Vladimir

