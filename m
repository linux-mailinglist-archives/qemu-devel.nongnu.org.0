Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5FB38E847
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:07:43 +0200 (CEST)
Received: from localhost ([::1]:33170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBF8-0004r6-1b
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBDv-0003kO-Ef; Mon, 24 May 2021 10:06:27 -0400
Received: from mail-eopbgr60115.outbound.protection.outlook.com
 ([40.107.6.115]:28823 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBDs-0005iG-8i; Mon, 24 May 2021 10:06:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPEKwNcCubOX0QeD9V9Ov1ynRoNKOnvtI4SdOOm+INz/SSWXipxBNWq697hJjogjfLVhiv4cwYxLPXTVuWXVBNEwgvgFPmjKoD9Fje2nrzlkmCNeP7vz5SomEnQttFQnp4LSW/08z4Clp3dqNffiBVBK5KpQMot+SSnrCjk7C7+/ei583d6NfgmCSWCDqiRyDuXG3Hf6cLZMlx6Lm30sTTHhoz8ehCcEeMXNEbLFEHI96QeVDJxo1M+j3x97xsWnbOOFphib2H0NJ5VVQovmoj1ufZb3e2WoJoWRC2Hrk0JDcna3whbCSOAToOS2/C+PRYBJ4hqiT3+qetgArIBcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4je7QwqxM/NYRVpn1Glnppv54hzKylMT2o94y5anpo=;
 b=ETzb3Ek55YZw1Qp5MMr8KhIJaFq+5gLtxYckabFHuQHn8L9HX49tVnNpLg8PIEJs+8wzQdL69H3oZtostdB+UZHS1ik42iK2ABByjT2NiwTHsaVQQn31XP+i9pNOOQzyq3KhMuI1IX1pTp1B9IbFh0LLwA3YJJSKm9WYMdQdcFlNsHy2f5dPyR8Fp/zXxYbWRnl7/p4FOryyPKPvqLqEscLtMzRkYdkEkr9cacCKarh1EnDyygxS56p5nhFFXfkCoojBZP1/ucOhkHOuKsHO9btTshNxfxtA2PRysj0f6YasZksy85UQc/Bmr7bIUUANdBwTDfzYeRkXWLZL9d9ufA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4je7QwqxM/NYRVpn1Glnppv54hzKylMT2o94y5anpo=;
 b=E2Tc4GztPMJedzXAWrEvpTVUevqR+crEx5UKsvGIfiX4QdwpYH3zfdOzVUbg/ywTSxLP5RDBuXBSNszFJAn/cL8fYcLO4ioFGOwQ5Ll3xAyWXifcpSMHQgJDpmCSupdL9qTDFUuqGTXY/C0ae5BfD9G/EQSdbxvI+nt5HZp/uEA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Mon, 24 May
 2021 14:06:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 14:06:21 +0000
Subject: Re: [PATCH v2 3/3] qapi: deprecate drive-backup
To: John Snow <jsnow@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, libvir-list@redhat.com,
 eblake@redhat.com, xiechanglong.d@gmail.com, wencongyang2@huawei.com,
 nshirokovskiy@virtuozzo.com, pkrempa@redhat.com, den@openvz.org,
 yur@virtuozzo.com, dim@virtuozzo.com, berrange@redhat.com
References: <20210505135803.67896-1-vsementsov@virtuozzo.com>
 <20210505135803.67896-4-vsementsov@virtuozzo.com>
 <YJO9owtr4N+1Ta7k@paraplu.home>
 <d3207955-794e-2859-14c2-80fa6767a13d@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5cbaa5bb-65cf-82cd-7f8e-8227a5f50b6d@virtuozzo.com>
Date: Mon, 24 May 2021 17:06:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <d3207955-794e-2859-14c2-80fa6767a13d@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: PR3P195CA0017.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 PR3P195CA0017.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 14:06:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a187e11f-4631-43f9-026a-08d91ebd1ba9
X-MS-TrafficTypeDiagnostic: AS8PR08MB6870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6870468078AB6CE82C6D7C6AC1269@AS8PR08MB6870.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LLJh4eKStPwOo910lwp1bBJpLlpSCcHZZuPyA0PytxTQNTf0u28aNN4pWuw8C0NbVPKf5ml1xo+Fk6OYM43OPfrq+3HCYbvRumK5+4PWdRvAhr1iobOmPKTql5LI1zJf/P2bnszlJewzg7IPfnXNNKjRNZRP7ryGqm2XayOWS0A25n8EBNnPjls7HkxzOnPucVWIxH5b3XvJlUXJBtL+CKh1mVHXjoQaY/K7M8ZCQPsFENZRZQORoL7k/INkg0cURU2McQZE+La7gSPGOlM3U3doOKtihfPqomqe5uX9y+3mX1ESuHQbe6wVidqkSwX9BiMiDLxyC3p3P1VRhllpo7CIb54EhvLc9Kk+cUhsS+rDeiNebB9MpBoZ9dXB6YIGfbtbvRbtdz+X/oIFkSxIoxizXzY+eU0qi7RC2KuFm2H/k8D0Y/yeX/pQe+EtPxM4bvd1iup3ZcKV0cIMjr8iMOo8MNI+jiN7ZwJ91ftUBVtrAEwwr5OZnex7M+2kHeAD4I1bQZSU1iQTNW368ubu569cSlC9UWiHU32zv0jFwJ6/m73uuOdLwGisRBB2WJlGs4qcpSMCNoLve3kzeN1Dl3qTrEzW393GPR0NVY8jQO8/V6OAl79SlynyR4dr0qBcrmY8QH6WCZD4SAUHj+HyYqrsFRVfrnTn2lhmuu0/4Jd5CL8+Y4QjuR/74y5TEgp6vCJTSZp5kQGsjW/9A6du9nO0QbGy+ugN1x8d/LCnb98/8f1vICKb2P5nQEZpgM/3oHJJMW3rsUvFwZUAayFo9CJc4qMeLDox1iiNvCr8dtbjjYvne6ZcX1ScgF8sqnbV6zzFgoTrPid7VYf2CE2/XQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(136003)(346002)(396003)(376002)(186003)(16526019)(2616005)(36756003)(4744005)(16576012)(66476007)(8936002)(26005)(7416002)(956004)(5660300002)(53546011)(110136005)(66556008)(2906002)(6666004)(966005)(31686004)(31696002)(38100700002)(38350700002)(52116002)(478600001)(316002)(8676002)(86362001)(6486002)(66946007)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cnVqTlJOV3I5TGxzK0FRcnBuYmZOa096NWtCK2hkRXVFSlI1QnhwY1k2d0sw?=
 =?utf-8?B?Mm1aeXNOb1Z2TEM2WmZqcDRWOVZweUpBei90YXVERFlpR3FRa2dGNWQvZVFn?=
 =?utf-8?B?NWRWcGlKM055TGRiZUlkbklaejBOb0tpdnM5UUZQZXJUNlQ3NVhLZlRkSTFK?=
 =?utf-8?B?TmpzelFSbDZvN3JvMm9qZ2NSUVVKNWtXRHk0UUZqMWgxOW96SGdoZ2xhZ2lF?=
 =?utf-8?B?eUhMK0dlWG5rT1hmb2l3UmdBVDFxZ2YvVHlXM3Y3WW5VdWVIK0FZY04xOEVy?=
 =?utf-8?B?YXhqV3I3WWR6cDRGWEdVZFpYcHFBSFAwSE9hRWM1Z0pJRjM3aHd5QWdDMnd3?=
 =?utf-8?B?emU2MmpkVE05VHQxY2Y0QzhBRDdRaHBJT2U0ZG1jMlhvNkJ0L243MnFsQkdI?=
 =?utf-8?B?b2xFQXdsOVpRYUl0VGZqTTl0c3hvenVKR1dUZDNEM2dZbXdxaXlPYko5NUQx?=
 =?utf-8?B?eC9YK3dyUXJtM0x5U1NMb3J6eVpOd3ppT3ByRyt2dnBUNklLei9ZekxvdlRC?=
 =?utf-8?B?b2pET1NhNGtISXdMZWY1Ym9PeCtweC8zbzV6NnhncUh5NjB6MzZhN09rd3Q2?=
 =?utf-8?B?UVZ4dkMxRDh0SDlSa3hIMGM5MUlaUkRlQzh4TjRNdFRVczI1dHViYm5oOE40?=
 =?utf-8?B?RjlQN0QwVWVyY3VVRzRqU0d6WU51eXFtbjU2a1NZaEhFaWVod3pKeVJaaWNY?=
 =?utf-8?B?VDVsb2ZKSElHU0ZiRm5sLzZGUUIyejZSQ0NVRWl5SHpIdTJBWnNWaHFycGJR?=
 =?utf-8?B?NlpPb09ZbGl4VHM4a2F1YzQ4REs0Vml4d0p2dVErNmE3YS83UVNHRUlQSTNx?=
 =?utf-8?B?VWlpQzMyT2JERFdGVldsUWhlREJIZ3lFT1h3WWxWYXRaOTY5ZEpVSUxJT0hi?=
 =?utf-8?B?RzJyMDYwNDZMbVJUUXVQWUFIYjJlM0NGcGsyRXQ2Qzc4eTV5Q1NuZ202NGdi?=
 =?utf-8?B?ZGdXTGczd0VvZ3ZDdTF4cjhRMlN2ZGNwT0Y4Z3VzUFprVDNXaHM0ZmRRZXdG?=
 =?utf-8?B?eGxhMUlTY2QxQnVsNk5hQlVZQTB0WnNiSzYzYjVjN0IxRXlkR0VRSmhLWXpu?=
 =?utf-8?B?bWRoMGpicThRZll4MHNYZXBHZlJQSFdXNytVRFlWQ2Z5VUhybmRudDY1dkpp?=
 =?utf-8?B?MEkxSko3Y3VBa0ZvVWo0Y1c5ZDAyYlR6dEJzdkR2a3pCMUc2bzZWMy8vV0NJ?=
 =?utf-8?B?MWt2R29MYmxVTklwQmNHVm5tSy84cG1mVFhoSHZxRFZtUjJpNXlpQ2lkZjRP?=
 =?utf-8?B?QW1BOTliYjRsVU84ZlE2S0JUbGdOME9TT29zaUdIYm9xMi81YUhmZ1hnS0p5?=
 =?utf-8?B?eE5Pc3JSTlFJSTUvcjRKcDZaelYycnJsWFd0Q2t6WFRBUEl3Uk1uQXlMNVU2?=
 =?utf-8?B?enZRT1ZBdSt4REFSYXRudWRZaGxkRmVVL2FQcno3SlhrVnFwdTlOWWwrRWZO?=
 =?utf-8?B?SmNFRG9vUi92UFlQZnpMRFpwQkhqT3Fld3ZaYy82WW9nQ3FxM0Y4aHNwdWl5?=
 =?utf-8?B?bVkxR1NxbllWZUZlY3NwWUQyVVk1Nk5EWGNHcjlXTWZ1enNUZ0pQQitHVStv?=
 =?utf-8?B?M2JyYUVqejFpeGM1VUlNM29BcUlaTFJkZm9LdmRUOTFhRC9DVmxRVHdjRmNN?=
 =?utf-8?B?aG1MVldwQkJmVk5oTXFOVVp5NEUxaDFtY3pPbk5rRDFwOHh2R2ZVNnJtRjlY?=
 =?utf-8?B?UkhDNlhBRWJRc2x1elplN3ZMM3dhbVRzUmx4QVd2YUtlNFkzeUFNRFpXVlFD?=
 =?utf-8?Q?yrRypo8N6FLHSYk9UELyAAVmZvpwlicUh6wiZz/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a187e11f-4631-43f9-026a-08d91ebd1ba9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 14:06:21.3479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YN/xWsEYQd2EUBd9Sgy/FQi7WdnL1SZs2/DPh1rqi1wswmuolg4MOmBxRNXflmr8kyNrwmPuaBlNU8dKB6wflun10oXutPDdkRsq+tqKN9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6870
Received-SPF: pass client-ip=40.107.6.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

15.05.2021 01:38, John Snow wrote:
> On 5/6/21 5:57 AM, Kashyap Chamarthy wrote:
>> TODO: We also need to deprecate drive-backup transaction action..
>> But union members in QAPI doesn't support 'deprecated' feature. I tried
>> to dig a bit, but failed :/ Markus, could you please help with it? At
>> least by advice?
> 
> Oho, I see.
> 
> OK, I'm not Markus, but I've been getting into lots of trouble in the QAPI generator lately, so let me see if I can help get you started...
> 
> https://gitlab.com/jsnow/qemu/-/commits/hack-deprecate-union-branches/
> 
> Here's a quick hack that might expose that feature. I suppose we can discuss this with Markus and turn these into real patches if that's the direction we wanna head.
> 

Hi! Markus is silent.. Maybe, you'll send patches ? )


-- 
Best regards,
Vladimir

