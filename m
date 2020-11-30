Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AED62C8E15
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 20:32:13 +0100 (CET)
Received: from localhost ([::1]:36780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjouC-0007Bl-Fk
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 14:32:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kjosE-0006U7-Eo
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 14:30:10 -0500
Received: from mail-eopbgr150104.outbound.protection.outlook.com
 ([40.107.15.104]:19380 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kjosC-0002CB-8N
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 14:30:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibO/Lohg0FpLp6psm9cG7D+3tMPk2enS6nXRwcAzQ7g4Oh3MF3hGZYi7IbIJwhHTg+0qbfha3sTOJYmvSw5UMdpFIeYnrlI91Mf6r7nfxMDvfSePuxzFAKRgQNHxbj/S1Jh+IoxLmDd8Wyesi0dXFtpWcV4b8HSgB0MwJk1U2CRrMlLBP3Y4O/9zp8uetPx1U0kprcjbNjcMYI5XzCfAeqY5Eia4m5jqqrnbKWHjjw4LTHZz5x3HJHpJNSPRxes/70AoRnzESu7kkuANjvzuf2rmkHG+7Is4RbHg6Ex6ncyu3Aie4gCw0A1F9n1tnP4jAngxnSwIJOMJT3gUyHj+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZtZhvLm5ggrUQDG40Uhtyjzv7DN5Qf6ykAmtcNQXls=;
 b=Pb0p8D0vKPSk4w2eQVPGnPVr6fIPeipNLPRbc+IhMU4q/AbVo9eI1rO08QF7n8gXp3YuGfFdxafIkGPMiema1ewJCuZNUBjnTCXEfouwYRe+iAEwKWBnHDNdGO1exFaVr1K1z79uo9Ikka2FT0l4Mzuy6VGqEO7BptD2WDi+Rh8ihps3mDAbDI6+mBl4YjsWJ38XugUPWW8Q8Aqz+EkEiDZMD0WXMQ6k30qqoinAnIzG2NRmKnqq9TfaMSuRCKGEvr2AG3mqFKHmwSVoXxyPSZ5Ae41O6c5CjC0cUcXM1hgbNpZCMvPJ9JLzI0gDVp9rQ9hEMnIZDmOLWuBUJuwoIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZtZhvLm5ggrUQDG40Uhtyjzv7DN5Qf6ykAmtcNQXls=;
 b=leSqrg2Nw780R13gQ2p2v6sBQtQeLyG1oENSzZxS3T7OvvRpwlGuHGFlcPe8I6Q87MNiE25zZGtVZm8VSu18pTfZlbtIU2mPaJWV6iEPDqgZ2COItYipaP+uDs9lSYeOxIEbqwyevOlmOj6FIZ2JEn692VJX/FXuOi66bLVhPF4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR0801MB1904.eurprd08.prod.outlook.com
 (2603:10a6:800:81::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 19:30:05 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3611.025; Mon, 30 Nov
 2020 19:30:05 +0000
Subject: Re: [PATCH v4 6/6] introduce simple linear scan rate limiting
 mechanism
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126151734.743849-7-andrey.gruzdev@virtuozzo.com>
 <20201127222811.GJ6573@xz-x1>
 <ab27e287-b737-25a7-cfed-2d70e0042537@virtuozzo.com>
 <20201130164037.GC3277@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <2fb23634-9099-c25d-305d-b0568669e5c5@virtuozzo.com>
Date: Mon, 30 Nov 2020 22:30:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201130164037.GC3277@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM3PR07CA0121.eurprd07.prod.outlook.com
 (2603:10a6:207:7::31) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM3PR07CA0121.eurprd07.prod.outlook.com (2603:10a6:207:7::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.8 via Frontend Transport; Mon, 30 Nov 2020 19:30:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30c1a95c-e5b5-44e1-8b0f-08d89566572e
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB190468E1EB6C24A5276765CB9FF50@VI1PR0801MB1904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zf7jdIl31dRXylcgPNSkoKX3hNQLvtbqUhQ40bVJU4Qv/6gKz2MS9MVHdyhzXx9DKkvKZr7wOJZ3i8VlXIVUSHfkeMut8Fcallf792RKhb2VlL5rQTTqqNPySvWNfk/UI4hQPvZPY9XCyMxyjIG6LEgfEZ5CGke+UnW9ADa1OYQsWmauQpHw+idepnRgnezF+n9tkHadnaaSsnAJbJ2ymY7NAIXFiOCrmF9ajCGQPoV3faee08kuFibfTYtKE3GYBVfNtDNYrXmLsyZm00BXjKyZzbCbEicru3vlFfAksnvAN0kIx91GaQr9GN/pZYa+XvB39deABgHpprN94K8+WG636LKt3x2nCxm6n2RiynRBGO+XEhm1TLAU6v7tSbH1xVIeiFAYsk3YfCCQdOinWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(5660300002)(52116002)(66556008)(31686004)(36756003)(66946007)(66476007)(316002)(31696002)(16576012)(53546011)(6486002)(956004)(2906002)(44832011)(4326008)(2616005)(26005)(6916009)(186003)(8936002)(16526019)(54906003)(83380400001)(8676002)(86362001)(478600001)(21314003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RHdTaW9wQVlmTzB3czh3TlBxRVRXODdHbFNYNmw1Z2hIVHBXMG1SaVNkM0ZD?=
 =?utf-8?B?VWxEUW1VTUFTNEhUakRpbWJJQzd0dGlXSWZWNTVBWnVLUjJUOHVYL0c5RmFu?=
 =?utf-8?B?eTlMaEhCc1BLVFZLdW5tQ1QwMzU3RmNjK1ViYURFOFpxOW5HTm5DUkRzNnBN?=
 =?utf-8?B?TmhZcy8waXdtZ1NxdGdwWDNsaUlUc0k4SjVXUU1ESVpvYUk4NkVzWjk4R2FN?=
 =?utf-8?B?TDVtdXlvUUV5OUdhTmNkU1JiTUhNWVYzQWlsZzkwZWo1ZmZlbVpkZTh0NEhT?=
 =?utf-8?B?U0NYd0grZDdvZ3ZFSmI4dVA4N00vdHArV2Z1SUkzUUM4eUFoY0V6M2hYWTA1?=
 =?utf-8?B?eHQ1VDNqRkFscVhHQm5VTXc0ZGRST2RsRVNpeHV1bEJWRXY5S2lZUDN3U0ox?=
 =?utf-8?B?eFVXcVZaVndSZWx5ZGpuS0JvU3NXM3hrMGJJdzF1aTZ2aWNndmlobFBHa3c1?=
 =?utf-8?B?Yk16VW9aamxVa3o3VFhUUC8yTDREYkt4aSs1eDJmcUt2NU9FQVhRUDNsS3A5?=
 =?utf-8?B?STNCR1BGdE9hM1FiRmg4S2lnMU9iMWEzYnJ1M1JpcDkxV29QOENaK3k4U0dH?=
 =?utf-8?B?YzQvSXRBZjIwbWhZSjU0ZTZmTXRPckFTWHNDajBacCtGZFlucjNZWlFscHBK?=
 =?utf-8?B?TVhkWnNzVEVMWXI5UjFSalNPL0ppNUk3Q1pDUTV3NDdTQlNXZFBvRVVXc1Zo?=
 =?utf-8?B?UlVEMXg1V3RYbEdkMWtZTFJRVUFKUzdTcVB5dkE0TjFKdW9vVEcvejJlTHl1?=
 =?utf-8?B?YUpqK3I4R0JMRlg1dGZRTW5ZSndGK3F1dG5qU3NQTmxCdjI2VUMyYkdocU5z?=
 =?utf-8?B?eVo0VW04NXBZYmdmOU9yaUJLeTc4cDBqMzlSZ28ydjh2QmVoTVhZL2JWald2?=
 =?utf-8?B?MWEwYUVuN1VMc3lyUGVqdlpmdmUrTHBIcEtmZC9OKzlsK3l4d0dvZW9RK0Vq?=
 =?utf-8?B?ZXZIaS9LN1UrUEZIZmVmNVVrS1BVK2l3Rmh2YnFHNi94ajJYTUhoWm5ZWTUy?=
 =?utf-8?B?VEdDdHJNeHl2VjVDUFBSOUhSUHp3TVVFZmVCbTlVSG5LSjcxTzJKdWpYWE8r?=
 =?utf-8?B?T2dZMW5NVHVuQUxDK1FaYUJlRXZMWjNnQVJoUzR5RTh0a3QrUjloWm1oZ0Nv?=
 =?utf-8?B?dUFJN29scGh3SUd1M3pCRFRGZWJKL09TOEJ6RXNOZk1Zc2JLVjlHQWFVdWZI?=
 =?utf-8?B?WHdHY1ZlL0E3QitWaGhDb1ZPeEZaZ2dxWkhSN3BxUkdnOUhsMDhmRWhOZGZO?=
 =?utf-8?B?azdSSHNrVkwweW9EaTBxeHJBSDQ4UHNmTm1xdGZycExMVE13ei9pOEIycTk1?=
 =?utf-8?Q?Plsx+oHPWkDa/JlgoWWXHDah0bcLEltxtx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c1a95c-e5b5-44e1-8b0f-08d89566572e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 19:30:05.6585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKv/k5PxOm6SBkdbKuPiQtXK7Qb82lUF3M5pSINuICqmUWG3orArkN7lhnNaaJyC0l/LB+gpszWVcqzT8JV6sAPmUU2OSb4afKFUuuVJO1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1904
Received-SPF: pass client-ip=40.107.15.104;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

On 30.11.2020 19:40, Peter Xu wrote:
> On Mon, Nov 30, 2020 at 11:11:00AM +0300, Andrey Gruzdev wrote:
>> On 28.11.2020 01:28, Peter Xu wrote:
>>> On Thu, Nov 26, 2020 at 06:17:34PM +0300, Andrey Gruzdev wrote:
>>>> Since reading UFFD events and saving paged data are performed
>>>> from the same thread, write fault latencies are sensitive to
>>>> migration stream stalls. Limiting total page saving rate is a
>>>> method to reduce amount of noticiable fault resolution latencies.
>>>>
>>>> Migration bandwidth limiting is achieved via noticing cases of
>>>> out-of-threshold write fault latencies and temporarily disabling
>>>> (strictly speaking, severely throttling) saving non-faulting pages.
>>>
>>> So have you done any measurements out of it, as we've talked in previous
>>> version?  Thanks,
>>>
>>
>> Sorry, not done yet.
> 
> So do you still plan to? :)
> 
> And if not, could you describe the rational behind this patch?  For example,
> what's the problem behind (e.g., guest hangs for xxx seconds, maybe?) and
> what's the outcome (guest doesn't hang any more)?
> 
> Thanks,
> 

Yes, I think providing a latency histogram with description of the test 
case is the right thing.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

