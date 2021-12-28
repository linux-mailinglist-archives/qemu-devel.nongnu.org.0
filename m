Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FD14809BA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 14:31:03 +0100 (CET)
Received: from localhost ([::1]:39296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2CZC-0006LA-Od
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 08:31:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2CWO-0005bs-Ou
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 08:28:08 -0500
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:65376 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2CWM-0001Vc-Bw
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 08:28:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0l2inXVRVe59G81ufsHQcC+L7coUKZngkmiZdU2drmPoH82Gg/IpGdS5Y/YF2qBo0eFncxP/i4xbmt4DlzFUfbwfW4T/mz+5ENpMQnglYy1KdVOipP7dlceDkIGQDgN79xc+9JkusavjIwhfsuUEZ0Nj64o7TWJYDuoqVxeCqnnalBhqAF2vvZRwQD7Xtnbz5UD/SZUGSYbeAVLJUwl4RelfvvMy/G+poP9utXngkocsclcsX9QzXvYrY1h5/+pNGMMvqnODhyFqTh1kKrxg1/cB67u3dWIYEHKv1lBs0O316+/AnsT7VUCvL92R/UKK4Ob+6r2rk1GwHkqmwu8BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxYPf6iNM+AsCiQC1rTAzs905RR2NWHfeY8fPWKxAg4=;
 b=fjJ86hHfP5eocDFww3UeyzKBFczwGzUvEKBjHHlERRObGgYMFed45338ZOIuO+aZiTNasl/qnguKkv9nPbUAmAZ3F7YL1yhgpjQbswCe0txYP53YqyTXmoAU7JGwM29uh3EFeZA8tzlk2S5yxR3QDhuzz24a6NMnWMzwGMT2dv1enBl/FwEcVbpNjpGNMGU8E3X4IEqwV94eeTtO+zfSnKwb8czBIhWF/vl2yVKELYha2Pt8W723chz0DyI5YOdTlo3Myokpbm5BeLcc1weFVijgD1NAxJFtnpS3LnY9WhX/3VnhQxTki5plIhxyi48Q87HSbXFCXYrgteuO6ltyeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxYPf6iNM+AsCiQC1rTAzs905RR2NWHfeY8fPWKxAg4=;
 b=I10ufo8QVU0723ri9TjWrVdS2ZwRmttvvksBwEK8MXQCnSQOK1p8OIHUE1JCGhZiglNtTLYZXMS+ZcaEWyiWRgg8BO3EODBqtygIff4HuIsh42Hp4fFMNkSsYURUuawyvFwm/o95BB7fNYy8bxrvI9JtEJza2XTiQhnJR5K+qpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3844.eurprd08.prod.outlook.com (2603:10a6:208:101::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Tue, 28 Dec
 2021 13:27:55 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 13:27:55 +0000
Message-ID: <bd5e20e3-6fe8-faea-1d60-2f7a8325eb9f@virtuozzo.com>
Date: Tue, 28 Dec 2021 16:27:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/6] migration: analyze-migration script changed
Content-Language: en-US
To: Nikita Lapshin <nikita.lapshin@virtuozzo.com>, qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, eblake@redhat.com,
 armbru@redhat.com, eduardo@habkost.net, crosa@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, den@virtuozzo.com
References: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
 <20211224111148.345438-6-nikita.lapshin@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211224111148.345438-6-nikita.lapshin@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::18) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4702128-1855-4471-7bba-08d9ca05db46
X-MS-TrafficTypeDiagnostic: AM0PR08MB3844:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB3844D1687150A07A848998A4C1439@AM0PR08MB3844.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NImYjt22jieqVawWbruR55znNpMZadGlY3G5UGVHy2SLUamWvToT8l665o2inDGTdgq7k3YCrZ/opwMgEM7XVIRdLQw6MBcG9Vw+iPYEji9QPHC5XNW1B3BlICK3IL7d9BMx3sPT7iLIxeKDAKaWlFJziaXx1IfWWvLHgV1qk4uPGPrsmVQN8CukkKAbo7dC+FUPuUMz7NLYZHmChXM20v03iNXxA6KqRmCWk13Sr9D6+wZhe+PFafYPCCo/+WDJ10N1FTtCy6tXePLie/ToEeBORNvFinOFHfQdFllN7H18RpscuL1Ew47+mfB2vinO7YmhJM2B68iVorwEi3pnNF5wBtdQGVwHRUtp0a1/GDGII4JN9ipv+wNjEo09iNTAbvDFttS06DYbAOr8gH6ir1j4mYZMatNhBtuiig8tdGJp0ohaE79SPG1yrBR0atSZFlEjE+9LIpuvU6oEkZBgdbUhjQEEdWZEpzmVmEkyoI4Ls9g6gCFFZWnSueynKFyZea46QBpP84r8hueJm+Ka524cknmFJ6EDwV/ArdueV17TNUl47WGE1/cSa5H80XQ1l7VFCPASkLAe7essMwjD7s0+HvP57zOFBNEpCTOyYtGX2Gh4DWagghRzdOsUifhNCHITn2nkjWXBEKmd9h+EZKqT70TDJxZuBMpu1M+2lXDtJ//N0JQusatamm56HyoUZG/Baijr3hO31sT98qg6fj9l9wtE+I7OUUWlSEjRtBbe+0PoTy/AEfMhjAzTmtWo/4HOp7TD3J7OXPdADa5G3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(508600001)(26005)(31686004)(52116002)(8936002)(316002)(86362001)(2616005)(31696002)(2906002)(6512007)(38350700002)(107886003)(6506007)(83380400001)(4326008)(8676002)(36756003)(66946007)(186003)(5660300002)(66476007)(6486002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzNzeVZFaEVyUTZtUysrMDdNdWtqeVEwdS9nWnFRbEJXUWRoZEFCdUtkbmJQ?=
 =?utf-8?B?d2djRGUxa2J4R3BSVGdVWFk0Qkd6dXUxdVg0RENIYjBCUVp4S05sSGJMT3hL?=
 =?utf-8?B?NmJtaUI2MmJTVUU5WGtxMGZhOEpGMGZCWnNvSjJ4eHF2d2gxa1NKcXlheG9K?=
 =?utf-8?B?a2RLNlZwaFFnbnRUMURlVHRWZmJjcUo1VHUwd2pRMk1XZENrc0VGMU90OUt4?=
 =?utf-8?B?NTFsSDEwbXduVWhyQ0JxeEJxWjFlY0JLMnRXVXlYKzFWMTh5dDV6ZDl6VXZp?=
 =?utf-8?B?bUpvdENJUUhhTCtSSzFkRlFuMGpvV093NE5wV3BITnpVTEZHM0t3OGQrdGVM?=
 =?utf-8?B?aVRMQnk5dlFEOTNDZXNXcXAydnBZbG8vcFM0VmJBcGRNOVEycmd1Wmd0NDIv?=
 =?utf-8?B?c1BnUGtGaUpmS1VQLy9kRTI1SWxmTkpRc2tJSHN5NVVsR0JTWWRMN0p1U21B?=
 =?utf-8?B?aUd6cDF6M2NiTGErblY4UHA2bDVHQzZmVnYwemJRN1hFZW5YdWgxTmJNTkM2?=
 =?utf-8?B?LzJBbmJrTjJPVFNMc2xxUG5mQWhZTVcybG0vOWszOU54TC9STTB4dXZ3emlx?=
 =?utf-8?B?dndhb3J4aVVTVFR4YyttWEdMaXZwWXZNM1R5WUpuc3VhZEJGK3pnTHFzS0VH?=
 =?utf-8?B?N2R4YVo4MTJCTVpuZGNjbDArd05PeHhlTG8zOW9Hdm5HTGZiUmcyZE1sTnN4?=
 =?utf-8?B?Mlg2TWdabzN3ME9GSkxLU1lxNGNqY2JabUhsWk9IY0JWdGdXV2VVdlZBUkdZ?=
 =?utf-8?B?b3RLT1psWFZkMDhMRDlqeFcrQVBIMEVOeXN5Y0RhdHZ2b2xZV0Mzc1R4aklU?=
 =?utf-8?B?djBJbFlCbXlocTJzUEZ1eUtYa3Y5NlJTcTBVaEhab0lvZHhqQnMwNWpQTFUv?=
 =?utf-8?B?MlVxeHhpZTNiTEZEVS95K3VDRDhGbys3RXZNMXRsRkZHaUFxZW5raFZJK20v?=
 =?utf-8?B?a1ovb0htTlRXbkZvVHNpTGV3Z1JiOUhnVjFkeStQYnlQN2VyOEc2Lzc5VlFJ?=
 =?utf-8?B?SmRMVzJlNHhQRjV5OVhYNHRUVnJCc0Zha2NTYVdySG03VTk1N0daajJPalN0?=
 =?utf-8?B?c3dWbGNWVWRaRTBweWt1UWQ3ZW9QZU5UemxFazBYREFMWERxTy9sblBQTDk0?=
 =?utf-8?B?OGRUWEVsMkF3UnYvS3NCUUlUaVUrUkxuYjlIKzFpZldLUm8rMExxZHI4WFd4?=
 =?utf-8?B?WFdGR25YcFpQME4zaTQrOTRsWVlwRnNMQ1hKZE1SNFBNNlNCMS9Ua2VtVk5q?=
 =?utf-8?B?MU5Jc013d0l3M0pBWTJOZXVRYTJMTjJJOUNWTmQ4Ly9CcWt3NHduaEhyd0U1?=
 =?utf-8?B?U2ZLYkRnWnFHVXhPTzZjSkFlVVU0cmtTVzF1dVQ1S254clJTOUw1bjFnRXJk?=
 =?utf-8?B?OVJBMDlUWGhoZ0FXZTVNVHdabXlWcHFWYXdRYVo1ZndJdmVWUDArb215eHFK?=
 =?utf-8?B?TmlLSzdKLzl6NkVidVgxanoyNmxEVm96WFJvRmJwTnJRVU5abTNxYkNYdUJV?=
 =?utf-8?B?OWtPcm9tVGZBYitQSWVWUXd6cThYeGp5VlkzSjN5UHVHZ2Z2Y1pWMEtRTExk?=
 =?utf-8?B?QW55WGtJdjkxMHdoaHN6ckZYaFlQQWllUG16RjZKdnJoWWRUdFVScTdtRzlu?=
 =?utf-8?B?TndkSzFrWnI1M2dTMG5MVmtRcTFKeU53M0ZnS25WMU1yRnUvU2xVNGVPSCtU?=
 =?utf-8?B?aVlDSjBHYlhJVzZuUU9DR1ZmL20rdk41Z3VuZU9LZmVuazltaDk5K0pkMXQ1?=
 =?utf-8?B?ZEdTd25obU5HSTJEUEdpSE8zSEFZUU05eU1WdlJJbkcwMnRqazBEYzZJdDBF?=
 =?utf-8?B?OWFIVWlPbkgxbEFDSUFheUt4QUdUTDI4TEdqWEh4T3FPZFV1dW1EK2cxSVI2?=
 =?utf-8?B?NFgrM0tGQy90SFZGQzl3ZGdMdno3T2E1YlFBdWpCTTRLR29MTlVwNmNSZXh5?=
 =?utf-8?B?K1IxVkhONk5xRHVqaWFFeVpNaytiTS9ZZ3JzazJYYVRVbm8yLzVJVUpoL2h3?=
 =?utf-8?B?QzFkQmpRMXhVN213emppVDh2TGMwa2dNR1ptWTNaZXRxV0c5TUUxbk1ZZ3RF?=
 =?utf-8?B?akJCRjFKdHZkN0xJa0VPU3JoV2xWNjlSRW93RGhueGRkRGg1WVNYajMrVW1s?=
 =?utf-8?B?d0hWVEFyN29nUzlsUVJwODdBWGluSVBiaytEZlFhcllpd0ozWHB5V3VkYjBZ?=
 =?utf-8?B?TzJ4Ums1cEJ0TkVpZHJFcFlzek5HYTlINWRiakphUHNxNXdKaXJEU1ZCU25J?=
 =?utf-8?Q?Ii2EMyxIOziztDB2y+jUujkh+l9cN96MZWBnIz5VvM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4702128-1855-4471-7bba-08d9ca05db46
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 13:27:55.3518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtuICJcqvLk+PMF0tY3Epwj6p3q1XiGlku+xkw1xiSmeqvj+tup1+MFfk18jJp8N/5l/H2yFxU7nReZWLNu3DeKCIxnmCcmjRWM/bL/EiIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3844
Received-SPF: pass client-ip=40.107.20.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
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

24.12.2021 14:11, Nikita Lapshin wrote:
> This script is used for RAM capabilities test. But it cannot work
> in case of no vm description in migration stream.
> So new flag is added to allow work this script with ram-only
> migration stream.
> 
> Signed-off-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
> ---
>   scripts/analyze-migration.py | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/analyze-migration.py b/scripts/analyze-migration.py
> index b82a1b0c58..80077a09bc 100755
> --- a/scripts/analyze-migration.py
> +++ b/scripts/analyze-migration.py
> @@ -495,7 +495,7 @@ def __init__(self, filename):
>           self.filename = filename
>           self.vmsd_desc = None
>   
> -    def read(self, desc_only = False, dump_memory = False, write_memory = False):
> +    def read(self, ram_only, desc_only = False, dump_memory = False, write_memory = False):
>           # Read in the whole file
>           file = MigrationFile(self.filename)
>   
> @@ -509,7 +509,8 @@ def read(self, desc_only = False, dump_memory = False, write_memory = False):
>           if data != self.QEMU_VM_FILE_VERSION:
>               raise Exception("Invalid version number %d" % data)
>   
> -        self.load_vmsd_json(file)
> +        if not ram_only:
> +            self.load_vmsd_json(file)
>   
>           # Read sections
>           self.sections = collections.OrderedDict()
> @@ -518,7 +519,10 @@ def read(self, desc_only = False, dump_memory = False, write_memory = False):
>               return
>   
>           ramargs = {}
> -        ramargs['page_size'] = self.vmsd_desc['page_size']
> +        if ram_only:
> +            ramargs['page_size'] = 4096
> +        else:
> +            ramargs['page_size'] = self.vmsd_desc['page_size']
>           ramargs['dump_memory'] = dump_memory
>           ramargs['write_memory'] = write_memory
>           self.section_classes[('ram',0)][1] = ramargs
> @@ -579,6 +583,7 @@ def default(self, o):
>   parser.add_argument("-m", "--memory", help='dump RAM contents as well', action='store_true')
>   parser.add_argument("-d", "--dump", help='what to dump ("state" or "desc")', default='state')
>   parser.add_argument("-x", "--extract", help='extract contents into individual files', action='store_true')
> +parser.add_argument("--ram-only", help='parse migration dump containing only RAM', action='store_true')
>   args = parser.parse_args()
>   
>   jsonenc = JSONEncoder(indent=4, separators=(',', ': '))
> @@ -586,14 +591,14 @@ def default(self, o):
>   if args.extract:
>       dump = MigrationDump(args.file)
>   
> -    dump.read(desc_only = True)
> +    dump.read(desc_only = True, ram_only = args.ram_only)
>       print("desc.json")
>       f = open("desc.json", "w")
>       f.truncate()
>       f.write(jsonenc.encode(dump.vmsd_desc))
>       f.close()
>   
> -    dump.read(write_memory = True)
> +    dump.read(write_memory = True, ram_only = args.ram_only)
>       dict = dump.getDict()
>       print("state.json")
>       f = open("state.json", "w")
> @@ -602,12 +607,12 @@ def default(self, o):
>       f.close()
>   elif args.dump == "state":
>       dump = MigrationDump(args.file)
> -    dump.read(dump_memory = args.memory)
> +    dump.read(dump_memory = args.memory, ram_only = args.ram_only)
>       dict = dump.getDict()
>       print(jsonenc.encode(dict))
>   elif args.dump == "desc":
>       dump = MigrationDump(args.file)
> -    dump.read(desc_only = True)
> +    dump.read(desc_only = True, ram_only = args.ram_only)

I think, ram_only can't be supperted when we want to dump description ?

Otherwise looks good to me.

>       print(jsonenc.encode(dump.vmsd_desc))
>   else:
>       raise Exception("Please specify either -x, -d state or -d desc")
> 


-- 
Best regards,
Vladimir

