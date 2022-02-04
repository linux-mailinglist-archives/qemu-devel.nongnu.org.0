Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B8E4A96FC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 10:41:53 +0100 (CET)
Received: from localhost ([::1]:48940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFv6G-0002Sy-BJ
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 04:41:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFuWv-0002kh-SQ; Fri, 04 Feb 2022 04:05:22 -0500
Received: from [2a01:111:f400:fe0e::72e] (port=26474
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFuWf-0004bK-HY; Fri, 04 Feb 2022 04:05:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbmV2FI2O3V2AO3uCihP+AVP/cFysKZOjdnDfMzaTA0x/fTcs6nssq6RWF3JlNMyjlkzEcPAtsHb6lh+Auyey7NdYWg90217r4qi/29RylJUiGBDPS4T7xmJFeHSprBw96jY6uYclVAXS9lLE4jFxTNNe63762dfIPFFQtihc5pcuUUnzoLNGkI39epjsnpxdAgiD8FADCw8wL0gIL1SnMT0qz43v2e3HE2C/2lDfGco0+meOMpQM9XuwPpAIOyk3xJKOqDOELuaup5aqFGXIYjC2jC47DCgB4CXf+xQYwet7s7eoZg/h1lXWja3S6dhVFfENk+UBa+Ik2FCWSbJcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nr9oJ99sUc9TedUgmpBawEUSDoJqbM4yNNLCYnTnYO8=;
 b=ZzKR9DSUjigo7+ISMOY7X/Z7hLg3sHNqj1018h59l0xsTwApFbplMY4y3lGRuWQF6UuPw4p03wQeaPtZX6uKVdtnK1OyE+RHvGxuXv0mEZrGDf73V/k4/ZFQm6pED2h7yADXFdV2Jd3e60/Vt3K9eiFS2FR/jYDexY9hRO7H7mLmaZBxvro93SrXExVztfLnws86v7ZM6H8RW/Q6N2Z/efw4JH+vvOSVlaKZkqQYRZgZ87D7RCu19lWzenP8VGVZfCxxLHj119RteH/dHyYF0Kx5y+YGwBWXEY9RYH3Qbi7/1gqLByNDFY9kOSDB8A/pv8W5sCibnHnJ0pDe2rAm/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nr9oJ99sUc9TedUgmpBawEUSDoJqbM4yNNLCYnTnYO8=;
 b=VRG928AVN4dnqbePqI8JtB6CV+BNAcE97zZZyEbIGRf38VYKPXWBDJ0E8Z5+22NQi8vWLFX2R3cv2QgvSf0ZeujCaCGS4PKeM6jnPfRqM1G+TzdZ6KEFwekNEj1rYVPNZtsEDtUMYv/dDCudLAc/iGme82zUzKsZ2oVFtTyhFd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM6PR08MB4326.eurprd08.prod.outlook.com (2603:10a6:20b:b9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 09:05:01 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Fri, 4 Feb 2022
 09:05:01 +0000
Message-ID: <89ec5283-4f71-8d25-1eed-e3b2cab10049@virtuozzo.com>
Date: Fri, 4 Feb 2022 12:04:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/7] iotests.py: Add QemuStorageDaemon class
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220203163024.38913-1-hreitz@redhat.com>
 <20220203163024.38913-5-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220203163024.38913-5-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0038.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::23) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b01240ce-9de2-459d-516e-08d9e7bd6cf5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4326:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB4326E829D7519DADCDAAD537C1299@AM6PR08MB4326.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GFs9txgY+i2Q5NjRgyftoyBAEtcxa4aUgdMSXurnmQ0el48Im4aIBw0AMUuwK/v62sPSJtnPHifCtnW9RZFWsKvbR9HXbHz4IFaOsCr6sovK4QZ1uO2Pu1Kd7CTj34yVsXpsMEWr8XWWCyB2Q8hCCXP0C9VHD0CQjtmJPBxOJUE8PEZOXFuscdi2R+tPkbUgqfR/VVNRgQlCjRfObjuet/4S8zEfGhsREu4ui70ePa8blVD3Sa40gwAb5xvWStRgJRhG/+RR/d1uT++E4MTjjWYudnDBpIND/hG5mdTM/sHzNqo1CX5xi5uMDT9Y/0GcTBcPT89xArRniHM+0yvYfo3rsblPQ/dnn4w57HegTc7LwOQ1GpIL5AGokne5uIbfei182mGNM6M6X01CVWhOLIUa+G3x2ohh+lmi4MofscgngqotxW5L90c8yNVdP4OVKqlAwN3HgWPyYvzFd5OcsLG5IO3dcE31jun9OEW2tKm3mrUqOZ3ai57ON3Q1Z6k30li5M+bALcsxluLLqaKoPTO33N7KsQmu8cT1pI/ghkaaBzzhR/ykCsngalClAKpTTVjRrU4pQzuv5WoRY9nlrI5nfEgDksSaSNv6fGOy2FZmUeLpcmjkksSLpWXoI8+qgDqgmal51xMeBJPKVCO7VKnSzRucQ03R2AqNQMt4PAjOELwfTAINRTDbh1XFVeWvhWTzKurQrVHJNy+J0nfm7Pss7ukZHTw9p7h3EIMVcZYhCvU5I5c2ZLs61Uo9ONcwxkD2XS+B4pKVWez9BbeSMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(6512007)(6506007)(8676002)(52116002)(2906002)(26005)(31686004)(36756003)(508600001)(2616005)(6486002)(186003)(31696002)(66476007)(86362001)(66556008)(54906003)(8936002)(38100700002)(38350700002)(5660300002)(66946007)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWNPcnh4NXFLc0lZWkVlNlU5SFdKZk1JR296QzI5ZEk3Q2REc3N0QWp1a1hK?=
 =?utf-8?B?KzRReVJUckJ4V3NvRkFsbmQ2Z3JpWTdJNllHUlpyU1JUcVZHa1FjOHByZm5k?=
 =?utf-8?B?a05hMUR6T3lxZGMxK2hmcEVPOVBjbkdiRWlyRlowbjZCQTJIWEF1b0dxd0Ju?=
 =?utf-8?B?QkJoVjRpYkFjdnZtSkxOeXRKMHMyOHBsalhaUVpsTGEyMnVlQjlKU0N4aWV6?=
 =?utf-8?B?VlNBd2NXT3RCbDFkV1ZkNU1BRy9USGlXTUZnNzZ3SVFPZ1pJWDAzT1BURTJW?=
 =?utf-8?B?RU1YcVVYc2VMWjAwTnVqcG00RmxrQW53bDhpM0c1OVhISWVkVDdWQ0E5bHRQ?=
 =?utf-8?B?eUwzSmtxaHRuVGJicWJ1by94bUZuTHRZWThXUWJNVmtpT0dCVGgxS3BzRlAx?=
 =?utf-8?B?WGJOeTVmMUkwWktHUkxyTzh6MENjeWUvUWNzNG91L212dnVsNVdCSXowUzAw?=
 =?utf-8?B?cWJYb3paZ2lxZlp0RmtONFQvZXYxWm5UUzhrQWtQei9sTklZSngvQmFtWnRI?=
 =?utf-8?B?dUg3dmtZVUZVa0xvbER5UjJJQ3pmRm9ocjBlZi8rekZZY2JwLy9qSUdLVXJX?=
 =?utf-8?B?aG9TYnFUamZqRkZJeHFZUW1QN0RhWTVFampVNEErVDB3TWYvTkdWS1pOYTRG?=
 =?utf-8?B?U0NJTThXVUZxNDY1ZGJjNUplNXpRR2xGSE1GUWpuNUFJdm1PaHE3Y1BPMkVv?=
 =?utf-8?B?ajVjOWVhVWJaTVI4R21vNURKVG1udFJtV3VLQjJINjk3Myt3aTBBQlR0bFhr?=
 =?utf-8?B?N1IxRDd6bmdBcHdIdklRcjIyd09CL3ZhY0hNR1RoU01ZSGV6Ti9PdnNzU3RW?=
 =?utf-8?B?M01kWkIrYWJ3YXFXRkxJK1N2UVVxTklIZ1NvTW5rWDh0RndYOUZhRjNWbjJR?=
 =?utf-8?B?NTBjdmtZdG4wZEsyVUlnVHM5dUNjM3NUaEI5RnFNV3ExQUNsRjJoZW5UU0Zo?=
 =?utf-8?B?WDFHQ29obFhPZVRDczhxRTJYL2FYMEMvNU41U2VwY1R1OElGaEFmc2NOSGhX?=
 =?utf-8?B?Q2NRdmFVLzZnek0ySTRLcEpQWjRqb1dYMHRhWnBOdHNxZTVHVVppUWVrMkJq?=
 =?utf-8?B?VXNIQUtvVjdRcUtrSU02WkxlbmxzTVBRUXBScVVPMEpPUzJPTERRRzlDOTFt?=
 =?utf-8?B?eU9OZ2hQUnYxQ1YrNVVIWE16bnJwT0ZCZ2djSVZpcUhGa1FHNDMvOU5Rajg3?=
 =?utf-8?B?QW1taGtnTU9TdUlleTc4OG9jQTI0Z0RxUjF1OFBMUXNFYWZDTitnaGlXTWxF?=
 =?utf-8?B?QS8zd1hWalRtY2dOOGhsTVI0SGZCOVFyZzFHNkhPNXJkY3NtK3o4SDluQnVm?=
 =?utf-8?B?MHZyTFpDMEYzdENkLzFTME9ydERzd1cwOEtKbkpteTFYelk2NlRVeXdXWVRx?=
 =?utf-8?B?NVFOVzBlM3B0WDR4aUt2c2NSWFNKQmZIdDlYNlFEdFJhcnBGQy9VWHJTY2sy?=
 =?utf-8?B?dWtmdFlDUnpEZ3BGZlBnQ1JTeGtnQmhjT0NKd2M1ejJtbXd4OFNHSitHSUcx?=
 =?utf-8?B?WE5DSGF5azZJZjA2UDZmSjl4ZXBmOCt3bVR2KzZTc3RyTkw3U3psQmlzeGtP?=
 =?utf-8?B?bEgra0FWaHFjUGN0LzByeWlacU4xaFlydy9Bc0g1ME4wV1FSSmdCQzM1MHdK?=
 =?utf-8?B?UjNtRWZCU2t2QXdhb0l4UDB3c1JVM0ZuaUo0bVhiM0Z5U25ZdEdyeVkzcFVo?=
 =?utf-8?B?RmpIcThpdjFPWVNsWERwbUpoSUFESmJIWjJQUjF5OXhwRlNQUzlOc2FyTjNa?=
 =?utf-8?B?NW5COEloTjJGTkZ3QmhVOXJ0aVFIQzBhQktaRUhmbnpZb0RlcmhmaTdqaEZ0?=
 =?utf-8?B?bEpRaFQ5QUJPTFhCOGlFQkVjT1RNeHhlcFg1c1RpUzlkTmY5U3Z1QUQwSURl?=
 =?utf-8?B?d1pud0FRYlJUUGRwWUNJUVNrdUNlSWJlZngzSXFkR0Z3QndJdEEwVXExYm05?=
 =?utf-8?B?UWY2ZG9lMlRiZ1lyZDNJMWtkY01JZEZpc1ZBekZ4ZlUzVG9wT04zRmRKdUJH?=
 =?utf-8?B?V0V1ZGNKNFhLQW9MVzNvS1NLOENXYTAyUkZqb1JMbE5nSzByalhVWWpuVE50?=
 =?utf-8?B?alpwMnBNS3hYQ2NTS0oxK1gzb1hEK3VSMHNQeGNPK2U4RjdDUGV6c2l1RzVT?=
 =?utf-8?B?bUhTSWJjSTZQOTI3S0xPMGN4SFFNUXk5S3RFbmNpTElyajRkNTJ5ekFWMVFl?=
 =?utf-8?B?NGZFc0gxZmw0aFgvZTVRbGtha2Y3WUNOUlBZcmoybEZSL0RWdmlySy9saWxu?=
 =?utf-8?B?RU53bmpkbDNlZTk3NWp4aEZzeGdnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b01240ce-9de2-459d-516e-08d9e7bd6cf5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 09:05:01.4206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpM/JUxsUqaYWOF1lKaayvm9FBjfxhmonzAnq+biCci+/Ilw/Pfn/7KlFVK0P1om7hbciStTltlsZck87GJHzTY+AWmowPXTi31gcGss114=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4326
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::72e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::72e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

03.02.2022 19:30, Hanna Reitz wrote:
> This is a rather simple class that allows creating a QSD instance
> running in the background and stopping it when no longer needed.
> 
> The __del__ handler is a safety net for when something goes so wrong in
> a test that e.g. the tearDown() method is not called (e.g. setUp()
> launches the QSD, but then launching a VM fails).  We do not want the
> QSD to continue running after the test has failed, so __del__() will
> take care to kill it.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 42 +++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 8cdb381f2a..c75e402b87 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -73,6 +73,8 @@
>   qemu_prog = os.environ.get('QEMU_PROG', 'qemu')
>   qemu_opts = os.environ.get('QEMU_OPTIONS', '').strip().split(' ')
>   
> +qsd_prog = os.environ.get('QSD_PROG', 'qemu-storage-daemon')
> +
>   gdb_qemu_env = os.environ.get('GDB_OPTIONS')
>   qemu_gdb = []
>   if gdb_qemu_env:
> @@ -345,6 +347,46 @@ def cmd(self, cmd):
>           return self._read_output()
>   
>   
> +class QemuStorageDaemon:
> +    def __init__(self, *args: str, instance_id: Optional[str] = None):
> +        if not instance_id:
> +            instance_id = 'a'

this is equivalent to simply
  
   instance_id: str = 'a'

> +

I'd add

    assert '--pidfile' not in args

to prove following logic

> +        self.pidfile = os.path.join(test_dir, f'qsd-{instance_id}-pid')
> +        all_args = [qsd_prog] + list(args) + ['--pidfile', self.pidfile]
> +
> +        # Cannot use with here, we want the subprocess to stay around
> +        # pylint: disable=consider-using-with
> +        self._p = subprocess.Popen(all_args)
> +        while not os.path.exists(self.pidfile):
> +            if self._p.poll() is not None:
> +                cmd = ' '.join(all_args)
> +                raise RuntimeError(
> +                    'qemu-storage-daemon terminated with exit code ' +
> +                    f'{self._p.returncode}: {cmd}')
> +
> +            time.sleep(0.01)
> +
> +        with open(self.pidfile, encoding='utf-8') as f:
> +            self._pid = int(f.read().strip())
> +
> +        assert self._pid == self._p.pid
> +
> +    def stop(self, kill_signal=15):
> +        self._p.send_signal(kill_signal)
> +        self._p.wait()
> +        self._p = None
> +
> +        try:
> +            os.remove(self.pidfile)
> +        except OSError:
> +            pass
> +
> +    def __del__(self):
> +        if self._p is not None:
> +            self.stop(kill_signal=9)
> +
> +
>   def qemu_nbd(*args):
>       '''Run qemu-nbd in daemon mode and return the parent's exit code'''
>       return subprocess.call(qemu_nbd_args + ['--fork'] + list(args))
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

