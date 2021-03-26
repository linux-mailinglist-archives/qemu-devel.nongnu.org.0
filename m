Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF63C34A8AB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 14:47:06 +0100 (CET)
Received: from localhost ([::1]:54908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPmnp-0004RU-Qg
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 09:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1lPmm9-0003Tk-Ud
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:45:21 -0400
Received: from mail-dm6nam10on2081.outbound.protection.outlook.com
 ([40.107.93.81]:64481 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1lPmm7-0002UJ-Dn
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:45:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3xhdbAnVKLV5q18RHsU6Kyw3KWfmvs6Ksizx9MB4eurqQ7yg9z2QAbgJyiX4L0uPV0qsrTVyqVNUUvWExAzKzNKG8o5gooo3/A2rBK19GkresckN2a6ufoMXxej7a1bQTxMytCB0fGUJEjSbIyci/EJDkB+M4KiS0+KJe76qAqqKrllR8zKstwA6fPsYAHCFZO90ImmG9g6p3SknsDGdQoq25qXbaAeXJOtQbYYoDERV6EiTMc9PBe2To5Dudp5JsIlNpTO2kPk8zy7iw0gokXUwIiDG+Gn6o3f1aXL1CSFHXoLWwPCSOU7addOCiNCn35KslYTDK7+BR117oeoJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJhw+qEuUbi6tWskD7a7Cv3KL6Mxx6Kz+AcqHV+60N4=;
 b=lMpH+WC3YOGhxgNkIHVMNOxcXPfsMLoOwm6yCje1hrsgGeWQQULPSRKcnMNJPDYI5BTuVsv/glb4v7WuyvPOZGiQuTSD5nhbx/gk7ufDwhYGVnmRIDmSsLOTXs8Px3xjrylGBBN08RSAgI/KMOxOWPRKUPGLWBQbuTAMfiG2AJqYaDQ2ODGeq0GHQcnRphHGqrqV+JzRhORrPqHlxYjq7KiEKbaUPGF1cvA2pbJ6YM0XzbOpIlTBOUCKDrqw1Cylso0pUpgaztO9cq8JCvGeZ1nH0WTFhNX4FuJKhMz0xt11wMADvhRY/EvGppuR6xXXLza0kGwlkmL/Aq+Jh0MCQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJhw+qEuUbi6tWskD7a7Cv3KL6Mxx6Kz+AcqHV+60N4=;
 b=4VUmZClE8Nz1CCU99deImFywvIgP8READu2IVBL/z0LLpj65C/KNhAoJTLZfwdO45uyAkmaxnYyNpsbv9ax3piGIFvVLZfddlEkYRHCMO+JDn1ieOa/VgBY32Q77AJJtKFFYgHuHz0UtwP+5+W5jZZUXvkFh9ndWUEY6mIdT2XM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM6PR12MB2826.namprd12.prod.outlook.com (2603:10b6:5:76::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.29; Fri, 26 Mar 2021 13:45:15 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::c9b6:a9ce:b253:db70]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::c9b6:a9ce:b253:db70%6]) with mapi id 15.20.3955.027; Fri, 26 Mar 2021
 13:45:15 +0000
Subject: Re: [PATCH for-6.0] qapi: qom: do not use target-specific conditionals
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210326100357.2715571-1-pbonzini@redhat.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <15c5863f-a691-6862-aa2b-3b72752ffac4@amd.com>
Date: Fri, 26 Mar 2021 08:45:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210326100357.2715571-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SN7PR04CA0239.namprd04.prod.outlook.com
 (2603:10b6:806:127::34) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-linux.texastahm.com (67.79.209.213) by
 SN7PR04CA0239.namprd04.prod.outlook.com (2603:10b6:806:127::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Fri, 26 Mar 2021 13:45:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e5f4c86c-f2d4-4ded-d966-08d8f05d62cf
X-MS-TrafficTypeDiagnostic: DM6PR12MB2826:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2826951BFE045396B65EC3D4EC619@DM6PR12MB2826.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7jxw3adaz/TOpk2DZfN7uWSzstTe1lLKl3Ar7sh+YakV4qno1du6xl2IHOWqNpkhSQVTcGg1vhksvhN1kDxAxA5GXfZBIIcerABbNhnTmuY+aFBK87qgoYPtUll0aS5nghkFvqC7cedOU4llM/z64nc4rXqhDJBHTSyRwIrSta0ObXTtaMZJ0z6W6nAw0cf6kuRtpkOhWymtWuB3ZT9iy/LnwMESFBl00yOdqgju03fLn8mLYZgSbi1uudkJ6OhVZSkv2jsJ8eWwfEYRaUVmN4zNEKMbLV0XtzrY4Nt4XmOFTxF8jEVRDUkOnpwZquojTyc9GlBDg5ozGX6i5AEoZQP/rCACO3o5Wq2IYSHl+tsxLdtIAHVX+FjqRndx/hz/+ME1wfoyHJE/e62SHNT51Ub7TWOsHreKzgPd0+VXQcOP+0cspcL9DY9MaVbpAm51yFD7mw78exMYyUaDT3bP4aCbKEiJXhogGGJ+D55Y+7N22RtT+tqx6/vO0p6+0zInEcqnBTK9+WTSpHRl3WqvazYokcu6Btb8Bq2QZc+B3sXCzIGQ3+QFOgX/MXxQh45G3cSyga1+8H28+TwJ+9w+vfqLrWGXV/y6bQYSegwyBf979M3m0Au3/3mn1zOAkWbdkWkE+LAReQrRhC03ErC/AyIxMIl+ImHiWrTgX9EY8ex26DnvpWNX05r97EFTVfhW26GUddLK0zZP1F/8cfzMKSraRJSFTLEhigOyuc4TsV0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39850400004)(366004)(396003)(346002)(8936002)(8676002)(5660300002)(6512007)(26005)(186003)(83380400001)(4326008)(6486002)(38100700001)(2616005)(316002)(956004)(86362001)(31686004)(31696002)(66476007)(66556008)(478600001)(2906002)(53546011)(6506007)(16526019)(66946007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ekJLbk5HQzJkZnhSVjhhck9Ya2RON25pSEkvdGZtbzZOUlpkY3pCNmxNS1Y3?=
 =?utf-8?B?QVNtdVNTRHBoVTRjYURWRVBpalpkRldoL3M0U1dYM2dZdU9yOHR2MklBRFVk?=
 =?utf-8?B?N1B3cXRyMDJaMGthNGw1bFg5YTg5OXAzL0FaQmw0eWhrTzg5V0l2Z0xBWkRB?=
 =?utf-8?B?ZTQ3Y2txemFSZjViQ1RnbFdIQVQzMnREdS9XOXRqNDBqL3ZsTXp6YXg5bUhq?=
 =?utf-8?B?TlJOYmdqNEpmQjR0YnRpY1JSQlZhNUF2NWk0YVFRNXBVU0QvMks4eVpFd3pW?=
 =?utf-8?B?eXZSK040YUdpVFY5WlhiZVNrc1J4V3RrbWREb1dVTytlUjkrQ09Jd1c5UTAx?=
 =?utf-8?B?Y2l6REFBT3oxM0RKeFhqYmFDTUxKbWhXZ081ZXN1YzF6UE1vK2ZPS2MvRHJI?=
 =?utf-8?B?WHlLcnJFMHRXRU5vS01xOXhkOFI1SElrbklEclVUZ0Npd0tCKzArOEIrUEZy?=
 =?utf-8?B?NDZpcHZwVjkzWEZhWXRqYkVxMUw3dTlBNXpkeDBaQmxPcEZrV1hjTkU4U3RF?=
 =?utf-8?B?UHJYdGJzYkhWYUFWZTFseUVacks3eWZFTkJXelpXQ3o2RUhZSEZ3WDYyS1V6?=
 =?utf-8?B?MWpaaFJUM2ljMFpXeEpEaFdTTVdtM1Y5SGhQVEJ5RUZQNGs2ZjlCM2pmKzht?=
 =?utf-8?B?cldsRUVUVEZ3NnJzekR5a09hdzI0NSt0cHVvMFIyMDAwWnY3U2l2U3k2ZUlB?=
 =?utf-8?B?Y0FzY2JOTzFoV3p3Z0xoSUVScS9mTE8yemdqWVo0bTJuKzRQVW0xM3JXT3Az?=
 =?utf-8?B?NEpLQ3VmdXA1QVhmVkxKM0gvSzBpY09kY09UblBiME9WWGpKdnB2SWZLVGhi?=
 =?utf-8?B?V1pVZEZiQlMveWptcldrVlZBd0ZhdjlPMTRNSlZCRDRyVjc4WFpHbWV2Y3Ru?=
 =?utf-8?B?aUs1S2Vac0N2TjZpKzZtdklXRW1SYTAyRS8zL21pNUt2MG5XelR3SzNWT1Bz?=
 =?utf-8?B?RVQrZk1XMUVRWXg4V2ZQQm5ZSUhwMTlpRVcreWJmajAzTnZjUXRYd0JXRjhu?=
 =?utf-8?B?bzFJN3psT0dTc3BCS3dyaVdZUTY5aDhMMkZIK0NpcGxUQ0ExMEM1ZU0yeFBN?=
 =?utf-8?B?aXlnRldBbWo3L2xDSDR5VlhvTGdlZXorMW5BZk1KVDRsNm1xZEJZbUZ5UlRX?=
 =?utf-8?B?SHJDdFpxQVliRWlCVjNkTDNXS1JMbDlackxFMEdlY1hiaWYybnNLTytqdEJC?=
 =?utf-8?B?VnJBU1RobTRPN2d0d1ZzSVVwV3ZCYkVScm8wYkJaYVo1TDVMZDQvb04xOGpQ?=
 =?utf-8?B?QlpmaWFTNDNmNzV2ZUtDS1FTdlhhR2xRYTU1YlFTR3h6N3A0Q2J5MHFRSVNy?=
 =?utf-8?B?ZHlncWZBOGJUV0o4MzdsOUcyUkNFTkxvQ0dVazVwWGkyRGdYY2QyM2FDOW9Q?=
 =?utf-8?B?N3FmcFQvczVZWkJRVFZKWVVUK1ZOanIzbUQyemNBM3RhUHAxZDN0S3BhUmU5?=
 =?utf-8?B?blRaVmJHZUIyZkJiZE50cmpISnREdTRYR29uWDhaSVBLT21JRlE5UDI2RXFt?=
 =?utf-8?B?TVppS3M4NTNJM0hHYTlZOWdKdVZCS0V1SG1ZU29jODV3UjF5OWNyY1BxY2U1?=
 =?utf-8?B?YitUVFkzTGVFbGdhMHdodTY1ZXBGd3lVZWZUSnJlcy9NQVErQjVxSFB0QVZY?=
 =?utf-8?B?cEYyUERUZTlsbVJzaXZlazJORjlXZnBZVlk4ZTVuU2tQa0dnaGxOK3lQa1da?=
 =?utf-8?B?Z0dXTysrQWxrSjE4Qk5mYlVqNHNSR1BHeEJkV1pQR1VaNFg3dEZXSFF1dWt5?=
 =?utf-8?Q?Cy0s36x6ZdqHvDGrTbPdRwVA7AwF2LUo6JySaDU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f4c86c-f2d4-4ded-d966-08d8f05d62cf
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 13:45:15.5767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXgU/0rHM8BftCL8rG3/5QcOADgrwHMCBgJ0zBLNHEoCQngWIihA6Wzww0X2IhCgk0VZoNh0YIptVVlP+RCP2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2826
Received-SPF: softfail client-ip=40.107.93.81;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 5:03 AM, Paolo Bonzini wrote:
> ObjectType and ObjectOptions are defined in a target-independent file,
> therefore they do not have access to target-specific configuration
> symbols such as CONFIG_PSERIES or CONFIG_SEV.  For this reason,
> pef-guest and sev-guest are currently omitted when compiling the
> generated QAPI files.  In addition, this causes ObjectType to have
> different definitions depending on the file that is including
> qapi-types-qom.h (currently this is not causing any issues, but it
> is wrong).
> 
> Define the two enum entries and the SevGuestProperties type
> unconditionally to avoid the issue.  We do not expect to have
> many target-dependent user-creatable classes, so it is not
> particularly problematic.
> 
> Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

I'm once again able to launch SEV guests.

Tested-by: Tom Lendacky <thomas.lendacky@amd.com>

> ---
>  qapi/qom.json | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 2056edc072..db5ac419b1 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -733,8 +733,7 @@
>              '*policy': 'uint32',
>              '*handle': 'uint32',
>              '*cbitpos': 'uint32',
> -            'reduced-phys-bits': 'uint32' },
> -  'if': 'defined(CONFIG_SEV)' }
> +            'reduced-phys-bits': 'uint32' } }
>  
>  ##
>  # @ObjectType:
> @@ -768,14 +767,14 @@
>      { 'name': 'memory-backend-memfd',
>        'if': 'defined(CONFIG_LINUX)' },
>      'memory-backend-ram',
> -    {'name': 'pef-guest', 'if': 'defined(CONFIG_PSERIES)' },
> +    'pef-guest',
>      'pr-manager-helper',
>      'rng-builtin',
>      'rng-egd',
>      'rng-random',
>      'secret',
>      'secret_keyring',
> -    {'name': 'sev-guest', 'if': 'defined(CONFIG_SEV)' },
> +    'sev-guest',
>      's390-pv-guest',
>      'throttle-group',
>      'tls-creds-anon',
> @@ -831,8 +830,7 @@
>        'rng-random':                 'RngRandomProperties',
>        'secret':                     'SecretProperties',
>        'secret_keyring':             'SecretKeyringProperties',
> -      'sev-guest':                  { 'type': 'SevGuestProperties',
> -                                      'if': 'defined(CONFIG_SEV)' },
> +      'sev-guest':                  'SevGuestProperties',
>        'throttle-group':             'ThrottleGroupProperties',
>        'tls-creds-anon':             'TlsCredsAnonProperties',
>        'tls-creds-psk':              'TlsCredsPskProperties',
> 

