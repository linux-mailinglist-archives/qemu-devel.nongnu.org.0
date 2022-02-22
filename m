Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BEC4BFE94
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:30:24 +0100 (CET)
Received: from localhost ([::1]:60884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMY3T-0001NK-GK
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:30:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMXVy-0007rV-NC; Tue, 22 Feb 2022 10:55:46 -0500
Received: from [2a01:111:f400:fe0e::71b] (port=8642
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMXVw-00027l-GT; Tue, 22 Feb 2022 10:55:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtE6DRa9qIfA5oRfVjPouTg28ZJB9PH3DTgrgMkQjnlwYxLC002qHUePMwA2O7W2V3uINI0MBHIDH8dhVwgdxTu64e3rtx9tHSOfGrX+gRn2jRp0qbetHoKuw8D0y42m+DbnNOL6bZ0KGtFbWwH3rKBWVmgF2SdleRUldl2d9B3FBMsMHR9Z2S4uFObecdMLE4nSoTOS0z1c6EnCjOTdugkADrpPR2pidyPTyZOUBKqwl5a7Sj64oNN9xi31p4CDkHMmzzuJJa1WEDP7s+6G3EE/Mfy1sOrnCrZWiM4mwvKq868iZ3bdJ7TVGZDB2D/BZO+xZ+QO/UIgucllJyuFeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETpZ5RkJYOwpDSojjFHqA9qc9seoAhus2/g3Sl4o3tc=;
 b=fvbNrvKlM+b6HvsDsuR0qh8y7376uIgeGwifYEyQ5BlFf4AWt8SV/yrkhndMc97rcJ/9uiOMuV+peGuDI8iz/YBv5OVSCxL3+za5g2KrlQuE2m2wLR6sOeinrRB5u2iGcZLCkKFoq05LIf8L6oSsiDP2pDcu0OEJuYPW2LW6EdmSGIfTWYRb/URf/NcFiNei4MXBJhfLyZDdnnaPhgG3unHX8leR7F77CNNan7JB3EdqVcRrW5XrCzW6nONdodmRelb7653CZ8q9ITQ88AXo2R4r7uH+FKlTfzCfIiqtL5YdPFGOKqduvWrXSU8od+fOBkpBzx6vo/ehPe7Kblc8lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETpZ5RkJYOwpDSojjFHqA9qc9seoAhus2/g3Sl4o3tc=;
 b=QpoerooVkrbQfEsvnp36sP4vlA6D5ze9f4d/RTMKKjBNxFuoyHaLuzx8TBF7dhwNGobP4Qvt9CHC4snlOQ2Q4wSwhiQtrGEGx6BwQl1HTOkEYqiG0mZAwL/0LV9aS9Dy8/KoJrXSUGAQ0bKLWZdk9Mk7WrwQdaXOVXGEHEOJNYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB3936.eurprd08.prod.outlook.com (2603:10a6:803:e4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 15:55:40 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 15:55:40 +0000
Message-ID: <e4e63939-d4c3-795b-1270-0d3f74477ec3@virtuozzo.com>
Date: Tue, 22 Feb 2022 18:55:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] iotests/303: Check for zstd support
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220221170845.628429-1-hreitz@redhat.com>
 <20220221170845.628429-3-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220221170845.628429-3-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0017.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::30) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4701248-e7a5-4f3f-6d28-08d9f61bc644
X-MS-TrafficTypeDiagnostic: VI1PR08MB3936:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB39364071F44E5A016A00BB75C13B9@VI1PR08MB3936.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rD4OR6Y9xL9xiuDECXp8plTKuycvZl4kVP7I+UakdCrQwgPouJHZuI/wpjpE4YYrSy39l2/Vq/lvh4Zp9OkdKSjp7AimQkyPM1KLKsiVdwFlGpDS2g9jdxkb2rwd3WcD4SodwVY5R09KKVhV+fsOPhf91o3PqD/6m0xFfyycm+XAstoaX7X9Xk2/VYVTCBfuObKT6Q1lggq2ax/a/9oM3YHWobi841cwmsrshWSCwb2cd8CWClyKPVqRVX5/jCTVS5TsYjxcYbS45D9S24cV+4p1erkiUw/IgZSHKQgncyR59kq0XFiv1fdv0Holp9ndR+DT+zdkNW8syR7Pmqq9RTt43hbsyFVXNWzLEUoi6OphfsLtlOAxW1cedvdOGZwwkxiQIcOD7vLUjfvA2jyE3hx8GCTLd9oQttPuIfqpQvmfPoCgi0JlIglpKgZNih/bVjGmwS380CCwTelSepdwHpa/T7Rym/btWeN9RKb5Hzun+xbqik8lMpXr7FRHtpWSw4yyGF6qIHF5C9DGwQAbdJ08pN+0nV9D06SHcvHEStjk68ewe1i9pUfpaR1Ysp9YLOAkbe2cefLnJmSIx1MAxPVymLsEkIEhZ1YAt5J/H4SM318GTv2os72awd6k6omONFqTe2fg8rKvpLtwlt+jQwaqR9ULPfNtE0ynzwu6UwyES+PbhNJw9HmE+/NgGMEfn18CANS4Zje/wEO+9I0dIHthdaSpAZv7RseD8SKVZYgclxXa5Pdve6e5Si1fabobdN/XpBq9zP4XlBaYrUqFRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(54906003)(316002)(66556008)(5660300002)(31686004)(2906002)(38350700002)(66476007)(6506007)(36756003)(6512007)(52116002)(6486002)(508600001)(38100700002)(8936002)(66946007)(4326008)(86362001)(26005)(186003)(31696002)(8676002)(2616005)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3VYTm90V2hGTHpCNWd4N3JPOHhRRFpRQm9wS0RkMXFkU05CRmVGd0tNcGQ3?=
 =?utf-8?B?Y29TaTR6bXl5VENPbzhVckRRMlFaeGl3L09Eb2I3bHg4aElibmZubnRNZFkv?=
 =?utf-8?B?UURPbWZCaHNPRVBQQmJzWVRrMDFrZDhHT0JmQ09oWWpsZVhQU1pKSUdsSERV?=
 =?utf-8?B?OUhvRi82Z29RT2x1QVZTKzA3U0NXU28rN0ozdC9DMnJMSmxZKzBjY1lMK2ZP?=
 =?utf-8?B?eUpLQXMvSEhoWXVldTZrQkEzalZhWWpCSUtLL3E2Y2hWOHNmLzg2aFdJYzZk?=
 =?utf-8?B?NVd3aUtyNDVxaVh0K1VaTU9ocGdDN1BkTVU3VG9FQUhNWWI5NWhVckpKY1A1?=
 =?utf-8?B?VjVyUC9KOUtmcWM4dlNYZ0N6elIwVWVkbWtlaUtUN0gvYnpwc1hidVI0THJ2?=
 =?utf-8?B?VjdFRVdNN3ZaQ1RNK0NOaERSYk40K3hxcVN1QU1NWGtKWUd3TDNqTEZaeGUy?=
 =?utf-8?B?NHU1SjRDZUFTbU5MNG11RE56QjRIV1ZMLytpSzdkSW10R01nTU9oeGN2YlhC?=
 =?utf-8?B?d3NtVmdJMWZzYjZ5NlUrN0JvQWtDd1pIV01LSnFpT3hKVlU5cXpuYXV1NFVM?=
 =?utf-8?B?d2dqa2NIRTlIb2NHYm9sbEpOVVhSb2FRV1dsM1lOS012cy85Z1RoSW1BZ0hM?=
 =?utf-8?B?dkhRWnJXQmFlZWU3UFlZNUV1NWlYZC9nRmZkcWdjNG04MElLVTdwVVBOR1pJ?=
 =?utf-8?B?aTh0UWdIZDhJamd6ZG1OSThnRmFIa1FNcFkwQUk4K0JHQkdxQ3dNRFlzTUIy?=
 =?utf-8?B?OWhnd0RKaVU1bzMwQmNINzUrT2FoM3ZIcGtVMUU1aHpKeG9GeDQ5TDlrbmRy?=
 =?utf-8?B?bmFCa25QNzJsNCtlOU1VNmR2UDMwWFBmQ3dZK0NuY1NpUWxLS2ZuUzRlWVpP?=
 =?utf-8?B?enEzZ1lScHJXODJ5M1E4VEozVk5OZ0x2QURrMTRjM1dSdHo0ZSt4UW5WWFZq?=
 =?utf-8?B?WStZOWwvMGxjUWRjZ1IrNVgzQTFEeVRtYThFMEMxcDVIdFZybWxDODhCMjNl?=
 =?utf-8?B?TWhhNmJDUHlaOCswYzJJNTdUVVpBeFpYVTNKT0E0RHNFUzgzLytxeW9ESDRL?=
 =?utf-8?B?WVJyU1ZmUHZPU2ZoSXRuT3EyeFBLWWRDMkp6UGp6a2t1MGdXUS82KzdScDIz?=
 =?utf-8?B?aGJ0cHJBQ1pjek9NTnZPUG5ueEtyNXNwVHNpN0ZYUnJiNEFqOUF1Y1ZWaGtK?=
 =?utf-8?B?Vi9lWUN0UitoK29tRzJtQ3VJLzg3blBLcTU0YTR1WDRRVkJMaUhFOGZzNnNR?=
 =?utf-8?B?RkRveFF2Vzl4M1NtSDVEVHdPM2RMZ2Y1SkFHU0dob3dpeFlENUlMQitWRkpl?=
 =?utf-8?B?WkpFSVhDRUxDaEdRWWtzaHJrNlZSY1JVWENza3ZuT0huNDVyTEc1ZnBRLzIx?=
 =?utf-8?B?ZEFXdTdrT3BUbjc0OGU3Zm1Xd2FCaGRsaUhBbjBFQjNjdFBLUkVPb3JFYzEw?=
 =?utf-8?B?SXJ3MGhLZXNzTEtrYVBXNHROMFREZlBCZWVaeUx1bTRDNURqVUN5ZlAzL2N0?=
 =?utf-8?B?NkRqTWhxYm5WR0tHUTJqT2o0Qi9qUkprSEFadHQzUDREeE5RL2lRVkd0Y1F0?=
 =?utf-8?B?VnBxRjBGQWRiTmN5R3NvQzRncGxmREM5Nlo4N3Bib3doMlVwNUc2ZENPWXdm?=
 =?utf-8?B?WFJ0Qk5SSVVBOFRYQU11QlZIZXMyQ09oWXpaQ1VOZEtIdmhNUjBtemNDMjQ1?=
 =?utf-8?B?SzJaNlZaczl6Y05CRDJQdDdMWGc1TVhsVGF5YU9YK3BkU244ZytlamdzT3Qz?=
 =?utf-8?B?dU1uQjlzN3VDWXJLUmU2MklvYzlIYlpFZ3ROOG9zT3dsTitaS2FHR1BIS3oz?=
 =?utf-8?B?a29RMzA3STRXRlFkSFJaVnNyVzRmWm9TTlR0RExzRjFQd1ZiTXFuZ3Nta1U3?=
 =?utf-8?B?c3FpK2VVcGRmZEwyZytYYjhmMkpaU3hJUDF6bWpCam9Bb1c4Nm0xdEc2TjBl?=
 =?utf-8?B?L25ISldqVldZZEE5Mk1IQTBGVUdQc2JpL0YwczR0a2tJQTBzenF5T3oxWUs0?=
 =?utf-8?B?ZlFiTVZ3RnJnaHBzZVBieWhQNCtJTjJRWktUV0JGLzFpYlhCWU83ZlM3VHhT?=
 =?utf-8?B?M2wybEVYM2JlVmVUWkhNeE5SdjBUUGxtVVlIQUdEZnpIdEhKZTdNZ0Q1ZkdS?=
 =?utf-8?B?bGtteWZKSjVyRUExOE9rUitML1JHdk9BVVllRFBjbUJmNTF4aEtSdGFqWVlv?=
 =?utf-8?B?VlFaOFNBS2pOTURkMnFlS0UwM0tBQ1U4S2ttSTYxT0l0dHdSbXI5T1ozcktS?=
 =?utf-8?Q?agRXEN/zB2zspgXH7z5dkRLS0DUw5BhI2aPs+8A9x0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4701248-e7a5-4f3f-6d28-08d9f61bc644
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 15:55:40.5546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cF1DUnwfRwFMOY+gTnU+4ztf6uTaFaUY/A2DS90bPgRKoDPK7kFAjbb0q8Dce/L20AiG7juLiDqR1SfxHW3p/OmUMkMfvZWR/zVXe66tt04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3936
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::71b
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::71b;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

21.02.2022 20:08, Hanna Reitz wrote:
> 303 runs two test cases, one of which requires zstd support.
> Unfortunately, given that this is not a unittest-style test, we cannot
> easily skip that single case, and instead can only skip the whole test.
> 
> (Alternatively, we could split this test into a zlib and a zstd part,
> but that seems excessive, given that this test is not in auto and thus
> likely only run by developers who have zstd support compiled in.)
> 
> Fixes: 677e0bae686e7c670a71d1f ("iotest 303: explicit compression type")
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   tests/qemu-iotests/303 | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
> index 16c2e10827..5a3efb4ba3 100755
> --- a/tests/qemu-iotests/303
> +++ b/tests/qemu-iotests/303
> @@ -21,7 +21,8 @@
>   
>   import iotests
>   import subprocess
> -from iotests import qemu_img_create, qemu_io, file_path, log, filter_qemu_io
> +from iotests import notrun, qemu_img_pipe_and_status, qemu_io, file_path, \
> +        log, filter_qemu_io
>   
>   iotests.script_initialize(supported_fmts=['qcow2'],
>                             unsupported_imgopts=['refcount_bits', 'compat'])
> @@ -55,9 +56,15 @@ def add_bitmap(num, begin, end, disabled):
>   
>   
>   def test(compression_type: str, json_output: bool) -> None:
> -    qemu_img_create('-f', iotests.imgfmt,
> -                    '-o', f'compression_type={compression_type}',
> -                    disk, '10M')
> +    opts = f'compression_type={compression_type}'
> +    output, status = qemu_img_pipe_and_status('create',
> +                                              '-f', iotests.imgfmt,
> +                                              '-o', opts,
> +                                              disk, '10M')
> +    if status == 1 and \
> +            "'compression-type' does not accept value 'zstd'" in output:
> +        notrun('zstd compression not supported')
> +

Could we make from it a function in iotests.py like has_working_luks() / verify_working_luks() ?

Then in this test we'll simply have at start iotests.verify_zstd(), and in previous test we'll do something like "comp_type = 'zstd' if iotests.has_zstd() else 'zlib'" in classes that wants zstd

>       add_bitmap(1, 0, 6, False)
>       add_bitmap(2, 6, 8, True)
>   



-- 
Best regards,
Vladimir

