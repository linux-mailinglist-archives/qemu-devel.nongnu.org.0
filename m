Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2732E266B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 12:37:38 +0100 (CET)
Received: from localhost ([::1]:37928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksOw5-0000Ad-01
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 06:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ksOuf-000853-1e; Thu, 24 Dec 2020 06:36:09 -0500
Received: from mail-am6eur05on2132.outbound.protection.outlook.com
 ([40.107.22.132]:63360 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ksOuY-0003IJ-8X; Thu, 24 Dec 2020 06:36:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7KoMokmZUVvFTiSjETT289UDD43KeIr8TxYUgo2odh2RYSxTm+kGvU+AMuURuKpiQFShmAb6sTb7YnRxigFgzgElWR+PWm8AVc3U3ygOlsJvyQ3OGp5FrCz6YQBhmsBMgQ6+P/kvraj86MYxUJ0T7PCEn1XZYOU71tvpqKHBGllQgxvbvEmJnPObyTRmX3lZavMdqQtuay17uHGgL7kvPo92px3DQ+5982Hq/uYuU5iwBo+PlVhCZcWDP3qLPC0xlNuGEGh7emTV9ROyu9mcWbYKIumOXqU+sGeBRNzWYQYdJArBeDQNvBpIRgILtZ2vDmDcCizYAthZ2F5FHfOZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1WNTf98uSgFYOosoBtn7ggIIDkvg9giB3ZGojkckro=;
 b=NkQDOBguVOH7++Apf/UJOaWLm2RvSkhjasxN4YQA5rThTbPO87vbI3st544r1y6lBrBuWSC6nVNOs56DJzyTG4Jz/1623BjyfvHXLSWssmzajwtCxMlR4q2gHIcLAzQ/TuBHgPOluu+DF24qD1mUO9n3KsLwuX4bWw5tENsjYV8E6Bti9JGYU4Q9mwp0KnkpgfK0JR6ae/cM+cEvxONSPZKZqgB1MTxc4UpSyFSPgWDu/HzZeAm+kl+Ms2OZanSQ3XFpaaGhPELPbEyvoNkkcTGxk/Mu7XeEw0yymsxI2S9gq6SYjd9airkCkSs2wbK8wAjvex9MiTjKPihDJFxcMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1WNTf98uSgFYOosoBtn7ggIIDkvg9giB3ZGojkckro=;
 b=jjXG5C0Wq2DF1/J4N8QvOfuQQtD8eZzfGZyZv/v85IxcHSeXas6fG8hOkQZlG4EqJgeKBdND32FruPv/lGPBww2K82srUvMYwbH6CwZN7EWpYKzTBPPH3ncnAnEMenjc8ST0QhpT4aYjDuJhTYJ1UVod6I8OYzUwc1+3j/ol9T0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4278.eurprd08.prod.outlook.com (2603:10a6:20b:71::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30; Thu, 24 Dec
 2020 11:35:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::e4d2:71cd:7d3b:ad82]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::e4d2:71cd:7d3b:ad82%8]) with mapi id 15.20.3700.026; Thu, 24 Dec 2020
 11:35:58 +0000
Subject: Re: [PATCH v3 7/7] qapi: More complex uses of QAPI_LIST_APPEND
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20201223221102.390740-1-eblake@redhat.com>
 <20201223221102.390740-8-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <19bcf8f1-1a88-49ef-cd8e-5a7265c4c373@virtuozzo.com>
Date: Thu, 24 Dec 2020 14:35:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20201223221102.390740-8-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.110]
X-ClientProxiedBy: AM0PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.110) by
 AM0PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Thu, 24 Dec 2020 11:35:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a083d087-e022-4ff2-e800-08d8a8001559
X-MS-TrafficTypeDiagnostic: AM6PR08MB4278:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4278424E2CCEE5B823BC03B9C1DD0@AM6PR08MB4278.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5HV7w9qlYhkf3+knPJinka//ztkhdeZDoVTjU0aUzpJb5AO01v0SE08PYDjPwW5UjZvf/kmEhRufvb1D9g2c4cROeDhrPKQNsHcP2YzBoQNBYyisGA0cpwQ6Pke2DwDmbaBkRygbOrFSUzg5f7gfeYpVcV6LPeGackyg9lSPd7AzNIBQ+xCrqLDQ7YzAv1X58rvqGVIJeDcMN+u5Gf5/TUTqeMuwHgoYoeShUslpkoIuHjG+2NinTo4P7g7tS/q6axb/QXrD6QUjOWB8jj2mbKVRKnEZ+SQVubnHF+ZFzj/mvZh3JhFjhmVUJL3DbhcBmc00Lnj7l3fqVNFG8LnoeN5LIkgjR+Jr4dEiULjbAR7Vx0vVf6XrUgB/pa0/AqBB21icAfBBO0L0LVXWxmpWw58DFA2q1zpp4il9qXnsiVbf+5zodAvDkYQO5gTrTXaxd1fZUV9JhXQH9w+5H0Ukfc6a2rekS8zqPsa8tIexWLo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(396003)(376002)(346002)(5660300002)(478600001)(30864003)(2616005)(956004)(66946007)(7416002)(4326008)(2906002)(8676002)(66476007)(66556008)(6486002)(54906003)(316002)(31686004)(31696002)(16576012)(52116002)(36756003)(26005)(86362001)(186003)(16526019)(83380400001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Vm1kQWxCZkRSUWFyZHA3VC9QWGdHYko1Y0VKdWMydCtrK1BTQUxIRU5vT2pz?=
 =?utf-8?B?a001Z2RGWmthd2RVeEhPdUVjNEkzMDJ2TXJIV1FreFgyYzVxWXp5b2kwUC9a?=
 =?utf-8?B?Sll5RkwzWlRZQ05BK3RDWU5vUWhJSFE0aldzRXVLMzdDemIwNExTYWpGamRz?=
 =?utf-8?B?b3d1RFVIM2RXVU92bTloNXhYKzNHS3loYjJFU2pIK1N2VmpncW0wcVFDVGdr?=
 =?utf-8?B?Wk5zT2tUOTRFNkx4VnppSjBRVGhuV3RYUVVoYUZ4VDkrN3JqbU9MSW1KMjIx?=
 =?utf-8?B?SmRMUGltV1doTCtraHNoNHFwa2NiOU9QaSsxSTRLYWpXQUNoWjZpTVR5QmdS?=
 =?utf-8?B?OVh1cFZWME0vTTJFKzBaQWZZNXhWNWRQazNUYzZpRWNiV0pCbEZIRjRKWlFv?=
 =?utf-8?B?RlNzZ0UyUFlMdDZYQjNSL0hFeEV1WGJtYVpxRkV6TTd2UWZ4SW4zZEFiQXY2?=
 =?utf-8?B?MTYyRWZmdTdROFhlMUErMGsyUjFhMkp4ZFhyYlEyYWlDQmtJdWE5WTZJQ3hw?=
 =?utf-8?B?cTJERTNTM1lqd2Vqd2Z1SW96Zm5oREdWL0VuTnliL2JYM2Q1SXgxbmZ6V0gw?=
 =?utf-8?B?bVhYOGpTUTIyeW40a3lNVjljMVBXMkF5UXJBWnJzMkxlb25ELy8zbVRsVUN0?=
 =?utf-8?B?YmpVUStJUGRFamY0RHJyYisrTTdJeGRMT1pkS0tPZTNSTWtYQ09tbVJHTUpp?=
 =?utf-8?B?M09oSWo2VytSNUw2eW9EamFGN0xJQmJmRi9wbkJlVU1TeTdBeXpZK1EvcWhI?=
 =?utf-8?B?TWN1Q3dkYWE5a2cxZGxtb0hyWkR5eXRtdXRjeG5ram1jeXNJMXdsd1NzcXIy?=
 =?utf-8?B?ZHFPNWc1NXJERy9XMStOYTVBd1RPaytQTGxTeDB5aStVb01HMFd3S0ZkbEUz?=
 =?utf-8?B?V1VESnFKZHltY3ZCb29rb3RvRGpwWXVGR3ZuemYzY3pOV0hQN0UzT0lOUXRC?=
 =?utf-8?B?a3p0TUNIc2R0M21uTEppWlpSZ2FTK05tTC9MUkl4RkpzRzZNd0pjaHBuRS9Q?=
 =?utf-8?B?ZlV0VmFaRmRaQnNUV3hFNHBCNE4yUXN1Y0Q1eFlkWmZJRm1pQnVualRxWEQ1?=
 =?utf-8?B?QUppM214Sk1SdlJOTGNrM3pnVlhFc004R3U1cmpHbFNlbGl1VUkrZFpCbk9q?=
 =?utf-8?B?UTcyZld3dDF1U0piNDdiUWt3NkZDdGtCYkx6RktZVFI3eFNUNllTNS94a01U?=
 =?utf-8?B?QUlXdUxSQzBUa1EzbmtLaDNVTXBJcDVERnZOT2tXY2NsZURuQkJ2dDRxWXlL?=
 =?utf-8?B?UHFTWVc0ZnJIdTBVMHFvdTM3UWN3OHdzWE9RdTZyaFJqaDJEWi9udHdnQXNi?=
 =?utf-8?Q?tmsFE2SpwMJBArgSGOd56AzwRV9feEEYXm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2020 11:35:58.3967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: a083d087-e022-4ff2-e800-08d8a8001559
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/YQcn6bYKojV2bhQI/Kx8/teUk586fMNTPpqYdzmwkLZj5+jlh4eWL5hrgO7v/aN3+E83OB3zjxl0F4lxuLEz7WVLga7F4orSVJ32lZ15U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4278
Received-SPF: pass client-ip=40.107.22.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:GLUSTER" <integration@gluster.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:GLUSTER" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 armbru@redhat.com, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

24.12.2020 01:11, Eric Blake wrote:
> These cases require a bit more thought to review; in each case, the
> code was appending to a list, but not with a FOOList **tail variable.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---

[..]

> diff --git a/migration/migration.c b/migration/migration.c
> index 805712488e4d..a676405019d1 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -784,29 +784,21 @@ void migrate_send_rp_resume_ack(MigrationIncomingState *mis, uint32_t value)
> 
>   MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error **errp)
>   {
> -    MigrationCapabilityStatusList *head = NULL;
> -    MigrationCapabilityStatusList *caps;
> +    MigrationCapabilityStatusList *head = NULL, **tail = &head;
> +    MigrationCapabilityStatus *caps;
>       MigrationState *s = migrate_get_current();
>       int i;
> 
> -    caps = NULL; /* silence compiler warning */
>       for (i = 0; i < MIGRATION_CAPABILITY__MAX; i++) {
>   #ifndef CONFIG_LIVE_BLOCK_MIGRATION
>           if (i == MIGRATION_CAPABILITY_BLOCK) {
>               continue;
>           }
>   #endif
> -        if (head == NULL) {
> -            head = g_malloc0(sizeof(*caps));
> -            caps = head;
> -        } else {
> -            caps->next = g_malloc0(sizeof(*caps));
> -            caps = caps->next;
> -        }
> -        caps->value =
> -            g_malloc(sizeof(*caps->value));
> -        caps->value->capability = i;
> -        caps->value->state = s->enabled_capabilities[i];
> +        caps = g_malloc(sizeof(*caps));

While being here, probably better use g_malloc0, for safety in future

> +        caps->capability = i;
> +        caps->state = s->enabled_capabilities[i];
> +        QAPI_LIST_APPEND(tail, caps);
>       }
> 
>       return head;
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index ed4131efbca6..a9643ff41961 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1705,7 +1705,8 @@ void hmp_closefd(Monitor *mon, const QDict *qdict)
>   void hmp_sendkey(Monitor *mon, const QDict *qdict)
>   {
>       const char *keys = qdict_get_str(qdict, "keys");
> -    KeyValueList *keylist, *head = NULL, *tmp = NULL;
> +    KeyValue *v = NULL;
> +    KeyValueList *head = NULL, **tail = &head;
>       int has_hold_time = qdict_haskey(qdict, "hold-time");
>       int hold_time = qdict_get_try_int(qdict, "hold-time", -1);
>       Error *err = NULL;
> @@ -1722,16 +1723,7 @@ void hmp_sendkey(Monitor *mon, const QDict *qdict)
>               keyname_len = 4;
>           }
> 
> -        keylist = g_malloc0(sizeof(*keylist));
> -        keylist->value = g_malloc0(sizeof(*keylist->value));
> -
> -        if (!head) {
> -            head = keylist;
> -        }
> -        if (tmp) {
> -            tmp->next = keylist;
> -        }
> -        tmp = keylist;
> +        v = g_malloc0(sizeof(*v));
> 
>           if (strstart(keys, "0x", NULL)) {
>               char *endp;
> @@ -1740,16 +1732,18 @@ void hmp_sendkey(Monitor *mon, const QDict *qdict)
>               if (endp != keys + keyname_len) {
>                   goto err_out;
>               }
> -            keylist->value->type = KEY_VALUE_KIND_NUMBER;
> -            keylist->value->u.number.data = value;
> +            v->type = KEY_VALUE_KIND_NUMBER;
> +            v->u.number.data = value;
>           } else {
>               int idx = index_from_key(keys, keyname_len);
>               if (idx == Q_KEY_CODE__MAX) {
>                   goto err_out;
>               }
> -            keylist->value->type = KEY_VALUE_KIND_QCODE;
> -            keylist->value->u.qcode.data = idx;
> +            v->type = KEY_VALUE_KIND_QCODE;
> +            v->u.qcode.data = idx;
>           }
> +        QAPI_LIST_APPEND(tail, v);
> +        v = NULL;
> 
>           if (!*separator) {
>               break;
> @@ -1761,6 +1755,7 @@ void hmp_sendkey(Monitor *mon, const QDict *qdict)
>       hmp_handle_error(mon, err);
> 
>   out:
> +    qapi_free_KeyValue(v);

alternative would be to define v as g_autoptr inside while-loop body and use g_steal_pointer() for QAPI_LIST_APPEND().

>       qapi_free_KeyValueList(head);
>       return;

[..]

> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index a5058a3bd15e..10ee740eee1b 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2119,17 +2119,17 @@ void qmp_guest_suspend_hybrid(Error **errp)
>       guest_suspend(SUSPEND_MODE_HYBRID, errp);
>   }
> 
> -static GuestNetworkInterfaceList *
> +static GuestNetworkInterface *
>   guest_find_interface(GuestNetworkInterfaceList *head,
>                        const char *name)
>   {
>       for (; head; head = head->next) {
>           if (strcmp(head->value->name, name) == 0) {
> -            break;
> +            return head->value;
>           }
>       }
> 
> -    return head;
> +    return NULL;
>   }
> 
>   static int guest_get_network_stats(const char *name,
> @@ -2198,7 +2198,7 @@ static int guest_get_network_stats(const char *name,
>    */
>   GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>   {
> -    GuestNetworkInterfaceList *head = NULL, *cur_item = NULL;
> +    GuestNetworkInterfaceList *head = NULL, **tail = &head;
>       struct ifaddrs *ifap, *ifa;
> 
>       if (getifaddrs(&ifap) < 0) {
> @@ -2207,9 +2207,10 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>       }
> 
>       for (ifa = ifap; ifa; ifa = ifa->ifa_next) {
> -        GuestNetworkInterfaceList *info;
> -        GuestIpAddressList **address_list = NULL, *address_item = NULL;
> -        GuestNetworkInterfaceStat  *interface_stat = NULL;
> +        GuestNetworkInterface *info;
> +        GuestIpAddressList **address_tail;
> +        GuestIpAddress *address_item = NULL;
> +        GuestNetworkInterfaceStat *interface_stat = NULL;
>           char addr4[INET_ADDRSTRLEN];
>           char addr6[INET6_ADDRSTRLEN];
>           int sock;
> @@ -2223,19 +2224,14 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
> 
>           if (!info) {
>               info = g_malloc0(sizeof(*info));
> -            info->value = g_malloc0(sizeof(*info->value));
> -            info->value->name = g_strdup(ifa->ifa_name);
> +            info->name = g_strdup(ifa->ifa_name);
> 
> -            if (!cur_item) {
> -                head = cur_item = info;
> -            } else {
> -                cur_item->next = info;
> -                cur_item = info;
> -            }
> +            QAPI_LIST_APPEND(tail, info);
>           }
> 
> -        if (!info->value->has_hardware_address &&
> -            ifa->ifa_flags & SIOCGIFHWADDR) {
> +        address_tail = &info->ip_addresses;
> +
> +        if (!info->has_hardware_address && ifa->ifa_flags & SIOCGIFHWADDR) {
>               /* we haven't obtained HW address yet */
>               sock = socket(PF_INET, SOCK_STREAM, 0);
>               if (sock == -1) {
> @@ -2244,7 +2240,7 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>               }
> 
>               memset(&ifr, 0, sizeof(ifr));
> -            pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->value->name);
> +            pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->name);
>               if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
>                   error_setg_errno(errp, errno,
>                                    "failed to get MAC address of %s",
> @@ -2256,13 +2252,13 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>               close(sock);
>               mac_addr = (unsigned char *) &ifr.ifr_hwaddr.sa_data;
> 
> -            info->value->hardware_address =
> +            info->hardware_address =
>                   g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",
>                                   (int) mac_addr[0], (int) mac_addr[1],
>                                   (int) mac_addr[2], (int) mac_addr[3],
>                                   (int) mac_addr[4], (int) mac_addr[5]);
> 
> -            info->value->has_hardware_address = true;
> +            info->has_hardware_address = true;
>           }
> 
>           if (ifa->ifa_addr &&
> @@ -2275,15 +2271,14 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>               }
> 
>               address_item = g_malloc0(sizeof(*address_item));
> -            address_item->value = g_malloc0(sizeof(*address_item->value));
> -            address_item->value->ip_address = g_strdup(addr4);
> -            address_item->value->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV4;
> +            address_item->ip_address = g_strdup(addr4);
> +            address_item->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV4;
> 
>               if (ifa->ifa_netmask) {
>                   /* Count the number of set bits in netmask.
>                    * This is safe as '1' and '0' cannot be shuffled in netmask. */
>                   p = &((struct sockaddr_in *)ifa->ifa_netmask)->sin_addr;
> -                address_item->value->prefix = ctpop32(((uint32_t *) p)[0]);
> +                address_item->prefix = ctpop32(((uint32_t *) p)[0]);
>               }
>           } else if (ifa->ifa_addr &&
>                      ifa->ifa_addr->sa_family == AF_INET6) {
> @@ -2295,15 +2290,14 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>               }
> 
>               address_item = g_malloc0(sizeof(*address_item));
> -            address_item->value = g_malloc0(sizeof(*address_item->value));
> -            address_item->value->ip_address = g_strdup(addr6);
> -            address_item->value->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV6;
> +            address_item->ip_address = g_strdup(addr6);
> +            address_item->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV6;
> 
>               if (ifa->ifa_netmask) {
>                   /* Count the number of set bits in netmask.
>                    * This is safe as '1' and '0' cannot be shuffled in netmask. */
>                   p = &((struct sockaddr_in6 *)ifa->ifa_netmask)->sin6_addr;
> -                address_item->value->prefix =
> +                address_item->prefix =
>                       ctpop32(((uint32_t *) p)[0]) +
>                       ctpop32(((uint32_t *) p)[1]) +
>                       ctpop32(((uint32_t *) p)[2]) +
> @@ -2315,29 +2309,18 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>               continue;
>           }
> 
> -        address_list = &info->value->ip_addresses;

address_tail is used only here, I'd prefere it to be initialized here.

> +        QAPI_LIST_APPEND(address_tail, address_item);
> 
> -        while (*address_list && (*address_list)->next) {
> -            address_list = &(*address_list)->next;
> -        }

Hmm. It's wrong. Original code searches for the end of the list, but with the patch we just APPEND to the head of non-empty list.

As I understand, list may be non-empty if info comes from guest_find_interface, that's why this loop is here.

> +        info->has_ip_addresses = true;
> 
> -        if (!*address_list) {
> -            *address_list = address_item;
> -        } else {
> -            (*address_list)->next = address_item;
> -        }
> -
> -        info->value->has_ip_addresses = true;
> -
> -        if (!info->value->has_statistics) {
> +        if (!info->has_statistics) {


So, with squashed-in:



diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 10ee740eee..c4815d4b0d 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2229,8 +2229,6 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
              QAPI_LIST_APPEND(tail, info);
          }
  
-        address_tail = &info->ip_addresses;
-
          if (!info->has_hardware_address && ifa->ifa_flags & SIOCGIFHWADDR) {
              /* we haven't obtained HW address yet */
              sock = socket(PF_INET, SOCK_STREAM, 0);
@@ -2309,6 +2307,10 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
              continue;
          }
  
+        address_tail = &info->ip_addresses;
+        while (!*address_tail) {
+            address_tail = &(*address_tail)->next;
+        }
          QAPI_LIST_APPEND(address_tail, address_item);
  
          info->has_ip_addresses = true;





Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

