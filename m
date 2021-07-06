Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5B83BC8C1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:56:52 +0200 (CEST)
Received: from localhost ([::1]:40716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hox-000271-Ex
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0hi6-0006Y3-6S; Tue, 06 Jul 2021 05:49:46 -0400
Received: from mail-eopbgr70110.outbound.protection.outlook.com
 ([40.107.7.110]:5517 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0hi3-00037M-Ab; Tue, 06 Jul 2021 05:49:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0iQ4TIw7CCwd284TWHelebldejtRB4oECvo0bH7R7wOvoChRMjbr45OpdzRWRRdEEO1cFSPCExmnFPq03SCNrjuXwW35EcKiPvkIxCcJexW8PNzCTBmIU42fJozbksyfaYisiEEWPV0tRVxnSjBar7VPhKaHkwVSJvzvJmdRXD/eXtrSkrhmLJVs3TlzbsAzUjtkghrNhkcFY50Q3Vl9hB6UL0A4speI3Xaeua7nR7JBxYQhTBdF65RfHk3UTU6zAiaHuqAeppJo8Y3eyBHTPRqaA+BSM4105DJhX9eJkaMh7yQ7zXi0CSvXlqT0LwrWfa/sUpMXIPI0kfleai/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsyjHyoxzm8W7KxXFlQLPlPfzhHtcRqn5mzHdM0yNk4=;
 b=i1Beg9l0UCIPGY3AVrH21+K14bujjT7R4vIBaDIBa6GWAsutfaOTBgc/5I84gPZ07SdQ06x1boiPcMJ93Cy0ljQrR/wMeqHilBlKD+F9w60lrO+TFMEZYAuT5/DAhOs5Y7XOrQlsatP0pVMV37cv3rV2mxMGNL+onb1x52lc0brXYOfvb64vtnYJMg0CJ/46yt9PVwE3U1Pgm33KE6owOEr6+sl44S6bfCaleQo9BxaynYpZWgM5P4c9dOOE5YGAy5OFgJSL7IS1FGDtSNpcxbuAIiNDD9RE6iYIC9PmmYKbdZee0YXPx45ZeEpNBvOXGa5pV0+b/GNUhPbG7F1Khg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsyjHyoxzm8W7KxXFlQLPlPfzhHtcRqn5mzHdM0yNk4=;
 b=hUjjxcRRH+Arv6F3q5bdo1VuAjX3mkY8++nmT+4yqOUdshgSl2UhV2U+IZe7RF/0eTrZazER/fk5LnSv9FRBHajgPhB8rkDfLcZaHpuBEc/8kfNLo2y41aXmNSmLW2ZQOOhXQotD7/1Jh18fJg3yJJYIlHVG/dRlhQC5hSum2YI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3157.eurprd08.prod.outlook.com (2603:10a6:209:48::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Tue, 6 Jul
 2021 09:49:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 09:49:39 +0000
Subject: Re: [PATCH 07/10] iotests/297: return error code from run_linters()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210625182021.803227-1-jsnow@redhat.com>
 <20210625182021.803227-8-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9c281e4f-820b-71ac-b0e6-c804e442bd96@virtuozzo.com>
Date: Tue, 6 Jul 2021 12:49:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210625182021.803227-8-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR3P193CA0015.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR3P193CA0015.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Tue, 6 Jul 2021 09:49:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 110c8616-a944-4296-aa0c-08d940635f11
X-MS-TrafficTypeDiagnostic: AM6PR08MB3157:
X-Microsoft-Antispam-PRVS: <AM6PR08MB315786CFB72C7622152E9E26C11B9@AM6PR08MB3157.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AI/cPS3cGDQLgaEkUn/ix2W5QOI0F/tOr1G5LiVgIChhjC+PCdMGPFhBbmjkIpmTYOMvgXSnBMNeQ7hPxw3HHMVHf/oKfhTLWz3G2MCAbKvNmfvcMix1WuOPCCl4JHdm0otiKTHdNn9QXPUyoruEtqawicX2Psr9ep6h1xykM7PVZ7Ctad8s2XNvlh0+vHr4Mdoy8guLW1kUq97SFYDQnSrQbAkvAh7yejc0kl8zPUNCli9wdcBgefIX3ZRUosPG1Zh6cBe/temt1rzos0aALCt4RUKiJvtpFNMUExWKjoOwgUOO48gVix66orB7X8+x1j8afINP9vZoZxMU4wLjwDiqOJTKWXB8hYcbXfpXRAS6i9Yk5W7aTo75zh+c0QaN953isbSrMaYv06tc19u6BoJqq6rQqEPjUR8UxYvpaKCvq1J18Eym1reNrbETmsaE1OrQkWvaXDZMHO8s1Z8+lirAe9U3GJ/EuXIHCtoI0OMx/MBdh1yUB0yVWvmQNdIfAAUj0Su+ZJ6enOau60rmUM+QRY3XTdjcZGMowhRLRAt+HpdzIxx3zPy1vJylm1lg5ewtnu9iEZFtEcOObY7TmsRO449Je/R6Ckf0x3xRtZ/f+0LrFzfD4odH8mfSUEveNI19ZyBXrb2MPLAkEBOcPLSo5qL0BbOzDQV3vFSW6xkB7pkGW6CeBARoY3xv9yDmOM1fHTauUTo9r2mvBE2xhhMFcJF/ifEqTQcYHl6usEhC035hrF8a2MLQcch4JmroWGnXIYAWruqsM7Rsu+xBnylUilfzxNpTOHgcyiFuEI4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(376002)(346002)(396003)(136003)(5660300002)(66946007)(16576012)(478600001)(83380400001)(31686004)(36756003)(54906003)(31696002)(186003)(316002)(956004)(38100700002)(38350700002)(52116002)(8936002)(4326008)(2906002)(26005)(6486002)(66556008)(8676002)(16526019)(66476007)(86362001)(2616005)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDZ3YXlCQmhxR0FQWlFza0RFMkdGQVFpbExPdDB4eXFmc2dEMndzSmROTmhO?=
 =?utf-8?B?b3FLQWdmVjgzTTFHK0hPdHQ2MytDd2JaYzZVRm9NRmNPeFNDRDBMRlU1QWYy?=
 =?utf-8?B?d2lEU3hGMzJqVVd5Y2pGL25pYWtiSlFheEtXMWlJdHI5eHQyemlPaDZKZnp5?=
 =?utf-8?B?TWc2ZTZoNjRrbVlTNFNNeXZ6V2VhZk1aSEZVY1c0SlBIWkQvQmhjSEd0eWpu?=
 =?utf-8?B?emFFRjBFRVJLc2pWbm04Y3ZlS21EM0kyVkNNeEUrWFNDd3kvUmxCTURpTkYw?=
 =?utf-8?B?dGxGT1ZNS21ic21OakU1YUdFWXU1cnUzYkNJSVhRS1BQNEl3WWVVTVlETStL?=
 =?utf-8?B?ZjRnMGVYWjgyRWQwdWRzbTZ4VlNaVVR6cCtDZHFQb1M3NkNaSEdESnlWQ0Va?=
 =?utf-8?B?TjRZSi9TSUtjc0tNMW1ZbWpxRDloMUxtN1Nra2VzaytZb3R0WkZQcGxsQnJO?=
 =?utf-8?B?YnorUG5HTno1RDArdytWZllnbEc1TjE4UGtkZndFOUVGaC9GaG1JZlljSHM4?=
 =?utf-8?B?SjhDVVN5Z0ZYZkVydGFyaVpLcUtvUDFPYmltL3FPb3h3Z1VtT2lqazZrSmx5?=
 =?utf-8?B?TzFVQ2prNUhHVGJJT0ExS0tpdVQrbHd5cGdCRURlcGJDZkZ2RHRDcnRBbTFy?=
 =?utf-8?B?N0pCVFZyR2pFTHZuRzJJVDA5QW52TGNnMnkxK3BNVzBibW9tZ1FDcFMzWnAz?=
 =?utf-8?B?NmZKSjRtSU11bmZXdXFDM3dseWJzRFRuTFlyNmJxeGJ2KzEzWFpqSjFqZFhq?=
 =?utf-8?B?Y2NzQ3JpVCtOYXBVcDllVDNKcE9rMTNPRFV1SjJ5RE1vNnZHNXBlbUlNV2VD?=
 =?utf-8?B?R3dLU0hLWktzaWs2bGxMaW5ZYVpVcXA3RFFkVlZZVGpXaG90c2VBZTFKVkJL?=
 =?utf-8?B?bnhlWVRDV0JjRUVURTJIa09Vd1ZoZnd3dTNyV2tkTmR1UGxwV3M0RnM1UHJi?=
 =?utf-8?B?Rm5NaEZyZVlZWTluVGRjTHBqb1dSL2lMTWtGb1ZTVnlqbXZXUXVJdmp4MWp0?=
 =?utf-8?B?UXZUZW5zK0xnbTArOWMxSTFSQXNJR3hjMGJVT3dXeFkyQnZodW9JT00xUUtl?=
 =?utf-8?B?bXltSXZGNFJ1SGE0VFRnRElMZG5ITUJ5M1FYR1dpNUU3TXBaUFdzNUhQNk02?=
 =?utf-8?B?QWZrb3MwYVN3UGZyaWxMNGpxN3FrUHBTQXE3ajJnZjd0cFZMS3o2NmFaNFN2?=
 =?utf-8?B?cFNTeml6clRNNGZ6WWxhT3VDSS8xMUo2OGJEV1VkbjA2eFNYemE2dTc0TTJw?=
 =?utf-8?B?c0hxTThTZXZjRzMveU1UNm45ZGFlUkdBcyt0WUdocEFxeTJBbnF1NnZJM0tZ?=
 =?utf-8?B?QnIzazFFdllTTXY5a0tzUXZHREdPVmtYVGdEVk9NdjBuMXVUbDdjckFHL1hO?=
 =?utf-8?B?Ni9MOWRwVEZqd2FoeElxYzZpNDFPZ0Q0RUtoWnFzMDg2NlZjRkhFaVJLMUZM?=
 =?utf-8?B?QWVvYXFFVm1xZU52cThyazJUYVZxRUpYNzB3bDkvaXd4aHA1TGxtRWpMc0VD?=
 =?utf-8?B?M29SOW11VUI4ZDZYQVU5dnFGZitKOWZxV2ZScWpKWU80eUdSdEx3K3BqQ3N6?=
 =?utf-8?B?ZkNOTlNxalEva2VkdE1aeXYyc1dMalZ5bGlEd0dvekR6Y3IvQ2txZjVsaHlu?=
 =?utf-8?B?UzUrazdCWW1Wbi9kODF2TWM5WFdSTWExcjVaSWM4a01UcUpWajZzSklBQUk1?=
 =?utf-8?B?a0grTkw5R2NNbWdmRm9PSEhvMjRtQWJmQU1vMHhOc1FTa1pMUnRqd01qc3dm?=
 =?utf-8?Q?oiSVUgJHvYcJ6+8w/CIHEBUPAQDLKCbtLk4V2QE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 110c8616-a944-4296-aa0c-08d940635f11
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 09:49:39.1504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bo1vq5/PBP+MY2Q4mm+2KEmZ11UgORWBCTmjVTCNVUMtkL64EiNehBLxBZfX85O8dJnr7i8ujl7Y5ggr76TinnURNsqvnOJ72wPei7EfoqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3157
Received-SPF: pass client-ip=40.107.7.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

25.06.2021 21:20, John Snow wrote:
> This turns run_linters() into a bit of a hybrid test; returning non-zero
> on failed execution while also printing diffable information. This is
> done for the benefit of the avocado simple test runner, which will soon
> be attempting to execute this test from a different environment.
> 
> (Note: universal_newlines is added to the pylint invocation for type
> consistency with the mypy run -- it's not strictly necessary, but it
> avoids some typing errors caused by our re-use of the 'p' variable.)
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/297 | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> index 1e8334d1d4..7db1f9ed45 100755
> --- a/tests/qemu-iotests/297
> +++ b/tests/qemu-iotests/297
> @@ -68,19 +68,22 @@ def run_linters(
>       files: List[str],
>       directory: str = '.',
>       env: Optional[Mapping[str, str]] = None,
> -) -> None:
> +) -> int:
> +    ret = 0
>   
>       print('=== pylint ===')
>       sys.stdout.flush()
>   
>       # Todo notes are fine, but fixme's or xxx's should probably just be
>       # fixed (in tests, at least)
> -    subprocess.run(
> +    p = subprocess.run(
>           ('python3', '-m', 'pylint', '--score=n', '--notes=FIXME,XXX', *files),
>           cwd=directory,
>           env=env,
>           check=False,
> +        universal_newlines=True,
>       )
> +    ret += p.returncode
>   
>       print('=== mypy ===')
>       sys.stdout.flush()
> @@ -113,9 +116,12 @@ def run_linters(
>               universal_newlines=True
>           )
>   
> +        ret += p.returncode
>           if p.returncode != 0:
>               print(p.stdout)
>   
> +    return ret
> +
>   
>   def main() -> None:
>       for linter in ('pylint-3', 'mypy'):
> 

Hmm..

1. Rather unusual for a function in python to return int error-code, more usual is raising exceptions..

2. making a sum of return codes looks odd to me

3. Do we really want to run mypy if pylint failed? Maybe better not doing it, and just switch s/check=False/check=True/ ? This way:

3.1 the function becomes native wrapper for subprocess.run, and raise same exceptions
3.2 we don't waste CI time by running mypy when pylint failed anyway


-- 
Best regards,
Vladimir

