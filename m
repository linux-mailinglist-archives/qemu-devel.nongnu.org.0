Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A0A39D5E7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 09:24:50 +0200 (CEST)
Received: from localhost ([::1]:45352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq9cv-0005Ih-Q9
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 03:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lq9bp-0004Ud-H9; Mon, 07 Jun 2021 03:23:41 -0400
Received: from mail-eopbgr10095.outbound.protection.outlook.com
 ([40.107.1.95]:45025 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lq9bk-0007sf-GQ; Mon, 07 Jun 2021 03:23:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dmjl2bzYnP65JakFIJOSn0vHaOJ2lu3jTorlZ+1nR7wZWxuyxBM1uB+HXyLZxlFfVlK4GpDgYW0JEqVUCypSNTWvf2H9zMjmnal/D9uUdJXPyK7FTkuVvbxRWC8KIHp9iHWRDyDmlY3e/WplbgVhj+kIaC9J4ibVwloA3d1M8YyxwbcyzfHW9QmobfznHDqQIdo7LW4v6aEJ2LKvLmAw6HnRdzvOkuGM2cqoBmEeOL5RJy3iiTPKjXfIGmpYHC7x0cWV5T7AA750p9hm27ayzDdR7DdntJ0qtzpnPyE70SnHePE+iY6WCrw/Kl8tEQv7IBD05eexuo7wxF5yDXg5Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndmGacynssM9fTvgeFS7DO1v9kXTrSimyIvwV/Nd4ic=;
 b=YkoDH32VC8wUvazhsGCyS2xjVKpjHRJ/LysWifP9g8MIhNjeXDNJN0wywH4XzQSSENY1nddO37+lp7qRoZ1JmQRt7R4JwmQFGy3Dl07L6VcM2kjvAg8tpCGv1hElP2kkwwaqLzAYEhdRwPW3d9mAt5STMlRk28IqMYGlQ5F6pnekDsDzsZ8/TOZOYFfX9LCxnjW3F7iIrk+HFFZZOgw1XIaTZmMbh5hviYMX0FCIWGgVAI9kNaXEup3FHVZQJVv27wcFAd8RWnPD4wjv+BLTju4/npr5Aq6stQ1lcOqnX3H+67y/GSG75RvWw04hNZn/nRJCsbU3Tj/pOzrwTqxcmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndmGacynssM9fTvgeFS7DO1v9kXTrSimyIvwV/Nd4ic=;
 b=bPJriHvbsIgrlW89WMgHjaRnygXFLD0t9SZyKqoqqMEaQUSHEsNtkfMNqaad+d3kYQqPQ35CWsNXPKmoVf0ROHopdMRGooTqmWaq3dRcrwelIsOUNHlFqvWh/cweSZqzH+UtLzj+1dDjCCruy6ba6sj9elinpg/AgQbBUG5pKhE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4599.eurprd08.prod.outlook.com (2603:10a6:20b:8f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Mon, 7 Jun
 2021 07:23:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 07:23:32 +0000
Subject: Re: [PATCH v3 1/7] file-posix: fix max_iov for /dev/sg devices
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-2-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9ebe728d-f6bb-d62e-03d8-5928e68cb8e1@virtuozzo.com>
Date: Mon, 7 Jun 2021 10:23:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210603133722.218465-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.227]
X-ClientProxiedBy: AM0PR06CA0099.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::40) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.227) by
 AM0PR06CA0099.eurprd06.prod.outlook.com (2603:10a6:208:fa::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 07:23:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b896998-b092-4686-aa74-08d92985278f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4599:
X-Microsoft-Antispam-PRVS: <AM6PR08MB45995214B1FB8B20528AD3AFC1389@AM6PR08MB4599.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1eCgToro5C+0NSVQfvcNk+XXothXgtovsojgH+1+MQItIZapEv6AshSToxE6u3XhdKmrqFr+kpLI1tZxNlKPd4yUZL4zbBUCAZZZsLs1FK3JtAemnFQk2wf96Mc2iKegdCIVkkXAH4mCJ1evuXyVHXStwba9DyDQMMbSEotj/Mi8Gld0tw3S7CMoh2Uf7vcudw6S/JUa/HTXiJNZGBwYxs4mr4CxOvBL4oLTxLfW3fk/xVBNWQ0dzHgytj1YiGjvbNdw/hLC9NAo0ZYwZ+9KRybq+ntqfIRDeJ4vutGS7YOYXZLyL8FEXLbbUT1b3IAa3jiRwS06niGFLVGv35Yn5gqbEdMPmKQ7h5stHeiGvPfi6wcuh+m7UR696iZkIX+m1tJGqRcDQD8WNnKAykktu+Eko6xhrH7Cq4LsSw0B8EX4uoz51DgX3p5LaANIhFgiHifIA46t70AmRuTpge8cFser02fwySzzmUjiM27tE+PTtup/AYDsTORdC8IVj8JZKw16XsUpC3oFBT3AWk1QMPWYFFGWIaJVgam5bgSpf6Ij2VupPADUKli4KVHPPnpRdnx/U0lZql6O/FrAGvtln0Av/qIlAwnJtL6RYiyWPxg+e6YhgbDwFFglDvg81DdbefmZjJsqu6heD0NqHmEPYG0CONfMac1ApfUYp4sP9LseAi9A2wJgTitLm94vB9HAIIbUh+oTOmexmJb2dyICKgsSan2n6t5QOA5sPe43ieg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(346002)(376002)(396003)(366004)(52116002)(478600001)(31696002)(86362001)(83380400001)(5660300002)(2616005)(6486002)(316002)(36756003)(8676002)(26005)(66556008)(66476007)(66946007)(4326008)(31686004)(16576012)(38100700002)(38350700002)(2906002)(956004)(8936002)(186003)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U055aDR0dEhPMXV3WGxjb2IxTHMrMER4STE4Y096Rk54L0NGQURJZkx1R0xG?=
 =?utf-8?B?QVFDZW9hYXVUY28xYWR1bnhTeWNGOU1nVXBoNTcwcCtYblFScWJPbnJHTUxi?=
 =?utf-8?B?Sy9JWk1LWG5NMzFET1ZpSHllOFl1NmZmZWJsQjVsaUhtY3NzT2NIWG5ZRDVj?=
 =?utf-8?B?SmVicXhTSGxnUVQ2RVhCdHozSkcreFE3enp0ODNvaFI0L0d3TlJ3VFRGSGJs?=
 =?utf-8?B?eWIxK0FSd0lJSS9FQ0hUNzIrM3VKbnEwamlwemJrMks5OEh3ZnZ5RVN1SDBr?=
 =?utf-8?B?aTJJazIxS1hSL2pzUG9wZ3A5bG9PWnZuYldJSUNHVzdWQk0zdEUyVFNXekRm?=
 =?utf-8?B?ZnpqWHBUdGRhTkp5eDNUYUdRRW1hd3ZqMWNNREpGbVlNMGRTZUVqbXdjMXZk?=
 =?utf-8?B?dllkaTYxNnBwdjRuaExETVZ2WTd0Z25naFcwSkhvbGM5RUZ2OGFGYmRKdFFC?=
 =?utf-8?B?MGxNSXNrTW9kUFJNU09pSlR6NCtGSEJXaEZORmhDUFNRb1hEcElUMEVKbTJJ?=
 =?utf-8?B?VHdaNGdIczR1bmNGcysvK1dnVStvQ1VDdU1sbXFIMHBJT3N6dEM1alhja0dB?=
 =?utf-8?B?Tk1QWXU0eCtjZ1RhR2pQVUlSZ1ZJbFV4Uit3ektNYm44cGVvMFB6VVhVNFZu?=
 =?utf-8?B?NXFyV28vWUplY2YvM0Y1VVM2dmlURWIrMHExTmExM24vK2NldjF4R2lBcERU?=
 =?utf-8?B?eHh6V1hycU5FTUxONFA3SUl6NDE0MUR0b1hhb1lCZURrWFlSL2c0V1RhOWFU?=
 =?utf-8?B?cTV3TXdZbnIvUmVCclB0elBwTTVPSlRnK1g1T1U5VFJDKzkxVEVsV1F4Nm41?=
 =?utf-8?B?Z1Zoa3BxOGxEZWx1RjlEVTE1RGpSS1ZYT1BIV013NmNoR3g1QjRBKzI1ZzJx?=
 =?utf-8?B?VGdzb21BKzVuWDBhWnJVTlZQV3dsOW1uWUtsRWIzYXczbEJMdXlRTkVhTk13?=
 =?utf-8?B?ZkxBT1dHU2ErclVEWUIwVklXeDUvalRuU2RpLzlhVm5rNHZPUGpoVmJaZ0Nm?=
 =?utf-8?B?Ym93QmM4RGJRVUd3MzhjWW1GbE5DRTVEU1FoN1BGUk9LUzYrc0hTTG55Z0ZJ?=
 =?utf-8?B?dFRoQlEwazVYMFNYS3FVbUlzS3o2NDd1bEJ1bWJsblpRL2p1aXlKVCs2a3pK?=
 =?utf-8?B?Yk1nRWJGRWNrdldhbGFPWkJYT1pNT3REb3hXT1ZLMEFLaFJtR2swM0xiQkoz?=
 =?utf-8?B?V1Yva3pCZ3loR0JaUFBpaEVrUXhvcUtvWmxhWWJpT0NzYzVualRYc1p3VnVu?=
 =?utf-8?B?TWM3MmRUWjFocXUzWHhDYTZvZEE4clFHc0tnWk5OVXBxRGdvaDExcDR2dkJI?=
 =?utf-8?B?Wld3VS9IcE5TemlmTWRhZERLL083cm0xVUZVdEQ1bzlwQTdVcDJKc0dPOWZu?=
 =?utf-8?B?ZFN5cW1NTGpOZ3ZveHNSdklFOG42aUJwWS9vT3RQVXNsKzFyTldMSHJnb21E?=
 =?utf-8?B?cWFzVVRmYlV5OTNiYnV0Q2psN0lWaVdPQjFNcEtabHN3TjBCcXVPbjJtcEcz?=
 =?utf-8?B?dzZTdjRCNTlhTGNwRnU0eFB3Tk83dmdjOUhqeHFnVUZVaGNnQlNwZ0ZiOWln?=
 =?utf-8?B?R1FUMDlPa0J6TDloZ0Q0ZEcyVFc3RG1KbjY1VjhsVVlMbXo2THhyZkp3NlVn?=
 =?utf-8?B?dFJkZ1NmTTV4QjZ0UnhGNjRiQkZ1aGkrUzdjVWJqQkt1QWFidlZGazRobSty?=
 =?utf-8?B?YnJLb1N6bGRkcDRFMThsY1hoU2ZxOHdsUklnbFAvZUJ5bVQ3Wm1HY1h4b002?=
 =?utf-8?Q?3fRX9yTXX1RnNbRyC1m4knkN0vYHKabZNDkoOZJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b896998-b092-4686-aa74-08d92985278f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 07:23:32.2344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jql5+6b3BZa8nZKzM49qcZBtOuwpZe4vStEEu5cU/t5nnpFLsPqY8svCysc32zcGhKoiPDh2Uj5dkuhzjjfb7Ck0MXZZVBv5FAh4djUVlDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4599
Received-SPF: pass client-ip=40.107.1.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

03.06.2021 16:37, Paolo Bonzini wrote:
> Even though it was only called for devices that have bs->sg set (which
> must be character devices),
> sg_get_max_segments looked at /sys/dev/block which only works for
> block devices.

I assume, you keep /sys/dev/block code branch here only for following converting of the function to be hdev_get_max_hw_transfer()? Worth mentioning here?

> 
> On Linux the sg driver has its own way to provide the maximum number of
> iovecs in a scatter/gather list.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/file-posix.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index f37dfc10b3..58db526cc2 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1180,6 +1180,17 @@ static int sg_get_max_segments(int fd)
>           goto out;
>       }
>   
> +    if (S_ISCHR(st->st_mode)) {

Should it be instead "if (bs->sg) {" ? As SG_GET_SG_TABLESIZE looks like sg-specific, not for any chardev.

Also, st is not a pointer, so here and in the next if condition it should be s/st->/st./

> +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
> +            return ret;
> +        }
> +        return -EIO;
> +    }
> +
> +    if (!S_ISBLK(st->st_mode)) {
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

