Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5733C9D58
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 12:57:14 +0200 (CEST)
Received: from localhost ([::1]:57664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3z3J-0007ZP-8r
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 06:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3z1b-0006GO-LH; Thu, 15 Jul 2021 06:55:27 -0400
Received: from mail-eopbgr150100.outbound.protection.outlook.com
 ([40.107.15.100]:24359 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3z1X-0004KL-OJ; Thu, 15 Jul 2021 06:55:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWhA8Jz/qfz7fo4IYeuKo0GfjXEGuywKca9JU9CLIqhsx9L0RQFtI15nhb0+ch4cwBoTLxLw8StijgbvBacU7sF1jK8Fg5V3j/aGtV1OQkS3wcGd50sz7c6zCzA6V60ICkLRLxOkAfba0ql+6j4+TSmCejgQxPbUAyY/GarbzpzZAqvobxMxrrPpV1IaR6ibdJ/32IOI/O9lybzb6nFnadZJZ6nW9uQqWHfuy3uH9E3tDhWzSmnQucClEMaVCu3PSNHLIPEhM0w16gVVcDjDVtODfU2ntO742HnrWxdXiAaIJMZtnPEaMQYWXOANrZUxfIN762uTe183H0DrfCObog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWV4XytodtWK9cZhF2DYenYLMbPLNGV9wdkukw1Fvx0=;
 b=R+zf04ZFBFo6zIo4zjIfqEo2Ukt9dxYFwXP6tucFrqtPZt4dY0R8533i1hQH1Fpf6w1amfZFhcLrKwtd3VsxJTuuIbwcJ51RUD51K1HTTals2CtW5O1Ki6YDVEBsAfM3Xxwq5v+zdF2nQpaT+i2yl6ONfEfSfZ8PhSFgzIhV9eP3zxg8vY75AXmdz8eD3iX6Woq4F+J29MOY5Bro6TMyUK8bUJHZM4scuZcyHqvw0UhZ0JQ+MZytXyCNqs3KTY2kUh+O1l7XbK0RWN8lDTkBkHC3WCofkwmQgs1yG8xuZhwWOSNX3gT96Gv3nEvWYfJWuxEM+HfhDLJ85L0gikBzzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWV4XytodtWK9cZhF2DYenYLMbPLNGV9wdkukw1Fvx0=;
 b=lb5U3svUKnfqyLMD3dhiuX+oYKxKRFOitSXcfGkySMxZR65l73KlonWZmu0X8O0LfEd9/Hb63tYL0JfrwqjBm/97Qt3sDBDffjv7AaxV91027ggLQHFpQhRfCbb6hteUrUY/GB4Q7CwO6WzRciRB/LVffF90MXYtjBIXc71s9F8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5029.eurprd08.prod.outlook.com (2603:10a6:20b:e7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 10:55:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 10:55:19 +0000
Subject: Re: [PATCH v2 3/3] qemu-img: Add --skip-broken-bitmaps for 'convert
 --bitmaps'
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, kwolf@redhat.com, nsoffer@redhat.com,
 Max Reitz <mreitz@redhat.com>
References: <20210709153951.2801666-1-eblake@redhat.com>
 <20210709153951.2801666-4-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f1366bd5-0386-6be2-e554-06c6d71c1f13@virtuozzo.com>
Date: Thu, 15 Jul 2021 13:55:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210709153951.2801666-4-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0113.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 AM0PR10CA0113.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Thu, 15 Jul 2021 10:55:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1e84b4d-4fee-4d53-b494-08d9477f0944
X-MS-TrafficTypeDiagnostic: AM6PR08MB5029:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5029D14260E98BFD6AFB84B3C1129@AM6PR08MB5029.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WfanMaZUiENlWRAVf5dBx9jRW1JEDAqwod8kqv5uNtEwhB2hX5a41m01zuBjZqKui5HpNbz/vj8p3cYAQwILbUkg/eghWirlXqVmwPlFsKKPD9MiXj+0mmni+v1VC4cAMDDVomvSgTl17UMsGibJdEvrxH7sV+bFckVQ7qcGfmjY9pIWjcY585yLqCo2C3zhyI3PNtBrzPdMNwYatjH/a4RVlf7wrNyyoaLfyovas5py+ksil9Q/pvmDU4A/0BXUKMRPvGu+nv4dU7CYdgUK9NSWbicE+ZAM5L95HlT2AIRyabat5g7gfDiiC7hc6nyTPTFqp0XUBAFT5oPAJNMK4Wyk2Dh1mDelt0hCsMpVI//HzD+JD3UPjAeZe7tdvxzaafiU3tDqHBxMXGAh2BIfhzKXM9i4wHYcaXWpBJBdoxBAjsyekVR5yesRsE5IjpVP4cPr4UJocflxFh9EfbWuAaYk4ZAElhO0JVeCW8/PvOsLYRH3nbHkT3n9MLLRNA26x4Z/KGDWfb4iRFWXL/FiJsas00g3/ajS9XzIWe6EqvOYZvWq0EfM4VZ1+L/ra0AnUTZpoansyH+OfVZCnwZWoIndxWuxWnZec1az5/CD92UQlXa+Idsabof/eVNugn66W0BUIUmkFT07azCEYJQTifOzjE4qosPxSxjIh/+h2kA1qxuXTFLUBTf0bGeEvZgq7z5CM66iJ4XDHXYrS7IuGBMaOT/YKGV/Pqt1M3sxs0pS9SNggdCErF9EDE9tlEsRcJO+FrStNosUjRL21md/c38u10N+7lqSzwgJg0GRe9IeiuUW+sp5VI4VS+NTiU/6SqFIE1fmpPkEPSeWe4bsDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39840400004)(396003)(136003)(376002)(8676002)(8936002)(956004)(66476007)(66556008)(2616005)(16576012)(2906002)(6486002)(316002)(66946007)(86362001)(38350700002)(5660300002)(83380400001)(26005)(186003)(31686004)(36756003)(38100700002)(31696002)(4326008)(52116002)(966005)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFFDdXg2aEZ0c0JKZUVuOGxCT0J3QkxidjloWTNSOEpiaXdxOE9WUTE2SXJL?=
 =?utf-8?B?eFJNcWJmbGJhUVdqUHB3N2dxY0xvRVdncWZMWldoZ0tKQXIrRFNXeTQ2NldO?=
 =?utf-8?B?N212eEVIa2wvaUtBcHJ6VHpZYlFIa3o2ZEtHa25ZMGhqVklqTm9KcFZRQ0t5?=
 =?utf-8?B?aGQ3RzlKRzF2Y0tlNTJuWnBJdXU0ZXdPbWJkL2NQYlB4RmdQV2ZDWDNqMmhz?=
 =?utf-8?B?STZOWkpxZG5QNC9HN3NvUlRqVEM1b0NvQVNhT0p0U2cyc3BUMmhhdXZXbVhU?=
 =?utf-8?B?eWVzOHNKOWRnSGJxVTlnTEFzMy8vaXVqcmczZU1EdUphMVBhV3ZzWVJaRE1j?=
 =?utf-8?B?bm9QYng4UkRtbmtwU095NENqSW5IQjB4bXV6TnA5bUs0L2ZaTkNYdkptSlBi?=
 =?utf-8?B?L2toRUFWNnB1SWlDemo5WnJ1YnRNQTBaWE83SEpYSVYrQ1A1ajEzR3F5RzhY?=
 =?utf-8?B?clhZQ0ZoV05qVTBBYnhST1gxQnhWZk1VcmdsVTZKTEJoUHpMeUVJTzRVNHVh?=
 =?utf-8?B?eTB3V1c1UzJQMU1kM0UrdzBIWDJYSEZGbmx1czBFTU1LZG9FaiszanFMSU53?=
 =?utf-8?B?a2hFLzBmNS9DNE02YjBjcDZYNFVsYWEwd01qeTBzYUU1dzEwUmlOWDNuemc5?=
 =?utf-8?B?amJRNVAyQ21HWWRhQmJUdmpTTTNWM1lwRlBZRytnZDl3RjloTVU1dTlUUWxz?=
 =?utf-8?B?NDRLcVBOQVJqeWlXUDJUTzZaaG51MHZCaWtzNzFWQlgzYk1GOVNEeEpwWlln?=
 =?utf-8?B?RndEbTRXYkxIckQ0c2VYUW5RNCtNSG03RUtxcVZNSjVwMjRQVUZheEJvV3Ax?=
 =?utf-8?B?VE43U2lwY1FLYlNCckFJMjRwZkc4NEpReFJlMExRbU9zcHJzM1h5VDVZTW9G?=
 =?utf-8?B?MUg3NG0rMjB4OVN6RTdXODQzWFNpUDRiQW02QUVlbHppZ0xZenFmZmJ1YVdV?=
 =?utf-8?B?TXBqYit0bFNKVThhMFNKSHkwWGZ6bm5Ia2FFMXl6Rjc3MW9McFM2ejJraUVu?=
 =?utf-8?B?Q3VhSi91MXVXMDVpaDFqTnh1eEUwbFc2KzhTUUdBQ0RYWDVrSEJDRVA0a3Vq?=
 =?utf-8?B?enpPL0VtbGRzc3RjYVFicHExOWk0aE9QSEhNRlUzSVhYVUhGTEJmVEpDRkcr?=
 =?utf-8?B?dXE5YVhSR2NJUlRYMXR5NXFJZFM0YlNGbXF4MEcvaGRGcFprdGhlaEk4dlhO?=
 =?utf-8?B?NmVGa3hQWlBUTHBneWFYdG1yUWIxdWlqQ0NoNzJMVEg5QUJuaFNybmhHWFQr?=
 =?utf-8?B?aVFNMCtvUUJ2eUNZOVdKb0NReitlQldCVnlaL1RSdFdnS3cvMDgyZFdwaDFR?=
 =?utf-8?B?NThxNUVSMlMwSmtwMmtrbGdUMzJNcjhGdnFGazlONTNwVXdsT3lJL3V0Z3Fo?=
 =?utf-8?B?VEI0anB4c0UzbElrSTl3VW16VWQwN215aWFXZjNia2Z3REJqSjJxUm4yN21Y?=
 =?utf-8?B?MnNST3BFemZQYUtRYXV3RHhqcUlzM045SjZMdDB1UE9kNkNCZk1BV1F1S1hQ?=
 =?utf-8?B?Q2xNNVQzMDQva3kzdnRIYjM3QTNpRDJpSFh1NGpPakZNUW5sdDJ3WWFuOFFB?=
 =?utf-8?B?c0Jvdmt2WGRyM2YwVU51UzBiMnlKVnFHOElSQ0RNSlBXUXRKMFhGcE9VZjJu?=
 =?utf-8?B?WEVwWlc0M1p4YlN0YkxaNzFGemVqQUpoLzhSVjh5T0NuTnM1bDI5UWxpQWZJ?=
 =?utf-8?B?c2xSeG96VTBPRXA1VEtBNnh1cU1MSXlDeFhCaG9OQTdack9uY2tQbkFNTWhn?=
 =?utf-8?Q?6mIlVvZE8ZkW9OkDDo8zrAlLs9tJKUFzgclQUkq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e84b4d-4fee-4d53-b494-08d9477f0944
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 10:55:19.2418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqQb+PUtLHFmmuCOP2McV/jS2x42DcAODN7KgcAOY5OUr9xbmE0g/ucgz7kx5hdYYYPf45Ir7InQLL7z/vi/L/L+QWm9y1fKnQjemSRsM/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5029
Received-SPF: pass client-ip=40.107.15.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

09.07.2021 18:39, Eric Blake wrote:
> The point of 'qemu-img convert --bitmaps' is to be a convenience for
> actions that are already possible through a string of smaller
> 'qemu-img bitmap' sub-commands.  One situation not accounted for
> already is that if a source image contains an inconsistent bitmap (for
> example, because a qemu process died abruptly before flushing bitmap
> state), the user MUST delete those inconsistent bitmaps before
> anything else useful can be done with the image.
> 
> We don't want to delete inconsistent bitmaps by default: although a
> corrupt bitmap is only a loss of optimization rather than a corruption
> of user-visible data, it is still nice to require the user to opt in
> to the fact that they are aware of the loss of the bitmap.  Still,
> requiring the user to check 'qemu-img info' to see whether bitmaps are
> consistent, then use 'qemu-img bitmap --remove' to remove offenders,
> all before using 'qemu-img convert', is a lot more work than just
> adding a knob 'qemu-img convert --bitmaps --skip-broken-bitmaps' which
> opts in to skipping the broken bitmaps.
> 
> After testing the new option, also demonstrate the way to manually fix
> things (either deleting bad bitmaps, or re-creating them as empty) so
> that it is possible to convert without the option.
> 
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1946084
> Signed-off-by: Eric Blake <eblake@redhat.com>

[..]

> --- a/tests/qemu-iotests/tests/qemu-img-bitmaps
> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
> @@ -143,6 +143,16 @@ $QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG" "$TEST_IMG.copy" &&
>       echo "unexpected success"
>   TEST_IMG=$TEST_IMG.copy _img_info --format-specific \
>       | _filter_irrelevant_img_info
> +$QEMU_IMG convert --bitmaps --skip-broken-bitmaps \
> +    -O qcow2 "$TEST_IMG" "$TEST_IMG.copy"

Nitpicking: sometimes you quote filename variables, sometimes not..

> +TEST_IMG=$TEST_IMG.copy _img_info --format-specific \
> +    | _filter_irrelevant_img_info
> +_rm_test_img "$TEST_IMG.copy"
> +$QEMU_IMG bitmap --remove "$TEST_IMG" b0
> +$QEMU_IMG bitmap --remove --add "$TEST_IMG" b2
> +$QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG" "$TEST_IMG.copy"
> +TEST_IMG=$TEST_IMG.copy _img_info --format-specific \
> +    | _filter_irrelevant_img_info
> 

With or without adjustments you discussed:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

