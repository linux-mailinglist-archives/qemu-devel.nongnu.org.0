Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FC52AD09D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 08:46:34 +0100 (CET)
Received: from localhost ([::1]:41522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcOMJ-0003D4-OJ
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 02:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kcOL0-0002f0-Ul
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 02:45:10 -0500
Received: from mail-eopbgr50128.outbound.protection.outlook.com
 ([40.107.5.128]:25347 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kcOKu-00087Z-Me
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 02:45:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQieac2CChkw4iHox2IK9Ilfl9bxHCmbjWgCKkg2w833ANWf42W6QD+rA0MhJ1GQBUgR6FYQdQh8XYU1gmZTpUFuTaqM8HZe9Lh0KvKiI06ShBTnRluufFtnNw1GIiI3wrP/UxXNXJC67Y096gpn13Nvx3Cy+XbVZ1nycY8RhVoOZ8vx26dpKy1Ei2Y+keQ4NN6AWwgwk2/fiv1u1sblAEZl92uvf8Y0uHFVrh/aSFAhLB7U610mX8bp24qrVAZBDiecH0cxqjrAMNrtz2XYVw503iFWDTqnhoscswNF9tXs1CSxwm7xN2RaspeSHBMXS8kOPnLjY1NenMByJLnVig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDDqK3JhA/N0TNohmxUBlwb0wwkxfZjFQ30Ahh3VyBY=;
 b=QzpclCbUoKM8GcErnp2YlwnfgA3oN6NuHehaUoKma+elK9UJ/zYXF31VVR2JWIGq8pddc+Lcmd58S/H6XABZ1dv6rBfVMbtcxbckq2EXmEZj7wFYGvHLGR2rZlsgs3qx9Lo2PFeX67eKZ3qOR6wdo7Vg37scyITnP5moSceaM8U3gBC8t8G/LMdalbMSEpIyTGZP1mOWmuf5HDNiSS7bAMWSVAOofxtsqb/OAYi4d4xwuilpc5bWneqRZwrlgMNx/YspE1kYDqEMq1PRTUakje3fcSPiumi6L6xorRa9wkVM7taoXs/Ugl+opmq6sdZnY9vRVRBD0d2HpDkryUri1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDDqK3JhA/N0TNohmxUBlwb0wwkxfZjFQ30Ahh3VyBY=;
 b=oMU/zVYmIB79rIoKVqdOZ+cVNKYHnRj7dctYG185eWhsGJWNgCouWQRwqfB+FkbsGMvfkeyo/BvShBLBXzO644EWTT8NU5hZs1Y26dnusZa4lSj8H8TyIOy3dlluWIl1JfMjujqWf/GS8SkNwOfN4GqmfNdBCsS/8J8+TUXLV4M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2451.eurprd08.prod.outlook.com (2603:10a6:203:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Tue, 10 Nov
 2020 07:29:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3499.032; Tue, 10 Nov 2020
 07:29:57 +0000
Subject: Re: nbd: bitmap_to_extents() calls nbd_extent_array_add() without
 checking return value: coverity false positive?
To: Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA8keTZEW3MLky3_HKh5cu2HR1O0iBax2c0hs0qSosNYSw@mail.gmail.com>
 <9ff386a7-c334-30ed-da79-341d75ed39b2@redhat.com>
 <CAFEAcA8Po-V6+b-AVxSdwrEJ7Zy2Pm7xf8Ss4fsUtWDMG=ziQw@mail.gmail.com>
 <2c778baa-8829-4dcd-ebc2-8d6b35ca87ae@virtuozzo.com>
 <1f402e27-7044-dcda-064c-c23d4c90362a@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <399b377d-ff7f-1b2b-2e16-fce29d764950@virtuozzo.com>
Date: Tue, 10 Nov 2020 10:29:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
In-Reply-To: <1f402e27-7044-dcda-064c-c23d4c90362a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.85]
X-ClientProxiedBy: AM0PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:208:14::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.85) by
 AM0PR03CA0006.eurprd03.prod.outlook.com (2603:10a6:208:14::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 07:29:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 158c1c27-aa90-436b-ac2a-08d8854a6c79
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2451:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24512DE50DA4B3E2AF399A99C1E90@AM5PR0802MB2451.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u3UQefJUau9uj8vo+XsMSm00/xb5co2nP6wKab63Eo0v7qU1Mgw7VgpsNu735dH0/+CIeFRE9k7tvUESPkPAQ0yyBAoVgSR1XVmAT4SHTzUA0hVwoJXk85+uXKo2x5sbhSpysJoA6i57ZwJVNE/Y+AmMuwIw3boTstLW5tJGcB5iFJgjJiHFJVuPlBJQgtwmF0WxadzacZXWe+K/LTTGdzX3I3A0/KJxxcnnbJqhN/wggc39VSS6Bgg3q/FVnxNwFiF695LQRsTU8X86Mp9uKu/O+aCHAQzGmugHGmxpM/0lWSrxVhwj0jk66aYycQ/zAMip84mTbslE6+coaYAZB8VnrIwAEaVG3SKgflU6dqag2wteTFfTPR/DWjH4diSb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39840400004)(8676002)(478600001)(316002)(52116002)(26005)(2906002)(53546011)(8936002)(16576012)(31686004)(110136005)(83380400001)(186003)(4326008)(6486002)(16526019)(66476007)(66556008)(2616005)(31696002)(956004)(5660300002)(36756003)(86362001)(66946007)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: WRS0WAUFF/QsoUBSB1o5wg5kJl/E+LWpMMenVFRINCg9VgD2kelnRzDcH8+e3vB6Ils0988co61LiiJPxmwcQnJbTbNt+A8W1dTCZ4Kpcvr/uSuirrlMpvr1fWC2fsHsLugqOzkoP0SyXMJM9eZt9Iy4F6TKtGKnnaXyiRXGnPPlwIVF88hF7Gr5XkHK92f7sCMk5TVw6EXuq5MmumjQzcEmaptmyJ2SF6W18bWLDd7Gn3rtzZuIIKFkIJUAInbvAOWngo53jRagT8iEnR+bB1HDACN7J9B0pylo2pEl3xkGPbbPBWBkP+Ct5opbpDKk9g/mKNtuYTRv/5wvI2+YHY4A1l0VeAFqFtO4Pr8+O78b5qn3beNuF+x0rnBfqTiw71NNUh8EYjdGEP9NxDoWLyeqXSRj7abE6QK3wv+0yUTjJdn0UdpGqMaPNW4ydPVV+2Ehhwsxx58ieqy6QLfQ+S319OsEUrIzmBtaVqbT2TfTD1geziuBoRhW4UZegus+EDNifDSgf2HLVh9Ok9HH75iqRJIhVJHXpd9sktl7DeGx/bvJ0svj9oXABGQ6phN1S3qvf8uOCMKCK95QfEiEIKtU33H9gSVdZaxbYuipzsCdP6LVexoza9Y1uF9amcI7WuplrfvzQtMsLIV+kX53Kg==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 158c1c27-aa90-436b-ac2a-08d8854a6c79
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 07:29:57.1552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHrjFfuSlroGBWxpiLguboCue1lzkT+e08OesSFhC7r3EO8wWZPC19s4OCKNQhp+0+TCPN/oji8wez8P1+ZVgx8h1anLqvo3C58b+CLQEGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2451
Received-SPF: pass client-ip=40.107.5.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:45:01
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

09.11.2020 18:22, Eric Blake wrote:
> On 11/9/20 1:17 AM, Vladimir Sementsov-Ogievskiy wrote:
>> 07.11.2020 01:53, Peter Maydell wrote:
>>> On Fri, 6 Nov 2020 at 20:36, Eric Blake <eblake@redhat.com> wrote:
>>>>
>>>> On 11/6/20 11:22 AM, Peter Maydell wrote:
>>>>> Hi; Coverity's "you usually check the return value of this function
>>>>> but you didn't do that here" heuristic has fired on the code in
>>>>> nbd/server.c:bitmap_to_extents() -- the function nbd_extent_array_add()
>>>>> is called five times in server.c, and the return value is checked
>>>>> in four of those, but not in the final call at the end of
>>>>> bitmap_to_extents(). (CID 1436125.)
>>>>>
>>>>> Is this a false positive, or should the caller be handling an
>>>>> error here ?
>>>>
>>>> False positive, but I don't mind tweaking the code to silence Coverity.
>>>> This should do it; let me know if I should turn it into a formal patch.
>>>>
>>>> diff --git i/nbd/server.c w/nbd/server.c
>>>> index d145e1a69083..377698a2ce85 100644
>>>> --- i/nbd/server.c
>>>> +++ w/nbd/server.c
>>>> @@ -2128,9 +2128,8 @@ static void bitmap_to_extents(BdrvDirtyBitmap
>>>> *bitmap,
>>>>            }
>>>>        }
>>>>
>>>> -    if (!full) {
>>>> -        /* last non dirty extent */
>>>> -        nbd_extent_array_add(es, end - start, 0);
>>>> +    if (!full && nbd_extent_array_add(es, end - start, 0) < 0) {
>>>> +        /* last non dirty extent, not a problem if array is now full */
>>>>        }
>>>>
>>>>        bdrv_dirty_bitmap_unlock(bitmap);
>>>
>>> Hmm; that looks a little odd but I guess it's a bit more
>>> documentative of the intent. Up to you whether you want
>>> to submit it as a patch or not I guess :-)
>>>
>>> thanks
>>> -- PMM
>>>
>>
>>
>> update_refcount() in block/qcow2-refcount.c is defined as
>>
>>   static int QEMU_WARN_UNUSED_RESULT update_refcount(..);
>>
>> May be, use such specifier for nbd_extent_array_add()?
> 
> Adding that attribute would _force_ us to modify the code, rather than
> the current situation where we are mulling the modification merely to
> pacify Coverity's 4-out-of-5 analysis.  We don't strictly need to always
> use the return value (hence my declaration that this was a Coverity
> false positive), but declaring that we always want to use it, and fixing
> the code fallout, would indeed silence Coverity.
> 

Oh, I thought that this macro has the opposite meaning :\

-- 
Best regards,
Vladimir

