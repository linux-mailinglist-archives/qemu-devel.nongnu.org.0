Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A212C3C6DB3
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:45:53 +0200 (CEST)
Received: from localhost ([::1]:54368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3EzA-0001nA-KO
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3Exg-0000yq-Df; Tue, 13 Jul 2021 05:44:20 -0400
Received: from mail-eopbgr60138.outbound.protection.outlook.com
 ([40.107.6.138]:57603 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3Exc-000211-R4; Tue, 13 Jul 2021 05:44:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwOqcE5GVq7G6OBXJ1AWnR8a+qdu3gBAK25o0QIbfAZI3fhsJDI7VEEk7hPgRtvNytwepSa07xp/jzPMiauUVv0DSktn61LRVeRkElwrFgdaapINbarp1JbtCOJKwEqE2jPAGvyPqcluP8++J6BRjmgHEhyLw2HpGjjgtZnBs2WzYMJDY10Ng7kG0IjplvrPKwg+CbRTN97fT8Rm2qoN8Y++2KyJUSXVVu9bV6afvJGE6DMrl5g01YwVHM0F0P2Z9T7+W2lACf6siZhsjvK+eZVJpw99/8tvuWtV+Re55QN4f1YYHfc+60seMEaxML+flT0vlgO/pjtaeK1Ar9k30Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6M9Vxk8jsN/rlJkRoscW5scs4HPVDegAdnrkbGZMWg=;
 b=NghywXU1exHO5nMtnWKVF4+sll6b1sx+tCORcegfuq440CVNH6nGfeUysoy7V7S+h+/pjSpaDY4Dv9c/e5HI/iH9Sb+W+VtOnmTmbJfAxippSvNfKJwaw/c2g3t8Kx+a4XBNIOZHs6S+Mpd4eJ+JxR/EYLv2KKGqlANRph91CVqS+VykgUqhQvtLBN6MGLH1+qAu1Pzs1R93EkZ/omAez3vIXL40iI5y8M6mg6WrsmX8kwQoy7Bz8hKU5VnLX+6sOilXFK486FcUGzFYZqZj8sSYFI7LIxwBtfIOgmx3/ImskypaBuhqr5vwsBR8I43B8Xyycwk0UyiBCnWfP5OzBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6M9Vxk8jsN/rlJkRoscW5scs4HPVDegAdnrkbGZMWg=;
 b=mnpqrAYgmsE7HroqU1TSGTooReirgg7VPeKm7O1tCteqhLEvLgkGSEXWW7bH8P+yK8AmKDWl2AcOz67xufQxGX4v+zJHSs25LAjoKAWntWxcFi6Q/ZJISHmQJtH2dXcLJviWPpsgl51MEL1uZurqnKfZnt9STKclpS+CiJaY3bI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6584.eurprd08.prod.outlook.com (2603:10a6:20b:33c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Tue, 13 Jul
 2021 09:44:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 09:44:13 +0000
Subject: Re: [PATCH 07/10] iotests/297: return error code from run_linters()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210625182021.803227-1-jsnow@redhat.com>
 <20210625182021.803227-8-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5660606b-0304-a0b3-2990-c33a39ce13bf@virtuozzo.com>
Date: Tue, 13 Jul 2021 12:44:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210625182021.803227-8-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR05CA0184.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.215) by
 HE1PR05CA0184.eurprd05.prod.outlook.com (2603:10a6:3:f8::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 09:44:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a10341f-dbd4-4927-64b5-08d945e2c5d3
X-MS-TrafficTypeDiagnostic: AS8PR08MB6584:
X-Microsoft-Antispam-PRVS: <AS8PR08MB658439374D0758CEAC1B3272C1149@AS8PR08MB6584.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /yZBwc0GgpyGnUAnYtzw8RRDAefEeasbfFteyWb56B+Mx7IzJ8OQSTXG0gEdNH43+TMGv4M4vJwfHepGvMIlTUq4XQR35veGrfxZHMgchDnglOdwZ/hVwfwbpVmx9Oq1qNGtNpUYebz1qYlnGSo1X38zA35UafwM7k+stpJycE7+8JVbuc+7mu1n3ZD5H0/Mv8672bAa4qon+3LHLGLr3D19V5ZViettAk089b7LjExS+IkzjxTMvjGkpo/R/MAccvoAJ8jidKSMFwglbHhkb5dZb9jUzJ4ydP3AFdLt3Mw/99Qw9gd+IGLwIOZFeunQx4Ho1VolqeOMUmlgz2aGZLwRoTiwqlHjHOQaqSF++lncy54GxNG8jpByOFp+zsvGS+QLvgF6oGoIHDIbVRmf6b56cNROlW94PsUP4FGHFpnDhswX0WxC/f8OPXMiDDAlSNkhkHxlfV97esuRFCeenAy4AyHhJqrRLXCNciGLl+giTjmlDQXgoFQjP9fc8NQXgG8Zlw9ZQJ3Hj/I6eXUXgbv0w3ixqff1aBLP1r8wlCu8FhIThBFwLTPyLvt9OVv1NLAOcC6/QHG2YBphzMrA/H9JGVnpnZVayWf360d2tqFsxT7icB0attqGRjUsfrTxds5cSWgkCOXjHJI/3V4DcI+s6fh2bnH1uLJi6jgKQVAhu0LNPSO9+bsaxtY3+nbAXF7E9Qy8fRxkdj9VUMKQLkfYdxDhLUl8hV4oOmHNbLjKLG/2JuqfrA4qIfzNKg/y8sdAP1n4OOkFTcSJVszYLAjRNzbKnZApJxh2zUPYPaU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(39840400004)(376002)(366004)(66946007)(8676002)(478600001)(6486002)(38350700002)(316002)(16576012)(31686004)(86362001)(54906003)(36756003)(2906002)(52116002)(38100700002)(8936002)(31696002)(4326008)(26005)(66556008)(66476007)(83380400001)(186003)(2616005)(956004)(5660300002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y21nOEczRHRqME03RCtvZlI2YW4xcElabDhINHVuNmJ0TG5FSjUzMEJaVkdi?=
 =?utf-8?B?TldFd2VmVTNYNm4zc05aMDIrY1FvbC9sdnMyaFlTN1N5ZTZicVRKVU9QUHN3?=
 =?utf-8?B?L29uVXZTRHdRUGg2Q0grb1RCc0k3Ym5QWnJxUEE4N1UvQlRUVTBsQnlUdDI0?=
 =?utf-8?B?VERiWFM4RVhnTzJmU29BZW1yMG9ZS1E4dDBZV3Y3NEdGQUFXaFlZaGxzVjRv?=
 =?utf-8?B?N2JGaVBtazgwWVdZY3dHSGt2Ti8xZVpqd1o3dzRUQUNiNDBrYWhTNXJTbjVW?=
 =?utf-8?B?WkVzWUxJZVZISTI0NThjR2JycHk2TWY1NXp4ZFN5K2lNUkhzUlZuL2Z6RTRZ?=
 =?utf-8?B?eUFLbmJ3MkI4a0RRclFPMHNMd2pycDh4THZJV2srUVFXdDhjN1MrOEFaVjVJ?=
 =?utf-8?B?bVVxajRkQjNWSUpvb2lxdkxPMVNYVStpL3U2Y2x3TFZQOGg0aFBSK3REU09W?=
 =?utf-8?B?MUk4bDB6N3dQNThQOEtJNHNZd2h4MGJjM2NMMXR0YUk5dHpHQ3FCZWNnYUgr?=
 =?utf-8?B?MHU4bHFtQkN3a1Brc2JHWFpaTnV3MkJMMVRuYmdpMS9sRkNDMHB0OWpPZUtv?=
 =?utf-8?B?T0Y4ZEE5MHZQQTdjZ2tFdzlRMEM1bnppc1pwT2Z6UGxIRUlyMFdKV1AyemtK?=
 =?utf-8?B?SElDT2djWFNWRXNLcmk2MnBKeHl4a0RvbnJTeXlWRWJRVkphYm15dUYvWlkv?=
 =?utf-8?B?aFMzcHhSeG1EUzFrZ0JNMzczU1hLVHJjLyt2Rnh3ODBZWkdxUnp1TWhndzdK?=
 =?utf-8?B?b1QwRElyNHpmZU9Ic1Y1cEhyR3hDVDIxZDBoL3V1T0gvMCtuS2VKRVRwMUpF?=
 =?utf-8?B?MzVoNkRyMUk1QlpKUzVQR29zV2VrY3ppSEMxR1J4RUF4dTc1ODFMY0lzcWFj?=
 =?utf-8?B?bHlJMjMwNHorYjZkbFN3TGxQQk9ORlFXR2tPeTRlbUtJaEVRTWVRN3M0K0U1?=
 =?utf-8?B?ZW5MdDlrcVZJdHh1WW1hT2hYUWNYWkZ2Ti9KOVlndkwxaXcwK2lvYmlFS1E5?=
 =?utf-8?B?b2ZUTFhLb1VIVVVEelZhQWRRWVozZ0FYOW9lTG16M1A0OUF4NFNQbU9mNFF5?=
 =?utf-8?B?N2t3amtNUkMxZGh6ZkFNZ2dLWVZoOFJRL080SGVOellyMVdDOERuaVk0c0pH?=
 =?utf-8?B?RE9RTXVzNXFYVjUxWDN0Y2VEUU9kdmYzYVFUdjN3Z091MjBXM05uMFNSN2Zi?=
 =?utf-8?B?THJ3SnNrZjhCR0ptcStPUkcvUGRtaERid24wMEJQR2NSUWVmaVRObDNQK25H?=
 =?utf-8?B?TDVxcEV0aTJZNEZEb0Fvb3J0enhmbnZ0dG9TOFY0V2ZTUVFpdzJzRy9qMXk4?=
 =?utf-8?B?ZVVoUytnc3IyQ3Y0V1dpUmhWTWQrMk5lVjRoRGhET0NERmZ3UmdkMGhxNy9i?=
 =?utf-8?B?bzZJRW9MY3h2S0N2ZU44TmZJd0JJOGNDY3ZyRmFSb2JlNHhUTzNudThyaHFR?=
 =?utf-8?B?amxTYk5qbE1HMzU1OXMxYm1GTk1GS0MvWkpOQzZ4ZHhnbldhQXlxU24vVk01?=
 =?utf-8?B?dGlZOUdvMmJta1IvYUlsYkZwUStuZU43eHArdXhway85L1Awa0ZMajhhbEV3?=
 =?utf-8?B?UlZYVXk4V2lmdmsyYzgyMXdsT1Z6NkpoVENmZE9VTjR6azJWL29vbURMOHRh?=
 =?utf-8?B?dnRKaExreCtTOG4vdEpDSUxjY2F6c2lXOGYvZ2JlTDNGQzBJdk1wVitBbUxN?=
 =?utf-8?B?VCtvS0pWMDYrWGgySmtUQ0MxMlJSd3FPTW1ENnJxWWlRQW9BZDQwNFFTeGZy?=
 =?utf-8?Q?EQlYWleroJAvhkzfnQeRNTqOVn8XBTU1+3cXA5O?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a10341f-dbd4-4927-64b5-08d945e2c5d3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 09:44:13.4392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZP4+nQez8ss2zRfKlUK7Mlgsq2LsEQSfLJ4Qe4HTmuZAfFNXWelSKYrlr39hgG1x35TGaWz3Gup6DxahMPgt4ax4SD4u/854l65qDV0wBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6584
Received-SPF: pass client-ip=40.107.6.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Why you need this universal_newlines=True, if you don't handle output?

with or without it:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

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


-- 
Best regards,
Vladimir

