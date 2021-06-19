Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8203F3ADA58
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 16:15:36 +0200 (CEST)
Received: from localhost ([::1]:42744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lubl1-0005xV-3r
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 10:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lubjX-0004rc-GZ; Sat, 19 Jun 2021 10:14:03 -0400
Received: from mail-eopbgr50103.outbound.protection.outlook.com
 ([40.107.5.103]:32582 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lubjT-0007Ad-Ne; Sat, 19 Jun 2021 10:14:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AN/u0ashXZp5IAJTvEEizNazvvt5MRqpnOMw6hMTn3MCd3XllULqN77M7Lm3fmNMe0DxA3wTQpYsJq830kIqrDFwukZYQv5j6rrD9y9HLBJ7lTxfvaQ1K8Y6Wj8J82V0JEDINH1qPYzaj4WD1QaErn8QyDDyde9UO3SEDEnriKUsQEQ/hsFJ8SpHV2Zo5f6p7lgFVl3cfhBPNjZjKPM3/cabN5ShgE8LJWY9bHh4yQfifipuFi9X2KeI1UTVN2EFsGsjflCJrfH7yzVxg/OaCa20Le04Tq5D12p7245pHoSMerQITWm988/zosD8XgZQSKXqD62x1DtR3EbvnsLzAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5cHMqtNCytvQD5BLGdn0dUjiAaNY3i0hbnTOezK05c=;
 b=jZ/wjqBa9XdEH/K1MuIp5QJ8OhteLPUEsVwMHuOBaklom6ipyusy3QnLdSSaLBgZiYBbfgi9dNlydGMjNcgoHBm6PZRr5RRSCSMfHGhTtPmST0OD2VElXnGEytncCf53f/qM9b50k6AMMe1qNcZ0Yf8r43G6pY47oSfyHbhOxqKUiUG4no+Hk81j8u9WPnRoTcO72Wb+6OFaPgiPX7RqZt/CvcMGUakjnu73SjjCVUtRlE4dViuBlmubns5DCn0lL/spdTaerb7VOyfpCVozfVMimJ2V3TPvp+TGdeEKyOccR7dGMmnfrjCvkUEvGDNtlInas57nZrCS3BmTxu57HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5cHMqtNCytvQD5BLGdn0dUjiAaNY3i0hbnTOezK05c=;
 b=HI/1zj5IKf3ls2MakH7klcpBU7xUvEVgP8DCrSmgSrfvP/2skgt4gj7bA50uDWnyvSVb8BKRrLczZaCn6PQxB6fcu+nSJ/gWD8WaqYCCmOHVI1g8SLF8+um1XvYO0NV1KsQK0bagZrubuh7CDtNA41qUNqt+/6oiZZLvuUFPT7o=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1649.eurprd08.prod.outlook.com (2603:10a6:203:38::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Sat, 19 Jun
 2021 14:13:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 14:13:54 +0000
Subject: Re: [PATCH RFC] meson: add option to use zstd for qcow2 compression
 by default
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210617195128.66675-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1b38aee8-f1e7-c80a-6e43-5e6e75dcef38@virtuozzo.com>
Date: Sat, 19 Jun 2021 17:13:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210617195128.66675-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0402CA0045.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR0402CA0045.eurprd04.prod.outlook.com (2603:10a6:7:7c::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Sat, 19 Jun 2021 14:13:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef36fd67-8716-4646-9622-08d9332c7894
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1649:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16496B3D86B16E34818B1113C10C9@AM5PR0801MB1649.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NJLwC2RmVRF8RTks3k6nFhW8hMTEvy1wyu6/XnB9rDhvkXaARDJML9OQh/Ea9oTmNvjvGtjxYg27VtXd7LoxIsRiE2t344nGftst2SuO9fGlDVc0KnqmsIVkvC1xX0hq9CI8ZgNf23HIy1cHMZ9rOBPZNBulv1HdxPlUZgzUUMFJxHqPnADND72ZovBR0SVWMlX0kXmHz7RmQO8xCVQ7xTWxIlIVvb/F9lp1sDqtMTHLEvQoT5uBllvnd6Uq2/cCxPhnzLA0X/nUsth7wwcNylbpR4mLGoGtHG6xYcSZ1eS4EXAhRx/oYqi367uAD/hyYCf+QazteMpT+62ijslHN1kc1KsPb0TlLGtLpIs9Zy1+rt7HipN/FDBjrRsFYhbI8KqriqJTIBYp9WalEw5NRA/fT5LGZloEneuSq6Q4hWtaqRpbJyquuYLlqejM8gqFb4JSQboBRCKZw9tPA/vWNB2FJJc+FgmqJPHTo44g3mextCOTD4Oc3J/QjNTzDCV45HdCBuPgHTutugHiRxn4eqjsl0U+K+/PlKwa97WoSZnTFJAGR4MNo9++s1I5UujLZrTiORce8QMT/H9UPTWsV30jOgEM/zpdVSOuQDCUy+19NX3b4Q4BxmRfhWNMwvZNr1smdzf1dzT3RonGuei28AB9Nc32vhAeYDZHK/lARct9+/3ljk3VV3/wpyrkPULkEu9A2Ktpzx9cqYlqcDlWxMKPq+XsZ3ig/ofYI+39A4w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(346002)(366004)(376002)(136003)(31696002)(2906002)(6486002)(4326008)(956004)(38100700002)(38350700002)(2616005)(31686004)(6916009)(16526019)(186003)(26005)(478600001)(8936002)(83380400001)(52116002)(107886003)(8676002)(36756003)(16576012)(66556008)(5660300002)(316002)(66476007)(66946007)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzhob2FUZnRXejc1d0RsS2sxOVZQYkcrUk84amlrTHNNUUV3Q1JmWXh1Vzdr?=
 =?utf-8?B?OHQxSUExOWQvWmhUcjdJYytuL3lXY0lTbHRaa2pacHpBanAyQjhxaDB1Nzlt?=
 =?utf-8?B?UnZ6SzJ6V1J3R2EyQVR6UmtjaUx4MUdmSjcySkpEN2RPaXIwSHZnM3JBTU5Q?=
 =?utf-8?B?VzVDajVad0p3d2JsVjd4NmdLeEJDS1k5NGpob1RCQjJrRkFHdTB1a3pzMkJa?=
 =?utf-8?B?VkRSN3NMcHZORlg2OExoY1N4S0xEZkZXRjB2WEZ2cFFCUjkxUndjb01Iby9w?=
 =?utf-8?B?SDFubzZDQmZoZVYyZk5EVWV3cTBlL2FTSGo5eVZ5Z1dmVG41UHFxU0wxVFZE?=
 =?utf-8?B?TGlPRytpbmJpc3VnSHFUTVBSRDN5RFl0L2gwelJUYnorNUxtaXd4bFBHV0h0?=
 =?utf-8?B?MVRpcFFzeWVKK29oNjNZbUFNcVRtY0lHL0JjMDdWS1F6YjEzMmpBU3haZXlD?=
 =?utf-8?B?MVNJOGNReGZCRkJKTGUybENoNTFSMmlla3Y4aFdjaTdmZFVSdU9mTXRuTCtk?=
 =?utf-8?B?c0pKTTV1M1Vsek5WVmFHdVE0K0oyL3VMYjlsWEk4cjVRazZyeVQ3VHJsUEQ4?=
 =?utf-8?B?ajFIcThSYlNYcExQYzUwd2FMUGZTN3BUd1UyNTZaZ2RkeTBNQ0J6N0h0MENt?=
 =?utf-8?B?WkoySGR0dzhnSXV2MmppQ2xQenhDK1I3TFhsL3pGckNGUVRTOGNDMnFSdkpC?=
 =?utf-8?B?VlYzQUVBazhMbkxzdkpxRUdkdTFrOWFpY0Z5ZGpOcG9MSUh2RUlFYlY5aEVO?=
 =?utf-8?B?MFU3Mm8wZUtKYXBuLzcxQWZ0QjB3T3Z1S0l5ay9pMGpxaUs4czRvUnZNRWpJ?=
 =?utf-8?B?VEFMdU04MGxjT29OeEV1dks1ZlY1ZlpJVk5jZHArWlpQUVpuQk5WMk1uZERi?=
 =?utf-8?B?dTlPVERuZlVBanZwOTQ1RHdJd0Rrck84b1VncURxTE0wS3hzazVkQU8xNXVS?=
 =?utf-8?B?Z1pPTUlMdGhsVmtGQlZjdVFKVUxpNFJCZldrUlN1TGE3dE5jNmUyZXJnbVc1?=
 =?utf-8?B?Z0lzdWxRQThZR2IxbFVlRUZiQXhreUpabGpQN1IwOWtBQmdSTXFXZm5vUlpU?=
 =?utf-8?B?K084aTZ3dVJhdyt5a0FzS3Y1aTdKVW1pQjExK0d2dlExQ3B4WGhaMFBlNWhD?=
 =?utf-8?B?a1ZuaU41ZzNKanR4d2tud2xlb1FlNDlxYTd2QWZOZ1BxSmVwUFp1MzRwR1pW?=
 =?utf-8?B?YlhUSnlmSUFTdjlmR01OVkpaYXN6aFJKS2VRbTFaWDVhV3B2anMyZno0SXpy?=
 =?utf-8?B?bmJkTUZoWGJUVmJqaTU5YzE1dzNaaStJVlc1cVI4dm1ZNGxOL0dMQmNoMkh0?=
 =?utf-8?B?YnU5bmliYUpYMFJLUnFrSlBNTmNMamZFQUYzVjNpeE0vSmpFYUxYQWJ2QU5K?=
 =?utf-8?B?bVBmVW5SbjVMMEFsdXVRbTNCeG80YVdXSTFNVzNSYzdCUDV1RTB6d0h3Rmo5?=
 =?utf-8?B?a0IreVAzODVjT1NMVTI2bnRVMko5SWdXTTVudEJJRURFS3JTKzRHQXdWd1FG?=
 =?utf-8?B?eFE1THFQTkZRWi94YVZTTzQ5UzlFL3lreFpVeXNHb0RuSUh5ekt3WDlmNHkw?=
 =?utf-8?B?V2ZEVmFrVGJuYUhJYy9GQUphVm4xS0c1T25oYSt1TTBpdVBGQTNXSlg0ZGZJ?=
 =?utf-8?B?RjUvTGhmQTVacUhWczRTeFBiNytPVzg5TXFiV3VaWThYR2h1U1ltd2RGVVpF?=
 =?utf-8?B?aHBIYXROQk56Z0g0bXFvQThCTWtScVdua21uRHFScjUraXUrRytYVHdTQW1z?=
 =?utf-8?Q?//TziH+iLWCiB3X6gZ9lZdPTcRWOnyLkUF3g5Ci?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef36fd67-8716-4646-9622-08d9332c7894
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 14:13:54.6049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkZtqc9Iv5UUe2Dm5JcKS4zTVqodL4WVuOqctI1lzLuyQz0lw3L7IWgUdj/drtyXv5iragyrDQKCL+fl7rK/q9/x8kVVJWtMwm6jvrBK5Ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1649
Received-SPF: pass client-ip=40.107.5.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_NONE=-0.0001,
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

17.06.2021 22:51, Vladimir Sementsov-Ogievskiy wrote:
> Recently we added support of zstd to qcow2 format, as zstd seems to be
> better than zlib in general, and which is important (as qcow2
> compression used mostly for backups) compressed writes are faster with
> zstd.
> 
> Let's add a build option to use zstd by default.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> Hi all! We want to use zstd as a default compression type for newly
> created qcow2 images in upcoming Virtuozzo 8.
> 
> I am not sure, how much the community interested in such option,
> probably I should just keep a downstream-only patch changing the
> default.
> 
> But if you like it, I'd be happy to only set new config option in our
> qemu build instead of maintaining extra downstream-only patch :)
> 
> So, it's an RFC. I also can split the patch so that refactoring of
> qcow2_co_create() go in a separate preparation patch.
> 
> Another RFC question, shouldn't we move to zstd by default in upstream
> too?
> 
>   configure         | 10 +++++++++-
>   meson.build       |  4 ++++
>   block/qcow2.c     | 32 +++++++++++++++++++++++++-------
>   meson_options.txt |  2 ++
>   4 files changed, 40 insertions(+), 8 deletions(-)
> 
> diff --git a/configure b/configure
> index debd50c085..b19af43525 100755
> --- a/configure
> +++ b/configure
> @@ -385,6 +385,7 @@ snappy="auto"
>   bzip2="auto"
>   lzfse="auto"
>   zstd="auto"
> +qcow2_zstd_default="no"

s/no/disabled/

>   guest_agent="$default_feature"
>   guest_agent_with_vss="no"
>   guest_agent_ntddscsi="no"
> @@ -1318,6 +1319,10 @@ for opt do
>     ;;
>     --enable-zstd) zstd="enabled"
>     ;;
> +  --disable-qcow2-zstd-default) qcow2_zstd_default="disabled"
> +  ;;
> +  --enable-qcow2-zstd-default) qcow2_zstd_default="enabled"
> +  ;;
>     --enable-guest-agent) guest_agent="yes"
>     ;;
>     --disable-guest-agent) guest_agent="no"
> @@ -1903,6 +1908,8 @@ disabled with --disable-FEATURE, default is enabled if available
>                     (for reading lzfse-compressed dmg images)
>     zstd            support for zstd compression library
>                     (for migration compression and qcow2 cluster compression)
> +  qcow2-zstd-default  Use zstd by default for qcow2 image creation
> +                  (requires zstd enabled)
>     seccomp         seccomp support
>     coroutine-pool  coroutine freelist (better performance)
>     glusterfs       GlusterFS backend
> @@ -6424,7 +6431,8 @@ if test "$skip_meson" = no; then
>           -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
>           -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
>           -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
> -        -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
> +        -Dzstd=$zstd -Dqcow2_zstd_default=$qcow2_zstd_default \
> +        -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
>           -Dattr=$attr -Ddefault_devices=$default_devices \
>           -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
>           -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
> diff --git a/meson.build b/meson.build
> index d8a92666fb..3d65b6c46b 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -484,6 +484,9 @@ if not get_option('zstd').auto() or have_block
>                       required: get_option('zstd'),
>                       method: 'pkg-config', kwargs: static_kwargs)
>   endif
> +if not zstd.found() and get_option('qcow2_zstd_default').enabled()
> +  error('--enable-qcow2-zstd-default: Cannot use zstd by default without enabling zstd')
> +endif
>   gbm = not_found
>   if 'CONFIG_GBM' in config_host
>     gbm = declare_dependency(compile_args: config_host['GBM_CFLAGS'].split(),
> @@ -1168,6 +1171,7 @@ config_host_data.set('CONFIG_GETTID', has_gettid)
>   config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
>   config_host_data.set('CONFIG_STATX', has_statx)
>   config_host_data.set('CONFIG_ZSTD', zstd.found())
> +config_host_data.set('CONFIG_QCOW2_ZSTD_DEFAULT', get_option('qcow2_zstd_default').enabled())
>   config_host_data.set('CONFIG_FUSE', fuse.found())
>   config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
>   config_host_data.set('CONFIG_X11', x11.found())
> diff --git a/block/qcow2.c b/block/qcow2.c
> index ee4530cdbd..06bfbbf7b8 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -3540,17 +3540,36 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
>           }
>       }
>   
> -    if (qcow2_opts->has_compression_type &&
> -        qcow2_opts->compression_type != QCOW2_COMPRESSION_TYPE_ZLIB) {
> -
> -        ret = -EINVAL;
> -
> -        if (version < 3) {
> +    if (version < 3) {
> +        if (qcow2_opts->has_compression_type &&
> +            qcow2_opts->compression_type != QCOW2_COMPRESSION_TYPE_ZLIB)
> +        {
> +            ret = -EINVAL;
>               error_setg(errp, "Non-zlib compression type is only supported with "
>                          "compatibility level 1.1 and above (use version=v3 or "
>                          "greater)");
>               goto out;
>           }
> +    } else {
> +        if (qcow2_opts->has_compression_type) {
> +            compression_type = qcow2_opts->compression_type;
> +#ifdef CONFIG_QCOW2_ZSTD_DEFAULT
> +        } else {
> +            compression_type = QCOW2_COMPRESSION_TYPE_ZSTD;
> +#endif
> +        }
> +
> +#ifndef CONFIG_ZSTD
> +        assert(compression_type == QCOW2_COMPRESSION_TYPE_ZLIB);
> +#endif
> +    }
> +
> +    if (qcow2_opts->has_compression_type &&
> +        qcow2_opts->compression_type != QCOW2_COMPRESSION_TYPE_ZLIB) {
> +
> +        ret = -EINVAL;
> +
> +        compression_type = qcow2_opts->compression_type;
>   
>           switch (qcow2_opts->compression_type) {
>   #ifdef CONFIG_ZSTD
> @@ -3562,7 +3581,6 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
>               goto out;
>           }
>   
> -        compression_type = qcow2_opts->compression_type;
>       }
>   
>       /* Create BlockBackend to write to the image */
> diff --git a/meson_options.txt b/meson_options.txt
> index 3d304cac96..8af9bb97f5 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -108,6 +108,8 @@ option('xkbcommon', type : 'feature', value : 'auto',
>          description: 'xkbcommon support')
>   option('zstd', type : 'feature', value : 'auto',
>          description: 'zstd compression support')
> +option('qcow2_zstd_default', type : 'feature', value : 'disabled',
> +       description: 'Use zstd compression type for qcow2 image creation by default')
>   option('fuse', type: 'feature', value: 'auto',
>          description: 'FUSE block device export')
>   option('fuse_lseek', type : 'feature', value : 'auto',
> 


-- 
Best regards,
Vladimir

