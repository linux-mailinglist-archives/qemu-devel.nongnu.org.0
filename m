Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E19D3C6D8D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:33:36 +0200 (CEST)
Received: from localhost ([::1]:34198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3EnH-0004sV-2K
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3ElC-0001js-Hf; Tue, 13 Jul 2021 05:31:26 -0400
Received: from mail-eopbgr20135.outbound.protection.outlook.com
 ([40.107.2.135]:14720 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3ElA-0001G1-FO; Tue, 13 Jul 2021 05:31:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4amZcZ6LOLs3ZbjV4sisvKCUKo9F5Gaqnjz9mi9uKPDlmDaYczerY9Aq/memEMtngo+bx1QkGcWo6xf1pqyyJY7zt9C6H0tFTDWwWA807lVzciHPZNOm2DxM7/zdF2lrtKZf7WEvv6P59dA96Yjm6lDEOGEo25gwcDTn+41mgV7ApOn9LIH30XwlV6Z6n40oKbhKSCpaxOYeWrXFV/+sXXi3ByjeCilh/dqFRY8RfXrYvlYipVSSaPMzGQTZkH0tgd+FLzSLIbq4NYARgWsEVcaAmq/wEoCcXTLnBQoE7hAR281L180ao2/PO+rdf7QVVq7R4ov1zviajady2NNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dLi9npF8j4r0ojVzMnayuS7pwbfmOl3pFC8hnE+uG0=;
 b=hbNqaPAkR2NPvWY4pkFq/Xx6Vcu1w26lVJPhJVKBgvHSDcyaybXRO8RWJNf6faIvXVSVB6CbkzaINflgB1lfSten+2fMcU7PZgwvs0o1K5AwOVwqEYnLUu2ak7t3Y7XlKdZYpLsZBSK+a39MVKVwS8F3Fp3sFi5fFtFTA8stmIWH8RHP8JPuiKuyJa7m/DM0I+fSyH98T/mECgXZFep2fNQ1vYKIC4LfGVIE5koliQmFSQil34rluh2vGuB261vXDcDZ8uIty7M5+Qh1jt8RIzJQ+LecNTH3Ah+TXwoNb2b6/avJm8mMRQcLKCQXXPae4iRKPHpVFBNN6SRwS9DiIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dLi9npF8j4r0ojVzMnayuS7pwbfmOl3pFC8hnE+uG0=;
 b=VxZ5U7YvaVSvdnGJvaaM1jhp9L/mPUBiKpgZ41BJnTs9oJ4YZ0h6jpkQGnDNb82pabhyD3XD+jwlnkSIpWe0/7Cjs3gyETeqgzLv4w3V7xAL5w1+zvZprj4CFfSxP04zlIvlDsttv+ESqc8H5UCKVZpWq3gxoImXIc0ZtBLKPKg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3446.eurprd08.prod.outlook.com (2603:10a6:20b:45::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.25; Tue, 13 Jul
 2021 09:31:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 09:31:20 +0000
Subject: Re: [PATCH 07/10] iotests/297: return error code from run_linters()
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <20210625182021.803227-1-jsnow@redhat.com>
 <20210625182021.803227-8-jsnow@redhat.com>
 <9c281e4f-820b-71ac-b0e6-c804e442bd96@virtuozzo.com>
 <CAFn=p-ZtWKa5d2jMwDrLjvh3YZeWmXT_fysmpH_2=5xU2y5r8Q@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ae73d994-d872-9799-74a4-5d76465d97ad@virtuozzo.com>
Date: Tue, 13 Jul 2021 12:31:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAFn=p-ZtWKa5d2jMwDrLjvh3YZeWmXT_fysmpH_2=5xU2y5r8Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR0401CA0080.eurprd04.prod.outlook.com
 (2603:10a6:3:19::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.215) by
 HE1PR0401CA0080.eurprd04.prod.outlook.com (2603:10a6:3:19::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 09:31:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aeaa812e-11e1-4551-4ad8-08d945e0f8ec
X-MS-TrafficTypeDiagnostic: AM6PR08MB3446:
X-Microsoft-Antispam-PRVS: <AM6PR08MB34462B5FDC3740183DD21100C1149@AM6PR08MB3446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FjISuh7AmXEE5BsjOpNf/YbvNy8eiAVUgu0WsgXGcAzbs9Hr1PszSJqp26F73a+X9Rcat+9K/ZnYbiXyarsj/Rae/BxGV/9odvxIp73ED6dreKLbVAAHY1nsvMMUF9B+a1xdw6x8lRnijJ29b4lNEIT/4dUTEd24DlZwyJEwNShkNFfDm/PKJ1HWW097z+/ebrVrIpw5vVdsSXoLvgQicpWEmmqAw0A9T4uvbdvdLk5IUXgSM3mEIFhyrg2JZc+gm1dK/COFFTX/irAsCevwD1wygc2pXf+Z5C+6lGBlBqoNcrxSlkyxYUEsJH0k+NBm36RSyoLPiXPDKD2y75mRBtOxo+xfR/+Tcc2q7nBS5KagsCdHrS08hz5FkDo3XOzeUCTZ6uFQRg/fS8zDP0FWbBs6OOdSKv7ookO4cAIJP6hDV+F3N/MU+Ra+HQCUZB6gyC+6VPDVu09WvyXODX2W/a8S9kvSgRFud5d6ydplKIlTUAMNu75PXd4qSsa2Qh/PGUwxodFwuDQ/Wurgs44BUc5XNkIOui3NZc/PEUuTCvbhvqlKF+/ZZvGNvx/zh2xxheRgLp2nQOh+iVwEu45OPsaxUhRWc+9QTcpvUV9HoIGCtRSzu0956pFrpPG7neEIq8ctr0W9JQeOPSRCSjLHBPt2KoBHyWvCux/XkW/OOgRSQMxAZqwPTZjh0IfiEraj+XGJuiebcCuwotQtTCtWTpm8xUWbnw+JRiAESQJEkvpPPdyx9zzTz7TvKG6YMCJ8p6/h8dZ6nDOm8XzdkzWOuOTCA9pk1Cq2/kdN09bRBCo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(136003)(376002)(366004)(396003)(66946007)(8676002)(6486002)(186003)(2906002)(38350700002)(54906003)(956004)(83380400001)(66556008)(66476007)(36756003)(86362001)(31696002)(6916009)(316002)(478600001)(26005)(8936002)(4326008)(6666004)(2616005)(16576012)(52116002)(5660300002)(31686004)(38100700002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0k4cHVYZXhqcloyZ21ZWjlXV0xzSUt5MThsNFkwZGwvTmdzNFBIa3lpeDVn?=
 =?utf-8?B?MERjeU1iSnFmVldnN3VNUm1HWnlzU2FvdFp6MU1aV2VmZFphRXM3Q1IvMUln?=
 =?utf-8?B?elNSY3BEMHJXbThGNTFLRDMzcHcwVkd5KzdSa3dNQUxwR0Flb25zdWZUQXM4?=
 =?utf-8?B?dGswbzF0MmliWktpWmhycVNJVGVSUTB3dFVpR0tuRFhhVUNBVzBBeUNmY1Nh?=
 =?utf-8?B?blZtTWsxbm51UzVieHUvaVlyc1hYVGFSckNTUVdkR2Nha1R3M1UxOHpOWTQ1?=
 =?utf-8?B?NWR4M2o1SEw4RktScjBXc3ZIY1F3RzZRbzVnaFBPZFA1ejJoM2hsOUhoVnE3?=
 =?utf-8?B?dWI5MGlaVHUvcWl4anpGenpqUmtveU8vODZZY1EwcitSWGpKNkpSSm92V0JW?=
 =?utf-8?B?NlVRQ2VaV2R6RVBydWI4ek1mcDFqZ1ZTUU4rWVpiL3hPbDJoeWhDbXBCV3Y3?=
 =?utf-8?B?YWx5WnRaWjlPbmx3ek9TakQyZlJ6RGgvRDN4TFlSZDZ3YW44QlhIeFlDVnZz?=
 =?utf-8?B?eXV0MDZsbTRkTmNhY3pSTmhBRWFBa3JGbVllaHVidEQxL2VJd3dFZnJPNzBQ?=
 =?utf-8?B?cnNxSUxNVGZHNlNnM0hlTWlxS3FBc1pSZzM4b1BqbVlqL3RJUmJqMmhJRTdh?=
 =?utf-8?B?UXBFczNxaU9qd25oRVlTWXN2M3EwdzExc3laWXQzM3U4Y0pzMXBLNGJyQnVZ?=
 =?utf-8?B?NWJNUE5hb0Nuc0padkpacCtNemg5SXE0dVpqcGtlbXBoZ211Mkw1TUxCbnlV?=
 =?utf-8?B?NkZaemZXa1RHNzNTSDZoQi9RVkdIaFlNWTRhdHJwL2hpQzc0c1QxRnF5aHlu?=
 =?utf-8?B?a016ZjF5Rk90TUd1d0NJVVczbTM4RzVDak5RdzRVcjBzSkc3dzY0VGJMTWFz?=
 =?utf-8?B?MXpMellBbzZ5MG9IUGwyOWxrZ2lRa0o2TkY4eEF4SW5HN0l0SnFFRmpYMFpl?=
 =?utf-8?B?SEJnUWRmd0NxQXo5dTRHdjFETnBxTERWWEIzRkJVVkxRV3RxY1o2NTNZMEo2?=
 =?utf-8?B?Qkg4YlV1R3o3MDYyazlBMEN0TUFzUUNFeStqVEZZWjcwTERXM2szRGQ2cW5n?=
 =?utf-8?B?dXVvanNaY3VYRUdNd2lYVVlNVDg4cy82d0ZacE44MGtLM2UxRzByeUdaK2hO?=
 =?utf-8?B?UmZ4M29ORTlPOFRQeXZZNXBVTDdjUmZGZXIrVUEvVFV1MVo1V2FPbVNOK1hX?=
 =?utf-8?B?VXIyc09oaWJGNkgzSzVlWTMrYTRiRUw3UDF2R2FCbzY3SFE3V1lhTlB4aHNi?=
 =?utf-8?B?QllUaGg3ZkRNd0N6bUNVcE1VRElpbGhJMWl0VEcyTDJUQ0svZlRMeHVCVkJP?=
 =?utf-8?B?NjJIYjU3cUxkSG94TlNVNHFyTjY3c2pZTDBOanlGUERjRXZvSXVJWExBbUM2?=
 =?utf-8?B?RVNGSnlFRW1jaTNWNzQrQzRoalNKazdFSXZmV01BY1lzcHk1VGlUQ2NUNUdt?=
 =?utf-8?B?ZER0UGhTcU9JWTNYNmdNdmhVL3VRME9ZYk9aejVuYUhnTklYSGVNMzdNK09D?=
 =?utf-8?B?dS84L0FMU3BzUG12M0srSmpvYXRSZ1NqQko3U0lJN3lXNmlnV1NWYVlELzFS?=
 =?utf-8?B?WXRsL2FZaU1OL1BLUWRpZjYrQzFPaTg5V3lsYi80aDVsUktQTjVhT2YrV0tv?=
 =?utf-8?B?MXprcWNWYi96WUtqeTRkaEpmTXJHa2JSOVBQdlhFYXovSEJLS0JKc3FvSEYz?=
 =?utf-8?B?YVpIR3lNcHdGOHMrOTdueGdkWHN4MU9rcFR6Y2thc0I3UmtYandoNFhEekJ6?=
 =?utf-8?Q?NOWfcANYANjkYC2H5Kp4SDQUEDGqbvYePVQ0UBd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeaa812e-11e1-4551-4ad8-08d945e0f8ec
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 09:31:20.2136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnhgnroxsYyfP28UVz2P8hCveyJAQrZit7LpicAYOS5FAi1pbHcQMDmE3iT2zrrFcFUiFYOZo4j1y6a6gmct5KH19If7qarbFdL+Sm8HULM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3446
Received-SPF: pass client-ip=40.107.2.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_NONE=-0.0001,
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

13.07.2021 02:56, John Snow wrote:
> 
> 
> On Tue, Jul 6, 2021 at 5:49 AM Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>> wrote:
> 
>     25.06.2021 21:20, John Snow wrote:
>      > This turns run_linters() into a bit of a hybrid test; returning non-zero
>      > on failed execution while also printing diffable information. This is
>      > done for the benefit of the avocado simple test runner, which will soon
>      > be attempting to execute this test from a different environment.
>      >
>      > (Note: universal_newlines is added to the pylint invocation for type
>      > consistency with the mypy run -- it's not strictly necessary, but it
>      > avoids some typing errors caused by our re-use of the 'p' variable.)
>      >
>      > Signed-off-by: John Snow <jsnow@redhat.com <mailto:jsnow@redhat.com>>
>      > ---
>      >   tests/qemu-iotests/297 | 10 ++++++++--
>      >   1 file changed, 8 insertions(+), 2 deletions(-)
>      >
>      > diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
>      > index 1e8334d1d4..7db1f9ed45 100755
>      > --- a/tests/qemu-iotests/297
>      > +++ b/tests/qemu-iotests/297
>      > @@ -68,19 +68,22 @@ def run_linters(
>      >       files: List[str],
>      >       directory: str = '.',
>      >       env: Optional[Mapping[str, str]] = None,
>      > -) -> None:
>      > +) -> int:
>      > +    ret = 0
>      >
>      >       print('=== pylint ===')
>      >       sys.stdout.flush()
>      >
>      >       # Todo notes are fine, but fixme's or xxx's should probably just be
>      >       # fixed (in tests, at least)
>      > -    subprocess.run(
>      > +    p = subprocess.run(
>      >           ('python3', '-m', 'pylint', '--score=n', '--notes=FIXME,XXX', *files),
>      >           cwd=directory,
>      >           env=env,
>      >           check=False,
>      > +        universal_newlines=True,
>      >       )
>      > +    ret += p.returncode
>      >
>      >       print('=== mypy ===')
>      >       sys.stdout.flush()
>      > @@ -113,9 +116,12 @@ def run_linters(
>      >               universal_newlines=True
>      >           )
>      >
>      > +        ret += p.returncode
>      >           if p.returncode != 0:
>      >               print(p.stdout)
>      >
>      > +    return ret
>      > +
>      >
>      >   def main() -> None:
>      >       for linter in ('pylint-3', 'mypy'):
>      >
> 
>     Hmm..
> 
>     1. Rather unusual for a function in python to return int error-code, more usual is raising exceptions..
> 
> 
> It is strange, but I felt that if these tests were going to run in "two contexts" that I would avoid raising Exceptions and trying to understand how it would affect either call stack.
> 
>     2. making a sum of return codes looks odd to me
> 
> 
> Just a cheap way to state that a 0 return is good, and a non-zero return code is failure.
> 
>     3. Do we really want to run mypy if pylint failed? Maybe better not doing it, and just switch s/check=False/check=True/ ? This way:
> 
> 
> I suppose we could. For the sake of CI, I like seeing more output instead of less so that you can save yourself the trouble and fix everything before re-submitting the CI job. What do you think?

Hmm, that's reasonable.

> 
>     3.1 the function becomes native wrapper for subprocess.run, and raise same exceptions
>     3.2 we don't waste CI time by running mypy when pylint failed anyway
> 
> 
>     -- 
>     Best regards,
>     Vladimir
> 


-- 
Best regards,
Vladimir

