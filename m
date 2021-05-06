Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C215375191
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:32:17 +0200 (CEST)
Received: from localhost ([::1]:47198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leaMi-0000VC-8Z
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leaCj-0007Kj-98; Thu, 06 May 2021 05:21:58 -0400
Received: from mail-eopbgr80112.outbound.protection.outlook.com
 ([40.107.8.112]:7907 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leaCb-0002ER-Kg; Thu, 06 May 2021 05:21:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QO5ZhkFTKJFaQwSS9YJSHXJlFONy71O2DIzF8YXcTuoG8eprlzmaRb6NBfcKNTPUFaglslrnynd64fK4/bgfEvKl5/rujh+nQ3HIRl9sM3KXkXawWo769d4GmLRdVtJ4mO6gcapX2klmmJruTLkLZI+31zjVVwx5mGZtfIdfOLkX/EEeCUvoawMzZIJoe6AS5ZEh20zEhhirEbQ2uwf9SFlssnWwn7pI5iAvHvz8g04bsGWKSWfmleqDkynGixAbiEEmdLLEDgIlNHvc+0RqXpB6FqFEUrqa7jVxcdUpeKaFqCvREZxr12EFKmgpghFAGGBHf5aVuQJA0O9PYSVrIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSyGMQZtQ3vcYljvGv0XNlx4MzwXXoi1lPd72T5jZ30=;
 b=OEyLISYl//cxe2T5XFViqKhDJ8yebulJImD9AabYG9+fpk8/Ky/1kqtT67IP4FuTR4G1v5noRFFqEfutj7IDDlAJ7vsBDRh4AtD4BQtiIyf6QFlx/T9VPhPtSSeX9iExQLyQUlqyg/ILgDAKrgTZpWMJfsNmi3nPe32e54JJJMec0LYBo2aAOaSi48Qexjl+GJzrJ3PClHoMuyNFk1MmnwPWEX6KfZiokOVMm0/G8i27J8cqc0kxBLjvGLg1f64Bbde0ZGRn3Xn+FqsDNlYbd3bV2+MmRCBV1oKZ4EHoCV4XNQyY4QJ36BkOXIa8QwG8VOh57BQnV6aMpr2NoWYw2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSyGMQZtQ3vcYljvGv0XNlx4MzwXXoi1lPd72T5jZ30=;
 b=vioVAV/nX4bCoMddgZXIhhe8G4DHXJlnqvrGSI9Tsq+0lL9WPwz+o32Pdd7y4J9k4dvn6D2kYk9kI2L/W/78oO9K6gO3/YzbDQysxz9JvbJkgYlobq4P6hJvbWUpUaqmzBerFHKJazxs1sFv3wWhNYuB85qzTx0EUdWjhf2ScFY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1907.eurprd08.prod.outlook.com (2603:10a6:203:4a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 09:21:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 09:21:45 +0000
Subject: Re: [PATCH v4 4/6] block: Support multiple reopening with
 x-blockdev-reopen
To: Kevin Wolf <kwolf@redhat.com>
Cc: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
References: <cover.1616000692.git.berto@igalia.com>
 <ed95ecd1018e45869d02e4525fc65216e7ebd370.1616000692.git.berto@igalia.com>
 <b0f51127-d3c0-7334-6dcf-45f7d66270c2@virtuozzo.com>
 <YJLFboRME/eFXetd@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fee69f02-6553-ff02-0bae-ee4e3cee343a@virtuozzo.com>
Date: Thu, 6 May 2021 12:21:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YJLFboRME/eFXetd@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.12 via Frontend Transport; Thu, 6 May 2021 09:21:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c80f2a8b-8e21-42a4-442c-08d910705e11
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1907:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1907D29911166E3489F66CC2C1589@AM5PR0801MB1907.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AqU+zJ0Wbnr8wyMZoWhTUJ8kyTErx7Jh4cZhEnjsd5ppcg2IEbmY+WmqAIwn5UTyAtTm0HdQTF1JBe7DfW4OlQIdSSVWbI5rU9kqMFEZ8NPUeyL/qM+l9guH77cV/6U40vJ9yoepO1OOGtmi4U/qBHERkp3xA87UxKmWo965RjT5f17LzHAI1SrIxLiVFPC6zhCVzK25mUvu+DATAOuEoeWuo60DDNz6VxHibQrUsKgjWnfQSk9U6FgsGlPGgQCCwf3+A52gdngg4XLAHo37ORmgPt9PY1Y1s5HKcAHNUcU7FL9nruGG6WJfrmgjMFVnIQCpbrjX6bubKAdJTWGmbYIm1f/JBrk0EyLNPmOdCLqyf6jJxA8tF9407xnbYYBktJnRor5p83+9IcclaasaoRvYJ5groEp+DXiAMBSX+WcGkWCOlG7NpZvrHRKLXX3rVUN3gKWjyAy0Zh/0qdZdRbTMZG0gv+1yumgDHEh6RYuI8+BMPcQpIgB/XIyUn6LS4eWevA4F2GUAv4EdsGszzPX8Uz6VyXtibDrFkgtikzHZPrBMjP0v8vNE1h703W21SxcHF/a22BvNg47WbiQfYDHWdWqcc/+ac0XlLHiOiPdETBR6ozoS1IwZNBhIbTafqiDQPl7UqvRvbCzUTfa3VL1yde7VF3wuhuoYRGOjfYw2DlcWxRZ/9metYZ2q75Kar21zpFCzGqjAC1dBpIvmPephZF+4BCs/k/2bp3VdqxM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(396003)(39840400004)(83380400001)(5660300002)(956004)(31686004)(186003)(16576012)(2616005)(316002)(6916009)(4326008)(54906003)(478600001)(16526019)(8676002)(8936002)(2906002)(66946007)(26005)(6486002)(31696002)(86362001)(52116002)(66556008)(66476007)(36756003)(38350700002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dE9MMGFMM3lnMDIxVlFtUHJJMFIySDV5b0pUcmMzN3JWR0IwT2VrWG5vTG43?=
 =?utf-8?B?NVRPcHZkb1hiQTMvQ1k4OFRpNW5jRUxJMktxSE9OOGZSYTZqZk5PdUxzdng2?=
 =?utf-8?B?dWN5VVpuenJiSTlIYlArazhTQlZiWTFFZWViZm8rWDU1djhzbXVSTVBjc3RX?=
 =?utf-8?B?SWhPRjlXMWwvampqbWMxelNHSHl5Wmh5VVF5Y2lXYnY3Ykk0aDVIYXFGdi9O?=
 =?utf-8?B?TEdzYVcyNVpzb1J2Y3A0dW5LaVhFaEJzOHNPMnVRTlJqc2lUaS9ELzhPeHRR?=
 =?utf-8?B?QXJidkdRV0YwU2lYTEVESWZjZHo4MEJzZjFTSi9CVVZNb0cyWStidHB0N0lx?=
 =?utf-8?B?N0lpMEJrMUw4MXhFKzN4SGNraFVlMUZTeE9GOThvME5qQngrMmFZSjNuZVZC?=
 =?utf-8?B?Y29mUGRPUlVGZlRDNUhWaWZuSjBVWS91ZkZJMnFLcmQ3VklMOUIxMjFCSlR4?=
 =?utf-8?B?T0lvL25HOGpJeFBlNURSQjY5VUo5bVRpaDRKMzNnMWpsSHVsT1B6ZEpsbWti?=
 =?utf-8?B?R2ZCcGJGblgwb25qWEtZZzVxTE9aUU1laFNxKzZkV1oxTGI2czZWNnhYeUox?=
 =?utf-8?B?T0Iwa3Z2Vy9Iem1vYjVJc1AycS9JL09wQjFadGpZbTFYZ05IVGVGTlVnaHRz?=
 =?utf-8?B?S1F2U0x1RUVUM3p3SzdpWXc5SWVmLzI5Ym45dTZCdUtVZC9iMXA1ZE1adVVV?=
 =?utf-8?B?b2NQSmVVREU4a1N5UkVRWVdXUjlzdUZmMWY0YjdveFQvSGpVcFRrUkM0M1ZC?=
 =?utf-8?B?OHoycVhyYnNlOS9OYXB1Q2lldXo0LzQ4ODY1VWxsbWllbEFkdTE0MDV1d3lZ?=
 =?utf-8?B?dFFieTFqQmt5N21HbDBzTzdzYVBOL1BxbWhmYlkva2tnRXZVWGNmQzYvSHMx?=
 =?utf-8?B?NkhHK1ZEVzUrQUNQTHQyWXUvRGUzak5qb3QzaUlDTFFGZVViR2gvTUhOSnRl?=
 =?utf-8?B?Wm9NZmxZVExwc0RNTVFjOHJEZHNieGdEU2dsYXRBUlVCbFZqNzl3NnFGL25j?=
 =?utf-8?B?Rno0c1VIc3FWTEhRN0ZBWFZkZnJreFNnYzM3ZHJWbld0cWNCcUpzY0U0Zkpt?=
 =?utf-8?B?VXpXaHFyUGdQOTluTmV4VERGZk9aeHoyaFN4cXFUTkFlWk1idlQ1dHgzbklo?=
 =?utf-8?B?bFFNOVlvaEc3R0xQQTQvVUhaNm1jMjA4NFdvQm5McnVweHBVbEh4VXNLMzM1?=
 =?utf-8?B?MGVuSDlyT1pmaDdocEt2blZrQVVDRDlhNGNmMkFlSW5yWWdTT3lxKzJCVGVI?=
 =?utf-8?B?ZWZUVys0NFdvWGxQK0toTTZBa1VwcmN0YnNKbHFQTnQyTlB1RkY0a3plQmo3?=
 =?utf-8?B?VEtpWEtrZmplZUMrZFpwNXpxWUJ1cFVTbzZtTmpnd0xEN0JLNGc3cTZDUEVS?=
 =?utf-8?B?NDNDNXVGeG51TDVpd2dQb1NQR2phT1lyK1FVR204ejdLNWdneUhEMGI2aGJy?=
 =?utf-8?B?a1Y0ZkdOOHREVjJpYVZXTlNxOEFoZUhIYnIxZ00vNFJkZm1jcWJaUWp4RnUy?=
 =?utf-8?B?anpxaXVyOWptMVo5OXFtTy9vMnZ0UGtvS1FCbzZMZEJodXpwV1RoNGR4MENY?=
 =?utf-8?B?Ri9qT1B1YnVzQ01TYm5kS0N2NEZaRFpNQnFIK0NWMy9XOUV1TERlcUN1OHlQ?=
 =?utf-8?B?V254UVVMVGlWaTY0MEFkYXBycmIzTnlGZi9jZGY2RW9Wa0NYekhJV0ZxYytC?=
 =?utf-8?B?dXB3NjN5RFFvOWIxWWl5WHUyeVdCSzFsWFpOUHJsYyt0WnZObVNtd3lWNWV1?=
 =?utf-8?Q?Z2X9x6pH7sQG10NhhU7MtqmuKks+XYtH2Wk4QFr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80f2a8b-8e21-42a4-442c-08d910705e11
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 09:21:45.1402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sToVxXR8orFaMJFlkH69B+bhoKA/eleHj+lRu3ay2lO214aHPqqsIBrx6+sLN3Sq8hG4rv+XheM4je47GilBZ9Qih3JjUg8R+taGToE4P5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1907
Received-SPF: pass client-ip=40.107.8.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

05.05.2021 19:18, Kevin Wolf wrote:
>> And then, bdrv_reopen_multiple() is called with no aio context
>> acquired, and no drained section.. And it shoud be refactored to
>> properly operate with acquiring and realeasing the contexts and
>> drained sections when needed...
> The drained section shouldn't be a problem, we can keep this. In fact,
> we need this, it is a documented requirement of bdrv_reopen_multiple().
> We just need to drop the AioContext lock after drained_begin.
> 
> bdrv_reopen_multiple() should really document its requirements regarding
> AioContext locks. It probably doesn't really care, but requires that
> it be called from the main thread.
> 
>> (note preexisting problem of reopen, that during reopen the whole tree
>> may be moved to another aio context, but we continue operations with
>> acquired old aio context which is wrong).
> Do we even acquire the old AioContext?
> 

I think, I mean aio_context_acquire(ctx);  in current qmp_x_blockdev_reopen()..

And I remember, that you said about that problem. Still, may be I misunderstood (or misremember). Doesn't worth digging, I'd prefer just review v5 with a fresh eye when it comes.


-- 
Best regards,
Vladimir

