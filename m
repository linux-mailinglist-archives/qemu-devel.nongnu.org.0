Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365656B76F2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:55:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgcI-0005oP-3M; Mon, 13 Mar 2023 07:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Luis.Machado@arm.com>)
 id 1pbgc0-0004uH-UI; Mon, 13 Mar 2023 07:45:09 -0400
Received: from mail-vi1eur04on060f.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::60f]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Luis.Machado@arm.com>)
 id 1pbgbx-0003jB-LY; Mon, 13 Mar 2023 07:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ku6HypoQwXLTKAhEAAf9UzH2uM1f3VRT0NT6bX76VmU=;
 b=EkCMLQsm541IooImTuEP1EUNmiLHT6kM813DZ7cHx50P0XtbFHZGxoXWub1tI9TMl44ZR9bBno7pYkDB6MBV95DjJjOs1z4EniAKpyHNKljnBtfTav65YSurUnEC2BlITmXApvEGxtTRiY6ItoaYIPYAb7Zf9KeNctvZjmWEH9A=
Received: from FR3P281CA0090.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::6) by
 DU2PR08MB10086.eurprd08.prod.outlook.com (2603:10a6:10:46e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Mon, 13 Mar 2023 11:44:55 +0000
Received: from VI1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1f:cafe::6c) by FR3P281CA0090.outlook.office365.com
 (2603:10a6:d10:1f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Mon, 13 Mar 2023 11:44:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT061.mail.protection.outlook.com (100.127.144.125) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Mon, 13 Mar 2023 11:44:55 +0000
Received: ("Tessian outbound c2bcb4c18c29:v135");
 Mon, 13 Mar 2023 11:44:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 976965ed58d1f430
X-CR-MTA-TID: 64aa7808
Received: from b6d81f0ba347.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5A71A672-9FAC-48D7-84AA-03000C9A72AB.1; 
 Mon, 13 Mar 2023 11:44:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b6d81f0ba347.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 13 Mar 2023 11:44:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huQKVoO0+AINpf7FPsiyORj4uMln9Yj06Ki4WmdTvLi/wi5AOiuSsCQ9wd3UN/ryHcWlF0njiJ7l5puxsfIjgk1wD1uNUBOL/nTmsK4jO0agogZJyYrA0rCCvvy8z/rmu22ZI3bxJ0ZnWZtjBT9BrQwjtVMdgveYvyJetLq/hDP8A/nxciZLegBc/oBjLUNLbsPoD1bT08u85zBcgGI3SCXuJZu1VrubFzbKWONQDon0Ez89fPgGbqA4i/8U4xqrQ2D/BfpuJwgEfJUKSQFF75r/PrbiBq2QcX8g6qxVlYqw+e8sWL0CepZqEIIetQbU0a1rs8V8w6nGqNJooUvZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ku6HypoQwXLTKAhEAAf9UzH2uM1f3VRT0NT6bX76VmU=;
 b=eI9+evIcuLGYSPl8L2i+GkGsv0R0bTpsOUVx514WdhOqjn+1CxOtilipbdCurEEOuxgMzuo+ofGo54gGaa27r6osCfNU/To919P8k2LSrsQkBudzDGi8pd9SWChrjdo9yrOAI6jOY9QU6aeTgAbgT6PY5X80KuxsBqC0hR7MJp7Lb8+x0d6zQZMS6vQQbg3fyyk38kLbxmHwHIpbNbelv+A1iaHlft8b8/ppP8YWD+rwFPtVap5kyQQ1JQB2TqlCSn39p3gszZxOxgxfDrWNY8NVRZLXe/Nb/QatNYZv2kUP18Z1cfvnMRByHo7WeOUzrK9OHL+lHT0+IUydrkhI6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ku6HypoQwXLTKAhEAAf9UzH2uM1f3VRT0NT6bX76VmU=;
 b=EkCMLQsm541IooImTuEP1EUNmiLHT6kM813DZ7cHx50P0XtbFHZGxoXWub1tI9TMl44ZR9bBno7pYkDB6MBV95DjJjOs1z4EniAKpyHNKljnBtfTav65YSurUnEC2BlITmXApvEGxtTRiY6ItoaYIPYAb7Zf9KeNctvZjmWEH9A=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com (2603:10a6:803:c4::31)
 by AS4PR08MB7502.eurprd08.prod.outlook.com (2603:10a6:20b:4e6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 11:44:41 +0000
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6]) by VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6%3]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 11:44:41 +0000
Message-ID: <9bb8ab52-c6ae-95a7-e6c8-64bcce166c19@arm.com>
Date: Mon, 13 Mar 2023 11:44:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, gdb <gdb@gnu.org>,
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
 Omair Javaid <omair.javaid@linaro.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
 <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de> <87sfeclb8o.fsf@linaro.org>
 <CAFEAcA8SFtzMAFPaE=_CJtwXDYiJQ8rDWgEE+Nx2Qz=-FjCmMA@mail.gmail.com>
From: Luis Machado <luis.machado@arm.com>
In-Reply-To: <CAFEAcA8SFtzMAFPaE=_CJtwXDYiJQ8rDWgEE+Nx2Qz=-FjCmMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SA9PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:806:21::35) To VI1PR08MB3919.eurprd08.prod.outlook.com
 (2603:10a6:803:c4::31)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI1PR08MB3919:EE_|AS4PR08MB7502:EE_|VI1EUR03FT061:EE_|DU2PR08MB10086:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b1e7b5a-dab8-4781-92e5-08db23b85d71
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: fKkoeMs1X6itUYkAdMCp+O1wKj2XRtgCDnhrYf4kCIpduyVPT/aX1ZHQYyheywr4W7rPAeg5kVgeuAjXPAdvIBShPsRYOssYVm9vaTpXoXAd4U2UN2ob+Wws4iZHC64ut+ETD4zBweSkWuBUegaF4/99PxQITsvIBbL6i8dzf60w8/Tum5hFlw7DXDIg+LlF8NkqQKJyMt8o2g3UBZ6wifAKOPooD6Exf7RDSTZln3jxDQhObhkWoebrCoZYI4UvmuiQH69TpiJx4Gmt7myoWsVxDCk7fjgRxjam/XPC0f1mhXLBb9saZ6r3LtS1cUT8eHNbai/9ShQ6cgHMwcVzeGi1xGDtwGy0xIFKjpYWTYFK5HMUmXTiy6UhKfdvjX7P15auzSrE4/bx1jQTZ40GxypxIZoIIMs3FHmwLB14uiejGplLY5yr0ypSPA3raYWaOu5ZF+KFXCFW4OS5FbbJGYjbPbV4V5chli0cZ8/60m52qebRc3TUQ8/w5Kb2lw0qj0DCauT9cei2KdRYvsgjET+HHLfPC1vbS0fYA+Hm+NQHRXwvlWknWR2kPAtd8J3pH6k8dosIangIC1NerZiT2XIKjZxFCueOmkRwhdeO9TyT7wq9wXUu5i4k/56dNng48tK6FYzfGU9HoK2z+cT+ycsiM/w0vFxdzUq9RbJdeV1HNJEBwEkG7eojNDot8zU0dnVubM4LKPmKlQFH3Lhb4+7Mm2djgsOi6uwixqoSQr0rroQGqDG9PbwGxVRY9Jc2
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI1PR08MB3919.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199018)(31696002)(86362001)(36756003)(38100700002)(8676002)(4326008)(66556008)(66476007)(66946007)(8936002)(54906003)(110136005)(41300700001)(478600001)(316002)(6506007)(7416002)(5660300002)(44832011)(2906002)(66574015)(2616005)(83380400001)(6486002)(186003)(6666004)(6512007)(26005)(53546011)(966005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7502
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VI1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 350a1288-b8c8-46a4-dc27-08db23b854d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q5VxZJjgpIwMdHbIe0eS6y8k3ZwxDcPAi/wdpzSoXTVhxJMvwHp4joCE0UfHVxK2c+1TqI3kXJ3zou5rfS0qkgBry30oESkSWBsKTYQu7o9XcYA03uKPRTTgFNYLxlVCUcUIvNId3uxwzX2SPT/nrXM01w0955/Awqck0XJfMrNgIzOL2Jnn/PJ26h+MRugOxA4CymoEkKdoJusIrO7xFL/GHXRu5u0Z208N+8NKgkcmD/LMdMnMgbeZEcKFAreIWK5vvFEB6SIZnnqD8SGawHBPXjlebQzN00usQzjnXP/ZlSrDcN4rDsDcyUvgnxNObuiIN/GY82nH9/5cyy5jUhe7GVaFqJGJeF+fSHTl4MC4d40cKDUFJuaEaWiADtwb3c3FKHYO/r7c9lfl42pVZmQsuzYWXJ2I6gjZR0/Qrd4QNCX/4BXCuPuttDetyKIe4y8640qGvuaE2qiiIN2f0+LBNnWq2vmt6mxwRofEt3aOpfWaIBAnaL+dYwZrF20+D9RZ8ld5/7yLipQ7Cx1zHiYvL4lgfo2OTlyEC87X8rlpWkFt3oZ08VVM74FpnDPR3gfjF8hybvJO69V/IC0hky5RgmGRGvMVwDP2gCfZVPVFjVKryzKy0hK7rqj0+f31UFXFtvHe9SCmyI6sMXNrS/NmFzi2PfZ/hNEnbF6hiec0K2fDRxfn66EiPmTuiQhVN2P1qiUMC6jko3jyljkwW6o3vfcDLCPcFw1Nj8NdXr8xvh3nl+AwvP0MjsfJNfr+ztQaSWzUuf51X9nf1ytLrw==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199018)(36840700001)(40470700004)(46966006)(36756003)(82310400005)(86362001)(31696002)(41300700001)(186003)(26005)(6506007)(53546011)(6512007)(40460700003)(5660300002)(4326008)(336012)(2616005)(8936002)(316002)(54906003)(478600001)(110136005)(966005)(70586007)(40480700001)(8676002)(70206006)(107886003)(6666004)(450100002)(6486002)(81166007)(82740400003)(356005)(2906002)(44832011)(47076005)(66574015)(36860700001)(83380400001)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 11:44:55.0173 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1e7b5a-dab8-4781-92e5-08db23b85d71
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10086
Received-SPF: pass client-ip=2a01:111:f400:fe0e::60f;
 envelope-from=Luis.Machado@arm.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/13/23 11:22, Peter Maydell via Gdb wrote:
> On Fri, 10 Mar 2023 at 18:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> (adding some more gdb types to CC)
>>
>> Fabiano Rosas <farosas@suse.de> writes:
>>
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>
>>>> On Fri, 10 Mar 2023 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>>>>>
>>>>> You need a very new gdb to be able to run with pauth support otherwis=
e
>>>>> your likely to hit asserts and aborts. Disable pauth for now until we
>>>>> can properly probe support in gdb.
>>>>>
>>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>
>>>> If it makes gdb fall over, then shouldn't we be disabling
>>>> the pauth gdbstub stuff entirely ? Otherwise even if our
>>>> tests are fine our users will not be...
>>>>
>>>
>>> Have you seem my message on IRC about changing the feature name in the
>>> XML? I think the issue is that we're putting the .xml in a "namespace"
>>> where GDB expects to only find stuff which it has code to
>>> support. Changing from "org.gnu.gdb.aarch64.pauth" to
>>> "org.qemu.aarch64.pauth" made it stop crashing and I can read the
>>> registers just fine.
>>
>> That would work, although I would prefer to probe support so we can use
>> the official namespace.
>
> I don't think there's a way to probe for this problem. I spoke
> to Luis about this, and apparently it's a bug in how gdb handles
> the pauth XML description (fixed in gdb commit 1ba3a3222039eb25).
> A gdb without any pauth support at all will be fine; a gdb with
> the bug will report that it has pauth support but will crash
> if you feed it the whole set of XML that QEMU has; a gdb
> with the bug fixed will also report pauth support but won't crash.
> (The bug only manifests if the full XML includes registers that GDB
> doesn't care about, like the system registers; if the stub sends
> only registers GDB knows about then it won't crash.)
>
> Luis and I came up with two options:
>
> (1) leave QEMU outputting the pauth xml as-is, and tell people
> whose gdb 12 crashes that they should upgrade to a newer gdb
>
> (2) make QEMU output the pauth info under a different XML namespace,
> and tell people who need backtraces when pauth is enabled
> that they should upgrade to a newer gdb
>
> Neither of these feel great, but on balance I guess 2 is better?
>
> Luis: I think that rather than doing (2) with a QEMU namespace,
> we should define a gdb namespace for this. That makes it clear
> that this is still a gdb-upstream-sanctioned way of exposing
> the pauth registers.

That should be fine as well, and would work to side-step the gdb 12 bug so =
it doesn't crash.

We could name the feature "org.gnu.gdb.aarch64.pauth_v2" or somesuch, and s=
lowly stop using the original
"org.gnu.gdb.aarch64.pauth" feature. I can document the requirements for a =
compliant pauth_v2.

FYI, I've pushed a better documentation for the arm/aarch64 xml description=
s here:

https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dd7001b29e9f2=
56dfc60acb481d9df8f91f2ee623
https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommit;h=3De0994165d1b8=
469dfc27b09b62ac74862d535812

>
> thanks
> -- PMM

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

