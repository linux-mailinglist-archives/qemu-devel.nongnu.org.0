Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727C5307F36
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 21:11:11 +0100 (CET)
Received: from localhost ([::1]:53344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5DdG-0002LG-HZ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 15:11:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5Db3-0000nq-U9; Thu, 28 Jan 2021 15:08:53 -0500
Received: from mail-eopbgr10123.outbound.protection.outlook.com
 ([40.107.1.123]:11136 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5Db0-0000V4-81; Thu, 28 Jan 2021 15:08:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNiVUnCwgzBOJmUXQ0ZedBHynPutstvTEKPLtxlBghCl+S7RslQvlXIg+R8IEHgk33VUuj68PzPJ0pw/tPjrqh83gLnJt7S99pH155rW/GNfMrA1gSoIzcM53XV192VfjvqllEYP5JSwhbdrc8gaUT7QuIlpy10RljoS230LYRZ7Gv9eenbjRnNspC1ntqomXed4E8go5Sc2zxoO8vzMfyBci0v8jHGQwSXvrmjo3H3hxzgqGx8n1AuHHngpNyM+o5e8mvDbVi/Xm8nojPcz7PaCPprwlPXqcoQS5jjXEmL3opQatEemN+5L7RGZzAUa6oQU1ix3Fh6nWfXYToBOhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueHQihRG7gRJgHhZsKWTUeWC8cWCTaPnjTFviy2tCcM=;
 b=aDwtXZbhW68uXiNcQR1yqg1SYNlBbdFKsNwVkpNoykEFO1EKVdJGFZA8FigNk9KWlx70HuxRUnq5vQvDpEXizd+pEQYpfepvKFKTceagDG5np5shUzFegl3ekULj+WZcliCwnLPqw7Z7I3C9E+JnKV6dRzYmTkwUnMSs3S5z47RJCvMUyikeLuxV5RE7jz5JMkX+SQMqOAgY9sGv8HWdSCEvDccJUDbbtr80C5KfDRSTkneaLQpb/fNqANpbslCl2R81l/6q66mOF0Fe+5Z2xnKLR+U6L+h/+bNN2uoF3m4Kyz5F1oLSO1rLB/STP3ye+0yEc5eCe9JGumKv7qwnvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueHQihRG7gRJgHhZsKWTUeWC8cWCTaPnjTFviy2tCcM=;
 b=W3262PxtzRVRHXBGMCaDfnsGFcQQXXCAQ3rUt2MgnCeZj/7Nqz2jnjUJUIcK7vOQkadvkGh/V7uBr54Q8Yqv/UBaz5Rq38XPAuYPlj0Nv51u7NXR6VzXDi0nXSkvZSqDVx5DrlUUK1y1ofBBhAr1VZ6Fr539GyXB7Qh9L/rFAl8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1907.eurprd08.prod.outlook.com (2603:10a6:203:4a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Thu, 28 Jan
 2021 20:08:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 20:08:46 +0000
Subject: Re: [PATCH] iotests/297: pylint: ignore too many statements
To: qemu-block@nongnu.org
References: <20210128200417.303775-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7490fbd7-90d0-c1b9-172e-5d507453bf1a@virtuozzo.com>
Date: Thu, 28 Jan 2021 23:08:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210128200417.303775-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.105]
X-ClientProxiedBy: AM3PR05CA0091.eurprd05.prod.outlook.com
 (2603:10a6:207:1::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.105) by
 AM3PR05CA0091.eurprd05.prod.outlook.com (2603:10a6:207:1::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 20:08:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eac61d7-5303-47f3-aae5-08d8c3c884c6
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1907:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1907FC6B449EB22943866AEEC1BA9@AM5PR0801MB1907.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rPC6vH415zIFXm7HjwQ9Uf2MRByTbjuU+bkNepGYi2AmkH9ASdNJGS44XPWN9Kj6YpxdkREzQiJpqBi7TTqdMJCmC9H6proRSvsXeEL5HYhraMnhu9SShUH/JKwy3apoU/fhCkpI9Z6SYPdrgQZdrpnYKyLYTuo3uEUOmbjACNh7cVl391x3/6BlBhpEbeQ3rzD/msP+zV8R7ALMXgy+AE886HklP7x/SY0z890qhfwpVANVaOf+NbgmXpj47elt3Ed+5uqFPMIpspbL69OqtgyYMUTyWiHIKdwX/dXpfgUZkk9icxCpHBsqXCUkdAcd703gdMGdRtH+CIdDqjVijE6UHmGqm85/knzqz5c3PqEtesR7bWwxZbRH99ewbwzlZKe8ZwePXpZ+j8oFchGAvUPKEk+N20yyecbVvCsluD7bhlH7UqgvXtlABJwo2aDIh07EDdA1evrQpruyPGJfE+pyN724Uacf+C9ygiz3I4d2hNzjLQbXFWY4B8FVUPKFYXVIO7B/7mQCxpp66dm7zCKHnE2L34NSqfeijS60U1IlYdcqSzSnZTRok42slvs0wFUSO+EXVDqv8yAtp3fFfhL47qJXVz5vdqraBhT5m9OhgFuP9IEuSvzZna+9xFK+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(366004)(396003)(346002)(136003)(956004)(31686004)(31696002)(2616005)(16576012)(52116002)(2906002)(6486002)(8936002)(316002)(36756003)(186003)(26005)(4326008)(6916009)(66556008)(16526019)(66476007)(66946007)(8676002)(5660300002)(86362001)(478600001)(83380400001)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L0hlQXUzWkJBamt1Y1lSUFhaTEpISU4wTU1UanBPWFdBZFZZTjQ5N0pORmxK?=
 =?utf-8?B?Z3ZDdyt3bU1TRWRDRHBTUC9na0pjRi95VnZHeGhaclBZdTB2Rkt6L0xsb0Ja?=
 =?utf-8?B?QUhDamFVNGUwb3duc2RzVVhTeGJuOVBUNjNIajBUSGZSdVFNbVJuYVI1TXE4?=
 =?utf-8?B?MFdYRDA5TmVUcFg3TFkyZlAxNWJ1bDl3UmJLeEJTblUvb1Uxd25DNXh5Mmtu?=
 =?utf-8?B?MzQxcnhJMjFGeGRXY0hUZFJwNHRvQkk0T3hEUzdOM0RIcW9ZSlVNc1hZVFhi?=
 =?utf-8?B?bk5Sb1hvUndQcWtVdTVyazRLQ1VRQkwyVW8zWmo1YVhqZUlQbVVYb0RnSmxF?=
 =?utf-8?B?dXJFQmg2SXBzNFJZTUd3OGxSQTh6L2FlUm9YTmw2RjU4a2dTaElsamV4RVZv?=
 =?utf-8?B?NlA1dXVLYnZPTURuVzhINEFFRWlDVVNweVBwWXc3UmJPclhGNEhienFPWllY?=
 =?utf-8?B?UjNURFRSZFIwYzlIZ0RWWjR4R1dlKzJQLzA5eUFDWVE0RVEwbjl2Q04yY1pX?=
 =?utf-8?B?V1dRMHFCZFRIeXNBWFM1ajJSSzhjSTRSUm5HZWJoNlFES2hEb3dTK0dzN2Nx?=
 =?utf-8?B?RzYxV2FNSWxGcnNmdEZDQllaS2NIb0J6ZnBueEM3WFlxQnhWdGlDSmM4UDlC?=
 =?utf-8?B?TFFwQ1FPSjU0anE0OG56TDE3NFp2VUxGOFYrbVh5QzR1WjkvdHE3Z0ZIeDJJ?=
 =?utf-8?B?ZEU5eHMvNEM3akRBMjRvdHA1NlM2UFdwaFNjTGpneVdVdDFMVnR5V3pnNFAx?=
 =?utf-8?B?bUdvcTd0MFJpelUrUDlINDNLOVRCYkFLZlpqMlJpVU93YWMzQ1pDUEZ3WlQv?=
 =?utf-8?B?UVZlVVl1K1pkb0RXclZ4RHpIWVdEdVNGbGljajBHbXJQQlpibXl6VzF6VHg5?=
 =?utf-8?B?b0dTRVp4NEMzcXhndE5oOWwxQ1FTdnVqT1VFRXVQTDJVR1N2K1pQRjBYK2NE?=
 =?utf-8?B?Ukd0NlhXcHdqSklmT2dyQWRWeDBjZ2plSWw2ZUhkeVpXVkQyRzBZems3S2xV?=
 =?utf-8?B?RzRrWVY5R29ZNzR3elNGWDllN2FYbFNBZHpJOGdOcjFuN2g5ejlEa28wTmRR?=
 =?utf-8?B?dDhZRWh0OCtSVysvYjMvVWQ5SHZHWE53WGlWd1NRbUxUS0lDSnBqRnRnVERk?=
 =?utf-8?B?Y0FUVkRyQUx4V2V6b3puOFdBRnhWUVJTY2FWSERLR3d2R25BY0dCYjQwSWNr?=
 =?utf-8?B?cm93L0RxcmdOakNFYXc2SjhvMThSM3JoM2UwVjVkSFNWV3A2OCszZ1pRQUhN?=
 =?utf-8?B?Y0xEd1lTbTZvRjZpbjFTM1hyN2g4cGdWZUZ0SFJTRG5oTGxnUzFzZkZxMnBK?=
 =?utf-8?B?Q1ozWU91eHh2bERXb2lZb0ZJZjJqbUYvaFZNN2ljdmlwblRqWGZCQ1NpOFRS?=
 =?utf-8?B?VU5odHN2cEQvdzlKUGNSZVFjakxFak9wRCtlQTlPY2ZOSmpYNGM3Y2Q2Y0la?=
 =?utf-8?Q?HMLt6nOd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eac61d7-5303-47f3-aae5-08d8c3c884c6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 20:08:46.2110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLneQIGIDeLJF1NZ6VAEgxj9HABxQ96nXpJZrOU56lAaTjw9HbR8XVUVrNMF4AIM9jmoIMNKRq4BqIs0H/mUlFECiJdFR+HFdlMjP+NuJR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1907
Received-SPF: pass client-ip=40.107.1.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

28.01.2021 23:04, Vladimir Sementsov-Ogievskiy wrote:
> Ignore two complains, which now lead to 297 failure on testenv.py and
> testrunner.py.
> 
> Fixes: 2e5a2f57db481f18fcf70be2a36b1417370b8476
> Fixes: d74c754c924ca34e90b7c96ce2f5609d82c0e628
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---

Forget to note:

I don't add exclusions to pylintrc intentionally, as I think these warnings are reasonable, and it's good that vim ALE show them.. Still, adding them to pylintrc works too if you prefer.

>   tests/qemu-iotests/297 | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> index a37910b42d..3e3e0e34aa 100755
> --- a/tests/qemu-iotests/297
> +++ b/tests/qemu-iotests/297
> @@ -73,7 +73,9 @@ def run_linters():
>           env['PYTHONPATH'] += os.pathsep + qemu_module_path
>       except KeyError:
>           env['PYTHONPATH'] = qemu_module_path
> -    subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX', *files),
> +    subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX',
> +                    '--disable=too-many-return-statements',
> +                    '--disable=too-many-statements', *files),
>                      env=env, check=False)
>   
>       print('=== mypy ===')
> 


-- 
Best regards,
Vladimir

