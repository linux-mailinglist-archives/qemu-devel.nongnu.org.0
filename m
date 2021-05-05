Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A874373C7B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:37:21 +0200 (CEST)
Received: from localhost ([::1]:56850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHiK-0003oi-68
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leHgh-0002ma-4C; Wed, 05 May 2021 09:35:39 -0400
Received: from mail-vi1eur05on2110.outbound.protection.outlook.com
 ([40.107.21.110]:13760 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leHge-0008Ss-DE; Wed, 05 May 2021 09:35:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReP5LSkOmIUZX7UIKjBhJxRlX2RVF/s2e8dmvxgFjXsT864MO511zRtJrFnzOxPmxOxggk+0b09ajnm/5dwuhYVnXEnE0vVDJMjx2j+0r/3o924Q4f1jsKp0z0jh8bVDajALEiafllHEt+55vMqHRf4/5Dr05ztV2342vPm/Fh6I34hOm6lJmE0K5XZIndsdbeA6bLMGseav420C3J+17hoN3XQFigsBCRfGxIyurkdt4AJeK5y/Ys92pCa7So6a8PKChHDG5pxKeLOeW3xqjPJDCGVEop7Zd7Hhn6WOY1aBu+r66DWXAjLwtDruRKo6nsW6/XgY9kbsbO5pWOoWPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIxdMcYExvbWLB4QmUYL5u3lHV4+SpPbRepUu0xfS10=;
 b=gdYwFEF+pO0ApA0AK/5f3ZAGJNrwRaT7IVqEqf/0/L4bzqHEC1gy2ocIgsD57jtA8vBUP9BI6YAwzSFree8zCvQBlej/+1drwd05JBJ+dM+h9yCpmGIitjCohDAKpa+kXcQgPNmSOv2Dhc9bAPgHM6Voxp7dD485Wnggd7T9SaEPKtB6rayYtMJ7ezZ4r5Tn5ziaanlLTTQOZX0v4lKmmq9AOaxwxtP852NVocPtTYkjn7ZSh90qA4s9ABrL6jZj/WWaajN+6Ui1RFYurkSd3RHxjDhV74L0Knr5nDv1+f6pALCk9KyVG789xRubU333nygzsJMBZo8lqN2nmEcpmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIxdMcYExvbWLB4QmUYL5u3lHV4+SpPbRepUu0xfS10=;
 b=I5/+4x48q6P6jPFL1OU/Amq3jI0nUmMsz3bppcSkciftKVLKshws2IzJnu1uQyg+NdT9bPc46EqKE73Dd4j4zs+Tr6BzHcXUbzcIp6aqKMPOG+M1Qz0ZVksSLlHWu8z2ETlHtYoLSI7QhTujFkld/q/Dll6epUSnFScSb9CByss=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3895.eurprd08.prod.outlook.com (2603:10a6:20b:81::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Wed, 5 May
 2021 13:35:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 13:35:31 +0000
Subject: Re: [PATCH v2 1/9] block/write-threshold: don't use write notifiers
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 kwolf@redhat.com, eesposit@redhat.com, pbonzini@redhat.com
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
 <20210504082553.20377-2-vsementsov@virtuozzo.com>
 <712e9661-e296-b960-d6ca-9173f9ecb2f3@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <384228c1-3e4c-f28f-aaf6-3c2515b99dcf@virtuozzo.com>
Date: Wed, 5 May 2021 16:35:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <712e9661-e296-b960-d6ca-9173f9ecb2f3@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: PR0P264CA0160.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 PR0P264CA0160.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 13:35:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c67dffc2-087a-4e5a-67c9-08d90fcaa722
X-MS-TrafficTypeDiagnostic: AM6PR08MB3895:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3895F19229CC4ACD0A64512CC1599@AM6PR08MB3895.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rQJmq4CIYF5F1AZRA0gR+/L4ARd8uV75EXH1ZYnC33GFCJKWaeHZUMXva7c8vP3YVt7MDcB0/DO1gEHDdpnv9zT5QsJa5e0jrNTjKn+VVUosoUPQuSiMcrJtmRk55fT8nR66rK17BDovS1eeupeOK5sPcpBTVXQzDM3ba1SHQI6bajHNAxeBbXk6klIInRxKphNZkefpSIPuUvqCKBOgESM8RaUlula26xa9CAolZIaAn9W977Xh7gK81OAOHI8w7Dq1iBn8NG64Hsqk8gpSYwho7kUeaOc6Ohl+iBf6oB0BgcmopEAFsOUASQjyuR2PAyDwhL+qqdKhY94vWPu/6pU1tWN5OWeKGLq/YrpP4Y3Ejw6BUCr/uQMBwxmjk9D/tBp80eRfkLTqYOuY3p+hEEavbRYl8QGNGRd6yw2tFHNdCuA/ajWxacGh9p0xpgonUH1/AHkuxQ0HTACgNbcbP9abYqbFpOwQ/ld7rfObVC2Py2rqWnkRto6ySHhOwLMhwrWA1y5fP8v7BExJcs5dbVuSfqBEUUZhnKqBvn3rDvpvl7ay4lyl3VhJstn2C/+KR5n1Zco2IuTPTWcZj8K71FDj6IN3gAjdJBuqTBnx4X509njU5LldxRk/Pk8nELbweIGP1EwFdST/S25jl+R8dMpTbfxxoHQfqS2FqGA/L+WTv86ZELm11tjt+F2DFHj19hyln12j+wDGTbGZYf+koKJkidph8T9oq35VGwU1beA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39840400004)(2906002)(66556008)(66476007)(8936002)(16576012)(38100700002)(478600001)(66946007)(52116002)(31696002)(4326008)(38350700002)(316002)(31686004)(8676002)(26005)(36756003)(86362001)(6486002)(4744005)(16526019)(186003)(5660300002)(956004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R2xGWkt5SkExSUdkQWV3N2hWcXhjUkdSaWU0RVJHWGVRZmpvSzVaengvUXJj?=
 =?utf-8?B?ODI1b2VaRXUzSk5ySTZJb0RPR0Z2dGYySFBvYnFXUzFrUWV6c0huOXZGMGhE?=
 =?utf-8?B?RTI0UmZyNG9qZzJaYVVzUzFpT3hvZFJHZ0VxVFExRktHbnZuZzd1V2k2RGdm?=
 =?utf-8?B?QTR3WVhscnQ1TTh6SHJJdlBTb1FXQUREcTNHaWR2VVNaSUgyQmJNWE5hRzFL?=
 =?utf-8?B?S244Q0E1UWRZb0g0c3JMZW40MGFzWVVId3ZkOS90RUZFU1NEODBzNnRQbHlP?=
 =?utf-8?B?WitXaWtSalZnNlR3RTgvVzNVMVdZNndud1VWcWZTZUdYc1o5alc4VFdWZFN4?=
 =?utf-8?B?ZC93bzQ5Y2d2UHB0TlVGQjV0WGNFSWNRYURoRDVxVEZHbkNVZ1Rtd0MzYllI?=
 =?utf-8?B?Y2RXN05oMzRoVkk5eVhiQmUvTlpZem5XUmJhcm92K29jRGNtVEZnUFVMVUlJ?=
 =?utf-8?B?dG1BZW0yOFJwUGpUTkRjenJhcFliSERWczRqdWVqdzFldS9XT2Vacm5jWDB6?=
 =?utf-8?B?VkYvNURpVUo0bHRGejA4c1ZsRXFNUGZkdlFQM2lWNHRGRGNBY2lTUzY4NEFw?=
 =?utf-8?B?OCtsb3VpN0xuZ3VNRGlIM0RQd3FrY01BK2l0dWNFRkNSZW5ibmY0TlF2KzRD?=
 =?utf-8?B?bGJBeWliUzM1YTZJSXFWNkwwb2NUM1U1NzA4a1ZuR2Z2RCtyT2FUTHp4TmZz?=
 =?utf-8?B?ZW9tdEFSNEVUL0luMVNnbWFKSVdBMVZ3Q3JITFBSMG95SmFyRjhCay8yeGow?=
 =?utf-8?B?YldvSmdyM0FVVnBxeVA3NHNCRGdNclh4WWN3Rm9BL0dLL2UxN2dOblN6WHVk?=
 =?utf-8?B?M0NvcTJlUEl0c0FDdktSdVRPWWJoWXVXNk5XL2N0V2JFbXIrQ3pPOVV5dTl1?=
 =?utf-8?B?TEwrc0cyUHFoKzlVRlZGVmlFQVdwUld3eDhENkpQdkoxcFNHZlFpcTZJdWlM?=
 =?utf-8?B?VVBqZ2tXU1Y3Mmo0QzlSR0I4dTZ5N2lKWEIyUlJFZlRoRGtWNVFsY3FKMWhE?=
 =?utf-8?B?OEcxYUFraS85dWc5VWxjcEJRdDZ4NXFObW9iVFV4ZFp0RUsrZzR1T0Z0T2li?=
 =?utf-8?B?TXNuU05hc0RzdHR0d3pPODhnNXlzQmRrWVFMZ3o4Zm93S0hqeldFWCt3c0pK?=
 =?utf-8?B?ZVltSUMzSXVJNE5xWjFLTlNXMTFWRTZ4Ty9CTGFUUUx6bWI1Y2c3N3grRzlW?=
 =?utf-8?B?Ti9iaVFwOGdINHdScW1NcFRSZ2xFUlZHcWE3VDVTYzlHNHBQY0VaOFRyalF6?=
 =?utf-8?B?aDh0OG1OUGEvSFlhRHYvTnd3ZHQ3OFpUNm12QVZtZWpZcjhjcmFQRjVTeE1I?=
 =?utf-8?B?WWVNOFErOE1TeXpiOXUzb0dabEpFYUllSlorQmJVWDFqekZIMnJjTVNBdjBp?=
 =?utf-8?B?Y2sxM3gvQ0QzdjExOEowZkJvQWF4TElRVDl1MExHU2dhOUUrTzJtNnUvTGc2?=
 =?utf-8?B?enVuYitqd2lFRXFpd041eXdkU3pmU0hvOEdVV3c4NXFPZGovY2hqL1YyU0U5?=
 =?utf-8?B?SEQwcXZuSlU4QTNtT3g0MmVkdWZKVU13Qi9FUHg4RVR1ZVZDYzArMDlaUkNr?=
 =?utf-8?B?MVp1WlRGbjBJeG1mQjB3MWhsazhLN3BNQTN4N2hXM2hCT1BNNzdTR1JWNlFP?=
 =?utf-8?B?RHhtc0ROMGFsSldleU5iSmE3enVCVDEzQ3lndk9NUmp0TjBQd1pBYVh1eSsw?=
 =?utf-8?B?NTNXb1V5eEpFY1E5RUdRTjI4c2p3aGNlZ21xZ1ZXM2dDWXdiYXBXODErVDAz?=
 =?utf-8?Q?lMvdegzV9a/BIzrR4ws1E1Zw1392LTGjv5YNC7U?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c67dffc2-087a-4e5a-67c9-08d90fcaa722
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 13:35:31.2083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvBPdrzFPXO7jLVWrQhssTTBSQh1Fr7/uPg4UxvOddPGFqUIAsleROXLXa+2M7f/kxiLNH2sijaEtQqTWO4O4PdBKCGUjpECH8jNEaJqt8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3895
Received-SPF: pass client-ip=40.107.21.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

05.05.2021 15:37, Max Reitz wrote:
>> write-notifiers are used only for write-threshold. New code for such
>> purpose should create filters.
>>
>> Let's better special-case write-threshold and drop write notifiers at
>> all. (Actually, write-threshold is special-cased anyway, as the only
>> user of write-notifiers)
> 
> Not noted here: That write-threshold.c is also reorganized.  (Doesn’t seem entirely necessary to do right in this patch, but why not.)

You mean, we probably could only add new interface here, keeping other things as is, and drop them in a separate patch?

If keep as is we can add the following here:

   So, create a new direct interface for bdrv_co_write_req_prepare() and drop
   all write-notifier related logic from write-threshold.c.

-- 
Best regards,
Vladimir

