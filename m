Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B52C4D3217
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 16:47:12 +0100 (CET)
Received: from localhost ([::1]:57402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRyWs-0001kW-U9
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 10:47:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nRyTY-0000Fw-7R; Wed, 09 Mar 2022 10:43:44 -0500
Received: from [2a01:111:f400:7e1b::711] (port=46816
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nRyTV-0002jC-3V; Wed, 09 Mar 2022 10:43:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YekBE885VLLr+Tdx8vbP3/yMopP4y1Ve2LH2uoaXO899NM0rXQEWctZNPNQ/rxRdlkbG4mj15PsVrpGw7xdWItzNnI95QiLECQj7fmJd26W1JFJJ2Jwt6Xhtps7tOkg469q9NIYeq/0lwNs/ngJltFmR6LavOtWI06TD7gKRZhwuiRvfrUzrDjIc0SY1Lks647dffo1+yD30yBMbJFY3Iqsq5IJNdL+wqBSbd+2sZcU+eq3e3oljN+vxTnw5vm6oRzHxg6YfKYOme/yHi2NneFN0xrSuIf0jTQO/pCVkjsXm2NirQUSP5u6Taa7tV4w8g+PRI+dBpdxtHKkQcMwsxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4o3zfow9VmusxkTrSqlp4NFSECH8p0uXhwq69oerHUc=;
 b=YNiJkXRmKTVCTNf5xwyIbaZgu+NxtMxhFmcyqY2BjvhxpTHehaaWOaOXoPDUSooiaBS9uLoLzQahvmysQWMXJQJqaSvFmuLx3reHVfRzZdXYmHLkZuJoviiHfIVHYhmxAE15VfezoMMyFVwyrl7IQ/PYxnZnXlaenAJ9hnWlf5Z2BrTKdjLwJBMahbjPNGhPxs3RysDTTbiqPLJezwvz/ro9Eo9RLZ1x8uVfYhGAAFRExe1woubm0oNAePpXnsCeHUhgWCl0PFkOab9jG6VRBd/m3XO4SCM69Jlo2MDox7phSR3xfiiYGl9jlrpFaCa/7993NbUMKEgSj+qusz77Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4o3zfow9VmusxkTrSqlp4NFSECH8p0uXhwq69oerHUc=;
 b=gwAjW0T0emNVreMOBnYKzhbbYRjlKGXbp1a2sO7UJFIg8d/WpwI/4/8EsETlrT9r/k2+77LuXeL6sii+s88qs7JT1ViNfdt8EB2Eb8iRyCo4yRsXQScR2k8gL20Mk7JLa0c/DJIYLVzolPUneCK4lLvIfzAKxaf8hf62b6hIahA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2621.eurprd08.prod.outlook.com (2603:10a6:800:b7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 15:43:31 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 15:43:31 +0000
Message-ID: <3b4fc40e-d06a-d909-d945-1f4e00be95e0@virtuozzo.com>
Date: Wed, 9 Mar 2022 18:43:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] block/copy-before-write: add on-cbw-error open
 parameter
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com
References: <20220301205929.2006041-1-vsementsov@virtuozzo.com>
 <20220301205929.2006041-3-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220301205929.2006041-3-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dee8a17-698f-43d3-2c3f-08da01e38eaf
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2621:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB26210FAB785A4D2CF8B9CA03C10A9@VI1PR0802MB2621.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SPpD32fyOMWqQmn3HYgCUhl2H6PSMLTzdp/JDVOmRysukOTRe4Xt7GWXRDfH0ZIM1XqX7Pnyly6EOBYLf6oBIrVdxQhrihxcv6P1+YLSHaGsYlw553HGcTB9cpKJCRHwla5P7bqdeQ3zLy/4Olvu/1FwpA9vi8fYCXX93Sru9QqtRQVCSnWFbddh/1JgJ11Ytq3q9Qmuk4Dh4eQrTBkF8IyryyPNaJZdIwfyGL4O66QIDyeyTuUamkqWhW4ZRNjq/iE/AEUCKMArRE7wLohhkyatAsoiJLs0gs8BVuIviwPdypbIy5AfPYe5F4KjE1KkqomuGC4PRgQMTsqVQtBW3dBVWPd/zDKaUtFiMgm8hlHjygUiyyoxAVrP55/HbprMHmA0QDInAktVYw5J0ngsL6Fd6KUULtrYcSc+6pktETKNE1J5HIBj4wqckY+ds/p8h4KjKMSA/4YLyPDaZpj37F+OmBU4QlKdomuZbVeZJ1AjMuFXvGwZUnrGzcJ5EufcM8a0Iy09J8E/zPlwjwAAQZUCWxw3snogErOvN8mKiafuB6l0MrkeD3BauY/S2dLD8+mqWCEg6No0KEUmpRyXO6PBWRC8+zs9RoLeFGjSXxZrfO3pPHSsCKZBxC1UlICZlpsB8j8Lu+XLSnmEi7609SsxB4gbRGIFhQUHhJxhvYbZoq+ROIK6MrNDdeM1zQ/3posrKrs9W6H5s48LGTbhxbQ1pi7oz2Izq9trv0Izdf6+1hk4uf3M/19xcn4SeaTBzMgwbmBJU+CKSW45V/+1xQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(31696002)(86362001)(8936002)(38100700002)(38350700002)(2906002)(316002)(6916009)(508600001)(4744005)(5660300002)(8676002)(66476007)(66556008)(4326008)(6512007)(6506007)(66946007)(6666004)(36756003)(83380400001)(52116002)(186003)(26005)(2616005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T05VbHJlTE93ajgxMUp2WndKZ3owS2N2VTBnSzlyaml4QXh3UjA5V0JvdzZr?=
 =?utf-8?B?cUkxT0dXTDNHUWVMVndYRCtweDFmaGdkM0Qxd3JOQ3FZRElLcElkYSt2eDJC?=
 =?utf-8?B?NGxCZkFFbGprQXlmTURzL3UrZGU0Kzd2cno4UUdOdWVKenUvQmFRMjlTZkRX?=
 =?utf-8?B?cUJFNnZLdlBTeXBBS2lrZGJaR1FYaklobTJLdTFzUy9TSjlmc2hGVExST0dn?=
 =?utf-8?B?aHo0WHFLVkhtTnQwNCt6L3RSbDYvYzI4aExZV3ZyWGwzbktBcHJTN2FPQ3Bu?=
 =?utf-8?B?bUJxalc0WlJta1dsWEo1Z0Fsd2ZscGQvWnhqQUlNaXcvOHA4V0VVREdPZFFD?=
 =?utf-8?B?WTRuZEtBMFIvVHlxQnNlWFpWOUVCUmlYVHY3aFc1OHhKLzQ5cFpaMWp2dEFO?=
 =?utf-8?B?ZjRiRk5iM1R1RkFaYTA3ZUxlZWR4azVFbGpFdTZGaVlGYmRHUWdiZXN0ZUxP?=
 =?utf-8?B?b2Z4aVpLdGMwdWJ1eFRXSzhTMThCNS9mQnloa2VDVHJvRUd1WkRKdUlWVjlY?=
 =?utf-8?B?WUNmWHgxZUJOeUYxQXpUZDI2cHo3S0FDV0J3TnN0OVE4WEREOCt2WC8zcm93?=
 =?utf-8?B?WEFyL1hSdk9OTWJwaWJTKzNySFpPRlZ4NXpPdUJkcjZ2Vk5xNUFTRVppZ1dt?=
 =?utf-8?B?VVJnb0tKZUcxYTA5MU12MUR2eWxKUVJvdnBlMTFKc0lkTVFSWENvOXdMVU5a?=
 =?utf-8?B?OXZXbHUrbE9yclE0ZU5ESHRsRi92SHFFZXZIQy8rOTRmRy9TR1JYNlh4VlEw?=
 =?utf-8?B?ci9XanBJRDRGTW14NGI3eEprV3pwYldFOEpzcjltRzJhWEd0YmFKZnZ2VlVS?=
 =?utf-8?B?b1kwWlBFbS8xRzRQYTVoajU0WTU0VkZmSnNRdlNKekxJNUFadG5rYjZsenVa?=
 =?utf-8?B?K24wVjZ3ekhPRkxuYXlzQ2JIdGJYUmoyQkNCazhnSzhKMnJRL1BVbTFSREs3?=
 =?utf-8?B?bFNsdVgyaGIxVVRjOWczY1VadmQ3eDB4NVkxSnV1cGl4NjJITmxXYkZydWhu?=
 =?utf-8?B?RDJIS2cyWGRCWngydUFPYkQ1Y3VON1dEejJQWTZ4SnZadXlrVnVxaFhHRnRx?=
 =?utf-8?B?REowS1NSK0hDQmNSVTVrSXpyZ3RIOHlJMnNXUWQyRjhGME8rd0kzWXVTTmE4?=
 =?utf-8?B?NWVWSitUS05XanYwVlNBUUxkdDVrRkIyc2VNVngxWlp2Uy9Rek9FODl5Wkw3?=
 =?utf-8?B?MDUyQ0RKdnkyUUM3c2lrOWdacXRlQUJXd29QOUowd01NVmthSW5xSXVSNEpV?=
 =?utf-8?B?dlFmcTZtbEYrczM5UWJ2VWFMYXBTVllzOWJtblExaDU4QWw3Unl1b080clR2?=
 =?utf-8?B?MWsxNFdjZngvL1FuRUp6MU1vVXdvRU43c0tMeWQ1Y0xMek1NbDlSb3FSZnJ4?=
 =?utf-8?B?dE9sVHhZY2wvR2FTb0RIRmI1RVFNY1BvWlc2QURXQmFOWWhkNUtwdGZQMFlU?=
 =?utf-8?B?ZDRzTWhocDdNYTJrellBak5mUWRzdWZKNHJ6eWNjSlhkeisxMDFEd1dFZElj?=
 =?utf-8?B?bCtXK0xtbGE4ZnpKa2NvSjNsdGtjZTB4VW9qekllWDZXNGYvMjltV3VXbDdw?=
 =?utf-8?B?MXd6UmNDZDdZN3ZQOHRZbmRWTmhhSE8wWmxoZ0Jmc20yUUt6elVSRWxoMlQ5?=
 =?utf-8?B?YWlFcm5ncTdobW5XbnlCYzlOWUo0RlBieHJTaU9TcTNRTFNRWjVmeVRHdW42?=
 =?utf-8?B?RzVjazgyS2NwdElmQXJrRDdKSUJSODdmZHZGR2tRNjdwWEFhTloxVExOcWhW?=
 =?utf-8?B?eElYaXMwcU9yVWhHc0pJdTA1SS9pUkxHMTJGc05SdWlTR1VKdkFXRFhPa2RY?=
 =?utf-8?B?S2VDWW04TjFSWEdjdU5ZYU1ML1VReWQybUJ1UzlUK0REY00zSFB4TnBZUW8w?=
 =?utf-8?B?SWhvYzhROGtLZ2tFTU5RajlmQ3k3UjdHTHlmSWFPdkhXc0cyM3dYaXlMNFNk?=
 =?utf-8?B?L1RqczRRQkYyZGdBaE1OcFloME1vZE5uU2ZWT2Mwd1BscXRMeTRSYU5wWmFX?=
 =?utf-8?B?WkR4NktXR0FGeVBwdkFoeGpEd0h4V3lDSkd0MUdXZWVlR3RSUk1IaFl0TTla?=
 =?utf-8?B?dVVrYjJIVEZPQ1gzeENzaEFvV2ZPdjk3Q3pnMXQ3Z0syY0o5V29pR3haa21T?=
 =?utf-8?B?cGFKOXlSV2haUm93dGlQZ1JKUEdDcE4rdU1Kcys2YWlsaHZBNnRHZUJKZUsx?=
 =?utf-8?B?QlViNFhNOWxkMDhFTFJBTHdSNjlyNEE0QWM0dVJmTjllclVsSEhwMXo0VmZV?=
 =?utf-8?B?R3ZpTzBGRnp5Z2Vsd3p4Rmxxdmd3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dee8a17-698f-43d3-2c3f-08da01e38eaf
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 15:43:31.7541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AijTABATSjta+U2rMmUGAYNmcILUyWvw+L1UHtn/B1bjxlz6mbo2zt1bH/Yivsh4nh15k2/GP30VXeKB0vAPGxusbB8LI0rwm1M7e6OujKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2621
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::711
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::711;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

01.03.2022 23:59, Vladimir Sementsov-Ogievskiy wrote:
> @@ -273,9 +311,9 @@ cbw_co_snapshot_block_status(BlockDriverState *bs,
>           assert(ret & BDRV_BLOCK_ALLOCATED);
>       }
>   
> -    cbw_snapshot_read_unlock(bs, req);
> +    ret2 = cbw_snapshot_read_unlock(bs, req);
>   
> -    return ret;
> +    return ret < 0 ? ret : ret2;

Oops. On success we should return ret, as it's a block-status


-- 
Best regards,
Vladimir

