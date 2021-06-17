Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6BD3ABBEC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 20:36:46 +0200 (CEST)
Received: from localhost ([::1]:53814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwsf-0001nn-Iw
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 14:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ltwrS-00011Q-Np
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:35:30 -0400
Received: from mail-eopbgr40116.outbound.protection.outlook.com
 ([40.107.4.116]:11171 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ltwrP-00081P-V8
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:35:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjX0O8QtaSknD57s9XdreTOoW5aN21/6iU8dkvjlKYQuPkTeLmCXgETDCvt+UboodYCGJxg1dJXf4GqFs8L8MwoO+kDctckuKPqYzGPynarMj6+PXBHnYYPC3eJ/NoiPxQGkoYujCuxK71/5MqY8RqvlF10i+g14N1pjqXw3pE58nHc4oOcjDRqqc/aeHllWiXAgeLOUrSSxcdrOhEMiaF6+nahr5DaWn1+BCxb66WHmymipTKI76twMUzLAgWYqg1usvQPhCFAaEu/Yoj4Cl6QpV+JYwavZaASURxzLWDdGsKD1VlrO/paiRhGjLtNtEa/xuZ+ENALSVxtxbAyeCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bmfMKTKEK8LFutQmUCChUcrmPp9fF8qFLPQJGoRB4c=;
 b=h7LnhoRjViJvuWBDFd/X8q4UDat9FTrMcahQr//cLlsoetdHqUO8Wpuq97sHNdnkqtvaTyibEIo7T6Xzs+v0gSOKjln/2G3ZbCOJWXsT/8ZZ1UNggbB/07Zv7NHgveRpUFksujN/VcFMiWaSUOc1qulkY6VMeeQSTZZaSvPftC7XyxA5d8sSgNWIBsoq0hQ+h/K1QKSRSQB8ZCLmqcUvMOfkOsW0CHzCFTAZWMnkebYw+RdRq6Q+/+xl/Ck2qGPZaxhJisiqKDtA62ZOEQQZ58Sl5QDeigoQ/6/r7SCbXxIzmYB+NEWcXbX4jPsUS3FG8luRSJT5vtxfhsWnlLEgBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bmfMKTKEK8LFutQmUCChUcrmPp9fF8qFLPQJGoRB4c=;
 b=Cd0vORVE6dB28C/DA6xiZ7TARw5Ipcj8YWQAYEPAaDjDrU6C/vBuv1R5AFhGm+l8EZLFYm1wo/mNKnQbQIplWdJyziwBM+lnm8nML5TxxUDYbYHqga5/jwAXXGZpPuDhx0tXLlVgQUbd8ZtQHZaSVPLahtgssHy1G1uFP8fKF5c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3029.eurprd08.prod.outlook.com (2603:10a6:209:48::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 17 Jun
 2021 18:35:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 18:35:24 +0000
Subject: Re: [PULL 00/34] NBD patches for 2021-06-15
To: Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
References: <20210615204756.281505-1-eblake@redhat.com>
 <CAFEAcA8an=yP87_nRCz-scDoJ7ut3zi8hKCfiai1_N8ETSjzkg@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <61d673cf-889e-9163-81ea-27e55a6af73d@virtuozzo.com>
Date: Thu, 17 Jun 2021 21:35:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAFEAcA8an=yP87_nRCz-scDoJ7ut3zi8hKCfiai1_N8ETSjzkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: AM8P251CA0026.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 AM8P251CA0026.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Thu, 17 Jun 2021 18:35:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38e5876a-680c-4dea-46cf-08d931beab6f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3029:
X-Microsoft-Antispam-PRVS: <AM6PR08MB30299B57422CF6BEF1080879C10E9@AM6PR08MB3029.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EcWRSnC/1xQLWVivayH8DQDonC8KCYfrkLKAYWKPdWe/FI9AJ8O+Pw4/BGl21nX4AORPfr/m6xBqHVccNeukCt5SYpl3szM6CKhGsnVz66XFx48WVvlYJ29OegRJi155iH7pTyBIlBAoVWwM1AA2+TjW6+RwlflZFKyJFlrSWIso9Yb8kngjseT/jMN6BFIqoQapMP8fgyy7H1p+CmNFena69tja9MFuIVApRNUOpcIYmWCK+1yIsvOqA5Qnh0iTWwGQY0qFiRlYs2aU553UAD6L9Neyp4jW11SHMP+CDnmgu7yhctwlyVXK7WPsLLQVkgtYhg6ff7ksirORCUlgNW5LkFNSGyEzzr3Mpo1cRuVVvhXZk/k6HtoxSlAMxK+g2HrsPPCyU1nO2b+0fVNFqhnPNnX6ha1j/ql5qRb4tH5/H/TOm7fMfUZbdhiM1ZcQvrekhHm8yLwx5Vklrmq3z1szraSwFIxMvPnd2IzukiiSyXAQfWQDBBswW3LDI9PmKMMFE8wTBd1gAYtuH85iu7YDIAc46XlZf6rvGX0vsvfx5OXOAzcSKBSyyFPmhXvmQz2BJCZ7Ds8WQrn/Dpz+foDs+G9vd1TnLbnA7Cbz8ddT67mxRG8hb4iLj5TwkcSfuT/JQWlxsKMvpwpxTv80/Sm+hplAViBmxwUhkAXAS63ajEHD9eUkgZ5T73ZXxDbtCt0pCh+IgHub4cJrittvsEw454DfnIvlFgzEDEdCWO0hHYJSP/eLd7WFznzm7aDjKZW9Cj/lAKAjUjGlNeLtONbERrgtWfuH45w9r7mTs5FHsr+aLPvYSoBpQo+q3TUo7Y+L9BtC+JdEi/wIsFmieg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(346002)(39840400004)(2906002)(966005)(5660300002)(16526019)(52116002)(956004)(186003)(31696002)(38350700002)(4326008)(31686004)(26005)(36756003)(83380400001)(8936002)(38100700002)(316002)(66556008)(6486002)(66476007)(8676002)(66946007)(86362001)(16576012)(110136005)(478600001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0lsbFhyOEVMRlErRG0vVWxld3Z2bmRSd0RWa1FCRHdnV0Jma0doK3ljRUxE?=
 =?utf-8?B?ZDFVQXViNnQxS2JsVjVNWmFVaVhndGUwMTd2K1JZajdmL1NoTTlqc2R4ejFp?=
 =?utf-8?B?em5YaWdEVWozem9lMUJPVDU0aUp4b3djTzA5NjNpQ2FyeW92WWN2WGphOVpu?=
 =?utf-8?B?dGlFUDl1enBNTG1aaXpIZG1uTE4xNzhNRTdFZFAvWnBWN0s0Q0VYN3pNWHRK?=
 =?utf-8?B?RGdlYjhab0NOaitKMVovWFlQT1lWS0d4eXBrdWljdXRjOTExcUJJOTBRS1da?=
 =?utf-8?B?K1Y5bmozOXlXdWYyWXZZMHFYY2lnY3VTZWl1cWp2dW9yVkFMd2h4dktoZUNC?=
 =?utf-8?B?R25MSlJjQm1DRzdGNVhEdHo2OWp6M0lBa01SekhMUlZwdkd5NDNPY0NoQUNV?=
 =?utf-8?B?UU8zZ0s2UlBwVWRHbldQelFiWGM4czB3M292d0JLRnZUdUg1bTUzS2MyVXM2?=
 =?utf-8?B?MHMrMEpYN09TL2pMaGJZVWxmSzFBK2F0bmZQV1pBYXdLMmJaNi9SZ2xERnRR?=
 =?utf-8?B?QUdwemJCWmZFVFdSdFcrQ2xtZ1YwdGNVVTZpRUNtVXB3K1FMcXZDM0pscmlt?=
 =?utf-8?B?MEZEWUNFR0svRE5vTW8vbTk5TXU4aEIzNlJLeHV3TUphcnVkN2FkNU5wdzI3?=
 =?utf-8?B?R3JrNElLK0VocjdTWTU0Lzc3S0JVUVNKK2trTDEwZ1RUc2tuMXdPYUEvcTg1?=
 =?utf-8?B?c0ZiTTBTdmt6ZjA4NW00dmVPZzBFL3VqenYxbWpmbDJsOHNTdDFHVUwvZkFF?=
 =?utf-8?B?ZThtNXA3YzZSaXdDdFhNanVLYW9Pb1lDUFg5WCtXcmlUUzJtT281MWVTcWtW?=
 =?utf-8?B?c2JYbEVidlJLbG83cTk3UEt2UzFzamZpRkpwc3dKQlEzb2g1a1kwTUtrYTR5?=
 =?utf-8?B?SGxSZS9DZzI4VkVWRjVGS3BxRUkwTTBmZUZsbHlRaXl3STJ2a3BhQXE2ZXZp?=
 =?utf-8?B?a1pvby9uNDVWbmlWRXhNa05pVzUzSTFIalFpYkZBbEJQV2FlcVh6MTdFMmJJ?=
 =?utf-8?B?bkdxZWdOVFNHY0d5bkZEOU8rUnFLTFFEaFJuWUs3ejJaWEhhR2RBNmtZYVA2?=
 =?utf-8?B?Y2orM0ltaFlwVXNJSG5zOFhsVGJoMGhJN2FmaDN4Y25icDloZnV1WjJ4Mkp3?=
 =?utf-8?B?YityWGF4MExDekpyTDRYaW9xYVBpWURYOHdDRlgrZzVETE9pMnAxa2h2bExB?=
 =?utf-8?B?cmg4RGtLQWpXNHBXNW9Sem9xd3phQlFFeDQxSWJjVjZnOGFTYTJMUWxaZlVm?=
 =?utf-8?B?RmlPWGZCbGtSbFNoNWtmanJHand5OXZOSVJRcU1FVVdUaFJ5eVZBbTlVNzBE?=
 =?utf-8?B?OFpRMjBDM1FDK1VaNHM0d2ZPUXROQS8vSDVrTzNSL1hBL29lL3lqNkhWZkhI?=
 =?utf-8?B?alNVMUhaSlh1YW5BUnRXVER0NFdlcVkvVGpKTGYxZ2NmWkY2ZjdSK201dXVE?=
 =?utf-8?B?RGNmNlVPSmtGT0hUOS9tMTdWYVV4OWYzQW5KdTdjbGpRays5UUNwWXBpYVRR?=
 =?utf-8?B?a1lCYlRzdXZUQy9IR3ErTXlDUSt1YzFkWHV0TEpDMlVld1JkRTVpWCtuOUgx?=
 =?utf-8?B?V1dKTzQ1M1AyN2YrT21YcG5DTDZsZ3N4YzlNODNqUHFOQk1IeW9XTkp2ZUVj?=
 =?utf-8?B?Y3ZXOTFmTFMyWEpnbTdnYmd4SDJnWnozcEhXMDM3V3BVczhtZHNqa2Y4d2sw?=
 =?utf-8?B?bGVIeTU2Q2I2OUpjT1dIV3c0emtoUGY2ZEhNRDg1Qy9ueVU1aFVzOVpORVpL?=
 =?utf-8?Q?FBgorLHE3IT0jJo0V3F2fVRLr9joXWb7hoT4PLh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e5876a-680c-4dea-46cf-08d931beab6f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 18:35:24.0793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2z+QUrcOvNWD0iPmwe8h0qIkQGyaF+YB5vMA5GuibJSlYULewV75vCn8JrCnXJiP99XpgN70arqK6lEGDNXrtHjDnxj0I1yZszxz5DdyUQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3029
Received-SPF: pass client-ip=40.107.4.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.254, RCVD_IN_DNSWL_NONE=-0.0001,
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

17.06.2021 12:42, Peter Maydell wrote:
> On Tue, 15 Jun 2021 at 21:50, Eric Blake <eblake@redhat.com> wrote:
>>
>> The following changes since commit 1ea06abceec61b6f3ab33dadb0510b6e09fb61e2:
>>
>>    Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2021-06-14 15:59:13 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-06-15
>>
>> for you to fetch changes up to 788b68b57dea4ddd0038f73b96c147eb406c386d:
>>
>>    block/nbd: safer transition to receiving request (2021-06-15 15:42:33 -0500)
>>
>> ----------------------------------------------------------------
>> nbd patches for 2021-06-15
>>
>> - bug fixes in coroutine aio context handling
>> - rework NBD client connection logic to perform more work in coroutine
>> rather than blocking main loop
> 
> Fails to compile, all hosts:
> 
> ../../nbd/client-connection.c: In function ‘nbd_co_establish_connection’:
> ../../nbd/client-connection.c:352:16: error: ‘ioc’ may be used uninitialized in
> this function [-Werror=maybe-uninitialized]
>    352 |             if (ioc) {
>        |                ^
> 
> 
> clang is more specific:
> 
> 
> ../../nbd/client-connection.c:298:21: error: variable 'ioc' is used
> uninitialized whenever 'if' condition is false
> [-Werror,-Wsometimes-uninitialized]
>                  if (conn->do_negotiation) {
>                      ^~~~~~~~~~~~~~~~~~~~
> ../../nbd/client-connection.c:302:21: note: uninitialized use occurs here
>                  if (ioc) {
>                      ^~~
> ../../nbd/client-connection.c:298:17: note: remove the 'if' if its
> condition is always true
>                  if (conn->do_negotiation) {
>                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> ../../nbd/client-connection.c:281:20: note: initialize the variable
> 'ioc' to silence this warning
>      QIOChannel *ioc;
>                     ^
>                      = NULL
> 1 error generated.
> 


Sorry for this :(

Only one patch needs fixing: 28. I posted a squash-in. Eric, could you please take a look and make a v2 of pull request?


-- 
Best regards,
Vladimir

