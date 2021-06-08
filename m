Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA74C39F5A4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:53:32 +0200 (CEST)
Received: from localhost ([::1]:60206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaIV-0005Ah-Qh
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqaCB-0000oI-HJ; Tue, 08 Jun 2021 07:46:59 -0400
Received: from mail-eopbgr50116.outbound.protection.outlook.com
 ([40.107.5.116]:49575 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqaC8-0004yA-Cx; Tue, 08 Jun 2021 07:46:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMeQUf49GK3CjSWtSPZ61QGfKqZEUk8kyj2lmAiuUCnunE+ucW5WP75nlW206DqNc4C6YTxgSNmG+3Q4T9kku5d+7tlL9lhvbmwK9bXrxpPsySRVPe4iN9rqvgLhlqgGqlqZLtWvG1dcD59EEYJIv1Cw/HnzKS40Li/oIcdQnvvzZ7Z6gILItPD73Lxw1H+AroLFwhzHXvUI4M13ZCGTuudEKVVLpS45TY4lir/8zLj5h8Ktem6sXOWe7mDZUEuw9lYa7s4sy5RuxeJRNv5VyMPsyjyS5x2zL1i4Ay/WjaNDxHBpcRc+afcP5qOpBjaTWMxCV72plRdRC4n+LFnk3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7+cl6/0o4IgUVIfFbq2ZQch/0nRbt4oCtlm6KDRg2c=;
 b=fNgA+YrPViOuBcs/wAQK71TuJ3/DNTXytyWx7xEx+6+srAvSv80nWFeS83dozg0reGtfgWbBAzlDb48tF9iZsNPtO+y0CDrItgPuKRWzp5ZEbabaqpDP1GV3dZBtBvk8FNjpYBOVuzx0Z4N4N4NgPEq8m7EPCKX1UP7KhDl2xLTNdCx5ehoQiLRxfW9QGU0AtM3qxjpC+Yonmov0+hGQNp7nTtTVMraa2zLwLOwyKhRIgP8u8ttiYuFDkw9NW06miR9LdXmT8bc+CsOwN/hNuftei2NiLd+P1+sfIzbFNWso1mUqvzB4cJThoixUDaxiQsJJnUZ9ibyEDVZhw3p1hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7+cl6/0o4IgUVIfFbq2ZQch/0nRbt4oCtlm6KDRg2c=;
 b=qkW4xKo1e/OVFcjpsp2Nvz/3JsQ5wqpBmoCqKz5KvdpwdiGykapUa4wDhOBh8t+mQ7lsnd9kthyE2PPLh/k4Mu7iMokim2IhV/lc86bgKmsmmVDqPNPVeoY/GuRa5LYFnZ81SsJXLE6wrFwKR6A6FuQceb3NUPpoLxIlWhAOVGU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4788.eurprd08.prod.outlook.com (2603:10a6:20b:c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27; Tue, 8 Jun
 2021 11:46:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 11:46:52 +0000
Subject: Re: [PATCH v2 3/3] qapi: deprecate drive-backup
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, libvir-list@redhat.com,
 jsnow@redhat.com, eblake@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, nshirokovskiy@virtuozzo.com, pkrempa@redhat.com,
 den@openvz.org, yur@virtuozzo.com, dim@virtuozzo.com, berrange@redhat.com,
 kchamart@redhat.com
References: <20210505135803.67896-1-vsementsov@virtuozzo.com>
 <20210505135803.67896-4-vsementsov@virtuozzo.com>
 <87eedc1ugb.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3c1c05c3-87ec-c665-00ae-0c0ca312e5bc@virtuozzo.com>
Date: Tue, 8 Jun 2021 14:46:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <87eedc1ugb.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR3P192CA0018.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR3P192CA0018.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Tue, 8 Jun 2021 11:46:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48a56cf6-ab30-42bb-df93-08d92a731b9e
X-MS-TrafficTypeDiagnostic: AM6PR08MB4788:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB478805948E7A419602923F84C1379@AM6PR08MB4788.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K5riAjWvxkAmGKQrpCrkFhzHkVJh33xdnEPmxHOpi4JudhtCmDzNdLZndKEBD8fwfHUIxljO0SYGBAVOoSTkLO+MnMe/3A9sdde1im7L5hswgv0KixB9e6REOYTLCP4D8b4EA6zwwuYZv2Bj85RiGXe0UtBhVRDLMPJgEgMzuqLNRGEz4GsOn+SxB4mx0Uq/pOMheaed6mh3WqBrFQxZvDh4NJtCGItypUDpKTXw+EVMwQ2gBCbdIlfjpxBHun5/lFXo2NW05+PHZLzaot7wsIqqOXcc4JOJkvA7zMfohPX1vtkMuDBe5fnVG8sje9t1N8H1G1XpOEdvYCI4SI01rEf/lMQ16LVm9YZUOo0FOmwQbsjQkymVDJqbnICGJKhYy64Og4wp5DgdQkmiJVg1qHnBgnMZvbfYlT5GGQRl+hccN2HQNEw8yHDnnlBlHCMKkdE2dusENX0MpjJF1hZqbY528DmEuBSu1qXk7VDKc5Y+pzQDaFQEPOoU5jf9KjkCs+3PkGJ2DuhSdDGemy7lS3EW3j5+EyYtNGvYtNaOSVW7fAwPyRhnCIoEka2irwp1g1zu2hPerJ5/YLmBpM5SyFDAG1PfFbBWUet3aJp5AkbZuDBBSK1ej3cOjQKGZjKtNiKhSYV+vmW74bN7JYY54wz+8Jdl68kgcKN8RaJtNOrLtPfBY/4DAIzkogDpHg8GJ4PDR30dHrdAIPEDmFNw8uY0NlFVAaje/jbUMhEN9r10FAruWDLQgjFIzuk0j4X06GsD4lUrE0x9UyrPnIp/zvcxVYLpz/fAu1kLZX8gMNmoM9Mu8B+a3EGyuUjsvOX/wcZS1G87ZdlYsESfZ/ty5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(86362001)(956004)(2616005)(966005)(4326008)(186003)(8936002)(26005)(66476007)(38100700002)(38350700002)(31696002)(66556008)(66946007)(7416002)(498600001)(52116002)(31686004)(83380400001)(6486002)(2906002)(36756003)(16526019)(5660300002)(8676002)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dytkM1JXMUdFQ2xrOGswUjRidjVwVUwyYi8rTENPMXBaSmFlbDcvclpRU3NN?=
 =?utf-8?B?VzFNRWxRUURhMDZhT1JoYzdpTTNYemljVkwxSnRTbWlOVVBITWtKd0NvZkFx?=
 =?utf-8?B?RDJjaG5pMmxlanFWM3J4eEFqelNXQmYwV0FmZFBiSTZNY2piTmZ6VHVFVjJP?=
 =?utf-8?B?RlpEVWd0M1A0K2hUWVljeGVGd2Rpa1pDR25Bc3FhdDNGb2poVzd5M2tpRXk1?=
 =?utf-8?B?RlpLNVlsdDZPamZqV2JQeU5JWVBiNm1RRnlQYkNEdytEYUtZMVNSRElXR3hq?=
 =?utf-8?B?TlQzTHVyUEFnMzFaRjBoaWR6bXZlRE03Qk1ibUlJc25XSWc2bGVodGwyU0xm?=
 =?utf-8?B?cTNKMGV3V1hpR1B0UzIrM3RZTUI1Z0doRWtabFdTQmhTWE50M0hRTGxqck5Z?=
 =?utf-8?B?UEYyN2l4U3pOajVMcnJrTlRad3NFc0d2SEpDLzhpSzdhRUFiRjFwMFMrUkxF?=
 =?utf-8?B?K2pJZXBTSnFIK3hMWE43MWpQeUQxQVlrRzFGSDJxZFBBY1ZKTmhmeG5RYy9s?=
 =?utf-8?B?a2h4RnFyRitPMjVZd1RRTUxQWVJMSngyZmVPQVpySVBUVHVTL3VPOHZPNVhV?=
 =?utf-8?B?VUptQ3lsaVFxZGFnQnlNdTNON0MvM0tjQ1IrM01WUXBNVE1oWTlKU2M3QWdt?=
 =?utf-8?B?QU05R0F2dFJHSFlBRVJPc1FHaHMzbHpndUtNUU1MUWdYS0h1dXMvRlVlRGEv?=
 =?utf-8?B?V3F5WGJNcGhVRlVjWSt1TGxMaU1nZzlveWhvdmJhTnBKdlhZdW91ZHV1WlNm?=
 =?utf-8?B?TmgrUncxM05FZlhoWE05b21nVXczUFJGZ0FTVXFxQTllQXRZUlp6SnRVWDN1?=
 =?utf-8?B?eFlPWHVWWEhkTG1hR3AwQXdvdTVCcTN1MnY0K1VLcG5qT1hWdzlWRHBDVjZN?=
 =?utf-8?B?aTFUbFRsVi9vYXpCUkljaTMyYURaaUdBOURHQ0ZNUjJrMFJZajhma3dBUEEz?=
 =?utf-8?B?STJCSTFZVWJNNVBsRksxdEdvNloreHRtcXhGVzVSQ3lkczZiZnB2SFd6ZFd3?=
 =?utf-8?B?RjU2WDc4L01CTndPa1J0R3o0Sm5jNWhGRk42Ykh5aUFEVmVNN0RqVEh5c0p3?=
 =?utf-8?B?MllRN3ZsdEZtMUpOT3N6c0tGNzJwSnNHbTJCSXhwOThDTUd4TnlNVlkweXdl?=
 =?utf-8?B?WlAxRGZnNFZES3FTTDZHbnMxcDdsbG5oMlFKTStpb2ZsM0hrbFgrdlo3cWRG?=
 =?utf-8?B?bHRhV2ZqdkZoaHdZTTYyNGJpbERzUVZWT0ZiZkNSK1dxblFIMktmV3FlbzNF?=
 =?utf-8?B?Q1MrSGNmams0NXJhN25LeHk5UjBkRXBlREZHdVFOV1NtNUFWOUF0d1kzTEV2?=
 =?utf-8?B?bG9wcGRGcGtJWE9lT0hFUkJ0UG55Q0pVVWVRTEx2bGsrRHh5amJvaURQQWw1?=
 =?utf-8?B?WXZLYWp2eHl5QlpIQk53cHB3c1IyOGNUeDQweWMwVzh1cWcrblFJZ0N2d3Zl?=
 =?utf-8?B?YTR1NUIwdUlNdXFNMCttT2VmdnFLVGwyMFhNVzlnWUJqeVVMWTduUjhTVmJu?=
 =?utf-8?B?NHU5OUVyeUcrT0RSaVpyMWxGU1F6a0tGaDhKREVwWDFtNVMzak1QNkg3SWtS?=
 =?utf-8?B?empnU2RzZFc2M0JTU3Q3R0dEUFc5KzBLVGVtbFdPS2trY1FSVjZZVkU0V2NK?=
 =?utf-8?B?cHBQMEdKRVkvUjE5QWFLQzRHTmplZis4VG1PNU1hUXJJSWlYYkxEZ2NPRVE3?=
 =?utf-8?B?d0xwZjdqaXliZXlzcExPZlFyM0JLL2JGNUlHNUUxQUtnNWtoTHdiWlg5a1g1?=
 =?utf-8?Q?HRXyr5tSqH6kIwinzWdlPC2elQURVrOSJcPOs3a?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a56cf6-ab30-42bb-df93-08d92a731b9e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 11:46:52.4729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLqWrkrj3sxJKwbQZesWfkw2TLyM9596pJLexaihmujiXyIuPrYN1ZFMhK2Oter9rjjCO0c207A9QKccCvL8993kq33M+o6FxASuXvcEzgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4788
Received-SPF: pass client-ip=40.107.5.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

08.06.2021 14:12, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
> [...]
> 
>> TODO: We also need to deprecate drive-backup transaction action..
>> But union members in QAPI doesn't support 'deprecated' feature. I tried
>> to dig a bit, but failed :/ Markus, could you please help with it? At
>> least by advice?
> 
> There are two closely related things in play here: the union branch and
> the corresponding enum value.
> 
> So far, the QAPI schema language doesn't support tacking feature flags
> to either.
> 
> If an enum value is deprecated, any union branches corresponding to it
> must also be deprecated (because their use requires using the deprecated
> enum value).
> 
> The converse is not true, but I can't see a use for deprecating a union
> branch without also deprecating the enum member.
> 
> I think we can implement feature flags just for enum members, then
> document that 'deprecated' enum value implies corresponding union
> branches are also deprecated.
> 
> I have unfinished patches implementing feature flags for enum members.
> 
> Since TransactionAction is a simple union, the corresponding enum is
> implicit.  We can make it explicit by converting to a flat union.
> Simple unions need to die anyway.


Does BlockStatsSpecific from qapi/block-core.json a correct example of flat union you mean? I can make patch to convert TransactionAction to be similar if that helps (discriminator field should be called "type", yes?).


> 
> Does this make sense?
> 

Yes if it helps)

Did you also look at John's https://gitlab.com/jsnow/qemu/-/commits/hack-deprecate-union-branches/ ?

I hope you and John will send patches that you have, I'll help with reviewing (keep me in CC), and finally we'll get the feature.

-- 
Best regards,
Vladimir

