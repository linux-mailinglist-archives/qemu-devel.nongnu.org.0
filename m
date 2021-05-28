Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9FC394636
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 19:09:09 +0200 (CEST)
Received: from localhost ([::1]:57996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmfyu-0003qB-78
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 13:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmfxX-0002SF-3T; Fri, 28 May 2021 13:07:43 -0400
Received: from mail-eopbgr150120.outbound.protection.outlook.com
 ([40.107.15.120]:65432 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmfxV-0007Lo-Gx; Fri, 28 May 2021 13:07:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hu4XrpJa71Hhp0YQ+UzciedMkhMh3/WDQgVaWl4tAJ6VCUnp+BcXLSsW3kKuoRsWlzDMN6LSqmmLFi6Cwpry6VoPenMPFdhWJucYmP/F29+GNXGuMsIgv/mfbgevD5jatATNHHoG4w5qAVB3Pw0IQ84hqw1Pd0YsoKYkkUySemAQjXnkNjRZmKa8Z6G3eSom/KmtiJ1kcbjrQIUknPwx4FqunRIzYXmAODcH6tAsIULsZjNcha6L0TTpmCKIwIVhQsDMspqpbwJcoUoqP+jfhjLgdCWw4W5fxyZVk08KxjL+Eo4th2O5WbfjKi2GmGisG+QsbQAnftgHV8PXBEnhLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wm/RSvqaDS6PMncDO0onr1LrCwiB1buPvQ3Yqxyb4e8=;
 b=kEBnIHemtlUTLOD5FfwY86EUL7SOrO6ONUat+SRi+sYN8/IR7MCMTKkoFGk4NEcvw5XrQ120cjhibvA+zvoML3vOO/M7U0P2J+aoBjA+GfJDbwiF7pCuCVdTMyHi84yYtp3iPMoTKEkdZ0CF6M360K3R6bTlLYDMEZQg5hBkNLe+RoP8kfsQoc53g4lkXbdAdbuMUjPX0tJgUJoyaCe1pH4QVHzHLz97DwrxB4rWzhHY4whhdtVx/pgfVD23r94sotkan2o+oGPN9XiJjXcHAIM28WEMRb7pktzH6Iuv8ZtjS+eyUPccl0n6VY2jqsWSosYnl4DS05QqgocMftFzBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wm/RSvqaDS6PMncDO0onr1LrCwiB1buPvQ3Yqxyb4e8=;
 b=FWsnVS8POPVyQhpncW5pjB1cGUQUX/OQtxPieu7XwByIY67UZYe7x4/Q8GgO5Z+Clo6yf/DasobI1xfoti3stfaBPyumf8CLk+K/GiocP0qL7Id8ADYP46dLiHt09VgzUUEaUIdxLmhLwnAZHl6jBU0iA1B8jPjSnZoSJ1dJMU0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Fri, 28 May
 2021 17:07:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 17:07:37 +0000
Subject: Re: [PATCH v4 06/15] qemu_iotests: insert gdbserver command line as
 wrapper for qemu binary
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-7-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <21b645b8-3053-6e3c-a956-ce451a58e6a7@virtuozzo.com>
Date: Fri, 28 May 2021 20:07:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-7-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.9 via Frontend Transport; Fri, 28 May 2021 17:07:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4734e32f-0251-4f1a-2789-08d921fb17db
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4470252E5B869A745B872C93C1229@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gwezurNBeu+EkqnxWqc3NTSnh5QpNlG0Kn0MkOBeDcME1S+SFxsiKV0Du28HY50O2wUeTz5cX+uCkzU14gXiy03Hf4yJL60YxKqAGSHRgi5b/H3WhyvwkBEKWScpfPTkmY4/ZI24rgyfbiW9K/qGjr7FbxUOjMFJWFsaMDmnIt9WUa1USTCngGSPYNrhdYMyXr7gvKVXtDVup+ojLJ9EEFQnaAEuBg1KwlLVVAD2MCLObYRn6EMNDLol6XjZLueREoMz3TyjG652nD9m36LhWIx1MyskF6cPbMRG6Dh3oy0ruhCCHSJaLF1otWG9yj7HjGdk/HcGj0zcNWRgI+Qa9KZ/CHZ8iG7ad8nHIU+Uv+40iMFgoxO3sX0WsGUv6ubsTk++G/z2gg16eeoNiyIm84PkHFH0ogkK6NDPnyHl+bpkqp1BZrupmYUYy6wSlbmJlImBkfcVsY7H94RFSd+WM6T2tPff+8a7R5vDBaCR7VTylrU+9wbqHm2UETNlCpi/3RKI9lFwifnQ4u7hRsDuxGnNtrNpvXIQJeLYTyD4NHbscKO+0y6laj9+CMV6FLAkJcvEMVzYnEDa8NXZwa2+6pD4J3lOY481x4j7r7HMt+ln0GgPCmNzNfr/5LPXGBHO1EbZuoZ/VCLmiLcU8ayo/XWAtyVBroduSm643XiCQaqM+S6FQk1J9BxBCt7POf4a757C3rwJsstK7b0M6cKLnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39830400003)(366004)(52116002)(316002)(26005)(558084003)(16576012)(86362001)(186003)(54906003)(6486002)(8676002)(8936002)(31696002)(16526019)(956004)(66476007)(31686004)(66556008)(66946007)(2616005)(36756003)(4326008)(478600001)(5660300002)(38100700002)(38350700002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?enpqQjRGNC9nb3dPWGtlb1hLakt2bkh2VlJ0RkhSMmxYRThFSSthNDgvQS9O?=
 =?utf-8?B?RXRBZDRuUEpDZThuWk9PZW5MWUVHTXpwWFExQWlmeWxpOVJWdW9DUUdsZzlQ?=
 =?utf-8?B?TnRnaVIyaUROaEdodzhvOVRjSXhsL0o4dDRNb2RKcGp1TWFzdzFha1V5WGRH?=
 =?utf-8?B?QXNXN3dLeXZJVVUyT3l1OU1ERG5RbTRleHBlallEa2w1eXhCSzlDbjZ1Mlkx?=
 =?utf-8?B?cjJxNE5KRUgrcEQ2ZTcxV1BXZmI3YkpCdlVMMDhYcE1CaDdId0pidHRpTUph?=
 =?utf-8?B?Ky96N2x4czkzUmYwenRZcnBlU3hPdHM3Q1Y5S1Q4SmVRWk1WSXlEVWRLUWJr?=
 =?utf-8?B?SHI0YjUrSFJlRjhJR3BWemUzRjg1dkhrSEQ4emNGeTZIdElrRzFFenJHQVBH?=
 =?utf-8?B?RFBGSVhXa0ZqUVhLMWRENTJmR0NBeG5yWFBPK0NRd28rdThlVSszbTlNU1N5?=
 =?utf-8?B?Wk1oWjRlOTJwVW9jUE1ZeURyc1lnMnFmNk9LODBqZXZHSmptTGRiL0owTG1D?=
 =?utf-8?B?cjF2ZE83S1V2SFEwRXM2ME1IU0szMDhoWG52OTlvWnJBS3ZPQjk1b3NrYVdw?=
 =?utf-8?B?RWs3NitMemVCU2lXWFYxMmhPajIwYjdVT2xzMERDRjBiZGdsQU1lN2wxWHFl?=
 =?utf-8?B?ZE9vSnNTV25ucmNoU3BYa2JIaVkydEZwZnRHR3dTTTJ1bk5ldkRuZFYvVTNh?=
 =?utf-8?B?Z0VQbkZZNlJUeG9XcEtmWUgvdkR4SmdUZk1lOVc3UHFWYzFpd2lLeWpCbUNQ?=
 =?utf-8?B?RHlXMG5xdThqK3hMR2Z4N1NCV3JoVjdkVWlVL2ZWWWptaUhEVXJ3T0ZCY1JD?=
 =?utf-8?B?VEVDYU1wZGVYa3hTbVlKcEN5YWs3cG4yWTd2VWNwNXJ6UkwxTGtxMUZxUGNH?=
 =?utf-8?B?OWZxVGNwdGtEZ0dxSkQzQkhkRmFDbXhWRmtITTMvbzI0a09SN0syWGMvVVVU?=
 =?utf-8?B?YlhLNW0wWm5iUzQ2UjhZVW4vYXM1RnZXcENXQitlTFd4QTlNS2oyandDRFVL?=
 =?utf-8?B?RzM3VXpubXJXaW9yeGczTUhnTTFLQVZGSlFJSGJybXhxVTZpYkYwaDMzejVm?=
 =?utf-8?B?UEIzRXI1U01WdkNIdFBEMko1SFdTSXRteE5GejRLWkFhb1h1YTFtWFRBL3FC?=
 =?utf-8?B?ZEhjcmV1OUF6a2VpVGhTRW9iZU51c2grL1h5K2dadERlZEM4a3VmMWJpckR2?=
 =?utf-8?B?blZzcVV5Q1ZLQmVueEM0b2VUcU5MNWZ1blYwSlhSQTFaYzh0VndrS3EybENt?=
 =?utf-8?B?Umt6Zmx5cEhMZEYrSVJtbUFOT3dGazNqSGJ0dEd3M2hCdkZIam9kK29JSTBQ?=
 =?utf-8?B?dEJEWG5td0FzQWh1YVY3S2dtWS9WQXBUdlZSc3JmQmhyei9iMU9MZWEzaXgz?=
 =?utf-8?B?Qkg1QmpleVF4OGt5ZjBZTDA4YVlHN1lXSXJvUmZma3hCSVRuMmU2STFlK2F0?=
 =?utf-8?B?UFJqcE5QbGQ1bUVSNURDY2Joa3dEdTBSemZwdUc3Ukw1emw1NGJHL1ozQWxC?=
 =?utf-8?B?L3ptY1U5WXArWHFLUGF4R1JlRlVkTDc4czlZS1YyOUUzNHVuVUJWdmhYaWZK?=
 =?utf-8?B?MVRpVVlsSjhnQU9zU1M5bWIvT3RhNXg2MHNEK29Ecjkxc2d2MTQxek9mSmU4?=
 =?utf-8?B?ZEhtTS9UN2d6RkFHUUNkZ3ZjUUxLclJpUEhUbzNxc3RMeXorOWhtR2VYK3pI?=
 =?utf-8?B?WXdFN0FxOFJvajQ1NnpRL3lndzdIRWdjbmxDMU9obG1TUUJLRE1yakN0bTFE?=
 =?utf-8?Q?cqtOw5rOTTewOSUXG1cZVWM+1tKWQ+7AuNvmwmt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4734e32f-0251-4f1a-2789-08d921fb17db
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 17:07:37.2373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqpK0oHssaxccl+HwCAr6PNmdywim8+kjlU7PQpaQwDlHNYqPq6AHNGXofrTl/NKNdX/wvApFicbsGLQGtJEWUX5G+yuuVcBMjfnbPYTIQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.15.120;
 envelope-from=vsementsov@virtuozzo.com;
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

20.05.2021 10:52, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

