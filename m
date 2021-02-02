Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF3230CFBF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 00:12:34 +0100 (CET)
Received: from localhost ([::1]:55964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74qX-00047W-Iv
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 18:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1l74Vf-0005p6-QC; Tue, 02 Feb 2021 17:51:00 -0500
Received: from mail-eopbgr00137.outbound.protection.outlook.com
 ([40.107.0.137]:62802 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1l74VY-0007xY-Mz; Tue, 02 Feb 2021 17:50:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YchWEd9lH1tHlbb76/IcDHfniwYQnyB43J/K+IoqGoanedXGE5hh2iuG//ZRJcWdJaZqW5uxXWke+RyLxcOmTK5OcsN4tX24yMKk0+keEAdivA2A3ztTjh6SefvprW8wcSp/2/x1zbz8/rrxuTLnGBbOoQyGekYqOfHjrf0XjIKwSu56Aqsx1Suc3yBZhUCTtpQTQpcMTIgNF6MyB+fWn9ZMmtfbVTonOkKsO31DBRt3h74+okUXUlkyPzv/iBZswgXKHdiA/6oqUlHk6rrRVhNaJgXq1kHnWFdbWPbJ7hJSDqQUrQC73zNRjtCgdQlxheBRZ2GGWMXNyIM6MW0gFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9q2+S0MH6q2e5raUEyZyZ2w4DgDd3+mHhnZR/iXpO0=;
 b=Ypn3uqlPlDQ/lWWYnNxX2Ust6V1t1WpB3LbM/dOwCTJV5OZMJgb+VRAh8k6XgyOo7DTq4hQP/EtV2rNP0LkEDE3yg/nYv6iLIGypqN1mjaVbozHl6UrA2o430lJnZDYUxeb0H6STucVv5C1REvYCVhBQQFgKL4As0V18SNRzCsAa9IpnTDNW0OqoCmpUSAa5viHPEIrxKN46dbhYTiexcNICMdWHXnexjQcTKXemL4UX/Qr09c6YPQ6nVM6J+FKJ0W/vdkB8fiS2kycYKvCmgTcQuK5Rk6CvtmrqCzp2XhgD20NxfXPCbrDOJm5O+7YotBlwLqh9IP9pj3uxqFvRvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9q2+S0MH6q2e5raUEyZyZ2w4DgDd3+mHhnZR/iXpO0=;
 b=TdUiparzaJS+krp5v2mGLe/dknd7u/nVX0Kf8r6IA249CrkPuKDObn7mOQvOYyr8lbeP+xAREpThpNaj+bWrYsNK+SAQh+cckPZbHyAgj7913stsE15jVAqzumtWXcEJzdqxTQkZjUJvuJvKi/ks/oasM1kKUPJtLTkjiq7aiXo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 22:50:47 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb%6]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 22:50:47 +0000
Subject: Re: [PATCH 1/1] docs: fix mistake in dirty bitmap feature description
To: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20210128171313.2210947-1-den@openvz.org>
 <a88ad335-05b1-b720-5689-1c477bd55d1f@virtuozzo.com>
 <ccc0020d-ae27-6e8a-d76e-55615c74befb@redhat.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <80bb1b27-4bb3-de85-713b-a88c8019a14f@openvz.org>
Date: Wed, 3 Feb 2021 01:50:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <ccc0020d-ae27-6e8a-d76e-55615c74befb@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: AM3PR03CA0066.eurprd03.prod.outlook.com
 (2603:10a6:207:5::24) To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.81] (31.148.204.195) by
 AM3PR03CA0066.eurprd03.prod.outlook.com (2603:10a6:207:5::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Tue, 2 Feb 2021 22:50:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8febfe14-2501-4000-118f-08d8c7ccfb0d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6119E9AA53E2BAC2D4A18DD1B6B59@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 17hlYOaPxL6vi1Up/DUdT+Ck8RXqPAYEDK3aGBduYl8KNux4e//QN+Pd7c8Ao7YEKtXoeDkCYiQHeDZ6cimwPbJwk5iEZdFKVIY21kfqNhazMqeujdewJp1uCDygLiCNkY2mJWk5dLygAUR1wl+oMfPzgPfvpsyAPUkrTNvPu1tVNWD1/lMV18vBI5xdvi7gF5EscLBUD8yGi1npPevOfg+7SLDCAHJRXB2FZqI+NHPwb6imSzJ2CDnvbygaTrOLOO6+X4lwmOFUovIX2EBfGmAkWvb3GnHYnRNfZmDKViQLBD8S7gf5A1/NjAMRSuJi/8U8OQBvBfRQIF1J1BX6+xG13hNE9mESePYVpcw1MeBNuBtWPKkkRYphw88C1rxVY1hlS1cDtXQUbizfkqwHWWV5N91CkW/3OYfAwLf2aqX2odmw5J65ma6t4CYdgKfyePYN1QY4VRRwOMhsoh9Z8ZMIda3y/lSQojkGkBC5MJjbs4dHz53sfuGQ5nGfrNgYoh7gx5++oqqPYqFtBT8rYxEn298kSbKlRsXSH0RaumxkTk9lhSwQy2GXyS17t32jju/iHgsboo+6RNlKqzmiNHG/CXc5bSztxihWzTCpzdiPIO++LurQW7OoWbgrgEWh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39840400004)(346002)(376002)(5660300002)(36756003)(4326008)(83380400001)(26005)(2616005)(6486002)(66476007)(66556008)(31686004)(186003)(316002)(478600001)(8936002)(66946007)(956004)(83170400001)(52116002)(110136005)(16576012)(2906002)(53546011)(31696002)(8676002)(42882007)(16526019)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L1BxRkRlVFNCb2U1bjJ2OWx2Y000emN1c2xvclVKbGx5SWVrVGZnc1EwU3hh?=
 =?utf-8?B?VkhDUU9GTjN6TzFQQnNBMXVSenhaT2d2YWI4bkZQUHRJMlJXRytIZHJBc1hw?=
 =?utf-8?B?N1VSQTFVMFNiWnNGWFRPd0F1c3duLzN4OVdDNk1RYThraVBtd2kyZ3hkODl0?=
 =?utf-8?B?TnFjYjJ2THRZeWdySEx1eVBHdjUxT2VVM2ZoaWwvV2pmS2YrUExuaU82VUVv?=
 =?utf-8?B?cXFtUzBicE1qaHc1UUIyeTd3dnF6UWdUVE1DY1JHbkl3U0w5U1MrZ2F3Ylp6?=
 =?utf-8?B?QTZ0OFNTZndnbVMyNTU4Y1BGU0cwWXVNNDcvYnBONW1kODRrVFI2R2dzajI3?=
 =?utf-8?B?NThNTXBvZzVuWG1xTCtXTEdiK0FjS2pWR0FGVlNYK3c2UjFqMzRBdXhXR3hL?=
 =?utf-8?B?eDdWSlU0eGZ1THBvTGJES3hmaTUxTkczeTR6bFo5eEdzd1NPUVllViszU0th?=
 =?utf-8?B?RVVFL2NtSHJxUUM5L205bk1ON2lzM1JmRm9uK3FLZVVDcXpKdmVnRGg1bVJm?=
 =?utf-8?B?b2pnU0xLZjNnbis0WnpmZDA1VVBiSFdFUFphVnd3a3VPdjdXK3dPNGV4Y2dl?=
 =?utf-8?B?WmhrRTN5V3p4ZGpaOEhQUnF4YmZJUThMME1Wa2pCT21ac2hUek41U3RJaU5F?=
 =?utf-8?B?UmI4eXAyaTVzeEllSnJHdFdsL0N1M1lpRklDVkRIZmNSUnQvQWdHVnFORmRq?=
 =?utf-8?B?VGRWd2RCOFE2djYzYms5cXFmM0FWZ0lTWjhmYUg2eGZXUUx4ZzhhRkJYUW1W?=
 =?utf-8?B?b1U5UzRuWlFVNGFjZlBCL25FM3JDQjZNNUdHYSs5OTBiTlZoanBnbkpBaFEv?=
 =?utf-8?B?eExRaXRaNFBLZ2VmdHFpcEl3WFdZMWZ2ZmE2YjhtTzN4bWdobTBaVWlSU0ZV?=
 =?utf-8?B?VXhqdTdCZ0VIWG5FVDF6WWVrSFJMYUh6azN1YWpjZXJXT3NEUXduL1JUOTZ3?=
 =?utf-8?B?MGM4TU56eTRTTGJXVnM5WWhiOUhwNU9NS2dXWDRwcUlNSGg5RThpNit6N3FY?=
 =?utf-8?B?YU1SSnE3azNvSG5ZM3lNRi80cDI0RUdpY1U5TE1nd0VUL2IvY015dlVpUE9k?=
 =?utf-8?B?TG1KYjQ2dlN3enBjSGIxUmFJcTdtYk94L2hMQjRqOS80SkdoZXNmSUo1VFhq?=
 =?utf-8?B?MEcvTnRSMllYWWsvWG5pYWxmeUpQWXZPVW44N1dNU0lVTUZHZlpRanJHQnY3?=
 =?utf-8?B?NmNrb25aQ3lzWHBlM0ZkbmZzaGNNNjdnQmRaYlpkcGtnU1VzT3NPaWVmR2ta?=
 =?utf-8?B?RnBzeWV4eFRaamNHa09WTWZzbERCNFJMU1A3SStydnpGRmRMazNqdXQ5QWFN?=
 =?utf-8?B?dnc0UkhIK1dRb1k5anJvcDZCb212UzFMeDJQOXU5UmFsMU1ucUIzMnMwUm9D?=
 =?utf-8?B?NmlmQU1xZjdUcW1mcXdDakFFTU1mSjBmSFlTd0hvNWVsUHNaYUIrNEZtVVU2?=
 =?utf-8?B?b3VtdENTNFgyNjhYTklDdkJrSGNZM0c5TER5ZCtBPT0=?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: 8febfe14-2501-4000-118f-08d8c7ccfb0d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 22:50:47.4197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTLgi2pCwOS7bp2rCsDOLonxPmrUK7RS0L9JnuUHyoAAWZnfV6XII0ijv5MQf3djjznMJOavptibfiWRgwwKYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.0.137; envelope-from=den@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 1:15 AM, Eric Blake wrote:
> On 1/28/21 11:21 AM, Vladimir Sementsov-Ogievskiy wrote:
>> 28.01.2021 20:13, Denis V. Lunev wrote:
>>> Original specification says that l1 table size if 64 * l1_size, which
>>> is obviously wrong. The size of the l1 entry is 64 _bits_, not bytes.
>>> Thus 64 is to be replaces with 8 as specification says about bytes.
>>>
>>> There is also minor tweak, field name is renamed from l1 to l1_table,
>>> which matches with the later text.
>>>
>>> Signed-off-by: Denis V. Lunev <den@openvz.org>
>>> CC: Stefan Hajnoczi <stefanha@redhat.com>
>>> CC: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
> I saw the subject "dirty bitmap", and assumed it would go through my
> dirty bitmap tree.  In reality, it's unrelated to the dirty bitmap code.
>  Would an improved subject line help?
hmm. Actually this is about "how the dirty bitmaps are stored in the
Parallels Image format". The section is called "dirty bitmap feature".

What I can propose? :)

"docs: fix mistake in Parallels Image "dirty bitmap" feature description"

Will this work for you?

Den

>>> ---
>>>   docs/interop/parallels.txt | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/docs/interop/parallels.txt b/docs/interop/parallels.txt
>>> index e9271eba5d..f15bf35bd1 100644
>>> --- a/docs/interop/parallels.txt
>>> +++ b/docs/interop/parallels.txt
>>> @@ -208,7 +208,7 @@ of its data area are:
>>>     28 - 31:    l1_size
>>>                 The number of entries in the L1 table of the bitmap.
>>>   -  variable:   l1 (64 * l1_size bytes)
>>> +  variable:   l1_table (8 * l1_size bytes)
>>>                 L1 offset table (in bytes)
>> I don't remember why this "(in bytes)" is here.. What in bytes? L1 table
>> size? But the described field is not L1 table size, but L1 table
>> itself.. It's not in bytes, it's just L1 table :)
>>
>> So, I'd also drop "(in bytes)" while being here. Or the whole line "L1
>> offset table (in bytes)" altogether.
>>
>>>     A dirty bitmap is stored using a one-level structure for the
>>> mapping to host
>>>
>>


