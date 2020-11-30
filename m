Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728782C7F83
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 09:11:12 +0100 (CET)
Received: from localhost ([::1]:33132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjeH9-0001K6-HX
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 03:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kjeFI-0000Xd-Fq
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 03:09:16 -0500
Received: from mail-vi1eur05on2113.outbound.protection.outlook.com
 ([40.107.21.113]:2912 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kjeFG-0007l7-0T
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 03:09:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TiGmjy2ZvpeAzDNCLF7tx1PqmmPz0GgN46s2eHTge0zCj/puZRemBhvRh51y9b4r7NDWBHHHfCHDInqFuBAl47Tms5dA4GwStFOZ7DL81Zj+yqQPsUMktSVsfVB/qe3bevUWkpmqpdfBGv04ziDcj7Gll8F8B/J9ToszA01RHTpvssfPEpPluC3kBtTzh/xcmUcIsL1+9Rvwa3S9P7lzEOZjcx1wKSy6XlyEgSfDgy1y+tZ23QrgR/NB8xidpRt/k8J53VXQv0uyFb7UXBqVBxYNNMJ2FzK9DElfEpxe7sJTkERG2s3xwmvEoatAu63QBJhzyQrgWQPiXbDyaYcWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thpiW5H9bYV8w9LMNQjdIboAqnFk8dxnkMmjKjewoJg=;
 b=Z73CRnnU1h+A+OXmCncQzwxWeq5HjNSHvDlD2z5+FgOp9CQPmYtkrqBXm3vIGuavsVyBzsbg/FoDRHsyiLG9vPUVkuKB4G3GKW7Njiw1daqAn/JCPXFniUOZ2qxmkMiCuD4YBkP6cddsyLqDqvaH4im2YB2KzC3VESlyz1281daZTL6aw6HeAyjX/JvqTotGaDdja/k23x1TSGBIVbOtL6GGdzTqaIXpA1rA0BDMyFTmTFmIQCMEc00AsVsQwNWlNAiddR/o1GKS2V0Byd1kSGMSycSf217pUSv5Vqzwt5glL7ho/FqI2ourIJz3QzGcFD2EqmhGWhOOTcIiWdAjeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thpiW5H9bYV8w9LMNQjdIboAqnFk8dxnkMmjKjewoJg=;
 b=GGA+HcE10fvHHA7Ho531nfrvJPuN7pBLMkxp6mcqqIFNiNQkH6/2tbnRIEqllIDbnjDhuJNBD8zvS8JrsTd6ZlBGzOU2N6kxJCUqV/P2IqjutzNsD3l7WvVcJ2Reqm5bSnzMGqR6p4ELZ88NfeCj5eKDdggaJxV362hu7j36llw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR0802MB2271.eurprd08.prod.outlook.com
 (2603:10a6:800:a0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Mon, 30 Nov
 2020 08:09:11 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3611.025; Mon, 30 Nov
 2020 08:09:11 +0000
Subject: Re: [PATCH v4 5/6] the rest of write tracking migration code
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126151734.743849-6-andrey.gruzdev@virtuozzo.com>
 <20201127222653.GI6573@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <eb235a19-6b16-af89-0b5e-9f3cb0a4aa73@virtuozzo.com>
Date: Mon, 30 Nov 2020 11:09:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201127222653.GI6573@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM3PR05CA0085.eurprd05.prod.outlook.com
 (2603:10a6:207:1::11) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM3PR05CA0085.eurprd05.prod.outlook.com (2603:10a6:207:1::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 08:09:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa0f29d3-4d4a-4c73-2224-08d895073831
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2271:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2271B243F11137CB54EB21219FF50@VI1PR0802MB2271.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dJ+/ZU3qsUTyZkUmdJgGw9wkHnnl/jCLmVhUPuWN2HaRUlRQrIM6ownnwPNpYzr8Cu+gbhGYS0A3tyfeWWaPNhal/fB1TGR5v6E7JXHtck9UPwUWtkjvWvRVVSt0zVwN0l1TMb7YbncesGNB6uOqE7d1lXx9+ziXvRU8e7kpxNu3ZP2XzqLk3ZGLWl2U4HQUxIhYUYzRvbl+NT7shQ8kwCtkMRUI24Lj3SEe/1l6oMhobq1b4QFWziTjZCRzM2viIDcp9ozfzgNJI8NL7e4aA4bvFUVzn2L85SGhntm0a4I33Ztxh1DUmSX4s2tuWtpZcg0L+HvgM/g9TnTTSLLEtiLdUSoK44PMTgmkMOeF0rfgggcUNtn7C+KJTq5G3lzc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39830400003)(396003)(366004)(376002)(16526019)(186003)(316002)(6916009)(8936002)(66476007)(31686004)(66556008)(66946007)(6486002)(53546011)(956004)(4744005)(44832011)(86362001)(36756003)(54906003)(2616005)(4326008)(52116002)(31696002)(5660300002)(16576012)(26005)(2906002)(8676002)(478600001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K1RuT3VEWERBa21jS2F6UnNEQ3JSb3R4L1RPcTNqZ2t6a1F6Y1ByTCttSkZB?=
 =?utf-8?B?dmFFWUZiV3pJemRkcGhHSWVTSEt0TVRudDFjWHp0ZVNTZkY2bXdaM0hRWURr?=
 =?utf-8?B?bTJ3N210WWl4QmVnUTRsdVEwQUNTMFY2T3BmeEVueVN6WklhYlN2c3FVL1My?=
 =?utf-8?B?K21ISzhLM3FtMGpZakZweTk4dzA1amhibi9kZFFkTExtdVJUWXhjeFlSRlJQ?=
 =?utf-8?B?RWxneGNkdGJjd01TUXlyVlQyVEVxUmJGeGpuNkwrOTJLY0lob3J6SW9GLzcv?=
 =?utf-8?B?d0J2ZmQwNmtsTHNrZVdtTDN0TklpQWxmMzlOYjd5WlFWeHUwV3NHNjcyQkNK?=
 =?utf-8?B?TDZrN3ZXK0o3UWxRWmgzVnpoS05GRXZIdE54VVFDN2E4NDVVMFBjT2pBNlRi?=
 =?utf-8?B?UUxmUXVzZllQUjBjRitRaklwb21qQmszbDFTam55b1F2RXJ4cnJ0bG1BQm5C?=
 =?utf-8?B?SGZKdXZ5Z0lqeWpzbzNMTWtteGdQYU54YmVQZWk0L0Y0VGgvYWJ5WEg0RGxk?=
 =?utf-8?B?N2F4OWRjWm16VTFNdnZQSmxKcW5aOG1kR1diNTM1bW9MZVkxYTRwRUdBNFNS?=
 =?utf-8?B?MlovKy9WaG01NEdPd0xjWlZENzZYN2FNKzJ2cXE1MW1KK0NpcEtkVGpDSzl1?=
 =?utf-8?B?NG9GYlBmV0R1U05wa1RZaFBWU0hvVTZGclZUWTRIdW95UncrOFUzdzUybXRV?=
 =?utf-8?B?K3o3b3dtU2tpcUJUWm9SUEJEWUhrNWo3UDh5U1VqVDR4UVNCcTV4UVFkT0E3?=
 =?utf-8?B?SDlOcHlsL2dvV2FuRVFXQkhHSTlkdEREZzJub3FrelgzWlNiS3NTQ21ZcGpZ?=
 =?utf-8?B?M0lZbzFnaFFJM2VuZzFSVy9ucXlIMEx2aE96WUdHUVVlVzJTbUcra01saHl6?=
 =?utf-8?B?V0RNZm1aYStQRk5SKzNWV29XS0QrcXd1eHZJRkxTQUtQUFU4bFdhUlR4NWRs?=
 =?utf-8?B?VTduQlFUcmZBRjd3Sno3aDU3aUFadFdPdDRPK1RhSGlZaWFiNytWSnQ4OXZK?=
 =?utf-8?B?bnRJeWk2MzNmU2w5TDNucDhGSGlkODJjODRkMUM5UlhMekRrWUJOdTNJUm03?=
 =?utf-8?B?Z1Z6Z2tZVzBzUmpOc2t3WU5QS2VRem1SNzhSLzJMSFRmK1hkeE5TUDc5elQy?=
 =?utf-8?B?RVVvc1A4UUF2Qmxacnc0dlFMZWR3WVVnYUpSb0pXcXFzNWpDeEJMRGlvT2pZ?=
 =?utf-8?B?WmVwYXlha0o2N0M1R0RDUHUwcGVTRnNFaHVYbXFFVnFjOUs4enpIcm1hNDBE?=
 =?utf-8?B?RjhMcmJOWk5IYXc2bm92OFBiZExZQ1NMWFNvNjFhaExOYmN3eEtsSlZRZzVM?=
 =?utf-8?Q?wSsQ/RfwIaVQw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0f29d3-4d4a-4c73-2224-08d895073831
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 08:09:11.4128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oXG4X5lRZsVV0jeIEH2tlxhkpudi/URvt/qXm/rSoRU5+Db/vTAH6NTj/10dbndh3SiVaS7SwycU9JgdTpb3IiXsqHusjaFGOYzuDkPH34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2271
Received-SPF: pass client-ip=40.107.21.113;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

On 28.11.2020 01:26, Peter Xu wrote:
> On Thu, Nov 26, 2020 at 06:17:33PM +0300, Andrey Gruzdev wrote:
>> Implementation of bg_migration- iteration/completion/finish.
>>
>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> 
> Both patch 4 & 5 look good to me in general.  Maybe you can even squash this
> patch into 4?  It's not scarily hugeas a single patch, but a complete one.
> 

Yep, agree.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

