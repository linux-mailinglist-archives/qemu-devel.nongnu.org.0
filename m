Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23FE41759C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 15:25:44 +0200 (CEST)
Received: from localhost ([::1]:56720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTlCw-00015w-WA
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 09:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTlBC-0000HQ-SQ; Fri, 24 Sep 2021 09:23:54 -0400
Received: from mail-eopbgr30091.outbound.protection.outlook.com
 ([40.107.3.91]:20545 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTlB9-0007me-3V; Fri, 24 Sep 2021 09:23:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0fO372tksKVQU75G0yUG7QXk41ZUWw0k7UB/Zc26i7VUpK5HJmu0/HC2cwI0uT8w9wiopZ1BPgPUtztDCWtrfNKMhZAUrpNw4p6z1rqULXqjdwKSoMwM1T23ZPXhapr+2KNxLllO/UchKVT7PM7Tw8UqgnEB2lTkyGqsZlFwYaCsZhAvSqJjGlBbDxYgclYb4NmlCD7SMUgwyVIPKKWmyArhvMx6HcakKiA4zI6YlAdEDEVerXF04L1W76VlLdnXWP2w2IdrB2hHMmU9R9iXe12UDBrVAcPIbEeb7nWM680ZAMDd6w+0sZwEpuX67q7Ass3sl/4gt0sEGsopry6cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ZRYYecHLpqNhaj8QnTj0b80alipfbxhcrTguiep1neQ=;
 b=Bzb6KEupRx+hNcq4d2cEtrJtAUh0tuNUZsjww6NUPEIOIWb884mS1ldTAyJNgOyGka9ePqMdg7OPZVNEDWQhTqnMo+kDCt7snIDJpqINiCmX7OTZZiJRvb9lAUPMCC6OoLySj6Vb9r4m3gz9MU+kOqiCt9TN1KyuGFE+AtYkBV5hbpImoaqiEcaswGacNNObxys3M+ZYncvfl2WnPzxl2fx0KcUnO/BCyddyq9BcGfIub84kgi4l6nTdufpC8LTGQwiF+Y3EqsijiuiKkUpTPtIa0nPdiNnctjTfKU8lmd0sdKUfBk9ZW67Nmo4HtsasPgeEohL/55/Fp5KZK7BJlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRYYecHLpqNhaj8QnTj0b80alipfbxhcrTguiep1neQ=;
 b=OdC9NxOaUHLHOSA5k3TqAUQkLH5A1PZkouUYsoNrS+MtmmxfExkO/leHLeR0S2N+sjmOKm8dC/sJncqswpubPQ7cf40QJxS+Vg6WwE0TSJDXYPkz8f/EAQUMrROcWUJxxMkBg9lzkrDOdc9xDFQTfTquoJETOdnKmQxbykTNPOQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6645.eurprd08.prod.outlook.com (2603:10a6:20b:38f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 13:23:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 13:23:46 +0000
Subject: Re: [PATCH 01/11] qom: Reduce use of error_propagate()
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, armbru@redhat.com,
 its@irrelevant.dk, pbonzini@redhat.com
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-2-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <95294b4b-5656-c91b-5409-b9c1d70186e3@virtuozzo.com>
Date: Fri, 24 Sep 2021 16:23:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210924090427.9218-2-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::8) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.8 via Frontend Transport; Fri, 24 Sep 2021 13:23:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: debb5ec2-6b73-4abe-d272-08d97f5e89ae
X-MS-TrafficTypeDiagnostic: AS8PR08MB6645:
X-Microsoft-Antispam-PRVS: <AS8PR08MB66457857339C34543C9AF430C1A49@AS8PR08MB6645.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h+0pGOe5j+J6jqFj1YjeofUDN0jwY/+ZByv5zfrH2/fQL3Z7lk4jEPSsZcJBi6eJllkcU+cJkY0OGfrMfltXHV6KW7rYntfmUankEuZIwbBJyJO7xHsTWrhja3RCotVYIgEBydQ/QWo+jc0plyIc/1gAk/ucry0GEsH6kJ4we1GY+J3bFIuExq8dwRdmSBo5Pp7cKHY+YZw29BDP4lXGEJWbrRdi82o75E2ydy3nEVMHIPymXc0e7iMCkVShCTKmVIIBNsVY1QsmTmQQrEJlewaFvc4NWcf3e0PPq4ckB8U9WUbYMPx+zzBHiS7CJ0NId8y2BUVtR/tdhEz2uaRHpp+ZsMNU57/rSIsz/DmAB4sAYgW1u1G0Id6y3gQsANQAUiKv/zdBB0YtlhQ+aQdPG74FKhRkkQqQeyDyuSZe0GaoJCZzXTSz4s+3mXPSyUZU1IQQ3/48u40DCYaPCgGIWr9lHQ5o1uZXt3lpdku5wQwHbR/B/lw/bcnSTiZfRStq6FawVmwGqEOixV2WEJna+7Yh43DV9iVMeTVitumlPDSyj0WQMhIVIgzf1FK1j6ZJYaXnmIqnnzLvLi251jCmC/JQ0LIKtJo0Y46v2KooNRW8KKF3V+dx0Y8Mi5HgwQTO6w3kNNWiefENoj/0pOk4kxAeB6BP3Qx+RxDbfBl0RQE7gQK0yboVNqDJF1DObltch8YqtFAjlba5TjX9hpx2yNhpc67wU5JqemHtsv0g0BfwUT/FBYoNlLJZAnvXhQ6WweSmqf6nRkVoYaUdsYioEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(4326008)(38100700002)(508600001)(8676002)(7416002)(66476007)(2906002)(186003)(26005)(8936002)(36756003)(66946007)(52116002)(31686004)(86362001)(31696002)(5660300002)(956004)(16576012)(2616005)(83380400001)(6486002)(316002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnlrZEtqOElyWjY0S09OVWY0bEZKNUppdDF2ajdGK3hTU3BHbGk1R2FVNlBj?=
 =?utf-8?B?RDNIb3hIdUU5RzFmckNNNzBIeWlrMWdyTXp4aVJNRVljbll6RkFhTGphODR0?=
 =?utf-8?B?OUlodmVRcWJZdGRFbTBlMXlPWVM3aEM4L1pUbjNDVFBmWTBnRW5FeldSSTBV?=
 =?utf-8?B?MklZNHQ0T3ZLWnltRnIwM05LSXhuS2dHNE9ySXZ2bDF6WTRmRFVCODU2U0Vi?=
 =?utf-8?B?L0NiMzRuUHFqczBJL2JJeExuNU45WUEyOXZVWTJWUzNuYjB4N0JkMkNNL29P?=
 =?utf-8?B?VDVvT3paMGdmemVmNlJ4b1BGRE5DT0o2RFEvYkpHc3RaZXN3aEF0c2RZcTB4?=
 =?utf-8?B?RFBUTTFNSjZ3QmxkZW1VTVlrYzB1dmF5QmFMUE1LQy8wd20yRXB0SEpxVTRv?=
 =?utf-8?B?eWFDdlVyTEl3QlNPdVNuUlZoOHFmdnM3aVdtOUVEaCtzaDN4ZmphQjA3c2FC?=
 =?utf-8?B?WCtWdHpST0tBVStmRTNLU0ZobWFWQlRWTUFOVFdJMyt1aEgzWnovYmVMYklx?=
 =?utf-8?B?RG83M3hHVkt2WjdueHZxbWZiaUw1bGJMaUlQRjVCT0FSUldlTUlmL1ZCUStO?=
 =?utf-8?B?NjJ2YVlmQ2pMaENBOWRiOTUvMjF2dkdjU3pGbFZ1OGxkUkxBTmhiMnM4T3py?=
 =?utf-8?B?SGQyNlJmd2NTek05cDdOR2dieXV3cXVHWnI2S09xMTdFc01NVHRnZWZjdFdt?=
 =?utf-8?B?dWtFeTBtanpWL3QzNjh2d0hFci9JYUlOSmFmRlJhQ3lTTkcyQTVnSmJhV0Fn?=
 =?utf-8?B?MUsxTStVeWMrR044SU5WbWtEMVIzcmdpalQ2a3dEaDBxRmhCLzQ1akFveTFp?=
 =?utf-8?B?bXRLdlJldjlJbjAybFNscGEwRitNYkhKUmc0RFJyVmVLV2xaL01qRllKdll5?=
 =?utf-8?B?OStOZGI5czNNWjZjQVVwaEo3L3A0VXI4UnllU29HUzZwelQrM3FHeHBEVGUr?=
 =?utf-8?B?YkFiRVlBb2FIWVRCUUlpa2UrS2NlYldCY3BpQkpqV3pJRXhxblJCSlcrTWJj?=
 =?utf-8?B?RjRmTnlxODc3b0ZVcGVyNFA2QlZCRWlaOS9KMnMycTZNUzFFMU8xc3lOalNP?=
 =?utf-8?B?eXNIbjJuQmMyMUlzNmZnaU5vT05oUitDZS9ha1QxUkFQVGtHTUZMZUR1ajJq?=
 =?utf-8?B?cXRGOTMwbzJLWnk0eWMzN3diQkh6UUN4VW0zT04zaXQza1JjWFIrV2hSOGlZ?=
 =?utf-8?B?emg3dzByVFJ3dHR5TFVaaitoRVh3Y1h6cjJjSzdVTGsyenovRFZ0OFVhek1K?=
 =?utf-8?B?c0FCa3ZHUDBGMStDcWQ3ZHhHZFpDYTQ1bUtPUkVxOXV3bm1EMU16M0RPL254?=
 =?utf-8?B?MGkyRW01SEdHYWRpd2NTUjVhakhRZ3B6YVJtZVpHVHNZdDdybGk5V3B3Qm9a?=
 =?utf-8?B?UXVwMVZHYVl2NHlJY2tNWkJJT1J5cm5NYVFTb1p5anFvdElaeVNncXUxM1JV?=
 =?utf-8?B?QUhTcjFUUlh5WE01bmJ0RDEvRnhXNzBEUFdtV0hiTjAxbDZPeDd6NTB6a1Vn?=
 =?utf-8?B?WmZ5aDkwdTlUMnkxUFNsTnJFdHZLbUhPdTYrdzZWQ3htdWs3cE9IR1VvV0Ev?=
 =?utf-8?B?M3l2cGpYTWZkUCtyemJLdXNaSkZmdThISWhXSUh0TWJZS0RZVmthblNLUDNJ?=
 =?utf-8?B?RTE2cjBYcTc2VXlzMzlQZzFlczdESk84ajJmL1JBQ1RENWRrOUEwVjJTS1dr?=
 =?utf-8?B?TUMyQmJhczMzaWVFQ2hGam5FM2lQMWlYc3BtWWNJR0hsNzRDeStMWElXVDBF?=
 =?utf-8?Q?E47s7yN1JKgOHAbhiTnp6sIhNfv2Pp57eqDyxy/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: debb5ec2-6b73-4abe-d272-08d97f5e89ae
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 13:23:46.5803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhgSeuPfb6y3mMOv83i3cSDm2SUG+tJ0Ep7J+dgftnUvRSQIARFaIL8O5J2hjwoIqCcmmJ7WibRFHc1yvbhL5DoF0DE9Oan8g0QGFuEjlco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6645
Received-SPF: pass client-ip=40.107.3.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

24.09.2021 12:04, Kevin Wolf wrote:
> ERRP_GUARD() makes debugging easier by making sure that &error_abort
> still fails at the real origin of the error instead of
> error_propagate().
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   qom/object.c            |  7 +++----
>   qom/object_interfaces.c | 17 ++++++-----------
>   2 files changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/qom/object.c b/qom/object.c
> index e86cb05b84..6be710bc40 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -1389,7 +1389,7 @@ bool object_property_get(Object *obj, const char *name, Visitor *v,
>   bool object_property_set(Object *obj, const char *name, Visitor *v,
>                            Error **errp)
>   {
> -    Error *err = NULL;
> +    ERRP_GUARD();
>       ObjectProperty *prop = object_property_find_err(obj, name, errp);
>   
>       if (prop == NULL) {
> @@ -1400,9 +1400,8 @@ bool object_property_set(Object *obj, const char *name, Visitor *v,
>           error_setg(errp, QERR_PERMISSION_DENIED);
>           return false;
>       }
> -    prop->set(obj, v, name, prop->opaque, &err);
> -    error_propagate(errp, err);
> -    return !err;
> +    prop->set(obj, v, name, prop->opaque, errp);
> +    return !*errp;
>   }

This is OK: prop->set doesn't return value, so we have to analyze errp to make our own return value.

>   
>   bool object_property_set_str(Object *obj, const char *name,
> diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
> index ad9b56b59a..80691e88cd 100644
> --- a/qom/object_interfaces.c
> +++ b/qom/object_interfaces.c
> @@ -45,26 +45,21 @@ bool user_creatable_can_be_deleted(UserCreatable *uc)
>   static void object_set_properties_from_qdict(Object *obj, const QDict *qdict,
>                                                Visitor *v, Error **errp)
>   {
> +    ERRP_GUARD();
>       const QDictEntry *e;
> -    Error *local_err = NULL;
>   
> -    if (!visit_start_struct(v, NULL, NULL, 0, &local_err)) {
> -        goto out;
> +    if (!visit_start_struct(v, NULL, NULL, 0, errp)) {
> +        return;
>       }
>       for (e = qdict_first(qdict); e; e = qdict_next(qdict, e)) {
> -        if (!object_property_set(obj, e->key, v, &local_err)) {
> +        if (!object_property_set(obj, e->key, v, errp)) {
>               break;
>           }
>       }
> -    if (!local_err) {
> -        visit_check_struct(v, &local_err);
> +    if (!*errp) {
> +        visit_check_struct(v, errp);
>       }
>       visit_end_struct(v, NULL);
> -
> -out:
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -    }
>   }
>   
>   void object_set_properties_from_keyval(Object *obj, const QDict *qdict,
> 

ERRP_GUARD() + dereferencing errp is good when we use functions which don't return any value. So we want to check is it fail or not and we have to analyze errp.

But that is not the case: all called functions follow modern recommendations of returning some value indicating failure together with setting errp.

I think, it's better not use ERRP_GUARD where it is not needed: in ideal world, all functions that may fail do return value, and we don't need neither error propagation, nor dereferencing errp. And don't need ERRP_GUARD.  ERRP_GUARD will be still needed to support error_prepend()/error_append() together with error_fatal, but again that's not the case.

Here I suggest something like this:

static void object_set_properties_from_qdict(Object *obj, const QDict *qdict,
                                              Visitor *v, Error **errp)
{
     const QDictEntry *e;
                                                                                  
     if (!visit_start_struct(v, NULL, NULL, 0, errp)) {
         return;
     }
     for (e = qdict_first(qdict); e; e = qdict_next(qdict, e)) {
         if (!object_property_set(obj, e->key, v, errp)) {
             goto out;
         }
     }

     visit_check_struct(v, errp);

out:
     visit_end_struct(v, NULL);
}


-- 
Best regards,
Vladimir

