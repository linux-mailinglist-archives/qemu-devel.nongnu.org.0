Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB304A661C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:39:36 +0100 (CET)
Received: from localhost ([::1]:33940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEzw7-0005rq-If
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:39:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nEwo9-0004Iu-Vk; Tue, 01 Feb 2022 12:19:10 -0500
Received: from mail-eopbgr50132.outbound.protection.outlook.com
 ([40.107.5.132]:65253 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nEwo5-0007Dx-6M; Tue, 01 Feb 2022 12:19:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2r+YZwHSy+/PwIHCLnX/Xk2f+vRQbhJeByzOsMAU5zNjPnAHJDUf5mq8p5npEjf2lwdBCECfrzorqfFXZhdj1Y+bSB6ovlNJQ55uRYrSOa49ng65Q4/qmk1+79zlc9P6l9Vtg+u65+7q+hTcij2bWmnxUsONiLsaP5o8uTSJLfaoAjTb1/sgpkKDak2/0aBPnxADud4XYn4Xi6UNyYjdeSLjHvrhaGkRYvLs+U4uy35a92AimXYGir5+fFTouDjbZQ5hXOS61rBdXno0oST4MrqsA4Rwu/U6IM0u3D/LzaMRZn2RAZkFz1B8dlYovQNX3OQ1zpIFd6ibNI7c+1VNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/vTlYGu1aDT+JaHI12WSQ2VwYXUGU3/xBSq9tKRF4g=;
 b=i1Irb57M/5bOtKfVfwwmrMiuVAPXAj0sZXUqtCJ/UDS/7q01MDSfq35s5ST0wwfN58Aeey3NTupge/auFMpiEW+liMsIlq+tGebVwC/9Bg0JXw+9nUgh7I+uRD4GCH6V9neHh4TGs3Zc9WW1BC5/A1bj/EwUC9g7pKC61YET5OONXzFlsCu/zmr6SDmkjfdzcx8lIjzsqLmF4HLVvtatdtNPhX3wWL4IvbFABaNmS4ne1fSkxeoGWOr6MJtPnuXpKNLEkfBrcb5eMwaIjt838OmOXerLSCHEJfxwdjn/zlmnbrZQ88bVnrCUmKjPvR4DRLKrjN8POlpJ+cnwt0C9+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/vTlYGu1aDT+JaHI12WSQ2VwYXUGU3/xBSq9tKRF4g=;
 b=A6aRW9gO+6FCq5KEpewc9eEjLTLTYN2xwbIaL3G25Fw60bn05p1QoPXBNyju3DrDNpPaithna+8Ux47CbYTgQWU5pvGxxlA/EPc2Mmwv4pwgnRPkjlafU5w+tTx5jxLAD7uyq5IEY1bRIEqgtgBleuFYIH13GHchZIZ+L+gk+O0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Tue, 1 Feb
 2022 17:18:46 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 17:18:46 +0000
Message-ID: <7e01e72b-3ab6-cfb0-ac35-8e18a295e59a@virtuozzo.com>
Date: Tue, 1 Feb 2022 20:18:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC] block/nbd: Move s->ioc on AioContext change
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220128155130.13326-1-hreitz@redhat.com>
 <4836201a-a469-c063-babb-4e293daee297@virtuozzo.com>
 <6b28a0b4-8244-54bc-ec1b-91a123569c7c@redhat.com>
 <e5fa1814-2bf9-1f5e-8051-719f8cee0edc@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <e5fa1814-2bf9-1f5e-8051-719f8cee0edc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 102cd1dc-59ae-468c-ef1d-08d9e5a6e789
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:EE_
X-Microsoft-Antispam-PRVS: <AS8PR08MB59093693C002C65EFEB752E8C1269@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TzP80Nw9IdoKsjs54Yq3gEZkAJ8J3CEijHD9pAZ/y8JxHZbHa2XVuOV0y8dehBkEtV/yQqeVZ5/4IlHNlXFey0yZcyahpbN9IB42jmaWPfU+++LVCXdyCOWbXjD0stv9D8NDYmd5P55BqXY9xSRPjwxFMzG5/+ZWqq/pZ8hFXRIx8oqq6w7hzKXR7kITkmx3FckVwoUCtjsRiYTDHzQcNkW/d62xJIxxmrn0NpdoqHoArjRcZo/Lx41YfqqyCz7NWLSeuSPqXK+WFpE+B315QGVnrl5lIXtiF5B5g7xqP0KjrGptQ01O66iaxsusZ/l6uN548TTDYwiVJe776gux550hJbMYJ/XcTBb2b9OMMc1iad6B9Y1j+0Ygp5aiE0n2FCcLXVjjdCdFncliRVSjQEIrH78o5mdkVAUH//1BNtLx8OwAXiKAstEehr4FPXWtxY/eQKPyBXxDUGrwChkEgJNhGrts/Fc5LxaqF4zu9CNtYLZ2l61/Cn9ycK/qwwrpKoZtmScer1mN82IGua0jK8LTVUI3TzBn6oJD/uebECZt5/khj8NZuC07Ly7OsgAxhzogzA0FYfMmyi7tzGxUlNkzjl1cUSOV+wBSa8E0OWwpKTaBjmCdZobm9yn77ARBootLB70dbTUIPBsQ/XE++c+SSe2dz0PsF7/KjLIQJCZ+FY+tZElfOuQds87ssIATR6IttQux9aLBiBr1WbybhtVgp9VUn5hLB+27mxb9ulMU7/bZ0claQko4ztqDRJFuul73nYImR/nTh6INeJ+0Zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(83380400001)(31696002)(52116002)(6486002)(86362001)(8676002)(508600001)(26005)(186003)(6506007)(66946007)(8936002)(66556008)(66476007)(4326008)(316002)(6512007)(2616005)(36756003)(38100700002)(38350700002)(5660300002)(4744005)(2906002)(31686004)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnNKeUh5M21iUVVZUUI4VWo3S1dQdVVYV0RyUnViN2R5U2xuM3EyUGZCeVZ2?=
 =?utf-8?B?RHVKU0JLNkhtTEorSXRFT295Q01JTWdIaklDS3ZkWTB2MmgwOEt2N0g3aEtI?=
 =?utf-8?B?UFlWdzdnL1Vzc0hRZU00b0o4TDQ5VnJhZDFJaFFUTXUyZk90TmxGZElxNnpX?=
 =?utf-8?B?T0lOWk5EeFZFVUlOS0RwNWtHMXUzaGxLQWZnSjFmMnVIRTNidDlmWmduQlE4?=
 =?utf-8?B?TXNvSXZnT0gvNFUvTGlxNTFjUFBxZ2lKVUJYY292dEZvTGwzSWNVbXFpNHhI?=
 =?utf-8?B?QWFZNjdiSUc3dlg3cGlDVjJKOTRad1V6L2JwcTNyVjRWQ2ZiVnRXNTdkUDBa?=
 =?utf-8?B?QWtQRFZKYVNOTHFsTkl0VFk4Z0RRNUtIQld6QmluNFBLblB0VS8zNkQrcUdN?=
 =?utf-8?B?TVJ5Tkh0RGNDa1FzOFJKU3BrMTRtRUI2cXFiYTZ1ZWZwREp2RVIzRHozNENk?=
 =?utf-8?B?RHBsekY2K2xVTVU2ZVlEOVJ2bmRianBxRjVoMW5hZ3lVb0t4ZnRobmVsa2VT?=
 =?utf-8?B?OWxJZnJ6VlptWDVLKzZnT2xINDZaYzNzVXlGeG1BU2piQnZ4YW1iSHR1M0N1?=
 =?utf-8?B?cDlTYkUyRUp2R0NNYkhIaXBHRU1iM0RsNEhHTDdOSmZEZERpTFdyYVZqUGt6?=
 =?utf-8?B?L0xoaS8xN1FSWkVoVC96OTdVVDEyQ1B6M1Z4akE5S2RLcXE4YXY4aVhlWDc3?=
 =?utf-8?B?RkZWVlVnQVpjVDAwWHpkcVhlcmVkUTUxeEtmZXU4cDZRTXo2SUNoejZNVWdN?=
 =?utf-8?B?RWJNZ3FlZldWUEVkN2ZXUGpvSkUrRjRjck1yVE44c2Z3R2lmZGoyVDh4cnEv?=
 =?utf-8?B?eTlPc2ttVTFGdnhNMnJCcU9xVVF5Wm9OcUpBek4wU1Mza2pmTWxFR2JDenZ4?=
 =?utf-8?B?Z0lmWmxNUGYxbGJZcTdlNW8yRDZabUVPemFxQXE2d1FWbWpjaU1GT2N3aTNX?=
 =?utf-8?B?UmZTNkw0TDBFMTVWSXZNZ2srbm9oMGx4L3ZtWWltRUYxMktQYk9vZVdNT0dO?=
 =?utf-8?B?TitiK2dNM2FJazQ5Uy9tVFF4RDhsSHBIK0dYS2Ura2wrRFhxR0RjQWE3YVlu?=
 =?utf-8?B?UXEwOCtuTG9GYTZvMW90K1BxSVhEUEMxcUtWT2VNUFRybDlDNEFQbDMzYlBU?=
 =?utf-8?B?NEFZUHIzKzI5SVBjZG8vRlVYRkQxV0txQ0RIYUJqdGQ4UFNhZmJqVmtkM1RP?=
 =?utf-8?B?TElTYUdSU2ttOEF0YlBDU3J4c3RvYU1RR3lTamFkWDJYMEVpUnpHYVlQV1Zl?=
 =?utf-8?B?V2xMRnNLNi9mckRMTkN1ZTREcGEwdlg2YjdCeXJ5ZGNqMGlEZHlVUlpPMGNY?=
 =?utf-8?B?WHNRaXVES3ZnNEEvajk3aGdVWERmS2pOZko1VTJJTXIydkE2QU1tSUlwU2Nk?=
 =?utf-8?B?QTZLWCtoTmlxblNtSXZyWWVySDVMOVVBK2syZEh4dW5MVFB4ZUUzYlltMjFn?=
 =?utf-8?B?TEZDTEN5NG5QNHJvcnpYL3RraklicWMzM0hVRG1kYkQ0YjBiQzlSOUNTOUUr?=
 =?utf-8?B?WTRwQzlKSFo0b1NCQ0JvSWo1RzFTRHg0bDYrM0hmT29MTThyUXF2R0EvQmRl?=
 =?utf-8?B?eXQ2Q04ySDZCRHJTYk56M2V6U2xsQ0RQZWF2dEVKMjFCd055YjNHM1VmMnhI?=
 =?utf-8?B?VUxiOWJkTjZ5S2ZMeHZ2QWdpUTgwWXhhR0cvVVNlMnFmYTVVVkQ0S0FXZS9J?=
 =?utf-8?B?V3Fyc1E1aVNocWJjUHo0b203ZnhZKzRCbiszZURHUDNKSjl1M2FXcnczUHJY?=
 =?utf-8?B?L2NLeDhZTlFpWUlxMVNrcVJxSlNBZjZjT204V3NTckNmeEE2M21vOTJ2TVBw?=
 =?utf-8?B?UXh2blNZRzYxUXJGeUV6VjZiTTJqcFBnWnhaeEplTzVZOU4waUZYUzVGWFBJ?=
 =?utf-8?B?VEx5cm5pOHp1V25JY0VSVGhyc2FER043eTVVTW9LaXE2ZGROQWlIc2d1WExm?=
 =?utf-8?B?QjBsVlVna0ZDTW9hM0Rsc2RhYlM1T253aitxN1lmVWE5bXBBMThCcWY5d1VH?=
 =?utf-8?B?MlNEQUs1WVJSQjd0NkxhNnJ5aTN2T1dNOC8zR0I0U2pSWC9EbjFVNDB3VHhR?=
 =?utf-8?B?MWhiQzZoQ1lCTlNDbXlBNG40Y2wwSHltUU5oWkR5MWdSMHd1RzVEanpiUDYr?=
 =?utf-8?B?NFlJVnhESWc1dFU3d0NXbmxtUlpuUVdMWnd6ZWdETXBNMDg4N3FqQ0VXNWd1?=
 =?utf-8?B?K1JwdFkvWE5MZFFrUVFPbmNNZWl1Nml2a1ZiMmNpa3NLL201akN6V3I2WFhh?=
 =?utf-8?B?Y3YrMEpoZ2NzendRb3dzbEoreXFBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 102cd1dc-59ae-468c-ef1d-08d9e5a6e789
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 17:18:46.4356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vxa+Q9r+DC1rhl8OsiTOgEh1FqPM6Qie9oNqDt2uDJwhpuwBYVOSE8kGt1QJXVQ0Uo38AQWBohzO7zONyMDZ8WQql4hPE0zhwEJS8qTI3gM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=40.107.5.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

01.02.2022 19:14, Hanna Reitz wrote:
>>> reconnect_delay_timer should exist only during IO request: it's created during request if we don't have a connection. And request will not finish until timer elapsed or connection established (timer should be removed in this case too). So, again, when attaching / detaching the context we should be in a drained sections, so no in-flight requests and no reconnect_delay_timer.
>>
>> Got it.  FWIW, other block drivers rely on this, too (e.g. null-aio with latency-ns set creates a timer in every I/O request and settles the request once the timer expires).
> 
> Looks like the timer isn’t removed when the connection is reestablished.

Oops. And that's wrong.. If connection lost again when old timer is still not fired, assertion in reconnect_delay_timer_init() will fail.

I think we just need reconnect_delay_timer_del() call at the end of nbd_reconnect_attempt() function (after nbd_co_do_establish_connection() call).


-- 
Best regards,
Vladimir

