Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F89346784
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:25:21 +0100 (CET)
Received: from localhost ([::1]:46186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOliS-0005PO-8j
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOkZ6-0006JQ-GH; Tue, 23 Mar 2021 13:11:36 -0400
Received: from mail-eopbgr80091.outbound.protection.outlook.com
 ([40.107.8.91]:61829 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOkYs-0003q3-BE; Tue, 23 Mar 2021 13:11:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+yzAcM8WLmkBkpusLz1sB0ng/XqWQGMlaeivdDd4//VX0pBz5LYPMKghuk4eXZz9QSSmDTBTTuBP0680hWpfjnLrte8lvz6NUpjh+QGnmX5UAMnTkADtAW6kuUqWCZX9kQphBmFHs0x+bKmRQinpV0jIVs8Mil3rm+7XOHsYAiH7rjVoyN63RgtvRekh56IJYNVWA4Y/fbGV1BYIRsb/4y5gN2vGMI0wMUhcJ7FNjaLm0V/dhhV3Wq836jUBgNWVuhqeGk9C05xFz5TpEpb1IlMHeLvEGkzgDuii8eDl+3asu31zj24+dk2WNQhsQYviyjCAiaVdSFdIRlderNv2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnhR6G1jqZazErFDdxcpBeku73t7lEka1Kv31ZwBRm0=;
 b=PrxZ0nlL4ktZv0uL4ROSoWFvKswjcehBD0aTt3uHxh/veqzcq7stko40SspiJkSmLMkOcnS2uWrIM6Q8zKAgAECdN+wmPQO9lTUnnD5kaDRTgMoyPlR3IRfhPKcbOn3eK2vbPG/o+OMReJ10akXQeU4FNd8++7VoSxpeZ7j3ExhoztX19dLlWx6RHdmvcg7vHWjgiVsDZr1Bf/qbq10BY+foMqodAfC9Utv7q5s8+I2Jz3bmtqK76Jwqq30ihG34n7PzpFgv6P/NGL5X1xYUEbabu4IfJFM2yu1wz5UYbCKyhxMiPZGFi+hAjCe93GPiWgARtkD75AfF4uGXxm5dbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnhR6G1jqZazErFDdxcpBeku73t7lEka1Kv31ZwBRm0=;
 b=Kg35d2T0IKra9OWEJElAukdryS8/5HG3reeT6qyd6OnDjXkUl402khSb6RdOAmHoUid7XsTacsD4n+RWWHgrsifuPjeXjIJ30TOfkOn0Sj8YVerkql9FrlzVZVCUellsfbqB6854Rhvdfb8PXVeK0QepON3o6G5FqfRtxvjROzM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1715.eurprd08.prod.outlook.com (2603:10a6:203:3c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 17:11:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 17:11:18 +0000
Subject: Re: [PATCH 3/4] qemu-iotests: let "check" spawn an arbitrary test
 command
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, qemu-block@nongnu.org, kwolf@redhat.com,
 mreitz@redhat.com
References: <20210323130614.146399-1-pbonzini@redhat.com>
 <20210323130614.146399-4-pbonzini@redhat.com>
 <ac3b47aa-344a-a6aa-a1d8-2c2dba2d540c@virtuozzo.com>
 <14ed8b41-f8bc-b350-c859-2ac51a54663a@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b89670c6-153d-8434-da06-b212b887bc88@virtuozzo.com>
Date: Tue, 23 Mar 2021 20:11:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <14ed8b41-f8bc-b350-c859-2ac51a54663a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0105.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 ZR0P278CA0105.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Tue, 23 Mar 2021 17:11:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 098a6ccd-03c4-41c0-53a2-08d8ee1eac8b
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1715:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1715E8D2C2B44876EE9089ABC1649@AM5PR0801MB1715.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D+xQFejbi3yqooG3YUCqO5t2uZpjAVS6UOgU0YVrvYVEHKl2O1yCXt/UbCvCLltcLIRVeFdjYDuG7LEesXdSKtxuwUI2LyIQASNC8wScp9hQ7s+lBX9jYQ/MJLDmBR9v+DNXrz58MvmemTPrSWIiJhvV7DdqXYCUzajdlQj42AvdWOkT24B7T3Oyk1/YIrmY715xFLjBXOY159bEgU47fzSOYcU3CAs+R6tZ6I5883lAj4ejMK0m5fgkdkbA6mrPJm8iz4qttfI7zP2Vx0YkJ+8IhG4Ab88q6YzzOVjgwRfKDB5bloguEEcbGuRjpnhiJFerCD/1/cps9EdBTCEEZQANdpbwn+HsiP/3jQmEsMFpFkj+BQ8FCm2SZNBNu7rahYoZczO7J06EldbH1vzlap3ZUwXttDU3De+Rg35RgP0KLqIkuXNqfEy69ZmzzQ4hLUbbOK3OqRYCOxelDOuZn/87AYXVEtgSgp+c9jfHZIYz4AzcPHTM/tIQ1NfSOcc/czWueToSur9KnZC4OSAZ5586mrCYWF2v/z2n1lxahx9X988/5RShXQgyWS57pODd0skv4F5JOKt8EnVm8IPT2JYJ/8ZPpQc+wO9/nHZqlPizuCxgRKuLaV9Loo8OSGKWyt3+/FIi20t4l1kLZ9xrA8nJoFBvvPs/ZKcUsTpnJP//BZ2/j1gR1XCQjLG5VhEbCsHGYTW/d/sv/I+rMdH71bbvhyppt8DyFfhY6X/GrcwfNah+NRyTsePpa9bANPOKGHckYmEs0bZvVp86mEmAxGlq66FQyoNVNPTZSkkCvs2lg+kCZD396g4tCBTK40kT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(346002)(39840400004)(366004)(66476007)(66946007)(83380400001)(38100700001)(478600001)(66556008)(2906002)(5660300002)(86362001)(31686004)(36756003)(8936002)(53546011)(16526019)(4326008)(966005)(956004)(52116002)(16576012)(316002)(31696002)(186003)(2616005)(8676002)(26005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RnU4MkptRUNjVEw1OGNlc20rQVc4VnQwcHdHeTAxRDlWaGFrU2RDVEg1Y0d5?=
 =?utf-8?B?bU8yZ3VnVTZlajRmT09BMyt2dUNNWjJaNVQ0SVRtT2R0Yll3TlJFS3p0VGdl?=
 =?utf-8?B?Y0NXa0UrMERzWmI4bnN1UUVWUkQwU051NUlNR1BYUXBmdjV5K3o5VWwwVzVH?=
 =?utf-8?B?MmYreStvYjFKYWMzb2N4clBNMU14eGNSQ1VJcEhGa0xoK251TnpwemtCcUJa?=
 =?utf-8?B?ckNIZDlDT1BseEZFUTdqc2FhdnlNeURkbTIza2lYKzBudzZOVURac2s4LzVZ?=
 =?utf-8?B?czQ1MmlTbjZJZmNOWXU2cGEzWDRwRkZleEE2YmhWQ3FYMzUvck5ueGM0VzBp?=
 =?utf-8?B?UC9PQXdRdGxyOVNjTlgrZTZSb1BpeHhBZWdLbDVDL0licGFaYlFFQ2dhQ1hk?=
 =?utf-8?B?VnowbmJJWDVhc2xqRDF1a1RtSFdOTUdCTW9yaGNlMWdyZGEvU2llcVBEN0Vj?=
 =?utf-8?B?WG42ekR1c3EwR3FjZDJkOGNKU1NQL1dhakpmWkJXLy91NU44aC9MNllQV2JH?=
 =?utf-8?B?V0ZDOUxidERSYTRUNFdaTjhVamlPUHFIZ1EvZDFSTmdlNURvenVaczRramR3?=
 =?utf-8?B?UW9jdEhlVzdhUjI1eVh2Q1gyMFpRZjdhb2FTd0dzRFFmMjFGRGVHdVNzTWpG?=
 =?utf-8?B?N2tvYWFSekxBYWhnTnlVdk9pRzVvN09ibExyRnB0dVUvekI0RGcyV0JSR3Jn?=
 =?utf-8?B?Skl5RjI3RDdrL2lubXRkWW83S0JWUGNhb2VQVDZSSExYWkZCbnF1ajhRZENI?=
 =?utf-8?B?elhWd1o0UVBSTndneGFpNE5OTUxJb1BtY1RPMjRMaFJYVWhJeGI3c25id09I?=
 =?utf-8?B?K3VTaW5Na2RjMHpza2xmeVl6cmVZNmFhenhETFF5Q0Z3M1g5V251SUtibHRj?=
 =?utf-8?B?eWNabXA5aHlXVnVjbjNjVlBLOU85dUpPVHp4Tk16L2pDYWRSd1JXSU1zNjF0?=
 =?utf-8?B?cm52eXRvTjFhWnlieVRIcUxIYk1BaE1lTWRkM2RPeXNlb3MrOWw0Uk9DUXNL?=
 =?utf-8?B?ck1ObWJpeGtQOXFPU0RCcmxzTnZtR1RscFBCRTR3T3Ivb01PMFB2cWJIOG00?=
 =?utf-8?B?UE45QzFoS0VnNG1RNWtSczRzZmd0eUJpSU9hTGZPYkpGU0F1Zmx3ZDdGeUNp?=
 =?utf-8?B?SGl4aTQ3YlliRW5tSEJaa0VyRVN1K0pnSmFkRVluSkwyVE1XNUswMEM3Sjdq?=
 =?utf-8?B?RzZXQnJydUx2OFR4SEF6ckxUaHN3L3ZyVnhyNVI5Uzc5bWp5bVJwMFZsZlJ1?=
 =?utf-8?B?UTI1Y1U4N2x3Njl3TG1RbW1EQWd6ZXFQOVJKOXh0ajU5U1dNUkdXVWU1WmZP?=
 =?utf-8?B?aFVtb2JyeXEydlcxbC95RS9ZR1pCNkcwU3lIVWJmNnd5TU5FVE1oNFFtL252?=
 =?utf-8?B?VFVWVjNRN05aTFZLYnorVEdXd3g1NllrbysyL1FJQTY4aVJBcGRIVUt3R2Va?=
 =?utf-8?B?V2Y4aE1rOG9TREpjVjVJUi9kYktsQ0FHWFZIOVorTzU0c3d3YmtKcnloTitr?=
 =?utf-8?B?WTdmck90M2tRdDU5SEliMnZaV2hkdkV2cmIralEwUUhhVk5zMWQ4ejhUREs5?=
 =?utf-8?B?OVF6anErTWJ1bTJjS1FBS3l3UUw5cXdiemNTWHBNTEJweGtMSW54a001VWhS?=
 =?utf-8?B?RGFmdFVUeERTdzd5YnRPVWtqTlNpMG0xTnoyaGYyUFNoU3VPdkhacVNWU1FY?=
 =?utf-8?B?MmgxMFlGdHVCd0cxa2EvMk9PUjdUWDcwenRpWDR6S3lyWk9laExUaE9DazNY?=
 =?utf-8?Q?wsE+Ga2sfytqVUMCAYxwz1F20MxhDRnVbzXsMwI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 098a6ccd-03c4-41c0-53a2-08d8ee1eac8b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 17:11:18.5311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UtrXKc6ehRCD/diA80v4kjTlfhPdw4iufReSAbrkokkkYHQ+93utaG/2ZH492x6DUSBNnc+Yo1YSE2BR1sYcNxRm20P6sNWV5h2hTjPJXm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1715
Received-SPF: pass client-ip=40.107.8.91;
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

23.03.2021 20:00, Paolo Bonzini wrote:
> On 23/03/21 17:43, Vladimir Sementsov-Ogievskiy wrote:
>>
>> Interesting that REMAINDER documentation disappeared from latest (3.9) python documentation https://docs.python.org/3.9/library/argparse.html , but exists here https://docs.python.org/3.8/library/argparse.html  (and no mark of deprecation)
> 
> Whoa.  https://bugs.python.org/issue17050 says:
> 
> ---
> Since this feature is buggy, and there isn't an easy fix, we should probably remove any mention of it from the docs.  We can still leave it as an undocumented legacy feature.
> 
> There is precedent for leaving `nargs` constants undocumented. `argparse.PARSER` ('+...') is used by the subparser mechanism, but is not documented.  https://bugs.python.org/issue16988
> ---
> 
> The problematic case appears to be when you have more than one positional argument, which is exactly the case with the 3.8 documented use of REMAINDER.  Hence the decision to drop the documentation.
> 
> However, "check" works fine because the REMAINDER argument is the only positional argument:
> 
>      $ ./check 001 -d
>      Test "tests/-d" is not found
> 
> Another possibility is to pre-process sys.argv like this:
> 
>      if '--' in sys.argv:
>          cmd = True
>          args = sys.argv[0:sys.argv.index('--')]
>          posargs = sys.argv[len(args)+1:]
>      else:
>          cmd = False
>          args = list(x for x in sys.argv if x.startswith('-'))
>          posargs = list(x for x in sys.argv if not x.startswith('-'))
> 
> But getting the help message right etc. would be messy.
> 
> Paolo
> 


Hmm:

> If you have positional arguments that must begin with - and don’t look like negative numbers, you can insert the pseudo-argument '--' which tells parse_args() that everything after that is a positional argument:

So, as I understand argparse supports '--' feature out of the box. So, we can keep '*' as is, and it would parse all remaining positional arguments which are either tests or the command, and '--' will be automatically dropped. So, we only need to check existing of '--' in original sys.argv to chose our behavior.

-- 
Best regards,
Vladimir

