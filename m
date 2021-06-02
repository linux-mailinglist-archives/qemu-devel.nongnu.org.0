Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7956739888B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 13:45:27 +0200 (CEST)
Received: from localhost ([::1]:39784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loPJO-0006BH-Gr
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 07:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loPHh-0004P0-9Z; Wed, 02 Jun 2021 07:43:41 -0400
Received: from mail-he1eur01on072c.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::72c]:10659
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loPHe-0006xc-LZ; Wed, 02 Jun 2021 07:43:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kChsJjda8vd4gwrKmlbyo/jwGG7PKryfzA/XhLCzPTE4OV69JBqTW3kC3dym1w/nCcO2yuvg90J9DPyxbJUvPtR++Cf7je3L3hvyp17tauQi5w0SwpsZdqUDgcimuEXezuXvkmcnSHaYYbOrlQ3p8Zi4EYm5PV/s/EcEF2y0G5tHblKpCuYTLosvwAFX9c44vitjmJmsYHfBY6Ppt8hHLaejtgQuruoDTTDo2K/5m0Vs4dbKdQpZAvITNa/abxDGS33prgY4SlIWZDujfacKE57ndhjP2vNrOLsNNko9x5MIhwxVmiiwGZllI8hNpYjpLfdfG22Q0cDAgewGyiubyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMv8JiantyiXd6MMceJvNzxi2xSijP/x8vFCPHKWHaA=;
 b=AGQIcUrI5+ekEfRl+8USGJdi8WfhvY6asR5dTRGx923ogzuYXNDtF5E1uAYxhA9hvGrMDwvLvf8ubqnLEsGu7eiV0rAOJXEauDvjTZ/QYCBIaG+WSZHetJEolOJ/KriiPJJji7v5wTtAbrgZo/OJ/vUIkeBDKVT6sL1DSse9JGCwSaWvaIKsP0i8qbL4K3RzlZClVZ8muoip438boPmceIGM+6+dyFN02kVFv5t2KN4oQ3gFdcqvyJSLK4Wyms+YW1v0EPupVTjkhg7RZM60+oAKgfEIZNnausW+J+YmZSwc30mk9NOKmD1NKVw65X5+uj9EKF8S/awwYiMoYA0zSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMv8JiantyiXd6MMceJvNzxi2xSijP/x8vFCPHKWHaA=;
 b=Yo6FqigiXzTaGp6f7ZqOotBXDwKpZAAOA54WARs6HNdK8hYGMuFTVFfqvG/crkErk2Y8Y6LcEXlmX5uPNVrYm6arjlKg9RuvRlcOtfygUXlfS3OGALmUILjPU8Yt4Fks3FpsOkienm/oiVkXSo9QnrDEFhZPPHCWapBvHgq3kGg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5336.eurprd08.prod.outlook.com (2603:10a6:20b:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 11:43:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 11:43:34 +0000
Subject: Re: [PATCH 2/2] block-copy: refactor copy_range handling
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, pbonzini@redhat.com, eesposit@redhat.com
References: <20210528141628.44287-1-vsementsov@virtuozzo.com>
 <20210528141628.44287-3-vsementsov@virtuozzo.com>
 <YLdLm/j5ctTcOOEy@stefanha-x1.localdomain>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6452382c-13d5-2cb3-921c-03ce7ec0f3a9@virtuozzo.com>
Date: Wed, 2 Jun 2021 14:43:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <YLdLm/j5ctTcOOEy@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: AM4PR0101CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::42) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.211) by
 AM4PR0101CA0074.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22 via Frontend
 Transport; Wed, 2 Jun 2021 11:43:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7062b6be-ce3a-4f4d-c2c1-08d925bba6e5
X-MS-TrafficTypeDiagnostic: AM7PR08MB5336:
X-Microsoft-Antispam-PRVS: <AM7PR08MB53366F09BAA055E9FC7F4424C13D9@AM7PR08MB5336.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fhthRQgvV2fq5BR9/aACI0b7gX5J4t/HFPaNm6XuIFeHdkFiQDoU5f6GqpzER5CQGtRH+/uHjY7HnqMB7Id+AlHxzS9BVDXpjScKi47mifqE7wJnqO9U4ZzKoRAzvfmvRU0JjCdP7t9mw8sBw7xVpDN0SXipjl9FKQYIgyVTgP7c5/aAycvoa/hbaos3gKlz1ENl4kAuxgSB0E4RTeMbmGgdrp5ALqUszPUcNRhAGiZKsm+Q3QgOYt7O5jroTln/jc2NDyYN3FWuG1WbWgKx2gz82bfdBfsabWd6uSm95x0SLqbA8QqqE27cfkZPjQIwhdYVEw7pz0afjg8bXIIXr6jgwkgLNR0T7K9BwvwCh2knPpHmTfixX3LbpyHE01a0h+0zpU8pD+dRuybEUC0jAO3C9/b9UWtEWcolGkRBG1suIcme1bPfBkKhYn6SvPOTsuMbCauAxGMI4bELx1MBa571s0KZ/czAqsvJGnAc8ojvcsZzD2TFJ/rMWpbzQP7qzKGdhwlIqLlbl54Vg4DCTs6YL/bHL9COjIMyDlIRthj9N4A0scseHm9xxryQpD/gDFb5ZBoDhXSiPSOTpwQdq8vDdEV6RzHDmHgTMKxpyfV5oZNXbUQJtUHVUa+C9zil1rnsri+r0E1gS1mR4BC7qYHLivNn5jKetNv0H7k+35gMBld5+X8+8EkXpxKt/8Yz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39830400003)(366004)(346002)(396003)(2906002)(6486002)(16576012)(316002)(478600001)(38100700002)(26005)(6916009)(38350700002)(8676002)(5660300002)(36756003)(66556008)(66476007)(66946007)(8936002)(4326008)(31686004)(52116002)(2616005)(956004)(186003)(83380400001)(16526019)(86362001)(31696002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?+B+s0nVrPC/xxXzPoTA/CRLPwxF+OEis2XgCdmeiqWiNR7FyXjpTaCOb?=
 =?Windows-1252?Q?OktyKAk9lREYylN+5Aee214gBJsiWpk/VzY829YoGNxkKv7Krh1Ut4+E?=
 =?Windows-1252?Q?6pjqVQJ2u0rlBtIsCOGKxWYby6A+mEDg6LxFcOoxmJex6iEOdvVLFoO0?=
 =?Windows-1252?Q?RYtVpVyTeDKeoE+cNuWP6BAJ+Y4qimMDBNq8IYeffSs+yDL0/xIigNCs?=
 =?Windows-1252?Q?C2DI4RSEYpILSC5uip2L9ZG6lEgKstxh1IOdTMNAvga4BmSiVhxQyDTY?=
 =?Windows-1252?Q?E/Fp3PbSkUQHnY0cnF96zko9dTtIkzSn2oVbiVhDFx0FpnsFSJzpMA09?=
 =?Windows-1252?Q?rLUKkdGnp3mfvgcXL7Ehp288LTX5+MZl5UKbMaXf/NRFNge5KeaZLpLi?=
 =?Windows-1252?Q?/mzHSvyCrDQorveymrQTO2KG8FxGGJ9pPZtuy+r225fJ4FtUn/pyAkxU?=
 =?Windows-1252?Q?aBB++DTg6tl4JuAimYRvPVRXX1xGxvXHv7KWz427lMlJ6giV4UHfoQaP?=
 =?Windows-1252?Q?85TSjWr5XtFBiS1B3kDBYv/fo0iwLmnejE5uhj77yfcRvXuaH2SjrkrO?=
 =?Windows-1252?Q?tGW6TL1+QqdavhoLao+KpkfBq0DzbZ2wW9vZUFWLzU1ocnTtzB3plHaI?=
 =?Windows-1252?Q?hOv8KCsY1SRU3/gPeZkRMWFT2cSjoLBdbeze4hivdueR6kAbI9qYwKVa?=
 =?Windows-1252?Q?lLWq6fTON1taSulKuS1ocf/+fdK0kPSG7nljYUzd0RPufuiZs4CONCDt?=
 =?Windows-1252?Q?QAON9qKb6v7YHCJ5snhPIAIS/XQUGIsSLn5Xa8nshig2YYCKCqmJa7hj?=
 =?Windows-1252?Q?qBlv161xg8JLqHdJuGaVrMSiXPo4D8uriqGsbZnmL3+QZbiTm1uyRuhK?=
 =?Windows-1252?Q?4wESf1MB6YmX/dnvNL5x1jmeF36mD8aMzYrARl0jEJQT+Ar9Znc9xvNu?=
 =?Windows-1252?Q?5CGb39D1sn91+OpM7QbNqYiaeRycD3aPkgPCFY+Xng7ZL6V8ShxpVBap?=
 =?Windows-1252?Q?1UKRShlPWGhM8eJkoHKwa2R+99uhhD7RFkQ9PAgfL1DbBVpPzwjwNhbu?=
 =?Windows-1252?Q?rYYAcnsOR9fOqcbWlCHhsDDxN8OZOpWFk3PUFtjPELzP2EJUw4LGmPqs?=
 =?Windows-1252?Q?37WYtzjo16I8y2FMjU0aVgzVmAguf4E/OmfhhDJm/2+D1sHunED19j1/?=
 =?Windows-1252?Q?eo2iyaoOgGjFjGxNAjWx6mvfKgdlVy450M70jkCT0yLOpDImYBg0JZDA?=
 =?Windows-1252?Q?8sEibqalFDt1Q5yJEaRdLhPOdtDUHcTR+M0xRJltGwwL16QSf7dWe5aU?=
 =?Windows-1252?Q?VT+1mpZr+m3pForMPGB9fmQO5JCQUZCZdSb4U9+iK42bkibrNS36G8FL?=
 =?Windows-1252?Q?iwYSJUa3aE6stHOl+bXB4mYOAzEEfFypsc2jBaz8TQNh66mLsBaKMEe1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7062b6be-ce3a-4f4d-c2c1-08d925bba6e5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 11:43:34.0356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BU4pkk+AdpNIGm7BWd9+1Xer++TYp+qH8XF5l1K0xepChJtXh2zvVt4YRCVjCQj6yGyP7qwGsrqBsyCQ2WDg/vha+L9yab6zKtCWc/M/kkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5336
Received-SPF: pass client-ip=2a01:111:f400:fe1e::72c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.613, SPF_HELO_PASS=-0.001,
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

02.06.2021 12:12, Stefan Hajnoczi wrote:
> On Fri, May 28, 2021 at 05:16:28PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> @@ -183,6 +184,7 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>>           .call_state = call_state,
>>           .offset = offset,
>>           .bytes = bytes,
>> +        .copy_range = s->use_copy_range,
>>       };
>>       qemu_co_queue_init(&task->wait_queue);
>>       QLIST_INSERT_HEAD(&s->tasks, task, list);
>> @@ -342,11 +344,17 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,
>>    *
>>    * No sync here: nor bitmap neighter intersecting requests handling, only copy.
>>    *
>> + * @copy_range is in-out argument: if *copy_range is false, copy_range is not
> 
> s/is in-out argument/is an in-out argument/
> 
>> + * done. If *copy_range is true, copy_range attempt is done. If copy_range
> 
> s/copy_range attempt is done/copy_range is attempted/
> 
>> + * attempt failed, the function fallback to usual read+write and *copy_range is
> 
> If the copy_range attempt fails, the function falls back to the usual
> read+write and ...
> 

That's better, thanks!

-- 
Best regards,
Vladimir

