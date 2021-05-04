Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0879A37261B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:59:54 +0200 (CEST)
Received: from localhost ([::1]:41134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldp29-0006xF-1u
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldoz1-0004xP-W3; Tue, 04 May 2021 02:56:40 -0400
Received: from mail-db8eur05on2101.outbound.protection.outlook.com
 ([40.107.20.101]:55585 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldoyw-0004tD-CX; Tue, 04 May 2021 02:56:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUoRFdGS554mFd5WkQCYNiaVet/R97rpFqaBMdlwHbMxwMEuSVIMxa7bzw9J9GCXRexeAjBtK/yAbHH3hAXlPTdhBfMgjTZv2YfX9oyMpp+ISX+YyOK/oYg0/kj5btBu80dUa8lRvy6+edFazyXLNtK7nNq81AgA8thlULfSFS79UO/OPf+YYZJB9/MlEn1OWClJrWlnDkFiU7vfqKuuGlgZhbieFqn120C1mu5WmM+W/JWomaRFFnHJmsjOZ8nNLcGDaUvcg/joKAOEl0B8ArMmO0UPBUoZqB2ut6DDBbAF4VffPvG+jKZItdqoByej9xUD++mXp+drNvWwRL2KTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/3kiYP571nsAnns58GrEx+Vkct/5n9WHO8wXZxsWd0=;
 b=nNIQJMOPH/nTKUR8tgQZ3Mqq1/UWvm/VC2Q03xmd59gkWRjB86x+T16QveoiGo+F2Gm+Bwfea3+Csk4KZz623LFxN1FwGBLP0ExsbyppFlv9sGt8Qf+97ibROunGU8GBBi9t8SAuSy57HY2ROrgecXrfAjElbsQWGrEq+t3iOskoEzQpr4PqwtSQJfxO13JAJlhX/7pErGgNPv1CfnXlTjj0rGyWtsLW26m91GlaGhwWo2pHlUPy2ZC9pcE3kM9qlORw3+TnqaYJqknv6KQlOxFB82UUvF3rA1TCFM7gTjlImYW74bnHp8MHrnQ6cjM0L6c15KJ3SNnZ5KNn+up+Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/3kiYP571nsAnns58GrEx+Vkct/5n9WHO8wXZxsWd0=;
 b=da7VDFOfH9pBpsh0L0hTb0z1d0MICYTeCA20MRuY5lnMTgW3Rr6nTer0R/GarqHZtODbg4MS3C+trVfXMj5rzYGDk/KDm81IxFg9kWuSmZ047YVOeArNTRFpzfF1f/KL1c/gL7py69rQGL5KpuKYqRpuufGeto4mOklukNpfDCI=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3622.eurprd08.prod.outlook.com (2603:10a6:20b:4c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Tue, 4 May
 2021 06:56:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 06:56:31 +0000
Subject: Re: [PATCH 1/6] block: fix leak of tran in bdrv_root_attach_child
To: Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210503113402.185852-1-vsementsov@virtuozzo.com>
 <20210503113402.185852-2-vsementsov@virtuozzo.com>
 <w51wnsfhl2z.fsf@maestria.local.igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <21581322-a6fe-7317-0d29-5587f4c7cec5@virtuozzo.com>
Date: Tue, 4 May 2021 09:56:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <w51wnsfhl2z.fsf@maestria.local.igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: PR3P189CA0084.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 PR3P189CA0084.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.25 via Frontend Transport; Tue, 4 May 2021 06:56:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22edc2ff-994e-4c58-b6f1-08d90ec9bf97
X-MS-TrafficTypeDiagnostic: AM6PR08MB3622:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3622F7863F67065D1C5CF609C15A9@AM6PR08MB3622.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3x6+hOmiEW8Mv1Hdgpj9A78ykJbEvH1phzx+nf6KZ5G5FfkWXKOaonH/tzXOzI8EPhNhzeSU38xHr1csKr0e5UczeKsdT5Zv/sQ8TSoKpyrCQlmOc9ujmqojKLeKd9Ar5Zn4FTvsjMEfAW3DyPAHsobGZ+5kgSAMeaKOyOzLrGbf7pC9eUV3eiNq/nJcoW1Ih9YRl9eljzHfLIOmEUQfCkxXf6Gxnk905o173RtjIaxZbJ6dHhaEafjtG2IOQ7HQZsg4+JSyeFKz6H6dEQNtZysrMdICRAI2Rac7tJgCHlm87RTA3mt8d/Q11lmc8qPCa7q+JeNaqi/OoULu0A+IqgZxv+9kZCMh4mk9ctXyjjE2UXE8TSlj3R6bOx/0Ggw7neJTY2PidSclXxOGkKVvov6C0m/wWx35Blihu/rjvWPoZw2+V3iKlKdrgcu8VcVH0UnO7EslatZHXWVTc1vJlYl6ir7qJEYBOkUL91j0SyjzpmbwLqkRjpAWy3c5fglIi8FBne56G7q18DwdG8XTBfqeziW3LpcHGg1DExHNodW5i2lNkjOIXd9T/qpeWzxAXRkfyIiieIrNB05oASF6XdcGaRIhh3aDZ79zjx2V5xbboxy1+mrZqmZoHH7XQY+viLgU104LJU29ZxYrHIajkfNiHYjIqxg6AqGQBALD4wGsnDpKE7zV5aZ/dhK48tDcvO7SOR/OFlTOwMMHXswPsNddXbuVp9RmTBzP5Aq1WK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39840400004)(36756003)(38350700002)(38100700002)(186003)(86362001)(4744005)(6486002)(16526019)(26005)(66476007)(66556008)(4326008)(8936002)(66946007)(8676002)(5660300002)(2906002)(31686004)(83380400001)(956004)(2616005)(316002)(52116002)(31696002)(16576012)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M3lOdi9RdnMrK0x3cjJmd1FwRm9IQnQwSEVWcWdPejBwekw4YkcvS2FMaG9p?=
 =?utf-8?B?QWxydHZwNkxxU2Ruc2gvbk1UWlFxcyt2NitxSHN5VG5sTUd1OXdFZ0EyVXdL?=
 =?utf-8?B?N2JnOVFCd096Q3lwYnZwQTJLZ21VNVU4Tll1SlFvY25QWnAvWms5MndFQlpY?=
 =?utf-8?B?RFlZT2JRVkRTVllVelZlbW0vS2FQbDl2dUZMTU1UTUg3SFZEN0VlVlNpUFI3?=
 =?utf-8?B?NXhWazRndm05YXN0R0oyeHFGRXZPTXJsNE82dE83YVpqN2cweU9oa1pKbkFO?=
 =?utf-8?B?M2FMdGlNR0dXVXNFNDllME5RMkZSWkVCaFFYaHZoNXM0RWJuZUxXZVJFMjJx?=
 =?utf-8?B?ekRST1NhSklZL2twS1JRak5iSjNObXJuUlFoT3QxeEJjTktuR25rVFUzeVlB?=
 =?utf-8?B?eVVwcTJiVHgzcTBSQVdRdEZzWGswOUlFRWpkeTI5bVpiRm8wbjg2bFRSV1dz?=
 =?utf-8?B?ckUzWnBHbE01Y0VRSFlGWlBrY0YrYUhZbTFYdVRCQktseEx0bUdzKzlCTXZP?=
 =?utf-8?B?dXl6UHluRjJmSVY1QjBPbGI2TXU5RXNxd3hlS2ZJa0tPcHRadjNjb3I5M1BW?=
 =?utf-8?B?Z1JSMHoyZkVYVVd0N1lzam1FK3RuVjR4cE9aQUFVQTRKeGZ4cnpzWWRqeUcv?=
 =?utf-8?B?YzZsS1hPTHhPSTlXMG5STVRIdzIxNUpRQ1hKeG5uK2w4N1M3Q2twdkhWZi9h?=
 =?utf-8?B?eFRuMktUWlJPNHJRenM1VEExdklmUDVGb1FQRGUvYVNLKzhDekpJQmV4bWpW?=
 =?utf-8?B?ZURDMDM4bFJ4dWIyV2dsYmdZeXUvNlR0Qk1OR2J2dzd0TExFRmU2ek0wbXNl?=
 =?utf-8?B?Y005bVpBRjFOdEFKanNlMVlIaVVSTHdhMjlvVHRtNWxMNU5ub3NWWjNoV3BI?=
 =?utf-8?B?d1dEejdYYlRBSlNtS0tDajRUTyswL0M2UVZWQ2hTSWV5Ty91T05Pd3g3RFE4?=
 =?utf-8?B?Q1orKy9ZMitteHBxdDVpelFBcnVPVE1WYkxGdlpQSE4zWFpBanloZHJhcGFy?=
 =?utf-8?B?LzUxTFZNbGh4TXlzQnR3MFVINm4zeTVZOGNpZXRRbXFzcXZPQ3VUdmVHVnBw?=
 =?utf-8?B?bWRqMnoyb3lWNDRsVU5LdUdITzZXVVMveFRuWE1hcXBid3llM0xyUXdwMlJq?=
 =?utf-8?B?b282RTdaRUU3QVlBNFBabGk5ZGg3c1ZMN0J3aDZWYjd6M1hQamRYUnR2NGFY?=
 =?utf-8?B?WlZjbVdKQ3NqckZ6Wlc1Z2tMQXp6WUpLYnVLMCtRcTc2a3pLYTgvNWpya0x2?=
 =?utf-8?B?UFZZR3hmZW5KaXpReHAwRGNvempOaWFyMXN2RnQzeFlNcEJnaUVPZ2hGS1Fs?=
 =?utf-8?B?RFkrYlBpN1lUNXRzeTJ2aStwckV6bXFkU1NwTUtmTzNWVnh1M3NLVzlEZWU1?=
 =?utf-8?B?MzRPdXhXNE5pc2E0NXdUcVVWUHhiVVFvYm11YmpXTkxRWldpN3QyekpyanFQ?=
 =?utf-8?B?R1VoSEFmSENvbGdIcEp4bGFlR25rRWY3YlVJRGdPUW5FZENMVy9hWFVjbUtU?=
 =?utf-8?B?R29DOHFORkd5RXc4Vzkwdk9IaTNwWXJDWlFabkVPZUY5QThHelR3eUhnQTFY?=
 =?utf-8?B?RkxzK1V5OS9KWkN4QTV2eEpJNmpjSG9DOFVramw1YS84QnBaeWMvTXVwNVRR?=
 =?utf-8?B?eXBCK2xHTTBmRVNXcGZDN1FPT3U3TzNFQmd4c3FQbWxPdlNkdk11Uk5ua0s2?=
 =?utf-8?B?U2ZuTUFrWGlEZjhUU011VUxxd2d2S3ZDbVQwc0x6czRVQTJKdHZ5dXVrWTh4?=
 =?utf-8?Q?/YYfXZKvumq82VR37PQATy7F6h6Fn2nuzSublXP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22edc2ff-994e-4c58-b6f1-08d90ec9bf97
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 06:56:31.6217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZuzkdXMXB669tNnGq8ED5wlz7ciLUOyjCvfV1v/31ORwKd3LoggjEDE4rlSEpadWJh+fp4c64BAnDCI2XYnShqM+dirdeZorQkAsR05G2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3622
Received-SPF: pass client-ip=40.107.20.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

03.05.2021 18:51, Alberto Garcia wrote:
> On Mon 03 May 2021 01:33:57 PM CEST, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>> @@ -2918,12 +2918,18 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
>>                                      child_role, perm, shared_perm, opaque,
>>                                      &child, tran, errp);
>>       if (ret < 0) {
>> -        bdrv_unref(child_bs);
>> -        return NULL;
>> +        goto out;
>>       }
>>   
>>       ret = bdrv_refresh_perms(child_bs, errp);
>> +    if (ret < 0) {
>> +        goto out;
>> +    }
>> +
>> +out:
> 
> I see why you're doing this last error check, but it looks a bit
> weird. My first reaction was to think that I was missing something.
> 
> I would remove it.
> 

Hmm. I don't know. And don't insist of course.


-- 
Best regards,
Vladimir

