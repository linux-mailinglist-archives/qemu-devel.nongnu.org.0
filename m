Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3CC3BE8E5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 15:37:31 +0200 (CEST)
Received: from localhost ([::1]:52292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m17k2-0002X1-G9
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 09:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m17ii-0001OB-BX; Wed, 07 Jul 2021 09:36:08 -0400
Received: from mail-eopbgr150111.outbound.protection.outlook.com
 ([40.107.15.111]:41607 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m17id-0005Tc-1u; Wed, 07 Jul 2021 09:36:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxRkVlfLCtjqgJGckxl2Eb0d7FNwdb8gDRib4Y4Dp60PGsTuusSoSbAxulTuECyRrlxtadPKZjgh5GY/D6wTFCq7pWs3BinzA57kueCe6HY+ZQlRZGneSuXE0x+Y3EkNG0aZgI/R6jGub3CKutd/zT85WpavrrcOEFfPDNJD9hvKZKN4Jbmg1hXFRmsrEyqJdzsc+FsrBjkaZO6HVfURxY+kdOvoB2SY3Xa0u6spjiEOttzwM+D4lslqpr7xV7V6HVMBgaRpF9Zfb1/n2MychL/4SEe+MZ0tMKChc8L/6dGmNwUqHqzEJ8IUPY6XVvox9rtcmQszlFdFmaVKx1FWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvWbVf9sS1RNNNs8ooAcOWADaC3/k2lQc8xY6MpTMUY=;
 b=R4YN39GAYRjBGpbXifQ7hmaRWsEVX+nvjn2PRvhDIY00ijlc98c0+YC8SPVLm9xwUaJDPBdr/DCgSZOtjblZkjkOsz9oDhSN8tTOcd4Dm4Ky9WC5xB26CT1TAbmsbunX5meugeWHB1lXI3M7wabKTN9MNlWxZ6qhVXR24J3En7hcdj9xa05Zr2dRERGAsW1lmsO/me8/KRiunqJsdMqVd7oDXiajo+P6nldvnoa5nMof0JDAIU9CbY3PrVjs8Bn3DzTVWlG4NzMd33UBbIGIu8q3NrqAWFNXeiqPYs+wv1grJUnpuzVcw11Nx/7cPDRitMC6EK9ENqL2Cv3cqAojfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvWbVf9sS1RNNNs8ooAcOWADaC3/k2lQc8xY6MpTMUY=;
 b=XbgKhh4hTQ5KmMaIgzSgpI9j8A11E//cfhDSvHkT8+Bp0d6OrgaCMG8/X92VIhH1bddnNnOeydxnrCo9PHVnuN3eHZMxnF59OwNQFwCZCHjeFrgBFQJLqR8QuVg01swqhx8//F0nal/kf3hz79Lj1kLY1VuPtH0Ihxnut+foA2o=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4341.eurprd08.prod.outlook.com (2603:10a6:20b:b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Wed, 7 Jul
 2021 13:35:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Wed, 7 Jul 2021
 13:35:59 +0000
Subject: Re: [PATCH] blockdev: fix drive-backup transaction endless drained
 section
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, eblake@redhat.com
References: <20210608171852.250775-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <84a04bf3-ef77-1ccf-2c4d-afc0c8079b83@virtuozzo.com>
Date: Wed, 7 Jul 2021 16:35:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210608171852.250775-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0070.eurprd07.prod.outlook.com
 (2603:10a6:207:4::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM3PR07CA0070.eurprd07.prod.outlook.com (2603:10a6:207:4::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Wed, 7 Jul 2021 13:35:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a78bf9bb-8564-4453-caad-08d9414c27d2
X-MS-TrafficTypeDiagnostic: AM6PR08MB4341:
X-Microsoft-Antispam-PRVS: <AM6PR08MB43415D8EA6A5375BFF99E2AAC11A9@AM6PR08MB4341.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PK7qRnjKVuDQ0jVh3R6QGl91RWNg5Vx7+QOqp2jVh0QlMB9zx34WqFPcaTyX0n/5/JPcEUM0CjIjbIcuMmLMMpxtWgzmEWraqvfgrB10ULvr+2KcnQjimP+beNQIZD5eOlvAkLYGrM5jcwPGxd8RzBqbEyQkDRxCLhud4o0IvNxCxgv4aV2GTSFQHU5AyIDxJLAkKuUkX3s+dL02DJUbpQE5KxavdiQ/c90fYvrkGNzoyBflk3YpXXZyWCyPMxyWRIyQNbSdinK3jkqPozOxdK4xeIGNzkJszzgFS+akuv3vZMeHigKvhD4r5CPiMDpn5T+sIiyYlUTdYRjdjFsm3T3Yv+sDY7N1LS57GtbvJCw4Wvo9hsZ59g6uZw9tg3Mmij7Jaz7xeE7HePT8MlVLSfFD1yvOEU32BIBwTAt7VJhgdO6djxuZE4WSU/n0QAPGWx1NjCJIgRlLbkrq6xBP9vOFMsqRMtSFrp8bVreWNPUnpQDIH2MWK3wuCWWB1a/0WwskCdSyGj+p97GJxu7WnleHQ0j/CBRAEvl9+i5mj5DVwlrob1dBmUunnk9eSORtORvVFaX3oCyxd4kt369Nb3OI/B5IA2kYc2f9MPpid2Jw9RhT7VwVQoM/gYzSdUWIn4IWn4sMuELMj1Qba5fGe8YysQKLZLELGeJkJ0AbtKJX73OiJGfY/7p0nDUT+9Qdgxhi6mTe6kKzweWSgY6SqY6xsSx86zLdRwO43zSkIdiaOYlbonlAT+8sYp4ZHm1AlOoGLkWdNJA16jRiYddGWRooij2DXvu95tg9gm20tTD2jA267XIJebSBWvVZsUfbqMn5/kW+fNPkps5WlAAVoecrkyxCmne3NSNMzLv8XuE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39840400004)(346002)(26005)(31686004)(316002)(478600001)(6486002)(8936002)(38100700002)(4326008)(966005)(186003)(66946007)(2906002)(38350700002)(66476007)(66556008)(6916009)(36756003)(956004)(83380400001)(5660300002)(52116002)(2616005)(86362001)(31696002)(16576012)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXBQNUNkOWxid0FhKzhFbWRMUU1hdUUzZTBmUHgyMVZMUE4wVkFOUEJ6cHl0?=
 =?utf-8?B?WlI4Ti82cDVTWkxMQjJwaEQzb3Q4eDQyaWhIVHJYeWQxcFZLM3M5a2RQRlJl?=
 =?utf-8?B?T3JHUDhVVysxSnNsRk5XTHgxS0poWDJzOFlNWno0VU05TG9SWVVEQkRhWTJK?=
 =?utf-8?B?QmFMclNsaWZOUGNBK21rZ2JQbTNqS3owOHRnTFY4YWhodzZZVUJmaExBbUlP?=
 =?utf-8?B?RGpZZEVqOUlkMEtKNGJucEZVVnJOK3RWS1pCeTBBemZGK3dMSlVmKzJDS2U2?=
 =?utf-8?B?ZitKV2pzeHdSZktoSkd3ZldqNlpyeEpkSDVKVUZLeElTaWl1UzNGZ1pQWE9F?=
 =?utf-8?B?ZEhuM0o3ejZpY0ZJdlRUNThyU1UrTlFNZW9nbHF5Q3U5UXljdWFLRVdEbUFz?=
 =?utf-8?B?cXJQb085N1BIN2E1L1NxeE1aUk9JKzhGdG4rYzFKOWFYeHNabnNBREdacEFq?=
 =?utf-8?B?cVRibVF4RDFVQXJyK3J2SnpYYTRld3JMdHhUWFVZTFUvejMrY1V4VkYyaCts?=
 =?utf-8?B?ZzVGTzhXaTNnWjZMUGJxMGttZUFPMnlvSnhEVmZ1OGJHUFNOanZadHVtWWQr?=
 =?utf-8?B?eWJCN2xpQVByZERMN0RiUUVGTlYrYzhkSDVVSnNTZDZEZlpIWVdEKzQ3VG9i?=
 =?utf-8?B?MTdEVDdYUWdCYVRzK2YvdkpwMmhFY1FDL1pVYmxsMUh2SzRnY1RKMXVDMzlh?=
 =?utf-8?B?bERURkI1RmEyclMyM3BFZHhSSHhRODdvRFZFczFEVFpYZDVDUnFWVjRtWmta?=
 =?utf-8?B?TVQvblRIOEVneGZRaFNuaG1BZEF0aHNrOXRWOG1nYi9Gdjh0RTljY09ycHRo?=
 =?utf-8?B?UDlhcmFDVVBhSzU3TWpTTmZ4cEpLVzVvZ1owc1NiT3lPQmprRTBTNjdvSkx6?=
 =?utf-8?B?c25Pd3VHNjh3RnpqS2t2QW53SFFQUW5pU2VXQ043T3V1VGswVUFrWDcrc1RF?=
 =?utf-8?B?T1RGSzF5UVRZYVBzbEVqUGh1ZE1kMVFJbWY5NnVHSmt5Q2lYa04zdmM5eHBy?=
 =?utf-8?B?UEoyYmROOG5QaEFHSjFvZitoTlFDclBNWVNwSDhjVFB5VGpGZUVxeGZnd3BP?=
 =?utf-8?B?djlkUG5Wd0VBV2ZzSzVaOFQyNnA5YWVoTHQwOVdEOW56dk5PTStSaW5sYjly?=
 =?utf-8?B?ZGQrbTBJVkVmT1BuL1F1YkNHL2VZUlk1eUJEcXlQZ2c2cEFjMnFweW15VFBu?=
 =?utf-8?B?aUplaWNVZWNZWGt4ZjZRT3V3bHRYekZUWmJkaEsxS0NSZ3Fnd0ZocW1aRDEx?=
 =?utf-8?B?emJWRi9WcGFUNURkd3lKMnJzSWppcW5SZHJSTXZQbWsrUDQ0aU9oTzNvUDdV?=
 =?utf-8?B?OWIyZS82VksxOWVFNkc3bVdqQ2YzNXgxQW1VWWdlSGxOc2J2cFFLUkt6cXhp?=
 =?utf-8?B?SHBXQmJORXNwS3NHdks1aU9ic2tYYnBBUGdSVGlmeUprT211UVBzS1hGZ1I2?=
 =?utf-8?B?OGhiYW1HNzFsYkhwNTV4K2E5MjUwOUc3dHc3TExMZS9ranFPVGxlRFRLS2FR?=
 =?utf-8?B?bGhnMk9zNEtWakdOK0xldWREQVBMNkd5NVJ5SFhuQzNJSStqUEc4d2RCQit2?=
 =?utf-8?B?RjNDQ3o4aThPN3A5Z1dkYUFhVzdIek9PemRzZ3dTZUl6am9OMWZCcXpmcm5G?=
 =?utf-8?B?WmswMWcvUER5T25wOUVUOGtma0hGeU9rUEV4KyszNEIxSk5GSEJZUnhoRyt4?=
 =?utf-8?B?T2xzeFpzM1IzdUY1UU9Xc2t0dlFyMVRRZ2k0ZXZNcjRMQ1F5YmhNL0pMbjdC?=
 =?utf-8?Q?3/AK1T3Xv3svVwfboKbqzcg3bO5Y/4QQRdV6DlV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a78bf9bb-8564-4453-caad-08d9414c27d2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 13:35:59.2435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4oT75xNHDdcYZccv4Yf+XAE3TPrxaCCQ4kIwXr9c7vEWva4az7/cScwtojN0S/5R7xq50CqrdINCiy2wY+oReVZkXpBCc2myPvFuFEXSOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4341
Received-SPF: pass client-ip=40.107.15.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

Forgotten thing :(

Kevin, could you please queue it in your block branch? For me not to bother Peter with one-patch pull request.

08.06.2021 20:18, Vladimir Sementsov-Ogievskiy wrote:
> drive_backup_prepare() does bdrv_drained_begin() in hope that
> bdrv_drained_end() will be called in drive_backup_clean(). Still we
> need to set state->bs for this to work. That's done too late: a lot of
> failure paths in drive_backup_prepare() miss setting state->bs. Fix
> that.
> 
> Fixes: 2288ccfac96281c316db942d10e3f921c1373064
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/399
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   blockdev.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/blockdev.c b/blockdev.c
> index f08192deda..094c085962 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -1714,6 +1714,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
>       aio_context = bdrv_get_aio_context(bs);
>       aio_context_acquire(aio_context);
>   
> +    state->bs = bs;
>       /* Paired with .clean() */
>       bdrv_drained_begin(bs);
>   
> @@ -1813,8 +1814,6 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
>           }
>       }
>   
> -    state->bs = bs;
> -
>       state->job = do_backup_common(qapi_DriveBackup_base(backup),
>                                     bs, target_bs, aio_context,
>                                     common->block_job_txn, errp);
> 


-- 
Best regards,
Vladimir

