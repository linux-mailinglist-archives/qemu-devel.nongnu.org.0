Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEF8394234
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 13:54:06 +0200 (CEST)
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmb41-0006ux-Em
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 07:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmb35-00067X-T3; Fri, 28 May 2021 07:53:08 -0400
Received: from mail-eopbgr130138.outbound.protection.outlook.com
 ([40.107.13.138]:56450 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmb33-0001Ea-FI; Fri, 28 May 2021 07:53:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JT9MAOETy79hKeVhmEI2ZfBoKuZUP2gwCAcX3BnwmzfOlEMthIIef/fBi7MTSyyYnjJE6Z0AEBbfquCNPtAmtc0iOLA9ZrPKBYWIZ30NKBRy31NPPmTFFVwFQmcoCp07OkOnC7B9wQE9XNSNXcj8JrRPm2YJ3kREO4bYIx9FMN6H0Qcub0kPo6IT3wSZpQYZtVhQl2AOeLags9itp56991XVlNn3+ZdcJb5QUKWcU6yNEb64D+GFZgq7oIfhD1f6yESuZXkNLNoE9O+0E7BTprPKo5toikVv6uyN15+bjCNHQ4FeELDtIVOEqPCTrgj3vSKgzK2Uv6t027R6gZtiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdfGSaKwGwODoFjPqFNSRJIVeuWC0MDA4UzLLDNGtMg=;
 b=IZ3UHoLmk3Jx2qJp68lgypvrkitq63hawDWCFAu9yamP2qqYeaOYsDgh44xk1GokU88OVOicM8RfzXc9Q+5HW+Ab+E5GuUVi9dJc+KyACgRB8JYTbcNm62WAJ9f7Zarn8nPGWm4T4rt/b0/LxKvi1sdR+5pexfdsARQl2pR1ALfxSp4bj1e7ge1CVepV7wzwd6dpEUQe2NMinxCixp8mKESP1QCcue1t+TD/wF9Jh/oZhZKadDszHzMwI6fsVQwKf3BRmwe9gF5OenzRIFgQSbAgs8ch1ZzgTsgJhZXMAYc/iU10hbYz0noTkfiLEGYgHOb0xDaqe3EmpkgEjcSN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdfGSaKwGwODoFjPqFNSRJIVeuWC0MDA4UzLLDNGtMg=;
 b=ZG3AQnzWdlwkHO01or5WMsjUGje3VOt8yjLGqTwuaDw8+sCsl/CgKNgDfviw6XY4UQdXZDHF/deacl4linIX8MZNZ7CDTXNAqW8x/ZZvYbRNEeLYGIM/HEHAcKtmnN3RQNP45WM+Ozr6XgdzhThRb8XVTpg8YsO2w9ep5fsd6wU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4785.eurprd08.prod.outlook.com (2603:10a6:20b:d2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 28 May
 2021 11:53:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 11:53:00 +0000
Subject: Re: [PATCH v2 7/7] block-copy: protect BlockCopyState .method fields
To: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-8-eesposit@redhat.com>
 <404e2891-9c03-bc7d-2c69-a572422d7804@virtuozzo.com>
 <4403ee17-0c12-c545-7f64-683bb9057b91@redhat.com>
 <c4ba5232-79cf-6534-d76a-ac5eaebe098f@virtuozzo.com>
 <db0d5d2c-2e7c-ec33-b9df-52977fc3179c@redhat.com>
 <47ae4243-5a4b-e3a5-44fb-48c689f8bc77@virtuozzo.com>
 <867d0357-1032-f56d-dbed-bd646ce8ec00@redhat.com>
 <fc91616b-9d6f-dfee-d648-30828a13c1b8@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <66b6afd7-35f9-cbef-efd2-ca5f51350909@virtuozzo.com>
Date: Fri, 28 May 2021 14:52:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <fc91616b-9d6f-dfee-d648-30828a13c1b8@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.9 via Frontend Transport; Fri, 28 May 2021 11:52:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7389cb51-5340-44ec-2fac-08d921cf246c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4785:
X-Microsoft-Antispam-PRVS: <AM6PR08MB478538DDE9F49BA19C60FAFEC1229@AM6PR08MB4785.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 602oNW6v0m4SVImbjX4g/MPcfZl6j42lzVgnyJfEzMhxfj9HriDR5NYEICsBJfnOdjBRnc1CblCngkltwRtSdH6L4uy1iaDxhf4sXfZY+ltVnD8YRq3xq280iYgKhBYUzw0tqKpGaOLP0apOUWzAXkVbgzMp2W2MLulyuVUA+8rwp8841UgvbaixE2bLKONKJNT39bEyFLH+OmYgngmceZd0Mmci79Fti/jVrZPhtvtgzvwCQaFhI39Ui9yiSNAdWK/YtOht+Umyw4cROLqB+EJBoP2HtwD01IOCG58+AA2cWYgzHl6pau/cmWSaiwcfi8QNX4woHP0MDSgpY7R2z8aclqSyAkIZdbfOw4wO11r+na/1vpXOSeIpGl7F87+2xnOA1ksdmnxfJcPHzXaVACMQpCaBPRXCEvtMCavHp5kR/adCNIz2DjzxsceHrCWubCr58FDJbSwpL2kMVFW1/IxK1lbUMyRsO/U1EdvdzqhoF5vsENWDH0ThtCaQdZhvJq6NQn/LhSEDx/f8H1/blWa7XLg8V0ZgeQhEsWy2sonhivmRb2i1m8oTczy8KMdc1ogUDEHoYEID0e1KfaUGWMRWfxxTbAMJWMgj/LGfMT7oH/vyKQTCgBcOQqdR3bR2n8uBn9zAq8BdiVgKALO1my17M8nfnr3JgWkq+8/VSesD2JdlKl7pOwjYUHIf/PEX8KG3yY1b6qHISpmxq0PWlQZzsO5yCdzFmmsz7bjxj2SoWEJn2xe1nD8Q1yzYJFhg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39840400004)(31686004)(478600001)(36756003)(38100700002)(38350700002)(8936002)(8676002)(4326008)(16576012)(66946007)(52116002)(66476007)(31696002)(6486002)(16526019)(316002)(2906002)(186003)(66556008)(54906003)(110136005)(26005)(53546011)(83380400001)(956004)(2616005)(86362001)(5660300002)(142923001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QlFUdExLcUVZMDQ2emVkK1hKMk56N1Rpd0Y2ZVp4d2VRRVRSU0o0bm5peFNC?=
 =?utf-8?B?SmN6YW13NWhCVmJMYndYS0lNOFpBc0dCSzV3SURmVkdUYjB0YmNiYjlzUW9D?=
 =?utf-8?B?NVdrSllVeG5GdnNBL2Z5SlM5cTVTM3dER1huRHc4U1dHN1Zua1hZR2FUVGdL?=
 =?utf-8?B?bnJNZVUySXc1bHpWTTQxT1d5bGN0YnhRVzk5UE1FOURUa2NHd3hiUkd0aThh?=
 =?utf-8?B?SXlLM29SdmE4WEJyNmVpRVZZWVU0cE9uTzcwcGRuWFZONEFoQitENEcwOHc0?=
 =?utf-8?B?a0xUM2hDdkRUc2JpWCtEb2dhN1ZMRGlxSWtQVGxIc2JGWVFrODB0MzQybEVv?=
 =?utf-8?B?WUtkd0ZKbU9oK2pObW5kcnlsM2VoWjJ1b0ttWGlaZVdjNU9qY3pNaEp1Q1Ez?=
 =?utf-8?B?T3lBUjhweXlNOTJTSWxHOCtxVlJxMHFMK3RsUXJUK1pqSEE1SW5BTk51Wk5a?=
 =?utf-8?B?TzExdEo1WjgrVGRpVS9SOUJqWTZXVGhQQkJOQjlWby9jTERZOXpuNndSdC9V?=
 =?utf-8?B?N2NSa2xnUEF5dVFFVVBYYmhOeDZYenZGdDhDZXg4Ti9tL3dwalI5MVdSQjFx?=
 =?utf-8?B?QU1NamVqL3FieW55STJ6MDl3UjJKYlRocXVrY2F5ZzhDUGNFVzM4aWwweUZv?=
 =?utf-8?B?UnlmejZUbXFpa1dWamRpQlo2dW9jaURDTFRYTW1jdHBweTlJQzF1OWxIQmVa?=
 =?utf-8?B?M09Xd1crbVRVRitnMWxnakNWWjl6bFRqVUFlMXR6V3JZamV5YUR3b1R5TnhS?=
 =?utf-8?B?UmN5UUthcEduWG90VEJzWkFlQm1KanhYaVFEYVVDQUFENkY1cWVHb1Z0OXpw?=
 =?utf-8?B?Tno1djhJVERoZUgvNFlLZWgrNEdWcVJscEZDLzNxVlFVMk1XcXdlSjNVeXZz?=
 =?utf-8?B?MnNQbUdoSzc1UERJb0cwejlUb0QzbnU1SEc5RWVOT0k3K2g2OXZ3VVdjdnVD?=
 =?utf-8?B?Ky9Yb2pOV21NemI2eEZmb0RSeDI1MUQ3UUNSWTlyVGV3bk5SZHVsRE9kZ21J?=
 =?utf-8?B?N2RNaEJzUVEzVEd2UDdMbWxaK0NIMnpnYW4rZk00SW1CbFE4SnZDZ1d2RHhF?=
 =?utf-8?B?YTY3NkRvakNwMENPK1Y5Q0NKclZKZUsvK0tIT0VmOTdxWGRGMUNmT1VRRGQ0?=
 =?utf-8?B?NWI5VkpMQzJ1WUlQQWFDUFFIM1RhZkFMdys3SVlpWFlPd1ZoanJDSUJtdW9x?=
 =?utf-8?B?SUZaYVlidnBFazhONTkyWVF1eDIySWNDT0FLYXhGbm94V1BpWDR1SDUxUTRE?=
 =?utf-8?B?V3UvcjhjQlE5Q1IxeDRtbExoTHM4UVF5YmRCUzA3eGIwM0JLTzVvVzc4QWdU?=
 =?utf-8?B?SS8zcmI4cStjN3d5c1BheXVMa00wa2pBYWpiUFYyMTBFZWNRenh0Y2NFN0kz?=
 =?utf-8?B?TTU5L0JrTjV2dnUvdWltNjRDeGxqYWFySkprTW9zZXFIdExsTFduQUNkV2Vv?=
 =?utf-8?B?QTF5VWtEREVlUlpiUHJ1bk9XRTZ3TnBaWm5QVTQxNisra1VLVkpSZXRRZlZ6?=
 =?utf-8?B?T2VpTzFVRGZWWG5JU0IyUG9aVUZVVVJhU2h6SE5BdVUyaE94MU1pM1JwYkh5?=
 =?utf-8?B?QWJHSFlWRDBZcHd2dlFGNXpEVHY3TjNpLzdBL21pa1FOUWYwbmpFcDVUY3hN?=
 =?utf-8?B?dE82YzdlUHU1N3ViTjk3bkZwUHJpMTNSdVJ6S0NwbWl3UnZZZFVZb3puN1Jk?=
 =?utf-8?B?S3owb3BwVjlJSUNxRHNURnJkSUZqTmQ0UzE0dWZjNW1BUndQWjk5TG5xVXl2?=
 =?utf-8?Q?uDHLER9Ip34ALZ7xoC8rc1CIj/5fJgvsrjXOleI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7389cb51-5340-44ec-2fac-08d921cf246c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 11:53:00.4076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zc+dePJobzONRmtpP0fzGVVrljB7HRUSSeb0exnzzsGCuljDDlx5yb4kW86Lo0NwHrQhFqgINNGYCWGPH+8LgLEKJb8pNboRyJJGGlc0eBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4785
Received-SPF: pass client-ip=40.107.13.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

28.05.2021 14:01, Paolo Bonzini wrote:
> On 28/05/21 12:24, Paolo Bonzini wrote:
>>
>> It's still more complicated, because you need to add some kind of
>>
>>      method = s->method;
> 
> This would even have to be a separate, one-line critical section...
> 

Or atomic operation.. What I don't like that all troubles are for unused code. Many things may change to the moment when we actually reuse this for qemu-img convert.

And, qemu-img convert probably don't need this complicated logic with different methods. It may be better just return error if copy_range failed. What's a good reason for fall-back to normal write if copy-range is explicitly requested by user?

> 
>>      ret = block_copy_do_copy(..., method);
>>      if (ret < 0 && method <= COPY_RANGE_SMALL) {
>>          method = COPY_RANGE_READ_WRITE;
>>          ret = block_copy_do_copy(..., method);
>>          }
>>      lock();
>>          if (method == s->method) {
>>              /* compute new method */
>>          }
>>
>> which makes it more complicated than this patch IMO.  But yeah at least it's a viable alternative to the atomics.
> 
> 


-- 
Best regards,
Vladimir

