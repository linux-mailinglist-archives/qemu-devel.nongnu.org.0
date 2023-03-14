Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4FA6B8D28
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 09:23:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbzuJ-0007Q2-J4; Tue, 14 Mar 2023 04:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Luis.Machado@arm.com>)
 id 1pbzuG-0007Pk-ME
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 04:21:16 -0400
Received: from mail-dbaeur03on20623.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::623]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Luis.Machado@arm.com>)
 id 1pbzuD-0000ZS-UF
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 04:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbdFQo9yJtFxvJpBjlOGRWMXk264mj9qiFMtEMk1wSs=;
 b=XMIhntRUvGyn2WkU6EILzsAp9Dct+VljIuB2r9URqntg59+awD+9EwEod1kr6RscxsPZZa7ucqvaPm4+olxaqWV56UhbNlV/tbDCHonNZm7Qd/ufKQcN4VcZZkzT7jZ5QJBBGy3xRylKGSoKu6nZKW20ZIhbD+zVj8KBQ+KWg1k=
Received: from AS9PR06CA0716.eurprd06.prod.outlook.com (2603:10a6:20b:49f::24)
 by AS2PR08MB9000.eurprd08.prod.outlook.com (2603:10a6:20b:5fd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 08:21:03 +0000
Received: from VI1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49f:cafe::51) by AS9PR06CA0716.outlook.office365.com
 (2603:10a6:20b:49f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26 via Frontend
 Transport; Tue, 14 Mar 2023 08:21:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT015.mail.protection.outlook.com (100.127.144.121) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Tue, 14 Mar 2023 08:21:02 +0000
Received: ("Tessian outbound 55ffa3012b8f:v135");
 Tue, 14 Mar 2023 08:21:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e7706b54be3aaf0f
X-CR-MTA-TID: 64aa7808
Received: from f1c1049ab13d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CF4BD91B-065C-4C59-A53C-2860C10B0823.1; 
 Tue, 14 Mar 2023 08:20:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f1c1049ab13d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 14 Mar 2023 08:20:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaftB+Vts3p/3KrXEq6SHQEz9b1quwOmj/L+KteG6lJBftjWFd9c/ngwMbBx/QXu6bGaERZ6n73bUjMDa4o9SCVROPsTfvyKFEcrfptn95DVVC/jFUxWtaclA7Rmr1+z6kJeFpB4OCdUK9O36Hq+OH69XzWEAnP2ravvjYlr48JwP4IHoEHt2RveJKVUmfifW0htzIm/mVhxGnn12GdjmU2VYo5lgZGTqYZznGC38VcEs1WdXatxCsMBpZ6FgVhUesC6284KTTRFGV0q96x/KM4tAhBF2zHC5xcQEX1gZx/2yZQh2JoUBVG5NCnE/MPhBDUWVSh61y7TpE0RioUNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbdFQo9yJtFxvJpBjlOGRWMXk264mj9qiFMtEMk1wSs=;
 b=O2rmAEl+1Dl8Qds2b0gh3nuXdspyCDm+NvQ/FgrBE8+Lv8A/OrHAj5nULjJ6w3ReQ5bbLvYtdMwcfD2hh6026g/XEEQ/UftkEidr0zsgKcny/IPrAjp/hSC+IpON2YbSxdyuL89rCNMh1VDhp42Zr4cbiv6uSkrT+/k8K5IU6OaZphwjvQnKL2TNfqZQgbRkxVML2yTRiF2LV0L+YkwZxTyVHHwJCtHSvuxe86Nne9pSSH5k7OzX8NRDbBZDgKIOIsyv7ds4lO0ra4bZQnJcTDtsWRgHebvqVhSWwmLkYY6t5kcUN3GAZyaDCnTpxZiN2UYCo5Lk0gHTgVE840qpvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbdFQo9yJtFxvJpBjlOGRWMXk264mj9qiFMtEMk1wSs=;
 b=XMIhntRUvGyn2WkU6EILzsAp9Dct+VljIuB2r9URqntg59+awD+9EwEod1kr6RscxsPZZa7ucqvaPm4+olxaqWV56UhbNlV/tbDCHonNZm7Qd/ufKQcN4VcZZkzT7jZ5QJBBGy3xRylKGSoKu6nZKW20ZIhbD+zVj8KBQ+KWg1k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com (2603:10a6:803:c4::31)
 by AS8PR08MB8468.eurprd08.prod.outlook.com (2603:10a6:20b:566::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 08:20:53 +0000
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6]) by VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6%3]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 08:20:52 +0000
Message-ID: <a777850f-0551-9b5d-2f09-0a94c9d51a63@arm.com>
Date: Tue, 14 Mar 2023 08:20:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
 <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de> <87sfeclb8o.fsf@linaro.org>
 <CAFEAcA8SFtzMAFPaE=_CJtwXDYiJQ8rDWgEE+Nx2Qz=-FjCmMA@mail.gmail.com>
 <9bb8ab52-c6ae-95a7-e6c8-64bcce166c19@arm.com>
 <29307e46-00f1-9e02-94a3-de8b4a399ada@linaro.org>
Content-Language: en-US
From: Luis Machado <luis.machado@arm.com>
In-Reply-To: <29307e46-00f1-9e02-94a3-de8b4a399ada@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SN1PR12CA0055.namprd12.prod.outlook.com
 (2603:10b6:802:20::26) To VI1PR08MB3919.eurprd08.prod.outlook.com
 (2603:10a6:803:c4::31)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI1PR08MB3919:EE_|AS8PR08MB8468:EE_|VI1EUR03FT015:EE_|AS2PR08MB9000:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f1c9ff6-23b1-457e-f5b1-08db24650cc1
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: FuxO0CoPLu/ZHtIuPxH1VzKuj55qEF6ESlEIq9AxXdZeuEhoZqCFhr0WyYEugheofoKuSt90I/WVLjHTmPObJHXkohH+MRX2lddMQeM0FMTGt7DemjvUAmUU173nVgvKA5LZoRCx+Slq8JPy0zRkvER2ngKfnmcssOwuDgB0hLLC9P8+TN7ZBg1toPHCO4TM2JoHvoDNn8NpRZbWfQt8fgA85HXkSO1j6Y8Lc+TZQuXdgvDNZYe8p/aOS/BzMdWfAQQth0cIINTQfX91cbPAnoS5vRxpKJvJit/KabwoRA+M5+08AzxJZemZVFVV501MAkNj/8xZPdHMSwJqfFh8w7pNVvkvkthv/ksf7p+KNJ2NLne+vBaTJihF+rQ1CJvzOTna/Hzes+7WoLGaXasijEcRn/5xQXozBCOz9RLIokjtYEhAdcrlXEc6Sz/J6hP6qabc75gyk9CEus+oKqoAy76nRynjSE9tf9cRa21Agu94SoQgFTerSON8UwFeE9hSr+vvVxPdhKZqh+LkOGJ3gsSdg4ogJqWQqQ6drgVXFX5xG314d8B4KXjhSYGG8zN3NrN11J5TECJXC6Ui2Dsu/J9Zjc3e3etmW0VQ1jPi6V5GjJJR9TXCP4LECWTSfx5Y8EGhwyGujKgf+yfDGA2AcTWyqdFWmgokoDfNhIKhUrHAiiG3iKOo31bJxmEa6yph1NbbvH+zFNN8peuLq5w4wi28f7Gz642WyTvdr2Uyb7I=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI1PR08MB3919.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199018)(6506007)(26005)(6512007)(6666004)(36756003)(44832011)(6486002)(38100700002)(8676002)(66476007)(66556008)(66946007)(4326008)(110136005)(478600001)(316002)(186003)(2616005)(5660300002)(53546011)(8936002)(31696002)(41300700001)(86362001)(83380400001)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8468
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VI1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d2f56eed-c9bf-4f9e-69f9-08db246505b9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EZnjzetq0WvM+rMh2ibdcgtCKdV3UTIqxUvU3uQ6lzVHNerUPH+c/4immOQOBx1AgcK/e3HFyekKfE6zcD0fv4e+JigP01x4vji1/B0c7mlOpAyPLoTIdAmH+N1QNpYgAU8YOwYTUMuvksWTVbXa+ozJs9FRUTTaHpaVuQSt0ALneElOOuWMjsplV/36DEZBaeQVFpRg6D5pMTtavo2ByDQXEr/l23d6tbeIBSuOqJ7uCuIhtI56uNxm62NupdAJHkzDsxZk2Kk3E9jA9YKsj6sAoTL4FK/3wchfaoEo7+DZ5Y7pege/IVeWFLik819MGJt5yNq8Of67sPBoCk99tF19LGdeT/wrRGM4zKIATtIT9nKi+1RrjkDIjb2QQudgw2KgA31nHxEJTbDRlWuiXRskwO0FY2k8BPN5aUHQ2tuuLukHlm7Y7UvgFEadVhcHelOtZbb84hMfIxW2sybRAxzu5JLPdk2MsFR/N3MU5HoYbabAMMWI4A48RBXkFwGfD877KQJNfc5iLYGfZ9SsuU8hDkMF/WbXqJIlhYMDCONFLZjEc5Etr7GpnQAuyK1ovap7G+JC9SkwONEAGVslgaTSbSGebuGzL23UtjJ3gFcjlNK950yf/mUI7XPau5jv2Kyxqwf+m+26ra+8zyfV5rFGoWb0uVEBrX1vIAaipnruQiz8+EXRwKKhqeW72yemPdFmGJ9LuzxkG/KzsBrvT1uhZ1BH1suI1t1pv4DQRgk=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199018)(46966006)(36840700001)(40470700004)(6486002)(2616005)(31686004)(44832011)(478600001)(83380400001)(2906002)(47076005)(336012)(5660300002)(82310400005)(36860700001)(8936002)(82740400003)(81166007)(110136005)(356005)(4326008)(8676002)(316002)(40460700003)(186003)(36756003)(70206006)(70586007)(40480700001)(86362001)(41300700001)(31696002)(6666004)(6512007)(6506007)(26005)(53546011)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 08:21:02.6298 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1c9ff6-23b1-457e-f5b1-08db24650cc1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9000
Received-SPF: pass client-ip=2a01:111:f400:fe1a::623;
 envelope-from=Luis.Machado@arm.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 3/13/23 19:21, Richard Henderson wrote:
> On 3/13/23 04:44, Luis Machado wrote:
>>> Luis: I think that rather than doing (2) with a QEMU namespace,
>>> we should define a gdb namespace for this. That makes it clear
>>> that this is still a gdb-upstream-sanctioned way of exposing
>>> the pauth registers.
>>
>> That should be fine as well, and would work to side-step the gdb 12 bug =
so it doesn't crash.
>>
>> We could name the feature "org.gnu.gdb.aarch64.pauth_v2" or somesuch, an=
d slowly stop using the original
>> "org.gnu.gdb.aarch64.pauth" feature. I can document the requirements for=
 a compliant pauth_v2.
>
> What if we leave the original two registers, pauth_[cd]mask, in org.gnu.g=
db.aarch64.pauth and move the new *_high registers into a different feature=
?  That would maximize the set of gdb version for which the original user-o=
nly support is functional.

 From what I recall from the gdb bug, I don't think that will help. gdb wil=
l detect pauth support, will add the ra_sign_state pseudo-register internal=
ly with the incorrect numbering and will also see the additional system reg=
isters from QEMU, resulting in a crash.

>
>
> r~
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

