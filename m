Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6132830C6FE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 18:08:29 +0100 (CET)
Received: from localhost ([::1]:49542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6zAC-0003JL-DF
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 12:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6yYP-0005an-Ai; Tue, 02 Feb 2021 11:29:25 -0500
Received: from mail-vi1eur05on2090.outbound.protection.outlook.com
 ([40.107.21.90]:7616 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6yYN-0000KJ-4I; Tue, 02 Feb 2021 11:29:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXrX7tUtVLGa2qMotds3tDdgZunGiii7I9ZGA0KyZCMVJWyIcOxDERP3AHg5LGPu1zZjumTu/Q180KX0B8/uAB9qgmkAt1hsEPJhhSd0KE8d/652MS2G00GlWvhKfGQfT8vMzh7bJucqcuVATPm19Ex8dn2Nny8BgkhZlMbwG6/EyKRjFTFrXwRJXmkLhhMU2aXGvx5C1GGn+1vR7iAmaM0317vpY5gObTjv0HZZFmTNvzG8HQhoT3oQX9AS93ONBCtazrdyWtQznLTqQ4kTBElsUW4ihrqiS4ZPbqFaNRArYO+eZSu3EcAJTVNiHgwIQ5/F8P84prU7Frpphqet7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrgSrvnNhKjDnVP0v7+IlGbI0tPBKXyrGH6PsxzytOo=;
 b=DDOy0sGIswA0lXLBPPWVPsuySm4EY3ZOXBvUy8afZTCJ2uqOx/UYE3tdbsr98iJQfZHX0oAygFAboI0/pO4XTQak3HOHGyA+aTgr/uvzTNf4C8pD19R04pAk1s1SOBGecJloADAuZwcfqvASY3naFYyndweA8Gfgm0xfvpmxMpC8BkOhFfSy6XNEdrAj0vTRrqbkNQJnZVCV4y5ujiQRbPg7SMNyqX5vivP/FatnZJfmUl7Ob3c335eZ4fw0wI0XwSFsouRfy/fa8R0IXxWZTTBE44Glr/pLajhpkGxli1dSu2tlEqR+TcfrTgW87y/arHnuCiSyCT7chWsbeCB1+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrgSrvnNhKjDnVP0v7+IlGbI0tPBKXyrGH6PsxzytOo=;
 b=H5qSgjoxx0E64UESoYrkKE2Alr47QjhUDmCd8tBq1inysROiSZfMBhhSOK6uJYuOF7AivbSVX4HR6nHwR6ZUZmMJRD0kk9NHGfOxRTKkgz4NwOfaF5oYzyhcKy3PdhN2lz5atHMgAbcPSgxV5RpReLBDopc9GHp3C3/koPrmhL0=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4069.eurprd08.prod.outlook.com (2603:10a6:20b:af::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.28; Tue, 2 Feb
 2021 16:29:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 16:29:20 +0000
Subject: Re: iotest failures in head [was: [PATCH v4 00/16] 64bit block-layer:
 part I]
To: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
 <81abe7dc-6053-72d2-ddf7-352dc21e75b6@redhat.com>
 <9e71568c-ce4a-f844-fbd3-a4a59f850d74@redhat.com>
 <20210202162319.GG5184@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4f3fcae0-49cb-a1fd-4878-118bcc15287a@virtuozzo.com>
Date: Tue, 2 Feb 2021 19:29:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210202162319.GG5184@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM9P193CA0024.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.137) by
 AM9P193CA0024.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Tue, 2 Feb 2021 16:29:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de2734c6-e2db-4b33-b6c0-08d8c797b15f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4069:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4069AD12734F1EF7756FCBD0C1B59@AM6PR08MB4069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dPDW/PjfBxh+XjayJlIv8TxW+63UGQgna2qc4SWev4HrqA+oXIW6VFYsDiBvnftuGMs4FX9FlCLg1p+hU2kWbHitNeE+k7qu25WwAH4gKcW0fA6KFWO7yX19M0opdM21GrZ5Y44yPXD3UOWHKibJXKzVsNMZqBvJMh82+wze8K3HTH5v5KlHYFpYv6mO1nhy9Hxo0z8+bB7eAJ5egP5Zvgbr+o5ljKcH/PR9BS4CUDU8m0NMrSUuYa7QvqFByEfiJDpOCfSxx7mG1pV2D5LvniWvaZ3Ry8r1G+zW6s3mOeeJiT5TMpbBy9QYDB0o+99VrgsGyjO9fNNQwM2NIc5It4XtXpLYDGh2NRjDp3C21JusxnoAUvh4HFdH3i6UDbxX72P07O4rP8fUweWSScf+CdZ9dlNwCO0llE+bBnhADSh41O1C3oVOI+/Pm4DXNSG98XMjSWnsJAkI3XfvNQQte4o3nKH8tCAPRLvluyRFpfgb+vnjlPpidkI2m/A4HswPUN6vVm7ID8IKn6D7VGGoP4MxS9f54dsPXmA1mTkvD1qzTfkHtCkYgiOlE1wTMeF+d8++hDzdC7ClJOko6TG0pujE1Lx4qsfvZVFLknsjwUjG30vvnceGEDY30qgLWuj8H/aI6HdGn6Qy7YE9ribnbZ7aGqqMaXi6N3Ivz2o8ifVjmCyGEjkKhbrPjADNrrkk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39850400004)(396003)(346002)(376002)(52116002)(16576012)(110136005)(316002)(966005)(5660300002)(478600001)(8936002)(956004)(107886003)(2616005)(31696002)(86362001)(31686004)(4326008)(26005)(16526019)(186003)(66556008)(66476007)(2906002)(66946007)(83380400001)(6486002)(36756003)(8676002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SHBOcXRvTWY1cnZ6MnJoNnppM04rUzM0S2RQYVNZbm9TOFBxSUhGQjEwQ3hM?=
 =?utf-8?B?S0JRdDdqT1U0Q3NNbXcwRTVHR2duak43aGUzaVlybDJVcHdvZ1cwVFdualRy?=
 =?utf-8?B?NEtHRlFGdU90TndSN1k4ZlEvUkZCTUEvOWNnT0JsbHBuZUhiNUFxWkhDaWNB?=
 =?utf-8?B?bURGYVdWSmxOTmhiZ3BBcWt4ODAvWC8zUjJOQkpXeDN0ZmdyT1VhNHgxQlZR?=
 =?utf-8?B?N2NPSTNtVHp6VGJDZG9tUUtIOXhiNW90ZUJqYVdBWDRXM1QrUEtWSHBlUi9Z?=
 =?utf-8?B?cE9xV2FpZE1zVXRMTXc2LytYRVdYd2R2Vzl4NDJORlQweFptUkxmeVZYK0Ja?=
 =?utf-8?B?aXRQTDFxYUlPK2kxVVZ1S2Z0WFBXWDQxZUlwdVNjbUV4VW9sM0JxVEFrZzlJ?=
 =?utf-8?B?U1F4V2gwb1o4NTZ2bUMyVEhwRkgzNzkraHNybjYvVitMOTRERlVxMWVJS2tv?=
 =?utf-8?B?OHNjQlV1NzQ4a3NGN0JJTTZqOUllQ1dqTFhJQmx0VitYdXB6Uk10NTJUakJv?=
 =?utf-8?B?NW9zZUozZ2VvZ1J0U1Z0SDkzSEZDSXIxa1dnek9UanoyOEtiblpTY3NTaE1v?=
 =?utf-8?B?U2ZKMkIvdzVnWGw0L3FrL1RESUsyY1R4b0g0S2pFaDN3L3FwQlFyckdMOGYw?=
 =?utf-8?B?MlNxckY4aVhwTUtXZzNKZDhCZG44WmlwcXp6QVYvMlMyb2g2V1ViMlp4cTVy?=
 =?utf-8?B?aG9LWS8yNjgrZ2k0Q0FrR3hwTys4MkhJWFp4eHplS3E1aVZDN0JOdkI4Zzhi?=
 =?utf-8?B?N2c5R0s2Q2VMbVZCTXpVL3dIamdvNDZBbTR6eHJJSTgxYVBmY292NkhzSUd5?=
 =?utf-8?B?cEVEMDJqbVh1V0g4UndXazdycU9Zam5jTUxEaWlVZGtXeU40MkI0MFByZjVO?=
 =?utf-8?B?WFdyMXk0UUtuSVlMQ1ZmaW52RHlQMWRubDROQWk0QytqbUNkK1lPVHJSSGds?=
 =?utf-8?B?OHlmMjhhSGMxV0xmMGMrSGF1b1k2VG5RTlQrTjhrMVNreVFhQkhUeUlZbUp5?=
 =?utf-8?B?Ny9Ma005RllwVmdSTEpOTkw2bE9YdXIrUDh4RjRUYktURUdJTEZKdTlkYllS?=
 =?utf-8?B?N3Y4cTZobzJ6Qk9lRi9ISkFPUjE4Y0I4ZTdxM01QczYvU3ZQK3RtZnVuQnlW?=
 =?utf-8?B?bUJEd2ZBSmJqampFMlFFcFhuT2ZkbWFvVFc1VXoyZ1ZENUZqcG45WmFncGwx?=
 =?utf-8?B?ZStadXhOR3E4UlQwTm8zT3hsUDlDQm4vSTU0OXJrNVZpZDYyWkQzQXl1QmVn?=
 =?utf-8?B?YXU0cGpJd2FMc1RZd2d1YnlZVzIwQ2FPTzZnQ0xMZjlYQ3pMVFczR05xZkE4?=
 =?utf-8?B?U0s3dHg3V1YrendXcHpjWXh3ZEdXL0F6MmlUSDRreG1xdGt3RlpSSUlDQnZL?=
 =?utf-8?B?US9sUm40WDNHTksrb0NaOEg5dk9zS0ZUZUpiL2lVd2IzMFUveE45bis4MEpy?=
 =?utf-8?B?dXRNenJXUGZGRkUyZGx4TmRzSWJQRHphZVpDaklRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de2734c6-e2db-4b33-b6c0-08d8c797b15f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 16:29:20.3500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dccg87SpYV/AWV6ze79+DzNQmISSUEqSMdzdlGTam+pN2jqq6UaNWarr29wdRjtraRdhiJnzz0ElTpsyqMDN8BODeHL1sublxZLmyIiK03Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4069
Received-SPF: pass client-ip=40.107.21.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: fam@euphon.net, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

02.02.2021 19:23, Kevin Wolf wrote:
> Am 02.02.2021 um 17:13 hat Eric Blake geschrieben:
>> On 2/1/21 8:56 PM, Eric Blake wrote:
>>
>>> I had planned to send a pull request for this series today, but ran into
>>> a snag.  Without this series applied, './check -qcow2' fails 030, 185,
>>> and 297.
>>
>> 297 appears to be fixed once Kevin's pull request lands (well, that may
>> be needing a v2).  185 appears to be just a whitespace difference that
>> missed fixing in 362ef77f9 and similar:
>>
>> --- /home/eblake/qemu/tests/qemu-iotests/185.out
>> +++ 185.out.bad
>> @@ -89,7 +89,7 @@
>>                         'format': 'IMGFMT',
>>                         'sync': 'full',
>>                         'speed': 65536,
>> -                      'x-perf': { 'max-chunk': 65536 } } }
>> +                      'x-perf': {'max-chunk': 65536} } }
>>
>> 030 is a bit tougher to figure out.
>>
>> 030   fail       [09:40:32] [09:40:48]   16.9s  (last: 15.4s) failed,
>> exit status 1
>> --- /home/eblake/qemu/tests/qemu-iotests/030.out
>> +++ 030.out.bad
>> @@ -1,5 +1,45 @@
>> -...........................
>> +WARNING:qemu.machine:qemu received signal 11; command:
> 
> So some qemu process segfaulted. Did you have a look at the resulting
> coredump?
> 
> Kevin
> 

Note that 30 is known to crash sometimes. Look at

"[PATCH RFC 0/5] Fix accidental crash in iotest 30"

https://patchew.org/QEMU/20201120161622.1537-1-vsementsov@virtuozzo.com/

-- 
Best regards,
Vladimir

