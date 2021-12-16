Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7313476F4D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:58:58 +0100 (CET)
Received: from localhost ([::1]:40296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoTR-0007LU-Qq
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:58:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoQu-0005iF-R2; Thu, 16 Dec 2021 05:56:20 -0500
Received: from mail-eopbgr150139.outbound.protection.outlook.com
 ([40.107.15.139]:6567 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoQt-0004h0-91; Thu, 16 Dec 2021 05:56:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXsuIhboMJTPwEm1Gy8t9eaq+5+JsE+wOGlmo7NULhFKryky8M+7y99fxtH6SrY2EhZ7hv5hZWOMZpdyCNwqlo+ud5xMmhzAiJqobxGyaR19apiH40jW6CyzVWIzVHmm3XW9t8wVmUVZSJnn0uMPwrtXqz9VihvTXX8S6f3LZQqbU/EDQoGopj3/Idf6JOdQ/vPwm52PNsNrHzQvoxbleZyfoqa06ciTg/90PoBvq8vrdoZI4WDKCTMRw4d0UXc+fphL5FNspCDVVLp7V8DXoIaYOS34RGLrJkFgsSTdtUu6jcCNF9oXoRoeW5Iz1kTrwkzv42CajxKITTPFQ30cxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMmSi7iMDzGWk7xiw0BA9f4xBXVSyMGAASt6NyPhnIU=;
 b=VGoZ4QxT9Oi5bO/wH6cwjFSfT+TGsfECcM6x8F9gm2jTeXz7T4EfLhp5INGa7GUVho2CN8STl5ZNDuU1oRLn2VdlVSktxbdjEkwdFnNa0kWwkX+EV9rdnw7adfjPDrT4ATd48dcwBT3DXSmkED3i5IQz/CqAE365varli1G+nkdfVraj5zLEy4kIqOq2CgGB1n5q3Wmt8ywVIlFZ0lLEPaPXKDDjytsgH3Zo+qY0Is99kY40PmkeGwsofN7u3ZbZvoSPbhX/n6J6/UI/BVpPEs5jWI8Igh/5rg9sGK7Xkxz/5XaflcMAAWHV3FcpKfTeFVip2bCwNt56V/U1vHCHLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMmSi7iMDzGWk7xiw0BA9f4xBXVSyMGAASt6NyPhnIU=;
 b=OfCBMdbbAVl5Ef1l9XDei8RC18fWQXjzUneqHlUP2bxB3UWp5ekQP7avdGGrTjF9csGjxQhPaw55lPlFQjm1qz0L/3rELvhM+3Rp45po5HudCCxEA/wHjgX5qU8/bk+Jc+TWDbV6LqCaYLKuCs8M+wCHNFcfrL8++blYM0uOdWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB5300.eurprd08.prod.outlook.com (2603:10a6:208:18e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 10:56:17 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 10:56:17 +0000
Message-ID: <0ecf8f28-b1b9-980c-4c00-989c08c53673@virtuozzo.com>
Date: Thu, 16 Dec 2021 13:56:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 14/25] scripts/cpu-x86-uarch-abi: switch to AQMP
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
 <20211215193939.3768033-15-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-15-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::12) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR0P281CA0066.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 10:56:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce8ad406-7ce7-4a19-a3cc-08d9c082af3e
X-MS-TrafficTypeDiagnostic: AM0PR08MB5300:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB5300A63360CFED997A27D20FC1779@AM0PR08MB5300.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Wqr9Fj4ers3xFrJbDaPMnCGRtjewwY7U7Z886VsA+M4v7oqVOi9OduOki5a007Lf8DvRjyBOrgkdesmOqBugAXqaZYincW0lfpECewQbKzZ/o1SCWRorR+O33hFKe+1BF9ty6JXBsI4maXlDkMWox+fq+z85wFO9Mbefk2vNGv5kj2rRs0oo1xsTwM+4l9yP+DThYP7UrBahQGrPLUl1yTXQzlZlVKhmd8Y+E2innYzzdXTO33riaVvx//ZaOu0TZWaJbpVekVeCy7evx78ZKWpzRt/0lya5ODmq1IPvgm8IG1s8gv8um+fammDSnP8HdZosUh3Qv8TMAcPaXN1Q7U5J935udjSg3U9lvGUU3wPh8o41AxRiVDstTPLidemn1QqHwtAxzf7nYiSYDEiJRHZyFiAp2Khbofl5ot7rQKa2DWEAitKnwvDQkCoBuXDaqAV/ZUkE4ThX8NcofhJlQ4ff8tTCBgbq0IIOk64gd9Hf4Tnu7eINTSGpauzYSYjj2p085ATuuhFKXBuVagH85dPsTo21AFZiv1eO4sEmHwwQEBu6DPZ7leyNSwsQXCjGHJSiWwWS9JMkcxVdpsjBGvGlz376jZQPj/DXxrV9InDmSTYWayFcqFF1uanovRMPlD8T6px7kKpnT9fRFiW8QOduG3Pn8hgfHA+BVr/LHyocHOhG/nIJ7DpbZBXBxfPYuUn72SFIShzU2If+CHGxRUVNpd3ivNcW8D5sLRUn9/7nprVVh42WJ4cpuqtDh6UsRI9asnZkU1Y6kMAdttBng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(508600001)(66946007)(36756003)(6486002)(5660300002)(2906002)(8936002)(66476007)(31696002)(31686004)(2616005)(16576012)(956004)(86362001)(26005)(4326008)(38350700002)(38100700002)(54906003)(52116002)(66556008)(558084003)(7416002)(186003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXZrSmFqZzc1d0NGWFRsWnZ0UzR3RG8xaHhJZ0lQVXVSSUc2dEQzd20xU05M?=
 =?utf-8?B?RXJOcndGNDdJNnFUODk1Y295Q204RkFWWHdyUjZsaWNZaG1takNMdjdZQ1kx?=
 =?utf-8?B?OUY5UTdGc2s0U0JMMTFGTkJtbm1zT0JXVUJMbkF4dUcvS1E5cGJyMXo5TGNU?=
 =?utf-8?B?aGNsWEhYRVdDY1VuakR5YzdTS0p1TWVBaUxEQy9jN1BnSzMvdlBJSk9ablJN?=
 =?utf-8?B?SW5GL0s4aWRRTi9aZUh2K21XVDR2Z0craUNwaFlHYXYxelNocERJbXB5ZE4x?=
 =?utf-8?B?Z1FlK014TkhyOW9LczFsczljL0hEVWUwSlNIMWllSHZCV1ZjWUtZaG5JdnBC?=
 =?utf-8?B?a0tNQlJ6TTc0M29QbnlvZ0F0NzRTeHBNWVd5RzhhOGw5cU94ZDJKOFZIN3J3?=
 =?utf-8?B?MDA5NisyOTNreGJDWkl4bWNoaEtFbXM1emlxSXlDdHJoaExwWm1vNUhpNkFo?=
 =?utf-8?B?Z2VZd3RCN0lEcHJwN1dETVBQWTh1N2diR3diN3A5S0xFdUQ5WkFSZ1RiY2VH?=
 =?utf-8?B?UTdBSXplWHlHU0lWTEFRaUt0VzQ0cU9vV0tWclJDWjZOdmJiQlgyOHY2TU45?=
 =?utf-8?B?d2JvUFNObUQvZUNIWHI1M0hVM05GRGNMc0taa3dSVlJ2a3lQUE5DKytZM0Ey?=
 =?utf-8?B?ZDJWbVAyc3piUnM5cUNLNjdPMEJQUUFKeGRLUHJ4NXRaR2Q0eWNjTnJEMkRD?=
 =?utf-8?B?OUVBRnltckVjbDJqK1dQS2hYWno1ZWdNOHJ2TTA0czNWWllWanBwN09rTkVZ?=
 =?utf-8?B?UVdvUDB4Qmk3eVJaYkorTFZ6Mm9pYWt1Vk81eDJrbzlFQ1hEUkVpdjFtaVAy?=
 =?utf-8?B?TXFXWEZkaVJLRTg1VjUrWW50ZGJKa3hSQm1BaXZ5RDRneVk5eWpBckhoWW9k?=
 =?utf-8?B?Q0FQbk1rc2JrN05mS052cWNiZVpOeWJNTjE2blZjWlRpWS9lQTRVbFZnc09p?=
 =?utf-8?B?QzhEMWRUeTBKQlhiemdTdVRrQ1luUXQrTmN4cENwQzRXNUVXaXp3T3N4K1M5?=
 =?utf-8?B?N0lhczIrVWp4NWw0YmVWaDQ2TEdPWkwyUG9XSFc0cW8wTmJEZDFHVkY4WUhx?=
 =?utf-8?B?WStqcWwydHNuakpZcVNoQVNmMWxHY3ZTdll3WjN3RVFvWTd3ZE9SVWJiemZX?=
 =?utf-8?B?SEVSYnZzblc1SE1JejNpbWZpdTJCa1c5MGpQQ21DS3oxbHRnbHdFclpFRU5N?=
 =?utf-8?B?L3dUSTZXWXRiTXhMRzVFK29VSmYyTmhwdCtJemJuRFU3NHVFYzUxcDI5aERO?=
 =?utf-8?B?bjZRbVh4UHNxcnBRbGtVS2NNNmdzdUNPSHVWOXNEYUl5Kzg0MG0yK1BQY1ZK?=
 =?utf-8?B?aTJuQ1FJNEhZeFZvV3JLSjZBa0FweVpLOHRMZ2xheVlkSGVIdlFYNzdsQlVz?=
 =?utf-8?B?dHNYbFpRR09TZzgva0lzV3h4TDF0U094YjZQeGN1UG9CeWw5MzJGQkxlek1K?=
 =?utf-8?B?dFZWdmxEcHdIVzJ0SkNwNjk3SjBIWXFheFlxQUczOWN3dDNESmZyMFN5MEZu?=
 =?utf-8?B?SkpUeldPNFc2ZDU0Y05yL04zUHBaeGVvc3F6ZXdqVUtyM3kxeHR4SFY1eHov?=
 =?utf-8?B?cU5qL2Q3cjZGTmo5RHZieWV3VTRnL3FadnZ2WlkveWlJYms4bmtncEhWMDRR?=
 =?utf-8?B?ZGNoZldZZmRVN2lZRjhIUGZsbTU4MVdMU0g1NkhCb2dSYVU0MkhpSllDWUFX?=
 =?utf-8?B?RlRjNXFBaStIRERlK1VhZlFsTDZaUUlzQmNzK3Zxalh2MVRXZWZXNTA0NHc5?=
 =?utf-8?B?K2hOd0dLQTg0UGZ5d3FGMjI4V0xIYmVQdUZTdnBKdzVkRFF3YUdtQVcyd1pN?=
 =?utf-8?B?VzVQOE9hVy9RWDlYQnUvRDZnRjM2bXlVcE1mUGgyUThpVUdiQjlCMGd6NnJx?=
 =?utf-8?B?RXZ2Y2tWanI0VjZITFVNdzllK0ZHSEtFMUZLSU1XYkVROHhQSS9WODJnaG03?=
 =?utf-8?B?dDdSWU4xaWZhZ1N1L2dIajNEYWxOMm9XblJSVERDK3VQVlRLTkw4WDdsMW1a?=
 =?utf-8?B?Qm1lN0xmMEozWjlRalNuVzFuZkVCS0F0OGRWYzZRR3JyL0RzOXpWWm1jZlpk?=
 =?utf-8?B?WHYwTWhnMVdCM01uajZXVTBQM0Fxb2hMNGFSVU1HVDdkaWdleU95OEZwK01n?=
 =?utf-8?B?dGNsNUQ5SkVTaGo2OHFBVGwvK2w5Yyt1Wkl4S2F6RGJNVkFVYjFsL1YzUmdI?=
 =?utf-8?B?cE9BTzRXdHo2WFAxcHJlamtrMzY4czg0d1V0WDlpeVpFRnJxTkFGMzdicEpk?=
 =?utf-8?Q?S56aPFb7uFOJdectVaThRLXBfsNhF71qyVEdCMKAfI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8ad406-7ce7-4a19-a3cc-08d9c082af3e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:56:17.0146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAi/z4UlZRsh6SeSqFamNRPFv1cmkEf3wl6bsWgf8fZ30D0jkUp/39UuWDTHClW3EDHzLprGfBBZD6nSjvU2Mm/y849f9HsB8Azv7nwLfG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5300
Received-SPF: pass client-ip=40.107.15.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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
> Signed-off-by: John Snow<jsnow@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

