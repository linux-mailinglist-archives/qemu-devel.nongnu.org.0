Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB092307F5C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 21:17:32 +0100 (CET)
Received: from localhost ([::1]:60034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5DjO-0005v3-44
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 15:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5DgE-000438-2A; Thu, 28 Jan 2021 15:14:14 -0500
Received: from mail-eopbgr140095.outbound.protection.outlook.com
 ([40.107.14.95]:64999 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5Dg7-0002UX-Al; Thu, 28 Jan 2021 15:14:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+jzVPZ0jYB/FlQwCGbphZ/CrkIfF+4cZQSjHSaBx6r0VJjZw2Cvt0HvPJUsrsCtERV52FH/dq6Xnl6YKScbhn3OGU43kddi9x4R+DlRe4dS/GppyaJnLGWt2sQ+SkwxMDvSKhbs9g8quupP40Fja1XugPLyLaNvUpP5TApUw0l9EHYl7YQB7364S0WbYzabmnCKBAFqdx/TY3LjMlyEBnfgpEaapRvXevscJv0R4vNvqDi4zK3zPlDx7iwPX1iZl4msnX5dJnOuVqeiaXO+e8B2jr4yP0k7f5pEXGPaeslWbOquj8sy+e3FQCHQX4Xda4JjydR5HHE9xN9M0ACJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sb5CeOkgt+M9L4JIKubFT9B0dwHc+T2FrBgyRGkc9pY=;
 b=Y8Os7Efe0ZancN+a3TuGre19gG5eN1gU7KRo85m2biujR22cgUXhj52zHjwOC2L4oGXyGwGtmA25eGR4yUGwvgNVqAnmRZC9eMDRUXRRAuCtxh42B92MAl5ztacHZqz3BkvY2HDtciRbxawCVh68ALb93bYr+qRrJoqO03SgtB60aWFCsB741XPmDZsv68Jph6I9NQyLxc5hK0iX1kXqtP9jhPjv3gOM1iQakxtzXSZrc6A/wiG67tS7DfEnQWKH1tlM7UsAg9+BlMnm1i1Jfp5RCqEn2xiStNCLPy1K7RUwo67ulDpzT1GsFI07PFDIjeZwF4StFRv0VRN7RfmcBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sb5CeOkgt+M9L4JIKubFT9B0dwHc+T2FrBgyRGkc9pY=;
 b=PGHVVElkBvrvIyRzY2RdNyUA4yWgqe1Gs7NY45PvK441nOCDI9Q5Jdy7dg4WLVyqHHxLsxmSCrpHwLRp6PSGAhwwZmOGU5i82EbcgA2OocwN19fpU15GzQ73WboVSjMptu1RuGRoSCnOUW+eIyYFrpEIRFf0PIMKAYD0R+K/ycA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4406.eurprd08.prod.outlook.com (2603:10a6:20b:71::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Thu, 28 Jan
 2021 20:14:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 20:14:01 +0000
Subject: Re: [PULL 0/8] Block layer patches
To: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>
References: <20210127195753.59773-1-kwolf@redhat.com>
 <CAFEAcA_3Tcyx5WJazSx2kMxaipAm8B4t2nivKoyVwr53Yd-iDw@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9d874f5d-3d2c-067f-b3e4-55cddc48a670@virtuozzo.com>
Date: Thu, 28 Jan 2021 23:13:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <CAFEAcA_3Tcyx5WJazSx2kMxaipAm8B4t2nivKoyVwr53Yd-iDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.105]
X-ClientProxiedBy: AM0PR02CA0108.eurprd02.prod.outlook.com
 (2603:10a6:208:154::49) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.105) by
 AM0PR02CA0108.eurprd02.prod.outlook.com (2603:10a6:208:154::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend
 Transport; Thu, 28 Jan 2021 20:14:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcaecba8-1f8c-473b-d101-08d8c3c94093
X-MS-TrafficTypeDiagnostic: AM6PR08MB4406:
X-Microsoft-Antispam-PRVS: <AM6PR08MB44063F3385BA72713F2A40F4C1BA9@AM6PR08MB4406.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dn776NVRvof4aurUnS6Dn8ks+0SFxu8dPLdKuiNARQ8yvXLDPXV6dU4rAHh+lDMFR/3lQoQBVvlnpXynvZSguCmj2A5DHUD/5B/YS+4DdWNldiF6w5eKspWrM3kljBPpKYE2nXGu1W/b08FwCzqoj7AK9Xsxgcy/PfvxFTtSvfwMfIzKSPr8FGZVclAAltiQq/Yp+8K68YFyvae/pwsRBhn8b1Cvupb3SUCUYjSerQu33dIvwSCTxsO1bd+q0KYfNpJ7Qjag6bNmu5zLUyvxwzhh9D7gkcmz7nemGzy9cLlck2vuv7l/zv4QWQJUGso5iaAtpIlXWI5oFuiBVnmffEEryolUHx66LYEaYdl7BPNnbmhrbLlYlp2H7jcRXiOgQnpPOTF+AT3igsKQ0H3neAYna0QZRz9pzF4kt57ajvUEXvwpUWhVlbhZ2JWDVbfUd/PiroDpU3ynoHnohEZCPlTNuaJuE4LjtzRB0/MPXu0UxM42spNNuLicK1EzXIvtL64cMzvNlFC3vRD0OL2T88+7UF99T33i9IG6uuoKDEObBfScFywpjslW3XYD4CAHC1ndGagq/5nDI7BqTkFkYagmAaB0B0y2unm1eBpbb7o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(396003)(346002)(136003)(376002)(6486002)(316002)(83380400001)(16526019)(54906003)(86362001)(36756003)(8676002)(52116002)(8936002)(186003)(4326008)(66556008)(2906002)(66946007)(16576012)(956004)(66476007)(2616005)(5660300002)(31696002)(478600001)(31686004)(110136005)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aithL0hqUC80eVFYbU5LTWFZLzJoNG9VNVBnLzhRTDVIazVGM1NSWGtacm1C?=
 =?utf-8?B?bjBDbFpxNHV6OGFmRC8wMmhNSEs4Uy93SFhoZXpydE4ybE5pMTdpR29mNzk1?=
 =?utf-8?B?akZQWDNibDJrck1KSGR3TWFud0p4Y2F4WGd6d3E5SFNWZk9LNDdVT0h1UHMx?=
 =?utf-8?B?b2VNT0NVNXRqK0VYdmF4M1o3L1pIQWxHTXVMZ1Y3TmoxYjBEL1o4NVkzZFJM?=
 =?utf-8?B?SmxCOUVrQkVWRlk1N1FWZXZTZldGQzNOV3FWZDJwdHY0NDZJTDl1UjR5K1p0?=
 =?utf-8?B?TWpHYXFEdFI1eWJGMnNNdmVEaXNVN3dadDcwZnNCQVBzcm9HRlZST3RzQWZU?=
 =?utf-8?B?U3VmeVY4TDhjTzRmQ0w0N29MWGtPblpadFFzUGxBSGxhZnFVMFNONDV4TTVP?=
 =?utf-8?B?bXRCU0g0dkoreGFLb1hKUnN3OWpnZ0dHUzNOeWhFcXY4dTdNS2xWUFpOZGcw?=
 =?utf-8?B?ZUd1SEtDdmV1UHJKTWpqbDNNODFUSFZNRWNjUENTMTZvNUEvU2JHaTlpQkVn?=
 =?utf-8?B?Z05MelJBRUY5OHJYVzE1c0VpNUc1N3JLNUZmSzNnZnRJWmJGbk9wNlV1N3Fr?=
 =?utf-8?B?OE5pUDdGNGl1UEJHRE1KWVVXcjlraWZFL1VTSXNzQzIrMUJ6clBHNGhzaFQv?=
 =?utf-8?B?cFpoRXNMZjFNS2VDUWdUMTY1YklnaXdXOVgzN0wrUXJCN1pHbVpMYWNMZjNZ?=
 =?utf-8?B?NUFLZCt6RWozN3oxNklJSlY0VXNyWk1tdVk3SVhhYWUvVk45NEh4QmErUVZw?=
 =?utf-8?B?Nm5BODNCc0FGc3hVSnJOa0NyL0ljS09kY05RL1VmSkxGdmVNK2F5c0paWkFK?=
 =?utf-8?B?K3dKRFhkd0h6dWRiMHpPeTVUMWFrN205Um55RUxHNGwxanB4RDR1bDZwQVNu?=
 =?utf-8?B?STBGN3dyemJBUDllcjVQZjJSdVM1L1ZPQ0NRSHlPRmJJSWNPT0ZUQmRCNkk4?=
 =?utf-8?B?Rm15Q3RQSXp2T3J2ak1jY01XWXJmbXlmcmtybm82WmtBTXNDWllaR1pHSlUw?=
 =?utf-8?B?Z1BMQTNXRGdKQ1o5a3AycXBGNktQbmt0WXhDTE1IR1ZKNXhacXNCb3pSNUpP?=
 =?utf-8?B?OXFxclVTK05BWWpCLzlxNXdqNENYT2gwSVM2aTQvYS9mMm5IQmx4cDhSUkoz?=
 =?utf-8?B?ditXVlJSRzVUVjNLWEgyWGZEdGRPTWg2Mys4ZGNtSVhTajhsQmQ3cnNVVmhz?=
 =?utf-8?B?NjR3TGNGM0FzQmo2MlM3NE5QTWxhbFNhUXJ1cEhmMmFSR3Mrc2hNRk1lQjF0?=
 =?utf-8?B?eEJiZVpHUjNCTzN6Q3diRmU5ekpVd1lBVVVicmFWTWJjcTFWeUJpeUhGS1R3?=
 =?utf-8?B?MFBDM1dRTDFtVHhKb2NCWlkvcHlRdEYreTBlRzh5eUQwTStDalVNYS9obnJ1?=
 =?utf-8?B?UkJMSWpKNlVYa0RLbHArREJFcGNrdGxkbUZQelp4d1pPNEZjYXpvekZobjNo?=
 =?utf-8?Q?5j9IfdeT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcaecba8-1f8c-473b-d101-08d8c3c94093
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 20:14:01.3999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QMMPTys3YT2jd9VisP7VVMMREbvAba+Y9CG95aTlZlOPTBkhYz0VdbaYJA8ftDV0BfFqGqrh6M1p4YNJlwFUsgTQVMqhrlyS4Rw78UK0Ax0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4406
Received-SPF: pass client-ip=40.107.14.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

28.01.2021 21:19, Peter Maydell wrote:
> On Wed, 27 Jan 2021 at 19:58, Kevin Wolf <kwolf@redhat.com> wrote:
>>
>> The following changes since commit bf159f0bdc7b8e7aa8342dedb3829ca744c1b612:
>>
>>    Merge remote-tracking branch 'remotes/edgar/tags/edgar/xilinx-next-2021-01-27.for-upstream' into staging (2021-01-27 17:40:25 +0000)
>>
>> are available in the Git repository at:
>>
>>    git://repo.or.cz/qemu/kevin.git tags/for-upstream
>>
>> for you to fetch changes up to a44be0334beae3a9affb4a3a92cc6852993d7a84:
>>
>>    iotests: rename and move 169 and 199 tests (2021-01-27 20:53:14 +0100)
>>
>> ----------------------------------------------------------------
>> Block layer patches:
>>
>> - Fix crash on write to read-only devices
>> - iotests: Rewrite 'check' in Python, get rid of 'groups' and allow
>>    non-numeric test case names
>>
>> ----------------------------------------------------------------
> 
> I somehow failed to notice before applying this, but this
> breaks 'make check' on the netbsd and freebsd VMs.
> 
> As usual the build log is pretty opaque, but this looks like the
> probable culprit:
> 
> env: python3: No such file or directory
> gmake: *** [/home/qemu/qemu-test.nU2bcG/src/tests/Makefile.include:144:
> check-block] Error 1
> 
> The python in the netbsd VM is /usr/pkg/bin/python3.7. Something
> seems to be ignoring the --python= passed into our configure
> and assuming that "python3" is always a valid executable.
> 

Seems, that's shows that the fact that "PYTHON" variable in check-block.sh works for me doesn't mean that it works everywhere.. My fault, I look closer tomorrow.

-- 
Best regards,
Vladimir

