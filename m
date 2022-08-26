Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6B55A2908
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:04:57 +0200 (CEST)
Received: from localhost ([::1]:39528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZxA-00081n-BC
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oRZrB-0003tx-L4; Fri, 26 Aug 2022 09:58:45 -0400
Received: from mail-eopbgr60124.outbound.protection.outlook.com
 ([40.107.6.124]:38055 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oRZr8-0001UM-HC; Fri, 26 Aug 2022 09:58:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbYRW1Fj4lAFwYLGG6fEcTUR6efInJNr3ukVWQTqfAxik0gFyKajE9wZOF7I3H6Pik23F+1BoZ+3YsQ42L4ELQN5sTbzIVFoODDP6sKgmFls6Zp0IT76alD7ngB+9JhoD/63cFj2Th9YY99gBaBr/o1nYJ54x+sqBaCx+d7v0fgI+9hHj4vcFdNVcyRIIcMgd6n1BFVU6aVAh28QUm2wi+Jo1zbmCz0tYxvShaN924B8H7GM4pAZxMw+cVhmNizdGrvSS7/IxfdqXH05kO4UFHErsTD9BUmPvkaHM1IDm8gZ21b0T6IZHE3NYSyaa9WCnNz/h/d4oMmje96vvndNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOWbjp9h4RSOpamJfSep43V6xfufS3Ly0H+VVWiXDm4=;
 b=Qklpc6yWKWt5i+lbsaiKYUuW2xRbI8xhcslCMaf7EWFPvrsS+bopdIvtyxvBi++8hD3PUPt9nn3Bsj9/NMbgLCTd5Kp3jdEHSZNGyTs0GJahRFhkzt1b63tx0+de53XLMGQBjlB0ixvAATC9vqEy0P5Lpj+7qAE1rZCxJ5ssx31n6d9OYE3oYeSdDwD5i2JnbKfCRsCuyiLCJHgBMKPlFEHTlVXXPvD0f/NrUhVqnaamLDtQMkbCzDp/yGMB1eoLcNlHGeO/SYYrXZOdVETNq8WXFzha5z2Dax0IYO7mCFb72CesJd4HlfFsU3dlEv/lMGnrXFhg+FxRy8OJZMUPpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOWbjp9h4RSOpamJfSep43V6xfufS3Ly0H+VVWiXDm4=;
 b=t/Xln+lsobSjAGRUqOtdN/u0J/bgjdgbyluZaUdEln5L3U2VPSas19yf6hJI0nPSarcvS/SEKzXpPd2MihuDKnaHxvkdqihg7Q3kyGiJZm1XkMUSsLD+/2C1EZWftjx+QWhcoVutKUZxs6SXFOgYl7Z8IOYEJhfl3qp/B46EQg0IyXWqSekK2O8TMY1E/5sUKGg07GHiFT2WF3/3uNem45Lli4WaY+0G5P0nVDJWqsQe6xSh6SNllmoNmxqBs8kSTDT6a8RawBq0ieGbGxv6P0lk3ZxvBWdtwLPmNjJYrFXJGYnySAPleUacLPvKv6gxAGr4+2DMu7REMtI/NZOP2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by GVXPR08MB7821.eurprd08.prod.outlook.com (2603:10a6:150:4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 13:58:36 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 13:58:35 +0000
Message-ID: <5fbe834b-ccc2-35c1-52c8-8b8f5d4d4c70@virtuozzo.com>
Date: Fri, 26 Aug 2022 15:58:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 07/10] parallels: Move check of cluster outside image
 to a separate function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
 <20220825143109.176582-8-alexander.ivanov@virtuozzo.com>
 <894e03ab-4cbd-da6b-7f95-df1912d3f47e@virtuozzo.com>
 <3dc87536-2a35-87bb-b512-80d1df4fa2fc@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <3dc87536-2a35-87bb-b512-80d1df4fa2fc@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0501CA0029.eurprd05.prod.outlook.com
 (2603:10a6:800:60::15) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e541685e-eefd-4ad2-48f7-08da876b11e1
X-MS-TrafficTypeDiagnostic: GVXPR08MB7821:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u3rSbdAYsZcNK9xjrAIsLmWzy4ZJl7+Mjo8RP5SScQnCIb2mVaPUgpYT6xAdbnnrZTq06NO+fuVYtuMnB6nlCwshC481nuOIiQz2z0kveibu+B8I5iHdnJsra/hdXet5NzT0hYlGuGlXFaSicb1TW9xtILFRieQGeutcO3oGVLnYGJ6v2qZLK++mUaLXqYGsESnZ/0jPbyHj6if08DmZdi6Hlo0yeECOFaoi/LksivUs6sjAzqFT/qV3lDio2eazOBFiTUdh8Sb5FxCnt073leD6sISsslBWeUfCpn4GL1omxZWT6Yp84slTaaBrW5MFdDt3tZHO4qz1m9chN4zrRAOsy5RVwq6KEY1EPebr3iELbMeA4qbJtgVQf6ytyJlzypPDOaOGB7apdUJlaM5GWwpej9e4BwwXK5FK7QV9L2xglXbNcNypGisO5Kl2dNdPzNhNIxs/lxCpihEYIKM9NlTL4xaw38TKgYihGsyGCfjLqGOgblFb4hH9cp3UAc+zn528kKU6Z0KM4LJqCBPnkXGqrT0oCe3dxrOu78J7jDmkWBB+0NaxNuU/AI9ff0YQ2AaH5ncfF82DwoKCblO4MMwr7jSbweRsOA6YdpeyEJ5vE1ERMkPTA4x7v541wVokxwPyRLPs0DN44Sk5c2l4bGVQV4SdL+FMneCo8l8kcEs4FL9MNj6V6ttsa/ozka0gBZBrDu0tHj09/5/yWTvFp0cGwHtyZ2Yq/+EftOS/mQUm48IQkAB+DyU4U5C763Jxymh89x3jNnl2I4gREd13+VTMz24+Zfr+4NY5SGP7uOFInI95go9vbNddTCKuffz0ar8mXB+cWKOyuS1hCMACUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(39840400004)(346002)(136003)(376002)(26005)(6486002)(6512007)(52116002)(41300700001)(53546011)(83380400001)(2616005)(2906002)(186003)(8936002)(5660300002)(316002)(6506007)(478600001)(38350700002)(4326008)(8676002)(36756003)(31686004)(66946007)(66476007)(66556008)(38100700002)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHE3TXcvZ095dWQ0dTVHZG83QWpoMGRoZEhabmI3Mng5MENITGJ1RVVGVGRD?=
 =?utf-8?B?SnMrY3pDazVqdEdqajkzclVPVlF0dDloeFRwcjF0RnFJTjY1YjBvUGQ2SlRR?=
 =?utf-8?B?alk1QXVVZnAwWFRzUzhEVDVxekNERXBwNWJ5YlhBWTZKajBOSE15Unl1b2Vr?=
 =?utf-8?B?WkkxZ3RqSjlzMEVIbXpWSjB4V0xsaTJMVHV2aXRTcjBWNFhLWktSNGlVWDcx?=
 =?utf-8?B?V1pzdURuL1d6c1FsVVQ5VjFHVXpuZWQ2d2JwcHZSOUpIbEMrTFFFSVRaNUVT?=
 =?utf-8?B?cExsbFZ0UmR1QmNrald0Y2UwOE5ZdzJtcDVWaGpGejBUZUMrTjR1MUFmek5U?=
 =?utf-8?B?cUVPREFsbnZPS2orRHRQRGdQUWRnZ3hIOXpzbUw5QTFjTjVmNE1NTWVhMDJq?=
 =?utf-8?B?UGNOM3ZLVmVMaFdZUkxxV3RlK2dUMnB5c2x2dmVOQzZhODFUbEJobWE4VU9l?=
 =?utf-8?B?NVBnNWlDV0p4M1dJcUNzalIyc1NYYjFPVFV0TUNOeW95c0hraTQ3MURpYVVS?=
 =?utf-8?B?QWhuQ0NhdHhhVjlDRDZKKzh4MkJyU0NmRW5PUEJldERQa08zWnZwWWFXeElC?=
 =?utf-8?B?Sy92UWFmQUlRODFUZUhBWitvYnAyU1dOdWVLWnUvTDNyK0x1aGZpb2tIalVi?=
 =?utf-8?B?NVVYWHd6ZXpiSTBOTVAzLzk3anVRNWZVOEN6ejlHTHZNbWt6dWxXTXc1b3dR?=
 =?utf-8?B?Q01aQzVyUnR6QkVqaXlKbENxdWhDMkZORWd0azlISXhZUjVqblpSTWVWRVdh?=
 =?utf-8?B?UDgzNXR0SXNvalk0NkFES3FRYmtYNFUvS1h6NzBGQ3R3a2xBRkN2ekt0ZjEr?=
 =?utf-8?B?Y2ovbGo5Si9KTkxDdCtkWm9ERzB5L05iVlczVEJYd1d4NmNjd0s3R1hvTDV4?=
 =?utf-8?B?eitUeDg0VVZBQnNCelNsb0g0eXMrMWhyVVpnbU8yMFlTWTVxVjB0OUtOdjRG?=
 =?utf-8?B?TFQrMHk4TmcySEJqVndYWmpiQWtCS2RQNFExSnlUU01Gb3JVMTk2TjVIWVpi?=
 =?utf-8?B?WEtldXFXaXRxU2JSRXNDR3AwZnRXelZkU21IMXN6Yi9LOElaWGIvQS9STUc1?=
 =?utf-8?B?WFRpS05ncXExY2owRkcxVHc2WDB6d1VwdlVvWWR3MWUwVE9QNjNMYjFoeGc5?=
 =?utf-8?B?NzBZakhydXZPK0ZoeVF0Q0lDM1MxUStCNlhneUJTa0hCTmN5ZXRsWlVJaVJE?=
 =?utf-8?B?eWd5ZXhuRTJsSFVjOUxaOHVZTWJlOFRzWVlvc2tuUzE5dmZwN2hvQmRDVUJU?=
 =?utf-8?B?ZkRWVnFzSFhxUTVqV0xDRjJLS3dDQzlUR0VlMUNkL05BWDQyZVNiS3R3V1h2?=
 =?utf-8?B?M0RTRjFHbkpPWVVyRXYwL1hHOUxUK2VmQkp6eXpDeEM1emYyRVIrNnl1NThy?=
 =?utf-8?B?ODQyWVhyWGZ0SGpFc0laQ0w4VGFNMVJZakV4amhRZSthVUZSNktBc2pVaGc2?=
 =?utf-8?B?VytWZUw5ekkvWkhYdFZSMGpaZWR1ajJvejlZWURtU05meFYwY2NVUFpib3Ri?=
 =?utf-8?B?eDA5UVR6RXVNVWJ4eDdVOWJTK1FleGFpTmpWMW1FcHc4cnVpVWlUTHFWTVBT?=
 =?utf-8?B?cFVRWWtxWkxCU3VxVVFCaXFrWjNleXd2NEg0RTdhK0p1N0RZWXZwNGdkSVBj?=
 =?utf-8?B?TzhVNWlCcnJYOHdZUHpCeGExR21XZmZEcU55MjhqaDVPL3BWeG8wM1pIMHZr?=
 =?utf-8?B?OURZR2F1VFRhRCsyUUUvdXU5WSs3blRiQnJYUFVGam1zcmgzQjgzTllRdDY5?=
 =?utf-8?B?Y3pIaytwM0MweDVQT1dydTEwUGFWWFRxaFBtZjROcng3Z2hMZWxyeUdEdjAv?=
 =?utf-8?B?akFReHFia3ZCL2hCODFWMnZqcXFxVzZLOVFrNWw0VzAyaThDWFFoTUtBYlRk?=
 =?utf-8?B?NmhiaGJhRDZzS25FMEtMYjh1OFNaMzR4YTl6YldpZzJ3Qy9vb2tHcTducUIv?=
 =?utf-8?B?a3hSZnE1d0htZlpmQU1VdDVYaHZycmNrbXNEQ1p5b0NrczBMV3JhRDVad1VR?=
 =?utf-8?B?dXgwOGZZaDRzM3dEWUowbm1Yc2k0VlpyYVFjMHM2YkM3MExtUHJBQXNNblBE?=
 =?utf-8?B?cUFVZVQwTUpaRk5aTzIrbHdheW02UXRJeENvcE9kZTdtSGJSWEE4bFhZVGp4?=
 =?utf-8?Q?Fw84l+nHRcHgwAI3iSfOkPcVb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e541685e-eefd-4ad2-48f7-08da876b11e1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 13:58:35.8511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEgIsacKE52DIINidJvRTS8TIpjkU63VbuNS0qa1tMtusSJOdzpirnoxp6hJ2Cq38+mO2iVUUPMPdCkOzQZ0fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7821
Received-SPF: pass client-ip=40.107.6.124; envelope-from=den@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.08.2022 15:23, Alexander Ivanov wrote:
>
> On 26.08.2022 15:08, Denis V. Lunev wrote:
>> On 25.08.2022 16:31, Alexander Ivanov wrote:
>>> We will add more and more checks so we need a better code structure
>>> in parallels_co_check. Let each check performs in a separate loop
>>> in a separate helper.
>>>
>>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>> ---
>>>   block/parallels.c | 59 
>>> ++++++++++++++++++++++++++++++++++-------------
>>>   1 file changed, 43 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/block/parallels.c b/block/parallels.c
>>> index eea318f809..f50cd232aa 100644
>>> --- a/block/parallels.c
>>> +++ b/block/parallels.c
>>> @@ -438,13 +438,50 @@ static void 
>>> parallels_check_unclean(BlockDriverState *bs,
>>>       }
>>>   }
>>>   +static int parallels_check_outside_image(BlockDriverState *bs,
>>> +                                         BdrvCheckResult *res,
>>> +                                         BdrvCheckMode fix)
>>> +{
>>> +    BDRVParallelsState *s = bs->opaque;
>>> +    uint32_t i;
>>> +    int64_t off, high_off, size;
>>> +
>>> +    size = bdrv_getlength(bs->file->bs);
>>> +    if (size < 0) {
>>> +        res->check_errors++;
>>> +        return size;
>>> +    }
>>> +
>>> +    high_off = 0;
>>> +    for (i = 0; i < s->bat_size; i++) {
>>> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
>>> +        if (off > size) {
>>
>> we need one more patch here. Correct check would be
>>
>> if (off >= size) {
>>   bla-bla()
>> }
> I have such a patch in the next patchset.

If you have it in hands, can you pls send it here as 11/10
patch. That would be most convenient to me.

Den

