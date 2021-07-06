Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18493BDA8B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:52:49 +0200 (CEST)
Received: from localhost ([::1]:33376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0nNQ-0006RX-MI
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0nMd-0005U1-Cn; Tue, 06 Jul 2021 11:51:59 -0400
Received: from mail-am6eur05on2129.outbound.protection.outlook.com
 ([40.107.22.129]:63584 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0nMb-0002dS-MB; Tue, 06 Jul 2021 11:51:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbtF4isc/1AGvAmvWkhwVvU3AHylFthgxLq8Qp1L4J78R1VaPa5Uy6AK6aN2WCEMqEnYx9+3PGtuV/mae9RnxIk3FeC30Jl/A5cBkAEZUIQ4rEh+hTLAAhRvDkJBIkseZwePK7U7ijSGjGk+lZnRkRAmYUqmFMFhe9XYif1IDXUXajAmQQAiOKBiVP2Boz/GgKTG9lkDxHT7aVk4AJXhyjdMq6Mf220t/AcFAHk1gdoWo9yoNOxAbAZJcgYCijniAN1Isi4/8TUYEvWn4a4O9IZW9NQ6mL62tCskprhhUBU2ZfPg0l/xh0Jq86qhmuJLyHm2ru/iA97uE+yGzJtwPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Re0oKKsMG9oGUudZr03rBsb5M/8lWFS8iGEsn4ef7RU=;
 b=M7Q4g+zTbtYR2HZ6+ks7+/6Gw4yBRV+76dqzMNaialY2gs1o/IV+KAgixQ+xYS5YNPXxcXvG9hWZWEbNA8tJQQARDwdAt7YdBc56X9XA2ib1XgtRjddW3j3WE4ghHJEihzMSYCu9x6ZM3eR3I+f6L+zU+8iDZIRzG6LGH/+ZqIOKZm9AZcRP+8m9NiEvJlHUlYtB+TirxeRmUmvTT0Bruv86IVmHTUDtlgG1RG/cowmlEk986YTbMY9LJuGQZyGnByCc68oB60ahagZxTrYYn2KoRIMhWavF+xIYHaF0CRuz9D6G6e1aWuKjyE94AoEx/3hp+t4Ow5T0tdseCeN7hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Re0oKKsMG9oGUudZr03rBsb5M/8lWFS8iGEsn4ef7RU=;
 b=M0+t4d1Xb2x/LsR9nT/UEWPEJbvfeq74rL+7IahuQP/WtbjmNpUuv4G4vCxUXDbo8zjywVGKdc+7M5/6zSgtntr4B1CrVZccDs+kIPM7DeW2nNIay5CA8BJdyIAXFfkt8Rk9a3eizPaUiSSilI+oA8EgRhleAvRAeYwrFaNyHUY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6470.eurprd08.prod.outlook.com (2603:10a6:20b:33a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Tue, 6 Jul
 2021 15:51:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 15:51:54 +0000
Subject: Re: [PATCH v5 6/6] block: Make blockdev-reopen stable API
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: mreitz@redhat.com, berto@igalia.com, qemu-devel@nongnu.org
References: <20210706112340.223334-1-kwolf@redhat.com>
 <20210706112340.223334-7-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b2315c1d-fa47-bbf6-5edf-5369758127f7@virtuozzo.com>
Date: Tue, 6 Jul 2021 18:51:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210706112340.223334-7-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0084.eurprd07.prod.outlook.com
 (2603:10a6:207:6::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM3PR07CA0084.eurprd07.prod.outlook.com (2603:10a6:207:6::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.7 via Frontend Transport; Tue, 6 Jul 2021 15:51:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72e8f9a6-c3f1-401f-a093-08d94095fa46
X-MS-TrafficTypeDiagnostic: AS8PR08MB6470:
X-Microsoft-Antispam-PRVS: <AS8PR08MB647079790ED2BA88C990E3D1C11B9@AS8PR08MB6470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NfKs9KeUo9G7slZnZ7VvKEM8WRoBjT6ZIsZKjHv5XDVptJctOdfYEFl3mzMgHLyxN85eq7YVcQnoOxOfds8ruZz8qKDse9SYkM7KgWitK68sxetAcQ8+0U1OKp3XOJgFBeaWtbRtP4Wx1E0PMBAFLwV6+SJhpHsT5/9ggbauOs0xzHFxRVkL4I3cMe4ABZpL3IhtjfkARdkH1dbueybikrxuDHwhYOMIvgjZRbgVwi0yq1Tnb2KJhiyL8S7FM4yyw6IYL8z1QRDJ3sEES53UFRmERt0fitL+b4HDadbApxeTdCr2tyaK6PLwZuQj2gfNEJPwLdoqVq2RWBzkJFdbk1VEgFJkquJkRUJgan5HKKTLzsMTvP+KPkdZGBVQ7NWvV4h/TvQMbf/qGMFsSeMY4vvKUT/lJHr+8Of5y9lwk/iOsutxKT7pedvVHEbDuE8UT0KKb/To1KHGX9o/Kd+uOjC6/LgiRgx6ag7dNXaN1jL1SmJ6F5IdPRR2KCQdYhv6c25IpblhPZC/edwJbgElhVVuyEW7P5fd6r42Wr0L2WY5RGx2XEqqGmEkDOcWIOObapVX0xReCryQ/QZkEU7cZ9Jj21rURFwPCW71H0oUoniQSlcfMfaeX02t88OQIsD2pQbJ30YOgRRiq8vJBpiNFHpOxJv12S5vjDKvFQPxCsEDuoxb3/GT2mlCmzh/cvnAln26bgJv/9RoEDZoYCISD+tEuX4nNGziJ6fG93rpxm/I6VBO8AWOLnTZ/eum/4W9XWKc0lbRildOe6GWn1iP/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(346002)(366004)(396003)(136003)(376002)(6486002)(478600001)(4744005)(38350700002)(16576012)(26005)(2616005)(316002)(83380400001)(52116002)(86362001)(956004)(2906002)(66556008)(36756003)(8936002)(4326008)(5660300002)(66946007)(31686004)(66476007)(186003)(38100700002)(31696002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blhFYWlqdks3MXNYbklzeS9haWhIWFVodlg0eFVqRGhKU1NXaUwyNW1KU3Fr?=
 =?utf-8?B?akVTVW4vNlRYSk11bjh3bHJUK05SYU5TTjhGVFZydHE4SGRPNTJ5UnpXNzNG?=
 =?utf-8?B?MDlBYnZSL2VnRFZJdUJnRG5jWElRTjV6am1mNnhWdkxQb3gxcjVHRmdXTmlO?=
 =?utf-8?B?UFppNHkySURqTnhDY2JDS2RYaDY0akN0bnFxMFgvYm10ZW1sQkIrWE91NDh6?=
 =?utf-8?B?QjZBZzVQS2ZveXJtY3dJbXJiY2VBeTZBR2NhVUhKdVlRZTNhdXBtM0I5SGpN?=
 =?utf-8?B?ZVhJZVIrNkhvWnovMDdhS0dNaG9qNHhBS1ZKSkQyUG10MGFWaHg0SjdKMytE?=
 =?utf-8?B?UWFMcUdIUllzVFVjSERaeUprTnRiT3AycWh4cVRzRDlGNWY5UDFCNTdBRlZK?=
 =?utf-8?B?UitLeTcvLytRMGFHdUtzT3Z0RndLNTdjVjQ1eHpRN2l6di94eDQ4VVJDU3Uz?=
 =?utf-8?B?QUp6Tm9IRm9KeE1hcXhEalRPMTlpRVA0VCtXZ0VWNlZJUTZrYUhKK1REemlR?=
 =?utf-8?B?QUNFMjR6N1o4UTA5d3lwTEdZNXpaOW5sVHdWZEQ4NFFYTlFYekZvZUNuUjRE?=
 =?utf-8?B?c3E0UFEyVFh6QVpYN3ZmeDFodWNWbmg5Z2JxZzNnRnp5NGtmM0F4VjV1MWE4?=
 =?utf-8?B?SlpiVjlITmJ0dWJtdmIvaTV4QklIend4bHBkbmdaQktWb3F5L1dHRnQwVWNm?=
 =?utf-8?B?N3FzVEhlRXpuTmtMWUhjQ2cyLy9peEYxZ0RZcWE5U0J6aXk4cXg3cUZmR1NZ?=
 =?utf-8?B?NVN2cm00UFZYRkRvY2xRSXBQV0plZEVoSWUzbDdnd29JT052Y2JONDdtVTN5?=
 =?utf-8?B?YngvSDQvZ1NWKzBOM3NGT2t3N2FBVE1OSlBma1M1U2F5dEtrcm41UmVDWlhT?=
 =?utf-8?B?WVZ5OHdlVklWVmdYdVVHTXlMRWRqUWJ0eEVKZWMzUngxM1ZiRHVveFF4Tld3?=
 =?utf-8?B?K2VqWkN3dVlNbXR2YkJLRlNxTDNEZVZTT0xQNE5TTUIvbVlZcXE0NEY1ckFa?=
 =?utf-8?B?SEQrbGlqNndZeWhXVEs2ck1PWU5CWlZ1dXlGM0ppb3Y2bFkrUFEwYmdMSkMv?=
 =?utf-8?B?STAzZGQrSEtEYU1LVmtOWFo1ZnNWRTd2c3UrNTFGeVVlZjhpT0wzR2NTOG1j?=
 =?utf-8?B?aUp3WGxxS1lDQ1c5RUV1QmVxaUdQanpBYVF5cGNSOURpVERCTmk5TzJFYitC?=
 =?utf-8?B?VndDYTJvdnVLaklTVjdDMFFla09IZGhtTHpCaEliQjZLUXR1aVZTTFM3Qjly?=
 =?utf-8?B?b2JpSDBxekx0MWlQY0YyMk1LcnlVcDE2TWMzeU1NdTFDUDBzQ2x2SXZjUVp4?=
 =?utf-8?B?UEhEU08yNWo2WXNSZHlWeERXMGVJekJrcHBIRi9wc2prVm90MmV4a1JFbVY1?=
 =?utf-8?B?U0RyVFluMTBLSktMTm1tc29YbFhMNjFWcnc2S1BsQiswRFl1ZnhjQ3FBcStm?=
 =?utf-8?B?UmtkTDI3SVVhT3RpRGtZb2NObjNWM0JVQU9LWGVXRzY3L3k3YzY0K1diaGM4?=
 =?utf-8?B?anBqSWlMZFQyZURoa1J3ZUQrbHhUTldyNUxwYlZWNmhmR0tEbW9DbEROUUwv?=
 =?utf-8?B?YzB3STF1bmZUbXRiZDhYY29Ea2lFcGV6ejVzZG9ZR2czN3dUQlNiUHRWakVo?=
 =?utf-8?B?bzVVSEJpRTZQbFJ5RFZqQVNHaEkvWVZ4dTNJZ3h6YUZERGVOQlJod2IvN2d0?=
 =?utf-8?B?OTBZMWpVMmRWTjJJbmRTL2lEZkwzZjROWUF0eVcvTXpCQXJhb1FNNi9RRU13?=
 =?utf-8?Q?Idm8vJxjtnExDWQxve8ywWOBz8iLRGT+eRZV5Y1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e8f9a6-c3f1-401f-a093-08d94095fa46
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 15:51:54.3779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: My+MjGspSgVZ2MF0rQ6GV56ClT/KbGS5AcapePacy7nhazi2+AC5/Ij/wSZahBBQlZG4Xc2Zhq1sA+nmFKaZO2oB3j8j1tL+RdiC/wzqyXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6470
Received-SPF: pass client-ip=40.107.22.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

06.07.2021 14:23, Kevin Wolf wrote:
> From: Alberto Garcia<berto@igalia.com>
> 
> This patch drops the 'x-' prefix from x-blockdev-reopen.
> 
> Signed-off-by: Alberto Garcia<berto@igalia.com>
> Signed-off-by: Kevin Wolf<kwolf@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

