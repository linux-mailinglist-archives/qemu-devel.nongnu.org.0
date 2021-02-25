Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7946E3252C9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 16:56:11 +0100 (CET)
Received: from localhost ([::1]:39114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFIzq-0008KJ-HA
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 10:56:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFIyh-0007fu-By; Thu, 25 Feb 2021 10:54:59 -0500
Received: from mail-eopbgr80111.outbound.protection.outlook.com
 ([40.107.8.111]:48439 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFIye-0000ZE-DL; Thu, 25 Feb 2021 10:54:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkcZWJ9VtKB4KIa1WoRq6ksz0Lbgy4PzYVEkQaqf6/Fd5osYNT44t/xKvKa/Q6SvdlDPS84qkv8L5uYocTPf2XJI7hHxcC9lCx/oLsQDSfWhU5EZXRZzQrnXSvYwT2Hc08ypLGKWoGGq8NMi6tk1bwJw1udB2VyumFr63954pVpArRtNLrM8iSmSLjYVhuvju1vXfXFiZWSKTZpCV+ByRBOjhW0oebqMrdA2F47wEnDRyyJYGJGFig8IEvn10ElJlwbiyDqayN8KTOM+CXl1RCyw/PEEX7UbAnCKV6ZSzG4UnWWc/n4kXKF7tI9Ak+SBoha7KzbVh/zMjEByP+upmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaOQ6D97TkWAeBxpYZCEnwulRg+ic+KeKT4kFexuEfk=;
 b=Vv0CLYCpKCT9U+xZiX9DEZXteJRcVrBfceZ5BmZMq4OeLRw9I2fMBd4T2M1YEdSZsGOEWDK6m1Qt5/inQ/1ZKajO1G1WLFGpjbvH/nIcIwvscjQc+4kjXbW3qIM1O3kwESHYxEgTNLpVofPJvjAOJ6pW00BxTBVyL75ty/WK8gRFR6w0pzbOL3g002eTFZ385FNDRqqc8F2zuplFdNz9xbReKTXXtcrAXl5BTADExcnOoqRSeIEcmBBrD/wE85i/EEVfwYUnwFDXXxnGig6nyNMLpcwrDk7Vz7O8/x1hrMcqG8JFpfcxhhA68JRlaAY0DTwXe7C33EatYvDLNLUHNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaOQ6D97TkWAeBxpYZCEnwulRg+ic+KeKT4kFexuEfk=;
 b=p5catBzrw+D7mDC9ZYaeD7rMclybJKvo8FkwvVNmgbF+5/041c875+9TzbLreMS0oaiha0dcPkFcA1u5JooeV/JK9PCrKOVPLhTyjZjKJkrVvT4fVkSBBG2LDePkFlgq71c8FcxgCv+WL8/kWnAwZWKIaEcCBqRBVlJ9nhPx2o4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5895.eurprd08.prod.outlook.com (2603:10a6:20b:298::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.25; Thu, 25 Feb
 2021 15:54:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 15:54:52 +0000
Subject: Re: [PATCH 13/14] block: remove 'dirty-bitmaps' field from
 'BlockInfo' struct
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Cleber Rosa
 <crosa@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, libvir-list@redhat.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Eric Blake <eblake@redhat.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-ppc@nongnu.org,
 Max Reitz <mreitz@redhat.com>
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-14-berrange@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <74c57648-d261-8ac5-23da-f6df28319e40@virtuozzo.com>
Date: Thu, 25 Feb 2021 18:54:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210224131142.1952027-14-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR07CA0026.eurprd07.prod.outlook.com
 (2603:10a6:7:66::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 HE1PR07CA0026.eurprd07.prod.outlook.com (2603:10a6:7:66::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.11 via Frontend Transport; Thu, 25 Feb 2021 15:54:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21245f6e-55c7-4068-0257-08d8d9a5b054
X-MS-TrafficTypeDiagnostic: AS8PR08MB5895:
X-Microsoft-Antispam-PRVS: <AS8PR08MB589527739C6644A92F902B48C19E9@AS8PR08MB5895.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KZF0HC8x8UaxaE7AO3plYUsieNsj1NvqGj8LCBgkCiKHk6mzj0hIUlQGoqaH5m4/r8fn4w0ZcJOWQQUzyeZ1h0EMvhEbcNoOt1jcutQKfSstMt0XU0xCET57nMHb09D/M9TvG0LeBivNDIcgOq1j6KEV1ohMwOHMC8c+lE/lPHILSQxGnx8ttmC0Glku3Xs+gacnOAL18kcZe8FF+a1H0Pe3W73Nf8f9s5Z6NoTg2B7WxAVDSOE9X1hHh+uXgltcE5xkuP1OFMU20AobJuQmzx9lVYGzHmSn2Okk5nFr1JtPChYlL6hvmqBlcNYrZNvuWfUOMTAorhEmUwLmqSCC/7i8zM4HEYsXR+kOcuR6g7i0rXxcg1dvAQ/CoGIMFIBKbj00I1LkouVlLmXQQIc6WalZILMni3IVea1e7MJGwyIg6fF2cL8GMrb0MX+sSwiHhD6ILuqfnu9tVfpqboBER3yev9bu8nCC4mlI3Z1IBq+E2X6uy3kpamMicYMRh15/gn3b+GXrp7uNduo86UiD4ypk9Nf8o3Ta+T/cuvMTC68Zn8gk+YFgROxhOL1zi97UBvxb58wWDZVJnA8n1YituN5DQeTUpQiYJpI7ikdGu9rNHlNotDp7lxEtMVCu7d9S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39840400004)(366004)(376002)(346002)(6486002)(186003)(8936002)(558084003)(5660300002)(66476007)(36756003)(4326008)(66946007)(7416002)(66556008)(478600001)(8676002)(16576012)(2906002)(54906003)(86362001)(2616005)(16526019)(31696002)(52116002)(83380400001)(956004)(31686004)(26005)(316002)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WWE3ZW5NTEF5Um1RUk5FbUN6MEhSbndsWVBCK3h6Y2hWdDlobklHcmpNN1ow?=
 =?utf-8?B?RlI0YXdUeGJndVM5RHlGdkkxTTNGekxKMkUza0pCc1Yva2JDS2FvMEEzaXhF?=
 =?utf-8?B?YThNMm02WmwwZGJMVzlNMGFGY0QwSE9pMmU4KzdXV0FzWktqUjJQbHR0TGtH?=
 =?utf-8?B?ck16TG83cy9FY1VVL3NiZks4QmJ3S2tQaWgvODVDblh1QXhhQURwRjREanVT?=
 =?utf-8?B?WUQzK2ZtbmMvd3g0V3RHQktGcy9SeWYzNHlEK0YyVFNGZFZXRGFVQmhReWhR?=
 =?utf-8?B?ZHdFM0V1TW5FMDVQWnkrMzI1UWM2a3F5UGp0c3hxMmNrRTZhdTJKVW9ZWm1J?=
 =?utf-8?B?eDNRcy9uWmw2UGpDTU1rejRDeHFuOEhxTnhmeGRwa0lieEUzTUhCNEloSDFL?=
 =?utf-8?B?MDJOZWtKeFlZdUh2TndhaXNjMmtFS1JGU3JodzB1ZFprd21STTEzZklLSTh2?=
 =?utf-8?B?T3Zjenp4aHdKVVRoZ2VYaXB3NHZ4UjhjWHRHOC9rcDBWcmdkbkhmVWpLOUR6?=
 =?utf-8?B?RU9kMU8xeGFsTlJjU1FYckp3QVZJeXZoQ013eDg3S1d4VFAxYTVpNndRSEZE?=
 =?utf-8?B?L08rWWIzVGRDdFpuYTA3aFZDeUhIOVBaNWdGamh3OW10aUNZdjZmSGFyMkJM?=
 =?utf-8?B?Y01RMkQ3SEFJNFdwWTNrR3ZCZmY1NVJYK25OSHA2VW1KcUpXUEkvaXBkdHU0?=
 =?utf-8?B?bFF3OGZzUFZ1R2Rvc081N01IU0hQM3hxNHZCaVZrTlViYWNXNkQxbmpYdkFz?=
 =?utf-8?B?ZW5BZ3ZneVpybHg3MDNDTjZhdGpEVGNncW80KzRVZ3VTeWgwNnBTVUJxSk5y?=
 =?utf-8?B?R2pTNitaTDU0bnZNc3dTUGRJNHd0MzJGMWRzNVc4czVmbm5YeGY3cnlNMmZr?=
 =?utf-8?B?Zzk0ZjBlbTVQdFl2azJiV1VvOElBOHlKVUJyOVV4OWVBVzRTTC9XZVZDSFND?=
 =?utf-8?B?eHM2OVZ4bTNDMkd2VitkV2pxWWl4QkpENTNicENNVzdjVTlteXd2VHI3bDJ5?=
 =?utf-8?B?eGlvd1ZTTHI3Z0xFeWZoNmZnVk9JSmdBVG44akh3ODlZcGhGVHpHdmVUMEZM?=
 =?utf-8?B?bkEwa1FZWlNlK0VyYlRKN2x2VTZla0RwdjZNTGxOYm9kU0Fueks3cmFjTVFP?=
 =?utf-8?B?enZpQys0Z211anE5STAyVHZnTWpibkEwNzZVZ0p4S2FZbWF3OHE0K245T0Mx?=
 =?utf-8?B?OFR4ajk2cFR1MUo1UVVZTXFNYTY5U2ZwSHk4Wkc3WmJZR0ZHQm1xdHc5R2hE?=
 =?utf-8?B?ZWNSTk12RmxzRSs5aVdXdDJNdTZGbXNPQjVqVHpwbTJtRE41cFJPa3VSVWdu?=
 =?utf-8?B?NW1tOFRFeVV5UmE2eWNKUzgreUJCeHRLRGlnSXRKTCszTDlKd09DRmZEVGwy?=
 =?utf-8?B?cVNyMnhHeTcxQmV3cHlsOG8ydWZ3b2xzWWVWbG1SdkI0eFpSRmsvc1YrSWJR?=
 =?utf-8?B?TjZMQytXTHlwNWpZR3RxZnEwQXBoVWhOeVUzNXlOUU5RMVN3eVJ1YjZqNVJE?=
 =?utf-8?B?eDZGZUhsMFE4dnMrOGlVc3ZHQktTalRIRUJuL2JhTGswU1YySXlhODM3YXZk?=
 =?utf-8?B?OUZOLzFVZG5xWSs2ditNdlZBRTlZL1A1VkNuMkI4N0JQNThYNUY0bjdNcURE?=
 =?utf-8?B?aXJUVzJCdWRPYzViUXY3bHVuTFAyN3gzeDJWUWNqdVprL2tYZGlkckFsbHd6?=
 =?utf-8?B?ZnFJelpTMnFLNm5QdFpUT0ZJaFNqbVZZQkxiV2haZGtnMzRoVDJoUTVVWk5K?=
 =?utf-8?Q?Zj2aGFNp9ul3+pLHLarFv5jv9AM+u+5p+xf6UF5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21245f6e-55c7-4068-0257-08d8d9a5b054
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 15:54:52.5854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMkw/CBcT7MZS68bkpdRXoYtlhpnWJEifoIyoCiFHDrmZN/ONTwO/m2HPih82xEk7xR+jjIXsMe2bLMzv/gUZDTjFw2xZ7TsTUm2dvxZgw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5895
Received-SPF: pass client-ip=40.107.8.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7,
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

24.02.2021 16:11, Daniel P. Berrangé wrote:
> The same data is available in the 'BlockDeviceInfo' struct.
> 
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

