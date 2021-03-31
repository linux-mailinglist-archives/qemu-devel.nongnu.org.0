Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276DF34F8B8
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 08:26:57 +0200 (CEST)
Received: from localhost ([::1]:39084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRUJc-00059y-3H
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 02:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRUGj-0003IP-8i; Wed, 31 Mar 2021 02:23:57 -0400
Received: from mail-eopbgr80132.outbound.protection.outlook.com
 ([40.107.8.132]:28982 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRUGg-0008Lm-1N; Wed, 31 Mar 2021 02:23:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hU7FDCHnjgUs87P0ixXqXTXvPuPjFHliNBiZpKXx1BUX+uGqr0zO4JaMGQ9ARQEPHCIItaCdZz3vZgNDCYFPRQzemgdSAMvVvWgFKH9EK4DRE9NFwZNG/Ap3yqED8CznzP8tmjxKj89eKv1DmAnzAqdLvaLeRkz+QEhvtC/Lbq3+eeGXYCWRhAUxQdqX6qPHGJndd25o38yABiW7fgHy8I1sfsVg+D4Dr1rQTLsANicpKuRdUbN6n+4IiUQ8vNBVIdAjJt1lr/T5psn90inoy6y4wJmkiYWlyB06Vrfrt99U+PtZFS8MGB+se4UWrcolP7iuU4J4URdreoN9mdT/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Za+z0xsnEt9RxG7e1R+qAVn4GRFn+NymtfvBvO+XTKI=;
 b=GxMsept/+qjrTFU+reSooSzlmwMvvJYd3DdTJbUImHi6FqXGlRIicHLN+0bZ1Gv/IvJNIGQsZXDus6OZQwZqsDJkIbSvVWzYPPij1622RR2X9TG+Qf1WQqFo1OrQ78q77P0L0hPwpk8mBNUp4+agRM5qLS5MxJb1XrFvMLPeB354by1EmbnwaN0hTTWzHJa6ZiznF3QEPKBNy5L8h4G811Nqonxd/3YEjD5Gdmg/CIDx4XZyCWsahrZeQ6LrXoeb1Xy2jwT2Bexi08n7kLTkXK483+oKMsG2MekveGrOeqGSG6ZFXagryL1HBVK+SiUPJwthVIyyBPCOR5vvgpemcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Za+z0xsnEt9RxG7e1R+qAVn4GRFn+NymtfvBvO+XTKI=;
 b=n91X+OKicWE8Ar45s6iicQEF4CDrvryhRlQ1SqoiNAMAPybGGfQA6/MZIa6AlFeHQMBb3VieskTM7Sfc8fnwr+RGbjhy0a95oGN0S9CdJ1PyngJwAQox7f5s6HTtXxSYT5YGK/sMgneefvT/vZQv5Xxl/HLOZNMyYJ6CAU/LpAs=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3448.eurprd08.prod.outlook.com (2603:10a6:20b:50::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.31; Wed, 31 Mar
 2021 06:23:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:23:49 +0000
Subject: Re: [PATCH v4 for-6.0? 0/3] qcow2: fix parallel rewrite and discard
 (rw-lock)
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, den@openvz.org
References: <20210319100811.342464-1-vsementsov@virtuozzo.com>
 <f16e8ea3-5af7-abc2-bf1c-7fd997ecf651@virtuozzo.com>
 <c3c2ea3a-9475-69f2-b9d7-e88001d822c0@redhat.com>
 <166496e1-f855-5813-2fe8-88035fb85a26@virtuozzo.com>
 <80e4838f-772b-28e1-3bdb-10a5d7e72ec0@redhat.com>
 <09d7683a-0e1f-58dd-3f24-02591a5d7ac8@virtuozzo.com>
 <61a00c13-3000-249e-8081-7b55ce5832bd@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <129229b2-57e0-4ff9-5ffa-bdfcfba278bf@virtuozzo.com>
Date: Wed, 31 Mar 2021 09:23:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <61a00c13-3000-249e-8081-7b55ce5832bd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.207]
X-ClientProxiedBy: AM0PR01CA0108.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::49) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.207) by
 AM0PR01CA0108.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend
 Transport; Wed, 31 Mar 2021 06:23:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d0a77ef-aa91-4dcc-3995-08d8f40d8bda
X-MS-TrafficTypeDiagnostic: AM6PR08MB3448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB34487BD167DBAE7DB4A75B2AC17C9@AM6PR08MB3448.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MzyLsYNuH+QUyeFmv468F40nCvoM0Pa3IneZybtNIRbbTyCGj3s4/h3nFVsuPOc9YDwZUIlOt4iin2QKG6VfrV+1oVkxwCqXfBDcF85OoK3j3c/CfZFiIhC/lexi2yJIDlzmkiJN2p3yZ9Z9UlCyvftvRx4ZhNq8OUnlIuMxxTXP7lQBLDFrqzZR1pSdIsFItUUo0nGCNCR2t2XwxEOhJlTjpijqpfL70TTaJBtrYwgA9rvFDDQvZlVg+tSyx4mFf+lWGQD9AJaexl/TUMQFJMkX+Kn+UjV0Qq2HvA/JG7ItxzzE4hGSGdDyu8KZ+tAoqnnML62hNXXGoiICwbk1ZAlCt051UAGLaaBPkNNtO9HRVbT+FOd7mMczJ3UcgXWGJZvqFRG8OEqzAdsorgFZko1MAZtZOEUfPjWD701B+P9QKGPFx+NQAjNsREebFupVGJZ2qiqLo3o8V9X5KJBI5Pj10JSCwzrAuOwLbq429qiHFACEjxag1IeRu4VHG+OqhXzn2lwphPujF2I8qLLyKCWyATRcpJyB34L5fwcPr6TIVr/l67Tj9yiYXkuIXSJT24EGYF4HEPnqRdCuXWciJOOc0fWiYQwEYqkvD9+AUNfQctHWsLU5K3T4Zjmmu4vg8rXbGUQAJ11GInF0Ev9551eQpGpmoR2pXd2IeSNrJu4YuirvuVO5ZADwghXMnRSx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(396003)(136003)(6486002)(31686004)(83380400001)(16576012)(316002)(86362001)(2616005)(36756003)(2906002)(38100700001)(478600001)(31696002)(956004)(66556008)(107886003)(5660300002)(8676002)(66946007)(66476007)(186003)(26005)(16526019)(4326008)(52116002)(8936002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b0FDbFJ0NU80WStRMHJrdk8wSlBuSytodHJEeWFVM002SUR6YVJPVGV0cTZk?=
 =?utf-8?B?bjlVODhuRHUzQlZtUFBvREx6aEp6ckUxcmJxZmcwR0l5dWZLZmUyRXRqQ2Rn?=
 =?utf-8?B?VXVXYzg3NktVZjRrbkE5WHN3SlZQcDZIYkxGNmZPd0hTZGp0VlpuUThKNGFz?=
 =?utf-8?B?TjlRaFQzdnBsblN1OTArVTdMeU1rdDhFZWJ0MUpJV2VnaUp3eXl3Vm5nY1or?=
 =?utf-8?B?M1FRcHI0UUp2V0tMenNyMmh2ZmYxb3BoZ1VIWTlZckZXNHRjVnZKV2UrbmNF?=
 =?utf-8?B?WmtDT3NCdElhaG5valFaMDNlTmdrZThLbjFFMFpZdUlJQmlWU3prVS9QWjgw?=
 =?utf-8?B?bjZMYWxLZno2d0hPNXRCK0JNUEs5ZnFRM0VZYjMrNWFub1pyd2JheFIvZG0v?=
 =?utf-8?B?YmNzTGFoQmNJZG5IaDcrTSsrV1BHWWlRcGlOUDQvdit0UzNUQWpJOTFRM0Nm?=
 =?utf-8?B?SDZnS1BNRThlMjZMNWVnK09EaU51YXU4emhreU8wL0c0Z3YyU24vZDN5VWhT?=
 =?utf-8?B?YzBvU3B0cEplTExuZHlROVZYRUJOajhGMWFjN1ZlbEZVclRCUmhTOFFMeEU3?=
 =?utf-8?B?U2d2K2pZanQxcjVEajRhY1ExMFJDM0xOa2NYRG5ZSEVLRGk5ODhNeGRYMlN1?=
 =?utf-8?B?MEI0V01NalB2MWdOdHpOc3BsV3ZqR2ZOS1k3UGlPS040cVhGWWEwQ0lKblNO?=
 =?utf-8?B?eHd3TXRTdGJSM0RzdlpxVUhudVpRNUlteEdFUmVYajg1OXFJOGMxWTJCK3J0?=
 =?utf-8?B?bGZWUjFzTUtmQ3lBSm14UEFQNDNGaVQ3b01iL2h6aHJjeE02VVNmSk9scVZ0?=
 =?utf-8?B?ZmJTcXNlTDROOG5DbmJOekZOYU9KYkVnRkJHbFU4K0dzTncyOVljUWZsM2tV?=
 =?utf-8?B?a2ZNMjhocXNENStqbDFYQVpmU2pETFcrZmtjUHFvRlIvckhrTUJiWWVWRzlR?=
 =?utf-8?B?RDRheWdmOTJ6VEV2TXBVRkZmUjFGYUhjVENjT1FPZVo1WUxEYVRwR0EwOFA4?=
 =?utf-8?B?N0p4Tk9xV3VYbDNBT09BSFloZGsvSjR0UHFlWDg5ZmhuYVJHZU12V1BiYlhI?=
 =?utf-8?B?QWp0dVhoWFJYYytsRkNmc2J2WENYV210NWphVHBYRXY2alQ3MDJJNHlEU01r?=
 =?utf-8?B?MGdia0xCTlhhZEZyQzRRNjJHS0MyeWUwZFZmU1FUZW00TkxnZnZMZS9aWTVm?=
 =?utf-8?B?RVpSOGhyY2lIdy94ODJtU1lPd2djWmtMOUg5WkFvclIveDVEc05neU9wQUhS?=
 =?utf-8?B?cWQwSXNwUG9lTnpjK1NlM3dONlQ1RUlKSVNjTDdjZC9YYURXRGFDU0drVnBM?=
 =?utf-8?B?cTd5ZmRVKzJGRWxqWmF6Ni9yWkFoVmlvNGxNNlZRS0NIWEY3eXZOMWJscFRS?=
 =?utf-8?B?Nk9EdWNMZW8vWklNckhyU0t1U1k1V0NqbUJpWFRKMWN3NURzbFF6ZE81amtW?=
 =?utf-8?B?dWJ2Uk1SanRGeERVdW16SjhmVFpIMFpCVXhyS2RTRE1UTE55WW8zUHh4LzZI?=
 =?utf-8?B?NFZUMk5mSno2RUtnUkw4U3lFR2s1Q2JEVDdyUjVTSVFRQXdCV0E2VGZvRGRK?=
 =?utf-8?B?dDBtWkNwZ3BxWUNlMlFoMXFjU0M5Nm8xYXBXdUFGZ3RHRGhxS2N5djhnR3lo?=
 =?utf-8?B?czR5SXdiSEN6Zk4xSnRCeVFTSzgxQXZtRUFqaE9HNE5URDg2MzduaDdwTUow?=
 =?utf-8?B?SFZTcDVBdlltdkgwSUdoaUF6Rkk0emZtMCtwc1B5WXZXM1kxWjkvUjBWNnJU?=
 =?utf-8?Q?fXwQevkfOCt1vbUdVEUALsUOBXY324RZl9M57ss?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0a77ef-aa91-4dcc-3995-08d8f40d8bda
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:23:49.2475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CQ7P+i4KvSnY1+4kPkEwCtUPaE/wAS4yZ1Hr3mjLa4q+H8zz+9XwcEg4h3DrrcgH1dnvYOZbmAWlP5YkEhqIev4mCsReTkTd+PzoMOk0sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3448
Received-SPF: pass client-ip=40.107.8.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

30.03.2021 19:39, Max Reitz wrote:
>> ==
>>
>> OK, I think now that you didn't mean qcow2_alloc_clusters(). So, we are saying about only functions returning an offset to cluster with "guest data", not to any kind of host cluster. Than what you propose looks like this to me:
>>
>>   - take my v5
>>   - rename qcow2_inflight_writes_dec() to put_cluster_offset()
>>   - call qcow2_inflight_writes_inc() from the three functions you mention
> 
> Yes, I think so.  Or you take the CoRwLock in those three functions, depending on which implementation we want.

CoRwLock brings one inconvenient feature: to pass ownership on the reference to coroutine (for example to task coroutine in qcow2_co_pwritev) we have to unlock the lock in original coroutine and lock in another, as CoRwLock doesn't support transferring to other coroutine. So we'll do put_cluster_offset() in qcow2_co_pwritev() and do get_cluster_offset() in qcow2_co_pwritev_task(). (and we must be sure that the second lock taken before releasing the first one). So in this case it probably better to keep direct CoRwLock interface, not shadowing it by get/put.

-- 
Best regards,
Vladimir

