Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2984F2C21E4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 10:44:35 +0100 (CET)
Received: from localhost ([::1]:37676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khUsE-0003Kv-8z
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 04:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khUo7-0000wk-U0; Tue, 24 Nov 2020 04:40:21 -0500
Received: from mail-vi1eur05on2114.outbound.protection.outlook.com
 ([40.107.21.114]:2912 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khUo2-00034l-K8; Tue, 24 Nov 2020 04:40:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoIZBX/mJqNxbMXc7Ntf2wkNDEXya2XeqGXFGwSFqTvagH0Z1CuhJEDjOuNiqzCLoP+CdJNaXCqjCrAc6SrF/ARuNBXWdr11m2eZHRg9q7zG2IHbIodtQx41I5bXqvm8qO4ry4P++yjIQJTyO+OMhPajZLIwkEh3xNXwipuYSS3esnNmlIdPxhRfyB1exfI/KcvxPZ8TTJaNM8YTOMPoDveFMCx3RIPbLqwSTpJEsS3a/MOlWiIc9fWY3xaXPFXZl8I942+iUlBJkAFBlZCXlmGlxVpQoqx9iOIvT7U/Yxs+rR4gSgnG7495Vg1ZVc+8VK5ec/R60gwIsjDLzqgJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJkhRWPXeYTw3Jr2/5P/R7iK/WAyQIvio1weXVQ219k=;
 b=PhlJXR4JuyipoEAjz3Dc1X6Kz5ZDaOCStbBV1T3yVSGZIxnzQ3fQod0J2WVz8EXfkjqJLNQwEM0kyX1nQMw1L4B+1IBwGoe78EMdYulvVAtEdQrOrqoCGiyoHdM0J6xfi7r+WPFWSoW02HYNpjoKq+gwiraN9KebTrznv5vzNoKusax8+ilNAndLewPcPwWX/cEFAB4etmAMuiKUdqmRIIbfds1dNg63cy+tnRfC4e0gOI6je6JNU+BOwOvnuu1MOKMNrpTaF64SeAvQYwF0rVMiVO1nGfIFU8kkPmTyZfT96YkuaR+/1iGqXtSq6wXhOAfaMAbr6A39ksVAonmQSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJkhRWPXeYTw3Jr2/5P/R7iK/WAyQIvio1weXVQ219k=;
 b=PGDxGv9RzqyQlyOc4BN2veFv4T3OdrnH2sKtPSlbojPY92t3dk45k3rl6Ygh0XZY27xtrQWeD1FLsDsF5OZKT5rHdboihPnBqGgofrYvlELbhMMWw0oUZltQuG0zWNvVqD/GCDNhfvl/7MJw0ms9EvxwavaWKJdfugNMfcqLfdU=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5990.eurprd08.prod.outlook.com (2603:10a6:20b:296::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 24 Nov
 2020 09:40:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 09:40:08 +0000
Subject: Re: [PATCH 2/2] block: assert that permission commit sets same
 permissions
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
 <20201123201233.9534-4-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9698b193-6eab-6e99-5e37-84a642170d0c@virtuozzo.com>
Date: Tue, 24 Nov 2020 12:40:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201123201233.9534-4-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.100]
X-ClientProxiedBy: AM0PR02CA0081.eurprd02.prod.outlook.com
 (2603:10a6:208:154::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.100) by
 AM0PR02CA0081.eurprd02.prod.outlook.com (2603:10a6:208:154::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 24 Nov 2020 09:40:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 704ad251-c27f-4d9c-a575-08d8905cee7d
X-MS-TrafficTypeDiagnostic: AS8PR08MB5990:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB599056D2A585C2F14DC7EFF4C1FB0@AS8PR08MB5990.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jg34V7+yt8iJ25B4I1q/04LAYirciPPbYyWOrGBjsH7PP0mA7BwP9TCyj9v3OPF8W4oymdUT5e17qV4vR0kFgdaMHtEpu03816xTy279UFEdjJhCSM49fSNOJj7V01F+1kQqUa13qocOZ8Rijehs7mPfZlWzRLTRkRQudvO+Xe1MV//bqYjcqfTLIki0pq5Vyw30LVXYv949vW//N1bSa1N/M2BiJLP/tKurRRXyecZj0Afhq8SyHKmJUuw264/Tb240f6Fv4Dgh/nX0MQv3Ed0o5+qE/c5PAtNwCoMJNdBV2fU25+ZpCQP3SstPKTFXftP1SeE3Mw6h2j4Md/qSlA6VwmwoLmvc3sv27txfrHhWN8LzrCd02ZL5Lk1EeyCu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39840400004)(346002)(136003)(396003)(26005)(83380400001)(16576012)(8936002)(316002)(31686004)(52116002)(66476007)(66556008)(2616005)(186003)(2906002)(6916009)(4326008)(956004)(66946007)(107886003)(4744005)(5660300002)(16526019)(86362001)(36756003)(31696002)(478600001)(6486002)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: iRUMGgVrUfMQ9lVmCmucJ9yzLHk+9rQVyYq6ZDeiEPNSYbzw7D5bWPnD0NKwUoomdkKDrewKHlNtAWQr426VPm277GkezqoN8f36FhocRzyiFAMyqAD3N6OOMmZNujIKzjlUSTP1hFeEmz5O5Vh79GNYC6s8e9o2n5Az7l9m37hOIovW3lsHh/J/GNYv8w8Cfua52/bYpWfyk0ctWQoXsJ0FcAzXZNbFycjzSHr6/F8rc9jaBQISOr1nrM6hXp5tbumGYIZVBWAIteUSOzMJZNQ59kWOApNkUhPR0BtMBMZO4k6bqXKo7aISZ2lysw7VR62djobaXwvR0+T5CwKI38TVBTVFtOb7D0kZOhqFSBxXKvS1x1bDPezwkhwmoGAgLRWNEPy0DJaWM42lxhUpK47+5x3IH7vpBaGws6F9viuzwBYKJkEVNuPWfvEPWXEqEBcRRuEWm2FH9+7J9ldYL5W2SKEuaX3tx2Ie+ROoFkCrGYp9w9TtGbTmwooClimFxLwl+NjARK2RNfK6ZRT5MPR2DxZSMhwHR1ZTECwEimAPMmNFbBz/KRKwsi/B1K/YvpEkKZnmqXbRTnuYnFEWQCKoIAWo4/OcfiDaiH+xVlr9pipTA2z+w8ZTLQ9g8LZsarg0ZE6O77x0JqL77Jc0CjTyVEHLV5+uGzHOIA3X+6tJ59h1uDLBSE/egDwF2Ta8x1SvXJS9b2+bCyXjjbo7T7epdm9Y2yNlR/RvVTDTve/A64Yr2I3PF85Cg7CAVAwUhJwQis4yyqAo2yWfmrlbsRXGjkF0AgOveoUUT0YVTAgPXPPrf/3negPtCtLpyO2m+1EZ35NDegmfUZ2Sr2wSgN/RWNfPwgYeB3ud8OZMKKdEuZeVCGA7s7DhmeM3MIM9lhUXsqPjyohYpZWTjs5O+w==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 704ad251-c27f-4d9c-a575-08d8905cee7d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 09:40:08.6414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCN4ONCKqsU+QmS423zflSI8CGn0jZ91Z7h0YYAPN4UGjcwBfWqjoomWG8iKtuZnG/R/PL5Yjr7GPSj5XXd8YjXtbiZbTXRagGY7xkeEQFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5990
Received-SPF: pass client-ip=40.107.21.114;
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

23.11.2020 23:12, Vladimir Sementsov-Ogievskiy wrote:
> On permission update commit we must set same permissions as on_check_.
> Let's add assertions. Next step may be to drop permission parameters
> from_set_.
> 
> Note that prior to previous commit, fixing bdrv_drop_intermediate(),
> new assertion in bdrv_child_set_perm() crashes on iotests 30 and 40.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>

this is accidental patch, ignore it

-- 
Best regards,
Vladimir

