Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EF76BEF62
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 18:18:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdDhD-0005Uq-Pa; Fri, 17 Mar 2023 13:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Luis.Machado@arm.com>)
 id 1pdDhB-0005UV-TY; Fri, 17 Mar 2023 13:16:49 -0400
Received: from mail-db3eur04on0629.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::629]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Luis.Machado@arm.com>)
 id 1pdDhA-0008ER-1X; Fri, 17 Mar 2023 13:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgGmCn+uxi2N0k0TyzRZe+PS0aqi8151IkC3L9W4HSs=;
 b=64KlUa2rIigzY1O3yUXgoMhwHIjeF38h9GHmGRQzXEClYVqILOt4Gbhzw9TZTEYbfmMaiHhdAxxwNZgOS/7xrxwKZzzJxM34vOquWfip12o3ieJ3lBzlSqLkzlP2n5WNQVA1CdR/0EfngdMG7ZBDBBw5aJaJD2ffNsOByG29EEA=
Received: from AM6P195CA0059.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::36)
 by AM0PR08MB5489.eurprd08.prod.outlook.com (2603:10a6:208:18e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 17:16:43 +0000
Received: from AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::e4) by AM6P195CA0059.outlook.office365.com
 (2603:10a6:209:87::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35 via Frontend
 Transport; Fri, 17 Mar 2023 17:16:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT012.mail.protection.outlook.com (100.127.141.26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.20 via Frontend Transport; Fri, 17 Mar 2023 17:16:42 +0000
Received: ("Tessian outbound cfb430c87a1e:v135");
 Fri, 17 Mar 2023 17:16:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a9e2311daf09709
X-CR-MTA-TID: 64aa7808
Received: from 0238a42ca147.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 38221751-AD7A-44B4-B3EA-3D353A9DD488.1; 
 Fri, 17 Mar 2023 17:16:35 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0238a42ca147.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Mar 2023 17:16:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbJ0ibbSxkKIKtKu4vstfzMrrwUZvHAZQgq3hlrUnf/QdeYMdWeqRQeY7NJSFrecmcERsMT9ge8Rjhe61ZvOkXBlKwWqMDsFkX0/dGxd+ox0SV9A+fEnb6wt3BFIqqbtxZeos7XnJ8RdDh0q6WiGUjeqiwSqI0knxnz4wYL3kZ/VyZd3T/jORs8ecKl9Pd0JA6EQoM3g3kRXsjyvlk3JjgeUCMxu1ftqq1DZQhCCA+h3R3+/S+39Md91YMw3I9jqXKouFeSexuBA/eVEIUdfaJLp37uDc/AmTO2doqapEkLUhsBhkzjslW8Kr0IANZUspyLBsEP5/AILL/04wrzg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgGmCn+uxi2N0k0TyzRZe+PS0aqi8151IkC3L9W4HSs=;
 b=Gkql3aGIzVp8N6vTqW0Jh82ZjY9lNEzsnLNLhodv2VBWMMdAgVWikEI7OI0o47SXtHRBKmR3TsU64zEzupkiBqB0oUlQQJ7FRqZTonhfO3aM7XIVSCjOEHhcPcfgC0Tx4YsquniWj/fGrCWO37nkQ9hbZ2FpunLPsSIWkmR5F7Tidbam3yUrzGq9ACPHMnQtKR4LHnEM5XtvO/8zDa4ggOd3nKIcUP/bT0ERO8jdUiHgb/AaWGVnK6z91+6z6Ws0mM3QcuEQrQWE0wK2+jXulgXBw/YaDexFJ75T5Du99T0yVhpA6IwIWlqyTdmDKZ7LrgjsFTqM1EO818Qmj6UnlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgGmCn+uxi2N0k0TyzRZe+PS0aqi8151IkC3L9W4HSs=;
 b=64KlUa2rIigzY1O3yUXgoMhwHIjeF38h9GHmGRQzXEClYVqILOt4Gbhzw9TZTEYbfmMaiHhdAxxwNZgOS/7xrxwKZzzJxM34vOquWfip12o3ieJ3lBzlSqLkzlP2n5WNQVA1CdR/0EfngdMG7ZBDBBw5aJaJD2ffNsOByG29EEA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com (2603:10a6:803:c4::31)
 by DB9PR08MB9537.eurprd08.prod.outlook.com (2603:10a6:10:459::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Fri, 17 Mar
 2023 17:16:31 +0000
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6]) by VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6%5]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 17:16:30 +0000
Message-ID: <24f4ee9e-0155-403b-06ee-ea4b1f0512e2@arm.com>
Date: Fri, 17 Mar 2023 17:16:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
Content-Language: en-US
From: Luis Machado <luis.machado@arm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
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
 <9bb8ab52-c6ae-95a7-e6c8-64bcce166c19@arm.com>
 <caf97353-d116-976c-72c7-953b0cad956c@arm.com>
 <CAFEAcA9WbEaCUXWcGT1+nj5u+zjWrm_+58X1-ZyrvUoeWcOdZQ@mail.gmail.com>
 <7b032516-913f-87fa-eeb7-c38a8676465a@arm.com>
 <CAFEAcA8gDqrg3Hjv=0P-6m-bHytoHrYRSrrY1anu3gGZuQaL1Q@mail.gmail.com>
 <284bbdeb-f68c-a0fb-4bec-e000eeef771f@arm.com>
In-Reply-To: <284bbdeb-f68c-a0fb-4bec-e000eeef771f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SN7PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:806:126::15) To VI1PR08MB3919.eurprd08.prod.outlook.com
 (2603:10a6:803:c4::31)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI1PR08MB3919:EE_|DB9PR08MB9537:EE_|AM7EUR03FT012:EE_|AM0PR08MB5489:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6f4f22-139b-45f6-f044-08db270b60d1
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: HCTmb52iY4ivHSrF52lG9jXKNHPPTcFWeeoTh3cxKOUKqzr96eKvofhK4xIToWp3oaA0GnhoMCs43tK6sC4h/K+ewxy5yrNXHLXAY1c8u+tlA9mnlaX6hYKJp4fMpJaLz28dPHF4hpeFaCdO0XUcORGTPv7QbfFN3o6tVxb9w97boHR3fXacwqM4DZQHK//nh+BhqtjpgkZhVdF7Uvc9aewxSsDJBix3Tz1j09g5W/HR0vLIrWsK+rCj1LNlOb8fjrzMMIP5vEdVPfOwDLP9fECsMe2UmXcF+J+fTAJRRdms6EFBJEMPRh2FAx70WAlvYjPZDGrh1m2UXW68QI8uTHm8hTwt/bdw7vQptFRo6tDoIcu9ECmdDwZK3zme5IIfjFEs4xQSYmbPJS8d0BFy5etWMUKAZee0sm357sZ7P4JGh3fmXENXX8JmuzMr/GWjA8AXg80oJqoXrjdQ29drxb+OUUFHZDtHBeM0eL8JzvzV4W5sZDfADCgR7cjfPsLtTIoegjKFv48egbrqptGLnBcCRkO5s0/OsmGZyq5XfFfzO87M6jysd3fyRekyFj8VkPL9g81yrirP9BOmi+p4Um+tf1TnkLOyoFeKei4A7NwwhAGzZvcnutz71cGosuxkQiJeZYw9ZpxYPM6yUoAbJw3y/Lp9fxhMCNtORHpvRH2VFjNR7/b2do3NhvZ8VxZkxWJYTL8ngALsEwKmhY/3HYbAP1MFgI0Der6LFpViii4=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI1PR08MB3919.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199018)(6486002)(31686004)(6666004)(2906002)(186003)(26005)(6512007)(53546011)(6506007)(7416002)(5660300002)(2616005)(66476007)(44832011)(478600001)(36756003)(31696002)(8676002)(6916009)(83380400001)(54906003)(4326008)(38100700002)(316002)(8936002)(66556008)(66946007)(86362001)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9537
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f7a50f9e-f62d-41fc-9e42-08db270b5954
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KfRL8u5OBQwgaISyW7JwZPEYOAZd7BC3Ax2vUlXB6lgept/NNcvE1T8tPUCuMDr0zipbnt4yr02AxKiaMhbs27Xp03+h6KDQZmrHbb+jvqwlRWt/yPD4nbIw4NNBfR4AJkt7sP+I7nZL6c1LwUBoT6dmSw1Vw664MzqomwNeO9SBQnQpEBe6+uzhmn02IZ4YXPD/UVv6rPSbbW0RU0Jda4ExIVYKBi8WhlGL/FG+5IE/h4PFY0Q8SQkvXFtpO6T09jcMEABlobnXGq9hO0J3lzGYK/wCyhWPowArSpfStEt5N2A5GtQ6M6a3LfuX4vEUgagasKkfKQaGmZ+6A81Q5gMygUne8yJpJ08e90FrxlZTqIhRy7jOoNXVD7TWSRa0P+KXLGZEydtc9K+064z7iqGSBINELP+Co5xVsX55z23+/4wYWskbiaaDG8VxsCgtVo/zQDS9cKaUH35qng4ercKnILGWOdnNKL4xsI86X4Fn4nbNnYrejXVIXiDfqdatD+PfX2BuOzxYc0j0tap4Gn5ea3PsUvZAAHSLTEgJlM/jKBaImiJ3KkG70NKXbgczXBFUW4tsN9BkQDLs+c2PccczV2cndO40rFalM6S+bvcrRsvItCAtJmtn41H6lAH8bscHTEUa8La6BnNA+zQKyNA101GqhjnjTsZwanR/QaZVSa1zphPtPXghk6PcrrqXojAnzzL4GL6pwq8IGooaz6qG3u7M7VuVK8VNfOXJx84=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199018)(40470700004)(46966006)(36840700001)(31686004)(40460700003)(36756003)(44832011)(41300700001)(8936002)(6862004)(2906002)(31696002)(5660300002)(36860700001)(356005)(86362001)(81166007)(82740400003)(478600001)(450100002)(8676002)(6666004)(6486002)(70586007)(70206006)(4326008)(82310400005)(47076005)(336012)(40480700001)(6512007)(316002)(107886003)(83380400001)(54906003)(186003)(53546011)(2616005)(6506007)(26005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 17:16:42.4770 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6f4f22-139b-45f6-f044-08db270b60d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5489
Received-SPF: pass client-ip=2a01:111:f400:fe0c::629;
 envelope-from=Luis.Machado@arm.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

On 3/17/23 17:12, Luis Machado wrote:
> On 3/17/23 17:07, Peter Maydell wrote:
>> On Fri, 17 Mar 2023 at 16:55, Luis Machado <luis.machado@arm.com> wrote:
>>> On 3/17/23 16:37, Peter Maydell wrote:
>>>> Having run into this problem in another couple of situations, one of
>>>> which involved gdb 10, I think I'm increasingly favouring option
>>>> 2 here. The affected gdbs seem to be quite widely deployed, and
>>>> the bug results in crashes even for users who didn't really
>>>> care about pauth. So I'd rather we didn't release a QEMU 8.0
>>>> which crashes these affected deployed gdbs.
>>>>
>>>
>>> Are the affected gdb's packaged by distros? If so, a backport the distr=
os can pick up
>>> will solve this in a quick package update.
>>
>> Yes, it's exactly because these gdbs are distro-packaged
>> that I don't want QEMU to make them crash. I think it's
>> going to take a long time for the fix to go into gdb branches
>> and gdb to make a point release and distros to pick up that
>> point release, and in the meantime that's a lot of crashing
>> gdb bug reports that we're going to have to field.
>
> Just to clarify, there won't be any point releases for gdb's 9/10/11/12. =
 We might have a bug fix
> release for gdb 13 though (which isn't affected).
>

Just to complement, my plan is to make the backports available (via stable =
branch commits) so distro package
maintainers can pick those up easily. No new releases will be made for olde=
r gdb's, so the package maintainers
can pick the backport up as soon as they are pushed. There won't be waiting=
 for a new release of gdb.

>>
>>> If we decide qemu should now emit a different xml for pauth, it will fi=
x the crashes, but it also
>>> means older gdb's (9/10/11/12) will not be able to backtrace properly t=
hrough pauth-signed frames.
>>>
>>> Maybe that's a reasonable drawback for qemu users?
>>
>> "No backtrace through pauth frames" is the situation we've
>> been in ever since we implemented pauth in 2019, so I think
>> that's fine. It's not regressing something that used to work.
>>
>
> Fair enough.
>
>>> If someone decides to implement a debugging stub that reports pauth (fa=
st models, for example), it will
>>> also crash gdb, so I still plan to do the backport anyway.
>>
>> If you're backporting the fix, you could also backport the
>> (hopefully tiny) change that says "treat pauth_v2 the same
>> way we do pauth", and then users with an updated older
>> gdb will also get working backtraces.
>
> I can negotiate that as well, though it borders being a new feature.
>
>>
>> thanks
>> -- PMM
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

