Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0EA3ADA01
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 14:39:38 +0200 (CEST)
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luaG8-0003lo-Qi
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 08:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luaFI-0002hb-6E; Sat, 19 Jun 2021 08:38:44 -0400
Received: from mail-vi1eur05on2132.outbound.protection.outlook.com
 ([40.107.21.132]:5184 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luaFE-0002Nh-LM; Sat, 19 Jun 2021 08:38:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrMinFwaP5/yH03PvQBnA9oiErUTKwA22LumWeuJqSY0obGeF8b0BLj9Tfl2j2JwHl2n/7imQPaYI8Zo97g6tXkMfAQQ1cGqxgKQlK7aHuAbsc2D39qBGu8pNlx36cn7Pu3D9PYEvtsH4HKwRFRVHSF9Xuha4zl+k3VmebB7afTjRzlIs8OYkGwq7E1TApme0zqaXRPCZrXdYSz6JeTJv4ziK/yRE1i/bcD7FQ6VV+peFJMXn/1m2iUTeVUEZlD4tAko4ssHaR7n8JeINutYoRo/boOwMrDE+MbOQMGmx8d/ANlSbhRfHBbg0aEn3b7/w9XRHhQKDKp+bYeaM5qHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lr13NmxiLIxilxwIHEmBqsTUA5ZGZIry7fgVD17GAYM=;
 b=kIrrd9dHCTTINOVaYE5uJwwl1rlebW5QztaYCh6vt8Z2+kGyGDEWkPof/bMqCZcjfE7jzoa9TB9TVqx6N0Agv2kKqvZNxfkYpvqG8DemjZK6aQZmUuKG1Hd5/4XOakM5WApbC4RQul2OohWB8JJGzIHDCNAVUjjSLxdT+JfFEsBqIO4EOEJO7w6ibfpw2YLrfxYIBHwkl15M8aCzVOb7OaGqLk4sDdw/1Wx8KKkhFm0DdqZOKR/3H4mv4OVHDVSZiIGpytKQw+remhgz0w37YglsP5a1OahH1uaL8I3YqppuHCIe4nbws8bSagd28lJrzYRpFSrV2BrBaKSEpuIZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lr13NmxiLIxilxwIHEmBqsTUA5ZGZIry7fgVD17GAYM=;
 b=ejkcOPaRMeR9ILWZf/2Njv24wsyWZnFgRZGK8YfmFjdRfFf7pQZapMsA4cu+qDlDravRyYyLjN5pF9ZJxtAcS+gJqXqxNo8O79oGKhrfR8I9H4T5SM66/biJ23JpUiqO5vwWSGRegNGLSn54Pn+uMd2SqHdbN+3GSlejrw5BwmY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5495.eurprd08.prod.outlook.com (2603:10a6:20b:104::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Sat, 19 Jun
 2021 12:38:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 12:38:36 +0000
Subject: Re: [PATCH v5 5/6] block/blkdebug: remove new_state field and instead
 use a local variable
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
References: <20210614082931.24925-1-eesposit@redhat.com>
 <20210614082931.24925-6-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c4a571c4-ee1b-b6ac-e315-ade0030e5e2d@virtuozzo.com>
Date: Sat, 19 Jun 2021 15:38:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614082931.24925-6-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR05CA0278.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR05CA0278.eurprd05.prod.outlook.com (2603:10a6:3:fc::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Sat, 19 Jun 2021 12:38:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c7a0aa3-09f3-43e9-73de-08d9331f2867
X-MS-TrafficTypeDiagnostic: AM7PR08MB5495:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5495CB6F4F9C0FF09DB8C095C10C9@AM7PR08MB5495.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l8BLEYZXgQFrfM7WumsabZs6uEgDhY91hKUvGOKp8ZRKFT2ZQl16tV/kUrjjkkGkng4wZ4ntPM2FdYI1ikgaQj7RHthb1hXLQGU+AO8GUhYMjDbYQ2Nn1wiSpzBPRRCatuI20JLhqnP3onW5nkDHOWuODv2QbPZqcTubXxvvlv6F+JfNgS4ni4XiC7Ts3HNC+yoFNB8sGTvgmlk6kRwC6a1m0E4ov872laBi8EOjedSTSYhUxLYxOhroEyS0SDSBchvI4qxw/474lvH2bnjvKwthMXFoP9+Jxw6uJtA2RU08noZ1l3fwE9ZmH9HuhhsQw2Z29RwyM2DZld8+UgcB0j3fGey2D8BB3E9FfGwh0Gew0WbfdOA2WPqwhbXXbw9EGHo6SHYRyv7Eryervcq7rd+vjwN8owqVE/bjKff0D91SqOcoyBUrJTYVEUdKt3zA8XnJeXksFwCTyKXZ2V3+6RVQqAH1Xgk3rLbIe63dC8R+mrj9ST5eN1MpamMYsY99ch6lgyCsTorVsQbuz0SZDpL5YxkgU+3ls+/jRCWMjjflna+Pv2CqubeX61IkxLZw5giDwbNCYcDZxcvwLEd0BA1SKmg5qIb7P9TIcIMoi02zUcMwFoyXBCshBV0w6t873QfLHqDglKnka6/7DG1RNf09AL9XfwJUoMPYCy4V15GTEQf0RvNDLM7XGSlccqVSgrFkhCqt9zDIKKXp+CVl3SR+7jpvU2RoBpjxeyanhhc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(39840400004)(136003)(5660300002)(8936002)(31696002)(38100700002)(38350700002)(8676002)(31686004)(956004)(66556008)(66476007)(6486002)(83380400001)(2906002)(478600001)(52116002)(16576012)(54906003)(4744005)(86362001)(316002)(4326008)(66946007)(2616005)(36756003)(26005)(186003)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S25xbFdubzVLQmhIcjArbUJ0SnRyL0xZQ28yMHg5L1NWcDZOUFYzRUlzc1hs?=
 =?utf-8?B?Tis5ak1PS01RdVhpZ3BrUENiVHVrQkVyb01TK1VPMEFCRThnTXZnb3dLcGxz?=
 =?utf-8?B?VkRpczltUHRucktyWTRJTnp1djNGdGRXUkFQM1NTNU9Jb3BzdW1RSWZud0tH?=
 =?utf-8?B?VDVqeXRQK2FYbWdEa25ZNWxwaU1zRkpUanJUNWxZVzV3dlR1Q21Ubmoxbklr?=
 =?utf-8?B?OExpNWpuZXBSWG5YUXpCckJnUmppRkswLzNTME5tL0dIam9jSUpiOG9DUjdB?=
 =?utf-8?B?NGlkK2NlTVp3YUQ4aWVZeEltRGgzcVgzK29HVytWV1NLejVQWlhoUGkyN05h?=
 =?utf-8?B?WldsVVkrZHE0M09BYmp3dEFkaWxsZDdramZpWTVaNjZtTERYR0RKWDRuOWJ0?=
 =?utf-8?B?VnFCYThDV1B6ZHIwakJzazMwbklLYTZ6bTVWaVN3TnRkUDJEL0MrSXJaUi9q?=
 =?utf-8?B?T1h1ZnpiOEo1NnRhWnVqRk9jNE1RM1BwbWpMSGFYcGhkL0Y3NTMwUlJob3hp?=
 =?utf-8?B?SHdJUkRDM2Q1M0JRRVZTTFRoYWNrdzFYOWZiQndzbEIzL2ZQelV5c0pjS211?=
 =?utf-8?B?VHpIMGRESGFoVTFZamthMGUzeEhyaW5ZY295VWoyeWFlQnY4SWo5M0FGaHVE?=
 =?utf-8?B?MzRtTmFUTmJKZlBDMjhUZG9WQ1VQSUNKRFZSYndaVGo5RmdFWUtMOTZGTGVX?=
 =?utf-8?B?NUh0aXNtRDMwRi9yTjNVbURLUXNNbm9FekFVL1hwTDVYQWZuMlF4a0ltL3NF?=
 =?utf-8?B?R1c1OFozU0JTZmtxK0RBUFU0YXR5MVg2VWpTRkgwMzRwaVZLSzByR21HSGNu?=
 =?utf-8?B?a3VXeDZ0akNKQVZQMXVFMTNOMmpaMENqN3RSVUU0bGJ0UnFxRVNHM0FwN3h0?=
 =?utf-8?B?cHFEQ0hDVXZzamdUN1AvVHphTjljVFdHY2ZVQTh3djErSTBEU1c2ZEhWd1Vu?=
 =?utf-8?B?THUyRnQ2bFFwUTd0b0dsOVpHb2Yyd2hiQVl6QzdZWFVtME91MlFvNnVuL0Vq?=
 =?utf-8?B?R3dTTjIwZTFSV21PcUFqWkNSUjBnb29KaXBTYmtOOXdNbjdMRkE0M1JQMG1W?=
 =?utf-8?B?QnZzRFJOY1VWanlvbnFQdE9CaDkwVVFDdG1oVWFJQXBsZHlxVTZ2TTc4N01k?=
 =?utf-8?B?OFZLUXVRMEhwYXExR3E5ejloQ2NHeHBaaVlEK0pESXN3NkR1VnJEbHlZZHhx?=
 =?utf-8?B?VnlPZkZQbENIcDg0dStQcGdCRU1Qdk5sb3d0Z0pJLzRaZm5qM0RwRjNhR3ZL?=
 =?utf-8?B?aXZCL2JBaGFaK2h3SU9mMTZpVnBpRTd6dDNya0g1SHRDc3oyRmxlNjJtTHlD?=
 =?utf-8?B?anVSWmZqUmJWWiszMzI3TThSUzVLMndUWkJaU291ZVZqL09IYlJrd3I0Y0E5?=
 =?utf-8?B?QVBRTm5VajFOd0FDcWFaOHZXWXZMbHhzM3FUQU9jVjRPUDR2UjI3bUJqSWR5?=
 =?utf-8?B?UklmbDA3cHdqeGlDZEwwOWxhSXN4L29LRDkvK29jVGsrTUpEK1hmKzk5cU9T?=
 =?utf-8?B?Ujdzd1pmWlAyWjR4S0xzUTRLWkhUMVNKMC9OcWxXS3F3L1VabTZta2ZBVGpx?=
 =?utf-8?B?NWpLaXNRQlA0TDMwVDdIOHJBMEhDaEkzTkdPK3k1aVV1R0xMOW1mMjJuWVZy?=
 =?utf-8?B?Ujl2dENDM1IvUVBXQzBpOVN1WkhDNk5kbVl4dDRlYW9ha2hJMU5YdE5LM0o0?=
 =?utf-8?B?MkFpZlR6alN2ZmtHUzdlWUw1K2FLL3Q1cnZkRW1TbnlQM1J3U0RJTTJBbXR0?=
 =?utf-8?Q?QhY+PCHQVFIHEnvmTswXMlH6qwfd9msv57gpona?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7a0aa3-09f3-43e9-73de-08d9331f2867
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 12:38:36.5443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: caTLNYIq064N9r+NP2xidUz3rCEUWYrSoVc+6sKEyLHzUESLNl1Q8JhmRn22Me4sgkxNWCLm9B7pa4d0tGZuVhWXgFuwhADWLXg4TpW7kXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5495
Received-SPF: pass client-ip=40.107.21.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_NONE=-0.0001,
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

14.06.2021 11:29, Emanuele Giuseppe Esposito wrote:
> There seems to be no benefit in using a field. Replace it with a local
> variable, and move the state update before the yields.
> 
> The state update has do be done before the yields because now using
> a local variable does not allow the new updated state to be visible
> by the other yields.

Not sure that this sentence helps.. I just can't imagine how state update should work keeping in mind these yields :) And making state update more atomically makes sense to me just because it's simpler to understand.

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>



-- 
Best regards,
Vladimir

