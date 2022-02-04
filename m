Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF894A971A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 10:46:34 +0100 (CET)
Received: from localhost ([::1]:56540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFvAn-0007fG-6E
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 04:46:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFuYp-0003er-EN; Fri, 04 Feb 2022 04:07:20 -0500
Received: from [2a01:111:f400:fe08::70e] (port=8259
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFuYj-00053s-I5; Fri, 04 Feb 2022 04:07:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ciy+vKJ9n5nwv0iq8oEDtkABs4aSkYo3hxptXLQPhAqhd10ugOhHNd8RxsT4ztYfS67Jj/RuSFG6DApQk9d2df5ulhj6gPtJyCjy//ML/vRQcA2d56sHbT4bEpS6LR8eSm/hTvEmNynlH8NxsdM8vavekkm6d97/oKswv/Hbu6b8CsGhpx03f6p67MFG3PcN1J+8lxnZTRKhRGRNuwEg3buzlXZOEda7yDgTpHX5pdjTy4ufsKidiZjfptFnxc8R9iJVBDJu5+CLGIkqnEGrDKPAMpnZ0KN4+gn/Mwz/be9BI9b+xuQPZRk6KAvr1fUXanKcUd+3A6uLHGsgZqmbSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CcsFq+gIa+fvG2Jv71/+kA/zDfAc+vWS7DZJgRkJls=;
 b=Pzqm3+WC5l6CnJDMO+A7HjBJVttqhtzX39NT0+0KK+A6yaygmqt9j/jEmnVs+oH8njV4F5GymaZycgKAAoTULrpTm1H3PXuswBuT648aDn5vIZTEXgHx+UReheBVqfyo80K4guc0mFYy2XMdtJLGwS2vtU/OjtzogiGmPHbzLkMvbxzmZngxpq3mWRcTAMfJl/XGJTqwr4nZWw/uqwJgyJl6JFhU4Syjr23u/a0PzzeB+UK6FMINWPdz9CjZ/zRNtDh8wszoRlui/26DGWM6dzdWlViWrTTFlDn9VLYHGnWB7+d9cepO9DqEhaGyo9HO3EzOgNOydT1o1IPD6AoKAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CcsFq+gIa+fvG2Jv71/+kA/zDfAc+vWS7DZJgRkJls=;
 b=p0o4pZtmK7w3xWLQ8PLx4gkf/JNegG5EAnjhwLid23tjcZ+hjmQQ41hCZzAdXTG9WPZ2rnILGyB0Keyf1fM5bqdMlD+BM5ga061rQLKLiZ68uYXfnYHdHi9xM528Vb8fbtbbfB/uQcOXlTaxvAo9rBZiRK8y7vbjuX8OTfP4Eos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB6532.eurprd08.prod.outlook.com (2603:10a6:20b:316::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Fri, 4 Feb
 2022 08:53:00 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Fri, 4 Feb 2022
 08:53:00 +0000
Message-ID: <277e7d4d-dfde-86c4-559e-2e8aaa2a0612@virtuozzo.com>
Date: Fri, 4 Feb 2022 11:52:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/7] block/nbd: Delete open timer when done
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220203163024.38913-1-hreitz@redhat.com>
 <20220203163024.38913-3-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220203163024.38913-3-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 533dcfb7-deab-43b8-3b8a-08d9e7bbbf24
X-MS-TrafficTypeDiagnostic: AM8PR08MB6532:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB653278931173652EC2033525C1299@AM8PR08MB6532.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9EFvNmL18XKb8RTqabtrbJAw3kaP4KnBp9+bl4RwoNzxlauiNVrbeQmlFS5PY0KhjOY+kpwfz1ObSn+BS67xlJu3txAeAdDMHj5PJ8NVzOc73yaFu2o4sBAyt+vcNuAUsPk0eSfvQgfi1MreVeaKAQv0T55nFeuVSvfPuUq9YDjb/mgDeZtdUwyX+7lrsqwfV80oaMyLBQEdR2fTOqJTf72qAbjuzB2b1G6fAnhwZLTIn2r6+fSmBFJZM8moIDWONENWvjl3LwpyevM5UJeKQMNbYyoS5MF3tNHzJ1yjsQFmMltTMjri22RQuJ/8B5CkpRnRCm/xlnm1CKQLDDIwSU8icNwgNrkBYG8QuIySnnuAH3Cy3dbBKUbqAJ+S1Go4Wx/1YClDixKB3D71nlnX/bGKgg0OyNqZxXVtyIHssLnrfvg64QvQk5LQHEhTr8wshqzidoC15A8rQCs4LywAf4a88qWRgLUPpGfCqM7AHVzS5s2Tp/TopUF0D/oWBGZwOLCb+FxubCZs6USw1zeoVxsQybKrxGjJSIbuqfSIP1CpP3y1CjOFYfiSQP6c0/QoCwGvTE/jJ6COQgcGLV0mDvROI9bfaTVwKdm3OKSciG+aANUpDrkWnQo5gCfAHg7oAEg1H6CL5zEaFiAAKRWlF1aH0yk0ooWAvuj69lK/VsIH69ux27yxxEHjla3d8QY6ggo7zz483PfPDm2x84gweYDvBGAjL4rDgkgcpjJiKECb0IBgnZ9e5baOgyjs5PA07AI7skVXNvJPT21ZD1J21w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(2616005)(66556008)(31696002)(6486002)(6512007)(86362001)(26005)(52116002)(186003)(8936002)(6506007)(2906002)(66476007)(36756003)(8676002)(4326008)(5660300002)(38100700002)(83380400001)(31686004)(38350700002)(4744005)(316002)(54906003)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlcvV21jeVV0eEh2R25jbHB6MmFhQnZlMnhkRXdnMTNVdzFXVHRHVTNZNmc4?=
 =?utf-8?B?TlJMRFV4cCsycXZGZTRzdjdhMWhVSWtPOEQ1dXRNS3AveC9GRVlhazlGb2kz?=
 =?utf-8?B?L3d0OXFRL2dsT2FJRHJ0Q3BjcnNGeXkwVlprT2thNWFFSmVLYmtKYXhEL0sv?=
 =?utf-8?B?RlFEaVZkenhvU2ZzQTNOS2w2WTFYTDJ4QVEyL3JuczhCdXdMYVJlRkFDWVV1?=
 =?utf-8?B?SFhQMEJPT1R3ZTMrL2s5KzlBVGVYYlovZndKWU96dDRaNVA5blpJT3FnUlBL?=
 =?utf-8?B?SWFXZzVNL0l2L0hxSWxyU2NPeG9uTElhQ2xmSjE3VCtKd1AzY2k3MHZvZGY4?=
 =?utf-8?B?YVgvMVdVenJhdjlFTmhJSUR4bFByU0RRVlVXSS9KU2lIY210a2R6Z1NyaUIz?=
 =?utf-8?B?d2cwdTJIalJsQk1BNmZEMXJYdzJTZlpkOHdnVXI2ZERvOUJDWEdaVXhPSXlO?=
 =?utf-8?B?OTUyMmhXUVhjR00wQjNnaXVNME03Um82SkJPNWhvNHpBWk1pY1lnT3ltaXJl?=
 =?utf-8?B?YUZyc0sxVDROeCtjZDI0ckFZUENtN0E2TTUvQVNvRllFWXk1dzBLTnJTZ3Fk?=
 =?utf-8?B?RC9IcWRhWWQrZlg4bk5XMDk2dEp5ZDE3aERjK2c0Qk14Z2htZ1NmZWpHdHZZ?=
 =?utf-8?B?Sy8ydUptWncyYzU2UDhJOFJSYnFaakYzdzZjTERKQVYzTnErZVhEQmFkQ0Ex?=
 =?utf-8?B?clhZaWdiUkZEeHBPWUEwT3QrYWxyNUtOK3RDOWJDT2wrZFQ1UElVd0xtenVj?=
 =?utf-8?B?KzJWTTVnbUhBOXBYSFZRTGVsYVFUZWcyZXE3SXJRK01mc0ZBbkJERkZNN0hK?=
 =?utf-8?B?NDROQmpScEhkNUdmaGJyVU03RGs4U2l4V1RrZVdlZUZzNjVVZ0V2Qjdwa2V2?=
 =?utf-8?B?ZkdFVUlTOEhmZ2ZKZ0YyK01hb3Z0ZDIwbVlGWnQ2cTZkM2xKY2tjZytsOElj?=
 =?utf-8?B?bit2VnVkSWdxcWdyMXRROGZUYk9vK2drakp3WVhQY3RJU2F4TEQ4Nyt0RC9r?=
 =?utf-8?B?QXFVMjBtSitZaFNobTdUSkVSaFFjZEJxUUFZa0ZUdDBGL1FIZnU0ZDB1eE4w?=
 =?utf-8?B?VVUwYUFJdEZhNUk2MW9ka2lyZ0F5YW00Q3VZVDdjM3VRQ05pL3RjWHJCZG95?=
 =?utf-8?B?bUxzVXRBbnJ0Uk1DYWxxRndUd0FxK2pHSjZtakZVcEFWU3BuNGxFd2tTS3lv?=
 =?utf-8?B?WmZRM2htdW03c3gxNEFEeWZpRzgwdkZwcFBGVFVhRlhWbUgyWXJZS2FpZXB6?=
 =?utf-8?B?cjZXT2RRTEVndzJ1S0FNSVZ3YnNUU0hRUmtNZFVOTFdSSjVYVTRKbXlKRWR6?=
 =?utf-8?B?N3RZcWp6blQ1SmFDNTRBNXpzNDBrVEsyeXJsMUlZR3dxQkdjR29yT0JFY1NC?=
 =?utf-8?B?UFk2WkhGYllITlBFOStYZzNNV0d4UUYzbHplbG5PMzR5aSs2TFhqV0lkemd0?=
 =?utf-8?B?dFlIRWppdWNjMWdIUUFONXVtU1VjQ0VUWDV1ODNOT29FVWxzNVpXWkQwMTZj?=
 =?utf-8?B?V2xHMExLMFpQbUxnMzFrUDQwdk82dkNIclk3dEdIRXRDSnZoNjNRTVNBOUIv?=
 =?utf-8?B?M00yQWJYcnFpS0RKYmdyMjJwT2Q2MkZLMGFFNmtzNTRibkV3TkQ5b2w2L0lu?=
 =?utf-8?B?WU53QVdGOHMvUXoyL292TElpdWVuUWpKcXV3V2QrZGp5ejhqdVVWdTNtNXF5?=
 =?utf-8?B?S2FRcGQrWTdZdi9SNCtRUkkrc0xQQ3ZteFArcE55ODBWNG9CNFFSNU80YSs2?=
 =?utf-8?B?bmo4ejQrdUFrMkZGRnVoTnEyT08va09BNWhZWEZzVTdQMHFRSDNDbjZPanB4?=
 =?utf-8?B?aUhpM3hyUHI1TXJVVU1NRnQvY25QTEFtSE5IbGl2M0FiTHFWdjdvUDR4RE9v?=
 =?utf-8?B?VVcrNENXZXZoQ1Zha21kODJVdkR3MGg1c3o1bzZXRTdUYUtiZFNzRWJmcHRJ?=
 =?utf-8?B?YzQ0L2l0RkJoajBnd3M1b1poaUxkWTJPeWJpOUJJTXdOa0p3bllVcVA5NW5J?=
 =?utf-8?B?dWsxTEJIOXNZMTBwSUFWSDUxcUJoL25oK1BCZkVNUDRXSXA5cWFQcFR5RXR5?=
 =?utf-8?B?dzloVVFsenF4UXpJOHpVVDY1QnlSRkdBeWRlOUxCc214UU9DTFdldStRRFM5?=
 =?utf-8?B?LzNaTVRhNFBrNDhaa1IydFh5ZjNDeDE3MHRDcCtxWHpyVTZpeTJmV2NXY2dT?=
 =?utf-8?B?RzA3alRmSklEdlJWc2xDVWlFWkd1WGU2VzBzejV3OTVZR1lFSWszV2VXWUdG?=
 =?utf-8?Q?gjn0z5NzIbegYKY5MePrbM4cB7G+H0aIanFLHfBo1g=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 533dcfb7-deab-43b8-3b8a-08d9e7bbbf24
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 08:53:00.3390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOYIjvFxmXchBZVLfitA43glMUA6KO2oj/I8leC/I8SSEDersCShey6N+yPA04ZXqG8ogCs7wyyaDLww27v2+7fR8eqt88DTpLAWgJj//4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6532
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe08::70e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe08::70e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

03.02.2022 19:30, Hanna Reitz wrote:
> We start the open timer to cancel the connection attempt after a while.
> Once nbd_do_establish_connection() has returned, the attempt is over,
> and we no longer need the timer.
> 
> Delete it before returning from nbd_open(), so that it does not persist
> for longer.  It has no use after nbd_open(), and just like the reconnect
> delay timer, it might well be dangerous if it were to fire afterwards.
> 
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

