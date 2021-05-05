Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2B8373834
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:56:38 +0200 (CEST)
Received: from localhost ([::1]:53610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEGj-000665-Mv
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leEEd-0004Lm-Al; Wed, 05 May 2021 05:54:27 -0400
Received: from mail-he1eur02on070e.outbound.protection.outlook.com
 ([2a01:111:f400:fe05::70e]:21501
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leEEa-00075L-6z; Wed, 05 May 2021 05:54:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oT9MV/huWIeQ7fHEUwdzwlAYYhSAs6wolJlibvjALXC5bbF0FVT/gRoS6DrTeO6baOz1xjKsC7Hc4rB9Dc0ryoxofosTL/krrpYySSJgX9gWnGEZc3AuRIYDvJawmP6CLcFHt/Zd0dCNYKPBFgWu2DX41LIRN7k8zNQtiVZ7uJiJxMfj0Kbq/K7ZWMfD/hwoQPMOiSYSO0P4ih9uKbmhIDNWkMhXvf/lDkEdEpXnFrUd5lqsJBFq6FxzJrFIki/DCJ7K1SS1RaA6s+HN2wJyp+gGBEU5CO10IvW99zNRso3KzvXNG68Lm/tM/C3WMBdTOuV9lPH1Bgqceaojm5T76A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZuxwSAaiiwwnB6LkhdpJuoImLJiR0RsWhZA46mUxfI=;
 b=NirJPg/Ad5Jbpv80YEE1uwbbOqCI654OOxg5AxotjfytoP7HHC8zFEYiWXhIBYMvjP+Q7CpkT2jMhO1h4Gfkvo3VUs+AKlrpLv7qe0zBb+tZ6eZVp5jTFAJdK+KN5gENvgtuGHjGOE6KPGSiAD4k142SNESV99rY9zh3xhh2Uqn5ZWSOq3d9HZxVTqu9vPAcbiE+PrIgYEJlE2pjyM/XnGPqGN34VykxgW7/KC+CbjxGBQGLZzC4zhqA14xxnSLG2gpGsADIVB3mdbSIYuO8fbG8tEBm+QmBL6Tcy55kKOyCIsSJnlTJJnaXSR6CXhLF4hbz6Sj+jAXDMVAs28/rZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZuxwSAaiiwwnB6LkhdpJuoImLJiR0RsWhZA46mUxfI=;
 b=wiOVVHv7o4hxddU7qcPlDRgijWavrOC6ndo8QyztneywxHYYW7hXL6/13t/VQ/ta03qLSzrwLfk25xJsCM7BuWb4x9IzVF6DEp9sbmzvxVRLKpyEcOeW+eYpEX+Axs9viKH9VO9vuuuYxescw61qcFu+r3uqe+z7lEV+3OAZB4o=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3720.eurprd08.prod.outlook.com (2603:10a6:20b:8f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 09:54:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 09:54:11 +0000
Subject: Re: [PATCH v2 1/8] block: prepare write threshold code for thread
 safety
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
References: <20210419085541.22310-1-eesposit@redhat.com>
 <20210419085541.22310-2-eesposit@redhat.com>
 <YJJcSqa+EG1U+wMV@stefanha-x1.localdomain>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <39fe743f-ed26-d806-aa31-37146856790d@virtuozzo.com>
Date: Wed, 5 May 2021 12:54:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YJJcSqa+EG1U+wMV@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: PR3P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 PR3P189CA0023.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 09:54:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73e1d423-56a4-4444-de3a-08d90fabbbf8
X-MS-TrafficTypeDiagnostic: AM6PR08MB3720:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3720CA485A7BDB2105737053C1599@AM6PR08MB3720.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:274;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: asntpPBfywMB1LPRNGtfzrHhfuXIA3Y3pCesLXc/vq68ETtDVx9n+6ijJjV191/sD31wXhIJB+tlFc8sI4Y4Y3u/TozRWh1RVLcDaPZkaOLH0vgH74IC/ScvxKWxvPmJRSVYc9KzTHN3RJDmmYV8qSAmI7k66WjigUPsgbus3DTINWWngNcAe3nWEMWqnWvdfYnv9XQFKMjQ7uwmziLZaxQlVynDYC5uXrqP3tSI1wVWXQ/DZeuJlFxi3O7soTkAgdkpJtFQWDqGjWHomL3ipBtbeKCXATiCd8NCYTdB32G0fPft/X4M4V3ju6Vmkpmw0/Og6CvC4Y9cJ9dGB11kLa606Sl2FpWgeueKFCUHhFbVxS03iTPvbKu5Lptv4dKJ+NOBaNJpT7LNeR69aV7p4pu/xfyVMX3E2RRnG8+2iS+bXVVvphfcnkwNJWJdk35771xmz3US+yhkUFEcJ5YBYeFGr/uPM8UJc4+owHHlyx6Pdcy+cbmxjzOjhrDCEKsB4bBVKZK9krp0xu0bx7/K8tZPytghPmpAnCz+hv/Uh+C7e3OcsyqIoXgNaQ3HHTtgf7Zh9ZaJ+FnopYjcGKjlvImSO/xYSvGJ6RY4aGyl0c/n0X2rlPZmWF03X+9MC5zpXC0JiJ5NScGb2L4EHYa6RN/vzhIcM70Y035YktqRNWwmZcBVBbQfWSwTv/lPaIx4NBv1YGOyTarXzQDUvazNFxJJuj8Im7V19D8AxG8/9Fw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(346002)(396003)(376002)(136003)(38350700002)(38100700002)(66946007)(66476007)(26005)(31686004)(83380400001)(66556008)(8936002)(16526019)(31696002)(16576012)(54906003)(4326008)(36756003)(7416002)(316002)(86362001)(478600001)(2616005)(6486002)(8676002)(2906002)(186003)(52116002)(5660300002)(956004)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?UMMKeNPYBR32u8M6sSTX98oYMpIPeqxhUM9lp5JogDK75zY9N5rfFnnN?=
 =?Windows-1252?Q?yYnUetjdKdIPkZ9tcPJlQfDCRj5s66Q9+btv0sZM4BkFEietOTxaLi/o?=
 =?Windows-1252?Q?3imP3m2fyJbe88jkrVDqG4ztN+i1xVbktluc/RE9vYrCtEsQXcWPpxZv?=
 =?Windows-1252?Q?4jF5hdB4Lgkc222e3bp+3rrHvQ5d6smZng5T2Veb6h6TslPc6AszXyIp?=
 =?Windows-1252?Q?A7xhZwahJHNoYhMoUszMDsDU2jBPFHeN5kYUr08eUKXdx9hVEAC4sx/+?=
 =?Windows-1252?Q?ozeyUoneiDMOem/gUTuLHPlldOoCLhFl7q4OBt1ytc+EkwpFZrjwVM44?=
 =?Windows-1252?Q?56Vrnv+XSPVQa4mL0JzLMFuaGUqOdpz/CV6GMlNpEc0XDby+ClMEBWm9?=
 =?Windows-1252?Q?bMlMTqz0fRMaJ68dvQcsIMQaMM+kWmQbNrJxsaVo3JoG6ptYM4eIdWz1?=
 =?Windows-1252?Q?PG3s9G4VKiYL83UQLY5xmQhaUOh1FkVMVC6/zNl+nd6zzqA9ObNPQfit?=
 =?Windows-1252?Q?P0quHAy8mqW/GTQCJvPzjNvZQtSbKwA2bFefGmUNKuZxu5vrIJBGBpaP?=
 =?Windows-1252?Q?7g/l9gMLxSSqEGomF13JZlD1FIyugRE+oXHklWNhrooOvogGH9Dcs61N?=
 =?Windows-1252?Q?ZXmjmdpKLHF9V1mYAX5JkMVprHF0hMBzoko98IczjHnKtTdlb6m19y2J?=
 =?Windows-1252?Q?ehDPQ5OYR08YuauchK3E5I9kDOEVvpbmEdSxFZoPDcYZSYirB9BrCEB5?=
 =?Windows-1252?Q?OoFJZn5mlo3o8rgAWdeOa9ID6V0ZNF6/Lyul+ltinb5Y1iAKfDrk//tv?=
 =?Windows-1252?Q?/t0D6EPrDPljBID2TLEvn60WyhidWW2Jf2L/qtTS891NnjvI2x/Edrtw?=
 =?Windows-1252?Q?GcYQgjq64cwZGAppocSDHWIia7Xn0hozzOL9sDd7itSbU+tPcBHDRRHX?=
 =?Windows-1252?Q?2Qvn0WyJjY5gWLtHhJudKprk1r4ZsPI/wEMroypIXUFcy/kTP88Gt2u/?=
 =?Windows-1252?Q?l3PpuOor5EFY0M2X8fslp+sV/4IFTrE0kQHjwLVx3ISqb/X8fZirjVSI?=
 =?Windows-1252?Q?503WtNBCN44DaEs2w8sjtCvA4AGgNX9tB++5IJRww9LPQVlNPzH2QeWU?=
 =?Windows-1252?Q?exwWRPkgqkKvdROm4Fdr2lZ0DNYWZQ99ddnPg7DxOHReB3bM8YR1mQ4z?=
 =?Windows-1252?Q?G5pYb1P7XreNdcLVBsZ57ppYu9x8hBnp9wG/749STYiwlN5q9uonxqxb?=
 =?Windows-1252?Q?DrbNgWtfr1H+FPMycQBcodwGtmdhWIgFRRKDwCVQEFNoisf1X4VZKv+R?=
 =?Windows-1252?Q?nmjg2EzIuaNqIrs2WOZX5HJXrLnzlmUepoTnHeJrKlMcWbCM7BAwb09h?=
 =?Windows-1252?Q?yq4JHLcXPDl/wKvUlRD0enG8Uu4qo9uCF3EGOtWk8RbrWzXDvzu/h3nY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e1d423-56a4-4444-de3a-08d90fabbbf8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 09:54:11.8752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxomftKfAX36jZS5PICaPHAvpb1WSzP/SYhXI/XBJkzHrhvgCJnZbJ5B5pBrLzkX26WFCA3lVUZ5Vd+h6dJ4xf1suzCpU/zgtwnGpF7wGnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3720
Received-SPF: pass client-ip=2a01:111:f400:fe05::70e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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

Hi Stefan!

Note my "[PATCH v2 0/9] block: refactor write threshold", it's a kind of counter-proposal for first half of this series.

05.05.2021 11:50, Stefan Hajnoczi wrote:
> On Mon, Apr 19, 2021 at 10:55:34AM +0200, Emanuele Giuseppe Esposito wrote:
> 
> No commit description. What about write thresholds makes them thread
> unsafe? Without a commit description reviewers have to reverse-engineer
> the patch to figure out the author's intention, which can lead to
> misunderstandings and bugs slipping through.
> 
> My guess is the point of this patch was to stop accessing fields in bs
> directly?
> 
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block/write-threshold.c | 28 ++++++++++++++++------------
>>   1 file changed, 16 insertions(+), 12 deletions(-)
>>
>> diff --git a/block/write-threshold.c b/block/write-threshold.c
>> index 85b78dc2a9..63040fa4f2 100644
>> --- a/block/write-threshold.c
>> +++ b/block/write-threshold.c
>> @@ -37,18 +37,22 @@ static void write_threshold_disable(BlockDriverState *bs)
>>       }
>>   }
>>   
>> +static uint64_t treshold_overage(const BdrvTrackedRequest *req,
>> +                                uint64_t thres)
>> +{
>> +    if (thres > 0 && req->offset + req->bytes > thres) {
>> +        return req->offset + req->bytes - thres;
>> +    } else {
>> +        return 0;
>> +    }
>> +}
>> +
>>   uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
>>                                          const BdrvTrackedRequest *req)
>>   {
>> -    if (bdrv_write_threshold_is_set(bs)) {
>> -        if (req->offset > bs->write_threshold_offset) {
>> -            return (req->offset - bs->write_threshold_offset) + req->bytes;
>> -        }
>> -        if ((req->offset + req->bytes) > bs->write_threshold_offset) {
>> -            return (req->offset + req->bytes) - bs->write_threshold_offset;
>> -        }
>> -    }
>> -    return 0;
>> +    uint64_t thres = bdrv_write_threshold_get(bs);
>> +
>> +    return treshold_overage(req, thres);
>>   }
> 
> Hmm...this function is only used by tests now. Should the tests be
> updated so that they are exercising the actual code instead of this
> test-only interface?
> 
>>   
>>   static int coroutine_fn before_write_notify(NotifierWithReturn *notifier,
>> @@ -56,14 +60,14 @@ static int coroutine_fn before_write_notify(NotifierWithReturn *notifier,
>>   {
>>       BdrvTrackedRequest *req = opaque;
>>       BlockDriverState *bs = req->bs;
>> -    uint64_t amount = 0;
>> +    uint64_t thres = bdrv_write_threshold_get(bs);
>> +    uint64_t amount = treshold_overage(req, thres);
>>   
>> -    amount = bdrv_write_threshold_exceeded(bs, req);
>>       if (amount > 0) {
>>           qapi_event_send_block_write_threshold(
>>               bs->node_name,
>>               amount,
>> -            bs->write_threshold_offset);
>> +            thres);
>>   
>>           /* autodisable to avoid flooding the monitor */
>>           write_threshold_disable(bs);
>> -- 
>> 2.30.2
>>


-- 
Best regards,
Vladimir

