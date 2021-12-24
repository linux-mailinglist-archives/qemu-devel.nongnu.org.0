Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532F847EFC2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 16:07:26 +0100 (CET)
Received: from localhost ([::1]:35780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0mAG-0002TS-CB
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 10:07:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0m7Y-0001TK-Su; Fri, 24 Dec 2021 10:04:37 -0500
Received: from mail-eopbgr130117.outbound.protection.outlook.com
 ([40.107.13.117]:13534 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0m7W-0006ZB-EA; Fri, 24 Dec 2021 10:04:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVFoGt0eCZ9/l+CxQkalWPVTXxXyQ8f5DeAw8e5ERoa9Q58n6OTiCjacCF5+StUPaFP1owk/IHhy+gpVzVkuTiORhpdF66BE4A8O1TgZrrdT1WlkXyOGExmteDN9zcmJIHkJeR+vhx85svkEdFvwrItVROQNLvZRpuxG+1lwrOJjrser+Kw4FyL9aeItNruL02vVsRuMnmFhCXeY+9I+7Ln/TvBOHuX/KTU1odX48v1OXnjpIc1OitjcqI+rnaUDUMuZP0D0x/21m1JikGrV6aim5yI1Z1IshLG4PNVnQnDJ+XypqGMbXiX/KRYmRgO0JowHMYkedJb0HuUlJjcvqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRBHjlGrJuq7Np+oWW2EPdWj1SZruRBKLBFSCLHLtpM=;
 b=Cbd4AhFNjUqNJ7Ac6IFW3TcNGrnWBxAFjpKnBFm9iQwM5X47+ph89U3IvqZlmoX15bNsB8UqqoL4Z62ecHKr7bRon1m2X3377vZrXo53TCJhxUtK/dNoEnygrad3P3SiiO78at0TvOnz/RoUmhBTSNvu1F2xgzsp7DBjUFUlwbR2p2aSoyOwHpuW2pQuRI9n1XM03s9XJ2yx3MGREuAQtDHESR/UBFM9j7ow19GfMIyCSDcj98y6ZkSq3ko8gRBnSWKyF4xRseWf7fNrv9VVtGDD7HB4LLAJcFt2I6wCUiGQx1iKQrR9RnLQnCxvAyeCcIGuiqKj3rEdhLDNSpngcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRBHjlGrJuq7Np+oWW2EPdWj1SZruRBKLBFSCLHLtpM=;
 b=ib/gTR99lgdYdIo2/N3q+ArJpP6UXhQUk9SPuMUogvKCo2VOWRB2J2lULlbxJxKwZXDefXhk/J+WTC6ntxTkackwjNshc0Gjq6rGIxRggHGxTsSB/AOHu37kUHZWgHXBYverViqeYCweES4/8bk0qk6RT7TW+bSi/Uoyqu+KY/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6740.eurprd08.prod.outlook.com (2603:10a6:20b:305::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 15:04:29 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 15:04:28 +0000
Message-ID: <b1e1147b-1495-1b54-81cc-3a867c3f34bb@virtuozzo.com>
Date: Fri, 24 Dec 2021 18:04:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 10/28] export/fuse: Pass default_permissions for mount
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
 <20210709125035.191321-11-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20210709125035.191321-11-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b84f8fa5-021b-4d18-fbaf-08d9c6eeaebf
X-MS-TrafficTypeDiagnostic: AM9PR08MB6740:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6740F3D49382F95B211A4E81C17F9@AM9PR08MB6740.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rPT2Gz/D0ApzMR9kcSyyOzPT76qptuORolTqHa1M07lV1JJmoLJG4KnMx0EgTUZlrDYGI6QMkn1NnzHsIe6g5l3/CK/PjdCM8duV4OQzGg67zqCLNBZwojI54o7/9vN8adZsKaqXeGZkgmaGLclAFaNNoOvWvA3MZQLDLVvkX/Q+al9mLzQf4jSVmDiCm38jDvelHLVLtEHk3NVxBJ6GX1iM0vlCOBmdppZ3NG3r3pFnSzorfv8y2nvQbIki6sKpep76DVgHHJVo+bLIGMp75CTeAIcsibY5OCSV9G+sFjFQmXKFDzpDKIRfaFVbfNCEN3/+OI0F22mvMBKosfhtjsyX+6M6LOz8Dw46BJ9gPcSmaGoFid+mDqHrZONn9lIugwBlOqBf61/6ViKwLgQePYUaaBHOljx9SY2Wah5tIX5V9khVFt8G3oVvXjnBJeuGSlESVV1TeqILHwH8bYBlE5jAeR68lQ4queUT6hguslPl9OSuHi4LZQToMGYc2tdrO9oc0GdqtmMK/QO8daqQqlcmvd+5kJBid2HInstXFvtKrj3bbl2vKwtGNVHMF7h3kZ8P0bk4wjUidT8UwrE+a8Eb4J/jcTcsi2pg7h/2YY1lgvVyPwRtVGdte39Jr4O8zstp5v/8gNLbFMjEzgyxgkmlskVpEmm5JuzS07fKwC+v8/fIQ6bJBHclj7qQfwU8fD68y0n9jriktyqxq5MkOQe1TLp5IUTZzWjeafO/tz5vzvAr3x4+7VJAnAXmV8lt1cNnFItpu71YedfYaeHfWkQntXg8Yv8QoU27/wyAg7Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(8936002)(66946007)(508600001)(66556008)(66476007)(31696002)(4326008)(6506007)(52116002)(6486002)(186003)(31686004)(83380400001)(6512007)(2906002)(36756003)(38350700002)(38100700002)(26005)(86362001)(316002)(5660300002)(2616005)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y01OeW5sSXZWUnZrVTltajlnanpEYldFT3kxbjU3akYwYmY4cVRMNHJLclJr?=
 =?utf-8?B?L2llZFEyVmFKUFpXOFV2R1JlL3JYQlJ5VlRCZ1V4TmFENi9iVHZGWlNlVmlK?=
 =?utf-8?B?TTFNWkplQVZySzFQS003R1lRQTBkK0hBWWJGWmtrSnBPWkR3Zm1RZHlDUzNB?=
 =?utf-8?B?N3hrOW9BRi9paTVKdkxLam5WaHdXVU0xODV3NzB5a3U2cGJRdmdBa1dONU1q?=
 =?utf-8?B?RVdvenRHOUpxNTB3a3ZHTnBCS05Cb0pEZDVsUFpJR0EwVDdhZ0FUT0lIczJF?=
 =?utf-8?B?L2Z2WmxGV1RxYy9DQUMzcUFHeThCN3VqSDZ4Q2ZHSDR2YU9ncHl4VS9hU1BJ?=
 =?utf-8?B?cW5kRjNRcDFGM2xVeVp5dmk2VHdwdWNBb1huWTdEaG1VeVZQYmh4eElFSldU?=
 =?utf-8?B?NEVDazZUeit3bHpBaVgwT3dQTjFLWVpmR3BLNDdyQTZGOVRCTy9Zc0E1c052?=
 =?utf-8?B?cVhKVmRkSS84ZUgrTXlCcFUzdHBuSjg5bkYrcmZBZ3JNVlM1dmZoRjhPTE1D?=
 =?utf-8?B?WWx6Z0hVUjRqdDVRc29QN3U2eU5VODJKVUtQMGlyZmtndTZ6akYydkl0dnRl?=
 =?utf-8?B?UXlseitzNGZMZ2FidGpxUGtSVHo2S2Q3WXphNER4YU0yVUloTG1XOGhYeDgz?=
 =?utf-8?B?YVY0STdWd3dFZ3BOeDFuNUNobysyVmtzYk5WcHpFa01hdkUxSTl6U2VFNlpN?=
 =?utf-8?B?cDR1YmQ5blRKcHZIWEYrd0ZCempuTG5NSG5JRkZROSs5NTluejhHQVJGd1ky?=
 =?utf-8?B?K1pGT1BReGVhUjdxU1ppZlZvcjAyYjhOZWY1YVZwa0MxMGE0UXVpVXp0akp1?=
 =?utf-8?B?UHhFRzc1TmsyMmdRVGt2bjVleHJsRG9mL2xBSVFnTDU3Wm4xdi9CdTN4OG5E?=
 =?utf-8?B?NDZNUzNTblNDWDE4Z1FNZ2dhL0hoMlBZczg2THcyTjBFZzNITUVGeGUzQVl0?=
 =?utf-8?B?c2w0R2dodm42ejVxYmo2bFIwVUNCUkE4S3hjT2NoVkZkQWVDYlcvSUNxdktw?=
 =?utf-8?B?T1ZDbUdWdHZYRE5NS2ZQVVVQSWxhUVkvakE0ZWEwZDVrWGtBWVhRVi9aR2JD?=
 =?utf-8?B?ek8wNHRLUElqMzB5RFNYeUJHT2UyVkZKSm0vUXNEZ010VXBLSlFXT1N3NDdL?=
 =?utf-8?B?OXZZdjZXZVA2Z04yb293NUZqT0NJYjFWVmZWZGFEOWNrY0hXckZadGdzUjNV?=
 =?utf-8?B?OTNpOEREK1hUYzYzMnZGdGloVkN2K2FqSmZrSHJnQXVxT1RUV1J3WFhqMnRR?=
 =?utf-8?B?VytNU1YwWTVJc1JrMHI0NFVlNzE3UHMxeGtiUjdlY1FhRTFXZkdsb1prQmdD?=
 =?utf-8?B?WjlCZ2FPSWttUWx2K3FtbFNvRktIS1g4NFcvdWpSaTFWWDhZd0RheFcrRG5y?=
 =?utf-8?B?WmFCL2dIajJJb0syYXRRVEFSTTlMWjQ1cTJVSUdLZlo2ODgxblYrcWM1WDFI?=
 =?utf-8?B?S1lLM1QwcFR5MHQrSVVZSnhJRi83RUNoMGwxQ2NCN09LQndWakI2RUdXWTBv?=
 =?utf-8?B?ZzlCL2Erb1M0WjN2SDN5VWdVVUgza0JvcTJRbWNMVTZHUUUwWHZucUx2azc5?=
 =?utf-8?B?YllzSjE4UHBzQ1BSMk5yV3k1VjlFWGt5QmxFT0RmT210STRDWEsvMlZJWHJT?=
 =?utf-8?B?V09oSzkyWFhodjRkQ2xXbHJneFhWSTZRaGdrWFFWckVUeFlSMldXTXFaMHkr?=
 =?utf-8?B?K2UxSXhrdWc5MDcwS1UxbTI1aVA5VmRta2tTQ0k4Y28wNXlFQktoTGM2N3Mw?=
 =?utf-8?B?YUkrNjVzbEQvenFQWEVYMlZOQ2JGUFRmY2F1RWh3VEhnbFRlS2hNSDhmaFZa?=
 =?utf-8?B?U0dUdWE2MmlzM3JRMThyOGFubzdSZTd4YmYzdUZrejBJSVpMZ29XQVFqSzRS?=
 =?utf-8?B?TEhtTWVickFTblZYWThPVHNRRW1yQ0F3UWRxNm5wZGp6dVo4MHVNVkFiRTJv?=
 =?utf-8?B?ZWRLRHRMdHh4SlVrQWsyNlZCdThTbTdOVDNYU0ltaFNWZ0NxSExiOUNGRTdF?=
 =?utf-8?B?OXhtUXh4Qm9ZUE9oeXlBV1RwRVYrQVhkWHgvNmM3L0VRL0xIekhheXptSmRG?=
 =?utf-8?B?c0VVdkREYUUvTHV2ZWRCdEQ3S0hmSWVMWFdWd0NlZUluc2k0cm1BaVhLc0Nr?=
 =?utf-8?B?V25TTU9aOG5PckRNblNNK2lKY04vaUNQWlFKT2pLNUpOMXpGQzhYSHZTbThw?=
 =?utf-8?B?ZmtITFhtWjlhcjJFWWN0VDN5MWZxZkY2M093bGpNZEQrM2lNeVI2Y1pwK2lx?=
 =?utf-8?B?N3dLWndqdmh3LzRwYzJtZmU3MGxRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b84f8fa5-021b-4d18-fbaf-08d9c6eeaebf
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 15:04:28.8469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WyVHrt1K0lhS9iXYM2NNi1TXiwvW+/xx/6lkwQulGEGbv8swrrHvFFiFsm1RWt1iH5CxCBwIcp2OaFY3vTYr/CM/btJmLsSctxSa//wf2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6740
Received-SPF: pass client-ip=40.107.13.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.133,
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

09.07.2021 15:50, Kevin Wolf wrote:
> From: Max Reitz <mreitz@redhat.com>
> 
> We do not do any permission checks in fuse_open(), so let the kernel do
> them.  We already let fuse_getattr() report the proper UNIX permissions,
> so this should work the way we want.
> 
> This causes a change in 308's reference output, because now opening a
> non-writable export with O_RDWR fails already, instead of only actually
> attempting to write to it.  (That is an improvement.)
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Message-Id: <20210625142317.271673-2-mreitz@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block/export/fuse.c        | 8 ++++++--
>   tests/qemu-iotests/308     | 3 ++-
>   tests/qemu-iotests/308.out | 2 +-
>   3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/block/export/fuse.c b/block/export/fuse.c
> index 38f74c94da..d0b88e8f80 100644
> --- a/block/export/fuse.c
> +++ b/block/export/fuse.c
> @@ -153,8 +153,12 @@ static int setup_fuse_export(FuseExport *exp, const char *mountpoint,
>       struct fuse_args fuse_args;
>       int ret;
>   
> -    /* Needs to match what fuse_init() sets.  Only max_read must be supplied. */
> -    mount_opts = g_strdup_printf("max_read=%zu", FUSE_MAX_BOUNCE_BYTES);
> +    /*
> +     * max_read needs to match what fuse_init() sets.
> +     * max_write need not be supplied.
> +     */
> +    mount_opts = g_strdup_printf("max_read=%zu,default_permissions",
> +                                 FUSE_MAX_BOUNCE_BYTES);
>   
>       fuse_argv[0] = ""; /* Dummy program name */
>       fuse_argv[1] = "-o";
> diff --git a/tests/qemu-iotests/308 b/tests/qemu-iotests/308
> index f122065d0f..11c28a75f2 100755
> --- a/tests/qemu-iotests/308
> +++ b/tests/qemu-iotests/308
> @@ -215,7 +215,8 @@ echo '=== Writable export ==='
>   fuse_export_add 'export-mp' "'mountpoint': '$EXT_MP', 'writable': true"
>   
>   # Check that writing to the read-only export fails
> -$QEMU_IO -f raw -c 'write -P 42 1M 64k' "$TEST_IMG" | _filter_qemu_io
> +$QEMU_IO -f raw -c 'write -P 42 1M 64k' "$TEST_IMG" 2>&1 \
> +    | _filter_qemu_io | _filter_testdir | _filter_imgfmt
>   
>   # But here it should work
>   $QEMU_IO -f raw -c 'write -P 42 1M 64k' "$EXT_MP" | _filter_qemu_io
> diff --git a/tests/qemu-iotests/308.out b/tests/qemu-iotests/308.out
> index 466e7e0267..0e9420645f 100644
> --- a/tests/qemu-iotests/308.out
> +++ b/tests/qemu-iotests/308.out
> @@ -91,7 +91,7 @@ virtual size: 0 B (0 bytes)
>                 'mountpoint': 'TEST_DIR/t.IMGFMT.fuse', 'writable': true
>             } }
>   {"return": {}}
> -write failed: Permission denied
> +qemu-io: can't open device TEST_DIR/t.IMGFMT: Could not open 'TEST_DIR/t.IMGFMT': Permission denied
>   wrote 65536/65536 bytes at offset 1048576
>   64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>   wrote 65536/65536 bytes at offset 1048576
> 

Hi!

308 test fails for me now:

308   fail       [16:02:49] [16:02:53]   3.5s   (last: 3.7s)  output mismatch (see 308.out.bad)
--- /work/src/qemu/master/tests/qemu-iotests/308.out
+++ 308.out.bad
@@ -91,7 +91,7 @@
                'mountpoint': 'TEST_DIR/t.IMGFMT.fuse', 'writable': true
            } }
  {"return": {}}
-qemu-io: can't open device TEST_DIR/t.IMGFMT: Could not open 'TEST_DIR/t.IMGFMT': Permission denied
+write failed: Permission denied
  wrote 65536/65536 bytes at offset 1048576
  64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
  wrote 65536/65536 bytes at offset 1048576
Failures: 308
Failed 1 of 1 iotests


And bisect points to exactly this commit.

Should it somehow depend on environment?


-- 
Best regards,
Vladimir

