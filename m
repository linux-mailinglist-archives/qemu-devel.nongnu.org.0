Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1158333CC7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 13:43:15 +0100 (CET)
Received: from localhost ([::1]:59832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJyBG-0005Ll-OF
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 07:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lJy9M-0004HG-C4; Wed, 10 Mar 2021 07:41:16 -0500
Received: from mail-vi1eur05on2118.outbound.protection.outlook.com
 ([40.107.21.118]:20288 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lJy9C-0004UZ-4U; Wed, 10 Mar 2021 07:41:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDieOYuyr1qftF9q0sglwvu7XV5Segr+60ZOsCV0Ccz34i8NjDettL0XhTjD5cHULSp0QgZiA4psfFlSXZeT3tyfLb/Q27odoNtRP6YQ7eVWMjYDU2C/nSGZKZY5oyzijsq52lDNDvEdErGFZTp3hJsTqiIG7cAcrtu+w/SNH4dxthh58pwHdUpHujC4/9Cl3KMwLhCkBh3/hPpDHyO60pTxkYfIc+zreKB87iNWP8U1QgEJDFcnhyalTIxRKNZ7zRrHIVHks5zx0OamWJejESyyQXEeoKcfCLcuC6FYUn8eCSzWpkueca+rN6GyEXdx9vZe0PZ7NDswn/s4cMg6ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9A3sagKHGp80DPRixVKM5Qhk4+G387/S7sD8HZCbLGc=;
 b=gSq3XvJGAJ1+zg/NjZkd5uJxfP6LXz6oH8ErdVI2Kmy3yXSaQCi5SnWgvKTnVxdkediW1zohmcIJTmGaeGFo84emPK9VhZ7se+fhYkL4l3sJYE/tIJnAv+lNvGH8WI2OpGy8fslIRxEq2GO+gBwJ182mKZfIcZSW5fE2uUCO0ZTlSf1xVfVOS26TSqYkF64Jtq4ssJfqfbEzMmAvTw8gqSGLORsZjsvPNKn2PF04NuOCvwCvCY5XYAIyDPxJMs6ExBmx/hZEC/XRDrqqBkXTWnorL9wvezey1W7OqKTne5hObcRZGBIa+PpLsrR16MpSvdKGMA+GPFVbGPNBSxtjBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9A3sagKHGp80DPRixVKM5Qhk4+G387/S7sD8HZCbLGc=;
 b=Q8O+I4xVNITOg4Lay9tLy4F6nzCZ6z2g2+rYaXokWFuOAQNp8Lx1Y8AzncBfzjv9syJ5590uyNM9SgN2/1+O6CTbXs6jli+3dhLB3ylPCBl2myEcqc4qUi8nseyeq4Y/7IaWfDvqso+kk5kdh38OwC8P/WA8H2WjPDZtCpiQTTI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4343.eurprd08.prod.outlook.com (2603:10a6:20b:ba::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Wed, 10 Mar
 2021 12:41:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.027; Wed, 10 Mar 2021
 12:41:01 +0000
Subject: Re: [PATCH 3/3] docs/secure-coding-practices: Describe
 null-co/zeroes-co block drivers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Prasad J Pandit <ppandit@redhat.com>,
 Bandan Das <bsd@redhat.com>
References: <20210310114314.1068957-1-philmd@redhat.com>
 <20210310114314.1068957-4-philmd@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <42d495fc-c16c-3a8b-40e5-efd24a0f8251@virtuozzo.com>
Date: Wed, 10 Mar 2021 15:40:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210310114314.1068957-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR01CA0101.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::42) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR01CA0101.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Wed, 10 Mar 2021 12:41:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1a3b633-dec9-4acb-b036-08d8e3c1c2fa
X-MS-TrafficTypeDiagnostic: AM6PR08MB4343:
X-Microsoft-Antispam-PRVS: <AM6PR08MB43438BD71925EFB449ECAF2DC1919@AM6PR08MB4343.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h0rTXDqhoVgITuDmz2/VRKEAvRhbo8pDHmRI+RzkmaJWAtkbWN/zRvHmnVeSqLiahEBMw8iq9fv/SNMPdEcR8sDbq26HzzDpDV6RdNg93A4MnOhw8OTndGeDow2cbjrdW4Ahr+epiA9fQcU0b2AminRFU1QE47vR+kHx9Jl4M24Vkf6ap4q+1VNeMCWcsP1et4Ops+kadhgXtLjQJvyF5jEACATfSeaQTy4sRRX9r4jaMKoypJvyAbYkYcB89CgBl7VCzN3wgQ+4b9J6z2eWBHRbLYzC4ebVP1iOTav9piuItC3tZdTE15doVyqhs4+A1DtGPDik3w1lYLc3hF2xjbasIkz8AJJdU4ojmHsJ51qIYJ3nPp0bf2TCBSJ3sHXCgsgoJcoiFFJQEdo+UqEv0T7b8nHdUZwEjd/Rpa3CUJl5lq2nRaQzBaCB3yuBb0WGekK/frh/90AXJAc3LTKgS+m7rApcAJMyOMEx/utfeLUTRFKJGHVwVfvSFxoTw4H/4jQOdChGz/5i4fSIQpd46kdBrYew1pkWLHCAshlPy2W+1JozLJGUPVaCBkBtv1jc5SOGMedK3bCgp/u64cC+rQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(376002)(396003)(136003)(478600001)(956004)(2616005)(52116002)(8676002)(6486002)(16526019)(8936002)(31686004)(186003)(26005)(2906002)(4326008)(316002)(5660300002)(66556008)(66946007)(66476007)(36756003)(86362001)(54906003)(83380400001)(31696002)(16576012)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TDVqelMwMVpXaGxtUjFNM0F1ZVNXTnNDVW5HTTF6aXN3eEVSbjM3U3ZMVzVR?=
 =?utf-8?B?b0hDbkhkbTdwcTdyejZHaFg2UnVsR1BkaEgzSXhieDVoWkVUaUpmaTk3OWdt?=
 =?utf-8?B?blU4ekxLbUdoSHROeXZQSHBJUmhnYjVQV01xZUFpeDFRN05zMWRaaUJnR1F2?=
 =?utf-8?B?L1Eva0dzZExPaHlTaVRpUkJhWm40czcwbmpGd21ZZGxIRGxURm84NjJVeGVk?=
 =?utf-8?B?U1FxYVdaOEJDa3RpbmVpcERyaSt0ZFI5ckRBeHRNcHdEaGExZ1g3QVBoWHBI?=
 =?utf-8?B?bDBzVjZYWEhjdEwrZmNZc0JvMlNQcDRXbXQ0bkVnVWE2VURlM1JYZElqN1pB?=
 =?utf-8?B?cmdBSVY0NURCc1FPYlZvVWsxR1hoU1lNS3RwRlJ6UnE0cU5QbkN3aUVwVDFI?=
 =?utf-8?B?TkttTkwwZDVXVUdJMU52K1hvUkwxdVJRYU5LaHVFajJYWkhPZTdRMEdSdjRB?=
 =?utf-8?B?WEtNbnVHZTVrUENVSHRmZ2hiNjFSRnZwcHZQN1IwTURhbGRHSTZST29DdXhW?=
 =?utf-8?B?MGJUVTAvUTVJY042cGZwUDJzc0J4UE13RGRwQW1kSU9hVkZ1bG1JS29qeVR5?=
 =?utf-8?B?WTRFT3dIOC9ORFRyWEROTjBJT0pJbmY3SFVJdGQ3ci9LVTVyTWpxVVVwM242?=
 =?utf-8?B?a05uSUF1dXVLWFVhYXhBZ1htSTZaQWFYOWxDNEpibGU0NVZtNUl2TWRwTnl0?=
 =?utf-8?B?N0Z1ZzQ0VFl4R05hWWtsK0E4SW5ndXkvYXBpOGRWSzBmWnFlOGsrSURWbEJy?=
 =?utf-8?B?Ris0MjhQLytNVFp3VmViSTZidkVRTWlTNUg3SWdTOUpQT0xXVkticlh5dW1F?=
 =?utf-8?B?WlVPL0doazVkaEVGNmVhaHM0ckY3THErNHpWWDVmQnFXQWk0OE5ZM00zd2Q4?=
 =?utf-8?B?NmsvVW5EcjFuNlNXZmVzb0Z1OWM0MktLTzZCRnpJajFhZTB3dGRBWEcxNlhN?=
 =?utf-8?B?N2w0eFZrYzc3UkpuM0REeHRzcEJ4Y0ttai8yR0J5bGJWbm1Zand0Wkh2Z3M0?=
 =?utf-8?B?dnFRRHhIdDFHcEZBNzVOaGhRT3JtVk1mbW41Y2crMWdLWENYaE9udURRemdn?=
 =?utf-8?B?MlFzWFBHUjFoVmEybHRjcnFLZjJhanNEczFIQnlZYWs5ZUJIU1ZKdVdzYiti?=
 =?utf-8?B?UWladXAwVi82VnR6aUgrSGhqU2Z4ZUNqdjZlMVR6Z3dVNForb1VWNWkvbzIx?=
 =?utf-8?B?UVJldzlOSFRxUHpTRGdua1dHWlFaYU5sOTY4cE9SMGU5MW5RRlhFSWpKaUgx?=
 =?utf-8?B?TnRVNS9ycFcybjNBRDNlOUM5NWVRazRGcW9qQllIc2xzbzdzeG9ZTWlENXJa?=
 =?utf-8?B?ZktCcnFZMnc4MkJFQUkxRWFiQUFlSDVlckpKZ1c4eFlWRXdGYTJzWjBxdHQ0?=
 =?utf-8?B?ODJOWDZRamxQdG5QUXpIU29RTzRGcXVmWkdPTXdGdFlCU0lqKzJXTngra2RO?=
 =?utf-8?B?dHRmak9OenJXRVE0ZUVkSTRuSm9XNkE5ZlozWmM5SXdNVkxJeWxzSFppOTFm?=
 =?utf-8?B?Sk5TM0h3bnprUmJ0YWllcVpnL1hOZWJjK1BNYUpBL21iZlh6aWM1a1dlSUZw?=
 =?utf-8?B?Y29VM0FVSmpWTHFtZW93T2ZVaS94ZnU5K29peU9ibkJFRm1sRGhPeWZQY3I1?=
 =?utf-8?B?Zm03clI2VlE2eEZoWmtNQXpEcWlOUWVIWUFlRWp0am5hSnlEMkdBYVdtYmpv?=
 =?utf-8?B?WGk1SFBXRkk5UUNhYzRDTmg5bGdteVVTN2dJR21Lc0xkV3B0VGRtcU9udzBE?=
 =?utf-8?Q?hqMbyknygF4chTDiDyz8aRTN4PIivG8HWrmPzXo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a3b633-dec9-4acb-b036-08d8e3c1c2fa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 12:41:01.5015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tj3+7CCyZFzE4Ibtii9Ar1IPTsYQ648x7uAh/RmcxpG58e2wmJVaWdkyU93n/k+YjP2eVLmT1ZFmtJSdB9qCeWjqs05qfGISAXdbwc/0hfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4343
Received-SPF: pass client-ip=40.107.21.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

10.03.2021 14:43, Philippe Mathieu-Daudé wrote:
> Document that security reports must not use the 'null-co' block
> driver, as it leaves memory uninitialized on purposed (this is
> a performance feature).
> Reports must be send using the 'zeroes-co' driver.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   docs/devel/secure-coding-practices.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/docs/devel/secure-coding-practices.rst b/docs/devel/secure-coding-practices.rst
> index cbfc8af67e6..64d61085804 100644
> --- a/docs/devel/secure-coding-practices.rst
> +++ b/docs/devel/secure-coding-practices.rst
> @@ -104,3 +104,10 @@ structures and only process the local copy.  This prevents
>   time-of-check-to-time-of-use (TOCTOU) race conditions that could cause QEMU to
>   crash when a vCPU thread modifies guest RAM while device emulation is
>   processing it.
> +
> +Use of null-co / zeroes-co block drivers
> +----------------------------------------
> +
> +When reporting security issues, the null-co block driver must not be used,
> +as it is designed for performance and its read accesses are not initialized.
> +The zeroes-co block driver must be used instead.
> 

How much it differs from just document that when reporting security issues the null-co block driver must be used with read-zeroes=true?

-- 
Best regards,
Vladimir

