Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C3D2F3703
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:25:49 +0100 (CET)
Received: from localhost ([::1]:41898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNQS-0006rs-MO
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzNE1-0000TI-8y; Tue, 12 Jan 2021 12:12:57 -0500
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com
 ([40.107.21.95]:59872 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzNDx-0004Ac-SZ; Tue, 12 Jan 2021 12:12:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMuFkENIfGusI1E4Tl5HXgKk+V7KgtjbDFoTBkNZo5CK057Ama1HBI+LUmtaxvhFYDWaMTvpcHpy1yaUoZeIK7XYYVx79fZAKVgS7XjZ8sFc8ipOmTSmcqNFRLwnFKN3UXw7iR9Ze0jfX/ktb6gyceMCipM2DmnPayzta52ALWnBR8NEKK5VuHCb1UxCrQ/6hsJ0C47zRY00ARXtv2Qya5V4XgzrXLIzgc6/X/oRW1ALtW/qS2sPwPjxpscRH8au0/ETEGMrEiXy3WKy3D3GxH9Ztb1ZzY3TATskGzyuHuH35l/HiFJZ/5FyVGTvwfQ7qNrjbPOTQFVUIqLisf9ycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLUlRrMAyO8xcYwxO1Y2Jdvzfx7+4Kk5Evc96HjXtc8=;
 b=jdASsD+EKEEW3KfXJmVAwA8VPKRQdhWcDAax1wdvG8omVX2TWmeG1VZmGnK1S3yL/12x2zV5hajkcSl1OQ/vuU4NkLsPFWieAqyL8eds7gcX9yYXZQHdSVtB4JP6BKSA/91hV8DfW+cHW4/gV5lqRG9osLP7IlfZXJFNeXC0qf0IymWaOWN/snrxZyqBHp6ZArDQkU2Lkpy9Xri60hWcg3zZ+1EA4SWYpbAXKxUyYcPSODChQ/gcfhFQr0A+6IZLD712zEH4IjYtwiF1ku50M1IhvQ8P9MLvqg9lX35mZ72hMXDY7+CIoKFNSmtDXyXhw9Vz3x/sIE3MFd49QTWVFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLUlRrMAyO8xcYwxO1Y2Jdvzfx7+4Kk5Evc96HjXtc8=;
 b=s/VXUOFCDGarwuZqlq/QPQ7CzuBown1q9ZkIZ79i8uvCTr52FvvN830trVyUoug4OKz4YpOR1qTgU2rbteK8CRno2lRCph8dM8iaXu0xsING3eJ4glaVUgs2Fggg0UjZbXJrkqYssSdpN1M3U0QMEoVpPDKswaqFYcDvoAHyTc4=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 17:12:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Tue, 12 Jan 2021
 17:12:50 +0000
Subject: Re: [PATCH v3 25/25] simplebench: add bench-backup.py
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201026171815.13233-1-vsementsov@virtuozzo.com>
 <20201026171815.13233-26-vsementsov@virtuozzo.com>
 <8860dd8a-1a7a-2a5a-3daf-e163a99d8963@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d37c5abf-3cd2-e024-eeaa-212a43c62f02@virtuozzo.com>
Date: Tue, 12 Jan 2021 20:12:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <8860dd8a-1a7a-2a5a-3daf-e163a99d8963@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR05CA0095.eurprd05.prod.outlook.com
 (2603:10a6:208:136::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR05CA0095.eurprd05.prod.outlook.com (2603:10a6:208:136::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 17:12:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0019eaa8-ff88-4c35-24cc-08d8b71d4a6e
X-MS-TrafficTypeDiagnostic: AS8PR08MB5944:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59441AA4FBD587D9AA33068CC1AA0@AS8PR08MB5944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dLrgfyESoLk17q0gjj0YODdpWhyZbw/Z8duyWnjcePxmfeK4fJ5588LHpqFtp47V8tCzK5w5zqWUrtqLte0hBoyH2+POR7kXRYJ4a7K8PH31nCZrvJWuHlXziGpWKT3oxFfpe6DCnPb4xuTrE38F+5CrkO7B7tJeQ8g7AFZ4UqkL7iMo/jsmoI2/bIyXHo11Nviza+zvRm1erGTteqlGdn0p/V7V8U880zNYUhy8udX4rUL1OwzcYOXcrBqvg8qgLiRZTOgkxRRtNpKKSOqHMalIbV3PuBbz97NSF4uKo7k3DWgC1rgUL1mcXdIwGzF9JafeqE+Q7+6txUr0//n2sqPK8WnKoFkaT5LsSXohEhTDUePFbbG5uV86Pol5MidMPsQ91UzihtoI9a3xdSDtPQ9Bv5oNUe2fgXc2y7T79wG+DDEHBRNDKKl32hzMVzYAcYJqoKfUOvQpReHMZaUNXtRkMfTSHR09Mkhi2o3nJYI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(39840400004)(136003)(53546011)(31686004)(86362001)(316002)(66946007)(107886003)(66476007)(2906002)(6486002)(8676002)(36756003)(66556008)(4326008)(5660300002)(52116002)(478600001)(16526019)(186003)(26005)(956004)(31696002)(8936002)(16576012)(2616005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bjN1TDNaRC9ZamZuQkdVVXlxdHQrYmU1d2RJTU1wQ3k1WllTeHE2UE5nVmk0?=
 =?utf-8?B?U0UxUm9iT05Pc3ZIMWlJWHhrZFZFeUU4Q0sxZHdhYnNBdDlWSnZqWXQxQlNz?=
 =?utf-8?B?UmwwTmtIM1haT21rQ1JraVU3RFZZbW9UakJISVRRTXJvNUoybG9oOXJZL1Vv?=
 =?utf-8?B?dkdOdUR3MmJtRjFMQVV3QjBxNmltQ3FGL1hEM3pUeTBrQXRwM3pQSTl6b0NY?=
 =?utf-8?B?Nk9TWmFvNlZLdkVLVmJOTHBxVDFRUHFxSXBBb0pGZDA2Z2YvdGdDWlA1amV1?=
 =?utf-8?B?MUlHRWI0dm43dk1ERHF4RElHZnhzcFZMS09Gd2J6TzRubUYwS29halNZMDRX?=
 =?utf-8?B?SUpYVEVRNTRVK2NpN0ZsREZHM2N6eXhYYWZnMDNPTVdQcFFIOEJRaG9ma0tK?=
 =?utf-8?B?dXRtVS9kQ1gxU1ZmRmo2d0pFZXp6ckw4eDREOW1zS3c4SlpOMlI5TW1Vb1N5?=
 =?utf-8?B?THJKVVNDcU81ZTQ5Y0NmYTR1UDZEaDJsRVRKTkxmbTBVNWZPRjFITlYrVHBl?=
 =?utf-8?B?b0pDa29iNHFtbkJtMFl5YTNPNm94dS9zQ3lUVTR4Tnlkd01VQjc4OGFEMXhz?=
 =?utf-8?B?K0Y3bjYvaUEzaTNNdExaZlBrOHpBNno3NHQ2czR2ZFh5Q0twUTA5TkJNcHBI?=
 =?utf-8?B?dEgyR0x4U0xyTWw2WlZ6dUwxc0NRanRoczJnYm9wNDdUWHBDN1gzWmR5bUhF?=
 =?utf-8?B?VVBQQzBSeG1yWC9OQWhFb0pUTnJtd0tlMS9hY2VWZXNYTFhaak9vVU1SYVlM?=
 =?utf-8?B?Z3VpdkVhTUtBdW9najg0V2NaYlJ6NjM1NEZGYTlQMVFSMVNSS1dmTFllSmw2?=
 =?utf-8?B?czhTVTFla2EyZ0FhVzFEMzdaQmR4MWllSVZQOFpWV29EdCtYWk05dlpKblRC?=
 =?utf-8?B?eFg4dkZiUWJsQWtkUGNxRUkwSFdNRmZ6cUxGZUpqMWkzaU1FNDZZMmNoWXpa?=
 =?utf-8?B?bU9nRHFDWDRkVGFjanlnM0hLNTdjNnp6dTh5Y2dTWkJieFlLQklEWFozN3NL?=
 =?utf-8?B?Z3JVMGtGdEVMSlJnQ0NsUGEvcEhYVFZ5R2IvZGh2M3Z2WitxcFhOVk15MzUv?=
 =?utf-8?B?N2FPNjFrbUdOV1lHVnBtSDQ1Rnd4eW1kdDdrYm5xUUsvTVIwUFI0MER0TkJk?=
 =?utf-8?B?dThqZEd6RjRBN1hoNFFQZnl5ZWVBaE9QL2JpcWI5NlU1Q2xjcE1sa0N4M3Y3?=
 =?utf-8?B?aWpSUHVrNDc2WUY3S3c1Nkk1TmZFbElCb21iZm5nT3A3VGdlQnQ3bVRXMU1C?=
 =?utf-8?B?V294ZzlpeXg1MjNseUkvS0lMZytDQThmaEF0bUU1UTZ6R1QvSnhCc1YyeFJE?=
 =?utf-8?Q?gaQxQ3ZHHsv4tP79mSnJyV3sC58vFQx4p9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 17:12:50.2855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 0019eaa8-ff88-4c35-24cc-08d8b71d4a6e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcWOzEdnTZo5KuIydFKFAKCOkP2wXac+RgeDra+28Wc0CDDg1Sju4MvRG/x11fwXx9vuO9CqfIF3bPaM+WRf5q6BaFmXH4LWoobVMzzxfMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

12.01.2021 17:50, Max Reitz wrote:
> On 26.10.20 18:18, Vladimir Sementsov-Ogievskiy wrote:
>> Add script to benchmark new backup architecture.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   scripts/simplebench/bench-backup.py | 165 ++++++++++++++++++++++++++++
>>   1 file changed, 165 insertions(+)
>>   create mode 100755 scripts/simplebench/bench-backup.py
> Loose review, because I’m not too involved, and this is “just” a performance test, too.
> 
> Result: Looks good to me, two minor things below.
> 
>> diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
>> new file mode 100755
>> index 0000000000..5c62b1a7ed
>> --- /dev/null
>> +++ b/scripts/simplebench/bench-backup.py
> 
> [...]
> 
>> +def bench(args):
>> +    test_cases = []
>> +
>> +    sources = {}
>> +    targets = {}
>> +    for d in args.dir:
>> +        label, path = d.split(':')
> 
> Should this be d.split(':', 1) to accommodate path names with colons in them?

Yes, it makes sense.

> 
>> +        sources[label] = drv_file(path + '/test-source')
>> +        targets[label] = drv_file(path + '/test-target')
>> +
>> +    if args.nbd:
>> +        nbd = args.nbd.split(':')
>> +        host = nbd[0]
>> +        port = '10809' if len(nbd) == 1 else nbd[1]
>> +        drv = drv_nbd(host, port)
>> +        sources['nbd'] = drv
>> +        targets['nbd'] = drv
>> +
>> +    for t in args.test:
>> +        src, dst = t.split(':')
>> +
>> +        test_cases.append({
>> +            'id': t,
>> +            'source': sources[src],
>> +            'target': targets[dst]
>> +        })
>> +
>> +    binaries = []  # list of (<label>, <path>, [<options>])
>> +    for i, q in enumerate(args.env):
>> +        name_path = q.split(':')
> 
> (Same here)

hmm here we can't distinguish path with ':' inside without a tag from tag:path..
but anyway, using ", 1" constantly is good. Possible failures will be more clear.

> 
>> +        if len(name_path) == 1:
>> +            label = f'q{i}'
>> +            path_opts = name_path[0].split(',')
>> +        else:
>> +            label = name_path[0]
>> +            path_opts = name_path[1].split(',')
>> +
>> +        binaries.append((label, path_opts[0], path_opts[1:]))
>> +
>> +    test_envs = []
>> +
>> +    bin_paths = {}
>> +    for i, q in enumerate(args.env):
>> +        opts = q.split(',')
>> +        label_path = opts[0]
>> +        opts = opts[1:]
>> +
>> +        if ':' in label_path:
>> +            label, path = label_path.split(':')
> 
> (And here)
> 
>> +            bin_paths[label] = path
>> +        elif label_path in bin_paths:
>> +            label = label_path
>> +            path = bin_paths[label]
>> +        else:
>> +            path = label_path
>> +            label = f'q{i}'
>> +            bin_paths[label] = path
> 
> [...]
> 
>> +if __name__ == '__main__':
>> +    p = argparse.ArgumentParser('Backup benchmark', epilog='''
>> +ENV format
>> +
>> +    (LABEL:PATH|LABEL|PATH)[,max-workers=N][,use-copy-range=(on|off)][,mirror]
>> +
>> +    LABEL                short name for the binary
>> +    PATH                 path to the binary
>> +    max-workers          set x-perf.max-workers of backup job
>> +    use-copy-range       set x-perf.disable-copy-range of backup job
> 
> s/disable/use/?
> 

yes


-- 
Best regards,
Vladimir

