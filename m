Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD1B4A9706
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 10:42:43 +0100 (CET)
Received: from localhost ([::1]:50906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFv74-0003ob-BX
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 04:42:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFujK-0007fD-UT; Fri, 04 Feb 2022 04:18:17 -0500
Received: from [2a01:111:f400:fe0e::70c] (port=31458
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFujE-0007vG-LW; Fri, 04 Feb 2022 04:18:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tcruzf+odh6QwplJaCC9+DciuGuNcPRKhsGQzhkU4s+7/ORtY+peHOT5M8G+gOhYpZPT0aBgVrn9bfHlK/b9JEBrZHSxPEyNx1JO23mIWMw1KB0A4P2jRAJXUZt97NkpufQ83ulYcXP7E5784vFkhCna+tZsYXnZ6FkgFZaPz3Z3KQ0mij548mc8mXiV3ttK4FpiW9tKtbk1azeconUHOU/MLgKG8+kPJRtFD6CaMblmTUuhVN+M5KMPsv+qRTY1pqOHAYe+k9H+eajoSilvl7kukkp1VPNpsyJf11kNHeZUyuay1kbzgu+74XWNowirfOy8UBJO7ne5RyKaNBCDgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6YyWow+CYtdEL40xD28LIdMoxWBBF8KVyzBnSwZex0=;
 b=DKv45CYw755x87lwhIZPuYrMSnrBjyFs6xUYPJ7+L8ybH426EnxukPAf2EhqcwFoBd/AAy3B84tr5ukWe2jVn/3pvc61Dej4vtfO5Mp5bPhuA/7IHC/DI1KFmlv3OFFRFf8FmZzZQoHcx51sOyEfC+HAAUNoyi7aikkpgs+7pMmTiLo+H0yIH4T6by4QO3+oyvJX+0jjywAwR30GrfnnS16nEE4q1ug/Po6T3MSLy7d7+AzXAAeWG5IURQk/wTGiC5Ia9Ad6LWkSc8CsRvSt1k1hr75qUKsfaAjX4drbGvQR9EuEtrAet3AhO6wZ8bj5ZxCak5o9xFPm8LTvMZeRkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6YyWow+CYtdEL40xD28LIdMoxWBBF8KVyzBnSwZex0=;
 b=bbMBuqRrAkZBMZ1ClyOEjhfPHm28zX4dEZ0Yd+AMCqsr2InMebZ4duRTo7l79TzDjA3QKxiYkOLkaJLJ+QOp0kti2BsUV5udBWFo0BB4PIIcJeTuNNaOFBq0ITcimSLHeQ9yTJoWxMpyVIl28uqpALs3py7w7Rk4t/S/We4pho4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB4025.eurprd08.prod.outlook.com (2603:10a6:10:a9::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 09:18:00 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Fri, 4 Feb 2022
 09:18:00 +0000
Message-ID: <f91ad83f-75ca-6276-109f-1b2d2c2f16b2@virtuozzo.com>
Date: Fri, 4 Feb 2022 12:17:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/7] iotests/281: Test lingering timers
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220203163024.38913-1-hreitz@redhat.com>
 <20220203163024.38913-6-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220203163024.38913-6-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d756930-f5bd-4d28-ff2f-08d9e7bf3d56
X-MS-TrafficTypeDiagnostic: DB8PR08MB4025:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB40255325A71BAFE0FA5D431CC1299@DB8PR08MB4025.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eMrpdhY9qqbhhXZcLwIRucRrAolaHtBsOVB9/bsZwabV+zrq8PpUlK4IzRnySSyw0EhViyHDeaDjDFXQ57S+eyJwaNvnB34uKLtH6mE+9610dBgQjGTjBMpx9yItR+VoBV7gPCHBo3ISDbIw9CtIUajqaOeKWZGePCVegxNQRP5xNiY1yJyh9JYiI69g/EOUYRcCqoT1wq8yfGCkLQ5uqD42jkitG7qTE1ozWlvpioEaCDwWcVlrzb9NOznvp/SSGmlBpq44/ENcuqx+OAGfaANcMqA3WUK24ZwiBMD6PPob+C3ozqNnuFHZpQwrZyjtcxNUhVnvr+aZFbQP7CkPW8WirbPAfXbOupBSxKJ4bLjfc9y1nwwDp1Mm3PKLc7hk92lMXaqMspqXrPPVtyfECli4IPb4epn7t7O3j4M3pW7QT98DXUnFTkr1F2pTyNdsn2jxD0EGSI3VgXV0t2a+gtyI4iKT3umAzmOtKwx0OP0I6Iq9VXznbuXIV4nlFdULbQbDTouCjO0ftofLptCpu9EjqZlyxqyQKsjU7RgjsQaaYCe0WrVND1WMw4XD6/IoHuyfznzq7F4janwan2RqFLb8E6saIeXq6qi5IqMFE0xgM1TnQEMnbhfkvEjrXvWIa75gJl+8OhHD1QtwqSyqE+bqP4Wc3VYNOJk+/s2P9ucCfWkXuk+BCxZjSepYJH8Z3ED06pihPLa0W4mwrgb4fvp0b+qEJVbnmKhPpeVRai8DxOGZdutHDaEFMaxhp5FYmSfYyJ01PYgfU0aB6v+lBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(2906002)(2616005)(54906003)(36756003)(508600001)(31686004)(6486002)(31696002)(8936002)(4326008)(6506007)(52116002)(66476007)(66556008)(38100700002)(6512007)(86362001)(5660300002)(83380400001)(38350700002)(316002)(8676002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2R0d0k3UXBvSmcwVzBiTHhEd0JmOGt5L0Z3cHllcFpCWGxtcEZlZDJHcVEv?=
 =?utf-8?B?T2lnb2ZQd1ppQ2VKT3JWUXFMZno1UzRDWHI3WGhJU1c4MEJQczVtRDBhK2VF?=
 =?utf-8?B?bTVneUgzYVJKUTdDRDlTWWxUQTlpNUFXcDBhR2d2VS9yRlAvVldDZmVROTRM?=
 =?utf-8?B?N2V5cCtKM25nWldveXhuakI0dUs1SStMZHpsRWFiMVRGckRIUXhFd2hVWkYr?=
 =?utf-8?B?WUdIa3JkRDZZZ2VIS3U4WTRLd1RoRDZzSWNyQ1dVdC94dkxoaXo3aG1MZVNH?=
 =?utf-8?B?OTFrTHpUVGdmblVEYzcwL29peDNyWHQ4U1V4Y2xuTU1Wcm92WERvS1ZQQmV3?=
 =?utf-8?B?U3JQaDFySUpoWHNrSGlNd1liRVZ6cWovR1BWY0FMZ3FveS9yd3Q3eW52R3Yw?=
 =?utf-8?B?R0huTGs3ZzZCTEQyekFwMWtnWkFuRFdqRGY3MTJ1SzFwZTNWVlBZdDZrbjdz?=
 =?utf-8?B?TGhoeW04TXJVcisvajd4KzJidDNxMDZSNnFEb1BMSDk1ZlQrbHVNWFovMDdW?=
 =?utf-8?B?K1lHakFBTFBpZmcxZ1locWU3SUQyZU5xYzlrU1haQWRyYXpTN09FVW9yUldV?=
 =?utf-8?B?U0JqRGg1RVVQbExpZHVWZ01IQWtnZHBla3dCUEdwd0NsODIzeEo5dUlHemVR?=
 =?utf-8?B?ZXVLMXo3dUh3aXByeXJmVERFVE0rSk9iSjZPdWFNM3hvMjd5MVpveU5KTGZR?=
 =?utf-8?B?cG8vTFNaVGw0dVBFZHdpY0tNUmlWVWE1dWUwN0V1SXluQU9QcWtoUUEraU1W?=
 =?utf-8?B?M0tReG9CaTBmVDB5clFiamFESFFSVCsyS3EyVkRlMWtNdHN4aHJNR2JoSDNy?=
 =?utf-8?B?TjFRZXpNV1lsRXhWdjNpSGhQcU9FL25NSThFU1c5ZmZZWWg5MGVleGtKTE1i?=
 =?utf-8?B?K2pEWnVibDZ4SGNGb01RWXVmUHpHTXBXWWhSNk1FRGNuS05mbURaRFBabElM?=
 =?utf-8?B?TDJ6NU1lTXBUYnNwVXRCTGQ1eDRmVmFScEZMTGxZdkE5Mm90YTFwMFdFbC80?=
 =?utf-8?B?c3NyNUFJNS9lb2tNWmkwVFNqSGtzaE1KbzJYUGRLK0VhVERqSlQ3WkMzUnFW?=
 =?utf-8?B?WkwyWXBKUHpBWnVpUzA1bzIyYWZUQ2ZVZVkxaGhNQ0hmK0ZnMER0SVU3Z0tS?=
 =?utf-8?B?V1FFMVRKTzZqVTRyWUxub1QvZjlaRDlhQ1JDdjJoUU9Qb1Z4Q1EvTGRSQ3NY?=
 =?utf-8?B?QmFNRENpNVNxTFpseTBDbGVKMXphVndybG1GNnhsVzNVVEtFZEhkMDR6MGxT?=
 =?utf-8?B?bm91a3ZWWjVRb3h2K1VOOFd4ck5SeUVYYmtXb1pvNnZpUTE1T0pkS0pqNDlS?=
 =?utf-8?B?TXZVSmIvT2w5dlVhQ3hkaEQ4NmdaclFYem11b29KcHNNZjE5Q041OWVObjVR?=
 =?utf-8?B?WHlsSDM3SkJ1WE96RVFQcnVOWkc5N091R25uZmFDalNicUZQYnNSRm9keUF6?=
 =?utf-8?B?WFd2MGh5UzFjT3FWSUhkVWhLN0RKL1FuOHovdk1oVTRmTUFHaFZYNlpiVTRy?=
 =?utf-8?B?dFRkbDFJc0pPUkJuNE5NZ2JVZG14YXdLSEhJYTdmTDdvVDdnQnNsRTJvclp3?=
 =?utf-8?B?ZFJQcUdFY3g5SCthSnFZQnNUT0FhN3Z3c0daQVhSOVFuVm9qMGJtM1lzQ1pv?=
 =?utf-8?B?VTZJd1FUa3dNMWU0dVQ4VWUyOFJ0d3lVcWRINjRLaTducWQzemJGWCtPa3lG?=
 =?utf-8?B?SWlrMjVVKzJieFBwSVFablJXTDgwenQ4RVg5WnFLRDdnWTY3aWhnTXpkdFVC?=
 =?utf-8?B?YkdWYlZQcCtjZmQ3aVhlMEpocW9Kc1J2dSs0b2JEVUFUbHVqVGdncjZmYkZn?=
 =?utf-8?B?Sitsa0RheHlsNkhjRHN0a1BOOEZ1VkMvWG1NWkV0U2l2bWx6UG9CRWtCZTZs?=
 =?utf-8?B?WWFXNXVONnc4MnI1TXYzS2MwdkNYMjFGT2JJSVJpYmJ6T29iZ20wNkpMYktz?=
 =?utf-8?B?THcvM2Q1clNNMFU0MmtkeHJROU5ZRFlMKzBwSSt6SWxjeW9RYzRTd00vbUFy?=
 =?utf-8?B?eUpIaUJLamNKWmE4cUJ0N3prblZweFk0YWFnOEZzUWtKVzVCUEx0bEdKR2NG?=
 =?utf-8?B?VXRjV05RaEtoODdQVGFqeEwwZGNOOVBXZjFTT08vZ2lsQzJFOEJWZ2E1R0Ju?=
 =?utf-8?B?WGgrQXJacVFwV0VWM1M3NnFsT0pTZXhtUytNcVAzS2JNeWJsa2cvekxMdWdN?=
 =?utf-8?B?bUFjbFdxd2tTcm83OU5GVDhRTWRHN2lCN1hSUjZ5emhQUzZrdDNHOWpIMVVu?=
 =?utf-8?B?TnpOZzI3N1JCY25QZ2hadjNmZTBBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d756930-f5bd-4d28-ff2f-08d9e7bf3d56
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 09:18:00.5079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXragRZK/c3oxB/XnA9KV4W5vS2PjhOo3WZdw/dk3RwwPtYJ+vKOwm5Wd6/xZfFVk6YBv3JfOUV53cTrCCFaJH7fCCksoiXBD5EBc1DIX2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4025
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::70c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::70c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

03.02.2022 19:30, Hanna Reitz wrote:
> Prior to "block/nbd: Delete reconnect delay timer when done" and
> "block/nbd: Delete open timer when done", both of those timers would
> remain scheduled even after successfully (re-)connecting to the server,
> and they would not even be deleted when the BDS is deleted.
> 
> This test constructs exactly this situation:
> (1) Configure an @open-timeout, so the open timer is armed, and
> (2) Configure a @reconnect-delay and trigger a reconnect situation
>      (which succeeds immediately), so the reconnect delay timer is armed.
> Then we immediately delete the BDS, and sleep for longer than the
> @open-timeout and @reconnect-delay.  Prior to said patches, this caused
> one (or both) of the timer CBs to access already-freed data.
> 
> Accessing freed data may or may not crash, so this test can produce
> false successes, but I do not know how to show the problem in a better
> or more reliable way.  If you run this test on "block/nbd: Assert there
> are no timers when closed" and without the fix patches mentioned above,
> you should reliably see an assertion failure.
> (But all other tests that use the reconnect delay timer (264 and 277)
> will fail in that configuration, too; as will nbd-reconnect-on-open,
> which uses the open timer.)
> 
> Remove this test from the quick group because of the two second sleep
> this patch introduces.
> 
> (I decided to put this test case into 281, because the main bug this
> series addresses is in the interaction of the NBD block driver and I/O
> threads, which is precisely the scope of 281.  The test case for that
> other bug will also be put into the test class added here.
> 
> Also, excuse the test class's name, I couldn't come up with anything
> better.  The "yield" part will make sense two patches from now.)
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

