Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70EA2F21AA
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 22:20:45 +0100 (CET)
Received: from localhost ([::1]:43956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz4cF-0006mg-LM
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 16:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kz4ZT-0006Al-8L; Mon, 11 Jan 2021 16:17:51 -0500
Received: from mail-eopbgr60111.outbound.protection.outlook.com
 ([40.107.6.111]:59583 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kz4ZQ-0007i9-Kn; Mon, 11 Jan 2021 16:17:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mkxw35vHR4SyEhkPZ9iC1jBZq+vq6o1XBaGsz/+o+Ojax5d3XAIBZQv70n47n6jrxmq07dI3uoKNzSnL2kHpbPxHpRJeOtoBH8N43lg8vFWTCpW3PNBYDtTuvjkHW4irIKExzNKYcth1UDcZob2vrv8Q1MWEcyTOwhOdh/qWSCLnE2Gys1vCzat4cTLHi8NNJ6NUKt2HuwK/8xt6lfott2t3f4K0h+4hVX/Ijtwf90+93RYJd5Gb2YEkc2KOB0cw0maQv57TO7xyKxX+IqpoEHLWzutCtNv2tDUam8YD3HJ3Z1wEzHpYtL4gbiipXa3PppVvScKssxfpVdt8MAxoqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qg4OwWnzGDnkM/9+5G5sViFLd+wBCC0hWUccL6uoF8=;
 b=hHCKHZcr3EC6wp1VrVt9OCoCvv9K3bko6Pr3xP5yYFxbuwVFfvi0F/MYDPZhDNoXySQyHnm8gZTCFSf59cG6TcmSyJDN1NfX+NFvns/JYSmgpZYEqA+zCqm4Zr+US3oR9AX/QtgYHEgnxBS8CpBydSgqG3Dz0RWfqdY6RtFBdiUA2KTzb1oAkFKc6T31ndas8rsgWU44CmWMWNsx6MyOaKaQYDvnqfUWJLwK2kLPWGNmfXuDvCMnGDPBHcHG8qINv1iXRiziN/ZXPCQ6300ZvaLzYN1KYzrSevckZkn2+LrCl4GVGOXU41ohYtteBAjGlkr5wCNpnWmdifvWnDprZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qg4OwWnzGDnkM/9+5G5sViFLd+wBCC0hWUccL6uoF8=;
 b=b0KjwsuGneSQGtdkMg3kV2vYa0gF2ZnQGktjjhS3vImUTPxjFS5jcIfBxdq56IMts3s/P4H5Sk2/MrsH+q1i1qTXNfN4oADsvIBXYaAxtobe8fE9/zoyD6Tlk5PQQPCu6d/KF2ushs9vE3MkfWga+75Xcrwo8utx0ObbTaruzUk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6165.eurprd08.prod.outlook.com (2603:10a6:20b:29a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 21:17:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 21:17:43 +0000
Subject: Re: [PATCH v5 14/14] block/qcow2: refactor
 qcow2_update_options_prepare error paths
To: Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org
References: <20210109125811.209870-1-vsementsov@virtuozzo.com>
 <20210109125811.209870-15-vsementsov@virtuozzo.com>
 <w51h7nnihhg.fsf@maestria.local.igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7b459e36-0f18-4668-a53c-aa9e4ce13db7@virtuozzo.com>
Date: Tue, 12 Jan 2021 00:17:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <w51h7nnihhg.fsf@maestria.local.igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR07CA0035.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR07CA0035.eurprd07.prod.outlook.com (2603:10a6:208:ac::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.2 via Frontend Transport; Mon, 11 Jan 2021 21:17:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1b27059-d11f-4c78-44f0-08d8b6765606
X-MS-TrafficTypeDiagnostic: AS8PR08MB6165:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6165C739C229D2ADE029AFFCC1AB0@AS8PR08MB6165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bKGiaowNSOwHlf7TsLtp8VVJn/WMULy+fHMVR8n0eB+EZzKBapVmsmnTkfu+s0hBlyW0aRj4zbCcLFE7IzAuDX8hac4xriTmClSEgp88WYFdAciL8wgXBdenQGw+han+7ANeazvODUGODVEflW58CnXrdHBmEs+wT1yfHH6ZSTl3u3NUreXS2Pf8//LwBAxj/GJkGnRYPrfvEJ/PSIFD0YPUf2E069WjkFd718XZc6GDkyHgXEa1wMvZIJwKVoHc9L89DGk00SkqJhxFr76xT+wQ+r4HbPqTrZ4aNOIIhO+eu4hJpx0JSmufnecoF/QWRZ1A0o0THh3y7TSIm7ab4ngDs2vA1Iz68V6ou3gxeuR+5HLGBoajDJ07+7lzpLN1juSwM1Gqym124xrAg+RO7EO+FnTplM0yg7ysUQrfQ5mXHI45CFvQrjZUsAeIAKvcuTVX4De37EL+NDebQ500ha3BkX0BahnTRZK6JBqHdZw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39830400003)(396003)(366004)(136003)(8676002)(31686004)(86362001)(2906002)(4326008)(52116002)(956004)(83380400001)(2616005)(26005)(16576012)(6486002)(16526019)(316002)(8936002)(31696002)(66476007)(186003)(7416002)(5660300002)(66946007)(36756003)(478600001)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eUh5akRYSFg2Y2xZVG5vdlVUb2xXQUZoWlBsQi9jOXNZYzdJZjNsWXhBS2Za?=
 =?utf-8?B?bFA3TXlKL2hZdUUzY1F6YmI1dGxJTlZlK2F1cWllL2JWSjlJYldXcnFCY2lY?=
 =?utf-8?B?UWtMVE5sMGpsVVgzRXdmZTk0eWVFVTJwMWtGREorOWJocDdGQTZTUklBazcr?=
 =?utf-8?B?L1pTb0RNT29ZL3J1endrUGdESFdDb1pHVXhQOXNvY0kydHVwSCtuc2gyOW9v?=
 =?utf-8?B?cFhtdXdiWlZVUE04VnpSUUFEL1FvNnNJQys2RjVkQnMzazdJb0tGalZid01U?=
 =?utf-8?B?UkJWOUk2cTNobkVDUmRiNWExN0xWSlRKZVRNR3BXV2o1UFZldmVpb1BoQXk4?=
 =?utf-8?B?cHVFNGQra0IvaTI3Yks5TDR1S1g2V2hNS3ZVUlVIWDZNUVZtN3pZbU4zVThs?=
 =?utf-8?B?cWhmeGx4eDJ0U0dyZnZsRTRkQVY2bWVLWlE4YUZXdzArWVBleE5idDVTbUha?=
 =?utf-8?B?d0phd3JsOHVzcDVYTnFhYzlLckx5UlNyaEVtKys4L21QSzV4Tnpkb0RHamJ6?=
 =?utf-8?B?ZGcrajdmWS94VTI2amlXYUZwSXZBamJDSWIrS3VZc2FZcXB1eDVqbUFpZFNx?=
 =?utf-8?B?OGZDSlgxdkhxNTU4VjNZSXFLLzRnOHlMTCt2QXhUSlZNMEdjcDZjOEUwL0pE?=
 =?utf-8?B?dlgyMFltRlBwVld3Tk0wbVZ6dWE3VCtqckhOZzlWRzNwcEs1akp3UmlPNTFL?=
 =?utf-8?B?M01XOXVhZW1RTUh5Z0VSdWM0dnExVlZSckgzMW01VCtKa3NnWkNydUgrcmlx?=
 =?utf-8?B?dDhCNFpGNE1nR0VVNWZyaE53TmVaeHFGdE9VQmJ3Y3pXUXdDT0ltM1FpQkk1?=
 =?utf-8?B?UmN5eUtodHR1SUhiMkRTNmp1TytPVUhRcWVIZUNzK0d5c0RYY1plTXo3VVhv?=
 =?utf-8?B?SUNZb2RLRTZzcDNtbFplTGFob1A5M2V0dHpVNGNtZ1VuMWN5V3B0b3dRQVRh?=
 =?utf-8?B?ZlBuQUIzRmVMaXhpWTJYcFJPWE9VNW0vdFNnNTRsc24vVnM0VHp2UnJ4OWJI?=
 =?utf-8?B?K0o5NXJGN3A4R2ZaR2V6a3Z2Y2tPbVNhSHJQL05RYkFBcjJTUDluOGU1SkpW?=
 =?utf-8?B?UGlQTCtxTWFwaUR3RWtRNGdnV1lFOVpPY3R4UWdpZlp6d3BEbmQ3Y3RBWXk1?=
 =?utf-8?B?UEQ4b1FBcW9md1huaC83WVNWL1d1b3UwWlc3bVlaTFFYcGZmREIxMHgxc2Zj?=
 =?utf-8?B?cmJSN3ZmZk5XYWFEV3FVcHpxVG9KSlozVlErWUg5WHRKL1BwVWIyMW9ZdTVj?=
 =?utf-8?B?K2IxTGJLRHllT1FZck16MmJjbGtudm5QWlVsY3JDcE1IQU5MSUk3a09ZQ3BP?=
 =?utf-8?Q?ixtGhl3kxEe/E9a8KGjH943DtxOFG2cm1U?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 21:17:43.7915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b27059-d11f-4c78-44f0-08d8b6765606
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xL6sE1Sj0DWNKSumL56MmgK8tKykIElx3F000Z/Jh5OVQhKF6OGwcU+GzYb79EI7YQ8dzfhfkszgAwc53nbPwIQFuV2lOaOnxKUejcJUDTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6165
Received-SPF: pass client-ip=40.107.6.111;
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
Cc: kwolf@redhat.com, pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org,
 armbru@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com,
 jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

11.01.2021 19:08, Alberto Garcia wrote:
> On Sat 09 Jan 2021 01:58:11 PM CET, Vladimir Sementsov-Ogievskiy wrote:
>> Keep setting ret close to setting errp and don't merge different error
>> paths into one. This way it's more obvious that we don't return
>> error without setting errp.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> I get the idea, but I feel the code is getting innecessarily verbose.
> 
> One alternative would be to get rid of all -EINVAL inside the switch
> block, take advantage of the existing local_err and follow the block
> with:
> 
>      if (local_err) {
>          error_propagate(errp, local_err);
>          ret = -EINVAL;
>          goto fail;
>      }

Actually in our new paradigm of avoiding error propagation (as well as void functions with errp argument), we should first update read_cache_sizes() to return the value together with setting errp, then we will update read_cache_sizes() call in qcow2_update_options_prepare() and drop local_err from qcow2_update_options_prepare() at all.

> 
> But otherwise your solution is correct, so you can keep it if you
> prefer:
> 
> Reviewed-by: Alberto Garcia <berto@igalia.com>
> 

Thanks!


-- 
Best regards,
Vladimir

