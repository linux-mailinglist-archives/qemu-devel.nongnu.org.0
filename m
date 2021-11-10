Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD41A44C1EB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:11:40 +0100 (CET)
Received: from localhost ([::1]:50278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mknO7-0002Q2-BQ
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:11:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mknL3-00015w-N9; Wed, 10 Nov 2021 08:08:32 -0500
Received: from mail-eopbgr60101.outbound.protection.outlook.com
 ([40.107.6.101]:17646 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mknL0-00078U-Jc; Wed, 10 Nov 2021 08:08:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jc70O+C/dtX1kVNUu2Qpyq2sGTzmw+SWTmvXlVwUamoLzYihWzxb10JBqeuBKIr7dNJYSkRR1gS52WRp/40O+EAvSjD2ojfk9JPB8vD4Dp8ILIEozbHWHQW6JdL5Q9RZ9dhK5m6m1q6o/N9WpEdffIShGC7QuJP2LsG53+l4zy5tyuxUU98oGLbnlqqO4TNGtp9AmhJ7Evr4P9Ty3yz4hEh1uYzbNrVXKv93I4V1rWjet7v0n04Pq3KkCAFhIT8peIlaiGTw5b737BDl0VDj5qEjPthjyS2qnjumVyzSRIz1fCXBxO1wlzHMdHBK6Evd5ogvrwKy7TXSiKJq0/GK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQljcsGPzRWD8xaEKgMN0ovpyqY8KNkOgm+Ex2HCpKE=;
 b=VY0Dhn2kZc8JeuPWhQUFMkQwASJEbJ2Rbb+ViAQnpaojlUG1U4C22uyOJfoH//igNM5hHFkcbsaUrrInlgOQo5KLDBYD7Dta1ART7HbhKXtTFQQjX7dSrB14/wCidevNgEJC2yJAUbauk3m8pbGkZU1dFz1YRUvOcjrh6LfDh5X1ZC6MO/92hfqqUsjGPfLohwc05CZ9g9zCwQ8Gt1NJSI9lITCfywW9U6tAQw/JUoKDJZjlYVb5Q9PuPspmJOYRHhy5Vwewn5kgoJ2LZbC5PkyWBVqupexIOcWHX3AZcS9CAYotL3RS+v+6e2Y+mttshfK6vEJE5h6H+INx0XnTFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQljcsGPzRWD8xaEKgMN0ovpyqY8KNkOgm+Ex2HCpKE=;
 b=LQ7T0fbAACUihvnnMuLi02aYwprGCriicNCusBCmDiYCL8qoZWbTxW0kj3LrZQV8fLBxpLx1oqQUHhlOV1ZV87IW09KP3oo/ABXGP7yHx8ZKsaVSVkK0QcpAvJfQlj7cyRfSwX+3+UP/PhYYR7b30lA9HcyOFJaB4eksdV/InHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6053.eurprd08.prod.outlook.com (2603:10a6:20b:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 10 Nov
 2021 12:52:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 12:52:27 +0000
Message-ID: <4e7e75c4-6086-e13e-01ea-a91e9a60db52@virtuozzo.com>
Date: Wed, 10 Nov 2021 15:52:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/7] block: Unite remove_empty_child and child_free
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20211104103849.46855-1-hreitz@redhat.com>
 <20211104103849.46855-4-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211104103849.46855-4-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0008.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.243) by
 AS9PR05CA0008.eurprd05.prod.outlook.com (2603:10a6:20b:488::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Wed, 10 Nov 2021 12:52:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6153c31c-c0ce-493c-6d6a-08d9a448f363
X-MS-TrafficTypeDiagnostic: AS8PR08MB6053:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6053681C436A71B5B79CBAF2C1939@AS8PR08MB6053.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C2SzZqNCTbSJt1M3LIP3RvswYySnIZa/DaEjwLZhjzInT6BX3i8CemsAIud0/wS6s3wE8CwQ0BvfMwXKJYBP0bWD137kfezP4m4WnW0mGTrpBhLsXiWsIh6FkV0k+cxnQ+0Y2hONQO91aoUG9Uo7lUYFHgCnej9ASUdp45fDrVSzy2Jj+GvtmVYOLbFHpEO3DtSuj6zfbLd1nnp+HMLjwCyYTbkV1BFJXq7pNs+lxvYjwDhoqAQmezXsGwaPWuU40tneN5rG92aRDBWHPw0W3Td73MSB6jX5Vr5UJMJlyeIfBR/eLjROzdCGB7gesFK/OIWF239MNS78GE/umCt8lpCcV2VLeinrW1QFwhh/hmHcUtfCa1oQsy9BQ1XcgG+NEJTeo2JuhyJIYL4NMBAOfRetWEu4GkZQzzAt4JIKAnS5rsWIWmfPt20YALGXM+sNHklIa5WznnWel0Y47tBa2jEnFRB29Cle+tWF57v1gD3WbXetIPSzADiHxDvIfXYXJHFSBBdz6B9uwqup9ZThbSu23Jyl5NnH5xjQvxYMNO9nsWOc5cPdP61DQokcdNWO8uA9bqyqOb3ItMRtvZbp+iv+EFcdTjkyIW/Kt3mwo1yE3nxBNNbLAWB4UqZnpdsl0rLP2YFS/FfC5WY1TMOCg36HoteyAePlg+FWpmPcyYUWbGHJmn2tzPAIg+Xu2CVByUil8tP1dH3/2xvQizQ387x8/vcIPscnbSTjgeJh7jpxjoQappHxYobImCj3EVQdn7sKy83UgQI3sF22EaeOUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(86362001)(36756003)(4326008)(5660300002)(316002)(8676002)(956004)(2616005)(508600001)(8936002)(186003)(31686004)(38350700002)(31696002)(66476007)(66556008)(26005)(38100700002)(52116002)(6486002)(66946007)(16576012)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHdZbGd5OWQ3QTl6WWo5aGgySlo3dWJKeUNRZHY1UWpVWjQvOS8wd1VyTVVQ?=
 =?utf-8?B?VTJhNmc5NGh4b2s4ZitiS1JBNnN1Tm0yM0JRMWtCVWRPdFhsOVh4NThIS1Nx?=
 =?utf-8?B?bmpzcGoxckdYRlFpUDlyWkVoeHhGRnpmMHJUZjZzQm9scHNTQURJREFQN28y?=
 =?utf-8?B?djcxTDdYOFJjYjViMTJSTVBCS2VGSHVCaXh4V29uTnVzWE1Ub0RoRzdxcytj?=
 =?utf-8?B?ZWduVUVScDlYaGNoMkQ4MDZVMDNsSG5qT0JIeHVXcmtWMlZJN3dCZFAzU1hZ?=
 =?utf-8?B?aFo2Z0F2bjk1S0lMV2tRbmo3SElSTnp2aWJ5TmVJZnVRT000dkQ2UW5qalhy?=
 =?utf-8?B?N2ErNUlHVzhDdlVWVGlQZS9GSUdQanBpQnlZMkk1QkJPTUNSc0dpdytCRXcx?=
 =?utf-8?B?Vm9XbmlyR1dBcWRRZVBES1hSODRzT1BhbStzZmVoSmlUY0dVNXczVTJvaXI2?=
 =?utf-8?B?RzV4QWlJeGc4L1dHaVJWbTNOZVJxOVFmRGFmNkk3M05SMXltVktZN21odjM4?=
 =?utf-8?B?UWFFdlFIU3hHMk1vQ3FpdkpramRuWjFqSi9oeE1ldmZ0bEZJYVo2MVRUbGs5?=
 =?utf-8?B?cGRNS3NUQ3gxeUZyakY0VmpabDMwbjc2SmlKZkdSNFFzMFBRWmlUL1RxeEpB?=
 =?utf-8?B?VzFHSXplK3Y3WWFYc1AvVjBxSnAwemhzM2ZsbUdvQTlpTzkzRWwyMHRXcWd2?=
 =?utf-8?B?a1dCK2t0TTBESi9mQ3dGaVVyMHFBNDlqeVhoQXh5ZGNlOHYyMDd5VDhnRlRh?=
 =?utf-8?B?cytLVDBiNFdPRW96aittcnBYc1czWTlHZ0w5d0hQY1R3eUxiUXo5UUlUcytU?=
 =?utf-8?B?ZklIRk1PSHUxOUpReGxIR0xPZm5tbXVZanhFQ01FMWE3YXZyMm5LczMzWFRK?=
 =?utf-8?B?ZlI1Z0lKMW0wY0JLVWkrS3oyNzhTODhOb2pUdU5vMS9VMys5YTZTYnlIZk9y?=
 =?utf-8?B?R3lUVXNTZzdxU3RVZkNvYlBUTDAwallja0VHbk1RZjhPQzV2WjBkZU9IYmpO?=
 =?utf-8?B?S2FOUGFPaEk4RVBmdUJpRWc5REQwNytRMnMrUk5HZlFjbEg2Z0d3MG9XNzY4?=
 =?utf-8?B?SEJDZDRYa3VITVo2RDlqTDA3TUd2RVdsT2dUeFgyY2t5MUxUQ2p3Q3RIYlEx?=
 =?utf-8?B?Mld2NlA3bTFEL1hVdWRUL2gxbzBaaDJVUHA1STNmUnc2eGd1bVZ0Nm80Z1Rn?=
 =?utf-8?B?RkFzT3g2Z1AvRmlKZ0orSW5pVnA5blUzMWVlaTIzWW9CUi9wRzYyRHZVMEx4?=
 =?utf-8?B?MDdoL2JSdmhUb3k4bitlQ29MeXZtMFE4cTF1cVduRW1CNi9MMGxUQmNTMHU0?=
 =?utf-8?B?YkNFOUxabTB3bWo2d2hqclNaWVBPQWxMSXpTWk4rU3RacnVWSUlBdGg2ZU9Q?=
 =?utf-8?B?a0VBQlE1NU5zVjRHQVpJM2NlRmZTSEFkQUpVMkNlcWh2TWh0akw0Y1g0UnRH?=
 =?utf-8?B?T1B5SGx4dmtnM3lVSkJMbVlpcFVLQWhoZnR5Z0RaNm03VjZtaGVpU1VUdmlP?=
 =?utf-8?B?RFdGMVJ6TGtUcnBiNjByWmh1d2J1dHF0b25YaEE0aG8wdkliYS9UWE9OSC8y?=
 =?utf-8?B?YUc1WjhpVk5MeE1vMWY4dFRLTUxscVFNb2tLdWVyMk5NemFmcTVSYldHODBQ?=
 =?utf-8?B?SU82cVA3R1pWdi9GYyszREo5NUJ0TXJEQWxDM3dzV3ZIdisybHJ6NmZmdE12?=
 =?utf-8?B?dW5HSThWbmc2YjRibEtOMXQzVXoxSXliRld0eVZVdUN2TlNTZEYxbndnbjdi?=
 =?utf-8?B?ZTNwTURJVVVqOXcwalU3bUtWbzNBemdNRGlCKzBjUXhUdEhXQlZTTG02cnJC?=
 =?utf-8?B?c2xyMzdBd09lV2RnMmZ5MWlnTWxHZG5sVk5oaGNwT3pDOGx2alpzaVN4Q2RX?=
 =?utf-8?B?YXZUcit6UnB0dlZCM0owZ1kzalJUczVRV0RsSEQ3RkZuQndmRGJtcjNHdXFr?=
 =?utf-8?B?ckdVU0Vkc1M5MXlJWE9PMmZUZkMweC8yYmhjUVdxZGtjNjZCZUU1UlVDa29R?=
 =?utf-8?B?dXJRSE82ZXBGdUhjRnd4OWw1ZWM2OTVYY0IwamV3OWlybkkyVEpnbi9ZcDNs?=
 =?utf-8?B?SEdPdHhZMW5yYXQrdlJsUVFqcmQ5M1plSWlRazM3NVlwWFR1clZJZHllVC9K?=
 =?utf-8?B?ZEtxa0F3SEgrRzRVdkFKNjluTFNZZGx1bGJZOStJK0Q0UWR6NThSZ1ZkNEE5?=
 =?utf-8?B?eUMzclRpZ0JBaWlDamxiQVdvZnZSbVRTa3lXNk1qSGVzV3pzelBmQ3NCR0tN?=
 =?utf-8?Q?fOj+Fe5BX9nUDNDW2h1BXJIaoX881etwFx0y5f0wGw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6153c31c-c0ce-493c-6d6a-08d9a448f363
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 12:52:27.8979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtZ9e47gZxea3HUfifWLMSXezxQcxZ0r3diUg+ctooLVG0eAo6HjEYhvh0957Lpqw5nlrBPt/R7YLCfL9xFg2g/cCowPZScEOeqztEiN/qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6053
Received-SPF: pass client-ip=40.107.6.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_NONE=-0.0001,
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

04.11.2021 13:38, Hanna Reitz wrote:
> Now that bdrv_remove_empty_child() no longer removes the child from the
> parent's children list but only checks that it is not in such a list, it
> is only a wrapper around bdrv_child_free() that checks that the child is
> empty and unused.  That should apply to all children that we free, so
> put those checks into bdrv_child_free() and drop
> bdrv_remove_empty_child().
> 
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

