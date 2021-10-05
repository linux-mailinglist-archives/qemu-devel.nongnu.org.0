Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8503E422EF8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:18:16 +0200 (CEST)
Received: from localhost ([::1]:41996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXo51-0005pp-Ii
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mXnJB-0006ne-0Z; Tue, 05 Oct 2021 12:28:51 -0400
Received: from mail-db8eur05on2099.outbound.protection.outlook.com
 ([40.107.20.99]:57056 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mXnJ8-0007K9-HD; Tue, 05 Oct 2021 12:28:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOStY53dXQUxge3qqKbvvAIA5PuKroGap6FMojGe6hrE1ZImL1m3aIPJvOCKdNAMYHDz4TJSQz5MmaPO6GQYI8gI5c2661kxNPq6ffjnjNPnoGNe16jxAOaKg616ar3Dt9RnQv9GbpTSxPoAQgHXvS9/8Fsrfj4vJoiaFQFv6MB2JQ+NCVirm1B664kyLK1rDcGp0gFLkoraRSN/TQjIS3Y48SYc8X6apIAuXfNHl4/InbS3AisYfiu8G6OvvySqBN9duZ2TqV+2/fE/fKvJ6QKGsjp1fUfAvoZSNxp0STE24s73D2W0wV3lMq+cikFoLDcJJdHU1/5cVS0Zbn+qCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQlozBFMBFI9Rx1GTNvcTQlb9AMtSAsBou186vbtxgE=;
 b=TsPE+qsfLOe42CXXnyzabIX693AoOuma+kvcpAzfBS4UgvvJdyStoxYUcuZXltiGEVenQn5xikYyNKqf6CxqqlNwa98RvhqvD5G/rnwz0sqrOKaFYbXNUjuCtWL5j9m3Po9XOb8vvvxpUqiLXrGBwVK7cY5P0k257M5QcPHLeDxIihodKT8ycnSM5HWLgZ4J59iHfDAdC11p83WHNoclMhFDhfboysPSh+aSwX1hkBxzx8w1uVT4rP6jXRtEE//lQeaNEhHtAUeOyZ7zokKXqhrGWzmncn/Y+GGvRRfI3c6CCIMDTQeaEOUoTESaR5iNWiJXHlxHKVBWw5pTY9cNwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQlozBFMBFI9Rx1GTNvcTQlb9AMtSAsBou186vbtxgE=;
 b=wrDBsLQGyrjV6xdBfdBPLpkrUP7Phsgg0aSZVpYDGSy6yPkfA0FXcaD2EtyIK4aQzP0Voz8PN0yTTjoXQceXfQqPhF0rJdeTAvw8a3RwOacY97+CFcc4PxK2Ur1TvyaMuK7Bd0QQfzqMaXCccDe15Wchp3Jo8UXRUXQWoo0XVnk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3160.eurprd08.prod.outlook.com (2603:10a6:209:45::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Tue, 5 Oct
 2021 16:28:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 16:28:42 +0000
Message-ID: <b3aff0c4-f35d-3e75-c2a5-5d3fc6b192dc@virtuozzo.com>
Date: Tue, 5 Oct 2021 19:28:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] block/aio_task: assert `max_busy_tasks` is greater
 than 0
Content-Language: en-US
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20211005161157.282396-1-sgarzare@redhat.com>
 <20211005161157.282396-3-sgarzare@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211005161157.282396-3-sgarzare@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0040.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.207) by
 AS9PR0301CA0040.eurprd03.prod.outlook.com (2603:10a6:20b:469::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 5 Oct 2021 16:28:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ca6d246-9a00-420e-9ef0-08d9881d31b5
X-MS-TrafficTypeDiagnostic: AM6PR08MB3160:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3160A4890035D3E508340F77C1AF9@AM6PR08MB3160.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wuIqYhvH671nvPbrjqeBwfJmqf+p0tKfUxelkAL9zadMrmLUo7UOc2FuHOlac6TIrItEAyZysAvB3ynpI20o4Tohja6KLQHrOoEJsDbUdGXvFnSxeReW6eyObkXNxDdGFwDVLb4SNSzDaoQhPySXm0cF9x8Ygrd2P8yN38P39C7X9s3Hfd3Nkw+ZwdgnXR16oLauJODuFzPR4eP66dJsrCPKu/5biT/jgcGDo+Ua6bTIjdXLpqsDVF8toY/OcoPKv+vQ6rCAkEzYOhR1cLln+NQjJ2+E1Yb0dUOmrfhduzx3RK9MAxjPqqcu71rQ+I3zMAIdaN/mJZx1uzsBUdHxLi+rLGLMQEJBS5xYEzM0y6QoRbJlvqLjuIwoskkSNrCCDcz6OfiVEzbl3xa3N+9AJgmS/zjrpWi7bncRWCu2yZpSsVBpOJqsX4HrjD7lyOEI+fwmmSckFYg41CeL0/kcBHHF9Ow/d4MqjiypQxGEC5mhYsJg0vRjbC9G2oIFwl+0h9LRT/fOgDWSgimXngthjRUMtWtEUqBXtCt2uQl/9uptLE0mWuuchOkKjgzJHbpsGUg+R1V1qFpCypRiDzkqRBLQ5/C2ZBMWDeClHV/wF1dr3ycs1DmvmrfRofeCboSPr4GYu1pcdMD80OdbRC8ppBtXOhG6sIaX/q6V4t1jCS/Eigzr/ZOi7FcWM7IIwkNx3NNovkXlp4G8+7ObZkssbWgqMiX2swbAx2O4kPb3+PauYjufHqHswOpPb+7lS3cok/oV48ZBE/bu8PV/pBDH+xPWqAgLeiU/4lBnsK5QUFs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(186003)(54906003)(6486002)(4326008)(26005)(16576012)(316002)(8676002)(5660300002)(52116002)(83380400001)(66556008)(956004)(36756003)(66476007)(2906002)(31686004)(38350700002)(4744005)(66946007)(508600001)(2616005)(8936002)(31696002)(38100700002)(81973001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1dPOHRLVzhLQlI5RHdwTnYzV0FkdEhzeXU1OGlJMnJCeEhwbW5wRFZraDg2?=
 =?utf-8?B?OG5EdUNvdkVFdk9MR0lyNkRWZXcxZm43ckY3Ym03T3gwcjVlT0dHRmlxODRs?=
 =?utf-8?B?TkQ1NWRYR3NldC9kNGs4bUpWNTZLM2VtWWx0TDE1aFdFU29lM3Qzd3YwdjQ5?=
 =?utf-8?B?STJRdFVUNm1ZWmI3bFBjRU9YWFNuTWxHeUg1NXVNaUQySlNlQXhtMkZCS1Nm?=
 =?utf-8?B?TXNFRndOSUlZWGlLcVpnUm1sdzk4cFhxU3lNOHh5UEJaZmVHYzhCRlBUMEhj?=
 =?utf-8?B?RERRYllMVlZnNERTZnZDTDE2Y3lQT0RoZi9VTi80dk1UWEF3ckg3eklFbGkr?=
 =?utf-8?B?c2ZLSlJFK3ZndWNMZUViSEFmRXZFYmlCYitiVzZRb0J6bjNtZll6cGdkZ0lO?=
 =?utf-8?B?ZXZ4blhnaDNoSHdqUURKOUVxUEQ5UVkrMDVGZW1EcDBiT3ZSM2Jlc0FkUlpT?=
 =?utf-8?B?L2JnTUlQODhMaWh4cGN4Nm5VOGw5NkNaUFNjNFdjRWw3SmdNRjhyNHk5RkhC?=
 =?utf-8?B?MTJ4RG9LaXljNXdhRndVcUNwSkZQanI1Sk90VVJWbHYyZFE2d3FEcUx0Y3ox?=
 =?utf-8?B?MzhLWVRLaVpwOGswWnM2RmtHR0R4SThLTmlZU3BnbXNZSjdSNEY5OUlJZ2xZ?=
 =?utf-8?B?OGt6TXZoSEhqaDZDcEJDenU1dDFUUDhlWnJlbWlUWWJKWktQQmpiTFdvSWxj?=
 =?utf-8?B?dnFXbjdPMDBNeldFbWVlTExIZDFqblhBOEpCeEpjOWFhYWxLQzJ2UmdNWGJn?=
 =?utf-8?B?amptNFk5bUJBNFk3bE9NS0dCM2RCVjF3MW9jeWRPTjFERng2SWhsNjc3aUlk?=
 =?utf-8?B?SkxNZXpCV3VRdEtMcTV1OUoyR0JlQS9ZNGRpZCtYckdPMlV0a0V5bVNTYSsz?=
 =?utf-8?B?NGROaDRSRVczckgvSHp5TXV4YVdEVXA0WkJJc2x3dlRqcCtCSTlPME0xRkJK?=
 =?utf-8?B?VlF3YlVSQ1JzK2Z5ZDF4bUthM25FNmNHZmFYZnJ2dnZ0b2hJQ1lwdStDSDFT?=
 =?utf-8?B?NnF0YVVQKzRiMVh2bEJzbHdKK1g3dWFQZjlXNkFaNGVlRVhMOGxIZWVCc25P?=
 =?utf-8?B?WGN6bm0xUDNjelYvM1YrSTdjbmFDbkViN2pHcDFvajZEVXg4amVsNFdkMnJZ?=
 =?utf-8?B?VjJBRVFCRm1lYzVXcVBwYWF6UWlUQ0ZuWEpGQXFmMlg1UW9JdHJMRk1vVExB?=
 =?utf-8?B?Rk9UakpXdzhLUldaTjdOT08zQ0NzbC9XRGtBSzBUdi9NQkhPSjg3QXBCMndS?=
 =?utf-8?B?c3ljNCtjd01ULzVwOEJWVlA1NGdTTVhIQ3VJY29DUFRTa2x2N3Z6ZWVDcXlM?=
 =?utf-8?B?aWsyRkI3MkpUOHBGdERKT04wQTRkQkJBcS9TcUhEdzR5YjBpWFlXOEhRTTBs?=
 =?utf-8?B?K3dwWmtLWmFJN2RrbW9tVTluYTJXaUxzaXZyWTFMdk9vZ0k2MXg2dVRaVWh1?=
 =?utf-8?B?QnJTUEVoVVZPeW0xd3pjNDFWVURmeWl4YlRXRjRDdUFSUHlDK2Y4UlY1d2Y3?=
 =?utf-8?B?TTNTSWlZV1ZFYXd6TTc3cER5aEpWcjM3a3duMmhnVUZtYUJIdmZFTTFvc01o?=
 =?utf-8?B?aEZCMVBUQUw0QVlWeE5jNEVTVmd1VEhFTm5EYmZUZHNVRXNreVo5ckxnNmlS?=
 =?utf-8?B?Y3ZxZWtCazJSQXdJUGhQUEdMTzNVVVExa0ttdVQvd1IzVTRNOUExczdnTDAv?=
 =?utf-8?B?dk9EK1hnOTA5MVMyaEVpS1NoUVJKZjRYOTAwWkNsVGxka3RadzJ2SEFYN3Er?=
 =?utf-8?Q?r5SQmJTqyM2+uZtwMyOCXS/tya0liKkP9Vt7hCK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca6d246-9a00-420e-9ef0-08d9881d31b5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 16:28:42.0026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XziYpwYWa/a0jxWyFKoNO6JiWhbIUmE+dBguuGk+4VYCyXIVZrRZLjpGaweP5j5e2TYPYBk3KEGH2DXO03zem6v96OXGbY45MPQWF8d92sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3160
Received-SPF: pass client-ip=40.107.20.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

10/5/21 19:11, Stefano Garzarella wrote:
> All code in block/aio_task.c expects `max_busy_tasks` to always
> be greater than 0.
> 
> Assert this condition during the AioTaskPool creation where
> `max_busy_tasks` is set.
> 
> Signed-off-by: Stefano Garzarella<sgarzare@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

