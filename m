Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B563E477050
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 12:32:35 +0100 (CET)
Received: from localhost ([::1]:57894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxozy-0006PG-HC
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 06:32:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoyZ-0004fS-Bo; Thu, 16 Dec 2021 06:31:10 -0500
Received: from mail-eopbgr60093.outbound.protection.outlook.com
 ([40.107.6.93]:30272 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoyP-0005IK-7J; Thu, 16 Dec 2021 06:31:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzCC5SMXRVxfK5nkjJQW2OsJDgqu+TPu6uNyP7jJwQ0zem/QZXb2A8BpAyDRNZOIOMbZZ+5JAZ+Hpo9IcArAtFRYSnfQcsgFeHAFm10VYr2T7H3GVMBl5FSb5oNqTBOu0FINUOrsEGFyZb3lnVZpcqLNnBK9E+CMZAFzlY9hvjRtS1lHH6Q19i9M9M5FZjQkSYjllaYdxr+atk3FbKpoMoWUqpa8QJDio2HIZOJtD7U67UeJiBj2F9m/ByuuvczfTup+FUdYrkzujPuFMOF2BiMSlrPhdSDnMnoQb/JzVVMjwN1YJPkp5VpjJl+Rfp2Vys8rEkDCeeccwTQcLBsgng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OK+ku7dsVc5641TjAFLdrz3xVQfizmXuRf9jeNVUKc=;
 b=RIQlpkv2a4ZeZ5s4EjQVQco8pGWAXLmoY+kL/fTljjRxVO7aOhgoHYtBEE06ankWfsTtuezt7DjikDnj5ZXXWQCYom+B2o4ZuYgEuUUMluPOdwom5up8tXX4KWGF65tF/LTRqQ0Kkk+IoO1KcpOq3VYRQUVo/xdJSNHNsqrDS6VsUh7vnnQFWMygtJBlJy/ksVH8hWAFDtX01yW0GL9OUy3Pv6HpxfH+0VDNxu9JawSTMcZV5CTHY6JcHOhRL9X+eAWAz22jWIeqGT3eFw6N89U6pQFgVG3Q3YTIld5EGywD7idEb9EDPFQknJXI3xIJRv8HqYkl+7QE97Vjf315cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OK+ku7dsVc5641TjAFLdrz3xVQfizmXuRf9jeNVUKc=;
 b=qlfq2eJJ8VWX132G+/USTKuQT6xbKGNeiUMiic6p5RppWPYte2xuTsXO/pniEANRVrGR5Z/c0KuWzkmPcWRwTKN/KTfDIBQ+VuYjp9l0WHEBm14I4AAU2lAWLmu9llfbjcws2IdBQAc3dymDb8uGMDJZQfD1TvBN2Idir7+dXMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3090.eurprd08.prod.outlook.com (2603:10a6:208:56::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Thu, 16 Dec
 2021 11:30:52 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 11:30:52 +0000
Message-ID: <acf190e1-e1a2-77c2-87ba-6bf330fc0bb4@virtuozzo.com>
Date: Thu, 16 Dec 2021 14:30:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 23/25] python: remove the old QMP package
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
 <20211215193939.3768033-24-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-24-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 11:30:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f8526f1-4271-4d42-51fc-08d9c087842b
X-MS-TrafficTypeDiagnostic: AM0PR08MB3090:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB3090C3512C38E13B6F0D3750C1779@AM0PR08MB3090.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IyXXnHD+ipizEAdV9ZPhWdKWqNfoRhDNwspm+W4KC1ckAYrlL77+T54IeGfa5IpS6dCU3DT6olubX7JoLjhpsk2aJEuZaZR3zzMi3f9jirOQ3Rv8Wi3RqHDsohTKne4YLZZjFxjERbajTfA+adV6YHVTTBaw2JITXMP1LcdxAXQ85JtgGK+2Sv3OlOBjD3bfDzAWpP/yyxJUhgZnTse1vw24P/qahFYbbiasQOG0CwQv5RBBXqM3FQKIwbUoNANjhjIb6K5MeUwT52BhJ9shxO6/LppJMyEcH0tEX+6SEJLpTQB8b2Wn7z4g2VcbArhwx9P2lf8sxtsXMHHEjhzm/if/629awvPvJTasfmb5jFoA+rkIgT9ixFo2ZkEmywSHB+UB5Ryiutg7gns6hPF4CRtZeNPQJ7uO68zYudqXHhvQtlNPL/XZv39tRbvATrHfobWj2+YQdtmMDwXyQfFByGKBe8to6AjKtwdnBkLs4HUaWvXOhqbxRCYIdbTleLCe+pyGSD39grgZeTNBB30J4yo+hQws6xP5SMUnHbR3vDwolfxK/gqzmRqNkDhh48APhvFyg6dIg7KXHn8otQ8MCDEpHBJ4zxjZyVT2IHGEr8UcbjDgONeONbhEdtUR1ZB4Uq9IFBDkZv6H9SM7mo3lgfmw9NbG2FaU8ryJ2Dq9ow6qg3CwHWh0HR3D6HSR99ahR37MuOgkj8gIYmgmk5sxnhLAshrYZm7QiSp1QmXzAQO84lyVqgIFBVSpxK4bZ3SvBAdVnSs1o33/ZdCTRdjj1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(558084003)(66476007)(31696002)(54906003)(316002)(5660300002)(6486002)(36756003)(8676002)(8936002)(956004)(2616005)(38100700002)(508600001)(38350700002)(31686004)(7416002)(4326008)(26005)(86362001)(66946007)(2906002)(66556008)(52116002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU1XUzNGWG9VeUNHM1B3eFdvcjNhMHQ0NmRMYUxpdGRnSkd2cXJOWm5XL2xF?=
 =?utf-8?B?Q2gxL1QzOUw5SEhta0s0NTlUVnBnL2pHMUFxVlJzb3VvOCtkbUIwVWtXWkFQ?=
 =?utf-8?B?MFdwak14N3pKU2xMTkUyQmVYVGJzV21FNnQrc1B5ckp4a1ZyaExzazQzZGtF?=
 =?utf-8?B?NVVOOVN0WEs0eWU4RVBuVjBRQjlnektMV3gvbWdCa0Jvem9YdExlV1RTUm03?=
 =?utf-8?B?aUgrTFAzYkRRNS9yQXplTVdxNHpoT1NtYjRQWlEyZUlHREpjT3NZWmRBdVRF?=
 =?utf-8?B?ekxLc0pmTnBRSmk0VXFoK2ZYd1d2REpYK3RGNkNtOFA0aUVqWVNCeG1ZNzVu?=
 =?utf-8?B?bjEzS2k0UzNqdzhLMjdUR3g3cys2UFdDczlPMEZvUXpubzV6c013d0dWK3hH?=
 =?utf-8?B?bUtwWnlveHI4VWYvaW4vYzh2Q1BJbnYrRkxFdEJRWGpIR1orM015MHN1SDVS?=
 =?utf-8?B?aUxhS2t6SWUzd2pwNW01OXIyUk4vWldSK3NRbmRUSUVwL1NqcDRQYjRkbUNO?=
 =?utf-8?B?Tm10V0E1VEpWQjVMVFdzcHlNc3lDUXdvS01rQUoxZ3ljbGlGTktOQzIweXBB?=
 =?utf-8?B?NzBmbXlKRllDTHRLaHc5Q3R0OHA0WVdrdDdyeXQ5THZSNzBHM1VjNzVMc2lY?=
 =?utf-8?B?OXpCeitrT0d5a3VMSjJtbko1QW5hYUcvUytQSit3N1Y0ZERyRjNod0c0RVhO?=
 =?utf-8?B?d29rQ0hJMWVYVTBHMC8vNnNXYnlHWC8vU2grZXcyMjlkdkx0cno4b2I5Ymh2?=
 =?utf-8?B?NEFadVBkelArK3c2Vi9sQ1J3dnBkQ3RScGJZQmZGNGNIRGFrL2wvdnZQNkI5?=
 =?utf-8?B?ZjV5UG90NHdBRWxhejFGTkVxYndidGI1cEZJcTVCV0s3RzZYVjVNYi8vRC9I?=
 =?utf-8?B?UHo4TU1DWjZ1SEduaGkwSDdYWFI2UVl0WDY0dDVjRndlRmp2M2RZb2ZWV09Q?=
 =?utf-8?B?WmN5NStReGtTR21PTUlBWWlQRFlBbnYrdDF1MXhvUVpaNm5BdzhRY1FPMFR0?=
 =?utf-8?B?akpIWWo0V0ZWWlp4TGJJR2t3emlxSDl5WWNEMGdVVVZ3WWlvbFkwZzlhZjFx?=
 =?utf-8?B?VHIyZDdxT3F1MGpSbTN5UEVXTHdPbWxjUmMxUCtoT3hXSDErTThkZmdMWWFH?=
 =?utf-8?B?ZVRFSkJLbHZhb2xCZ1pqL0orM0hXUHJZZU9QQ3pTV3ZGVmpHWFNNK29FaTFu?=
 =?utf-8?B?MENYeStHankzV1E1UTNFUnVvYmpPU1lheXZqMnZaMExGejdLUmJucVQyOHJM?=
 =?utf-8?B?MGpEWmJUbFZUK3ZMRnZoYUZxM3hScGFNWkVsekg5Wmk1RXBhdFlmMWxFY3NP?=
 =?utf-8?B?b0ozck50RHlzeVBlU3VyVjFmTXFDYXJzdGpuS2J4aHpqVVFzQ2ROc0lxcElH?=
 =?utf-8?B?ZXVTbGk3cllCUC9EWlhZNDM2T3FYaEdMbEwvRHU0Y0RuZkhJOWRROGxzWmNs?=
 =?utf-8?B?NmV0OUpUVkJGZThYY1NPWEk2NHM5aUtLRGtUcDlDcDJrQ3pobjlxWGVoTzdi?=
 =?utf-8?B?N1VQbTdwTTJ6RFBzcytzVStsUkdGQTNwREE0K0VKZDJ0WWpXN1NVUEFsbW1q?=
 =?utf-8?B?UFppT1lNbllPUGdZUU1INFNRcUlXaHRIUnJzbkdkUHBJSURhbm5rdUszUDdj?=
 =?utf-8?B?K0lKZkZtdU9NSjJtbzJjTzJNbjNyWDNZczVvSC9aNW54bzAvOHdPc1VrVTBP?=
 =?utf-8?B?ajFibnpzajB3L3d2T3c3MHE2NWdiVTYzbzE0S0QyKzBRTmxReEFoOVViOGF5?=
 =?utf-8?B?bjd0OWdQejRpazd6b1Z5bnN5NDJrV2ZLQTEzcWJWWjNEaWVBWjJKZFR0aUZF?=
 =?utf-8?B?T1ZtekZXYjcvbUVONVdEbTJVeG8yai81KzkxSkExbUttYmw3SmtoWENCMzBj?=
 =?utf-8?B?UzhwQTJ0K2dSa3lmcW02dlprOFdsNFZ0eDB6NTJ5TnBOcVBCOTJROVl3TTFu?=
 =?utf-8?B?b2V6c3dWQTRXVXk2NzhNMmdxbzg3cmlPL0NWb0F3aFd0S1ZJcnF2WWNBcWNW?=
 =?utf-8?B?MjNDM3BsdEdaMTk3bFVyeDh2TXp5NzFqUFk4bU5sSklrbjJqQnRJaFJvc2lo?=
 =?utf-8?B?OUQ2T01xR0ZEbzlSNXN5cGxzQnlONlVjMXp6N3czYitTZGZhRUEybzVmUTl5?=
 =?utf-8?B?cHdzQmQxUWNTODErU3psSkZTRUFDSWZ1ZXgvaU05dHI3NkRlRHlQMm1rbTZu?=
 =?utf-8?B?R0pTejJWdjA2UTFYVHJCRTFJU2RkWTB0ZjIxU1FUbFlVK1liWVQrd2hkYjJ5?=
 =?utf-8?Q?SkBYIXum1h66VXHL5Sb5KqJFWIYuo/MdSS6+eVFCYA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8526f1-4271-4d42-51fc-08d9c087842b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 11:30:52.2077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvNJX13ePk4uzcoYseZ2azZLm6fjry+LGt8uFR+wkMvU3gdsi6ZrfhTeKZenqOQ91m+UPv1k3AYxtAPeqwqDJakO5sGb2o3ycv8OchQJa1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3090
Received-SPF: pass client-ip=40.107.6.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
> Thank you for your service!
> 
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

