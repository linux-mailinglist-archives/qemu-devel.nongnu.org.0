Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF27476E91
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:12:20 +0100 (CET)
Received: from localhost ([::1]:54170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnkJ-0007wE-Ef
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:12:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxnh3-0004uF-FM; Thu, 16 Dec 2021 05:08:57 -0500
Received: from mail-eopbgr70125.outbound.protection.outlook.com
 ([40.107.7.125]:23574 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxnh1-0007OD-RU; Thu, 16 Dec 2021 05:08:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buHGST9W7YCQPfJ5K6RYAHTdz2Mqnh4FVNQ2g7vFjubf2lv2YrIxZg+3PxclLa+hbRPlCNyjNqDZ6uPvJtiPHlZxcH8Or4Tm2PIgqE5Wju2fmHMoy0K3pAM0XCwr6NA2V/Huhge/WysV8Br24Pg7eUt3Jc9FmD6XngOsKmQb/RA7GJ1rKIigQlA9R/l7xlQ+CNGLz81xUYlit1g+eD9OtdZOHz/ptj93Ye0VnsnTvmSZRr2cHD01gJiEWrqglJi2xv5JpcnxcyXnjnqq5DiwMxsVhxfyuYvjwyW5mo/EI3Z/ksYruSdQ/UKlyy7PnfJgAy8xZzQXlKpHJLcq+U9AjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gikOqf+TyRwZqiePGYY5jRSGrYYY88bBlHXGzEyBOU=;
 b=JuE9XjmSavPDVfbezCPVWKMpSJIuMZTGtNJcP2MIheulPqDTUk0ZIj99T5Krkrf+SkJnkJ+98UVh4X0oRkdqvRel84XU8ecF2UWGl9tqWO2iNqnqP2JvYrolv3b8UOkjWGNNaxV4BTB1B3uK/nGt1jv9cegh12yZpN9oOAll0xZTlZgYsOCB0SZkYhd74Ris0xazZkcap4WkhkFo5Aqac3IxrbWM8P//T/77VzflZM99WHDfEfBAy8JrIp7V1kJ2MzzbosP7u0Xn2xw5u3IMAREF5vlDIdgDtZHcR+EMEGbkqjRTJOGp2UQBCBhDsh03bs6v7OK0c4MCYASbPH1fZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gikOqf+TyRwZqiePGYY5jRSGrYYY88bBlHXGzEyBOU=;
 b=n2rZwFRVN3cdQNsyt+NMZQUNdC4PO6MRpT5/1nXjqK8GgDTwR1U9478twHKWSg6ZULvCztL7EOmB+iKTdvh4f+2L9uDw/X80cGn2G3eiaeYZ5OMemOFVo0y4sVb6/b+sbpCFY6n3kpr/tzXfDCQBA5+ypLaEVd7Bd7+rlxd+0jo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2850.eurprd08.prod.outlook.com (2603:10a6:205:3::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Thu, 16 Dec
 2021 10:08:50 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 10:08:50 +0000
Message-ID: <cfcc275d-1454-dbae-3f93-4a698b502fa7@virtuozzo.com>
Date: Thu, 16 Dec 2021 13:08:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 05/25] python/aqmp: rename AQMPError to QMPError
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel Berrange <berrange@redhat.com>, Andrea Bolognani
 <abologna@redhat.com>, Wainer Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-6-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-6-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 10:08:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 671a0d77-d8c1-4960-729b-08d9c07c0eab
X-MS-TrafficTypeDiagnostic: AM4PR08MB2850:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB285063B4D4727210C6C44A4DC1779@AM4PR08MB2850.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XEsJp0h/GRVymlrwkKk9bzYc+ENFYI9IiUWArkWZSdWIh61woJmUbXDh3RD/P1k4A1ny3VbN1Q3jSR/F3o5rGcXWRUZdm/knFctBc6EtH8+8IJ/UMCchyoryWsaZGgegv2TzxMGyKVDd0tW0gf4A8Slluo3+JL6o5/hi5w9Ww4RnQUKAoUTMP/PPNxu8a6/+0SW3KZqwWjlAQzXtQjcgFm+BMPSerLUQUoidOoSfZNzYrzgPC/wDlX5r5hSCot1il2WcGIAzxyw0tMS4YaiF7K3IYyGmAMm4AF6AZF1D9O0+s5Bd4b/sLueb3FXW73TRi9RLwzuKyWwiMq+97t7YZM1Yse0mzUPxX3gbzsEM02bR4udEc/G6FwO/lyDDBAfsE3fcPVYEOMxUivl8r7fzM+sNJVmZK+BQQUsuAVaudhJBYHfW47fuvtEqBDnA/qPrboW84WiOM67oSEaGbExhqE3zUYg35neUfpRSLz8q/CCENXXHyq8tCR6/qsp2Qseb515QLSkfg+mfxiSJHesPx7XSJKmkUEm4GJgTeY5TVVNvCbkOP23XIj9UfOOvfLEkyoJNLc0bZzmXX1t9WrFZW2f5CCmjBQx8rZC6iYeAjrVlg9/Zykise2jTa6EfQzjesybsauAARxT8NqKZ7c+bTT024Tk/+3/2mRUwl0PWzqxDKPL0lMDyZp8k/BR9OhubfDhCZZKm3Y03qpCh/dEVDlZjRkz7Ej22tCImNErnsE+vQdNgZ0MxdA0xFdaq5yXPJvu1v+/5CRJUrp4hhQYGag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(86362001)(66556008)(956004)(2616005)(66476007)(7416002)(4326008)(5660300002)(508600001)(26005)(6486002)(16576012)(8936002)(52116002)(83380400001)(186003)(316002)(2906002)(54906003)(31686004)(38100700002)(8676002)(31696002)(38350700002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2xPdm9wRkl2SFdSQjNWeTJOM2ZrOGlCSjhNTnhOOEhnR3AvWERtSDY4R2h4?=
 =?utf-8?B?RGo1bnVabFhEL0V1WTk5NG5NWFc1eGw1VmYySzNiTkFUdHZEdjN1L1RvOEsw?=
 =?utf-8?B?MUxPODlYd1cwQ2xDRVZOcUE1NGlpSTZYU20zZG5qYXBXZXZmQ3NadUJveUhN?=
 =?utf-8?B?UTByTG9tQjhIRG1YajVWTG1UcDFFTUlneHdsQ0REZFhsdlNjUXFqc0ZHVDRt?=
 =?utf-8?B?YnZJV3VwYUN5SWViUENUelVkUVJlczJpZGoyb3ZHSHYxMmhaZFRsc0Y0SlUr?=
 =?utf-8?B?MjNaRjNLYWZMZmZzd09NVDRRVUhVNzhvOHdoNnZRWjE2QVNTM3l6bjZTeVgx?=
 =?utf-8?B?ODFDcVFzaXhudTdJb084TjFMbHhwUjR4eEVmbUdsSkE1NEQySWt6bEh0UUdF?=
 =?utf-8?B?aHdYaWd1NU1VMjVkdE5iVjFXOFRTcVQ4U3l2MHRrbWhCOWtJZnovYnNqbTl5?=
 =?utf-8?B?NkdnWUdwaU56a3pQN0RVRGxrMjZQOGozY0RIaUlMY0FQV2hUMVdjUFl6d2lL?=
 =?utf-8?B?d0lwN3lrUDgwbWpSelNnUjZxeFVLa254eVRKYXhWaXU0UWpCN1lNS1JleGJH?=
 =?utf-8?B?M0JCL0pwbGlveUxQRGhSNm9VZStuaHRhRDZrWUUzb1djdFBsbm1vK1AyZUhp?=
 =?utf-8?B?ZCtiNm42dkJIZUZMdndUTGdDZWwrREFLU2d0MnJXcFc5SGJYVzR6K2tidGw3?=
 =?utf-8?B?S0JJcHlHeFJnU05hQnBLVitJcmE2VUhxYlYrc0RqT2xqMFFsdHBUQzJZM2FH?=
 =?utf-8?B?WjVTbXZ3RTFwTTdBQmpCTFZVclZURnhQbFlkN2V6WHJFZHdjeWZIWEdiV2tz?=
 =?utf-8?B?bVA0TnhxZEtzT0RzVUF4bGt5V3l6SklzTk9oQXdqWW1IcTlaQmRZSzhraGZC?=
 =?utf-8?B?RGNCUHRxRjR3aWFJY3E2L1k1c3RPWk5tTXlrUGw2d1pLK3BOTFhGS2xRSjlk?=
 =?utf-8?B?VnhudVh0OGNsMGl0aFhUc2g0cDdPWWtEVWFVZUFObHpDYXRiZVpXQ0MzUGhT?=
 =?utf-8?B?OFcyWTZka0xqTHJmOS9XWThWZytNL3pjVmRyR0ltU0lQSS9zRGF5dnlDc0ZW?=
 =?utf-8?B?b0x2S3h5UTNKa1VuVDd5VTdveU5HTkdlVkFycDRsd1g2NFhRRk5VOHVNVnQ0?=
 =?utf-8?B?a3pIRWdxOVprTEdvNkN6L1JCTHBzaEcxcUwyclpiQkJIa0FDK2J6QXVQVitU?=
 =?utf-8?B?dnYzTDlnc0NTYi9nLzdXUVgyUDVsczkrSHB4QmVHNjVFcEsyNW9SVEhjc0Vr?=
 =?utf-8?B?amFqa1pYQnhtVExzUU1vS2kzdUJvUlQ4MW9WOWkzazRoWmJqR0pJRVFLS1Bw?=
 =?utf-8?B?UTRNTTVCQW1kT3FnbWx6TkRDTDVtVDY4a2R4MGtyQ0xxd1hvME5iMmo4UVg1?=
 =?utf-8?B?aTVyb1lCNkYxWXlvTzFOTm5tTEY0WkoycDc4SXJDOFA5RlpCMWYwV3ZvQ2xR?=
 =?utf-8?B?SkJiWkI4SENSVmlJOTk4NWhzTDRwekFic2o5ZmxjcnFQaGFad09SMUlIWSt1?=
 =?utf-8?B?ZE9QbDRiMTJ6ZlNtUFVrRmJsMGZYeEZEQU1CcGhRYXhhK1V2K1NYU1ZtVzc1?=
 =?utf-8?B?cGxQR3crWm5tOU9IelpySjBtTnZVb2ZOZ01NSFB5WTFDanhxM25pMExlRkdC?=
 =?utf-8?B?Q3JFYkV3SVk1aHMvWHdyTkJXOWliNHNBZk9OTTkxbHQyMUF4OU5qVlFQVHNL?=
 =?utf-8?B?b1JHYk9rNTF6SGxGekZPQ2o2OW4wQXFLMWdEVWJnOW51VnhqTjNBcUJ6OFFR?=
 =?utf-8?B?NnJycGpVYlljbVVQcFRxZTFlQ0pxWm14WEx5ZDluN25FOFNiYWduU0grWUV3?=
 =?utf-8?B?c3Z2YnVzc3FzcVIyRnhjaVBjN3drQ1N5dC93YkNyTWFGYlJQa1Ruc3FucmM5?=
 =?utf-8?B?QXliVUttUE1vMnRFR0ovbUg4VEo2UExrY255djlEWElwYzkyN1NkMDFTWFRQ?=
 =?utf-8?B?MXpKNEVzRC9mWnk1N2hoMVNGSmRpT3dEazlDT2ZOZTZsRnlHK3JBR3dEVGhC?=
 =?utf-8?B?eUFFY25lQlRLTlRTL09sQ09vQkxVS2hpZVRuSncvV0NoRk05b1dIODk0b09o?=
 =?utf-8?B?YTVOYjlRWmZxSzVQc0tENVA2T3hNREJTL3dRZ3ViRTR2ZGlnd0g2R2RFQXNK?=
 =?utf-8?B?azNzQU54OFhwSnZOd1ZTeHdjZmVCNytTOXNhcm92SEtrVnFxbURtQWs5cnNm?=
 =?utf-8?B?QUljMXpBNlVvNnJ2ZEY0SzRuMEM5N2p3MURReFFtWmJ6WGVuWXJFTXdxM1Q4?=
 =?utf-8?B?VFBhZ2xES1ZYb1QrSlNZYjBsUkJRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 671a0d77-d8c1-4960-729b-08d9c07c0eab
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:08:50.5405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPXtNQaB9rthzcHxzv+PDKww5gz8NU8rMnxTu0vRQYQkPdkv40BKmrPRZZmT1KT+gmV3aemEZvhL7cu545meJSUWeF3sq57KHJtVHNdKhlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2850
Received-SPF: pass client-ip=40.107.7.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

15.12.2021 22:39, John Snow wrote:
> This is in preparation for renaming qemu.aqmp to qemu.qmp. I should have
> done this from this from the very beginning, but it's a convenient time
> to make sure this churn is taken care of.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Honestly, I don't want to check how it intersects with exising QMPError from old library, as it's going to be removed anyway. Hope, everything is OK:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   python/qemu/aqmp/__init__.py   |  6 +++---
>   python/qemu/aqmp/error.py      | 12 ++++++------
>   python/qemu/aqmp/events.py     |  4 ++--
>   python/qemu/aqmp/legacy.py     |  4 ++--
>   python/qemu/aqmp/protocol.py   |  8 ++++----
>   python/qemu/aqmp/qmp_client.py |  8 ++++----
>   6 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
> index c6fa2dda58..e1efab00af 100644
> --- a/python/qemu/aqmp/__init__.py
> +++ b/python/qemu/aqmp/__init__.py
> @@ -6,7 +6,7 @@
>   QEMU Guest Agent, and the QEMU Storage Daemon.
>   
>   `QMPClient` provides the main functionality of this package. All errors
> -raised by this library dervive from `AQMPError`, see `aqmp.error` for
> +raised by this library dervive from `QMPError`, see `aqmp.error` for

preexisting: s/dervive/derive/


-- 
Best regards,
Vladimir

