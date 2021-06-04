Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4867639B4E3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 10:31:42 +0200 (CEST)
Received: from localhost ([::1]:57416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp5Ey-0005N2-PM
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 04:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lp5Do-0004SB-LZ; Fri, 04 Jun 2021 04:30:28 -0400
Received: from mail-am5eur02on0725.outbound.protection.outlook.com
 ([2a01:111:f400:fe07::725]:43150
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lp5Dj-00044B-TJ; Fri, 04 Jun 2021 04:30:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lezAzvsNbQ+2GtYQdYhSjNJlzQt3dQHVPkhXgxHseAR5fyR0UM/Ypm095sLK7IvRO8tplB/krMcneUZyx30wRmQF0xjNwqPVv5mylGnGkBYiONvoM/xe5L/8y09BrbZFQOgUHfgb2xpgn9XQzb/cZmOr2y2z/2b8Pv2C9Or9o2B70ElTPzYBLmPFtd5SrPYZ2+ZSZGHGk6D6x6dzewzfQ9YnsHCfcrQjpw1ChkbNPxQEo6MbszTgWp8Vn8+PzwvUDfsyEgJZx879p/LbCgI+QWzY3sSM/Ib4flJyFnOiUQnNJYJJJtNVeB2njWs0xju1ALGcKHs/wgGBKTHeIpGWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NG+RFu985Ou7HTE/p564iXbWWCMohjIxLBkKfoStjM=;
 b=kDlBSE2UAA0j7BjzA507yqwHxl2w6Pta0xcz2O34b9iwW52lMwJNNGrRAAKm4+ut+ZDIPF47Z27hctTXsuRt7iuQic2NM6dgmmANshhDZ6Pur2EM7FSe+PciqBgP2I8pm7kBachMWGQOBKSpFaFr9IxEThp2lZmxR+URrG/PnBBOgNSHmugGmM9RkstHk5OGwOOGJPNp7ECPMWN+w8YJqKlz7jTCGEiFogn+c4tMhEUUPVxiFhbddSY+ZswRsK4fqoRmHBFw1bkTU1t2MNGiy2IUaDzRdg0eGha33Nl4ghM/TKtq254bC1KyEhl+Cv96sbX2Rfuoc9QDcIFyBa98ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NG+RFu985Ou7HTE/p564iXbWWCMohjIxLBkKfoStjM=;
 b=BvNIolLBM7VftnGts52M+W+u/ykwdknfgMN2pLiJ354tBeiOQ2MevGMUWGGjn6zG5deL/C6+BAAFCa6oGAPm3xfS4UgzEqwzEDZghoBcQxllG4/dbgrbdM7JPL/koayvQ7i12OhJRYit3ojyKJfFDxAvQMI+SR2H1eG7dMSv5WM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7012.eurprd08.prod.outlook.com (2603:10a6:20b:34f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Fri, 4 Jun
 2021 08:25:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 08:25:18 +0000
Subject: Re: [PATCH] iotests/check: move general long options to double dash
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Cc: kwolf@redhat.com, mreitz@redhat.com, qemu-devel@nongnu.org,
 eesposit@redhat.com
References: <20210526181659.365531-1-vsementsov@virtuozzo.com>
 <3d086c41-80c0-a970-367d-00e19ce55817@redhat.com>
 <ebfba20f-badc-422b-f71d-28b9280f65cb@virtuozzo.com>
 <2ed9f244-722f-83ed-dd53-205e1833dc27@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <955ce8e3-eafe-79ab-ad4e-f81ecf08d20f@virtuozzo.com>
Date: Fri, 4 Jun 2021 11:25:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <2ed9f244-722f-83ed-dd53-205e1833dc27@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: AM0PR03CA0105.eurprd03.prod.outlook.com
 (2603:10a6:208:69::46) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 AM0PR03CA0105.eurprd03.prod.outlook.com (2603:10a6:208:69::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.20 via Frontend Transport; Fri, 4 Jun 2021 08:25:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: daec6b82-e0ec-4e8e-8850-08d9273249a8
X-MS-TrafficTypeDiagnostic: AS8PR08MB7012:
X-Microsoft-Antispam-PRVS: <AS8PR08MB70125FC109A539B20320AB44C13B9@AS8PR08MB7012.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7FiZ0ZUBJA7KrdCbsoXgy9haIiCJ3jrGTIQOT2BgRINiXBP3qMsd80KRpRYY1BceKZCHmSG0oduAKgANRpAINfDjDBk+MQ4UJd1C4vsyRL0jTU5f5z7v0NhQCvxEquX3iqnCLZhsBZLjFMcjuQY18tLMy/NsmQpl3kWglL57juaP/+v04lt9o0jr2Rfx+OhisrsadF0Qo9SKNP8Y1x0ZBkohLVSBu9Jt3r7D2Kyj665+SThA2d+sUIhsE460wBj4bp2pooArNFfqF9nNJ9jXcYT/QrmCDQcdP4o0cJkm03kvvw8xQZZSKg+jqWp8Zq3rdqexowGsufUpMzpfCAUKfhrrOKNK16HWGaG2B93EO/GnPL+eYQRz32oqEA3NEp7F+MSsuUXohEaDQZSugJlESBcw9C7o0Ucd+VeIbmpMVW+pxz5WMvzTv64nYaS9/uAwMt6/dr92cYVr4FLUweZoiuGs5QoCOQzPSgm5niJTuI8Frd1ZDLZA55r4/y1ey/87IZJieXWlvYEq0e1QX33ghhi7s4a/ePsMEJU+0QIirqsSL/LjBlLZ8As4SvkdF5EcqcJER+2aKLLelKapaLVCCLwKguxF3V9SBQYtpF7om8PWbGnteApCk4DKBj3QDBltnKAPY8fk+XNwJwhL0uD09ZBkxKk7ij7hdlIShIntnX6imYzYDUWSJRLmEqIo+2krxfPdq7P77r4ul6KKlkGO9+3zbmPBSx0hq8GORpME6mA3UfruRGl6sFULIAKKqexQop10zyNZZ6Spo8UIHOGrK9OJd/jlnkq3NiRCmRdnXIUyj+aYRNi0+j02q6Y/1qTl/CIWnEaZMD4abDVq1IpLAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(136003)(396003)(366004)(376002)(966005)(4326008)(8936002)(36756003)(26005)(53546011)(83380400001)(6486002)(52116002)(956004)(2616005)(66946007)(66476007)(66556008)(5660300002)(2906002)(8676002)(16576012)(478600001)(38350700002)(38100700002)(16526019)(316002)(186003)(31686004)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mi9WaFVuUlk4bDNIMjBCYk5zYlJ6dU90T0NtcEhSdUkwR080UFgzNVZzNjJo?=
 =?utf-8?B?T2Qwb0J1eTNHQXlhdmNhdnlneVF0U1o3bk9aOG44djhGTXExa0lPSm1lUTlI?=
 =?utf-8?B?bjUrL2V6aVEzTlVrMm1WWVdveUNsejRNK05RMkpWRVlxTWdvam1wSmF1NGov?=
 =?utf-8?B?L3M0NVI2TG1JRnk2QTUvRUhpdGsrbEUzbGI5aG1nV01CdkRjTmRHVFhyNjZT?=
 =?utf-8?B?SVpmbGthT3Q5NEVwUzFENC85TDZXZkM3RHhvcWs5elhlY2FGV2VWUzliM0sz?=
 =?utf-8?B?YytZanB5VnYxRHo4KzBzMWxUbDk1WURIaUZiMzgyVkhWZkRlMDRseEQ1Q1Rp?=
 =?utf-8?B?YlV6aXhNMDBhd1hrUHhMVVlFSDk1OG5UOUJHSjJxYVovS25sb2VJTU9wOVJK?=
 =?utf-8?B?cE9UZHg3Rk40bkFQYmVqMU5lOUtLaGp0ejN0d2R5Mm9CZVFWYm4rQkU1UEc0?=
 =?utf-8?B?aXF4Y3d4Q20wcUc2UjArM1MxcFY2WGx1cTNoUzFDNmRScG43TFlzUlF0dCtm?=
 =?utf-8?B?WU1Fb3R1MW5WUUdyK0FmMDdLbE9EalhJbzk3WE0yRWZnRkozci9lTUhhSzFq?=
 =?utf-8?B?Y3NzYWdWKytqME8zZVM5MXgxaXBQMjI0N3V1UWRJYVVqL3V4SkhVYUh0OTRI?=
 =?utf-8?B?ZnBOVlB3d3h6eHBqODVmMEVmME1ldGdaT1c3aUZEdUkyV1hoTUdyS1A0SzhT?=
 =?utf-8?B?eVcxZ2hqS21SNkNkTWFaelBESDRhM2dhS2tLbkRlMVFjN2JlYUtBSG5SdU51?=
 =?utf-8?B?b09GSG9aNEQ2MHpjT1JyU3EzTXlnNG1KdndLL2FON3hGbEVlRUZEcmlkZFlG?=
 =?utf-8?B?dGNMZzMwWS9IZ3hrdHFXczZsdGhYRm1yaStHMU9QOTZpeERqVmF6MGN2bmhW?=
 =?utf-8?B?R0FQM3JyWWdudXBsYm0rMkZkcGQxTk1EaWZkSmlkUFBFQm0zbWlpM2lDc0Jh?=
 =?utf-8?B?ZDRobExBV3g5ZGFsS0ZPTWRvdm1heWNWTzRFaGcwb3pIbnQyckdZaFI2ZFYz?=
 =?utf-8?B?dE83NG9TM0t0OEUwQittUTI3Z3EzM0lWa2dSV3NuMWl3UG1NelU4aVRLV2k5?=
 =?utf-8?B?aStWSnJWL2VId2Y5cS9HQXVNeWVEbDh6c2xDRHJmWUtkZkkvYzU1Mk5NL1Iy?=
 =?utf-8?B?SUt4eUF6SzEzaVhoaGd0dUxYNW1hRkNlaFMySFU2QmFzYkxwR3E0ZDJBSGlK?=
 =?utf-8?B?bjhPNG9MWkM5VFJ4QnFFUFdJUit6OEVVNkJkUGxFaklZYmI1MlRocGdua0xZ?=
 =?utf-8?B?OEIwc29kV2Uvc2ZuVi9wV2Z0K3E2Smt0Q3U0b0oxaW41djlUekNBS1FsQjR0?=
 =?utf-8?B?cENibCt5SmdvWTU5anB3ZHRZOUQ1aHdkcTVGTEZtSmZBV1NobXN0OWVWSUY3?=
 =?utf-8?B?Ty9ZN00vMlhYRU5yKzdoQTRtQk5CMkJzUTVidkk4aVEvZ2RCSVRLYVNVT0lT?=
 =?utf-8?B?b2haQlhyK3FIcUw3SXVOK05HbFRIbzNXOG9jRmdqeldORlpnb2l1enVSbUJm?=
 =?utf-8?B?T3hsbTgxL1lRZVNySllSZ3JYMEtTSzErRCtwVGZxbUJweWw0MmhLeE5qRmx1?=
 =?utf-8?B?N09OUG5aTGJWUjU1WHF5a1lJZTREaDBsNlQrM2JGb256RXIxdWlmc3E0Y3NK?=
 =?utf-8?B?cHVpc0kyUmNsMVArRVRjNExXNWplNDFTTmJtSjZVYXFvODZVOVBqV3VENmNr?=
 =?utf-8?B?V3V1T3l1L2dHZkgyeXVHRTF3YVJ3Y0UzTEx5UTdHanZ0T3dhdXFwQ055WXkw?=
 =?utf-8?Q?xNn4WRFwasvkJC1yAVdQBrwcFpk3ePcfU7WCU/5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daec6b82-e0ec-4e8e-8850-08d9273249a8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 08:25:18.8589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kUlmA4iP00ux2zHgquMjDsJlFgCIrfYZXl3FLSk6mQ9DRAZ5UIJLIlps9PbDKuP4NwnO3r+YVUa1yQ9s7n0IhPxk3cw03h68PmGxDNfenU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7012
Received-SPF: pass client-ip=2a01:111:f400:fe07::725;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.603, SPF_HELO_PASS=-0.001,
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

04.06.2021 10:19, Paolo Bonzini wrote:
> On 03/06/21 14:19, Vladimir Sementsov-Ogievskiy wrote:
>>>
>>> Double-dash options give extra information to the user that short (single-dash) options can be combined, while this is not the case for iotests/check.
>>
>> You can combine short options for check script, as argparse supports it.
>>
>> We don't have many short options yet.. But something like
>>
>> ./check -ng auto
>>
>> makes sense and works..
> 
> Oh, I missed that.  Then it's okay, thanks!
> 

Actually, I understand that my arguing against -gdb was time wasting nit-picking, sorry for that :\

When I've rewritten check into python, I decided that "I like double-dash options, they are modern and more usual and look nice", and used double dash for new options.. Nobody complained, so now we have inconsistent options, thanks to me :( Probably, I should have added new options with one dash. That's all not really significant, as check script is only a testing tool.. Still, inconsistency never helps.

Anyway now we have what we have.

So, there are some ways to improve the situation:

1. Take this patch and do nothing more.

Pros: as said in commit message, more consistency with qemu-io and qemu-nbd.
Cons: we still have -qcow2, -nbd, -raw, etc format and protocol options

2. Take this patch and also convert protocol and format options

Pros: everything is consistent and use two dashes, so we can safely use combining short options syntax
Cons: more pain for developers to write --qcow2 instead of -qcow2 every time. What actually stopped me of posting that patch (converting protocol and format options), I imagined the heavy extra load on all block-layer developers right pinky to push '-' one time more :))

3. Do nothing at all
Cons: all these inconsistent options

4. Convert new options to one dash
Pros: less pain of converting, as new options should be rarely used (unlike -qcow2 or -nbd),  and we have consistent set of options
Const: inconsistency with qemu-io and qemu-nbd
        ambiguity in using combined short options (note also, that starting from Python 3.8 combining short options can't be disabled)*
        

So, I'm OK with either way and can make patches. But I don't want to be the only person who makes a decision. So, let's wait for opinions, and if nobody really interested, go the default way [3].



* looking at https://docs.python.org/3/library/argparse.html I see:

Changed in version 3.5: allow_abbrev parameter was added.

Changed in version 3.8: In previous versions, allow_abbrev also disabled grouping of short flags such as -vv to mean -v -v.

-- 
Best regards,
Vladimir

