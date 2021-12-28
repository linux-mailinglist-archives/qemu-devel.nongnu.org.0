Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D6348095A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 14:01:06 +0100 (CET)
Received: from localhost ([::1]:47508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2C6D-0008Cb-Dm
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 08:01:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2C4A-0006bJ-6D
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 07:58:58 -0500
Received: from mail-db8eur05on2111.outbound.protection.outlook.com
 ([40.107.20.111]:39521 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2C48-0004xe-7Z
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 07:58:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Du+Al9P4IKaagHBcv5fZpGwM7Sy2Sj7h1dbGgGyVXyTkhqF83tN6ZKwqOrYSVzzZHd704lyKBMJu0OevIs61/vNmCesRNaPLtwYfjyREQYKoww6Vpd6R6SlRnM1JPjZy1vfvInrrYh3bGtHPR7DCvN+s1hNHZAAhG8af5C+rIQs5wbSha7TtvuMbbVZGtAsTIMHX0f3kQfsQ3HkhxbZPrffM9HkqfapZKgmtrQAel11GYhZwNjZHuX0DFm1o52NLZ+l6asQGWU1Q7yNt1zZmrazsJjKQolN4t66KTRSTN+UJeQ6DDur8n7xYUNhS77pg3DspI9RFmqRhGAxiwIF/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFi9NAE+1Z7Hd+oBv7I06YYNty8KTz+wWPUQB5L/+5g=;
 b=eO3+dWXIelu9m3MzZel4lPdLrxrhpCUa9nqagMvtnWJNOE3YXJj4sacAfQlqnK/ueNaRR8Eh/sjeLdBdBEp0C2kLGPBjGXDGSEEmdmQ4F9fU3CbZASAdkfTxta+0xbr4RdmuhekPykphZG8bctVl7eawBlXbcXkGw6dJxL950Trf7EjMR2Evn1XA6HXGYximSI2P43mVY0bgXMnTtM3rxlAUjh7qxcQZDNQOThZLOPPL6QBvQhM/9yBZRkWuu+jODQOhoyckcoXszLw7NXtM+dDGwyQDVi/gXfaVDyXAWVl/8pXhomZNS2njyfc8ErA4QKpx9TZiB0MbfkXxj2bqLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFi9NAE+1Z7Hd+oBv7I06YYNty8KTz+wWPUQB5L/+5g=;
 b=tFVab6uT6mbtJ/SkRfGIrVjkdxzM+sqNFsjWInxMt+QRdE/Ynf5Vc+yEIw68Dn5znkhdeejQrGWeaVRdRE0bxGHTGSV2NEzkpiRjCzro3lLFuJOI1fWgqhyoFTf586t7I5LqPFZVBetltG9v+zwxhxLyvcS2Xm6FdSBOq4A69Q8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB5155.eurprd08.prod.outlook.com (2603:10a6:208:15f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Tue, 28 Dec
 2021 12:58:53 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 12:58:53 +0000
Message-ID: <6e8d66ac-6569-e424-d1d2-4adc7a70571d@virtuozzo.com>
Date: Tue, 28 Dec 2021 15:58:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/6] migration: Add no-ram capability
Content-Language: en-US
To: Nikita Lapshin <nikita.lapshin@virtuozzo.com>, qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, eblake@redhat.com,
 armbru@redhat.com, eduardo@habkost.net, crosa@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, den@virtuozzo.com
References: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
 <20211224111148.345438-4-nikita.lapshin@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211224111148.345438-4-nikita.lapshin@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0102.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::43) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34bc0153-f19c-4db6-f12d-08d9ca01cd20
X-MS-TrafficTypeDiagnostic: AM0PR08MB5155:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB51550F86EFCB1E702DAC1790C1439@AM0PR08MB5155.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zMV0BLAcTyncfNMMaMPTrdTBn8v9DS4B8XpzVaMObqoV4v8/dFzjEb4z1gYkx8IzlffyjgfHV3mgAuzJ4x4mOC6ILtjCUFAdjCW+4+6bUlfZ2PjzEkW2ssFwKOqCpyOL1hoB5yavAD9CyTgf3mhHP+3kGOgyHnWHfPu/GZ346XzEy27o2DWueCAMHMMZiNtK4vG7M44qRdTkYH+67gHKKaKkHDWcJ5+kqbFKFVniWUyLaAMtlNQBvAcN8gTyKNK80tNbBJSA/Too4kz1AlLDW0VmwUGbFpO3+iaGV0lpaNsJlALGAA0wDOyJ4YnGFIUu++j8xjabN0529/Q5u+nc1GRHURsh8dILxZ2pMccYRrEuA2pcupTbSBwo4AwYT6U3HphSdnLEvEKNEp/4wF4mnuLRcg4/NGgfTHJnnpR3mTovou0yCb671aY45itXhBngNbn6ND5eQ66Lc5Tu0qurLd/FZNidmyxCuTIBkIj+1YF9xKMRAT2TYiFczsE21P7VIlBVw0/ziLKbVreq7kqWpLNGv95aVYe75jAHW276ShRmgV35fB6kBrde+vd2DQdZh1mWzWHEIrG1k1IWmlsotHJX3fmeMKJ/XAI2NoETyTYk6HBN06kJLLt6GexN7yDF7gVK3i4QU0BpRYX0aYwKa3feFOFlKUrrQQERHJWLeQCTrajsBRtjJpHbzalWuveV/PQvUvV7Bm3zBgCJFrWbqDqpBCXfK5I8BpDDybI+5pm6nJO+iHkbzvwni2/qGh7mdgHnH9Yj/MWYVoeohOLG3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(8936002)(8676002)(52116002)(2616005)(31696002)(2906002)(186003)(66476007)(66556008)(6506007)(36756003)(26005)(6486002)(508600001)(6512007)(38100700002)(66946007)(316002)(107886003)(38350700002)(4744005)(86362001)(31686004)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDJNcTc3amVxVHE3TjNTVjVWSWNqVEZyckxmTGVyK0FmUTY2dlJMa1hPWk5p?=
 =?utf-8?B?RElsZEI1YUxLSU9SSkFGcnNZM0U1T1lKbTBZOGhIOHRuMDY4VnhSeEpDK0NE?=
 =?utf-8?B?ZTNsUWsrYXhreFFUZURIQ0hJbTkvWjVZQ3hUUmNlTEl2Z3FzUFIwSjIrWlA0?=
 =?utf-8?B?MG0veHZycW9TS2s4TERyVVlMajZmQk1RWnJtZXlNYlJZa3Rtd1pyc3psc1VM?=
 =?utf-8?B?N1dnUE91NWp6RWRXNGJRWHBuSE0xMkFoek9ucTgzN2puN1JRb0ZkbUU4ZkVF?=
 =?utf-8?B?Q21EVi9lRUZyZ000czBPdVY1czNBWHErR2xOdEpETjJkdWM4YXFkeno3QURt?=
 =?utf-8?B?MGZVdDNPbnp6ZE81TGwyaVhONnJ4MjI5aVdJMlUyUVNwTVIyS1d0N1dKSVFj?=
 =?utf-8?B?WkVLWGFYdG5DekN5cVRpR2pqeGhTWVp1ZmlSQ1hCeW52WVdzaFJ5S3dpMzJh?=
 =?utf-8?B?b1paM1VIRWR2VFpVUnVHemZVc2VTNmUrMlYzWTJnS2lnM2tVN2V6TG1Ka3JY?=
 =?utf-8?B?TDY4aVltWnRHd1UvaDNEUEIrR2lDRVZlYzFwLytvR0pkeHRCR05RSFQ0K09S?=
 =?utf-8?B?U0FJclZGd1ZGYWNqZHVrVnhlTnVVYW11anE4SkJwUGZkYjdIRkZEbEZwRnRD?=
 =?utf-8?B?NzQ3VC9rc2FxYzg1YlR5RkVXQzJlTnp3STllT1ZDM0tQU2pZSGhmUGpqZExL?=
 =?utf-8?B?YUQrYUxOOGtJUmhVVGRWVnUwS29mZ2ZHbmx5QU1xYkF0bFVOK0pVYWpOT3I1?=
 =?utf-8?B?VTAwZTlGZXJwajJmdjYvbUFTbldnejZFYXBBanJ6bXEzb1A0YWZHZEZ6UHpU?=
 =?utf-8?B?bDFqZkwwcTEzNzlXalpkaHREUVNHMkNGTGk4S2NyYlF1TzBMUklQdndFNDJ2?=
 =?utf-8?B?M3NSNm1VenYxOUo3eUJNTUxGSVhhNTJmZnJLSTNsc2JnL0o0OFNRaDNtK3FL?=
 =?utf-8?B?UVdVMW9tdW4zVE1TNDEreXNvSGVnUkhQaGE1cHVoWi9MNnlkNnlIcW1MWld3?=
 =?utf-8?B?SndBTlQrZk52b04xUVhOb3F0TjNCM0RuOXB2dHJlUkN4OVJuTHBMTTZOa1JT?=
 =?utf-8?B?M1pCbTd5VTFRc1AzOFE4L2wwVC9oWllxUHRhOUpSU1daWlgwVjA5bEQ4Z25h?=
 =?utf-8?B?V0EwbjYxTG4rMHJSQlRlSFhXREI0cWxIbjFKUjdUSUxuZmJWVHNlTWQ2OFhh?=
 =?utf-8?B?NnE4S29XV3ZJMHVQK0lPb3FxK2VHUEpqVEVISFFFc2Z4WTlYWE85b0ovUnlk?=
 =?utf-8?B?OFJSaVNtZHBqM1ZncXlFNFJFVWNWcHl5QkdTZUY5c2ZHOW0wZWVjbWlQOGR1?=
 =?utf-8?B?RDRFRkhWcE1CYjA1bFEwbzF2WkYrUEt0b0gwdkh5Q1l0dEtlMGpkaDRWKzdD?=
 =?utf-8?B?RXJLLzc5S3VMM0pYVU8zSkh5RTJHbVk4bTJkVkNUU0tCT1JiNWtTTlhNR2N6?=
 =?utf-8?B?dVh6T0tkZUZ0WUs4M0xOeVBEYzR5NUdMdG01QldxOTFRVmdDVkl2T0ZRa0lW?=
 =?utf-8?B?ZDVMSmtWcmExdEE5ZE9aaSt1NEZNTFI3NUcvN0R4Mit0S0FBUWxMTWVLUjl6?=
 =?utf-8?B?ZVBBb1RkZDJXcVk1REtxVG5VYU1xT3J2czRvS0l2Z1pJV3VDWGIwUjlpYzIy?=
 =?utf-8?B?eDIydmMwWFhZV1ZiWXY5Q1dldjJpbTlTTHRqN0hIKzNtb3NxdFlBc2h4c2ti?=
 =?utf-8?B?OGJUYU1IcDVGL2dPWmN4VXdoN2FCdEZ4SjB2ZDJyeERrdUJYS1hRdXBjS0gr?=
 =?utf-8?B?QkU0Rm4xaW1INVBHWWdBakpTSTVHZkVwWnFrWGh0cG1kKzE4WHdXRzI5T2Fh?=
 =?utf-8?B?Q3ZBSVcza0R6dktRVTNJS3dQcWdjeHRPUFNnR0VjRWlWYTI5YjIveUM1bFg0?=
 =?utf-8?B?U2lOa3NydCtWaDE0R1kvRy9pSDhGYndQMWU1aGxZOHlEbU8yeEx5ZXBXUHpJ?=
 =?utf-8?B?c2FxeVUvMDUrV0RZTUxodjMyYW5zOEpTN05FWHFKUVRXd25xanRFRXVHSi82?=
 =?utf-8?B?dlk3N2V3TzQ4bkZsenVLR25sWWt4T1B1dkcweVduNkMzZS90Qy9HWnRMeXV0?=
 =?utf-8?B?QU1NcUxuL3BML09nMzlBWTQ0NGY1aWZVb0o2elE1bzV4dU9pRitSODNRU3Ni?=
 =?utf-8?B?OVE5MnRaN3ZTUExIcVJneGovUURGSlN6UnFpaDJXR0hWSlltZzcxN05mUHFS?=
 =?utf-8?B?d28vWS9wdWZqR2J0WlFCckV4bytUNXhvc1VkL0NObkxLd3gvMVJMdXdFaDBJ?=
 =?utf-8?Q?Biyk5f4/Qju1zRNjRlS7KYZT00/DtbxVHoNvr4c1kk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bc0153-f19c-4db6-f12d-08d9ca01cd20
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 12:58:53.6308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZU24t+HmH+58nrmsWU4k2QnQNQ54UtyLVMiEmz6nFIy/ujeZ4iJUPCkh24pt16afsl2J5JxqkNxueAWbj6HMI8aHAjlczxRvNF1toXXYoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5155
Received-SPF: pass client-ip=40.107.20.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

24.12.2021 14:11, Nikita Lapshin wrote:
> This capability disable RAM section in migration stream.
> 
> Signed-off-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>

Probably we need some checks that new capability is not used together with ram-related capabilities, but that could be a separate patch.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

