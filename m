Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB61C4176A6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:13:00 +0200 (CEST)
Received: from localhost ([::1]:33140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTlwh-0003lL-Mf
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTltq-0000nu-PJ; Fri, 24 Sep 2021 10:10:02 -0400
Received: from mail-eopbgr80104.outbound.protection.outlook.com
 ([40.107.8.104]:30627 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTlto-0005ci-2Z; Fri, 24 Sep 2021 10:10:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRvo3sIZxy/sUTqceD3UpO4c4nk1yUSkxIuOz3dpSJPzftoFKkXx3z4Englf0EC7EDfvTA9Uvaj6GmJPEZnk/CTfuyCda+2u8d0aqcW2Ax6iZfdXrytELM1fmtq55iyI5SzSngCeT7UOK1MLiBKaGoJpp36ycfJcYcqE/IuB1zigq3mNOucwipsk9feh7CWygOT9Sz6WNnwCeawD17cxrRYuIWD4lqE2eMAr1balq8zPFawtghCFIKW3ry6vSdY+HJFWzP5LenyY+xa4RYYz1H77tG+f8qMJ+/4NSR0ZtvnzDMxFjCCbde7KQ0hs01Pfei3Ujtq519gOZD98n8Dsow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=4p6ICepqjcbWUgyJrjLkxylg71Akjtxs9q1wmZPgVJs=;
 b=QJxbe1bROIAlnPw0hw8UwyR65B/S98NLTxqD8TWFHA0v17RahKZfERiCSe7kWTn5B0BcI9gmRFWluOUY+7r8JfkHO4OWbKDhpVl3RJyPLtO97L5F6BdXSv+2z8M/qPw1verYB/bNgFQ6d6bOVnekmtLJ6FOGH4nZeAjhDTJXWK5uF+EjLHZnwl3ABKtKFpwq1l4TXV5d1nHDrRdTusjpfxYlWndNqqDnx3XXIGiYWygjrWAdsdBc8yTGk5gLAf6DtSQb5FLa0OMJ/Y8ODxF/MO8dWYGKdkkHu+mD7n0favd9ia4LjvLr4NWSRPtXs1oc3v6Mx2Vrds2G1hAh6jcoPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4p6ICepqjcbWUgyJrjLkxylg71Akjtxs9q1wmZPgVJs=;
 b=TD2vJNOXs6XzGObGuDTQUv5fMXDo7ylYJbXMi48z1OEmNVKDRqcta+xm0mvcr43ZymJgI8Ha1RFoxIPCBYOw69HmKEBAUPVvG0/1ks+fS8aljFvniKA2OmUyMCfW80fqmMApVkYX8h8YMjyUtO9iMUSwSjsMxHXz+u78+Pnly7s=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1905.eurprd08.prod.outlook.com (2603:10a6:203:43::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 14:09:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 14:09:56 +0000
Subject: Re: [PATCH 06/11] qdev: Add Error parameter to qdev_set_id()
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, armbru@redhat.com,
 its@irrelevant.dk, pbonzini@redhat.com
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-7-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7b9afc35-af95-ad21-6296-7e112ada9c87@virtuozzo.com>
Date: Fri, 24 Sep 2021 17:09:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210924090427.9218-7-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 FR0P281CA0073.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Fri, 24 Sep 2021 14:09:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 304b2baf-f092-4f6e-96e2-08d97f64fd00
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1905:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1905FBEE91F099E6A68ADE0BC1A49@AM5PR0801MB1905.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0iIKIrskKcOs+WUYGpLWdB8A3s1fuoez8EAeQfDR06MWZaJG8x1E0Nfz3xvzOI3OAv6VTT6c21PFZAwwdc5D3Zc3nJltZBJmiWnxk6R9HXLy4qcmgnKVd+J7+uI+zT4c0suW1HPnZvbRXXfXXAw7bViX39X6TVPvFromgJTxYaQ+8w8RYc+SwCOthXlxsid1ZrTrW9P4uvBLcDCVgn7QflK3J0lEanBCFJCjZHGo6A3JKBbwmW665N08RtWp4rBuG7iWppmp5D4lCKZTbrvBok6gruiHDjBy/Wq/DKXXFpnG9gQCk6ftVqjOf4A3AYxZkXP08aFTGIYNMBIurWWJVkjtbrUznfSlM+pC3/5719mL7q/xSvaRQiDcuybJiPrpow/mjZxNYSqVmPPlcEUrbPPp4RH0WhDCR3Nh6TPrsFk975GV/mFRkTyCcCeUR0Dm9HRV4bS58nQHdyISLOESlanTEIDvFUCcS0E9cH8w7IBFZEO+5Q1C+eYkxF+4UB/ARFfgLxjnXuSD2whR4w8MD4V8MYMuyyQWUuZodR/NnjWOJJBnHfivZgrWz5z/aadcNc3ZkvV6PIBfCLg00DYVdSrn/BMYMXlO6CrFu0kZYg0dVShCbcFjXnKqYh8GDKjxjAaU5YWKgqzKc6+H6GCeAEoSq2V3wazhv0xYXzmfrFoF0w7H51LplrhEP7VvLxtWsNEbxcL1IPa411IO7ChSSKoMyWcwm6A5/dnJ7jsp9YM9SOjtv/mOJ5WlLtCwCEWp8/IGGmO/qGEIBAgHjGtJZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(4326008)(2906002)(316002)(86362001)(38350700002)(36756003)(6486002)(956004)(2616005)(31696002)(38100700002)(16576012)(52116002)(8936002)(83380400001)(66476007)(7416002)(5660300002)(186003)(66556008)(66946007)(8676002)(26005)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2FxMFpUMXlwTXhMd1BRMjNQdFJNY1lVTi9aQ2pTL1FkNlc4MjFEeVZYL0I4?=
 =?utf-8?B?S3g2S080dkZlVTRzTE55UWtGOHB1eituUjE1RHphakJDdGd0VjZhRm1ieTdn?=
 =?utf-8?B?VXIvSWdPbDlId3VCWS8rdDUwdTR3blNZSUF2cy9kei9BYkRVOXlWS05VMmhq?=
 =?utf-8?B?NW92T2Q0aFBWM25ielFDUEx5K2wycXRMZ3BrRkNvZkJUaHhxYUlkTVJkUTlj?=
 =?utf-8?B?QnFwYXRSZ0JuRis3dkxQR2pLZHl6ZHBYbG81cW45M3YrcmhSTUFuOGdqR2w4?=
 =?utf-8?B?dVBtNFRNaG9DOUl6UGYrb3Q2VUZOYk1HVU5vOHdBdlJ2dGhqVnQzc0tTU0Yv?=
 =?utf-8?B?cjdiTmFsM1BVSzE5R2xsYTVyd2xjTWh5RUlTa2ErL2w2VE4zWmw0cmRnaXJE?=
 =?utf-8?B?WGliV0pBWG5jaTJqUUoxK042aFZqYTl4ME5lbXpYMm1rMENUM3JtTi8yWU16?=
 =?utf-8?B?VllxemVIR1VsTWVNdG5Yc1hvZmdNTnRvT281Nzh2YUpNb0tGZEJvbmRkT0ZY?=
 =?utf-8?B?SURTS2dxb0JOYWVZRFJNWGo1VVVZZ0VkU2J6c1lESFUrQ2d6dkdFSi9CaFBG?=
 =?utf-8?B?MytwU2J6blYxVFYzSUwxUlg2WWRPL0I0R0F6NFM3QXlIU0hmdytzZnE1NWJz?=
 =?utf-8?B?TmJXc21UZ3R5UzJFOXo5K1FqYXVYSStqSzU1MVY5ZW5iU2labE1mVUQ4K0xI?=
 =?utf-8?B?SU5DeGhQT2FkYXd1Q3lRVDFCKzRnc0FXb2FkZVNWSjMvaC8rdi9rYkh1U1A3?=
 =?utf-8?B?TzAzQ3dHdjJrWDRTaFpjQUMvTERiY1dITVhuanF1VzlMZE5ML1F2NGRIWUdz?=
 =?utf-8?B?WUVhM1BkS01XS2NxQXpuc08xNVlkT01pRm1XditVNFFVbTI1R0ovZHVMYldr?=
 =?utf-8?B?RmdLUzB3Z3ZGdlRhU3IrNEhNcS9QYytiaVlYbnJJWGpGRjQ1aUpseUdWWmpp?=
 =?utf-8?B?U1FFODkxTWU4bzdnQVNseWQydzFQemx4MW1mdThqSUZjdFlhNDEzaE4veS83?=
 =?utf-8?B?UVlYdVNFcTNTb01FSDNDTExDUFhnRzB2U0lRVkVyeWpDSVB5bTVMYkpGOTVj?=
 =?utf-8?B?cnd6eEIweW5WU1N1RFF3VTBCVnhXYWduRGRQUDRUYVVzV2JLYUJCZHcveVVK?=
 =?utf-8?B?WTFPSE9aSGNsdkFGRWFtUS82UWh5Z1JDVzBkVm5HU29HTDJ2YjJaLzFkOEFC?=
 =?utf-8?B?WXNKSHhhRzg3NEVYdFVjTmRENWpXQnFJWUtxdVhOR0hGVmxrWm41T3lhdXll?=
 =?utf-8?B?YytTQ2RtU3c1VHVvSnZpMGFUSGJNYjVMdk5iT21kYWtoU21BVkUrRVBQbmpM?=
 =?utf-8?B?RnZGd29QSnRNQ2JyZ2FqSGhmSURtL0tKSThVcVNUL3d5ZFpobzlZWWdtcDU1?=
 =?utf-8?B?QTJnZkRwb2NTMXphMDJhY3BGd1B6U1UwNmptTGpMNkIvNTYzODA5aCtaRnFJ?=
 =?utf-8?B?S245b3NBaTg2UkVGdVZVdzM2eDc5MmlwOStnT1RCWk5nUlBBVEMzamJ4SjlE?=
 =?utf-8?B?QkpTVDRETWlZK3hsNHlkWUI3aE05eWl3WUlRSVN1S0hHQ212d0hTMEQwdlpq?=
 =?utf-8?B?WXNsdExYTmViZksvWlRzUk1adSthWC94SHNLU3dlVzdvbGpMb2NpZXR1eGkv?=
 =?utf-8?B?clVGK1RPNit0TFJpdDJ0RUo0RUxZUVU1dW5SWGZpazBqWnZodDk4MkdxRnZJ?=
 =?utf-8?B?eFpXa0F6WlVhQm9kdmRBMFJYR283STNsZVZ3RHh1eFZMaGdNZFdDZDVFejQy?=
 =?utf-8?Q?20VMiPm429yQz5fyqRj1KSdJ+ZteW9oF3xBjGM7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 304b2baf-f092-4f6e-96e2-08d97f64fd00
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 14:09:56.8802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0id4LaPn3QtHDwxEA8yswdGMFQsVDB3ni4jLSUhoAfeQWVMlFHEukUXZu1waVdMaE/P04sQYkfQ9fdU1So5W9vq1m2ixQqAgr5zg9tqJfVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1905
Received-SPF: pass client-ip=40.107.8.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
> object_property_add_child() fails (with &error_abort) if an object with
> the same name already exists. As long as QemuOpts is in use for -device
> and device_add, it catches duplicate IDs before qdev_set_id() is even
> called. However, for enabling non-QemuOpts code paths, we need to make
> sure that the condition doesn't cause a crash, but fails gracefully.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   include/monitor/qdev.h      |  2 +-
>   hw/xen/xen-legacy-backend.c |  3 ++-
>   softmmu/qdev-monitor.c      | 16 ++++++++++------
>   3 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
> index 389287eb44..7961308c75 100644
> --- a/include/monitor/qdev.h
> +++ b/include/monitor/qdev.h
> @@ -9,6 +9,6 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp);
>   
>   int qdev_device_help(QemuOpts *opts);
>   DeviceState *qdev_device_add(QemuOpts *opts, Error **errp);
> -void qdev_set_id(DeviceState *dev, char *id);
> +void qdev_set_id(DeviceState *dev, char *id, Error **errp);
>   
>   #endif
> diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
> index dd8ae1452d..17aca85ddc 100644
> --- a/hw/xen/xen-legacy-backend.c
> +++ b/hw/xen/xen-legacy-backend.c
> @@ -276,7 +276,8 @@ static struct XenLegacyDevice *xen_be_get_xendev(const char *type, int dom,
>       xendev = g_malloc0(ops->size);
>       object_initialize(&xendev->qdev, ops->size, TYPE_XENBACKEND);
>       OBJECT(xendev)->free = g_free;
> -    qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, dev));
> +    qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, dev),
> +                &error_abort);
>       qdev_realize(DEVICE(xendev), xen_sysbus, &error_fatal);
>       object_unref(OBJECT(xendev));
>   
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 1207e57a46..c2af906df0 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -593,26 +593,27 @@ static BusState *qbus_find(const char *path, Error **errp)
>   }
>   
>   /* Takes ownership of @id, will be freed when deleting the device */
> -void qdev_set_id(DeviceState *dev, char *id)
> +void qdev_set_id(DeviceState *dev, char *id, Error **errp)

According to recommendations in error.h, worth adding also return value (for example true=success false=failure), so [..]

>   {
>       if (id) {
>           dev->id = id;
>       }

Unrelated but.. What's the strange logic?

Is it intended that with passed id=NULL we don't update dev->id variable but try to do following logic with old dev->id?

>   
>       if (dev->id) {
> -        object_property_add_child(qdev_get_peripheral(), dev->id,
> -                                  OBJECT(dev));
> +        object_property_try_add_child(qdev_get_peripheral(), dev->id,
> +                                      OBJECT(dev), errp);
>       } else {
>           static int anon_count;
>           gchar *name = g_strdup_printf("device[%d]", anon_count++);
> -        object_property_add_child(qdev_get_peripheral_anon(), name,
> -                                  OBJECT(dev));
> +        object_property_try_add_child(qdev_get_peripheral_anon(), name,
> +                                      OBJECT(dev), errp);
>           g_free(name);
>       }
>   }
>   
>   DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
>   {
> +    ERRP_GUARD();
>       DeviceClass *dc;
>       const char *driver, *path;
>       DeviceState *dev = NULL;
> @@ -691,7 +692,10 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
>           }
>       }
>   
> -    qdev_set_id(dev, g_strdup(qemu_opts_id(opts)));
> +    qdev_set_id(dev, g_strdup(qemu_opts_id(opts)), errp);
> +    if (*errp) {
> +        goto err_del_dev;
> +    }

[..] here we'll have

if (!qdev_set_id(...)) {
   goto err_del_dev;
}

and no need for ERRP_GUARD.

>   
>       /* set properties */
>       if (qemu_opt_foreach(opts, set_property, dev, errp)) {
> 


-- 
Best regards,
Vladimir

