Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97973BA0BC
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 14:52:30 +0200 (CEST)
Received: from localhost ([::1]:34294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIeh-00024C-O1
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 08:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <federico.vaga@cern.ch>)
 id 1lzIdl-0000oQ-Uj
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 08:51:30 -0400
Received: from mail-am5eur03on0600.outbound.protection.outlook.com
 ([2a01:111:f400:fe08::600]:36125
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <federico.vaga@cern.ch>)
 id 1lzIdj-0004iV-Uz
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 08:51:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhLzy1nt4l1GKL+oDl5OrYHfMg/ufqCXra51ieK922KiSUl2wCoa+tTdjmh1ITpCawvdjKl0m4ViCyxc9IvGNTpaTwMkH8/q+IAuZzXpy2s5o0QnpDrWukpACVIByajbcBZvP5NvfMAOBS4XTW4/+bpmo8zDx8+T1aovcnXcf4EGydvWoq2LsFyev3gtPhdgDK5RisNFcx+Ca4ghuwXVvOZ32V3M3zQY6f6zZWcP4z8v8G7QheWdZX9wo66/Lk8x5s/g6fTZ4c8Uq2+/Rodf663LzIsuMHu5U8lkSodn7uTIE9NDnTSFBguS2/ZOOIyEuJbhAHF/5RcXROVvKrpZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1oUqO0BWkynAaxA0UpFE/a8twR5JoFfxd6wEwHb9ZTM=;
 b=OENIp/Wegvw2t+PJGjocf+drnzigxzmH7KoAGU06tQDN+u9u10dDD3gWyxYJT4bOBMj+OLyfJPvSrNvscrIJFcQqCoMOPZbQmxGoJB4j2RErMpcIuIAR2pliJ0Ven+oOHKmGBsdDfynL6j039f1z2bRvyByo6u3CSHGPL/LhlFbxQmEeJEvrZKUL5TKR3nTQEjcuXQrBds/h8U4F2a75qeV4W/llNZJxWqMrPTraqFV8wo8CtsvX6VHsF5n3dyVS79DIXndhs1pkjUQPrQp4acUpu8IsE32ygAJCA8W0yS3roZWhxirxUAuXlEINTVyh2mwwntaSsXZ7RWuXZJ3rQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 188.184.36.46) smtp.rcpttodomain=redhat.com smtp.mailfrom=cern.ch;
 dmarc=bestguesspass action=none header.from=cern.ch; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.onmicrosoft.com; 
 s=selector2-cern-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1oUqO0BWkynAaxA0UpFE/a8twR5JoFfxd6wEwHb9ZTM=;
 b=CYMi5UtZw5+N81X+D/i9CgDOHAY5m+IZZP/2xvp+5O9jCyf8t9pbkVnVuvfUMBf6aHjrQeDX2M1/s4Iiow0uQ/8KZuqXutyDXrXEGbj8RRQvtit7g7VwR3D3FBLikLsWQMMfAgzdvhZ4W98xk4rIPSOVBm3ECp4kKqZAnlkFHG0=
Received: from PR0P264CA0259.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::31) by
 VI1PR06MB4878.eurprd06.prod.outlook.com (2603:10a6:803:90::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.20; Fri, 2 Jul 2021 12:46:22 +0000
Received: from HE1EUR02FT039.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:100:0:cafe::a5) by PR0P264CA0259.outlook.office365.com
 (2603:10a6:100::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.25 via Frontend
 Transport; Fri, 2 Jul 2021 12:46:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 188.184.36.46)
 smtp.mailfrom=cern.ch; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=bestguesspass action=none
 header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 188.184.36.46 as permitted sender) receiver=protection.outlook.com;
 client-ip=188.184.36.46; helo=cernmxgwlb4.cern.ch;
Received: from cernmxgwlb4.cern.ch (188.184.36.46) by
 HE1EUR02FT039.mail.protection.outlook.com (10.152.11.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 12:46:21 +0000
Received: from cernfe04.cern.ch (188.184.36.41) by cernmxgwlb4.cern.ch
 (188.184.36.46) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 2 Jul
 2021 14:46:19 +0200
Received: from cwe-513-vol689.cern.ch (2001:1458:d00:7::100:1c8) by
 smtp.cern.ch (2001:1458:201:66::100:14) with Microsoft SMTP Server (TLS) id
 14.3.498.0; Fri, 2 Jul 2021 14:46:19 +0200
Date: Fri, 2 Jul 2021 14:46:17 +0200
From: Federico Vaga <federico.vaga@cern.ch>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: Contributions: Adding New Devices
Message-ID: <20210702124617.mn53t5qhz7qsjiiz@cwe-513-vol689.cern.ch>
References: <20210630140102.ecuyxyeqnthvausb@cwe-513-vol689.cern.ch>
 <a394439c-0e82-b915-2e49-70ceda3d7b02@redhat.com>
 <3430433f-7ef6-9403-c160-6b135fb199a2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3430433f-7ef6-9403-c160-6b135fb199a2@redhat.com>
X-Originating-IP: [2001:1458:d00:7::100:1c8]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecb96bd3-e885-47aa-4377-08d93d5764ee
X-MS-TrafficTypeDiagnostic: VI1PR06MB4878:
X-Microsoft-Antispam-PRVS: <VI1PR06MB4878B25257BC854CFFF166AFEF1F9@VI1PR06MB4878.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Up3bNy4euDEOF4dgriKGNFujYPMgjqxf1WIuoM0d+BTFE3qGoYQMCMVC5iUl41dMMTVEIkfGd7y2WpH9MXJmrz5cWriCBSbMksx8orPGuowC/M1i6u+/FRAHd8l5cGFJCfRVOIZKO2XUXUDtvljGBoz+ZsBB2WDbj8DrY+pnGhRKiAHIOlE2LUjLQ79nP/BnukBniglfScijWl7aX6amrDGwOxrPw+/UNjvtCA9ffnBaY3Ov51NU0GkK7SXR/W5NZh51Usw5AG1brtiBZSp6z4xwIUkKBb0/ZFO9Is7Yqty70OVXrEQeYYd91EICbQ+B9/WQk4EcOto2TZXRVeI5PFAdrU1vQENzYuqP7aX2l8OwKMrmhoZM+nfmZy5WHAj6PQ/qjzOuKrxZZduMmnIYD5GGExbQ3Av275Pze4krS1RHuSRS52V1jVmq3Zdr/vYdlCasWIXpVEIIpjycQG/T6xnxKjPFvPCR1g3UUUYiinYQyoCL1Tg4mZS2dxcRLSAN8T6tPLYRG/bFGCxecHhvCZzzMHb8tuXvcUPEiFbnaKON8+rCoY+/4g9psRzspR1P/ffx9N2LOuvVBZVeRkwIcZDheTcHpiOJqdoZTQYKF58kIpD4+j3ehAC5O7vLNOmmusnJRPr41GpQHvil8R2BowalY+wPYSa7DLl4xGvnGQK5wcuCSr2rwy+IIkE77aspydTKMjktuJ4IRXpfFpQmNA==
X-Forefront-Antispam-Report: CIP:188.184.36.46; CTRY:CH; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:cernmxgwlb4.cern.ch; PTR:cernmx13.cern.ch; CAT:NONE;
 SFS:(346002)(376002)(136003)(396003)(39860400002)(46966006)(36840700001)(316002)(478600001)(356005)(82310400003)(70586007)(70206006)(47076005)(8936002)(54906003)(7696005)(4326008)(2906002)(36860700001)(6916009)(5660300002)(83380400001)(44832011)(426003)(186003)(16526019)(86362001)(8676002)(82740400003)(7636003)(336012)(1076003)(55016002)(26005)(53546011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 12:46:21.1671 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb96bd3-e885-47aa-4377-08d93d5764ee
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19; Ip=[188.184.36.46];
 Helo=[cernmxgwlb4.cern.ch]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT039.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB4878
Received-SPF: pass client-ip=2a01:111:f400:fe08::600;
 envelope-from=federico.vaga@cern.ch;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for your answers

On Fri, Jul 02, 2021 at 12:07:49AM +0200, Philippe Mathieu-Daudé wrote:
>On 7/1/21 9:48 PM, Connor Kuehl wrote:
>> On 6/30/21 7:01 AM, Federico Vaga wrote:
>>> Hello,
>>>
>>> I can't find this information on the website, so here I am.
>>>
>>> I developed a QEMU device that virtualises a PCI card that we widely use at CERN.
>
>What kind of device is it? You might be surprise to see later someone
>else interested in what your specific device does and reuse part of it.

It's really specific to our particle accelerators facility. This card receives
packets over a custom network, which payloads contain information about the
accelerator "setup", or synchronization information.

>Is the datasheet/documentation public?
>
>Can you provide test? (so it doesn't bitrot while we do code changes
>unrelated to your device code)

Ideally, with some work, yes.

>>> But this card is only used at CERN.
>>>
>>> Clearly, having CERN specific devices in QEMU does not help much the qemu
>>> community, hence I maintain an internal QEMU fork.
>>>
>>> But, I was wondering what is the QEMU policy about contributions that are known to be
>>> used only by a handful of people (one organization in this case)? Are they accepted?
>>
>> Your first instinct is correct that it's unlikely that the community
>> will be able to maintain a device if it's really so niche as to only
>> be used at your organization.
>>
>> However, if you do decide to try to upstream it, it could only help
>> your chances if you or some of your colleagues agreed to maintain it
>> for the QEMU community. This mainly involves adding an entry to the
>> MAINTAINERS file where, if accepted, the expectation is that you'll
>> be reachable within reason to review patches, make pull requests,
>> help discuss bugs in the subsystem, etc.
>
>As Connor said (although you probably won't have to worry about
>pull request burden, other will help you while you ramp up).
>Beside, code only usable by you shouldn't have a lot of traffic,
>so maintenance shouldn't take too much.

I could try to submit it, at least to get a review. Then, for us it's not a
problem to apply a patch on to of QEMU to have our virtual device.

