Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C212FBF91
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:58:50 +0100 (CET)
Received: from localhost ([::1]:34962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wDJ-0008M6-9M
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1vSi-0005sj-AO; Tue, 19 Jan 2021 13:10:40 -0500
Received: from mail-vi1eur05on2119.outbound.protection.outlook.com
 ([40.107.21.119]:7361 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1vSf-0006RM-5J; Tue, 19 Jan 2021 13:10:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2cAAMPY//2tZ3jMzlUvynu7MQDYKwcMf75r4ZSHvUoFnh3wleStB1iWcJne4Y5xqOZbWodCetcN24i45pSSWvia9YZZKkJSEQLM0uutE6LaAJsqCZYWT15YPdP7uEtIsxJfxuxwAwOpCmjDgn54/OcfNAcXPIU68KSXGjAYguXt/PD4shtaYw2EQeeajIdnmcu7SkJfkcHu+Ohs7qZMQFUjP+NFAT02Y97iu1oDEUx5cr/Xf+DXokbnhK2Tkn/hezNzC0xiDVsBR8KSin42RBw4n0X4h9DMg6SlGa/L7puXjpC10Flr6wKorRE2FqRawUI4C9JzErl9chASv+9U2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTZTm4ROKHILHVyskzOcpY+woo2r7T6cvV6VKBj4urc=;
 b=HbWWVoIiO9D/Fb4+MEEQToHGhygbaU6kKVfHrOcbdSk5uxRc2SNgeqQc/wT3UhB7NxAUk/kJtD2y6XXQekbC3fWjEenW7ZspLVabRYwmqLCUl/02Rd/CCOCL1GImfQzL+8dr6BKBmjzLlRWmQOey+coDqSrMcv5wzoclxLjXe1FucG4Bd6TAyB24OrjDpAJGbTttNJi9jlDHLm4MxNLkwz0r1CVzzHEU0X02rdReiZddUvELQdETazGspY42nqXofvpb1+mE19bkctr0hDr5pEzIMA4X9U7oKX0VtEyj+6SqW/DpoRP3DhAKmNiqIgoPdXFiCKg9gUV6zTrZ/dNkQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTZTm4ROKHILHVyskzOcpY+woo2r7T6cvV6VKBj4urc=;
 b=mvIrMeDWUQ9Q2EmF/W8EWPS64d6WwbGTbrolCB7BiY/5a4AThzmDfM1VLCh6YDDpHepSZAJce474KlkfyWHV+/zpUJ9fZWNb8Ah3Z9WnmHb+u1TGVhcokLntn7IHNknv9ZpXCCNBLrioELQJSezaeQ5laNkG5MbAQDo8+32iT60=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4692.eurprd08.prod.outlook.com (2603:10a6:20b:d2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Tue, 19 Jan
 2021 18:10:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 18:10:32 +0000
Subject: Re: [PATCH v2 11/36] block: bdrv_refresh_perms: check parents
 compliance
To: Kevin Wolf <kwolf@redhat.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-12-vsementsov@virtuozzo.com>
 <20210119174234.GJ5012@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f76bb319-8a41-0aaf-9151-79b5da10e2f3@virtuozzo.com>
Date: Tue, 19 Jan 2021 21:10:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210119174234.GJ5012@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.84]
X-ClientProxiedBy: AM0PR03CA0087.eurprd03.prod.outlook.com
 (2603:10a6:208:69::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.84) by
 AM0PR03CA0087.eurprd03.prod.outlook.com (2603:10a6:208:69::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Tue, 19 Jan 2021 18:10:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a830e43-99db-4634-6bef-08d8bca582ae
X-MS-TrafficTypeDiagnostic: AM6PR08MB4692:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46927EAAFB77294328158F69C1A30@AM6PR08MB4692.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4w+ZttjtqlNTuU0UJgKbhqO9Tbdr/tObpe27PRANIUoxoMWpV4Kvnl9tmnXO4cwgAjjqhiXm2VOczqzDBP9LC8oiUQCXeza+CvZ1+CJGbQfWokKSI6fyldQFLHvBp/iun1mqcIDg/ghyYQe754juW62T3XG1XUEdnCfg0cnmZATa2xGVkRX7vIybRXBMaAhCQVJjEcQCUTBuNIyTyAKQ6s0p0K44aXimsNHOXLMJh1B8I3Wy6XDeqCA5Zj/ARIPwCpnaoUI7H5QVT6TWsQvZjE5GeX7kiJfGEjGm7tZaJmKtBBilQoXCbyOBBg1u8kOsNvuBvtTecdbvYpyTwMPR1PDS3D56LrCZ20GvRPv/ITHgkIZ8GsnTOp/Gz1ijuylrec/HvS1+nwyoJKsZ74F/o6c9X+TEbTSaOs8VhYBa+k0qJQkQz4hwaLeix1iVuz7F38tBBpgHncgfcTeLctLUOseefoNDNY5Oz0M7Ej8PWlI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(366004)(396003)(376002)(136003)(346002)(31686004)(36756003)(16576012)(2906002)(2616005)(52116002)(6486002)(186003)(83380400001)(16526019)(8676002)(316002)(5660300002)(956004)(66476007)(31696002)(107886003)(66946007)(8936002)(66556008)(478600001)(6916009)(86362001)(4326008)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bnZyVVdpNUc3UjJHME1INlk5ZGtLVi9VOWQyREptWHhGN0FaekRtK1Bha2My?=
 =?utf-8?B?eFhjMmhzYWltcVdmQ0FPd3QvWmMwVUtVZGY4THFqTUt6U3pxSGtFam1UdUtS?=
 =?utf-8?B?Y2hMTnhzdkJMNXRwNWo3RkpnSFdkcVRLaisyNmJiaW1WeFk3VU14NWJkV0xy?=
 =?utf-8?B?UFBUL1RVY09QTjFCRU1mZkNTZkhpZTRHWlgxN2t3emhteFRCWmFUdktDeWs1?=
 =?utf-8?B?TnFhZnQxKzZjN25rQ2hFVGs2QTRVa1kyRDVFaW9XeExabE9ZeFdkdWtxUkZj?=
 =?utf-8?B?Vk54bkFUTWhDTEVIQUNuZnQxT0svNXNESk04WkcwSDZXT1RCYlBhekdwM29S?=
 =?utf-8?B?ZEtlaE5QTU5KYnRsakovM1RWVHczMDlISHphQ0dwbVIxRTVRMm9xK0M3WU0x?=
 =?utf-8?B?YWdVR2ZEMC9ETGNYTld4cVIxZFpTN2tQTzRSdkFqWXBGS1hkYzZwNWFpaC9z?=
 =?utf-8?B?VVR2c3FQRy9MMkVHWkRqVzNKcUlMMXVaOVFvcDhRZmpOMUplSHFrSGFHVlFY?=
 =?utf-8?B?aG1ZaGRsUkcyUXZudUlWM0drU1g5VmlsaHFBbFJCdVY4SDhDYjNsRjZqRkJv?=
 =?utf-8?B?NE5XNS9IOHJIUHdjcmZ1UGNjUjF4S2NLK3V3RlhML04ycENCajZoWTJvSjRD?=
 =?utf-8?B?eTUxVXY1cG01V2tvNTBpUS81T3VRNk5YWlBJYW01TG9JN3VRekZUazVmdjJY?=
 =?utf-8?B?TEIxNzZ0a0JFM21tcERteVpCekRweGJJZy91WjJWbEF3YjVPWWgvZEdxQkNn?=
 =?utf-8?B?Q2taS3R1c1NnTWpBQ3pRL2h1cnNJeW5oR0RWSEFubzM0RElGQU1KUnBoR3pS?=
 =?utf-8?B?SHQ0MzhXYUtROWI1OUhBQ3o1VytYNW16VHgycWFaYm1ZcUlGNWhXMEZkT2tO?=
 =?utf-8?B?MFhTWFVUcDVYYW9DVHllVDR5R0xBbGdGY2NrZ3NQTXkyTGtQWVVzSWFFd3NV?=
 =?utf-8?B?d3B3ekFTVnBKRkVVenViQkxINXI5VG0yQzhndzZkOTBsaDhtNmRYQmNqdXk2?=
 =?utf-8?B?dWM1Uy9OSUUxbXRwY1NIOWZpV3JyZG0rMko3ZlFnYktoR1FUdlpqMG01bEZx?=
 =?utf-8?B?MzZQY3ZiN01xelVqdlpiMk5aQnBOZXZ1WEIya0ViUGdKeENzaHNITWVVRHFk?=
 =?utf-8?B?cGFoMW96cGtJR1hCVnZGaFRYbGpCVU9WRVV4Q1p2dTFIL2NmbXIzSmsrdXd3?=
 =?utf-8?B?L0o0OGYvUXVWNk9KMWxkWlVlTXdvZEJXYUJMdkVlK0NEdHZFNDF2aTZrd2d5?=
 =?utf-8?B?WHBpR1ZtZ3pFN04zdzdySDBMd0FLSEV6U1dZV1QrdmJUdTBoT2I2bExqS3NU?=
 =?utf-8?Q?nJR2OAtVE4aI0/ACh3ea9JF4mVPHJV9K2d?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a830e43-99db-4634-6bef-08d8bca582ae
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 18:10:32.2159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjxGnSXv5dmiw5h/FC353DL7IM1dCR5XJKn65QtFXgDpRpJKVJbDbNZSIodPlbYaCIGylYzYFuixiFOrWEwmIIsaRbHPQ3lddGlA1rHnUDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4692
Received-SPF: pass client-ip=40.107.21.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

19.01.2021 20:42, Kevin Wolf wrote:
> Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Add additional check that node parents do not interfere with each
>> other. This should not hurt existing callers and allows in further
>> patch use bdrv_refresh_perms() to update a subtree of changed
>> BdrvChild (check that change is correct).
>>
>> New check will substitute bdrv_check_update_perm() in following
>> permissions refactoring, so keep error messages the same to avoid
>> unit test result changes.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> The change itself looks ok, but I'm not happy with the naming. It feels
> a bit unspecific. How about inverting the result and calling it
> bdrv_parent_perms_conflict() and bdrv_child_perms_conflict()?
> 
> At least, I'd call it "permission consistency" rather then "compliance".

bdrv_parent_perms_conflict() sound good for me, OK

> 
>> diff --git a/block.c b/block.c
>> index 29082c6d47..a756f3e8ad 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -1966,6 +1966,57 @@ bool bdrv_is_writable(BlockDriverState *bs)
>>       return bdrv_is_writable_after_reopen(bs, NULL);
>>   }
>>   
>> +static char *bdrv_child_user_desc(BdrvChild *c)
>> +{
>> +    if (c->klass->get_parent_desc) {
>> +        return c->klass->get_parent_desc(c);
>> +    }
>> +
>> +    return g_strdup("another user");
>> +}
>> +
>> +static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
>> +{
>> +    g_autofree char *user = NULL;
>> +    g_autofree char *perm_names = NULL;
>> +
>> +    if ((b->perm & a->shared_perm) == b->perm) {
>> +        return true;
>> +    }
>> +
>> +    perm_names = bdrv_perm_names(b->perm & ~a->shared_perm);
>> +    user = bdrv_child_user_desc(a);
>> +    error_setg(errp, "Conflicts with use by %s as '%s', which does not "
>> +               "allow '%s' on %s",
>> +               user, a->name, perm_names, bdrv_get_node_name(b->bs));
>> +
>> +    return false;
>> +}
>> +
>> +static bool bdrv_check_parents_compliance(BlockDriverState *bs, Error **errp)
>> +{
>> +    BdrvChild *a, *b;
>> +
>> +    /*
>> +     * During the loop we'll look at each pair twice. That's correct is
> 
> s/is/because/ or what did you mean here?

yes, s/is/because/

> 
>> +     * bdrv_a_allow_b() is asymmetric and we should check each pair in both
>> +     * directions.
>> +     */
>> +    QLIST_FOREACH(a, &bs->parents, next_parent) {
>> +        QLIST_FOREACH(b, &bs->parents, next_parent) {
>> +            if (a == b) {
>> +                continue;
>> +            }
>> +
>> +            if (!bdrv_a_allow_b(a, b, errp)) {
>> +                return false;
>> +            }
>> +        }
>> +    }
>> +
>> +    return true;
>> +}
> 
> Kevin
> 


-- 
Best regards,
Vladimir

