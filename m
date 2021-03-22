Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CC9343BFE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 09:44:02 +0100 (CET)
Received: from localhost ([::1]:48354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOGAG-0002Ww-0j
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 04:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOG8A-00024a-Gv
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 04:41:46 -0400
Received: from mail-eopbgr60131.outbound.protection.outlook.com
 ([40.107.6.131]:11262 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOG86-0002Op-JV
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 04:41:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5ySUvOSHSmaIxZeBnQPFqyVN0B+zZ8ums8sqJCe6z8bezwxBUtKLJRCKSLEpO1lObnsE1XrO7rRQ/wJxkAvDAsNkPCRvUAAs/0ARX7l/FgwxEhkLm6PVAqVq2nkOnck2tAkU0HgIiSE5SjBf1oKkR7TyMbNsSe7SMbI73J/uo+/3/9FC7inaERtaeWFDHCiECbL+TZqY3kOZRAJpPn3+6V04rss7sZj1l6PBqltWYrit+DKParjGrrziNgJKuQavICITccrYUKYVwIwXF7ELWnrmW+LqnCkCgStos4C2Cq1XXtBflmds9hi0oF018Hf2XaiE7gxfq8z8y7Sf6b7gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THdQXtIBd5zltUxFWxRfTaU9ecCfntUcIRoP0LLMaW0=;
 b=hf4Y8Px5HCGYwKaQO8fLhFmzzdIlE2iqD9VnmFxwLfiNo/b82mG1C155S4dHlpBTDUYblwLAU0S+i44CXFabjEaSXLcbxykqwDcnWDzXaH5KTrvKWBhRI9Z6TPzUAdfGN7qxAZywIFN4rbzjaAkNyj1A15KdUA15f37IphkAAc0dvcKJpWkqcaY4x64v/F9+NRsOfmuH+cwHkIe/LDG3Q77I6oNLW15GT8hqF6IR9JAIjW/BGZvH3mWxcbhPB44v8JYR139B3TH4Mi2+NDjAI4OSr/fuc+9+9b6UOKJITmBSMbz9pN/nynwtE6L+zEbJQt0bhz3qpnvWz0gm0pmRaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THdQXtIBd5zltUxFWxRfTaU9ecCfntUcIRoP0LLMaW0=;
 b=SX0FWmswtq/f+muGqU307vMW6iJw5WgmZojnlv87nV0i6wzzTnplLRQaI50tbIsoJO2S6iUXmNDimSdmNiQAVKP9+Xq1cq1Lk6YtPhIAi0Lr1n6kjEvdLjrDuTum5egXMaztJoCcVw076vpdVktw6RUiOvFMEKxxt1Eh36QVIdg=
Authentication-Results: kiv.zcu.cz; dkim=none (message not signed)
 header.d=none;kiv.zcu.cz; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB2688.eurprd08.prod.outlook.com (2603:10a6:802:19::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 08:41:39 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52%9]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 08:41:39 +0000
Subject: Re: [PATCH 1/2] block/raw: added support of persistent dirty bitmaps
To: =?UTF-8?Q?Patrik_Janou=c5=a1ek?= <pj@patrikjanousek.cz>,
 qemu-devel@nongnu.org
Cc: lmatejka@kiv.zcu.cz
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
 <20210320093235.461485-2-pj@patrikjanousek.cz>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ee8fc7cd-1da8-45f3-6cfc-05ea5f1e9430@virtuozzo.com>
Date: Mon, 22 Mar 2021 11:41:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210320093235.461485-2-pj@patrikjanousek.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.15 via Frontend Transport; Mon, 22 Mar 2021 08:41:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f10f89c-8635-4994-4db9-08d8ed0e4f66
X-MS-TrafficTypeDiagnostic: VI1PR08MB2688:
X-Microsoft-Antispam-PRVS: <VI1PR08MB2688CC7C36C33DBF81F61063C1659@VI1PR08MB2688.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oeXao74WqSgkaM3gYNVL7WtaK0o85Gs9PNFLamOVcCF5Xi67iBXlM89CzeVLKWXMFRbc2MwVf4uPbbBpHq1ruPgyGI5KdlvV5QqvV1TL5brDNLu8WsieU2DHzMDsrv488/hlM7LjbRqycM/XZXL5HqexyVpTAPjOwPJrGgqlGTWL5Fxlukm13OKWI1k2bFwLTlRYsu0GgYpyZBbT2QmyhKjRdEXafxcYNrSuator5AYotqLCwzK+uu30V5jT1rjYEpvVF6xLL2PRhXc8adjT+8s0CZ9zZI34d9JJGrZxfo14IhXb0IwIO3onbQd8JOq5N30S4BiBeGMkZbckHKX2nnwXTTbV4oU5+HORmTZmtKU/2MnkNh0+0tyZtzqC+YPVpsos+xI62R762PmA4e4w/hIMxpOdoFqSRkdqW6oECBOKEAOU21r+gJ62Dho4VjM7LrO0uiQhdPVkUmtxIZ5zIc6dXEFFdvbyCw40XzerJ4G3/yFeb2xeI/yNOmyvZlGWW+BvaKIoAjHXJLRYCTLLr/OgjC+B7jhg0QjJ/PQ0E1k27xi00IWQaiO7D3ERBAchzLTpE7mVQsLSfOi3XRj8KL9YFX6mlEt+KXJ2KK4hxQmHO8bRfT+1sU3nn+RO9ovNjq8UsAZjPf1T5MWpmMrDo6HaGsaeD1WXR2Jln56lE/8pEM/mkAVGjZE2sRDYJvrZI/YZY+W7B80Nd6c5PKUgc45sbrTu+U7jLZCzt9gM7POY+Gt04RScIDR7aNG7Szth
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(396003)(39840400004)(66476007)(38100700001)(5660300002)(66946007)(83380400001)(16576012)(16526019)(66574015)(66556008)(52116002)(478600001)(316002)(36756003)(186003)(31686004)(956004)(6486002)(8936002)(31696002)(2906002)(26005)(86362001)(4326008)(8676002)(2616005)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dGtWOHZTU2ZJSGJtejhYclhyd0FwM2ZiTkNzaVd1WkxNWk5LZUV2YlMwbnlS?=
 =?utf-8?B?c2VKWFgwTU55ZWFZdTVHZm5XVnJPdkhZTEpsTUVnQmt1Y3B5aHNScm5ISmtX?=
 =?utf-8?B?WlU2cGRGM3lKclNHaXRNUWo3ajFMSHdxNzBUT0p6ODRsZ0Yydk5BQ2NRUTd2?=
 =?utf-8?B?QVFBeEY2elJpeTZHMi9JNjJCQXdsYml5bEEvSWw1OWs2SkZINi9GeXVVaS9H?=
 =?utf-8?B?d2dwZjlYSkt3R0NzdHZZV0ptdTFodTArV1Y3dFF4UDA0TGwwRlBoYWdvb0xu?=
 =?utf-8?B?M0I1Rm13M1dCcE14eEV0WFRsRHpsTGk2NmhzS0pQaEFGU2dsN0s4cTBtWDV3?=
 =?utf-8?B?VHdnYTJqQ05VOVR3WGhNR2Z1OCtJQ1lKbDcwMi9MQVk3TmkraVVRaUM0UHQz?=
 =?utf-8?B?YnhuangrbHFubGdZb2J2SWxkcGFMS0dhMXFBSmFEUDZxM3BUUTdRT3Y2RFho?=
 =?utf-8?B?aktZVFhoSmtwb3QrUEtqSm1SbDhLenUyVFV5UUI0dGdQUVZzekl6b1BidzBV?=
 =?utf-8?B?YzdWN3ZZUDRlbUVBc1hPVlJ0ZnlWdlAzbTB1TWk2MUxmMWdyVi9xZDN4T0s3?=
 =?utf-8?B?T3prS3NTM3k4dmRzVUhLM3gxUGVSdUNDYzV5WFRLdXdBUTd5S1NnYjQ0alJN?=
 =?utf-8?B?aW9NejUvNTNGWW9TS1FId0RtMDdYKzRVUGd2RVFxS29tSTZFZTZTc1VBM3cz?=
 =?utf-8?B?bzB5V2NaK05RcjJuZStHSXlmWWlsWlRFRXNiNTQzNnlwZmVaUmZicHZlR2dq?=
 =?utf-8?B?ZDRGVFFPRzdJcmdGSFljMWlqK05DZkpLcnpLbDNXWEN4QjNSTnZMSlg3ZU1y?=
 =?utf-8?B?M0wxQjEzWnZuMTRUckcrMlgvaXo3MTJ0WTdaTGZJSVFtQklBcUxSREpnUUpL?=
 =?utf-8?B?Q3JSY2IzY1RHL2xFOVhEZUFpRzFJb1J6aTBBZHVsZkFKV3UvaGkwRXZ4dWVr?=
 =?utf-8?B?QmI5VEpiUDFrL005THNSc1JKdmluckJwb1ZQSFhMeVhSM3BiM3RaY2xFY3Ax?=
 =?utf-8?B?RnhBNGJsTXNBdERkWHJ5blptY0tEYjVFRzBXNVErWUtQaHphSVdveTJGbGt1?=
 =?utf-8?B?dkNycHcyTWdUWVZUWnZ3dDNueEluVjRlS0RVUFUzMFJkVnpHSEpyUFUwUTZ0?=
 =?utf-8?B?NnZrQk5aTSs0SjVoT01zU2VKRVIwT3hjcjhpb1ZiaTdMNWd0U2twNTVFcVJS?=
 =?utf-8?B?WVVvVjJjaDBKWkVZNnU1WG50Q2FRbm4yR3B5a3V6YTBSVGxKNStrYmZWTzlz?=
 =?utf-8?B?SWVDUnRVMjBsZHBOYjR3Vk1YVnVlclRoRENXUU5ta0FXdm0xR013MFJ4OEhG?=
 =?utf-8?B?cXhnd3ByV20veVVYV0NteHJHYUIzVTRQb3N2bG8wNXVycDVHaTZ6blUvZm9h?=
 =?utf-8?B?V25LZi9UaFYrUmhnTmN5ek5lV2pncU51S0NhdWx6djhXdHB3VHhCeU04Tk5G?=
 =?utf-8?B?Z2dRanNDZHQ1VDJRcFBkY0MyM0RrdGFSb242NDVwakNLYnpPd05tK1ZHaFVT?=
 =?utf-8?B?TDVNZnY5bEJILzh1aXNQZmFHOXBZR0tyWTlqcnI1WFVzZ1creUtXVEkyb241?=
 =?utf-8?B?UG1jdzFMKzZGc3lXKzFLUzNXRkwzTnhPRGF1SjRLWVlObElHSlQ2ZHJMUWRj?=
 =?utf-8?B?QXJhZGw4VlY4SzdsZG82Tk1MUTVVZSthZWxDMytFczJtNkVJQzVXYndvQVAr?=
 =?utf-8?B?NlFBUXM3NTZJTTk5NXdTQ3FJdmhQY0dYMytHTzlvRU4yK2pTbFNuMnAzcGNH?=
 =?utf-8?Q?GoV5oZLFILbm6ksh1gCHgAIcOGWrbalgF1mG8lz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f10f89c-8635-4994-4db9-08d8ed0e4f66
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 08:41:39.2604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqKefLeNTejXdWyA7UFM2ZHVx5cbL+iuFLDLYoZGzvhE9QFmxWzCxvzZ7g7N6pP+L9cjDBg1u6/AO84Bg2br+qii74NvU1fyKaLWZTJXulA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2688
Received-SPF: pass client-ip=40.107.6.131;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

20.03.2021 12:32, Patrik Janoušek wrote:
> Current implementation of dirty bitmaps for raw format is very
> limited, because those bitmaps cannot be persistent. Basically it
> makes sense, because the raw format doesn't have space where could
> be dirty bitmap stored when QEMU is offline. This patch solves it
> by storing content of every dirty bitmap in separate file on the
> host filesystem.
> 
> However, this only solves one part of the problem. We also have to
> store information about the existence of the dirty bitmap. This is
> solved by adding custom options, that stores all required metadata
> about dirty bitmap (filename where is the bitmap stored on the
> host filesystem, granularity, persistence, etc.).
> 
> Signed-off-by: Patrik Janoušek<pj@patrikjanousek.cz>


Hmm. Did you considered other ways? Honestly, I don't see a reason for yet another storing format for bitmaps.

The task could be simply solved with existing features:

1. We have extenal-data-file feature in qcow2 (read docs/interop/qcow2.txt). With this thing enabled, qcow2 file contains only metadata (persistent bitmaps for example) and data is stored in separate sequential raw file. I think you should start from it.

2. If for some reason [1] doesn't work for you, you can anyway use an empty qcow2 file to store bitmaps instead of inventing and implementing new format of bitmaps storing. (Same as your approach, you'll have a simple raw node, and additional options will say "load bitmaps from this qcow2 file". But for such options we'll need good reasons why [1] isn't enough.

-- 
Best regards,
Vladimir

