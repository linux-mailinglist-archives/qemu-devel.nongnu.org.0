Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066153F4F74
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:23:20 +0200 (CEST)
Received: from localhost ([::1]:45804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDfL-0002OI-4A
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIDeW-0001Z4-C2; Mon, 23 Aug 2021 13:22:28 -0400
Received: from mail-eopbgr40100.outbound.protection.outlook.com
 ([40.107.4.100]:39235 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIDeS-0007xB-I7; Mon, 23 Aug 2021 13:22:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVKqz/nHx6iqKOJpUGkzBAeOFwmFXG4QRG0Ct95XT3IlgiD2n9wQciWRCYXo4WGC6wYljuswwEOj5CBvo8LjZqd3lu75Kzkj7HBsCZ+Ij3ur99mlleoYCz8zVYwTU7lW0u5H7GCKsq4Xeitz0LKzI9glFPkLFTWugNLTsx5E7xOSafEvNlIM3u/vGnMfD6etXrkU49FmLmW5FVvji2S/1ldaKwgFoFDqf8FHOC5lZfPSTahcY5lD3f1wAe/f1WMyD1QCGDcofPNjV1Tt6UZ4+X5Tct7ej1xqUXYwXI0drkvK8yNsn6Z3mSUtOL8SmoYOPdhX0dz1i87Bhj9XYOLU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCrRz3zPn8d52cDK/5pe3P1uSQ/5actDQfK5KOkzYBs=;
 b=n+b6pM6pYHkqrHb4lqnhT5OzmxfLzXLUZIpPIxTCq6PLpgyIHVODOXIUAwpIcuuxBqTNmBNFovfLQXlA5y6AY+/9ydq1QM8yAxLQ1Zo7NSwHAaGZOybH/6sDrsXRL8/abUVnxaZb5NhOV2aDFaYbz5KzvoiQEGiJMoxHs1n4UsUNNSbN3Y2orQumcicSIksWVmlWtxCO5h4T2+p9kPBcKVU4DLylNaxdhiHDevgfuyvykag18YI4EdqqEe7sWoPJETMWe7IYq+k6AhhvfWvXJSDHgUKS88Y1meO9/wnybhxTrjGJ+zSK6gIlueyulvQg307PPsrvyFuARQRlz720GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCrRz3zPn8d52cDK/5pe3P1uSQ/5actDQfK5KOkzYBs=;
 b=Qke8I7JIXU2Vtltki+u8h1QWiy6sJXCTNthb0ou0rQXYB8jkCMlYR+Cy7Z2K490PGiYGNG1DnGaPL825SLG/nBkBvF4oMJSP5zLsMBf2fvc4x36h53BmbF0PQcIpJcdMZYWdNoHKovAUCl4O/Br3VRLNP1J/IkZWYbWE49/uwLw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5383.eurprd08.prod.outlook.com (2603:10a6:20b:102::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Mon, 23 Aug
 2021 17:22:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 17:22:17 +0000
Subject: Re: [PATCH v7 25/33] iotests.py: VM: add own __enter__ method
To: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
 <20210804093813.20688-26-vsementsov@virtuozzo.com>
 <CAFn=p-bFQvAnBypxqO7HUob+JJk=d1tp0juJXzdfU6yK7O_Xvw@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <303bf6ef-4468-ac21-1e68-0324a1b69194@virtuozzo.com>
Date: Mon, 23 Aug 2021 20:22:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <CAFn=p-bFQvAnBypxqO7HUob+JJk=d1tp0juJXzdfU6yK7O_Xvw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR03CA0031.eurprd03.prod.outlook.com
 (2603:10a6:208:14::44) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.249) by
 AM0PR03CA0031.eurprd03.prod.outlook.com (2603:10a6:208:14::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 17:22:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94547a68-57af-4cbb-3ad1-08d9665a8e44
X-MS-TrafficTypeDiagnostic: AM7PR08MB5383:
X-Microsoft-Antispam-PRVS: <AM7PR08MB538310BD8A5D775356143699C1C49@AM7PR08MB5383.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YUOLZIcbdgvkbOXJF1lKURnlzLxADmhPZIJhMD2eKXoEf8vZVAuqwSvnoI82FtDAuXykUI4mDpf2lyQSBBhVCc1wIRHJKVwH32fiYJsBVURDoitS/NSHAXtgiy3n20Lf9OaHaPcAw3332BG6xHEbd/mip4yjuOmRc0nj+qZv/lFzG2bO+BQFHSfdd2Rbk09h5chQwbrC0pTu/MiBU9oFeQRUITV7pV0ivfteSOnlCb4aXGsNhw6Sm5zm0qTmzIsZ7NKoj34brun1lHsTmmPIThB64OsOKwVRGGOBy/+NjagoImr4TEB2VTDCd9pcxzSZXmVAx6DEklfWxy8NFk8InGmAlEEjYIWLYcCegGLwSyOTaXD5Q7h8lPNH5iDajVperga04oii75NfTWaOXm4mXrl3a7zwW/CW8jqoi+e1Tf5JCgdGzxehK57mSBh8aZ3LltYTw+8FztRpNkeLKvCRiNf1CJEDJ79MND6qKkipMNgVT4PQGtZEzL5Ze5bffaJ7ai/GsBXNaaHSwNazQgTLnGI+OYS4WdRm1B5TZnpdOv/tj6KwFFL/qctrKgHpb2hnf+zcRf1gDJbkG6A1ICGI1AaUEyy2Sqa0dq73b6lkGOASmKTv9menA2PNdFe9FPoy5bZg1J93JX0sIRtvwWtRIkiUNl+1IL3Sd9Ogt8hvWs8XXzCovBLEZicLQ0r5jmif9b0yan81aabrsOSmSeMp9OLFKZVb/ii/E4LmST96xkiNNASpnmPPfq/8ShC+3XAbBasrxiADjhSOJv+i6+Y/OQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(346002)(136003)(366004)(376002)(66476007)(31686004)(52116002)(66946007)(26005)(38100700002)(2906002)(956004)(2616005)(316002)(66556008)(478600001)(186003)(38350700002)(6916009)(5660300002)(8936002)(4326008)(8676002)(31696002)(36756003)(6486002)(86362001)(54906003)(7416002)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXJnVXVsTWF4cWhtUFZCQ3d4aVlHU2ZMZXZod0oxSjBydVdoN041Mi91amFp?=
 =?utf-8?B?VXRHOWlBTWNMVDNzeXVIMDVZc1Fic3FkcGdnWEpFZXg1Z1dibSttbkNmcmsy?=
 =?utf-8?B?cUtEc25JdFY1L0VWM1ZtSmdVRnhVTWJldFlhYW9rQ25kdk05YTBFS2ROSU9t?=
 =?utf-8?B?V2pzRHZ0NkJCLytnSzFBT0FvTVRwaS9ZVG8yMnV0bzNqVWM4Vi8xbUIvSk9G?=
 =?utf-8?B?aitVdHlRWVNGY09vSzloU04xdlNwckRxZG5iWFBSUmtldnZSZEJtTHlsQ0Jn?=
 =?utf-8?B?bnlIcWNqSE9KT01odWJGVEo5QWh1NERUbUNEeE1hcmtIaTFkOTE5N0FzbU9Y?=
 =?utf-8?B?ZGpXREl0SSt1UWhkVHFoZkFwZUlWR0JSTk11ckxuUjJBbklKVi9tMlhWQytl?=
 =?utf-8?B?WHNIRjJieFY3M1dlZWRCeXE0dFdHQjU2T3pGZ0wwSUZwZGlyRHhRcnBMYzNU?=
 =?utf-8?B?N1pRc3FZM0xzWjN2ZUJRTDUrK29QOGI2aDc2WEpmRnFudDNSNjNtRjB2aE1s?=
 =?utf-8?B?SXp2S0lUNkhRUHBFQUZCRkcyTXp2YXRORjNvUEdXMzFZSC9Zd1Y0OE45QTRk?=
 =?utf-8?B?Y0xHZjc5d0p2U3lZcEllKzJNcDlGNlhzaExTSThza0duQW5Ib2lFZWtuSytB?=
 =?utf-8?B?aVJyMnIyc0pmdmtlRWVvMEVhekdheHlsWkI5WUNMRjFjSzFnVlVmTWFDaFY1?=
 =?utf-8?B?V09DK0ZJQ3FXa3p0dnJpNHk0dXlYQSs0NnBlTnd6bEFobHBQeERLQnZ6bW1J?=
 =?utf-8?B?QnF2NHBPUE1DSnZUTHAwRDA2WW5kcy9BcFRoTE9nMXF1Tkd6ZXBBbFhXQy9l?=
 =?utf-8?B?Y1V4NnNNS0RMYjNKZHc0TU0zWlUyMzNJOFExTCtUYUVJak9Wa2F5TVMrbVdD?=
 =?utf-8?B?Zi9HMzVaZUJqVnVFQlFWZDU1bkxpS0tPRTVaR1U1TDhCdGhSZXlzMXBGb2NX?=
 =?utf-8?B?T0h0NnFjeEFzdzRyb043TXFmWmdDeEh3NlVYSG1sOUpncUtvTTljZXV2U3lw?=
 =?utf-8?B?T0M0ZmJzcVBOZHA1K0IxN2JMMXpGVEovcnE5eGM3a3hPVnJxeitnK1l4eS9a?=
 =?utf-8?B?YnIvZzhhNEc4Y3Jsa1lLODNEMURLYWdQZ1lHamdXK1RsemJsSy9QbXU3UmV3?=
 =?utf-8?B?ZVVoYnBJSkNmK0pZY0ZBcEt5NENQS1d6MUNnMjJxeXIzQkJuOVE5Mk9JVnlO?=
 =?utf-8?B?Q2lkazUyUWIyU0hITTJzRFpUZlZBZHpabU5qb3F4b3IxQ3I3RVFHUU00V2tQ?=
 =?utf-8?B?UHk1V3lPN01YVlhENkhtM0NLSW43ZElvRHVQSHhEclRSVi9Pb1JmVldIVlow?=
 =?utf-8?B?VWNXdzdPWEI4K2xlQW9uZU9qZFRzVElUZmthL1lFMEhLZXJUcjVvcWVaZmtj?=
 =?utf-8?B?aDBHYTQ2OURtTmhpQzZycmlYNUFvUnBiRVcvWGlOczFNYWZ1eDJzSmpQV3ZX?=
 =?utf-8?B?ZlNPeTFyZ2V4NjNVd0c1RTJuR2lJaGpxcHk1QldCNWFXTkNGck43RHBNa2pr?=
 =?utf-8?B?MTdEaWJudk9GcmFnc3lqV1ZFeWgwN2REKzVZSmRYQXVLS2thUWd2QmkxY01P?=
 =?utf-8?B?T3IxNFVLaTNvSGV3TnZlc0FzbHJZK3NDNjZ4c2laSlJDN3NWYUVROEhBVmhO?=
 =?utf-8?B?VHZJSDVRZVVjNWU2bm5BRDlwckkwV3pGWTVBNWlnZllvSGZKUDZXWFF2S1Vu?=
 =?utf-8?B?dm13dFUxMXpnbStZakRST2dOVlBTaFdVQUVZRGRPY0ZQeFVJek1CVThvZFBQ?=
 =?utf-8?Q?E5rICDszqoMF20LJJXXxh/oO1G3s1oObvAZFjVZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94547a68-57af-4cbb-3ad1-08d9665a8e44
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 17:22:17.0258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImyYueyYkfCDlinHXPmQsFGyCYmyCV8rQrx8LgVFfJX+PKnbE3THAoyBsX4P5//LxgLWto8t4AOfecztcfHbvsoYG15Nw1bl++BSJceqhZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5383
Received-SPF: pass client-ip=40.107.4.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_NONE=-0.0001,
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

04.08.2021 19:27, John Snow wrote:
> 
> On Wed, Aug 4, 2021 at 5:39 AM Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>> wrote:
> 
>     In superclass __enter__ method is defined with return value type hint
>     'QEMUMachine'. So, mypy thinks that return value of VM.__enter__ is
>     QEMUMachine. Let's redefine __enter__ in VM class, to give it correct
>     type hint.
> 
>     Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>>
>     Reviewed-by: Max Reitz <mreitz@redhat.com <mailto:mreitz@redhat.com>>
>     ---
>       tests/qemu-iotests/iotests.py | 4 ++++
>       1 file changed, 4 insertions(+)
> 
>     diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
>     index 89663dac06..025e288ddd 100644
>     --- a/tests/qemu-iotests/iotests.py
>     +++ b/tests/qemu-iotests/iotests.py
>     @@ -568,6 +568,10 @@ def remote_filename(path):
>       class VM(qtest.QEMUQtestMachine):
>           '''A QEMU VM'''
> 
>     +    # Redefine __enter__ with proper type hint
>     +    def __enter__(self) -> 'VM':
>     +        return self
>     +
>           def __init__(self, path_suffix=''):
>               name = "qemu%s-%d" % (path_suffix, os.getpid())
>               super().__init__(qemu_prog, qemu_opts, name=name,
>     -- 
>     2.29.2
> 
> 
> First and foremost:
> 
> Reviewed-by: John Snow <jsnow@redhat.com <mailto:jsnow@redhat.com>>
> Acked-by: John Snow <jsnow@redhat.com <mailto:jsnow@redhat.com>>
> 
> A more durable approach might be to annotate QEMUMachine differently such that subclasses get the right types automatically. See if this following snippet works instead of adding a new __enter__ method.
> 
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index 971ed7e8c6a..2e410103569 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -36,6 +36,7 @@
>       Sequence,
>       Tuple,
>       Type,
> +    TypeVar,
>   )
> 
>   from qemu.qmp import (  # pylint: disable=import-error
> @@ -73,6 +74,9 @@ class AbnormalShutdown(QEMUMachineError):
>       """
> 
> 
> +_T = TypeVar('_T', bound='QEMUMachine')
> +
> +
>   class QEMUMachine:
>       """
>       A QEMU VM.
> @@ -166,7 +170,7 @@ def __init__(self,
>           self._remove_files: List[str] = []
>           self._user_killed = False
> 
> -    def __enter__(self) -> 'QEMUMachine':
> +    def __enter__(self: _T) -> _T:
>           return self
> 
>       def __exit__(self,
> @@ -182,8 +186,8 @@ def add_monitor_null(self) -> None:
>           self._args.append('-monitor')
>           self._args.append('null')
> 
> -    def add_fd(self, fd: int, fdset: int,
> -               opaque: str, opts: str = '') -> 'QEMUMachine':
> +    def add_fd(self: _T, fd: int, fdset: int,
> +               opaque: str, opts: str = '') -> _T:
>           """
>           Pass a file descriptor to the VM
>           """

That looks better, I'll go this way, thanks!

-- 
Best regards,
Vladimir

