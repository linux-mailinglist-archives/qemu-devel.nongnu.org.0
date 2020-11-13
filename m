Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7FD2B2063
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 17:26:10 +0100 (CET)
Received: from localhost ([::1]:58974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdbtp-0002g6-QR
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 11:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kdbs5-0001et-TH; Fri, 13 Nov 2020 11:24:23 -0500
Received: from mail-eopbgr140090.outbound.protection.outlook.com
 ([40.107.14.90]:20293 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kdbrx-0001sH-J9; Fri, 13 Nov 2020 11:24:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5CV3n1dHTxJWOskvBStBfEXrK481ax/0YWFpiOFTd08rPl+8okrATGq4sPWuqjtNgLD5YZxwZP0doPEYflMvdxDe+DAFaWWVNhCZJdEKCLGarQNHMu++Dj5SD2SQr5vaiU8KMQEg6T+k/DESbyrFXiYCFTAb5gDa8/Nf/Ed6y39V0rMflUtWvwLdCukYay5HQ61FtcjF+JBnjl4U/4Pn1TWOh4C/5T1opYeaP1GqEn1YpY68uGjhc3isXI4BQ2t5HnN+YiqVGiMSksZS8FKjUFe9QjcahzYB4B9+y31e3pV8vRUZ68y1IVypVMY2UbdgNwVC4BaTJwqOvQgi7eiOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BW6eeXdGuWcbDL7DyMh0+QSq/PrQHgFKRus3olRB9wE=;
 b=c0o00SIx/jdLZ73VRcFcjtq0Nm+rwrVqA//WlcCID5t54/k5Cz3JzBZvQEMIzt14saaUSXf3iSRN1e8CqcHrauWxLaE0bPk7DcII2zG1yBPVbdDm8/Y3DquVHgIWGdWV9/gL8nPPxoV70mLgl7onRvGJMknKtHCQyLFGRw091eIaQxqBDACuTbNVP8ArJdn8iU8YMcvNp9yYrm2Ton8acPTUBkmJoIYtxlDU/Rqs3FUsEK3TcQ00tdDbhzZZZcS1Z2d177GWmheATbVOqg+PKtvoOVbQUNUaHj9B/551199WpX23XcAk49xh3tgp5RJ3982WCA+sI0NX+T4yZ6YZGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BW6eeXdGuWcbDL7DyMh0+QSq/PrQHgFKRus3olRB9wE=;
 b=hL7eUyXPJffDNMLaO7VHeX81OMCGfZ+YeQZTkikZiCjh8tIjkG6AQI4fbFbT6iycnVJ+StYLeizjerTQ5oyv9DvlcYOm97hX9ovc5tngkD/v3liKLPTrYAxoAjaOsPnOIpueXs8BuGCdnRSqw+ifpb9LW91FtZ/2ka08pTZO5m4=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6117.eurprd08.prod.outlook.com (2603:10a6:20b:292::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 16:24:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3499.032; Fri, 13 Nov 2020
 16:24:07 +0000
Subject: Re: [PATCH v7 18/21] simplebench/results_to_text: improve view of the
 table
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, kwolf@redhat.com, den@virtuozzo.com
References: <20201021145859.11201-1-vsementsov@virtuozzo.com>
 <20201021145859.11201-19-vsementsov@virtuozzo.com>
 <1ad91d41-1f35-f49a-93b9-ef7f16de78ad@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fc4bed94-feb3-822a-4218-0e504ed068fe@virtuozzo.com>
Date: Fri, 13 Nov 2020 19:24:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
In-Reply-To: <1ad91d41-1f35-f49a-93b9-ef7f16de78ad@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.71]
X-ClientProxiedBy: AM4P190CA0012.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.71) by
 AM4P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Fri, 13 Nov 2020 16:24:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3b3a6c7-4d64-43ba-cc75-08d887f08b6d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6117:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6117B1505F1B11A6604E4FCDC1E60@AS8PR08MB6117.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EsWiJnpJK5SVcwxVrN7qzQ1dMd6Sj7EzfAOfoojWRlHlDguEdAWVX8Vi7/NxVQcawa/hQ7YxShIIbkEX/iWlBRywSgssWTLR8+5RsR2Alz1auAdss+dr2F7tPqJ52PglseQcjpRBiwH6T/cRLmyOu2LeniRqd8icxuxrnY7xnD0yAjdf3NWoVG4kKcCiwcDIcAIHVD5Rv0q2kwkWaivs9CtVCqomhd1qNBRkaU1+m8dxoUxLZxVSzn3OkYQDuzoqAQB0NbZFLDRrXgUDAnrH3zQOY32ybPHkP0oLpBGpz3xWjsS5HJ8/U0wRjg3PQbMcRPtt29ohMDn5PNVvC40bYrIopB7QL/mnQxxsHcIrbZvgp6ABJIgHKZS28BR4eQI73aG2DtD23QKLNJbAyC9Z+att2wfas3ZgUtLEc+I/5mWuefWL7YJYxzqRolZ1NbGbVNcper6M+1u7nR1UwOM0HA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(66556008)(316002)(66946007)(26005)(107886003)(52116002)(186003)(86362001)(478600001)(8676002)(5660300002)(8936002)(66476007)(31696002)(16576012)(6486002)(16526019)(31686004)(2616005)(4326008)(83380400001)(2906002)(36756003)(956004)(53546011)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: azGIl+VJgC+QQ+qvxIGeCXiVMqUlaFvFAmCy65YOjUZtB67kutC+OSMfC7ZeM68WBOBKBCCT906/2V8x9U3VljVFNvZQeMmSqITibLNAqTBQrfoLpus+IZ8OJvP1hzH8CGxoiMKMcxjN9jsArknlMf6rCq4wE8R90GVdSnhwu9CtFSfnoeNEL3Oz42KlQVikn60Oi34nOzIuMmEdHgiIPtmPS3nWhkJ7Z4xUNXKiIKKsQCsfMgwZ6I6whlFoQKyoEQoaKTHDamrjgqv4VNkdvHweo5k1deWSEGPXLFQkLsy6XS4+6ANmQEup+LepEL1hBGQU0FNJn/CziULiI1/pFh0uJfDia+C0zDGFNTlDKkMQKT70Aun1xB2PriIKMUNzGmOhwoidG3mUZBW3FGbBMFlHbiKP3rFRs8qLafMnWsvIS1MmeG576RYqClZp1MOyzBxjpnTK63qd3BYtwbmCnmyiWKgVr7Zteqnm6Qp3EIItqe5cgUiSTRKku6EutMkrkUC62MR6aD8v1r893cdN2iem2BfHNd5W1Pm83eRURMkd4+qckOouHjxfP2hzRER4vL4BNgAVYmTlFDq7Uy4MjOMmCOSkruY28BMP/hfJVc0IGuG/HRbdnVLLnlsQ4poOm4vNvfZ5E6rxAQ3qVep5Ew==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b3a6c7-4d64-43ba-cc75-08d887f08b6d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 16:24:07.4980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F57XUSDf4Jpdga+ArZMKCcmli9uce1Iy2wO0Ly09bw+k50Fj95a4hQ8/PO5nW6J7MPEGXb0C0tdm7ZoTdzX9ot77BROY7779Ynr5NwrM3/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6117
Received-SPF: pass client-ip=40.107.14.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 11:24:10
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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

13.11.2020 18:59, Max Reitz wrote:
> On 21.10.20 16:58, Vladimir Sementsov-Ogievskiy wrote:
>> Move to generic format for floats and percentage for error.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   scripts/simplebench/results_to_text.py | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/simplebench/results_to_text.py b/scripts/simplebench/results_to_text.py
>> index 58d909ffd9..479f7ac1d4 100644
>> --- a/scripts/simplebench/results_to_text.py
>> +++ b/scripts/simplebench/results_to_text.py
>> @@ -16,11 +16,22 @@
>>   # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>>   #
>> +import math
>> +
>> +
>> +def format_value(x, stdev):
>> +    stdev_pr = stdev / x * 100
>> +    if stdev_pr < 1.5:
>> +        # don't care too much
>> +        return f'{x:.2g}'
>> +    else:
>> +        return f'{x:.2g} ± {math.ceil(stdev_pr)}%'
> 
> OK, so no magnitude-based precision this time (except for the %f -> %g change).  Works for me.
> 
> Other than that, I personally don’t like the relative standard deviation much, because the absolute SD immediately shows the 68 % boundaries (and an idea on the 95 % boundaries with 2σ), whereas the RSD just gives an impression on how spread out the data is.  (Which I find the absolute SD also does, when given together with the average, which is the case here.)

I realized that for myself, the only thing I need from +-deviation is a kind of "reliability" of the result. And it's more obvious for me in percentage. Looking at the table with a lot of numbers, where most of values have deviation less than +-5%, some values with deviation +-30 would catch the eye immediately. And with absolute SD I have to look through the table more carefully.

> 
> To be completely honest, though, I didn’t even know the term “relative SD” existed until a couple of minutes ago, and I didn’t know it was something that was used at all.
> And if I haven’t seen the RSD used in practice, I can’t confidently say that I have good reasons not to like it.
> 
> But, well, I can’t have any confidence in liking it either, and because the change from ASD to RSD is basically the most important change of this patch (which I can’t really agree is an improvement), I can’t really give an R-b.
> 
> Perhaps this is OK:
> 
> Acked-by: Max Reitz <mreitz@redhat.com>
> 

Thanks!

I don't have strict opinion about how this should look. For now these scripts don't have wide usage... We can always add an option to adjust table view, and I will not mind making absolute SD the default view.


-- 
Best regards,
Vladimir

