Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FFE36C58E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 13:49:27 +0200 (CEST)
Received: from localhost ([::1]:34908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbMDW-0006ge-0L
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 07:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbMB2-0005gk-FZ; Tue, 27 Apr 2021 07:46:52 -0400
Received: from mail-eopbgr60133.outbound.protection.outlook.com
 ([40.107.6.133]:25602 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbMAz-0001mu-PB; Tue, 27 Apr 2021 07:46:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjHJbgIrHZLFHvs5iuKna6Qo7jerAi5DiRlgmWVJX8jwP12NvddLoneLcF0LBKV/ZN3objIznbhaOGUlJKffVyLYUN/sEfYsPuSf500Li2mRfU01akH7pICmNUJEVAWX0XVKnYcOU2ZwcD/OzWNsMXdIuQGo9tGy4L2otMeVFxlPTjAdsLtUMx9TkML1ZoFojJgAwMVFlWryM6fMLOwTBnFYZNDo7IK1dBTKQuNB+YARKgCCivKlwzLkf2qtfn/3GL+4IbR9iqqMMiKfMCwgepXm4bX6TiNREo8/3Xw57rTrLE16a5jpAQ7hC63Jdzi4xp5YRA3bMJQUoOQWRb6w8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c74w1mlGzrZt4BXibObnQQ9KlPl8dcCdr6u34bAUghI=;
 b=EhgemxUwf7hyo71aPSWjUo+uZwcobdvDLeUODxqRFFqEpq0291Wnlf801u7v20prGrVs3Ki36q/8vJXLW9Mo1tRHMfubldo0Yw2fU4w8qxDli8kCdEEQ9XkVkSRES/f0p8MH72mBiPz7MJ4jeIFkgbDBIAfjhVVGKnzukBHj0iCr/MRHh0AGabavW3r4HRRasN9q8aC68fPpqIhHHiaDrSaCPDCAieVGm2qUFAqVggOP/gLC2JOg+RmoBEoBZGTDIW5bDSLkhVlhhJ66Gje+yma5mXPVwZNGn0BNCJe3bnr3xUNPXZsh6PK+Qi/+6R9fKqxENH3W/Q0BOljBuyLrUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c74w1mlGzrZt4BXibObnQQ9KlPl8dcCdr6u34bAUghI=;
 b=OjaeHSceZJA/Bf1sYm/G8iOCUUvJeAEPwdhmCj7J+8PJEfWyEs2zFYi7C7if/nV5i8/RDY5tTeiJNPpA+c/i2N0DRP6pYS8Lh1/A9ODJZZ0yxCQ4L3+G/fks7+0rV37W80uQNGQp4Uj2zmzum/y/WhRB6FhcvfBrknpYE6YwoRM=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4343.eurprd08.prod.outlook.com (2603:10a6:20b:ba::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Tue, 27 Apr
 2021 11:46:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 11:46:46 +0000
Subject: Re: [PATCH RFC C0/2] support allocation-map for
 block-dirty-bitmap-merge
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, eblake@redhat.com, pkrempa@redhat.com,
 nshirokovskiy@virtuozzo.com, den@openvz.org
References: <20210427111126.84307-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1cee113b-996f-2288-0b36-23fbb37f0583@virtuozzo.com>
Date: Tue, 27 Apr 2021 14:46:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210427111126.84307-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: AM0PR04CA0030.eurprd04.prod.outlook.com
 (2603:10a6:208:122::43) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 AM0PR04CA0030.eurprd04.prod.outlook.com (2603:10a6:208:122::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Tue, 27 Apr 2021 11:46:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afd01bbc-0013-4f1b-e78e-08d9097222b0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4343:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4343DE25442FDFE5184C7522C1419@AM6PR08MB4343.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xjBPi8d7+T0EOH6nh7LwpGvsyGN9irNSMicBLVlpFk5u+A2/jn/rRimwRwyLSKCmAVKbxpZQFBA3oVCMag9AyzmJWVwjzvdrmt6ThXVTKV+tjzd5wqh7otQh7t69vfFSGTXFc87IqNp4pIdm38H4HlmG3+j57wa2lke8+sIh47YSM/5QUYRGX5OCHXytt2VXJ5Pvv3rbMkpsoIGc7JB0Y7foE9yu09mATtgRMYkRTr9L6rNwlSgzmSomi65v7SrkTHCj3Hi2Gh5cNEYbfiQ6X0Xi4BEehbahXOEIjCQNZaP3KeJqJK14Qw9qK0F32TU1tqJitdDgeuW2PH4RPFvL5872iLyAs3bG2xQflaKGrxakzOeEC+k+/+qOVp6PJsncCb47HzCToIpXNvD0xC3rHt3o5frwJrlI6zT7Dgmn1E/ZQfwq3L3XMP9VOeRYLBm8W52DnKW+JNsMBlgwmUcX7PAg4xcs+6LlFsBxzoiKkDnxk8NMHJAg65HBgdMV8NbMalf2+f61gsMwtro4+QMsJr2Yv5NC7kincm9q05fSlBV7MA9Cztmx2Cl7IywS2kMf2pd0VRAyE1HxMI1SqdqbtbfSfOkJoTcscyYCnRxfSYii4QN63iGNV0XhBTQcAI1xOgrAXxeCcB9aJJJb4/eAdNiaVUe5daeY6xLMBhrrYJBL66H1YM8kl2pvT7AJmzwtOTWykmDTZZ9ti97PfXRAPckx9tIY5ia9xRKAPj5cS9VNVtfY1pFBrLfU/Fi3sJIWJ7WLmLCGmZPM0dCsDhR7xovOiPGo2WQ0y4fTraLjQMKGRiJRzP40jyflEMCeMmW1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(346002)(396003)(366004)(376002)(31696002)(4326008)(66556008)(316002)(31686004)(86362001)(83380400001)(66476007)(38100700002)(38350700002)(6916009)(66946007)(2906002)(26005)(8936002)(186003)(16526019)(478600001)(52116002)(16576012)(107886003)(8676002)(5660300002)(6486002)(956004)(966005)(2616005)(36756003)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MHB4TDN5UmJkenN0bWlpVGhONExzRThwdFllWGQ3dFhUN2xoWWVncWkxMXh6?=
 =?utf-8?B?THdkYVg1cnh6YWFTcTBrUU80ak41L285KzQyUkxqY3ZJQXcvTWhzbXp6Yncr?=
 =?utf-8?B?YnQ0a0loakQ0YW9WSEhoYXg1aDdRSDJseXpobmZpb2ZKaUpoVzg0SG1uOU4x?=
 =?utf-8?B?d01GZEMvTUwwdTI3S2pwQ2pQVnZib24wYituZ1djSGtJUDVKc21EMW91ZHI5?=
 =?utf-8?B?UlE0dlA0a0pDa2lVaFM0c1JiWS9uM21FY2FZNGIxdkxoNnQ2Vk1PV21iaGhK?=
 =?utf-8?B?SWw0NVdWblhzeVdhbkpjbDBKTTlvdkFST2sycUZZdDQvKzNFekR4M1djb3pT?=
 =?utf-8?B?SjZlby9IaEUxYW1jOW1oeEpXTEFwVW14N2wzMEpMak1QT0QyS3JINFpHa0o5?=
 =?utf-8?B?UXdKMDV0N1pQdzZvVUljQnE5T1lmUmtqZzgrU3hZb2FSc0tRNmlOaXNndFBt?=
 =?utf-8?B?d0RSYU1zSUdxRzVjb09wYUhycDdCVUhKV2dFZjZHTlJ5OFN1K0pzZkhZMGpq?=
 =?utf-8?B?ZFpWZnBKYWdZVFJqTHhtZ0ErbVZ0enVRci9xOWJ2SzNSSmNvdFdsQ3BqS250?=
 =?utf-8?B?bUxlSUxjWmFkMk9ueHY1MmQ0Tk9rZWxrMmZhY3dkVitiT2FYY0tndlBXdk9S?=
 =?utf-8?B?SkNoVHNkRjdyVEw1UGRCRWFqOHR3N0N0M200YzBLU3JyWHR4TUJkbkZTNnYz?=
 =?utf-8?B?Rm9BY0dnNVBLemdENmlreUhPRHpKVU1VaDEzbE1uaE1ZUU1Eb3FIbHorc1gw?=
 =?utf-8?B?b2dMejFGbWNNYmxqeElMRDZPS2lCanJQeFl5K0laNkt5RmU2ZDVpVUxlNURj?=
 =?utf-8?B?d2V4SWgrWmR2SjBzZVZvYjBMc1M0SlJUVEN5bWFMM0pHRmg4VFN3dTN3cGhS?=
 =?utf-8?B?QkVWWGx4MHJrL3NDQ0hZdEpjSTgvYWhjd0xGSzlWSUVxRUlYUngvTjkyNDg3?=
 =?utf-8?B?TEpLMVJXMzlGc2ZBa2p1U2JyajFTNmgrQ0VVaUVPY2l4T2pPd1RHajErRTBz?=
 =?utf-8?B?TDA0N1dFM1pORklMQWlYekFwd3JqQWlnOU54SmpZakgzVnUrOU8xdTVBTkxr?=
 =?utf-8?B?UWt0VDI0aFgvV3F2VG82dWVoRXlzNzk3dGdaNTJSZW55NUtVMENYTUdTejZs?=
 =?utf-8?B?K3kxSm5lckU3a1RMYUs1b1ZsVGd1d01sMU4vRVRsYUErS2xuSkNqK0xwYzhP?=
 =?utf-8?B?cTVkZ3hPck5heXdURU9qTUpOM0F3M0tURU5vdWFYNGthS2lQMVhSUXhwTlpi?=
 =?utf-8?B?OUNqT21qSlNwK25adWVWcnJsUGtPYVVKUTBiSW42ejJGQmpyQnAwWThnNzFY?=
 =?utf-8?B?TmRRU1htNGFtR1poQTlMMkFPOGRvOS9ERTJ5Y1UxR1B2THJoU0FoREQ0QVJn?=
 =?utf-8?B?SXIvT3pEZ3g1U1NTN3JRVkQvS0RwWTIzNFc4eTJZbjdqTitHVGJNUXIwVjNz?=
 =?utf-8?B?NEhTclRGUFdHdlVhUnhTR2w0UC9QRkkvbVNVQkV4U3FITUptN1R3bndnSU96?=
 =?utf-8?B?ZnI4VW1ZZXdSb1NSY01jKzN6UE5XZG5CSGFvWUhNTHAxMlo1cGRkWTc5WDJT?=
 =?utf-8?B?YnpSVmVMR1hVUWpTaGRlYnJ6UmRLcUFDV2pRS0JoeWhMbk9UblBFRlkzcWNz?=
 =?utf-8?B?WGhVRzFidUZjRTNFSkNoc0pXUkJ3MFFjUmd4ZlJxblcvLzA0MXY5UzFzd1pT?=
 =?utf-8?B?YVBVU2J0a0JzSDl1VXFhWlVKMUkxVkdiampNK1NhNm14QmpTU1hwZGJ0QmJr?=
 =?utf-8?Q?Vb0JJJa1C8bUxruQ67ue+GblK1ePzhu7lG6BmAn?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afd01bbc-0013-4f1b-e78e-08d9097222b0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 11:46:46.3407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hsVDxNVa0N7aPLWnF6+PFJBirIKOzDv000x9svn5kS51ntkiXB8hJ1lQrjCZ659TAgKGwjd29y6kKgn7MHgeTLO37LJMXa0adiaIZ60NIYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4343
Received-SPF: pass client-ip=40.107.6.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

27.04.2021 14:11, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> It's a simpler alternative for
> "[PATCH v4 0/5] block: add block-dirty-bitmap-populate job"
>    <20200902181831.2570048-1-eblake@redhat.com>
>    https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg00978.html
>    https://patchew.org/QEMU/20200902181831.2570048-1-eblake@redhat.com/
> 
> Since we have "coroutine: true" feature for qmp commands, I think,
> maybe we can merge allocation status to bitmap without bothering with
> new block-job?
> 
> It's an RFC:
> 
> 1. Main question: is it OK as a simple blocking command, even in a
> coroutine mode. It's a lot simpler, and it can be simply used in a
> transaction with other bitmap commands.
> 
> 2. Transaction support is not here now. Will add in future version, if
> general approach is OK.

Ha actually, I think it should work, as block-dirty-bitmap-merge is already transactional, and we don't break it by the commit.

> 
> 3. I just do bdrv_co_enter() / bdrv_co_leave() like it is done in the
> only coroutine qmp command - block_resize(). I'm not sure how much is it
> correct.
> 
> 4. I don't do any "drain". I think it's not needed, as intended usage
> is to merge block-status to_active_  bitmap. So all concurrent
> operations will just increase dirtyness of the bitmap and it is OK.
> 
> 5. Probably we still need to create some BdrvChild to avoid node resize
> during the loop of block-status querying.
> 
> 6. Test is mostly copied from parallels-read-bitmap, I'll refactor it in
> next version to avoid copy-paste.
> 
> 7. Probably patch 01 is better be split into 2-3 patches.

8. Name "bitmaps" for list of sources in block-dirty-bitmap-merge becomes misleading. Probably we should add similar "sources" list as alternative to "bitmaps", and deprecate "bitmaps" field.


-- 
Best regards,
Vladimir

