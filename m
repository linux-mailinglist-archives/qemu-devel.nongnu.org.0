Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC74438CCC9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:56:18 +0200 (CEST)
Received: from localhost ([::1]:40230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk9Ni-0001Ak-0x
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9Iv-0000xX-RX; Fri, 21 May 2021 13:51:21 -0400
Received: from mail-eopbgr80114.outbound.protection.outlook.com
 ([40.107.8.114]:11393 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9It-0006Sf-HR; Fri, 21 May 2021 13:51:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZECX+m1VlosARS4exz/KtaHmzf8Y2UWMkE/ME+pHdtBxVYFikZZQWogigr5nSmTWUueHQy8Pv+WtBxKY2jjQM7vTczdktq8EhgkoW4njqf0PiBBlpELhX95iruFHeqJ2FKyvHlUCPWYv51ORIuPXV0Sbe6mDZiyfqb6ifriFBrkmoswusItzk4PGF5XAJWDfiNpMxchFDmzbCeXQYy7vK9rs08ooCaB1fC9mfOh1IMezPmJfAiy2OviJs19wHW0fxkY5TYZO/7mpRjqFACWdjajdYRIzoZaG9BVuvhdcFj0Cv1iwSBQ+W8s41FeFKEc4KpopQZGGKrONkqNvUCf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVtSzq5fyeumB5/IB4AgLZO/TeeZtaYHOOLsojKUKLA=;
 b=EOhCE+QYoPFXk/iNzJQNOTMBPRzRqy/EIJw0AkLeJI3IYQEdMLa+K3AyA7PcyQu2AHgXzP6DRvPnJtoi/1kW80GPbbjn82A70tO1ubDn8z9wQIsAfoFx0tDeebGmexYXDFQjkxaAlAakAIShsSXjWFpac5NhShsZ6ZWUQlwZpfgxBPYdY929lTONc5m8IezVYjf8koSRuQN8ggrcfhQUAa8nduEqXGzLf63E9K4tAskRU76c/CjM/zxLARSqFGBeg9uTATZD4DqDVt0SGxJVAboiv3w3vJWxd9qEShkUyZkJdmu2D6AeXup6Crf0QM5+jjzRZtSvtxFRN0/RbsRpdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVtSzq5fyeumB5/IB4AgLZO/TeeZtaYHOOLsojKUKLA=;
 b=mM6lAKoyGUic4/eRIFzOFL1mD9IaHVwNGnETjgDsbvYK4dIrXvL3NYl04EU/etkqg9pvx0K1smOpDX4Ltzp54ZyvnqkTr+q+r2piAcWrGtnCVpfCWLqaGJg591Gl2D0roFFWl/BJpnRVFVP9sVGy1D+xUih8l/zmoHfrkcFnVZo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 17:51:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 17:51:16 +0000
Subject: Re: [PATCH v2 1/7] block-copy: streamline choice of copy_range vs.
 read/write
To: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-2-eesposit@redhat.com>
 <f5069a9d-cd23-26cf-c1cb-6f4f5774e48d@virtuozzo.com>
 <5a4cc9ae-f419-ab40-cd7a-d30e39f91e54@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <316e435d-2cbf-877c-cd31-adc6fe756238@virtuozzo.com>
Date: Fri, 21 May 2021 20:51:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <5a4cc9ae-f419-ab40-cd7a-d30e39f91e54@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: PR3P251CA0023.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 PR3P251CA0023.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.24 via Frontend Transport; Fri, 21 May 2021 17:51:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ab084fa-e197-4c07-ea27-08d91c810835
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-Microsoft-Antispam-PRVS: <AS8PR08MB5911946A856FAE21FA2E68C9C1299@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PyHDKi1amYx4TqZ1vGOqCNmP2eDvYaXyDWKTQGnDqyjRbQAY119o55LqzKXcK55fv8jlbLOyZ2afHfqkb2zsk6/+rPwf4IhNv5dTquiYG7tBMqPO8VNdl6xb8a9AHnzP79CV63c7NRNvMZwT3UE8eu6RuBP6SsHbDXE4F4rmRQPYn7rrl5o6NeOjf4Wvt8hGFvKMjRZ75tnD1rwfkSMngK17Kto7cQv6ePR3cWkLwSefZNVYtVhHWlfCDN++ULWHE5nOGREIpbVfLk8NC4ohPG5Cyn/LbUeBh2DmMeXgBHMb/YSULbynDpJXyFSdDW1HcKLwwAxm2dJ2XFYrpAqWyL/NsBZVKGOonwBzKFLFnt+AcNSmHSPAW26ffuhMtnY4krnnQTk4sQwovEwRhvTjZT6g+OvfZb9urB5TbHh7sLJ2vIfM5sAJoMX4bT4ryCNhdTo1AGkj0ED0wlJomZuPtyP1vUdsEdT3XQTE9kyaNBhBlL1nfZ2fFcvyHjJnpVeMxiYumOcILmvYd87KZwLwFt4jGIlpTulR9tIpgOlmWx03CPE1GwxAV8VsTWmosnG0YNWSXP4rPFx1uCcDULjdit7rh02QhFIUzEzwxVgfTJQWlj3z5iW8CEVMKOxJpWgc4xSz+acDNMbBrq+OJivP7dOfwQ2B7RejPtfOe6sQH5/7G7+ysJVoSVzRsdF96UaWPjRdqvYpC9O0lIs1Tr4nhIHFMRileEOK48a+bdpkTsQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39840400004)(31696002)(38100700002)(38350700002)(110136005)(86362001)(54906003)(52116002)(31686004)(478600001)(36756003)(316002)(2616005)(16576012)(956004)(4326008)(8676002)(5660300002)(4744005)(26005)(83380400001)(8936002)(66476007)(66946007)(66556008)(186003)(2906002)(16526019)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZlNVRDQrQkdUVGNKWk5UZ0VBRXJGcEdZSHVYbkdieS9KazYyTjI0b2hudlFo?=
 =?utf-8?B?RW04UEJtVVBSQjNnTG85NnkybFloYkFKS0V5amtMUVF0emJtV2U3b0tLaWN3?=
 =?utf-8?B?bjc0THFsWlk0MjVHdUFXS2s4R3E1ckY5SHhQTkxtcklHdnBGOGp4TXJBeUd2?=
 =?utf-8?B?Q0RwaGFYenA1UlhpaUM3eWl5Ymtuc3JXdm4zTzVaczE2WXgyN3JBeGNXWnJT?=
 =?utf-8?B?Qk82Ni9zenBGdm5seU9PckI0c0Y0YmE0bE50ZXFsRXBhNVlwVTdUcFVxbVox?=
 =?utf-8?B?Tit5S3c2WXUzT01RTHlPT2lTc2NDUXN0VWtPZjA5SjdsTFBpTnA2dTJRbExx?=
 =?utf-8?B?Nk1zYnV2S3g5Q0xTd05taGpUMytyMTlPNWFRUGxFYzREUVZZc296a2NweHZS?=
 =?utf-8?B?bE5JVkI4YlFUeEZIckg2S1lhcDhCRkdXZ2NmU05wM1ZWSktwVElnbHoyVVZJ?=
 =?utf-8?B?ZkYrODJQNXRubmt3eWM2cWljckllVVIvTEpUQnZEbWFqY3VBZmZSUlRJdzhh?=
 =?utf-8?B?MnNSTUFaTWtkZ1dGNGZVMUlFYTF3Mkp0ZFpUU3Fpcm9UV1cyWEJsSHQ4eGVw?=
 =?utf-8?B?d2xnbHorMTRWR2Y4T3NqcDdhaTYzR2FWck1ZSXpHWUlMTlJ5cDg3QWhVL0Nh?=
 =?utf-8?B?QW5RUE0yM0w4TkZjVmRIYXAyNkU5bUxHU1JDYkFuVEw2R0pZZ2ZoU3FaV1gr?=
 =?utf-8?B?eEdHaFB6Mm92R1JxYVZJS1Fub3lnNmkwZWptK0JoZ1Rva2p3ZmZaZGlObFpZ?=
 =?utf-8?B?bFB4Q2FMTHJsQWZPcVc5TXE1a1ZHa2lSc3gvQXF1bGE2Q1BXbzhiVERxY0Vx?=
 =?utf-8?B?RENsQUorY0d2dkE4RjBFT0JCbkZYbUR4MkZiUDdma2lWa09BQmt3RXhBVFJw?=
 =?utf-8?B?Q09DWjlCZlZJMXJSOHR5Rm55djdQakpxeWVUYkpuc09hbk1OaUlLQTNoRHIx?=
 =?utf-8?B?c0U1eG5Fa29KZGhSVzd1a0thcXQrRlpwSEVKWFh1YkZ4cHUxNGNpMHZGYWI0?=
 =?utf-8?B?SUJtQVJHSW5hOXVVQi9FRCs4QkF5R213MHJtWWRLTFNMd2NleWxBbzZEVndX?=
 =?utf-8?B?M1VSUjdFUUZ0YTFUU3NCR2xIeVhac1hQeVpRckFuUXFEK2xkcjI4OUFwZkc5?=
 =?utf-8?B?ampQR0ZTaE92R3QzczFYRk1LaERtWDVPWG8zVFh5dWZ4aGlNeGRha2htSUVq?=
 =?utf-8?B?bDBzRXhHcFY5L1BNWVRoQ05RV0w0SU9PU2VtMjBwd1p3eXQ5Vno3SVBEbUU3?=
 =?utf-8?B?ZktsT0hJcDNQbGhjSzB0V0NlV0hKR3RJVXhIdHBZZStqa0VJL01xbG9qem1Y?=
 =?utf-8?B?YXM2cDVROFEyV2JGY3N3aElOUUVYVHFTTGltN2k4Nm1lZVdwMHRGMHdZeEtE?=
 =?utf-8?B?b2hqeTB6Y09TMEQzUzFxdjNuNXZpbmlJcDdibEQ2YUsyNWxmTG91aU9VSDEv?=
 =?utf-8?B?TDF3L2EzRjlDYXB2Qk9tVmk1Ynk4a1BhSEI1WWxDSHNqY3I0Znlad0s0eDhO?=
 =?utf-8?B?eUFOOXF5QStZUzVtTG1nMVk4dXR1aFBET0ZwVlI1RVFMOFZ0cEtTWFdtbUIr?=
 =?utf-8?B?M3lwTHk3S3NIVGs0U3U0U3hkV2FZU3RPZUdQbm0zcC9BRW1kTkFLQkpNS0hh?=
 =?utf-8?B?Y2Faa1Q2SGZUTmhvWC9rbUNMVG9QVHkzaHFUL2wxaHFIQmdkWk5tTUl0aXRO?=
 =?utf-8?B?eTN4ZVZKc01Bd1l2R2FSMTE0RUtnbFhYZ3JLK0pOUGFZRmR0MWR6ME9iUk5B?=
 =?utf-8?Q?zMrQhYR6YebeF2vpkhKdThdu+HB3QX2o6DzyCPe?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab084fa-e197-4c07-ea27-08d91c810835
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 17:51:16.4841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRrZAOK0Q0BbbwuzsdZ6eBHVO/k9H40oOHItaD+DptmufdGM7sRBFHf5SWwbkW+c+4pmFthKr0iGJgnU7Aqg8Caq+qhSx4lCPRPbAzIGL2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.8.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

21.05.2021 18:10, Paolo Bonzini wrote:
> Stats don't say everything.  Not having something like this:
> 
>                  s->copy_size =
>                          MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
>                              QEMU_ALIGN_DOWN(block_copy_max_transfer(s->source,
>                                                                      s->target),
>                                              s->cluster_size));


Yes, this one always looked bad..

-- 
Best regards,
Vladimir

