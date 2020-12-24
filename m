Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D902E25DE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 11:12:46 +0100 (CET)
Received: from localhost ([::1]:47550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksNbx-0007ws-6c
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 05:12:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ksNaf-000733-Fs; Thu, 24 Dec 2020 05:11:25 -0500
Received: from mail-db8eur05on2112.outbound.protection.outlook.com
 ([40.107.20.112]:35424 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ksNaZ-0008Ls-B0; Thu, 24 Dec 2020 05:11:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elo2dUiO0XRMhnrnBl01IHP1pFJt2pYEkO4XHtu+GkRXiF9rFYIDAeJuVB/kFX2RmQYAt+9G7CoPSpnEB78IrhFamcUwZLdEQRPu0R1AMkChFvnge4aY3fnN52P+wF9CBh+Bov/tl6pnidy4/AgVTybC/VNynpyCf/di475Q9/nlFR7DYmBqv4H9Q8C2bvVAel5oWVJr0ZBQTc/RTZZ1xC8YZSqgK5O70nghOxpgOMODsVcrXfDkqmrCit8HMD/hd2niAdRDMuTZwk1MRzfGozbE022z4EAc81+MAoxdLISxxyxMqoI1qu89588TVq3aMDw3rSJ92lnLjo8w5aVYzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZyERE4wZEm9KJtKzyzsnPS2DV0bGa/kzRrdz/0K4IM=;
 b=fRXT1h62ZPQ/S+F8YOYxMBe5g7cs4AcCW5GxviDVLY0owdPeTPhpqGETxkdXuen5VrDZL+Zsg77Z5pQNJ219/HrX+wC/B1DY59576NEsPmmQdDyFF+EraGcQS52lYkKTNir3rSnt3HXmqxesfJ3QvgpenBH2cHw3RbwQRHLX6pXFiOd8l9LJb5tMtaaAN+VhVP7S4VVz7pfkrE8XoedO0Vo6aTe8OestIJ7ED7ltcPrhkskLDv51Qv4z9F+WrB5X8dqdugVSTofzYuhpVlr+Hy/eoifE1kUUpsFrEekTxzutzUO9IfnMmMhGDQQ8CH8Cr95bpcN2Ui12LrqZDuFUdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZyERE4wZEm9KJtKzyzsnPS2DV0bGa/kzRrdz/0K4IM=;
 b=Lj+xaSeUCCLDt+3Kv1ldwWERGBCMXbKa0a7Gr2hkUJP7f640Ogf++EXxVwPLZ5SldtqtvLbToiKXqyU21/u1E5pkYFMa6XKHdWHFo4YxQcRycPeXNYVFWJ0z+tNlfiLzjE5bja7inR/Cc3MwR3ZRE+x2YEuVLNuu7pbn4u0fcAM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Thu, 24 Dec
 2020 09:56:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::e4d2:71cd:7d3b:ad82]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::e4d2:71cd:7d3b:ad82%8]) with mapi id 15.20.3700.026; Thu, 24 Dec 2020
 09:56:11 +0000
Subject: Re: [PATCH v3 6/7] qapi: Use QAPI_LIST_APPEND in trivial cases
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20201223221102.390740-1-eblake@redhat.com>
 <20201223221102.390740-7-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fa884130-89f7-2e54-a9ac-b23979da7446@virtuozzo.com>
Date: Thu, 24 Dec 2020 12:56:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20201223221102.390740-7-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.110]
X-ClientProxiedBy: AM4PR0501CA0053.eurprd05.prod.outlook.com
 (2603:10a6:200:68::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.110) by
 AM4PR0501CA0053.eurprd05.prod.outlook.com (2603:10a6:200:68::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Thu, 24 Dec 2020 09:56:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78d6d4e3-62ea-4e29-4303-08d8a7f224dc
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4691F3CF216FA2BE8BCE8411C1DD0@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AFAK4OkwthhieljJbq1Auwa58WoeXiON3bJwHeDUGqZYgGR8KkN46NTPneBY/DKYG1uKBlMgf1R6nBEUGikbOQ3aMk75jHrifKLwhnQJc2Z6+0GuJQVsilFV9O8y8qwwYjm8m4FGCj6QWU1LsI6xbVBVwpjkfPNB2eiLzBU8AY1o3wwIBzbiO8XKQ8QrOu7HQNJQzSxWiqEFiEr2IUB93Ms8uFPPYqoEc3iZIhsUS20+Gwtj7al/GElCt3JOIoMhthkMyfx9CXU9k1Bg2lYO9aWzsOwoUTBXAvgAjMR3+mDnfM5BmCxnXe62ZB8yuP2v4Lr4e3pEvVRfaJVrTZCq7ykdMR2HqTjB5Kl5IV3tI7p9U1lrYMAc61coeIHbKiwQ5hm5dmya+NbKonzDyRMkxgPhrchLHdRjJEGpecMZ1bur1/t4Cl2LcTjWSLgEu8g2c0i9kmrq/efp6KRamlPHrIG7ox66WtozjmymY4vaB+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(396003)(136003)(376002)(346002)(26005)(16526019)(31686004)(86362001)(8676002)(31696002)(4326008)(6486002)(2616005)(956004)(16576012)(478600001)(316002)(5660300002)(66476007)(66946007)(36756003)(66556008)(8936002)(54906003)(2906002)(186003)(52116002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RGpRY3hoWmFXM0pCZzZYZWZwUGViMi9xdVpScUZHeEM0NVRFWmM1WDFHdjFX?=
 =?utf-8?B?VDVJUm9xOWpVTU0zcThJbXlTcitQUnVmWkswZVNTV2tmM0pidnpxOVNLYWtF?=
 =?utf-8?B?cytLZXFDZVJoclN4R2tNR25zSXN6eUEzbnpGeXZXc0xUZHkyR1ZHTzQvdHZw?=
 =?utf-8?B?KzFDOHJCMkhRdWF1MzRDbUN5WWNrL0ZOQmU0cTNBaEhCdFZKVXlROGlKM2RH?=
 =?utf-8?B?ZjFTYnExNEhWQU0xK3J0NUp5YkVjcTgrYUZnMTROdWk3Ri9leFRRS05pQTlj?=
 =?utf-8?B?R2xXSUxQTWp6NWVjUnhnSkpCYktObktnVU5GYTFtVHdjMG1kSlRNMTE4S0ZO?=
 =?utf-8?B?MXlWaDBGZTY5Tnd4RXp3QUFLVkxmWDFEODRNYmh3TjlqNTJvRlpVZ3d6T0Rz?=
 =?utf-8?B?ZXhrQlhPY0dQSVVFdFZMVzkwZUJ4NUtxdW5PWVdwOHBLbnNwSkZtZmtGTnN4?=
 =?utf-8?B?Z09wcGZNT1dYTFVzVDJJb0taNS9xSDErZTdSNDYvTCtlUGhsTlZrZVc2MGNF?=
 =?utf-8?B?YXFhN1lDLzF6Mk4wUVVONENscHRsSEF6VTljdE5ER0c0L0tUaDFXbmNuNXF1?=
 =?utf-8?B?Tk8yckI3NXM1NmkvS2EvR3kxYllqc3lCYURHRm8yZmEvWms4Ynl5TE5yVm4z?=
 =?utf-8?B?bTU4cytjZmc1UC9FN2xGN3MzRCtoZGJGSEJRZSthTXlFdDAvL0dtb3Q1SGV5?=
 =?utf-8?B?Y3VzUStCWTIzY1A3OWVmSDRraXRJcUhMdHFQNlRiZXZRWmV0d2hlOUZiTTR1?=
 =?utf-8?B?RnZyQjFTdGVBMkJFcWhrSUVENms3ejBGV1ZrOHVwTWtwVm0xdmVlbkh4OUIr?=
 =?utf-8?B?NUg0UDRvQ1ludVFMSjl5bkRUbC9acG5JUmZ5Wk83bkVZYW8wTWc5T0k5MjZR?=
 =?utf-8?B?ZW0zV0lham9Ib21GYVJOMmpwYXFtVXc5VE9DT1FhR0ZHT285cTMvM3ROU1cv?=
 =?utf-8?B?YVl4TXhKUFpxdW13SmhscUZRb3pzMC9nZ05UUE1raVRXU2Zmd3VsNkVSc3Rv?=
 =?utf-8?B?VE1ERE5nR1FXWithZkpWaXhwSFFpbUlnR2VkaG1wRXB4bDFlM0lkQW5EbzVz?=
 =?utf-8?B?UUNxN1E5VzQvaXVtYlRWOGJqQzRsdTlLN1hIMElFVFFqMVNRWVBRWUNvZW1F?=
 =?utf-8?B?bGs4RFlKM29nSE5DZ3gyV2JudEJ0bm4yVlowUE1LWHRCVjRpS05NWnEwSjk5?=
 =?utf-8?B?bk93bVRoZU85Z29wU0M5MUt1VEFyZUU2MnRPWFZYRkRSeTBVS2tReDF4Vngy?=
 =?utf-8?B?b3g3UHJwbStRdlBsaHFUZ0dTa0plTkJQNDBWZVVDSitUd095aDR3VUVkZGF2?=
 =?utf-8?Q?v8N9j/jcOJjCc6Nl05czdR9zY+tdTsdEJJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2020 09:56:11.4079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d6d4e3-62ea-4e29-4303-08d8a7f224dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHK6zb7bcWN44Nvst0a1vEEtd7R2+UvoOe81uD+vhNHKTQXTfNk/WCUoHpHGnEewy4NmoQuWRo6hegfUqc4/orZ5vHdZW6JUl3XHG1ZzZOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.20.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:Dirty Bitmaps" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "open list:Trivial patches" <qemu-trivial@nongnu.org>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, armbru@redhat.com,
 Max Reitz <mreitz@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

24.12.2020 01:11, Eric Blake wrote:
> The easiest spots to use QAPI_LIST_APPEND are where we already have an
> obvious pointer to the tail of a list.  While at it, consistently use
> the variable name 'tail' for that purpose.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---

[..]

> --- a/monitor/qmp-cmds-control.c
> +++ b/monitor/qmp-cmds-control.c
> @@ -104,17 +104,16 @@ VersionInfo *qmp_query_version(Error **errp)
> 
>   static void query_commands_cb(const QmpCommand *cmd, void *opaque)
>   {
> -    CommandInfoList *info, **list = opaque;
> +    CommandInfo *info;
> +    CommandInfoList **tail = opaque;
> 
>       if (!cmd->enabled) {
>           return;
>       }
> 
>       info = g_malloc0(sizeof(*info));
> -    info->value = g_malloc0(sizeof(*info->value));
> -    info->value->name = g_strdup(cmd->name);
> -    info->next = *list;
> -    *list = info;
> +    info->name = g_strdup(cmd->name);
> +    QAPI_LIST_APPEND(tail, info);

Original logic is prepend in this hunk.

Without this hunk:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

>   }
> 
>   CommandInfoList *qmp_query_commands(Error **errp)

[..]

> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4817,20 +4817,17 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose);
> 
>   /* Build a list with the name of all features on a feature word array */
>   static void x86_cpu_list_feature_names(FeatureWordArray features,
> -                                       strList **feat_names)
> +                                       strList **tail)
>   {
>       FeatureWord w;
> -    strList **next = feat_names;
> 
>       for (w = 0; w < FEATURE_WORDS; w++) {
>           uint64_t filtered = features[w];
>           int i;
>           for (i = 0; i < 64; i++) {
>               if (filtered & (1ULL << i)) {
> -                strList *new = g_new0(strList, 1);
> -                new->value = g_strdup(x86_cpu_feature_name(w, i));
> -                *next = new;
> -                next = &new->next;
> +                QAPI_LIST_APPEND(tail,
> +                                 g_strdup(x86_cpu_feature_name(w, i)));

actually, fit in one line...

>               }
>           }
>       }

[..]

-- 
Best regards,
Vladimir

