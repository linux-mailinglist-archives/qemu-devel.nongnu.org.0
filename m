Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7206B75C6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:18:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgB9-00081J-6d; Mon, 13 Mar 2023 07:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Luis.Machado@arm.com>)
 id 1pbgB6-000811-8K; Mon, 13 Mar 2023 07:17:20 -0400
Received: from mail-db8eur05on20605.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::605]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Luis.Machado@arm.com>)
 id 1pbgB3-0007NA-Mg; Mon, 13 Mar 2023 07:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWZGioujfaAhTBBKE+UsXQw2yEoGFBszdJhcFKOEYP4=;
 b=tGhAp4DZs+jy7yzeyT2JZ8QkELJS6q4GcXFh+T10a43ivu4dFaUPDxXb4ZAaZl2DmUd17c+6ZTgvElaGz2UR/KXcUuTaQJHYfApraZQY57fEwSJ1R5jYPje2IUni/O4Q3Aat95736IZCb5Ed1IP2hXHm9+fUO+0TmYZ08h9foMY=
Received: from AS9PR06CA0600.eurprd06.prod.outlook.com (2603:10a6:20b:486::35)
 by DB4PR08MB8125.eurprd08.prod.outlook.com (2603:10a6:10:384::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 11:17:05 +0000
Received: from VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:486:cafe::f5) by AS9PR06CA0600.outlook.office365.com
 (2603:10a6:20b:486::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Mon, 13 Mar 2023 11:17:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT021.mail.protection.outlook.com (100.127.144.91) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Mon, 13 Mar 2023 11:17:05 +0000
Received: ("Tessian outbound 2ba0ed2ebb9f:v135");
 Mon, 13 Mar 2023 11:17:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b42f859e155cd76d
X-CR-MTA-TID: 64aa7808
Received: from ff3b6723b420.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1D0BE1B6-9708-4D7F-B454-DD15F5728F64.1; 
 Mon, 13 Mar 2023 11:16:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ff3b6723b420.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 13 Mar 2023 11:16:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XS3fi8Hb6Tx0ron0GcGew9SnY+FCbhRMRmKdIAftfd1UlD/sDO5kZ4XSpDf+oiGOoQJ14Ycxa4fGVmGjJ/ypAADiOGZ81ALMhKXrZjBSeRm6O5hXGGu7Jw0CQVpt6wgEbo/X2VcVSkwmdDJDpcKOUt1OQKK6+pULjgcg/fPeLk0ToJI/ao8xxhoNxn49Sn8p+bOCIjxU2H2pxMe0vKYiPsbMILZivLUTexJgYtLuU0Jv6zRW78hdXzxxl05GLiribu8SBoXE9aFDC4J8hLG7PdcYYyzCjQC/3W+mWiPvHg3slUrsNVrxC/whvy9yuQvS2x6YP807Zy/8bn4oJJxthg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWZGioujfaAhTBBKE+UsXQw2yEoGFBszdJhcFKOEYP4=;
 b=esJI9kjOu+PqBS0eFpBpuzXRNydeBmtKfJttxSUz7UKIbK9bem9VMJqlgLqd9e06/xpvwLGYMXyIIHhxInYyblYXHpIdY+99JzhqbImCaPDN3+6S4GPakE8b4mb3dtN3NDS6pd5zX2DSchGg7trmFi6i8TAr8BS0ftYqRCq8otYveOhyopthBOhowZgddWTBZz3Uzeh3qbqFrz2VFQ95iKK1sHvJaat8RO4WNBySwKOMXlSEL55w3euHTEJA3PLcXZ/Ll6ouFGzCf9a7R4F1PGgcN1FpsyztGai1+cipQ3NP6kJOKibYXGoWQlh1beKjqzbMV39GmDJwGzj8zDEj6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWZGioujfaAhTBBKE+UsXQw2yEoGFBszdJhcFKOEYP4=;
 b=tGhAp4DZs+jy7yzeyT2JZ8QkELJS6q4GcXFh+T10a43ivu4dFaUPDxXb4ZAaZl2DmUd17c+6ZTgvElaGz2UR/KXcUuTaQJHYfApraZQY57fEwSJ1R5jYPje2IUni/O4Q3Aat95736IZCb5Ed1IP2hXHm9+fUO+0TmYZ08h9foMY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com (2603:10a6:803:c4::31)
 by PAXPR08MB6367.eurprd08.prod.outlook.com (2603:10a6:102:15b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 11:16:55 +0000
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6]) by VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6%3]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 11:16:55 +0000
Message-ID: <0603036f-ac1c-3b04-4ea2-eb3967768df2@arm.com>
Date: Mon, 13 Mar 2023 11:16:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
 <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de>
 <CAFEAcA_bjTPO+68gV0V7436S2n=iJAoH3qXGw1v9-xhG2N0CLA@mail.gmail.com>
From: Luis Machado <luis.machado@arm.com>
In-Reply-To: <CAFEAcA_bjTPO+68gV0V7436S2n=iJAoH3qXGw1v9-xhG2N0CLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SN7P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::9) To VI1PR08MB3919.eurprd08.prod.outlook.com
 (2603:10a6:803:c4::31)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI1PR08MB3919:EE_|PAXPR08MB6367:EE_|VI1EUR03FT021:EE_|DB4PR08MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: d1274eb3-3326-488e-cbe9-08db23b47a1c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lgFnQsXaKSXRRrV4lRyYBy6wgLpftoHECEmOB968QdNPP+pRwiTBklwFlRpVzIWYJei6DVv6k1pAP/8t1cyApew8VQ6D1TQ4YaIOtanJDuD5ZokkbHJGyiJ5ls9tXCjBFf9YqNhSr7xN8m7lH43zdQB5o8pdjug9D9MYL2MU5cRgp54W8YHYhHgbHyBhj11L+340Q/6LRKYiLz94ubjbMKYFd+PYmc/ENb2st3onor6JUPJcrnuE3VJ2kzzLdkqPUU+LG2BLCY4mUZu/mPhxlf2V5eTPRHjPylnudlrxKtcuWYs4qBB73XQeMJAz2ShrkFBV4JTdndDYZHScygOmZe5i2Yr550zSGH6i5OJlkSXsBE7FQTFnsHw5jVE44DhkxYEaSY3Bo/zBSTZvKWlWU2y6u6x8VTBd94URWwqmEp8haHv72gvrLYY84TYUivmbWCYvsH7CBffhJw3F0TA8q+jV5twuGO0LDhydOeFrXDWHxNsDGxNx+z5EYgnz/9PmOTrFxRc9H89GjKMcjqrDrZwjtL0kMXXeKk9AY/rjA+lOx+irdLZtKpGU6mH8X61OoHNGcR0nC4hZOLq5EyoZT2eCNvdhX24zPeRi2xCWQ9x5A8cix5ikhgoI3SzQdYF9FVlabnqgcD53QcsPzDq/eYQiEJoxN4C7gZGHs7pN9skPipiia2GQMmaIvY8W6K3QID5CPXTnndeHilOD1oPpL8jTWCsTW0y7B34EYoOxkxM=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI1PR08MB3919.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199018)(31686004)(5660300002)(4326008)(7416002)(8936002)(2616005)(41300700001)(186003)(6512007)(53546011)(26005)(6506007)(36756003)(31696002)(86362001)(83380400001)(2906002)(44832011)(66574015)(6666004)(66556008)(66946007)(8676002)(66476007)(6486002)(110136005)(316002)(54906003)(478600001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6367
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: cc573814-0dfd-4813-d93d-08db23b473cd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R0NXiEEkoz1NaatomTBkLbQG+H8CEbtUp2+EcRArhD4ZoaxqtINPvp9CJnsKJYiCQRw3s2f7FQKfaNVlAzjc72qoCwL4l5MQ0DZkvLI1jq5IJ405WC0+TqF8qpAOPtrvTCwfRL2dneNbFhZC/qu04EoioOTNgnFWDXYHL0wnRRLd1i44Fiy0eOusEsOoVnt9vTRxi4clZ+y1+GDUmG5Az5jBpiLUS7KBLD6CEntFeJtepOXphR3REoIbdr5HQ6YGdWcAyQ7xITXcyKzNqpKtEA0RDwME5vfOFOgusBw/f57untB800cDk770n5TdB7VJZIsKYx9U7DjQJf2iPF55/ElU35/b6qlfTOy4ChoY3MUuk0yrLCKV/Ce4yDXnHpSlmbLQTjORuU6mi13fUl3tbcI1hMNYsc7XYhRvHJRPhGuj6kgKkBqxV0GIYuJ4Dka8fOkTN14IiRjK8bInp8IuQ+fJEuIZWUsCHzBJR2AdxcXjwxjQFu+S7a7V4CP9xn9+WTD0MT+ow+2uggWS/Cwqsh+N+BTCWxg7W8SZ3f5UjkP+u5iAhbIja5IQ7vYxSk/BOS7t0BYt/LLfhDuGamBiVcBSQ2RWrTLQ9WAy4gXtdS8HxQNIEDvRBMug7Vw+bWnJdSuKwGp3XyptWLORK4R44AKMrzf953Xote3nWlLl58uwWLMCMrPDsQXuNA/bJN550eSszijj4HmyRy3p1qS69A==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199018)(46966006)(36840700001)(31686004)(82310400005)(5660300002)(44832011)(82740400003)(81166007)(86362001)(31696002)(36756003)(356005)(2906002)(336012)(2616005)(186003)(107886003)(26005)(6506007)(6666004)(6512007)(53546011)(70586007)(40480700001)(70206006)(41300700001)(478600001)(6486002)(316002)(54906003)(110136005)(36860700001)(450100002)(8676002)(83380400001)(4326008)(47076005)(66574015)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 11:17:05.1600 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1274eb3-3326-488e-cbe9-08db23b47a1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8125
Received-SPF: pass client-ip=2a01:111:f400:7e1a::605;
 envelope-from=Luis.Machado@arm.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On 3/10/23 18:07, Peter Maydell wrote:
> On Fri, 10 Mar 2023 at 18:00, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> On Fri, 10 Mar 2023 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>>>
>>>> You need a very new gdb to be able to run with pauth support otherwise
>>>> your likely to hit asserts and aborts. Disable pauth for now until we
>>>> can properly probe support in gdb.
>>>>
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>
>>> If it makes gdb fall over, then shouldn't we be disabling
>>> the pauth gdbstub stuff entirely ? Otherwise even if our
>>> tests are fine our users will not be...
>>>
>>
>> Have you seem my message on IRC about changing the feature name in the
>> XML? I think the issue is that we're putting the .xml in a "namespace"
>> where GDB expects to only find stuff which it has code to
>> support. Changing from "org.gnu.gdb.aarch64.pauth" to
>> "org.qemu.aarch64.pauth" made it stop crashing and I can read the
>> registers just fine.

It might be a better option to emit a pauth feature in the qemu namespace t=
o dodge the crashing bug from older
gdb's (a latent pauth-related bug in gdb that is triggered by having gdb id=
entify that a target supports
pauth and at the same time having a target description containing system re=
gisters gdb doesn't
care about).

>
> But then presumably a pauth-aware GDB won't actually know
> the values it needs to be able to convert between with-PAC
> and without-PAC addresses for backtracing?
>
> Luis, how is this intended to work? Is there some way the
> stub can check with the gdb that's connected whether the
> gdb is able to cope with the pauth XML, so it can avoid
> sending it to a gdb that is going to crash if it sees it ?

There isn't a probing mechanism unfortunately, and gdb isn't supposed to cr=
ash in this case.

With the changes from commit 6d0020873deb2f2c4e0965dc2ebf227bc1db3140, gdb =
now unmasks signed
addresses using the additional pauth registers. If gdb doesn't detect the p=
auth feature, it will
still mask out the top bits using a default mask of 0xff80000000000000.

While that should be enough for user addresses, it won't help with "kernel"=
 addresses (when the VA select bit is 1).

To dodge the crashing bug of older gdb's, I can adjust gdb to also look for=
 the pauth registers in the qemu namespace and
document that accordingly.

>
> thanks
> -- PMM

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

