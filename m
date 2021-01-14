Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4A52F5A90
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 07:15:13 +0100 (CET)
Received: from localhost ([::1]:47926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzvua-0005RO-4z
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 01:15:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzvtl-0004xI-W5; Thu, 14 Jan 2021 01:14:22 -0500
Received: from mail-am6eur05on2098.outbound.protection.outlook.com
 ([40.107.22.98]:7745 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzvti-0004c5-IN; Thu, 14 Jan 2021 01:14:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUK6dLCK/RISvqOLOJsqvWmJk7Mg7mThUrj2113ykaHCA/6T+37ur3Tk5d1VD1PkKf7r1vi07/8+j0bx7bPDDV5fyfD5tU+vA7nIfq0or6wv57Sf6SN6TBAz3deGTDBDgs5WIuGn7epkOLe7OFtfjNbCQqNGeOggyL2bV1SZNuA7KAFhWRrf8iM7/GZ/bQSwD+4RezvREC2QmcJlrAMbZ56yxTHrPxDhwclPplUUFtyz5njZ8t3Ts1fCJYif7QYU/hrUd9ACNpdVv/1BZOXsi7VeKwbTNbceF4P0gMfIrEX4dhNWo+c6f3/ZIYUBzAKHrwFk3Ir1VPPyDwA5bDl3lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gle3CLhkPEetEWd5UlWR9dFNqGmEj1hO4N2kxG+fgqI=;
 b=NU/UBnmMWhfzTsNuTojaq5QtG/YxL+cHFBiBJJLpot7IFNDTT7VnKayqht979Y5KlIPMtPcT0UQY1GTXM1s5VLZ2sK0mka1ohsLSE00QXEzFTKA/uR292F8PkqRDCt8MZct0Sbidl5MG3a6JyM/DeVk1r1H77w0AtJuxGbm9+oB3Bs4WvL143BPTrB+/i9v4KvFpTLArbAOQz7T+4UGQMAs0IBICpxFho6mu4U7ZXRGQS8npE1f/r3qQRAihm0IsvyTUkW9FFgk01IWtN1WxwvBgYo6kRgU9+1kYZtroOFmZtm4/sDqCVu24EgcAKgkBUfobhfAgF8nsSZGB5B2w7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gle3CLhkPEetEWd5UlWR9dFNqGmEj1hO4N2kxG+fgqI=;
 b=o7Pir/siDzPsxvNEDsc7hhob0PcLRDlZZzvho+IpN0nFYvuyQURBOeCHUvPMBfq1id3aWs7senFT8AhCrNhTkVxbsGi3R1OdO5X0mhqS/1EfFy6ip1U5FRi1lSeiroAYbqevY0D0JVXW15Ofe+VqKtJYyC2N9505moOPhWALkxo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5496.eurprd08.prod.outlook.com (2603:10a6:20b:de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 06:14:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Thu, 14 Jan 2021
 06:14:15 +0000
Subject: Re: [PATCH v6 08/11] iotests: add testenv.py
To: Kevin Wolf <kwolf@redhat.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-9-vsementsov@virtuozzo.com>
 <20210112173626.GC6075@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <186c6a87-9abb-a6ae-1555-e7395573c674@virtuozzo.com>
Date: Thu, 14 Jan 2021 09:14:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210112173626.GC6075@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR03CA0080.eurprd03.prod.outlook.com
 (2603:10a6:208:69::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR03CA0080.eurprd03.prod.outlook.com (2603:10a6:208:69::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 06:14:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1169bd48-f8ff-416c-b82e-08d8b8539e44
X-MS-TrafficTypeDiagnostic: AM7PR08MB5496:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5496F08E6F8666A41BAC563EC1A80@AM7PR08MB5496.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pwtatvstQVwyGQg8CwupHl+9EqlLuwZTn2sD+Y1Cmv1GR9vAp2OaqNpphQ05Wl8YeF2ot8zz5VKxUlYnQtbncb8HMFrgQ5Pd3sWqLLLpaLfJN7eoY66wXA/IlLqRK3C0VRUZshme1GezDF7EhZlWFO33HeY4/UCkPqiHILpKK40i4wMB8rDdR1zFS48syCfLMCVVbfAYsqYD9xpj4Umq7pft7r5P13JoPIRGSkCapafzUajlc7mmgMRlWoKSwIRcGPlVLAnodRiI/atJMPBE4A6SAw9ecfg3Eic+SE9AEQBdO7Ygow8bLthz+/18YfaMquHpCcGuccZvpmr3LQb2Dyj/LleC29w15fyKNx2Om1IzrsVR8SfzsY/yiREWVVMFuoXa2DedmlXgwqTF7YKqwtInj9+3GlN4K1bb8/GXJmERdClBtlP88mGsY9CoXhlxQaaUy1e/Lzbip0AEGtvM9zXNP/dSUPwdQOM6Mx/kduk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39840400004)(376002)(366004)(346002)(8676002)(31696002)(956004)(36756003)(478600001)(66556008)(6916009)(26005)(8936002)(2616005)(6486002)(66476007)(86362001)(31686004)(16526019)(2906002)(5660300002)(4326008)(16576012)(316002)(52116002)(186003)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VHRlZHB6MGw3UHdUa1ZWK1FkMGdhNk1NcGQ1b0FWb3QvdmxidGNqUklScFNL?=
 =?utf-8?B?RFBKZGdvdzJxd2JwZXp3K2tKaGc1dUVQWEVsLzFnb2FKUUlQYXFVSFRORnBE?=
 =?utf-8?B?RGJZeXBQRUhiZTZiSWNuQ2FEdHpmdWF3cm5Da0ZabTBwc1NtZnpqcE05SHNq?=
 =?utf-8?B?OVJvZkxoTXRCZ0JOTDFzbnZ2TnI0b3dnOWgwSHVsZmJTRjRnNStDSUxzZDFN?=
 =?utf-8?B?cnBaSEVCaVorWDJWNHhpT0dEamREVFFSQm1wcXdlNWhpVGhTT1FqcEJFOEt6?=
 =?utf-8?B?T2h6L05RYThkeDQwK0NOVG1lQXM4QjNtbUt5anBva1NHbW5GdmM2NDg2M25X?=
 =?utf-8?B?c3d2b3hESk5XZlJHYjd1eVFPUkNIQTUrYUNxT1BTc1R0eHpwd2pzWkJ5bDUy?=
 =?utf-8?B?alNDWjZGeW5yMnhzUXNKWkhhajlvM3BYK1I2OXNtVDd5MHM1SkIyK3JtVHV6?=
 =?utf-8?B?SS9RYS8yRmtabWkwbTkrcHdJcmQ2OExYL3JId1hnU0FHUHFZUFV3SVo0Rkpt?=
 =?utf-8?B?N3FMV2ZsNi9oZ2lXRHdtdm5mU3V5NVFkbHo4NUI5a3h3NjhhUTFlbkJBb1l3?=
 =?utf-8?B?SEJlMjFxM052d1paNGNndWhVeEV3Tk5SWjE1R0QrMEtNa2RoYlFnak9MWnNN?=
 =?utf-8?B?VmZRckJ3UEViR1RKNGFrQmVDUXpJcDAyY1B2NFQwT212cW9sM3ZIMS9zbHhL?=
 =?utf-8?B?NjQySW5QcWtRMGlrZGlzeS9hTDJqTGFBWGNaS2VoWnN0Uml2ejFEQm9tNU8v?=
 =?utf-8?B?WThhVW5BVEppdTZuNGdhQzhBYnNrZ09aOHhsemZzeUwzS1hWWVRBbGVlbnRC?=
 =?utf-8?B?dlFidHZKRFppODF5QkpiZXJmOHV1T1lhQU84Y0NLUnUxdjZBTU1CT2U0SDlv?=
 =?utf-8?B?RWIrMlU1bGcwR2l4cWwyV29na2p6TnFkVytCRXowQVhNeWhtN3BsbGlGdnA1?=
 =?utf-8?B?eUlvOE9CQ0lDcGE5aTJQaFZOK1c3VWF5Ry8zbDQ4YjRuL3ExVng3VVFNR2lH?=
 =?utf-8?B?ZUlGczlZL1BsS0Q5ajJVdUVBOUkwK3h2ZTNvWHM1Z3lCOXFpZDhrcVdSU1Vs?=
 =?utf-8?B?MUxVMTNHT3RuM3d3b1ZYcldzNzFTWW8yNTNhZTFIWXgrV0MyeVJzZ3hoTXJS?=
 =?utf-8?B?SDlRUnlyTTI0cHhDb1UrVThLVS9nZW1FZGp3Sm9zK2Q0NklyTzJHeDhtaXhV?=
 =?utf-8?B?b3RORzVJUEo2dXlUUXFuV29ORUdENnRYUXpGdWZtS1crTzlqeDRINHNVNlBG?=
 =?utf-8?B?MDRWVzFWM2Z2bzNiTjhRN2N6VkxDTXRLdDNQQmM0MkFjcm1XR1pxOE8zU1Vu?=
 =?utf-8?Q?VoohzYA5vjfMTfSgrBOqDA5I0F8MDoFJip?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 06:14:14.9124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 1169bd48-f8ff-416c-b82e-08d8b8539e44
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+iDx3s6nFOZ+iRqf2uCdvx6AeCnakpB27SG5agvtHBsVKl+N1s1uJ3v+rkz25li6ZlU9CLRyXcGL4oCCNWMYX670ZLu4u7NnCIvx996bKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5496
Received-SPF: pass client-ip=40.107.22.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

12.01.2021 20:36, Kevin Wolf wrote:
> Am 09.01.2021 um 13:26 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Add TestEnv class, which will handle test environment in a new python
>> iotests running framework.
>>
>> Difference with current ./check interface:
>> - -v (verbose) option dropped, as it is unused
>>
>> - -xdiff option is dropped, until somebody complains that it is needed
>> - same for -n option
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> +************* Module testenv
> +testenv.py:48:0: R0902: Too many instance attributes (34/7) (too-many-instance-attributes)
> +testenv.py:212:16: R1722: Consider using sys.exit() (consider-using-sys-exit)
> +testenv.py:214:16: R1722: Consider using sys.exit() (consider-using-sys-exit)
> +testenv.py:324:8: R1722: Consider using sys.exit() (consider-using-sys-exit)
> +testenv.py:1:0: R0801: Similar lines in 2 files
> +==findtests:45
> +==testenv:72
> +    _argparser = None
> +    @classmethod
> +    def get_argparser(cls) -> argparse.ArgumentParser:
> +        if cls._argparser is not None:
> +            return cls._argparser
> + (duplicate-code)
> +testenv.py:294: error: Function is missing a type annotation for one or more arguments

Interesting, I don't see "similar lines" error in the output..

[root@kvm qemu-iotests]# pylint-3 --score=n findtests.py testenv.py
************* Module testenv
testenv.py:48:0: R0902: Too many instance attributes (34/7) (too-many-instance-attributes)
testenv.py:212:16: R1722: Consider using sys.exit() (consider-using-sys-exit)
testenv.py:214:16: R1722: Consider using sys.exit() (consider-using-sys-exit)
testenv.py:324:8: R1722: Consider using sys.exit() (consider-using-sys-exit)
[root@kvm qemu-iotests]# pylint --score=n findtests.py testenv.py
************* Module testenv
testenv.py:48:0: R0902: Too many instance attributes (34/7) (too-many-instance-attributes)
testenv.py:212:16: R1722: Consider using sys.exit() (consider-using-sys-exit)
testenv.py:214:16: R1722: Consider using sys.exit() (consider-using-sys-exit)
testenv.py:324:8: R1722: Consider using sys.exit() (consider-using-sys-exit)
[root@kvm qemu-iotests]# pylint-3 --version
pylint 2.6.0
astroid 2.4.2
Python 3.9.1 (default, Dec  8 2020, 00:00:00)
[GCC 10.2.1 20201125 (Red Hat 10.2.1-9)]
[root@kvm qemu-iotests]# pylint --version
pylint 2.6.0
astroid 2.4.2
Python 3.9.1 (default, Dec  8 2020, 00:00:00)
[GCC 10.2.1 20201125 (Red Hat 10.2.1-9)]
[root@kvm qemu-iotests]# which pylint-3
/usr/bin/pylint-3
[root@kvm qemu-iotests]# rpm -qf /usr/bin/pylint-3
python3-pylint-2.6.0-2.fc33.noarch

> 
> I wonder whether we should just disable the "similar lines" check? The
> instance attributes one looks kind of arbitrary, too. The rest looks
> valid enough.
> 
> Kevin
> 


-- 
Best regards,
Vladimir

