Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B772B394635
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 19:08:15 +0200 (CEST)
Received: from localhost ([::1]:55722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmfy2-0002Jx-8W
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 13:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmfwj-0001cE-Ar; Fri, 28 May 2021 13:06:53 -0400
Received: from mail-eopbgr50136.outbound.protection.outlook.com
 ([40.107.5.136]:21814 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmfwf-0006sF-Oo; Fri, 28 May 2021 13:06:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WS0uAAZ3DkJpdY9eEENo3c1hjBNHCxrWL18OKFqkfqKBLch06nIsj/kG2gy7umumnqz9a3sIuQcIIn/OPzdWCr2q7Z1u3WF2VZ6XYB4K+mJEllWpcNP1jTdutR4gzQpZu9/lPRZ9YC9hGdKoDFPLz3RGQZjwLfcPy+M4UGgQhfRYARTIlrDgZkXLTDvuF3Dm5CNA65MpKJUzMtJaNZoO8z4hOucnJ6wUL5d+DJMgLgGnEzzeteOj0YYKw3Nh41v8tBl+0j28pJa2uWrNUVJJKGGvqggjRkRZAg9F0+mjTRFIC1Q5SkEW1myKIgaNza3HilOfgi0mOETZDDxp1uXs7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiOT3xyAl5FkgrabxXVpKDdEBeD3Eugs7HiBT/6XiTs=;
 b=Bed8FdHbF2OjjppOpnyEgYoD+z9a/3ttVfQhCYer4gRU5BYjqnF2fq2KsE9EgT1yaexNpSCwj3hjuNr0cKbMjrhWC18eRT8UKm8WclBuvmu6HGgLko4eBl0VR9IqEv9wl+/K8sC5NwbaDcqmiFmX2ehTxG5JJTnyVi04lOQ75jDKJySAgP7Sm+GoTPyJEw3JRW7XgrsXW0FP9/2lGsP2pzL3v3/MKgwjTxo9bjn1f/9H4HkJ8oIfth00t2KSWQo0o/BD13hAi9GWTXtKAH8EUgweKMwtMyDu1RqrkMLDjTXO/oqB/gfWpZUYIObuzWduZBBBIHIZQd6PaFh6vezBAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiOT3xyAl5FkgrabxXVpKDdEBeD3Eugs7HiBT/6XiTs=;
 b=oOnYVaBpsiq/epLSuogUdMpR0A0imD7+lk+CgEwH4JiQoRbCmV/yJ5BNoAVWqA3k4fJwpJqvPW8ssNUQ7DiznJuoCDp+T6P8eiXNPOrc+9cSaQVS+XkpDYcTGFAcu+ubI7k/H2RepcIBiAJiAt7RudX8+QfHP7ZDmObV3DyEDjo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4168.eurprd08.prod.outlook.com (2603:10a6:20b:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Fri, 28 May
 2021 17:06:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 17:06:45 +0000
Subject: Re: [PATCH v4 05/15] qemu-iotests: delay QMP socket timers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-6-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5bde3128-e972-3653-308b-4faa4eb52bb6@virtuozzo.com>
Date: Fri, 28 May 2021 20:06:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-6-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: FR3P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 FR3P281CA0036.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.9 via Frontend Transport; Fri, 28 May 2021 17:06:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb4c8691-f618-4689-ac12-08d921faf8f2
X-MS-TrafficTypeDiagnostic: AM6PR08MB4168:
X-Microsoft-Antispam-PRVS: <AM6PR08MB416831B680313306CBB71C2BC1229@AM6PR08MB4168.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AMvpTNnKqZkpy2TZLAJqlgSrlGOuJ/6FlZeMnhwuC273+f5g3m/FSGLUd3/mAkN8yBQpLOmZ8R4H+/YJzjT57D6W7EAmypsHfipRrJMNWal3Snnsjt2hehOjgiU/LsQEHeiuwIUqpBDbc7EYpObcBJ7j1DVF5xdkwffP2KvyeCq/QPa/t4rW1N4FilNTH4gtc7yVI1eH8CUb8FnxAJmGWZOAf4VJ4DuRSrmVZIgJ+t7s1iCrylo0wURnxvV6mhW7+f//mCJq7bkKxhpTDQW/8g+m2A6KzXZ3ECZLMOrQphrWcZIyZ6BqjYIIY/hS706fcDlJxRWMf+XoBzFeztRdj/sPaAq81qjuTrNSDMpDDFLqk4/O8mMerAvXda/8fFqKEglwMC650qVomJseGqWFX0bx2eCw+u7iQC20i4dsqL6FYEADYB8OZOnlUDAnBbsI73GwO+JO9HXCz93o1qK9IEJ8a+g9cJ/WJoUeWJY2CKS6WSEcd3QDiLabkU4fywN++lwINaMl7j77s2tfzqJiB8XsiogXAtGENvdmpX92nsnM4rEAGkzu8Baghq9crwpNtr5D1VBb4C6cthNW9ysZ8i13d520JLWVTtXCCJebXVYCEmnS4IDRcEqqiaA7KUeVJsZhBFVfJbSOCzY013nnJDlkra5Qm2OAH//aHdpKz3Ch86LrrTWTCj/dBrPs7upA6N2t2hydnc+LgmEkRUCy6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39830400003)(346002)(396003)(376002)(83380400001)(478600001)(38100700002)(8936002)(8676002)(6486002)(5660300002)(31686004)(86362001)(52116002)(66946007)(31696002)(66476007)(66556008)(2906002)(36756003)(26005)(38350700002)(316002)(16576012)(54906003)(2616005)(16526019)(4326008)(186003)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHRPalMvdUV5VENmaTR2ZmRPNTEvaXJvMm1kWnJrbG5sL1JPbzNOR3d1dGU0?=
 =?utf-8?B?TUg5Qjc3RTVhK2FnOS9kMzhJVTlqbzVoOUhUd0Y1K3JlYnM4QkZYdU1sWktv?=
 =?utf-8?B?Qlc4TGRzaml6REN1VHdKUGxGMjBJdjJiRngraWloZmV5bEZFZ3A0S1Z3WVZk?=
 =?utf-8?B?amdKZlVuaTU3dUhCUmdDR2xsR2RjNGc3elZ4ZW9QY1BtbEtTb2s1Snk5K3o0?=
 =?utf-8?B?QUtIcnlKdGNMS2RNRUZUQ1RTcTBiVlp6VTZSd0xzakxDZFUwNEFVV0w3OVlU?=
 =?utf-8?B?RTJFKzdJR1FWTkZCRllDYm1md3lSbGFkMUljMll4VWlnRGRIRm04MGkxLzZZ?=
 =?utf-8?B?Z3haYXpHNkdvbkdrMDBLMCtyNDZSeVgvUFpESnViZU1ZYjlzZmxhWFdWRGEv?=
 =?utf-8?B?OVNwY3h0RnZGSmk0ZE82Nm1MUzB1UnU1cWU1VHozQWZtRFREYmxNUFRWeWhB?=
 =?utf-8?B?TVNoZWhUU0w0OFZFRktjanF4QVk2eVlja1drbUpsNTh2dXd3TzVTMFFQamk0?=
 =?utf-8?B?TjVEOGMweXpid05XcGtYaDNrT2lOUUNTWWsyVURHazBSVU9nV09XVVBYSGR5?=
 =?utf-8?B?b085cUxpOGxCY0JkNzN6NjNOVmlPenBkRHlNeFhRaGEveXREWkdFZGZlS3RF?=
 =?utf-8?B?R202UlhGM3R1M0w2U1YxWUdmcnZCSDFwUkJneWlLWkM5dnkwemk0ZzhJUTlH?=
 =?utf-8?B?dEtXUGpIM2NMZlN3Uks4MEE4N2lNSGdzanR4UmpVWmZNc3F3b3d0bkFLYWoz?=
 =?utf-8?B?N3ZhaFE2QXVsU0dkWUpnTjZqTkZCWFc5QnVNdFV5bU5UUEhVWXlaamIzSWpa?=
 =?utf-8?B?MEpzWXk4MmVxY2hKS2lNVnhXRTY0MGdJN3loNlAyWnVJenNXbzY2Z2N6T29o?=
 =?utf-8?B?dGpPYTNXZDVnb1VsQmV1QnVwNHVJSVZreWVTSmRqU1NGME9Lb2RVQnp5WDly?=
 =?utf-8?B?MnczMG11aGh5WmtKZCs0QVNJVmpWRkxzQldaNG4vR2lncUg4OEp3V0I3STlX?=
 =?utf-8?B?TUlHYWxjZnBXVzlTeWtRSm83ak92VmNsNmhqYitPM2JSUVVRaHViME5lT25H?=
 =?utf-8?B?VDB2WU5CYUZXVGEwelZ1WFdaY2lyK1hJTnRzS0FMMERZTCsyZDE1cXZ3ek9L?=
 =?utf-8?B?clpOSGVkb0VCbU8xUS93RmhyTWNmZ01zVlBGTVlwU2lIN1UzYzU2SkpIU3o1?=
 =?utf-8?B?YU1xSFg4ODB2ZmI4U2dWemc4c3NwckM2NUIrekV4MDFmbEJZekVybktBKy85?=
 =?utf-8?B?UXYrTGhUaHlBcUZKelhlOXFIZ3F3SklQWlpKZHVTdGFxQTBEV0tkajVZeWFm?=
 =?utf-8?B?YUdQK2ZQSXNoZ3I5elVEejZ5alNHczVnRndrNVJLVGJ3a09DRDNxdmlZd3dH?=
 =?utf-8?B?MlFDN3RtM2ZWZVZlOG0vc3ByUTNCbHpXYWJTMTNrYmcvNkZLTm92cjVibnFB?=
 =?utf-8?B?cC9xdk5qc1VXYmVueDZmemRVcjYxY3VJZVk4ZW4yb0l1dzNqNSsyQVhra2lw?=
 =?utf-8?B?T1I3cTRjazQxTklYTU5wODAyUnF5bnhya3VnSFNNc1J2TDNVbXpXT0E3ZC9F?=
 =?utf-8?B?SHRVelRKOC9YdnlTN1E0UnRRMmFvWWEzQnUyM0FLSmJRUDJYb1lQcTJWM3Vs?=
 =?utf-8?B?MGk1QWZXVkNCQlhXV1RRN1Q5WmxqTzI1MnR6QzJWS0hDU0tmWUl0cUl5UDAy?=
 =?utf-8?B?VndHNUNOLzNPSTFHcFhpLzZ1TFg0TUYyWGFwVEJUOFVSNU1OQW1Jb01mUnk1?=
 =?utf-8?Q?DIc6uv7GxNiK5pHQR3oPY31UxWpIfSG/MxPdM7g?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4c8691-f618-4689-ac12-08d921faf8f2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 17:06:45.3134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEZIMoXG2GGw3U8BoMa3G09IwaAdYjMvt2zG9GLIiBf6N6F08g88fR+Qad6fYG6SSNKR5KQdZopSvoZOBAsPxTsaG9KxOe6uDMYe2BN/2/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4168
Received-SPF: pass client-ip=40.107.5.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

20.05.2021 10:52, Emanuele Giuseppe Esposito wrote:
> Attaching gdbserver implies that the qmp socket
> should wait indefinitely for an answer from QEMU.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index d667fde6f8..cf1ca60376 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -478,11 +478,13 @@ def __init__(self, seconds, errmsg="Timeout"):
>           self.seconds = seconds
>           self.errmsg = errmsg
>       def __enter__(self):
> -        signal.signal(signal.SIGALRM, self.timeout)
> -        signal.setitimer(signal.ITIMER_REAL, self.seconds)
> +        if not qemu_gdb:
> +            signal.signal(signal.SIGALRM, self.timeout)
> +            signal.setitimer(signal.ITIMER_REAL, self.seconds)
>           return self
>       def __exit__(self, exc_type, value, traceback):
> -        signal.setitimer(signal.ITIMER_REAL, 0)
> +        if not qemu_gdb:
> +            signal.setitimer(signal.ITIMER_REAL, 0)
>           return False
>       def timeout(self, signum, frame):
>           raise Exception(self.errmsg)

So, you just make the class do nothing.. I'd prefer something like this:

@contextmanager
def NoTimeout:
    yield

if qemu_gdb:
   Timeout = NoTimeout


anyway:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


> @@ -576,7 +578,7 @@ class VM(qtest.QEMUQtestMachine):
>   
>       def __init__(self, path_suffix=''):
>           name = "qemu%s-%d" % (path_suffix, os.getpid())
> -        timer = 15.0
> +        timer = 15.0 if not qemu_gdb else None
>           super().__init__(qemu_prog, qemu_opts, name=name,
>                            test_dir=test_dir,
>                            socket_scm_helper=socket_scm_helper,
> 


Still, it's not simple to avoid any kind of timeouts. The most annoying would be timeouts in event_wait() / events_wait()

-- 
Best regards,
Vladimir

