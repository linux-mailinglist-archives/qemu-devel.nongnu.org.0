Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E9C4166CB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 22:37:37 +0200 (CEST)
Received: from localhost ([::1]:38754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTVTM-0004db-GE
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 16:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTVJm-0006GO-VU; Thu, 23 Sep 2021 16:27:42 -0400
Received: from mail-am6eur05on2137.outbound.protection.outlook.com
 ([40.107.22.137]:46304 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTVJf-0005LJ-7P; Thu, 23 Sep 2021 16:27:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrvhqxSx1ypb3MZOCsTb5QfgsEUIbsZUHVBsZCxxBVpRqSjTf4gqHQZrOEyyx3yQELvjF4jEQ055DbfXVcLbphDvdPJGlwHrTUrb0JAoGCoygM/sXBzb7hWJHvdeV7ouCfKp4WAIBwHfCuxoVkiVFuUpBaN7FTTzfYwQHBAFZU/hRTWEccuh6nY+a4e74Is7kzfNVMzUs7Y5jLiKwt61fGlb9RiHRj/WQ55gRadh/B5Sq9MPe8wsuIIx7OTuHA1okc9k3NBMfxu9RhPDdfzkIlIpBEayjJKCzfcWVuQy9hNg8mohDjFh0bCkGwzvikWseLGvdJxYhOlCW4q3PdDcQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=S4pwzVhkIcuLMAatttPFY4y0fIDKHbS4co03CSaD9ZU=;
 b=QtTXtONmyrfpZEITDs9koEDUYQEH9OzexvYbsZ5pn26DgzFz1VZ2s5//sXQFtTQad/fLNvVwWGw4dwD0kPRKhBd/+0aMgC9IR0NTD9Xd88O9+odPKf7jhV5qxrvbT+q+plvrPHxUod+ZObmTRC9gqTKqNPmSSMnEwyXypMwHRj/tO5R0vLw7tl7+Zrnfwr8ihVA4spEfviL/a9RnUMDMldPdBF/l1oukvT97JMMN48gAWtY1cgLuES+OwgGCv4YIn/U8wdIRBZyfT0svyAN7OoYUH1FV09GdLmVQylYTCmvv/Yn3FRKCZOuJRAWnl2BQNA/iiCqlaR6cv0qHOi2H+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4pwzVhkIcuLMAatttPFY4y0fIDKHbS4co03CSaD9ZU=;
 b=ptTFil2eXRcKUh//+L+9kNFBC1hd1O/7vi5PHFGoqb1Gdvr0IqhElXw56/OKluGosxpGyIldrfMQDTHGl28DyE/1tghu0FioHjRzF45h/7gK2cWNlkjYXIaDb3fqSsQEGkzdJVIDOtbW8hdBfKzADaAtZ/LWEq/4LDmx+XjkXNM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4277.eurprd08.prod.outlook.com (2603:10a6:20b:bd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 20:27:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 20:27:30 +0000
Subject: Re: [PATCH v2 2/6] iotests: add warning for rogue 'qemu' packages
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 qemu-block@nongnu.org
References: <20210923180715.4168522-1-jsnow@redhat.com>
 <20210923180715.4168522-3-jsnow@redhat.com>
 <d9c1be2a-e927-49a1-b30e-f99d48946928@virtuozzo.com>
 <CAFn=p-ZVo3Tgm6p3_DNvQa+1uqbfpThTmSkHmSK_A0BkGHNrgg@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c17f8ec5-48ba-3ab9-078e-8f62c2dac72d@virtuozzo.com>
Date: Thu, 23 Sep 2021 23:27:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAFn=p-ZVo3Tgm6p3_DNvQa+1uqbfpThTmSkHmSK_A0BkGHNrgg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P193CA0017.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR3P193CA0017.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Thu, 23 Sep 2021 20:27:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3a99e5c-902a-4bca-ee1c-08d97ed0912b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4277:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4277BC0C6EEF90D67900E0D4C1A39@AM6PR08MB4277.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qMYeSOfbJZkRH9QZUC7kTee1wZflqL1mdRPGPi9CBDK4mareC6EDKndk/YEn6U8oa+foXo7ReB4oFI8zxbq5996tJi1Uta6Yisk82zweV1a5CwjdJ0b4iJsyRFZ0m9azcTtUDivISVebLnqL/relEuIXonJsvqCXuMdecLMi3PFspWoNLnC2u/vxQ6D7vILaURRBA+To03s9HwMlYe2r5LiM72j2XW4eeKxhqZc2onh+Vm8+nQZm0tTevKwUIoTMV8UsYzENqHOKqCcytGJLy16ix1XDhRq9MPlzEC1eqVIWUbpbAbRYG+mWTdVUywzboymQ4rxgk4pCBkTNUgP3RD1hcxcCumQPc4anR5qK6o5uTjnmq5+fWjwpHpYURvJkhE4iUZphvHPs5uB1oLO/zmm68Yxz9SXy6/CXAogWlqRvauf+XqTuW3825DNp0UaMP7SnoFjZFFc9Kdzpti0gmPoNYQckE7kEbYg+NamoAwsANkUKYfMcbTc+emH3xetow1mBLXfUesQMGl7ytFs4xZeSeMSIMtte3g962zbcVAbNeeXu4grah5XX14woNC8ynFDDV11NtBS7i062zRhJQU8uuQtEj2du+qur6wQMZGsMqs+ddDnXmvIxoM4na3nB/8N63Uw3hobijwZH3nDHIbz8tDxuRq8MMockt0V3lWRpVsSssJuwqh/id9D1IB205fpZI/4BN8qQKsCzQrvduVgzEznYhMxbRTfvazmtmS5ESgph9RTsPFN4N0Jwq4vxSbb8oo1mDRmL3Fz3/wxBqxe1iJs/dws8PpnJiXwVrwB+rMx4wOUd7YQUV3k0HY/jWcHw9jpQO/PAiCNzoOWYIDBtun9vijGlt7N4k4qulfo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(6916009)(316002)(38100700002)(66556008)(66476007)(36756003)(66946007)(31686004)(16576012)(956004)(2906002)(8676002)(31696002)(508600001)(54906003)(2616005)(8936002)(4326008)(83380400001)(6486002)(86362001)(26005)(186003)(52116002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnNFdmJJd1JlcFA1eSt6L3BxdVVVSkRxT25CL05BVWVLQ2xuZ014TENwbDdv?=
 =?utf-8?B?QmZGaElxdHNuemU5R29ENkRkSTFlMVZxNEV0RjFHM3JCUTR0bzZKVGFiK0NO?=
 =?utf-8?B?U0t4aEpWZWZsL25hY2NHakVBcDNTVWZjeHNzOHAzdXhXVlYyajViN0svUTlj?=
 =?utf-8?B?d0tSeEhXbEpnNzhrNyszSGJYbFJhK1l1NHJPWHh0eTJZcU5SM0c4dXlRenhC?=
 =?utf-8?B?WGE3V2t5YUNkaUZWQWtPcVVDWlVrdG11TjJrRitBUFlyZERURUQ2Y2NsVGRQ?=
 =?utf-8?B?R01IcHJwNkhTUWlLNU45dUJvRFBOU3FGdHpaaWl2bzd4QXVobWhtek0rWFNB?=
 =?utf-8?B?OElPOVNNNWFqZ00zTG1zUlhETkc2ZkZoR2pGUjdhNlRQdnk5Mm1YNzQwUDdr?=
 =?utf-8?B?Z3pRVy9vdzJ6aStUU04yT2VEWFI2emwxbGppK1lwa3k1Y0FRZ0N2cDNDS1ZR?=
 =?utf-8?B?c0FWcVgwRWZCclBGUEJvUlZBZlBGNkhuR1VFNzhPUVQ2eklqNXg4bHRnNGQz?=
 =?utf-8?B?OWRENTFNQnBwYkZLNE4rWHprNy9CbnZFaE16d2NVVm45bXozb3ZvWmhIemEr?=
 =?utf-8?B?RjIzYm00TWNRMUpxN2F5SGtZQnlaYURWR3h0Z0lrakFZWlFXK1JwR2ZhWnpN?=
 =?utf-8?B?UloxS1FZeXBwWjVxdURTUjEwSUYyRThqUERxcjh1VTNuMmFWRXRvNkg0ODFt?=
 =?utf-8?B?SitwWmZNNzRTZkhXaGpUU2pPcE1OZEozYmVqd2RFdGx2cEdYaDQ2d1drN3NT?=
 =?utf-8?B?STZJdDV2NnJJWUFZSmJDNzR4cjBKZ0NaUzVTVi96ODdTRVFXQUtIdzB4RWta?=
 =?utf-8?B?V1RJbkRZazBQQzIvbHJpZ3cyVWdYTi9Ba0VBNnFGKzQ3RDY2SlBsN0xtank5?=
 =?utf-8?B?RGJtYWpzQkl6Qko4cnJCRURTSVdvMll4TkgvbjBDYTRuS21jME45UHBxRVMr?=
 =?utf-8?B?M1V0M2tqdW5CNG42eElwMzlKUVVFTFc0T1ErRXVYWHFXdGtpNjl4TzYwYndr?=
 =?utf-8?B?QVJheTF0ckc0QWRKczFLaVlZamgwcE9QejZUbk1saG5PSUErN3ZWZ0dwZjIz?=
 =?utf-8?B?WjFtdEY2ekJjNVNNbys0K3huMmV1elBlSHc3SWUyZXFLUE4wYjMrenJlMXE1?=
 =?utf-8?B?bldraERVQnVUZkErdUtQMGpteFBCbEQ0aitNbTJEYzBGNysvTXA3ZXhyN1RI?=
 =?utf-8?B?MTEzQUt1WEhiZFM2a3RmR2U4TTZpNW1uUllsYTEwQjZSVWVyRHVhUHV1Q1Fl?=
 =?utf-8?B?dThWVlMwMUxPaFd6SERZUkV6OERCdm5pZCtYRVlUaTJXZW1NM252WVhFYkNj?=
 =?utf-8?B?YThuYVlsaVQ5UWxDbzQxNm40enRHdUFDRHJlam9Nd0pJZEx1RXRrWk1hS1By?=
 =?utf-8?B?TGFhY0hMdEs1L0gvZzVVQXp0T3RHUzBiOFZnV0VNQU10V3BSYzJWcHo4WFdR?=
 =?utf-8?B?UjUvT0EwdGxOeEFFWExTQzlmcFdNZ25oclk2ODhtallzMDhjSTZGYzhSa3NW?=
 =?utf-8?B?a3NpQVJBeXQzUC9aVjNHWXpaZUdIbmpXMDJkeUpnd203WENkKy94U2txUjRJ?=
 =?utf-8?B?bjNFTzE2UlNTeXVESmV4Z0RPelZaM0pRQlJKUEdyajZ2M1UvNm1rYXJwdXZr?=
 =?utf-8?B?NkJTMmlEb1ZkdTdjZFQrN2RzQ2NzcUhjaWJoSEhNd1JRUXpuZDZ5eURjeThH?=
 =?utf-8?B?QUc1V1JZNkRsTitnNzE0ejdMYmZGS2N5YmEvL1ZVMTU0bTdiSnJlTHp2Nng3?=
 =?utf-8?Q?fj4cc2ZfCne30cLE44sbzlLfDxUIvpABLpVmH6J?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a99e5c-902a-4bca-ee1c-08d97ed0912b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 20:27:30.4952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CrHE/h4WKOkIOSgsh3/IuXnCJ0Q5V9+GEwUunw2A6B2cX2/AfuHnpd1/9V9Gp7dlLoLfgrFGFUHduMWKiq4QMWISqUHuH+CMpd/1I9lB1KE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4277
Received-SPF: pass client-ip=40.107.22.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

23.09.2021 21:44, John Snow wrote:
> 
> 
> On Thu, Sep 23, 2021 at 2:32 PM Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>> wrote:
> 
>     23.09.2021 21:07, John Snow wrote:
>      > Add a warning for when 'iotests' runs against a qemu namespace that
>      > isn't the one in the source tree. This might occur if you have
>      > (accidentally) installed the Python namespace package to your local
>      > packages.
>      >
>      > (I'm not going to say that this is because I bit myself with this,
>      > but you can fill in the blanks.)
>      >
>      > In the future, we will pivot to always preferring a specific installed
>      > instance of qemu python packages managed directly by iotests. For now
>      > simply warn if there is an ambiguity over which instance that iotests
>      > might use.
>      >
>      > Example: If a user has navigated to ~/src/qemu/python and executed
>      > `pip install .`, you will see output like this when running `./check`:
>      >
>      > WARNING: 'qemu' python packages will be imported from outside the source tree ('/home/jsnow/src/qemu/python')
>      >           Importing instead from '/home/jsnow/.local/lib/python3.9/site-packages/qemu'
>      >
>      > Signed-off-by: John Snow <jsnow@redhat.com <mailto:jsnow@redhat.com>>
>      > ---
>      >   tests/qemu-iotests/testenv.py | 24 ++++++++++++++++++++++++
>      >   1 file changed, 24 insertions(+)
>      >
>      > diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
>      > index 99a57a69f3a..1c0f6358538 100644
>      > --- a/tests/qemu-iotests/testenv.py
>      > +++ b/tests/qemu-iotests/testenv.py
>      > @@ -16,6 +16,8 @@
>      >   # along with this program.  If not, see <http://www.gnu.org/licenses/ <http://www.gnu.org/licenses/>>.
>      >   #
>      >
>      > +import importlib.util
>      > +import logging
>      >   import os
>      >   import sys
>      >   import tempfile
>      > @@ -112,6 +114,27 @@ def init_directories(self) -> None:
>      >           # Path where qemu goodies live in this source tree.
>      >           qemu_srctree_path = Path(__file__, '../../../python').resolve()
>      >
>      > +        # Warn if we happen to be able to find qemu namespace packages
>      > +        # (using qemu.qmp as a bellwether) from an unexpected location.
>      > +        # i.e. the package is already installed in the user's environment.
>      > +        try:
>      > +            qemu_spec = importlib.util.find_spec('qemu.qmp')
>      > +        except ModuleNotFoundError:
>      > +            qemu_spec = None
>      > +
>      > +        if qemu_spec and qemu_spec.origin:
>      > +            spec_path = Path(qemu_spec.origin)
>      > +            try:
>      > +                _ = spec_path.relative_to(qemu_srctree_path)
> 
>     It took some time and looking at specification trying to understand what's going on here :)
> 
>     Could we just use:
> 
>     if not Path(qemu_spec.origin).is_relative_to(qemu_srctree_path):
>          ... logging ...
> 
> 
> Nope, that's 3.9+ only. (I made the same mistake.)

Oh :(

OK

> 
> 
>      > +            except ValueError:
> 
>      > +                self._logger.warning(
>      > +                    "WARNING: 'qemu' python packages will be imported from"
>      > +                    " outside the source tree ('%s')",
>      > +                    qemu_srctree_path)

why not use f-strings ? :)

>      > +                self._logger.warning(
>      > +                    "         Importing instead from '%s'",
>      > +                    spec_path.parents[1])
>      > +
> 
>     Also, I'd move this new chunk of code to a separate function (may be even out of class, as the only usage of self is self._logger, which you introduce with this patch. Still a method would be OK too). And then, just call it from __init__(). Just to keep init_directories() simpler. And with this new code we don't init any directories to pass to further test execution, it's just a check for runtime environment.
> 
> 
> I wanted to keep the wiggly python import logic all in one place so that it was harder to accidentally forget a piece of it if/when we adjust it.

Hmm right.. I didn't look from that point of view.

So, we actually check the library we are using now is the same which we pass to called tests.

So, it's a right place for it. And it's about the fact that we are still hacking around importing libraries :) Hope for bright future.

> I can create a standalone function for it, but I'd need to stash that qemu_srctree_path variable somewhere if we want to call that runtime check from somewhere else, because I don't want to compute it twice. Is it still worth doing in your opinion if I just create a method/function and pass it the qemu_srctree_path variable straight from init_directories()?

My first impression was that init_directories() is not a right place. But now I see that we want to check exactly this qemu_srctree_path, which we are going to pass to tests.

So, I'm OK as is.

Still, may be adding helper function like

def warn_if_module_loads_not_from(module_name, path):

worth doing.. I'm not sure, up to you.


Another question comes to my mind:

You say "'qemu' python packages will be imported from". But are you sure? We pass correct PYTHONPATH, where qemu_srctree_path goes first, doesn't it guarantee that qemu package will be loaded from it?

I now read in spec about PYTHONPATH:

   The default search path is installation dependent, but generally begins with prefix/lib/pythonversion (see PYTHONHOME above). It is always appended to PYTHONPATH.


So, if do warn something, it seems correct to say that "System version of qemu is {spec_path.parents[1]}, but sorry, we prefer our own (and better) version at {qemu_srctree_path}".

Or what I miss? In commit message it's not clean did you really see such problem or not :)

> 
> Not adding _logger is valid, though. I almost removed it myself. I'll squash that in.
> 
>      >           self.pythonpath = os.pathsep.join(filter(None, (
>      >               self.source_iotests,
>      >               str(qemu_srctree_path),
>      > @@ -230,6 +253,7 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>      >
>      >           self.build_root = os.path.join(self.build_iotests, '..', '..')
>      >
>      > +        self._logger = logging.getLogger('qemu.iotests')
>      >           self.init_directories()
>      >           self.init_binaries()
>      >
>      >
> 
> 
>     -- 
>     Best regards,
>     Vladimir
> 


-- 
Best regards,
Vladimir

