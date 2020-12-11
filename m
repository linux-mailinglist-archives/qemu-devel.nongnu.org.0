Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDE02D7EDF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:54:40 +0100 (CET)
Received: from localhost ([::1]:59788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnYt-0000Ng-An
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:54:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knn9Z-0005kD-D2; Fri, 11 Dec 2020 13:28:29 -0500
Received: from mail-db8eur05on2124.outbound.protection.outlook.com
 ([40.107.20.124]:31936 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knn9R-00048L-1y; Fri, 11 Dec 2020 13:28:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQPbhbQMvX4I5Fp+5cRORIDTrEdF3KJDN0Yu+jgMwlIZx+HNqFIUIV5O1yrN/l5V1YX39FaVrfceSYlZkoxktgG2eAIeF754ysiroji5kVmMYqEC2D1zLf4G9JfDxT8L3MUejQgUtP/e1dnQZHGlu7CtOluEPEhlvHTlYciWrmaZIGbxpIUnAaLZo9VlK/Jvr3wZKjFIavlQ2WULontwRSPqUWDHObaSKep6Koz89pVsQVOSxBRxz8/7/IVELMD8GTVzgEF0GnPhFX+64r6B7dWOpU7+YLEUeRgSOZeS0jAycZ7fdmJ5oYsatQbfmfirV0AE8ueoAGrhMfHSKLzm3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=macp9rRkt13vgK1FAiFS4NlQnVtNs6dL8Ga7etacKEE=;
 b=i4vS+acXYlHaaBGW5+9FwHeZ1KDlkRGwCPicWotEMzQeOFI66YUrFqYqk3OEtOgdPHsVQ08M69mLTyGHjgYs9tbRcz8UpZdFm05s2JplbY6mD/iGOpZP1218MKLdxGYtMgpurGh9m+PTfePZbEEswuq0R9bGjwOAeVlJ3/dhs+R900Cg76nNM2oXTaohjMbqz6Gbro1EbmkefQfL6Vu0jBy0oAQRMfR6mzw28/n+MjkvGygQIZft5d0S0cNdq6tYicEkIIeGJUv7bjQZ6EYP8kKKFmebzj0dXLoZxNMWL6pxsjMTmS8Ea0oD/Z+Td3MH1EPSdE75NOefTNO4MyYSog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=macp9rRkt13vgK1FAiFS4NlQnVtNs6dL8Ga7etacKEE=;
 b=Ev68ykwUSvyRCCVhIbshTTVxeI1XmpPEw9I6XGaAg1LmAFDfnW9jkyM1Ad0/NQuU668Rygw4PoW1AfpT5DTAFYi3Pzt/mR6NiaKKk5ll3se+ETvwZTIJE8Kpqrni8kXtPPBxFgXGayGdMWyAFhH2FaAZnenH9PG8RjvQEU0TbWI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5381.eurprd08.prod.outlook.com (2603:10a6:20b:105::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 18:28:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:28:16 +0000
Subject: Re: [PATCH 10/20] block: Avoid qobject_get_try_str()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201211171152.146877-1-armbru@redhat.com>
 <20201211171152.146877-11-armbru@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <61c9447f-c8dd-b617-9220-ca01b4f69493@virtuozzo.com>
Date: Fri, 11 Dec 2020 21:28:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201211171152.146877-11-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM3PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:207::25)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM3PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:207::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:28:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa8722a1-84a5-4a04-6a20-08d89e028732
X-MS-TrafficTypeDiagnostic: AM7PR08MB5381:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5381F678D4674A08CC848E67C1CA0@AM7PR08MB5381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +alj40IRNSXxn1N56o8NPANtdodaJedDZGlit08GMGacs9vvCFWJmED7Pnmc2xbVZZxF04bMqGbu5QMan0Sy+VgBa/SX2g3I0R4zyqlPBFvJ2xpzxKOdNFGWEtXyBJmEEtQ4XqNTm1YNeCVF6NSppi/gi5kOnqErJPMUtIzLCiGFqdpbPY+ErcIR7YLQmlD/0PLCNI1SNcDEZZ/TApuGH2H0/K+i1Vm1r3olwU9byiDpyXdX+Ylru8NwvB08UyUdPoZL658PtAri3231/9a3gDMkuXzCLLv17TI6s+8jU8lA6F17YApXcqxiJ2c52B9Bv4A+Yg8NZHPbb+aKMFKT1KYMfCcXMoJ2LHpNdNMAonNGGbI5ib4WCkiQSiOz0jvpdWFwvLTc5+Is/hiJnmfZyKL1kmbxh5E7zB7uQq7daXg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39840400004)(396003)(136003)(346002)(66556008)(956004)(52116002)(31696002)(4326008)(8676002)(36756003)(4744005)(8936002)(6486002)(26005)(2906002)(478600001)(5660300002)(66476007)(186003)(83380400001)(86362001)(16576012)(54906003)(66946007)(316002)(16526019)(2616005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aFE0c3dzWTBVZHFsTUJESGY5Sm9pdlNCWTRGQit5dTE5c2RBdlBJQUhXTEFr?=
 =?utf-8?B?WFBmY2RWN0NwTkpYY0V4V2hyQXA3YWIyVDlnSGdVSnB0eXRtZmFYSDVwTXNw?=
 =?utf-8?B?cGQreCtWekpGVHcxUXRkNmE4U0dwMnNSbE4zeldnVXY0M3Y5WDMxQ2tsYjFT?=
 =?utf-8?B?VkZQajVQWC9xbjVCTk8zZVBBUVQ3MlFxa1Y2UGxnSlMrS2V5NTlIbW9TREQx?=
 =?utf-8?B?NDVENjFma1ZOOVRrYlRyWFBHMjR1U1d1UkRwcnYrZkFhQ3dJYXhzand6UVIz?=
 =?utf-8?B?Z2tlN3JMeitXMG1uTUc2WXdXeGM1Y0QzYjNGV1I2S3VXK3JkeFJhbXVTOHJJ?=
 =?utf-8?B?ZEwxUlplWk8yWGNKeEUyWEhORlVEVTZiSTF3SS90eUp4eDc5bnB5RW1EM05S?=
 =?utf-8?B?clZodzFqd0Z2blJEQUVQTjJqaHFHNklCalVmK3dzeFZIK2huQXYxekFvQjgy?=
 =?utf-8?B?QXF3L2FLdVphM0ljSjZiT3RNYTlqaGFDUGxDL0FRRTc2M1BHM01JMEYxSUJI?=
 =?utf-8?B?VzR2cm5WYk9aZHFmcVQ3b3NOV0wzLzd4QUYwYkZCOVJoaXAyL1Y3SFZ0UnpR?=
 =?utf-8?B?a0s3RmNOS3l3eUR3cHZwcit4Ty8xZFA2aDVsYVVpYnR6clpCc3A3OG5HVVJK?=
 =?utf-8?B?N1lwRjY5QUhqSCt1ZnlHWGV4V3ZVR3Z4QVJLcEVxYkUzOEFIa0h5U3Rpclpu?=
 =?utf-8?B?UWFWQzJRUVlNM2tVWU5rM29KeUp6V0lndXc4aWt0V3Q0dU0xemR1OHhrdEFO?=
 =?utf-8?B?Z1pCZHdNeUpwYi9mc0hyQ1Uwc2lPeGxtN1plSGY4UFFqQmpvK2NNc2FWZm9R?=
 =?utf-8?B?SHVVa3NQWW1pUzdLbnlLTzcyNlV3OVQwdXQzc0FLZ1VzTE9kZWtib1FLQ1hx?=
 =?utf-8?B?d25QMDh1bzRLZnZZcWRGL0VFbllXUCs3Tk5XVFk0ak1OVXZjenlXTDcrMzUr?=
 =?utf-8?B?RFRiRS84N2NNeDlyclpoOEUvNDRFQVR2UlBxZzB2VGdUSzh1cW4vU1lsb05E?=
 =?utf-8?B?bExNQ1p0d3plMmQ2emhESWZDUGNCaWliaGFGTHAyczZ4NGsvbXNJdFZlWEdZ?=
 =?utf-8?B?MGFSQlZycHp0d2hCaTZoTytKRHNtbHI1SWZaTzcvNFFzMjhOVUdBNGJhZzdQ?=
 =?utf-8?B?NFNLc0ZJdGhrbzNCem0vb1VHZXdlZy9kRWFYdjNQUllxREtMVVhya2JLZytN?=
 =?utf-8?B?dU9uOGhWOHFvZjNQR05HT2J1MERTOHBmNzM2ZUZucW9XR2JlcEkwL2V3Snlh?=
 =?utf-8?B?VXUxdEJock1mY213L3IyZWxOT21hVThzanIvU2R1QmtvRkZwSkEvMGk3QlVt?=
 =?utf-8?Q?9yllrLj5/mNgHBMFQTli2IKRSvud+uLbHf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:28:16.7121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8722a1-84a5-4a04-6a20-08d89e028732
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NA9oRNagaTau7UZEXzTa62WJkR/tr7ebfKP0LPvOMu5whuHzYsE0wHk1Y4KZv2qJmvduPQe0ylg+0330bIA0t71/ZXWnCN5Kli6Ax2XhKuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5381
Received-SPF: pass client-ip=40.107.20.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, mdroth@linux.vnet.ibm.com,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

11.12.2020 20:11, Markus Armbruster wrote:
> I'm about to remove qobject_get_try_str().  Use qstring_get_str()
> instead.  Safe because the argument is known to be a QString here.
> 
> Cc: Kevin Wolf<kwolf@redhat.com>
> Cc: Max Reitz<mreitz@redhat.com>
> Cc:qemu-block@nongnu.org
> Signed-off-by: Markus Armbruster<armbru@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

