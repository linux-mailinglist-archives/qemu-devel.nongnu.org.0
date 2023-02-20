Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B853E69D515
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 21:40:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUCxA-0004bj-Cf; Mon, 20 Feb 2023 15:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Luis.Machado@arm.com>)
 id 1pUAta-0001oH-BF; Mon, 20 Feb 2023 13:28:14 -0500
Received: from mail-vi1eur04on060f.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::60f]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Luis.Machado@arm.com>)
 id 1pUAtX-0001cT-DI; Mon, 20 Feb 2023 13:28:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjI2po/sXvvJ3s/Tph7Jkhx8j+r2SW0zgmalq85aoyc=;
 b=PvQ78z/RfgD6r4EDJSTYC8yPIRVozRhYAtdxt9yj8VoK2lKJvDtYIG17bS46gdGhpHuZTVtKhIsvhZ27mOC807SZJ/WquGIZvJCqBr+k7cUmOYjjK0bQ+aAmhciCPPhu/et+NAw/0cDB1mmpT9rYptZEpHUuvaYZdqm+8rkmcGg=
Received: from AS4P195CA0027.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::16)
 by DU0PR08MB9396.eurprd08.prod.outlook.com (2603:10a6:10:423::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 18:28:03 +0000
Received: from AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d6:cafe::c) by AS4P195CA0027.outlook.office365.com
 (2603:10a6:20b:5d6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19 via Frontend
 Transport; Mon, 20 Feb 2023 18:28:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT044.mail.protection.outlook.com (100.127.140.169) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.20 via Frontend Transport; Mon, 20 Feb 2023 18:28:03 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Mon, 20 Feb 2023 18:28:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5844ecb058f48aa9
X-CR-MTA-TID: 64aa7808
Received: from de74ae73c3ab.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6B97135B-40B0-4C81-AE27-79678568435F.1; 
 Mon, 20 Feb 2023 18:27:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de74ae73c3ab.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Feb 2023 18:27:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnqpkzhX+6pvWd2P1RoTnkG0/QDTQPPjEN4WMzZmU4jnaKyGAbeTU4MfIFJFAkbBwu+bnOMP9aF+9zTmh7iEQsnv2XIU8lnY5vG9jBqCkiQ43zFuBhWOfc43Woma8C2xUV1IKdOPNLQFrPpjnGqjSps09SQka39lU7fE12OPeVDzKsc8KiTeplm+lSmRXsjlel9htcxEDpYxWxQT27gU49jfVPNRXH6bgqAM0y2gs+poKZwg1CA3tbc/EZTaU8Y5Dj1EPtvawibtu3wQzDwUFjB255iprxV0HY8W5zdLlfDyr8YPaIdIyBtn6LFyCm3sSrMOQ9792YJEGUgrvjpYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjI2po/sXvvJ3s/Tph7Jkhx8j+r2SW0zgmalq85aoyc=;
 b=DDRapwtCBFcEndRt1ZHgRjOIuuyyx90YOkc1sszID0pewQd3P5Yve0SE2GiDI5qYCldSbvigr15SjYykfaZm7x6Uu+WQqZanEoUPVN3NzyU+5mXVc16rGahaEYEB45yeuir2iJt80W6yP+I0RRgauflHHhcxk9PxQRkDGuM3m9gyMU8Ga0aqA5gQnhxRGG7qjvL7pLYc4ipUlMiN5s5Y2XXrpBfjxZ+QCs4wX0JODchG+Yv6hsW/DPl7xHdB1+Kb5LDzOHHFmnrTbSG/Bzrg1m9v13pH7nTjvmDoVrpQMcDo4aLDrA0EQtTwzaSXeozOIolHWRIeRhf9x38o157fyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjI2po/sXvvJ3s/Tph7Jkhx8j+r2SW0zgmalq85aoyc=;
 b=PvQ78z/RfgD6r4EDJSTYC8yPIRVozRhYAtdxt9yj8VoK2lKJvDtYIG17bS46gdGhpHuZTVtKhIsvhZ27mOC807SZJ/WquGIZvJCqBr+k7cUmOYjjK0bQ+aAmhciCPPhu/et+NAw/0cDB1mmpT9rYptZEpHUuvaYZdqm+8rkmcGg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com (2603:10a6:803:c4::31)
 by PAWPR08MB8935.eurprd08.prod.outlook.com (2603:10a6:102:33f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 18:27:52 +0000
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6]) by VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 18:27:51 +0000
Message-ID: <d2c5c041-f4ec-2c96-50c2-b97dc9a302f2@arm.com>
Date: Mon, 20 Feb 2023 18:27:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 14/14] target/arm: Support reading m-profile system
 registers from gdb
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, David Reiss
 <dreiss@meta.com>, Torbjorn SVENSSON <torbjorn.svensson@foss.st.com>,
 Yvan ROUX - foss <yvan.roux@foss.st.com>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-15-richard.henderson@linaro.org>
 <CAFEAcA96L2V0dvnrygnr00PsKkAcko30h+RCKUMcAJGv0utH4A@mail.gmail.com>
 <c6d768e4-6f48-b68d-26f0-227d70bce82e@linaro.org>
 <CAFEAcA8sfvQFFArnkm8aGXSvhB6t+vg52bdQCPvLu26VXRkNtQ@mail.gmail.com>
Content-Language: en-US
From: Luis Machado <luis.machado@arm.com>
In-Reply-To: <CAFEAcA8sfvQFFArnkm8aGXSvhB6t+vg52bdQCPvLu26VXRkNtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0272.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::7) To VI1PR08MB3919.eurprd08.prod.outlook.com
 (2603:10a6:803:c4::31)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI1PR08MB3919:EE_|PAWPR08MB8935:EE_|AM7EUR03FT044:EE_|DU0PR08MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f3bf76-1aa2-4996-57d2-08db137033ff
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: pOE2u5s5AF31oXIiulNqwsZZyqM8gJDQHRFgDo5y5EHL6HKzqnNUVETvgNsLvH657MN3p+a7AMJoW3l3fxotfTE4+vGZbQTdSWTmFfjVGCf/euChkut8nvdJfy0Z7gja8yZCgitlEJ/CRZs0mb2uN8FRHOcBpMCVOk8er8YaEP0jrQdMWhmnKdUCxYNDxr7H5GweNUhtQZRaiL87sjWfuXx8Shd7XODrV0ZD47Iy+tkhazbgRKPEov+/qMPvzRO1diChZXtGSu1YOvhYGHmvndOInAgyFI3W52qwGGivD2AcMaLEHKXS08EszycLeAi7QmSqV9Od6rkyDr4KJ7nWyz4YzaqVri8kIk3kFf7gZZ0n2ZxCjE0EtFGBqNg622w2zlp8Y2pXU0BLpHyMBK7jAieaR1BxAaFjLcW6u+82QUGSY0yafzQBPPDLlSi8PoNrnm6MM65T25ptQjvOkV/TSgRh0ASRgXBh/izqhWP4e9wA68I13LkK3imH9ZaI6yZHwJ4GvuA8xRix8JHBoU+O05F3LZGvr/PICwOMQQ/ZrjeVvZDLN8Ev1aMLSmCP0mT7MerQicuIgeaLgbNYZUmLuTKoUcHD0zh8J3TTBQdAUU4BaRECJDn+sl4mhQUymTPF3PI/HhJM8kchQ/5an9yf1CouvsRanTeFq6Go2pqRQ6tgkcZIhqJHIpyDDS7zbKkGTswe9aLEc8/k06arg4R3yvXCoWQ2zRQQWamfEQ0Ym7U=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI1PR08MB3919.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199018)(31686004)(186003)(26005)(53546011)(966005)(66556008)(66476007)(4326008)(8676002)(6666004)(8936002)(2616005)(83380400001)(6486002)(66899018)(66946007)(6506007)(6512007)(36756003)(5660300002)(41300700001)(66574015)(478600001)(110136005)(54906003)(316002)(38100700002)(86362001)(44832011)(31696002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8935
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4dd1759f-2d4a-4ded-0afa-08db13702cc2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JtXOGjpSrBPe7HwcssMv6+SqVWVS1a4KuckQJk1X80tHX4ywJSocBbnkBwj/evzDmhvVCOqH7ziby+ZJj9f7qBUrtJ0LPEfUn6uKkVqIdyPKVwurg4LOhSCF4KFln+XSztpnlb+zwguZBIsVEXISuHfIAwNXlhDyEXyi2pBsVynTM1CRZvdXVSmr1krsrEdhVsgNKxt/sVpV5UG5I7aKgGpK0n0Sl7oEFzqK50p+SIAgjiO4tncv8FIOTdhggDjcoQFAxfCLucMysjiVT1xdlQ1/Fo8frpeP6nlkaQE5ne2M1Ri5kGC4LHjQL9Q4e+cKbgeIfjRvQdQfmDY2QfzKmP3qj1XpoQu6cuv6TnKiKcC0aBYkmzhUb1RbuXkM8NSpEbYd6+iXgcHWPaYCiAUALjjSCn/Mq85zb1kriKD6C04mRaf8wbhNxIOJucupJ0pOL3CwuUgl3hjwIuujhMdfUxzrfMxd5hj7SSEmk0stIg9IYCPkA/Y6lYEf7wbQgtr27fKrZiMo7Sq5dykfBTg8c363i/a2qTItePu4ENsFx9Xjy99YN40xVRYj0e2EAt8iPYu6fr5I1OakSzvjmYftV0Vzng7gUcIddFBbZFMZceMmLwz/eoPgYqATWxHACos5CE266dbZpOrBLoLzRvSfgG9iSjTW6QiPQj6WHQJ/0SOgcelbWUpRosP/5ajZerjDmT1XA8R77rzZnmPIlREMiXiFilGDy3VmyBmscQ02Szg=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199018)(36840700001)(40470700004)(46966006)(66899018)(31686004)(4326008)(70206006)(356005)(70586007)(8676002)(6486002)(110136005)(316002)(966005)(54906003)(8936002)(41300700001)(450100002)(5660300002)(86362001)(36756003)(40460700003)(31696002)(26005)(6506007)(53546011)(66574015)(186003)(6666004)(336012)(6512007)(44832011)(478600001)(2616005)(47076005)(81166007)(82310400005)(82740400003)(40480700001)(2906002)(83380400001)(36860700001)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 18:28:03.2069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f3bf76-1aa2-4996-57d2-08db137033ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396
Received-SPF: pass client-ip=2a01:111:f400:fe0e::60f;
 envelope-from=Luis.Machado@arm.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.09, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Feb 2023 15:39:51 -0500
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

Hi,

On 2/20/23 17:37, Peter Maydell wrote:
> On Mon, 20 Feb 2023 at 17:00, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 2/20/23 06:02, Peter Maydell wrote:
>>>> +    g_string_printf(s, "<?xml version=3D\"1.0\"?>");
>>>> +    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.d=
td\">");
>>>> +    g_string_append_printf(s, "<feature name=3D\"org.gnu.gdb.arm.m-sy=
stem\">\n");
>>>
>>> Half of these need to be in org.gnu.gdb.arm.secext.
>>> These aren't our own XML features we're making up (if they
>>> were then they would be in org.qemu.something), so we should
>>> follow the existing precedent about what registers go in them.
>>
>> Now that you point it out (and I should have checked myself), we are kin=
da making them up.
>>    The only registers within upstream gdb m-system and secext are MSP, P=
SP, MSP_NS, MSP_S,
>> PSP_NS, PSP_S.  All the others are our own addition.
>
> I think OpenOCD's implementation includes more than that:
> https://openocd.org/doc-release/doxygen/armv7m_8c_source.html
>
>> Should all the rest be in a third bit of xml?
>
> Luis, do you have the specs for what the existing implementations
> are doing here ?

Support for the extra stack pointers was contributed by ST (Torbj=C3=B6rn a=
nd Yvan cc-ed), so I'd say ST-Link was the debugging stub the GDB changes w=
ere based on (to my knowledge). This support includes the org.gnu.gdb.arm.m=
-system and org.gnu.gdb.arm.secext features.

The org.gnu.gdb.arm.m-system feature contains msp and psp (gdb/features/arm=
/arm-m-system.xml) and the org.gnu.gdb.arm.secext feature contains the msp_=
ns, msp_s, psp_ns and psp_s registers (gdb/features/arm/arm-secext.xml).

All of the registers should be 32-bit in size. There could be extra registe=
rs in those two features, but gdb only cares about the 6 registers listed a=
bove. It is meant for gdb to detect if the additional stack pointer registe=
rs are available and, if so, track their values.

Adding the stack pointers to other features should be OK, but gdb needs to =
know about that so it can go looking for them. The most convenient way to d=
o it is to follow the original features we modeled things from. In this cas=
e, the XML layout from ST's contributions.
>
> Ideally gdb should document for every bit of XML it is the
> official owner of (ie in the org.gnu.gdb namespace) what the
> required and optional register values are, including details
> like the register width (which I think the two existing
> implementations that output m-system disagree on).

I went through the OpenOCD code and it seems it has additional registers in=
 the m-system category. That should be fine, as long as gdb sees msp and ps=
p.

Of course, all of this would be much better if properly documented in the g=
db manual, which unfortunately it isn't (in much or any detail). Apologies =
for that.

I'll set some time aside to get the documentation updated / written for the=
se features.

In the mean time, feel free to ping me if something needs to be clarified.

>
> thanks
> -- PMM

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

