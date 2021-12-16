Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ADF476F22
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:49:44 +0100 (CET)
Received: from localhost ([::1]:51654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoKV-0003wi-U8
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:49:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoJC-0002PD-El; Thu, 16 Dec 2021 05:48:22 -0500
Received: from mail-eopbgr20137.outbound.protection.outlook.com
 ([40.107.2.137]:22094 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoIx-0003TH-FH; Thu, 16 Dec 2021 05:48:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZ2WbiWdqrHyi0ICeLgwZHxM6FzU23BoMYhg/al2R+4L5Cn13AEeAvPDin50OY2ztFPMdhCvpAcr64VWhZ1jt1Ng+qystLVOGDRUgt3nzCu0xWcfvmne4DQsiiPQhntGSS0wZRopy+hPzuitvh/mgte7XB0+1VkkzFvYf303B4qOp8XNduZxADIsja63pr/Zjd+j6vHs1sV3TYWdoK0RbP+qxoZY4pBSv9iw90O4+9UH8ibE6ypOzlLFyHTW/CafPsrCtjPVqxiwJzhCM3qdtGyUV2HwmdEH10LZ/FNy3hHL7q87e7oukRXUIE3kjgWxTD/DQBXgyemoPVtzD4/ohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4F83Kk+XgFgsOM6Q37Lb6BspsK1UHCkCFl4KfjV5KA=;
 b=etEwuK//iPfAk6Rw/H3e7EQ8VqxTq+7ntgpxtOGafC/oTSx3wJUuY70wc3oo78Vg/x7EoFFRbSp3+HrxS0DvkDKadC+UfEjnxtzWd9/oqLYEdbsXpnP2vdvdBtcBK5Ed6zpdDoWIYQ1FuPiDNAu2wULu6kbWhapLzKZl8vVCh8PLbUS7Y7yfOwZIVyJXgtM+UbomtInjJVj2dcLEXTl6JcCyUjb4uqF93bot1vj65ciAuFX4Tn75tGNlA66Nq93ejAcd0gEAC0+9kFL1LiIA5XEHOSCZ3V5f6YEsP9o9hNJzudsAYpgG6Wb6225cBjZRbzY9+F/2cs56V68NAulzzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4F83Kk+XgFgsOM6Q37Lb6BspsK1UHCkCFl4KfjV5KA=;
 b=MVtqnx8Ujxrl0sK3Uqfy7PziK5FzFFGy9mISqBfg+lX1+HKky9llpviePqUOVLfDWh9T+Fo/WJ7HNRPMCsLpLFS22CV2yPZk7TvSCQzMvr8FLwR1YzAjch1zUfL9YuWJjAbQZ5VAdwCgigIHG2XPtJ5jL7nkKgdbR2ptC6ILbzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB6403.eurprd08.prod.outlook.com (2603:10a6:20b:355::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 10:48:04 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 10:48:04 +0000
Message-ID: <ad738530-96d3-eb99-655d-625c24e81e3d@virtuozzo.com>
Date: Thu, 16 Dec 2021 13:48:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 10/25] python: move qmp utilities to python/qemu/utils
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
 <20211215193939.3768033-11-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-11-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0108.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::35) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AS9PR06CA0108.eurprd06.prod.outlook.com (2603:10a6:20b:465::35) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 10:48:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2eeebb3-5b41-4c03-2d9d-08d9c081896a
X-MS-TrafficTypeDiagnostic: AM8PR08MB6403:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB64037BFAC6DF839EF68A7134C1779@AM8PR08MB6403.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GEDhs7YMD11fAu9uQtNFun1j5OMjx9ROGYAUcbEJpUw5A9ZrJe90JZiu540dM2bsAGwy9czvecCQbry/QnCBeKEDpcWwiUC7IVlnyId/52CnSsvpR915oZVuASjVjKoS5Dfbn0UeYUOMHSrw0t8u/9oykfceFJzQPtOL70DhhbaU+GzA/C0cnqBWb21taR0g/ZdHydWhV+PAbkuqhwR3gyNJlPi9OGTCBXAlLGHq4TJyeOc1CZ/TqvznvgvhJXjZyR19/wmUEN9aYneGcWqfL5FvAodRC6cEAej8Vyy/PF+g7QmRBp274LNZu/zzgBAPw2KlLc0Pm1lLPF3cch6SdprIPxR6uQsKA4odn9LNeD/TmCiSj+iZ6tUKOF6CGVj9/Mk4NQo3qR3NVTcRoeoiqbRiYaeVEN4SU2TtWcFN9QJJD5ws8DYKh7QUNO9OHs7mWF+LD/gLI3yteVmhrGNrvdJ1MggGmtZc95OSSI9IrTkWY6elNFvuJJ8qGoKXxKdXBnR6BGF+KeKvc4praNoIk/DNc9USZVncgau5AxaPsz8ObKuXcpB6Et+5EK/fMpLRjYNHYukWOic4mIRqVq56GknC5FhMcv78m8q0UDUaBvKPJ+pzLufGgrJNS8+LhI7tfLzleuemKaEIZH3evnAHwdmFleev1tRldaORJnluFM6YVhMdnHqxr/LVmZDrJTQc+BdXuYZSGpchN/9GyxjeqWJuIa9jTud+i62N7J9qjjO79D0b8fgPh+GiiFRGHcZxvBm715+vll/26ctx/ZmcGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(31696002)(36756003)(7416002)(83380400001)(186003)(2616005)(5660300002)(2906002)(4744005)(8676002)(66946007)(8936002)(508600001)(66556008)(66476007)(16576012)(316002)(54906003)(26005)(52116002)(38350700002)(38100700002)(956004)(31686004)(4326008)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUZjZ095cmIxQnpGMzFTa2t5bDRHd1ZDMFo3RW95ZEN2MVc4aXdHZFFNNDNM?=
 =?utf-8?B?ZC9aMnV5MWR1ckVwQWNLY0RlSE16ZkMzMjJ4L29IajVXYnFmb29iNzdJQXFB?=
 =?utf-8?B?aWtEWW9lNURLdTlaWFdzZUx3UFgxdHNNWS9XbUdwbHJ6bnNQa1JaZXRLa2tG?=
 =?utf-8?B?MVZHV1RNSzVDK2pzVEluQmlYc3gzcXpVK0N2RnBPMGZ5dlRwQWd5VnFScUU4?=
 =?utf-8?B?MnNUQzArd21xYjc3SUlZREtrMFkwd2FlNUsxMXk1TWxGbCtRRFo1Zk9zVG5K?=
 =?utf-8?B?NTh2UE1IY3hvOFl0c1hJT1RyQWYrNXMvbWF2Qmk5L2w2bTFNREttWkxEUmF0?=
 =?utf-8?B?bUkyRjVhZUVLTFErNnJFSWFHUTZ1TGhEdDYra2lIelRvdE5jZnZCN1YrS3Nr?=
 =?utf-8?B?R2JWSlNNSDJlQ0tYcWoxTUxQSHJ2Uk9oVkhUYnFvZDczWWtnWHNQSVBIWmVS?=
 =?utf-8?B?VEpJdXFxSzdvbUhEclplVkIwQ21Ecy9oSGlhQjZrczVORHdkcnZzQXVjK0Yv?=
 =?utf-8?B?Q2dsekhDWjQzK2NDTUVvWG8xdVFwV1dhSy9xU1lySnlISXFoYTVMdDJDTHEy?=
 =?utf-8?B?a0IxQWE4V2pnVzEzMVVUem1NWlp6NGlLMnJRMCtIS1FBSHUrMVFHa0d1MnRZ?=
 =?utf-8?B?RDBFUjdodWlKUm9ySjNVNDVTeW84WSs2RmRZWlcvLzhXZkZKay9sTDBPRWdl?=
 =?utf-8?B?NVQycEJPYWlvcjgxVnd4RlFmNXNiNWhaaHJ1YkQzQmtPTExoMm0zbFkvNHNm?=
 =?utf-8?B?VDRQU0IwUGkyUEdMQkpKNG9QK1lZNHZMMEpQZG9VVHVlNkFqZ2llMUppdkxT?=
 =?utf-8?B?Y05JTXBwS0F2TTRKM0ZPdyt5aFVOT0p1cjRkeUttS3VDMkFYU3lZRnQrNVZy?=
 =?utf-8?B?R3d1OHdNa0VKOXIxeFVyVFVTYTBVd21WRG9aMmMxTSsxYjdkbVlwa0tsVURw?=
 =?utf-8?B?eVNKczhpZEZ6bGlXem9sQ2ZzMlh4MlEyZ1E1RFpqOXVySnNQeGRNeHZIam9h?=
 =?utf-8?B?SWVweVYxK3BnaHQ1WmtyMG5nNU9ZOWo5czRib0FrZGpUOU5sbHJ0cndiYS96?=
 =?utf-8?B?US9zRkNOeWZCemgzRml6ZGZJREkxZkJaRjcvZ25LY1RGc09CMlJoM3JEbXJm?=
 =?utf-8?B?enRuL3AyOVBkVUJ0dkJsd1BFZjlTN1J2bHdCUjNiaTV2WnFRWDl0c0ZMdzk0?=
 =?utf-8?B?VFZIcmJIL1IvUjVpaEVZZjhwSHJZbldBSS83TnpYV1RkTHJ2cDR4MEFMbTJX?=
 =?utf-8?B?ZU5Xb3hGZ2Q5L3Nibkh5ZTdobXN5Y3l4WkpFU3VYNG4veVBFallzVVRvOFpu?=
 =?utf-8?B?OFJxakwxQnVTYWVVeDZFbUpTbStMdDV4TDNxSmtBcE9xWWVHV3B2WlhlUzl0?=
 =?utf-8?B?ZTZHR1plVlU4WDhYTitrMVZpSkJFSVBHOEgvNzNyTGg1aGZEVHlkbGxFS3Fa?=
 =?utf-8?B?NytpMTY0a0lDYnVGRlRUSGpHeGEzUkFtdW1pQm9vWnJJckVaV0V2QnFxV1ZL?=
 =?utf-8?B?bkpVUEF4S0VkKzB0QTNRc1pnM1A4Qm5zMGNLYnJWM3REazFhY1RTWllPUzFk?=
 =?utf-8?B?TkxNaHVvTWJIaVJqTmJySUFoVnNCam12Z3JRZHNiUDd0RFpZdmphdEIzeVlS?=
 =?utf-8?B?by81eVUzN3pSMXlYb3lOQS9vaThmcTAxbzBsenozZHpCUS9maFlXRVBDNXR1?=
 =?utf-8?B?dlV2YUJKMlhiVzZ5VDlReTJiOVBJaE5MbkVvYVZGVUpzOXllODRIMlkxbEVJ?=
 =?utf-8?B?cGhNUWhRS3BMUGUwaGd0MVlSYnQxUmwwTWMyWnRxUzJrVHEwdHpUL3BtUFBT?=
 =?utf-8?B?REMxUGVSajlqSDB5dTlUR0gyTUtHWjRBTTh5S2ZTREJxempBNGxMaTlua0J5?=
 =?utf-8?B?b1NyOXZLQk5vdzhkNUVSUXlKT1F3V2lTd1VmU3FjZURsZ1B6aitpSGFNdmxU?=
 =?utf-8?B?bnpsQXFaVkhYUUZOUEc2RUxoRDcvZ0lxTkZFTjllQlY4bFk1aDZ5YUFaeTFQ?=
 =?utf-8?B?QXN6cjhVM1oyUW0zTFl3c2RtZlp3YUJwL1cxQ1hNRDNtVFQ5NG5rMHJKWGlH?=
 =?utf-8?B?SWdpVW5ZTXp6em9jOGpNTmVmREpackFsM211ODlUU1czZVhvNVR4SFdKbHFt?=
 =?utf-8?B?MlNibkNZSXZtU01IcWxGdmx1NElvWE9TSWlrc0Z2WUtzYkxDNkNVUmZpMXNI?=
 =?utf-8?B?WTJDbmlsMC9GM05lMVNFZkM4LzVoenQxdGxCWGF6ditQSGs3ZUZGVDFlNGk4?=
 =?utf-8?Q?vF8+4Pyi9+55QZo4EWWn0szZzPZHqSpkPNXKxHtCqI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2eeebb3-5b41-4c03-2d9d-08d9c081896a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:48:03.9930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/jkx41VbXMiY0T8x7D4f0V0+gGTpDgFwTezYhDk5N/bSRbJCUIdoud1hWjn9bn5xq9wv1871KxXVpe2mmEEXxeqLilUfOjv/pRnyyXwi60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6403
Received-SPF: pass client-ip=40.107.2.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.034,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
> In order to upload a QMP package to PyPI, I want to remove any scripts
> that I am not 100% confident I want to support upstream, beyond our
> castle walls.
> 
> Move most of our QMP utilities into the utils package so we can split
> them out from the PyPI upload.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

