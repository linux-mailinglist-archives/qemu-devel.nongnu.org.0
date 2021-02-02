Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D8930BE87
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:46:54 +0100 (CET)
Received: from localhost ([::1]:58668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6v53-0005nU-Ck
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v1f-0004uy-Gd; Tue, 02 Feb 2021 07:43:23 -0500
Received: from mail-eopbgr20136.outbound.protection.outlook.com
 ([40.107.2.136]:41350 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v1a-0006y5-7w; Tue, 02 Feb 2021 07:43:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxiDA1qukslxbEjDYeGTDYr7vVtGHK9lGNbtjPbdExgsxaAXjExDxZ3jrbMmIfdx7OfbONQqmBztrFYHsPTtz58hst1HZPaa497r/qncRFR1rmEkYJ/gxjU/z+jtaCcVH5HaYHuVztMUckVIJNxNV/hWF5wJmn8DSgKr90t7cDm0P1hkvwRNgXXKw5tEwAmad7zzPsbMHktB21khxsPNqYfBgITlND5IP10p9mJJwQBApWYlQ0wN4dU8A1wR/PhvdQgmdm3Z57VnpYkm/GLZnqiKTtR/6NbRYD73nRTgddQUxOjRYMPr/74sNR8bobmrPPXAvXDDrAOFZ0qdXxUmmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1l/6E42aASo6lghfHoVGPN0al7xVGjtqVRbU/WvUocc=;
 b=YrwlTJemnFrGCnSWDOfYzXfJD6OglTajycsipC1oOU3gYotfgXh8yOcsw05Ymjb151GbQcGz162YhJeo+Nejd1H+RiWTNWNavjMNeT/agla0OMhBSqu3xx/MjsYnYlkDaGq06AsR2XK0Z9INrG0QqM0aaXRL/Y6sduuUKKKuTjKQ5KhfCIk5nzugv7ZdfzNP3VCYwnrg8JGmDEMEG03xerS+kUz9TpqDzCB22oELLyOfl2DKrmK9roY+ss4int+Gl3b5XYI5Ehd21699HgIRhHKsGwEZ/ot3MqmLBSEU045FUlbEcJ/cejEN/cL1nRtukDO22ksAuJatFSw3UMjqWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1l/6E42aASo6lghfHoVGPN0al7xVGjtqVRbU/WvUocc=;
 b=CuzEtKJZvWJGeOtsCfCfFHz7OOuYj6SlJNHMLB31SrwfojLq/yOGFDwifaT1DemP8AHi58Bo3LJKsv56X6zd76YHg4jvRbnhUwXREjHbmRbvzUAVrtzjAiyDWROXBa05/c/Ixqvy7lrRqV1cSz/VpeMvYlxPel8/suYD7U4JqAU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4405.eurprd08.prod.outlook.com (2603:10a6:20b:b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 12:43:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 12:43:12 +0000
Subject: Re: [PULL 0/2] block: Fix iotests to respect configured Python binary
To: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210129145240.34104-1-kwolf@redhat.com>
 <CAFEAcA_5ASnuNjWs8rdRid-VpjFaHX0Y_8cKFRY0ojJKLB7ryA@mail.gmail.com>
 <CAFEAcA8y0G_sru10vmESAPW54JWPZRcboN7xSfc2bKDQFaqGNA@mail.gmail.com>
 <20210202114123.GB5184@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0d4cb6de-b69e-1428-3686-3ac2e7dc80d1@virtuozzo.com>
Date: Tue, 2 Feb 2021 15:43:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210202114123.GB5184@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM4PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:205::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.137) by
 AM4PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:205::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Tue, 2 Feb 2021 12:43:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92e40bd8-6cd7-40ec-e24c-08d8c77819f0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4405:
X-Microsoft-Antispam-PRVS: <AM6PR08MB440590EF7E0585A2171D6EA5C1B59@AM6PR08MB4405.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cGntks6xJU21dFLJW241IPU3Mw8F6EHgyBfwFlWJSSGE7h0uyw6KzPyRiRqLFXE8MeSqPdPZlkYIKfN27tU4KTNQIjK/rELUQO3kgVsSg0LcFLzEn398BIG7eo3QQfIPLTeUeTO0TPiM2YKpn7yIYpI86sn5T1Tkwy4dQh8SWvXgcsR2no9glQv40Ih74NaxQNzH4x6GVcrTK8QfnZtuouoXvIMfwtFa6oC9nlnVn+pFynJr5ElO/+/djnI+rb3y9X1rsLQPqLP0nMpR0x1AaAXOjos1CTEjaO1hDYRHLE5wQPKBTkAgiTxqeRjhagpkTfjq4+S9Qd8YGW+BW5ZQTfCHy1X+jDNpinGL+ETnEXRpP9w6AuxQd7aQO5dyGmetity8i0lbZxbFRvg4MKKCnr3zz+YydkV7ADfph3xQftkrICB4fckANRIrB4ToeQG76vMsqD4h67+e0ku+4v9ahbiidnoTa1lNFyXiSTaGbvrIhB4QsYWfe4MF9LFXvZUp56eKhg1UoFNfVvMIfI0EKFEzmlb92Q1Kh+4izb2NFTmsBY5xCHBcfbk3BL5vmd1HN1Vg/edh0u/9N32fUTwF1poW5LdCorHyY4tQIaNj1Bo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(39850400004)(396003)(346002)(31696002)(83380400001)(26005)(16526019)(4326008)(8676002)(186003)(6486002)(86362001)(5660300002)(16576012)(31686004)(478600001)(8936002)(54906003)(2906002)(52116002)(316002)(2616005)(66476007)(66556008)(36756003)(110136005)(66946007)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cFJIUXlXeGFhcTlPdm1RVGo1MlI0dGpTVWhpc0VXZHo1a0Q4RlBmSVhSN05C?=
 =?utf-8?B?Mkkwb3dudS94WkVIWjB1dzNvTEIzVkRCMzkrcUlwY3B1dlVId3R6alhrZ0lF?=
 =?utf-8?B?T2xjK1l4TS9BeVM4UVArOUdIZUJ2Ri9xcTZHMHRpZkk2YVZQNHhUaDlLVTd2?=
 =?utf-8?B?ZmwrOCtSY3pRRE5KbDFXd0xFNnJJMno4cGpkOXIwZU5Qa2ZmcVNOUzNsNXk4?=
 =?utf-8?B?SFg0QXkwRTZRRkJWM1dTWjNoRDl3eVN1UXhlWnRZTG9SYUJ3RlhGTGVzcnNR?=
 =?utf-8?B?STZzZXJDbWtzakZZRjh3TnBwMWhIblZlKzRHcG5TQlRQL1V4cTJUcDczUWtF?=
 =?utf-8?B?T0JFZEhDaStzZllDTHMzR2lpTTcza240VkFBUm5sL3BXUFV3UVdkVXNldkx5?=
 =?utf-8?B?dXFxNjFwR0x4RTF4enF4WXlISmxWbmNaRy8wNGwxbElmcXBXUlVMaXdrY3gy?=
 =?utf-8?B?b291UGEvQXplVUJYMFd4KzdZZ3R2a3FtMDJNaXJJd0t5MENqcWVqak9Oem45?=
 =?utf-8?B?TCtQYi9mQm1ubktYNGRXK2YzRElZeUUyMzYwZkZTa01aM0ZXNkVaUllZOWU4?=
 =?utf-8?B?YjdJMVArTGZyU1hqVjBWVW1uZnMwTHgwY0pOUmZLc2JTT3hLNU1ZeU9lbDBx?=
 =?utf-8?B?bmVJcFB3TnJKT1AxeVA3UGdoSFJ5WHI1K21nQmZzb2pKWEtlUitxbGxkZ09D?=
 =?utf-8?B?VG5lRWphV1NDcG95ZmlObXJBOUt0dTgxdytmZ0ErTjhCbktpSFFtWFUxWEhN?=
 =?utf-8?B?ODBEWmp0ZjFNV1R3d01rVFJHd2VsQnlGVE4vTXFTRFFwWkRFMkdhRjVmUUJx?=
 =?utf-8?B?RjM0R2FXWnVqUFJzTWYwZlZMWGIxL3ZDaitxaS9mN3RZMC9qZ01PdVVQTlpV?=
 =?utf-8?B?UkJNK09OT284a2VtTzd3cTlqdXRnRnJtUlYzYTJ0SEdCMUxmMlNJL0RaYVRn?=
 =?utf-8?B?c09IV3JxeUVEWHJwUE9CWGM5bDc0ZGdhT1lKTHB0ME80NWs2Q2hWcDNFbHhU?=
 =?utf-8?B?eXY3SE1ZZEI5amIzRENJWmR2M3QvR29DUnZsbk5oMUkxUEk5WWI1NEFyOWRu?=
 =?utf-8?B?c3NuZ3hCWHF1eU9MR1Q2TFErWHh5UE1CQkhWY1dZQ3lKUlpDbmJmL1dkMzM5?=
 =?utf-8?B?UmtTWllOd2YvcnNWWXNjeENpWlU2QVBwc0llYjIwQlhaYWpsNUJ3T2FDUnEz?=
 =?utf-8?B?ZHZZUklvdTFBd045SXp2MnhCRFczNWNGMDJPU05JR3FtcG5CMjlxT3NGdUhE?=
 =?utf-8?B?VFBBTkYrNEFoSFZjSUtEN3hRV1ViQUMwZ1VBbTBJa3FWS29LczZ2U01FRVI4?=
 =?utf-8?B?Wnc4N0NsVFVHTHhpdk43M2ZiRkswZkxEbWVIZVZJZ01rTFZxR1h4MkZweG1k?=
 =?utf-8?B?MitMT2NUNGtiRzdneit2NGlHME5jM0VGZEJqcTRnWkdCczdxeG43ZlZmWU1o?=
 =?utf-8?Q?1p+6DhAE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e40bd8-6cd7-40ec-e24c-08d8c77819f0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 12:43:12.0146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7mKfNiaEsvWAFs8rypkUPcoi1JlLIBhizXgoXPV9bFY9RHhHdW33WPL4i5FoQ9OJ659bOA2z/hF/TT8inU2Mdcprgf2jKpb+qqXUFq5eAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4405
Received-SPF: pass client-ip=40.107.2.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

02.02.2021 14:41, Kevin Wolf wrote:
> Am 02.02.2021 um 10:47 hat Peter Maydell geschrieben:
>> On Fri, 29 Jan 2021 at 16:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> This is definitely better so I'm going to apply it, but it seems
>>> to reveal a pile of iotest failures on FreeBSD:
>>
>>> Failures: 030 040 041 127 256
>>
>> It seems to consistently be these five. What do they have in common ?
> 
> That's a very good question, especially if you ask what they have in
> common with each other, but with no other test.
> 
> With 030 040 041, your theory of running out of memory seemed to make a
> lot of sense because these are the big block job tests. But 127 doesn't
> fit in that group at all, it's a very small test on a tiny 64k image.
> Unlike the other tests in your list that make use of our Python
> framework, it's also just a shell script.
> 
> Other criteria that make 127 special like that it uses scsi and/or
> iothreads don't apply to all other failed cases, but instead to other
> cases that pass.
> 
> Are you still getting the same error message and is it the same for all
> Python test cases? ("Unexpected empty reply from server") If QEMU had
> been killed, there should be a message telling with which signal it
> exited (if that code works correctly on NetBSD).
> 
> In any case, the output for 127 must be different because it doesn't use
> the Python framework. Can you post the diff for that one?
> 


I reproduced once (didn't save any logs). Now I patched check-block:

--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -77,7 +77,7 @@ export PYTHONUTF8=1
  
  ret=0
  for fmt in $format_list ; do
-    ${PYTHON} ./check -makecheck -$fmt $group || ret=1
+    ${PYTHON} ./check -d -$fmt 30 || ret=1
  done

to see some information when it fails and try to reproduce again.

Hmm.

I've run

   make -j9 vm-build-netbsd J=9

two hours ago, and it's still running.

it's now at position

....
[6353/6384] Linking target storage-daemon/qemu-storage-daemon
ld: /usr/lib/libc.so and /usr/lib/crt0.o: warning: multiple common of `environ'
ld: warning: libintl.so.1, needed by /usr/pkg/lib/libgnutls.so, may conflict with libintl.so.8
[6354/6384] Linking target qemu-system-rx
ld: /usr/lib/libc.so and /usr/lib/crt0.o: warning: multiple common of `environ'
ld: warning: libintl.so.1, needed by /usr/pkg/lib/libgio-2.0.so, may conflict with libintl.so.8
[6355/6384] Linking target qemu-system-s390x
ld: /usr/lib/libc.so and /usr/lib/crt0.o: warning: multiple common of `environ'
ld: warning: libintl.so.1, needed by /usr/pkg/lib/libgio-2.0.so, may conflict with libintl.so.8


Why is it so slow? Any options to make it faster?

-- 
Best regards,
Vladimir

