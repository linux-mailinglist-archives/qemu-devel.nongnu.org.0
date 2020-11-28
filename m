Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8602C7012
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Nov 2020 17:37:26 +0100 (CET)
Received: from localhost ([::1]:47962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kj3Dx-0007OQ-2C
	for lists+qemu-devel@lfdr.de; Sat, 28 Nov 2020 11:37:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kj3CD-0006pr-Vm
 for qemu-devel@nongnu.org; Sat, 28 Nov 2020 11:35:38 -0500
Received: from mail-eopbgr60120.outbound.protection.outlook.com
 ([40.107.6.120]:30691 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kj3C9-0005md-AT
 for qemu-devel@nongnu.org; Sat, 28 Nov 2020 11:35:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqBY5YrdParhv7T1DUAKUOKy5cK8YCLoDtPi9r7hxaCZD0+RMLrnWjVYGQa0Mk53kGBzJUdYOZ2w5ITMb4tfJx7sL2HYAGM8kFUZtL4SeMHlmtxJa4KIQU3rkJ7iU0kJCgEqe60f7TArqpwXzwVF+gbMQyN8GpYDYm5sOnE/RCsgE6THP66ZdN3GVwmtzcTlPohoknvweGTG4LkHAeZb+BX4cmkxHbcrpthZGhmW+bLGAuoLBYdZDqb7GiJhNdDxsDCcS5oam2d1rnBf4yqhRnLY3t1J9FFJe5ClJg+QJAhstA1i/uq4EeEXQPRGkqeFk3WT0EEzMLebBiPxvPHD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pV/0nSBv5CcXm2x6oKxeHp1Rsk5pSlMTUYjcpGFBgDk=;
 b=A8ZPn0G+7OV+z7TGyN8QAOLXIlRleG7wOpRM8qdaEZpzu6dxytZVT2Anxmw15MT3EYmnmR9VKbSwdeZTVSuWg2EgHTX9xxHWJ3I8g4biQh2HR8hf4klnad2NCTPKKIRfjGdyIpIhX9GhTH8ruqr51e9DuBaaIgnzcypGaOBzjySPqGyWSq+3FdM6mFAvAXleBvUhzhSM2Y6v2cGHQYoQSgDLdD6qpj5a/0FdQaFCzDaOt08xI83LaHrbA73Q3fIaTnUqYQtWzaW3WglmliEftDYD15tO7yReeMs9tz5/MIOyobvNHtqO2hGe8/k1meMlaSfTTnejnxSEAo9AKkEw5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pV/0nSBv5CcXm2x6oKxeHp1Rsk5pSlMTUYjcpGFBgDk=;
 b=NWlkclau7C4JB8C4x94Vs7PSLc8huk6eOtGgZkK2QlZG29/szFHOoF9rh9xX3Cx5QlGiIc2mn7QRwDIH3b/pCVsbW1EGmmTrTdPT1cY0Ep950CErJoWAgT54ErBI9IpjoB9TluAzPYKMHQSHx6hU/8q2nrnhiJolqPjiCClfqSI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM5PR0802MB2499.eurprd08.prod.outlook.com (2603:10a6:203:a1::7)
 by AM6PR08MB5173.eurprd08.prod.outlook.com (2603:10a6:20b:e5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Sat, 28 Nov
 2020 16:35:29 +0000
Received: from AM5PR0802MB2499.eurprd08.prod.outlook.com
 ([fe80::bcb9:66a:2571:5b4c]) by AM5PR0802MB2499.eurprd08.prod.outlook.com
 ([fe80::bcb9:66a:2571:5b4c%11]) with mapi id 15.20.3611.025; Sat, 28 Nov 2020
 16:35:29 +0000
Subject: Re: [PATCH v4 1/6] introduce 'background-snapshot' migration
 capability
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126151734.743849-2-andrey.gruzdev@virtuozzo.com>
 <20201127195520.GE6573@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <1a742d67-9eb9-7d97-c217-0147fab17b6c@virtuozzo.com>
Date: Sat, 28 Nov 2020 19:35:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201127195520.GE6573@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM4PR0202CA0006.eurprd02.prod.outlook.com
 (2603:10a6:200:89::16) To AM5PR0802MB2499.eurprd08.prod.outlook.com
 (2603:10a6:203:a1::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM4PR0202CA0006.eurprd02.prod.outlook.com (2603:10a6:200:89::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Sat, 28 Nov 2020 16:35:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5733dec-3207-4ef2-70c7-08d893bb9dc6
X-MS-TrafficTypeDiagnostic: AM6PR08MB5173:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5173836AF20422824747C1509FF70@AM6PR08MB5173.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cZqpEoYRH0k8zw+8Jvcj9vKy6SSB1JH1kBv7ir30CC03oLG0GLo+H4kb4foYV5/YFV6ZBRd/LnN4EAQl5NE1xD8JH1W166CyUIwdVL/EjCpOh4D09cbzZTOHEtcm0723FPcxgbYUPVRAyIYZ+bTHmEtHmZM576i/Zng9qJ60f/2qxAIBvu/oszxQOIOeDJl7QXNu4X2MZWgqa7YhzJ2dNmoYWIQvRIpzbHZe2WKoEyaBKGEM8JhGB59HBOx3IJQmbMWzJQXxMqbB68vnjgTQc8nSDU+SWMiqrIdYUMkiTDlE7d5YK09tfSeeB+Bb+ELSL730Alh8PUfXLb+BZi5DMP/FP4QGpbn2s/Wt72SD+9IAsb1+KLOIF95f70p4nJXB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM5PR0802MB2499.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39840400004)(366004)(346002)(396003)(956004)(16576012)(6916009)(2616005)(31696002)(26005)(316002)(66946007)(2906002)(8936002)(6486002)(4744005)(66556008)(66476007)(36756003)(4326008)(5660300002)(83380400001)(16526019)(186003)(44832011)(54906003)(31686004)(53546011)(52116002)(478600001)(86362001)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VlFlM2pBRGpXUGJJZHNWY2xMangwYjRwYlVUU09Sd2JYd2E3REZPSmo1dGox?=
 =?utf-8?B?YlIxS0g4Qk93Y1dhYmR0RC96THQrY29oQW5UbHFaT2tLcStEY2Q2UmZEQ0lB?=
 =?utf-8?B?c2hZclc0VlJpSUl4bVdianhJQ2wxOXg3VENaYnhtbGpkTlhuUFh4T3J4Y1Q3?=
 =?utf-8?B?eFhnQ0xtRXlZelJPUFVTOWFVRzU5eWhZaysrbGl0VmdIc0NHYVZ3UWVhV1Ra?=
 =?utf-8?B?OTMxbmF3VXBFZDRpSitLWDJCWi9jMm1sKzdrUXd2TUlPTDVBdUxsY3RUUVlN?=
 =?utf-8?B?eDc2WEZsenBrUmZJazBwcHhmNzR5OEU5Q0M2V1B2bkRHUWlHSDJuYVU2aXkr?=
 =?utf-8?B?RW5VU3ZZRkk4Zk5kQ2ZaMW9Qa2xxVkcxckVoWmRmOGhaSHNCVGJ5M3VMbWg0?=
 =?utf-8?B?Wi9jN2dRTithSHNMbFc2YytYK2ZjbkUzYlNiblRUYVhGbnBmREtwbThFQWhB?=
 =?utf-8?B?dVBoV0ZjWDhoUjVNbVRCa2NQYk9JblRBVGhPZTZiTjB2SlpFWDdmYkJnVnFM?=
 =?utf-8?B?NW1nUGcxclJzb04rMEphN0NsT2o5UThoTXppNE5HcHlQSGdFeGwycUZSdHV6?=
 =?utf-8?B?djdjTVdWdzVFVGQ2MllpUXZOQUFPcjRjdk1kaXA0WkMvdEFWSEpJQitHb1dp?=
 =?utf-8?B?TTEyVE00TzFQSnlBcG9VeUFXb014bDArYXYyRWZ1YzhOYmxwM2Z6ZDIzMHJX?=
 =?utf-8?B?eDNTRC81cmJuY2VHV3k1WTc4ZEo3d05LWkwyakJkNk85a002YXUvUjBWdkI5?=
 =?utf-8?B?TXRlQUVBa1BZeUhDUitOQWZaRUJ3NFNUVnpheFA5TFc2TGhncDV1b2hUcndt?=
 =?utf-8?B?TXBTUnZ3QjJQY2lSODNKQlNrSE1ucmdTVUdia3cyZXZkWnRKUWRDc2d2ckhB?=
 =?utf-8?B?L0czclNwYU9wUHFCNUhMbjlsd2Y3V0I4RWNmMGtFS2pkWHhjOFB6czY4aFoz?=
 =?utf-8?B?ZmhuYU1sMXhRUGhOaWVleWF3S21iVVlNb1R3OHN2RVMvSkVHZW1neFdwc3pa?=
 =?utf-8?B?N1hCUkxHRnZLVDZDWnRmVVVoUm5MMHdZaG4wVVAzWUUxd09sT2Z3SlJWYWpv?=
 =?utf-8?B?TFBycHRCSG9wWTFxT25jcGQwMlhGUEFDS0tjbTM5SlJUYlV5Nll1b2hjR09N?=
 =?utf-8?B?dWNHTjQwWVg0VklvWDMwTktNZGoweGJDTVIwa3BQb21lWlBGVU04NE5vOHlt?=
 =?utf-8?B?bkNSdXYyZ0hYVGhHNVNGYzlIL2ttaUllVzZtOVl2bytBb3FEMzl4ZEpmMERH?=
 =?utf-8?B?SDZwdGJiaWtMUGtnZjQ0UlEvUS9xWkJaKysvdlF2ZTNSMkkybjlObURqbWxK?=
 =?utf-8?Q?Wh7VPrXs/IguM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5733dec-3207-4ef2-70c7-08d893bb9dc6
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0802MB2499.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2020 16:35:29.2048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WweJxUMNcVKdMF8G90+x+Ue8VfvfyB9oj/TN4OMPX8UQDZfqMQXsLBEMYveaKYBbLYbtyzt6/bJ54QoSqXwmZE1cptSlxw11Gtb3IOQ6lm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5173
Received-SPF: pass client-ip=40.107.6.120;
 envelope-from=andrey.gruzdev@virtuozzo.com;
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

On 27.11.2020 22:55, Peter Xu wrote:
> On Thu, Nov 26, 2020 at 06:17:29PM +0300, Andrey Gruzdev wrote:
>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> 
> The patch looks good to me, but again, any commit message would be more than
> welcomed... as long as it's not empty. :)
> 

Yep, agree. :)

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

