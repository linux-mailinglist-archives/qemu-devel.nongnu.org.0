Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0053B41628A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 17:54:58 +0200 (CEST)
Received: from localhost ([::1]:60798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTR3o-0007V1-PD
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 11:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTQyI-0000RB-Fq; Thu, 23 Sep 2021 11:49:15 -0400
Received: from mail-am6eur05on2110.outbound.protection.outlook.com
 ([40.107.22.110]:51361 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTQyB-0003O0-0p; Thu, 23 Sep 2021 11:49:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4/CksM6lTHztcrHseFSxGz2J5pJBFXw5IT/i7hV3uxxAjEMMzxWRjr/wcYBPH3mvErK/tpz0MaND0rckvHk6vkCsmgUQ8nzpzzT2F1+gpndVDGU2ACZIlMu3hSzl4X+2WosMhGDjI7YvIVgZ/X4EJ+01R4Rmr1JsoBx2T4YKdmHKqHx5JYyrg6fHxA4Hhw4APpKoMS5FEM0Pj8zs3naavSDUNup5Z3XGIy1DfKMMk4yMZDKM+ZMVC6ojHxMvyBXetqCtpPqxdXlWCIYCHAADhshXUS2ROkwLxikkCXgK9A7SK1AcLsa4PZgUCy95a5vbGjNH1S6Wev9GrsgRe9Q6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=K8Q9ucKrLtAmwfvgQw5bDHLw0Lo8qnd91SklQkEb51Q=;
 b=atwFaJ5TdBrN1cyMpC7FTDTa3ELHwdyrV0S51zP4RimD7O3fXdoKUTVYoP5bm3hHtn6PEUIuvR7KWHpYzgLWCEbLlZmGCbwS2dHFBmq9hFem3I3KBtq5dZTm29ZWrlZ9YzerS/p678pTa/lR7C5JxDqwqNLn4tZjVGsHki5aPJDbc4anThSmJRHsvxhMXSZpc98NjnsV6oTHXmV1/SsfqX/jy/nZtNRGGLFExwety1iRfldCD/wr0oi74Bcdejr5o7NBzwaWOqoYLYqGkz2SVp40wrwVnC0xp/p0F+VnJfYxrPbO5ilbLJuyGj0XiUXQ1bg1FxtNxjrzc0X62tWo0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8Q9ucKrLtAmwfvgQw5bDHLw0Lo8qnd91SklQkEb51Q=;
 b=M//zzxLFJTUNPraqcPNZXUre15E+UPMLTmPnH319jbVM7qCQCIyjh17KcgMwv3VLgXqIVoYuqFwr9tNoj5MSL9rCe1BX9UszW0LzIq6/ZmzKwjN6FVELd0tuT0OZkjvJvh4uO3jtjDrkTqRfVBn91HxPVNm3YHNiuiIADSmOQ00=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2034.eurprd08.prod.outlook.com (2603:10a6:203:4b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 23 Sep
 2021 15:48:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 15:48:57 +0000
Subject: Re: [PATCH 5/6] iotests/migrate-bitmaps-test: delint
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210923001625.3996451-1-jsnow@redhat.com>
 <20210923001625.3996451-6-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5a4678f9-1486-7cd2-139f-75c757dc36d3@virtuozzo.com>
Date: Thu, 23 Sep 2021 18:48:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210923001625.3996451-6-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR0101CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 AM4PR0101CA0049.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Thu, 23 Sep 2021 15:48:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ead2b2d5-e0e2-4ee7-348b-08d97ea9a73a
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2034:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2034B54947FB71727B7CE55CC1A39@AM5PR0801MB2034.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fya/koSXh8e6+HRNCdUjBjejbJFMg+Sf5w4RYYFf2yo/E0XGANe1Ikv5lvmHj65TL5fEp7aoDUXknH5n3TEIYjFHJMq4XWdxC9fTAh+PYR5rW6rLWjOFX9/IrVvkDOu9i875POdgCgQ5pk7LwgG3GfMluy4qbJNBiRu2XZIBIB9FzhUKvCXo/uZdQjPFIa3zdXHBOr0RznS1nphwlb3yh1/y14oK5wof8jsFECvSgHLgJujxZg0Uzbqeh2a4kd87G+0HXiYRyNZrobWHiQzQ1Zy4b7csxJZsa26c5ODKWb7LIxr7cPK58140sI28LWoT/MOobfGhVJOXg+aLgZXecjG1TfrcMTcni+U3TOrTvV9aJ/4defQRNQ1S3aaLPBuEe22yI7JWkkePPdGcc4qfuoHVYJkW3rCTlUX02tB1k+ViuWlFMM8neIpvW3FmHuT0P46LVhsPbmQbmJQQWwg8lWPi78BsL6xOjP2cSJDhRRmaY9qfJWENJIr0jCqbKTcdKYsS4IB8XWDzMqUmGdurcIGLWdsrIsxXeFdCNWwSsIOs9JFscrmXmWSKV1XWwJnSEd6/aVPcrYyOige0IBiOVg5zn+3VBsSIDSwC5rXIgypFDWNuHB71k7ph5TexbPShz3AoX//2XNSTTB8c2JMkiSk9vy/HvIXUqZbi4Mmo1924Hunxrru1e9UuIpzYb3eqiRuaOygab/GTHCbRmSe99/7fFkPTt8ejoF9vAiqq/kw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(186003)(8936002)(54906003)(8676002)(4326008)(2906002)(38350700002)(26005)(316002)(86362001)(52116002)(5660300002)(36756003)(66556008)(66476007)(2616005)(956004)(508600001)(31696002)(31686004)(16576012)(4744005)(66946007)(6486002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEptdFd0THh5Mis1NERva3hPbDJqVFlzdXUzWnZJeGU0Yzk3T2h4d0dYVDlD?=
 =?utf-8?B?ajk3WmIyMG5ydHJqL002ZnlHNHZVRnV2S2lGd3cwUWlJVWdCeE9TNlVkSkYw?=
 =?utf-8?B?anFUSm1Fd2dwMEMrZ2Z5a3dPaFpGd21Ic2tEbFo3N0RHMHB2cWlENXJIY0hn?=
 =?utf-8?B?QXVVR1NVRUpHamNOaFpveVFzR2pNckNLemRrY000SGxtSzZIWkhoWWNwYmJP?=
 =?utf-8?B?eFZaNGRSTzBEUTR0Z2tyY2lVMDJyZ2RPNC9HcVlsNEpaQ3N3N2U0Q0ZOdUFL?=
 =?utf-8?B?dDlHQUxyS2lKYUwzZS80d0l6VHVmTEVhZUlKNjJzMXJZcnBuaHB5QTN4QWFi?=
 =?utf-8?B?c3lncXB3WEErL0lYdzVCR0RXWW1XaFVhSktNQk5uL04wbU1xamFtY2kxTjNw?=
 =?utf-8?B?WWVlWXpwV2NGNnpObTFYVlZ5RFkrRFhta0lhVFNIVkJRSGhTUFJBY2RwUklP?=
 =?utf-8?B?NUdZaGhHMEhiWW14dFJrQTR2dm1LMnhQVktVdEpUaVpzSlB1OEpwaHREWTZ3?=
 =?utf-8?B?Q3ozM2RxRy9uUkVEaDd3K1NNYTBqOFZiK09UWlJVK2VBTGsvTmlTT0dETnZN?=
 =?utf-8?B?QWEyVGdJZGMzazVmUCtIZS90VmlicGUzOU4vWUpiSTAvZkJhcnZuRE02U2x1?=
 =?utf-8?B?WlhwUXhaeXp5dUxnTm1VUGdVbDJBZjNsbnpISFNDNG9uNmYxc1ZrQmdKNGNK?=
 =?utf-8?B?a1F5UWkzd1NtSFl3QWR3c0ttL2t4cU5LUklWU2ZuTS9OYk54b3BYcnczeWxS?=
 =?utf-8?B?Ni9nVGhYYjM1OVBoTklXZHVFcTVJbFhYSVozUnhqZHQzZWVFbWRlWHVMV0po?=
 =?utf-8?B?OGV3U1VrakI0RlRqeUhvWGxRNVQ2L05XNy95cUREelBvYWNoWjRHcktrcFl6?=
 =?utf-8?B?Q0F5emZFdkp6bXlTR1NIMW85RkN1VEd0ZTNFQ2tsUXJYbUJwZWEwWG5SVVNl?=
 =?utf-8?B?UFdyM2tIZHltZkNMc3I5VmdaREoyUGJxS0JXbzNHS0kxU3VWQWp1Wmt5bWxP?=
 =?utf-8?B?SEUvcWNPdzVxaTJ2dEtIbDFNWmtqMjhmenRMcGtFMUVLSlVqZlFKTzAxbnQ4?=
 =?utf-8?B?cU8wRG41VXNla3dBRUFyVVVra1FXc1c0ZmFlaUIyK0RiUlNtczdNMVVpN3BX?=
 =?utf-8?B?ZVplL3cxTDJPd1NPWEQvZlU4b0Q1SHZPZHdTYU1qQVFNOS9CUlM1OVdZMXFU?=
 =?utf-8?B?bm5RaDdlRlZzNWxXR1pQR0ZXeWlraG9jd0RBaGM0QWNQZ0JyeDFvMUNCZDIw?=
 =?utf-8?B?U244RWxVNXE4N3BWNHBqb3lnZHVFeVA3ZlFuZkdYNEhEV0dEMDhPcHFIb3Jn?=
 =?utf-8?B?bVJwVlZoNno4NDdibW9wL0h6RTNzeC85Q2NlbmtnYkorL3cxYXM5YU54aUZT?=
 =?utf-8?B?M0dHNkVQam9EM1RVTVFHZTN2N1EvY3VKbEJrdDZMTzZKRi9ubjhYdlNyOEpr?=
 =?utf-8?B?V2wvUjVqYmVpRGFhVVJUa2x6TjRZL3BBMGJ2VGtxZG42S0JZN1JTQTloaFJV?=
 =?utf-8?B?ekVHUG9TQmF6SkNCR28zZndLTmlmUWkvM2E2SU9oMWZ0d2Y1WHZMY0loUEo5?=
 =?utf-8?B?RUlxQ3NDQko0YWN5MmhCWUdMMFlkdDR6SWJOemlLUlA0bHluK1lhK256WGti?=
 =?utf-8?B?ME5tT0FlSGxIckFiVDlmaHdTUk5iSjRJcjB6RmZoYnlJdXB5NnFoYzZ0MnhM?=
 =?utf-8?B?aXp6R2drN2tSbXd4bnZzV0xFbzdJMFR3QlVSR2pWeXhJcENwMmJBNHM0WW94?=
 =?utf-8?Q?dkLimV8irHfvhPhnXJ+pkzsY+gTsaIVawPdHIUv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ead2b2d5-e0e2-4ee7-348b-08d97ea9a73a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:48:57.0465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPGQBGODLTifcGF3Ki2jaslUK0bWOZKQ33rNPr22w0D1jnkNEzhswdoG813AxSgFMV2mNyQ/bVxs/JGMdWWDbRykfWzpgvHfmErOf/iVD7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2034
Received-SPF: pass client-ip=40.107.22.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

23.09.2021 03:16, John Snow wrote:
> Mostly uninteresting stuff. Move the test injections under a function
> named main() so that the variables used during that process aren't in
> the global scope.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Reviewed-by: Hanna Reitz<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

