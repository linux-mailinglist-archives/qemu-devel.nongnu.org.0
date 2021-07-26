Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B611F3D5747
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 12:18:06 +0200 (CEST)
Received: from localhost ([::1]:60000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7xgT-0005Fr-RJ
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 06:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m7xf4-0004Fv-7U; Mon, 26 Jul 2021 06:16:38 -0400
Received: from mail-db8eur05on2134.outbound.protection.outlook.com
 ([40.107.20.134]:23649 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m7xf1-0003t9-5U; Mon, 26 Jul 2021 06:16:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5xbVM4G7fKeURZxCOwXxsMSyUpo+mMzbMekxTUnQmM0nMkwwFwgC96BuoLezfsTH6ijpFellcdTMleajsvln2kxBfGm79+ghNf/Omo9QeKDD72qzTpwojmgek+RummuQBD5Fr8AJhMjD67cpE/xb10OXRwPSpax3lev7dHXvPSEuz9l/gDr58upsXtNBWzL8H39iiX4O4Oq4p3ofFbOsH7s2VD8shsvifwliqyaZDqm3g0BXUopSYYwu15kmZNkCoFZRi0gxmxAZNzaP1MDu3MNjQZlaRUO8bEQwYwnMYlMlDqK+I1aiqqQIvJPpH/VvK9bYjapUGwmvOqqnc8UmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6L6+szU45GW9hs5zqPcKPhl7Nb+9CWyWZHsZRhDVnfU=;
 b=Nzq0jKNEFTX/Rk8QYjbmdzoUuvjw81DkT9G2PBw8lIfMYhokGYrMz29ybJT0kt/4WDHB15gGgR8InY/TLtHQK/4Xvzc5CegnNJ7GACHdn1x/1W7V5A/fwt8wuJRRJeFhiAN2dx2Mepg3c/cuxapwZXSAsXJSQNHSAWZ1P6DoZTTGaMqt5BpFiMYQRUX/Dvh9tmsxXVYxwxA/ymbl9ejhFwYbc3eFFafR/FBTb6E4nVmnnfMzKbLAPQew6FnpPBMzoLJrSKFHOmpHw8TtCoTVhAfVmaZFzDyNQSyJg+PDCLURpSl+ZH7T4NcfVtSXle7xmjQIZ7XvzD7Scud12+sBfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6L6+szU45GW9hs5zqPcKPhl7Nb+9CWyWZHsZRhDVnfU=;
 b=E+2hppxiNa7Q5dxZTfUKEESgnciC2Qwm3jFkOYLBl89HGxv19670iq4ElyCHg2g/9cuk0LKqNbk5tWn0RYn85vLPjGs36RH1Oe1s7V6kDRjrDvxsnYu9XKiwNI50+dMynsfCIvtGg2HQ9iK2wRvOlN5DScywPLiG+W9OsTeZOEw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5335.eurprd08.prod.outlook.com (2603:10a6:20b:101::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Mon, 26 Jul
 2021 10:16:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 10:16:29 +0000
Subject: Re: [PATCH for-6.1? v2 1/9] nbd/server: Mark variable unused in
 nbd_negotiate_meta_queries
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>
References: <20210725122416.1391332-1-richard.henderson@linaro.org>
 <20210725122416.1391332-2-richard.henderson@linaro.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <dac50f82-4d3a-8a90-8969-481b02d570a9@virtuozzo.com>
Date: Mon, 26 Jul 2021 13:16:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210725122416.1391332-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0126.eurprd07.prod.outlook.com
 (2603:10a6:207:8::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 AM3PR07CA0126.eurprd07.prod.outlook.com (2603:10a6:207:8::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.7 via Frontend Transport; Mon, 26 Jul 2021 10:16:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2f17621-0c01-4464-bae7-08d9501e6ef8
X-MS-TrafficTypeDiagnostic: AM7PR08MB5335:
X-Microsoft-Antispam-PRVS: <AM7PR08MB53353C513F51E2071CB9AF53C1E89@AM7PR08MB5335.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z0ddEdakNugkQ3JZmv6LOkDwMagVJxY1cxiuDIVmtpw1eTurSrzSXIdcfrvfnUliBXCkd8b6zvGn8BKCGwVziZDg68C24ZNSYP8+QHx3Ala+WCID4oD/xpdol3dUFqOF4cpXzUzLgBuqgbiogwjhIf2pliJwpma65cYTpkczip0XPqa40Z6l8yD/zJncabCDs2ipkT9Do8exHPHp55osB1CmhTf4LH/hVR2nWytE7f712SR3eV6Q7TU0rhTdJPMtsT0j7rtVWnlW6ka5jURmGFVBXXmG4MoaukBmcet8bMFX+a5P3hHo8eGbGF1v36ZlTe6+wXfb9Fu0M4SjhJ20lfWATCMjoVrLOim0eM18I2NYNeUnClVjjXHFCLo+c1gXXm8fHhgHvarrToXwudlJBCHNQioIbO7kxbe5SBw4zYyFc12u4aYdP9xSgWjx/FLryT5ZF09Y3Choya/eI2RUWMTVY3WrPdC/Y5LqF5GoamEfPUM6nfaffG3+ZefMtmwjPXLPvPkFJu97pXgAE7tJwY/b9Uq8wbB5Sj+5bPhLZhqgpG8q72aslqgg8NsDveNxnhg8HwU9uA1rY8A/FPYc063hqkQkRd1fYQbFNKFfCKSwWabYFYn31HYctmc1udoRtxRH8ZCXkkcMctTM5MhcTRDlC9zvdKW40zEcwgzTewWkhevdKhLwjXfLe/eA6ODtfkMXfe7KQNDqiaug2O2JS3YR+6FDnXAEUvHLuV51elsBP0f6WndS+31Tq9iJ/4cQiNlky+oK71LTY9tPi2qELg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39830400003)(136003)(366004)(86362001)(478600001)(2906002)(2616005)(52116002)(8936002)(26005)(4744005)(186003)(31686004)(8676002)(956004)(316002)(16576012)(66476007)(6486002)(83380400001)(38100700002)(5660300002)(66946007)(4326008)(66556008)(31696002)(38350700002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0lGWHFmUlk1U1pkQVFLU2ZkV0R3aFo3bTZnTlFZSUl2b1gvZVJYT2haRzhi?=
 =?utf-8?B?d01tTUVyNkwzSzk3R3hUUS9NVm9ab1NKTVFtS2srMjN6ODh4UFAvOWdBbkg3?=
 =?utf-8?B?UE5ucUhQL1l1NmkwdmxJcXVWdytNd3NOa01SNzd0Tzlua3Q2TERXbHdWTWNI?=
 =?utf-8?B?YmVTWXhURFNGNVN4d2dWZUhKZXdCS016YllpdzVsMUg2TkRMNlFCMTZDRTV6?=
 =?utf-8?B?S2x0cTc0eHRRRkpSSHA3Q1pvQXVVWmpTNjVBSityeEpYZ1d1dE9pbzZvVGc0?=
 =?utf-8?B?YmJXblJ4Q2JwZW4wamZXU05BOXRvSkp5Tldlc0dWcUE2QlRIZDVRZC9TQ1Nm?=
 =?utf-8?B?VDVHbWVnczdPdVc2RTdWRHRIenppUzVEcFpGVkJtS3c1Q3M4NDVrRjg0V0JY?=
 =?utf-8?B?ZTN6ZUdiNXhPSUhOTDFkdEFYV1hZWjdJVTcwWnQxenZsQkZsMXdCWXk0TkMz?=
 =?utf-8?B?cmlpektzN2hRekNPSks0WDdubXZEOUZTZHVyUnVuWmFKTXBOUEF3dTBxQnBR?=
 =?utf-8?B?OFBHTXVjVEM3RkplYWV2a01Xa1BQdmRwUWlBN2pzcDBEc3ZYU0JValNSTmEy?=
 =?utf-8?B?c1hPV24wbUU2OGkzeW1FUm9SaTBaZjE0bWFXRENMekRhY25NenladmNqMlM4?=
 =?utf-8?B?L0dBZVNSbWlhbVN6TDN1N3RoNTNZN0lqQk1VY1pWeHRTVkg2N2tjSlY2djRa?=
 =?utf-8?B?ek1ZU1VtQjZFYklkZlEwV1B1cWpWaXMrQW1IbXpEOC9Oc2h3ZkpaeCs3SXZw?=
 =?utf-8?B?SitsSFZTYjMycUkyNXhTUTNQenZZWTd1akVtUm1KVEhSeTdlbVlIUnF2TmFH?=
 =?utf-8?B?cVBkaU02Y09xTUllbCtEUS9DdFNmTHllS2Z0NThsSTZLSVZVQmcycDdpZVF6?=
 =?utf-8?B?TTFsUWwyeXpyZnpBQnBGMFEzdzZvVWtCcFpRaENOUGJLNTdwZXZYRXB3RHRx?=
 =?utf-8?B?OTQwV0Yzb0dTOHIvcG9GZTRkNDVLbHdFU0NFV0d1UnA2NWZyVlRHcm5McW55?=
 =?utf-8?B?ZUFycFRkVVliZ1kweHR4dG9TMlpKMTNER3VPTEhOa0c2eFA0SVVKRDBBS29j?=
 =?utf-8?B?b2lDK3BKTUc1aDVNZkZxRGtKOW1xcHg2QkZCRDVaVURmbzFXeXU5VDBVYzQz?=
 =?utf-8?B?ZWUrbmVzeUdzRzFycFUxam9UMXFHUS9tZ3ZRY1c0NjRPSWxNdk1yYmlROWEx?=
 =?utf-8?B?R1ZDUWl2SG5XWlJ1Z2pxWVlrME00QWo1ckx3d2RucURHanE0MHlJQWFaWWpO?=
 =?utf-8?B?Y1pyM1hrM2tyamJnRCtIa04xYS9tVGFiNVV0VTFpSWFQUFNnM200SWJwQWV0?=
 =?utf-8?B?V256YzIxdEJVK2o1RldLc3UzYUhSNnZpM0JqQ1YwSTZRWUdYam5LbFU4cm9u?=
 =?utf-8?B?YjR6eStGUWpWd3hyUkNKdVE0UUtIMnZhcHdrcnNBUWRNb2lQV1Bvd1kyK2JI?=
 =?utf-8?B?bU1BeU5QU1JUVCtkdXNaSmNVM21ETW1xRFFWR0M5K3JwMjBvWGVYZ1VLTTYw?=
 =?utf-8?B?WWF0WkFpNUE1elhIc2FQYUFPWE1HZURTMVpzRmRtQmp4bVB1UHE1Smc5YzFy?=
 =?utf-8?B?VlFBTFFpSm9ZdGVmbXJjdmpWNVBMRzVNWDZOUWxvVmpQTHF3ZEhSNERPbDha?=
 =?utf-8?B?Q2VZZ2M1RVhTVFVRY3lRYjJnV2ljN01oRnlKNWNPMlRYcm9IV3MxTlJXU3JQ?=
 =?utf-8?B?NzN4NlpuT09EL0lUNFZTOFVMUnhzZzNOOTk4UUxMRjBCYUtzSHlBNEdaNHNm?=
 =?utf-8?Q?G3/dnrn6f/j4eNUxBs7aLqNBWxVcfIGoGHoFoYP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f17621-0c01-4464-bae7-08d9501e6ef8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 10:16:29.2045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enYYYi9gzuHSNdjxWOQicC9clzpoUwox/jWJ/kdxZLR8u2+GYlJQ7ldaak/4o++ot7cgsGRgeSSgiCiiNRvQWtMIz+r+DFWD4YLXtseCD9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5335
Received-SPF: pass client-ip=40.107.20.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.091, RCVD_IN_DNSWL_NONE=-0.0001,
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

25.07.2021 15:24, Richard Henderson wrote:
>  From clang-13:
> nbd/server.c:976:22: error: variable 'bitmaps' set but not used \
>      [-Werror,-Wunused-but-set-variable]
> 
> which is incorrect; see //bugs.llvm.org/show_bug.cgi?id=3888.
> 
> Cc:qemu-block@nongnu.org
> Cc: Eric Blake<eblake@redhat.com>
> Cc: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

