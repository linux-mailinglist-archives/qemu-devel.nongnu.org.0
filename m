Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAB83A1000
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:13:38 +0200 (CEST)
Received: from localhost ([::1]:39238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqvDN-00065F-9B
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqvA5-0002Py-8s; Wed, 09 Jun 2021 06:10:13 -0400
Received: from mail-eopbgr80095.outbound.protection.outlook.com
 ([40.107.8.95]:55541 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqv9n-0001Lp-If; Wed, 09 Jun 2021 06:10:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Agc4mYmPuco5hT3UI5E5WMSlwSp+l3H5f+eRUkpcWHrozYgEgHAKii7cHwFeZvkAo+xTV5DZKY+jE64Phino0FwiESYPVCsZgGQ2Rf3KA7xctf2h4YooRgofNCed6l64o2VgxA6h6YD8VlnlRQ16ZoxeGD+0/XXMGmReTguwS93eY5sSpl/UwV4e+HRfbmLLvQe5jHQBLnhsyLjaYsfi+NYCcePGtFIEn1aF4HCwBxLh5UzbfZUDEKBQasj74w8mP0Q0S2BnDhj87WYYcFCBwy/sMdCfsGNMyOa3Z8yWOrApr3ue7E2MBjKVR83+4DzujKQ1+5kDsCXLwZxiIO0v3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfrEjE/nj83ngz7Ma94G66/SJj6sYvz5WHEXxLykXIk=;
 b=FZ2Nh83c5oduweMe6YMgB7Rs9D9m6v6lrwDCAgdpEI5SdJ/PeHF5b1Izwp9LKNF+/FC1qW6dcCeABlHmJHmFbeIasuHK4htXX/aMF4VdWv5MVhyYz9I4oZSvZ8ExJdKm4kkYTNBwmX8f0YF39AtUeek0HJULpI1B24h0Ry6fplRo3rU8lqeyAzWkvAJfuyD/JKt562M3jOdNDfqj/0c77bMMSzUG6x8aiYwAoCVh+1xjZ59qeBC2OLT1BcGuC1AxFMF41msg6z7nkCy3PE9WIxpN0B7OpjVirtQHqZMKSbgYwFeMMqQ980eNlpiqKslavGPs4DtL0CSYe9+SDVwNRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfrEjE/nj83ngz7Ma94G66/SJj6sYvz5WHEXxLykXIk=;
 b=G/OxbUSfOV3oMYmTqRL/3BPQF7jl11gTMo3bW8i++GXdtAgCWmx3SVjlO594UiB06MaRrDKq6DB1fZm9mmYlJSp1C3VnteqATuafHd8WY9xYfEbLfD1lTlqVDOGLBxdXj5i5IZNmy0M6Ku/3nWOGYk4F9sZWhkeIwepbhu6BrSw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2417.eurprd08.prod.outlook.com (2603:10a6:203:9c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Wed, 9 Jun
 2021 10:09:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 10:09:52 +0000
Subject: Re: [PATCH v3 1/5] block-copy: streamline choice of copy_range vs.
 read/write
To: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
References: <20210608073344.53637-1-eesposit@redhat.com>
 <20210608073344.53637-2-eesposit@redhat.com>
 <ddc23736-d6ce-cdde-21b8-f809ef65ea65@virtuozzo.com>
 <8f49c449-583b-8842-9920-dd0dc1196e1f@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bfe5e37f-ce7a-d867-cd9a-9de7ccd65966@virtuozzo.com>
Date: Wed, 9 Jun 2021 13:09:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <8f49c449-583b-8842-9920-dd0dc1196e1f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR0P264CA0132.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR0P264CA0132.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 10:09:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4aefddd-db1f-4c9c-fb05-08d92b2eb8cc
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2417:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24174CB4A8A7C2EAA3608756C1369@AM5PR0802MB2417.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pX3OhSG2ygeychUUl42uDg4DSbdFBfHsvK/oWOf0+b+vp9sQTbFgi3tuPHBz3QFAqqjWWx/190jIAMa/zgnUshFsQlPG92bSUZlOvG3f8wXOtR/vjQYmRkP/Zyc/n6LatWQ9dUWS3GcNGbLoBXGA0zYOtU63C3iKafypS9jDS2DLdxARmcDj0toLr9oFblhPqDaeWoUsLwEW9YpnC6/x5N+qv/47qOu314bojFfElclESbsgjZ7LijuZw1eDDPsQv7GYHZ08HStrDKJ4Sn9yej8NLyVn3udao1UYfHtl1xIAKoSfMR26ylqjH97Wez5B43R6ByKOp/+gvkRVmzz7mnPn/0T5Q44F6OJu5ub5m71NY4UUVK/aQ0Mc0wgIKMU4gLd6w8knyiQKiaoRdw9XmnmUTF2dwEmWsh9qNTajrKb0MqgocBy96j/3zH31Zomws1WQlez+QvwE8OCUQwBIYI1+0CBIW1gTEy1AGywLZoL/RiWsk6XFQL6W9TtGDl3DTbidOU0Yv7g6hETyeKa7OE7t05pa9kMSm/oS4fK5dFDfUEn8qPBVRM2mTHfa8iJboWuy29fAEcjsD/RsUNzKJIPH0XmlRugDYdyKZjYVvllFIPgFYOnXwbA1zHdlxz9bcdDznVuSdeqv9ZoLBcRf9heec6cJRZb+cXfSrU7SWIHovCbQ8RGIiCxuGMWDV+lnZFEpaIkWNnFtvF+L0xjO8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(396003)(136003)(26005)(52116002)(16526019)(53546011)(186003)(54906003)(16576012)(110136005)(6486002)(8936002)(66946007)(66556008)(316002)(4326008)(66476007)(36756003)(478600001)(86362001)(31696002)(83380400001)(2906002)(38350700002)(956004)(31686004)(2616005)(38100700002)(8676002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Uy9LaUU3SnN4M21zK2hCK01hRE1xalpMdDRjVmZXbUROd3dENVRUMXovVENy?=
 =?utf-8?B?N2VucmFQSGxzNWlmTVA5MFpxVDRkQ3VjcDJabmxBOTdxaytBYmR6NllKV1Vk?=
 =?utf-8?B?and6MlpGYzdDVVZ0QWZnZ2djQkZ4L3FQR01BakRxdkpScmc0bndSL3ZmRmx6?=
 =?utf-8?B?RVM4QUpFek1QNU80c1FrTUY3Zm4rd3p1UHhZUTdneUNoSjJNRk0yVS8zZ3lr?=
 =?utf-8?B?T1YxY0czU3h0RWozRW9ZNndNd0pqdi80alNrNVRoM1ZreEp5K1h4N3o3aURs?=
 =?utf-8?B?UTRpaUIvYUVnQlhydXB2NHhUMTRZckNsSmk1Z08yY0lheTR4NzhnbEJFalpE?=
 =?utf-8?B?SkNra1JXaFVCaS82RTlHU0oySmJPbWNEVk5PcU9CUGtHa0VNMnFvOFRLeVA2?=
 =?utf-8?B?aVlZUTRHNTJ1SnVScU1sbGwxQUNOTzdvTk0wUzNUUVFnd0phNm5sVGIxL012?=
 =?utf-8?B?VVp5ODBkclJ3THpxb0s1R0xJNlFBZ21SbjRnNGx2VlJBRm00R3dDR2RRdWo1?=
 =?utf-8?B?U0dyVm9uRGVCVFFQU2ZobzFqRStPejJvNmwrQmUrZFpGSVF3eExvUW41UGxK?=
 =?utf-8?B?TGZFdzEwKzZaYUtYTGZsZ05DeGltY0VrSzFEMXpBYWp0WnFBR2FzRmFMdWtV?=
 =?utf-8?B?RGVKSGhJRmlpbjVvRmwzV0NMSExHU1BnZURETFZaL1IyNENJZEtyV3RxQjZo?=
 =?utf-8?B?T2Z3WTRncnFzRGVEYVVvWFR2T1VoUDFKdVFBRjV1NjNEc25LTEREbE13ZWJV?=
 =?utf-8?B?aTlkajFLTUQ0SS9lK2QrT1dRKzNrTzllcFVJWW9KeFRoOElid3VFMTdZZ0RZ?=
 =?utf-8?B?TkVwYnU5WFhpYURrNU5qWGE0R3RGSGRzT0hPTXFJNFBZQXpuRHBLYW1VNG8w?=
 =?utf-8?B?ZWhMZ3RiUGhPNHNFNUN5MU1HbmRQZnZiOFd3MEovZnFDNktHQ2VPNjFqbVV3?=
 =?utf-8?B?aU51dFkrNkpudXZRU08wMGZKUTQ2TWZCN2xQNTR2UkRsdEMvakJVbHMzRjE4?=
 =?utf-8?B?bGt6cm1wRDZiT3NCOVV2SVhnaU41NXpwdXZkZUYybWk2bnQxSFdKc3c0Q0VN?=
 =?utf-8?B?YkJXa05nbzZaSlY1bmhMS2dJZXZyUmpadnM5ZDBCT24rNzdzSUVVQUp5a0lG?=
 =?utf-8?B?NHVFT2RCSTI0ejB1NUFtUG1xMVJ3ZXVRemdzT2RoajNOdzhwK1RuamxQSEVL?=
 =?utf-8?B?enlSMVVNSkFFNWc0YkJCMjBQejNzVk5IdFhWTEtJbmdHLzRSVEcxM0VqUTNz?=
 =?utf-8?B?c1FQbmwySzUySE1ERFRhNUpUYno4UFMyWXFlSm54d0tBbDFoWmxucU1oZmU2?=
 =?utf-8?B?eWRJam5tWFVGaDYrYXBxTVZkbTJkbFNXeEhpeXo1SFY1USs5OC9XbWY4WW1Y?=
 =?utf-8?B?YjdLb3drRHB2cVFoeG5IVjlnQ2o3VlVnVllpWWlZSWhXZGt5Ykl1ajlSK1FV?=
 =?utf-8?B?elFxMGYzSGdoWHd3WjhZTCtiYlo3V2ZLKzB3RmxBbW1kbll3SStnMUZ1cEVz?=
 =?utf-8?B?N3Fwb0pRZUtRdnd3Q2NBKzRkYk9IcVNqOVhWS1FkcFRoWERidEpYYnVLUGxF?=
 =?utf-8?B?UXNWeVBKZGMrL21CQk1lRFZUZVRCOEZYaHR5SDREcnliRXlwdTU3aUNpU3JX?=
 =?utf-8?B?SmpGdGJzcTR4RWZFU3ZqUnVaVVVkcFJSd2JSUDZZYlI5RmdvVUlkWTI0ZVpO?=
 =?utf-8?B?RFY3Q2dIV3I3N1FmVmVnV0RFTmltTnlaVVlDeG5MWlJ3S3VLWUJoLzFGUklS?=
 =?utf-8?Q?mIR43ub6B6Iz1Zyms9Lr3sCuYE1go8NaggH8qhk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4aefddd-db1f-4c9c-fb05-08d92b2eb8cc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 10:09:51.9742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xW4eCu7S3lT6LFOqbtFlmzSi5sjDWqNi0vTMQHzwebFxeejZdyTH9Et9KhKJ3/dV3DVn7d2CwJyWNc+O68u+0s3D/uXO87OyQkfCE6C0cPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2417
Received-SPF: pass client-ip=40.107.8.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

09.06.2021 12:33, Paolo Bonzini wrote:
> On 09/06/21 10:51, Vladimir Sementsov-Ogievskiy wrote:
>>>
>>> +    default:
>>> [...]
>>> +        bounce_buffer = qemu_blockalign(s->source->bs, nbytes);
>>> +        ret = bdrv_co_pread(s->source, offset, nbytes, bounce_buffer, 0);
>>> +        if (ret < 0) {
>>> +            trace_block_copy_read_fail(s, offset, ret);
>>> +            *error_is_read = true;
>>> +            goto out;
>>> +        }
>>> +        ret = bdrv_co_pwrite(s->target, offset, nbytes, bounce_buffer,
>>> +                            s->write_flags);
>>> +        if (ret < 0) {
>>> +            trace_block_copy_write_fail(s, offset, ret);
>>> +            *error_is_read = false;
>>> +            goto out;
>>> +        }
>>> +out:
>>> +        qemu_vfree(bounce_buffer);
>>
>> label inside switch operator? Rather unusual. Please, let's avoid it and just keep out: after switch operator.
> 
> Agreed with all comments except this one, the bounce_buffer doesn't exist in the other cases.

Hmm, as well as "return ret" actually is used only for this "default:" case, other paths returns earlier :) Also, bounce_buffer is defined in outer scope anyway. So I don't think that overall picture becomes better from isolation point of view with this change. Maybe good refactoring is moving default branch to a separate helper function together with bounce_buffer local variable.

Still, I don't care too much, keep it as is if you want, that's works for me.

The thing that comes to my mind not the first time: how to make something similar with g_autofree for qemu_blockalign()?

I can imagine how to implement a macro like ERRP_GUARD, which will work like

void *bounce_buffer = qemu_blockalign(...);
QEMU_AUTO_VFREE(bounce_buffer);

...

> 
>>> +    ret = block_copy_do_copy(s, t->offset, t->bytes, &method, &error_is_read);
>>> +    if (s->method == t->method) {
>>> +        s->method = method;
>>
>> you leave another t->s occurrences in the function untouched. It's somehow inconsistent. Could we just use t->s in this patch, and refactor with a follow-up patch (or as preparing patch)? 
> 
> Maybe as a first patch, yes.
> 
> Paolo
> 


-- 
Best regards,
Vladimir

