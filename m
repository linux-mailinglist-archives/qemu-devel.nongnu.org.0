Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB6941D5D2
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 10:57:11 +0200 (CEST)
Received: from localhost ([::1]:52718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVrsM-0002Lz-GC
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 04:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mVrqQ-0001Ei-GM; Thu, 30 Sep 2021 04:55:10 -0400
Received: from mail-eopbgr70127.outbound.protection.outlook.com
 ([40.107.7.127]:55105 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mVrqN-0002SP-IP; Thu, 30 Sep 2021 04:55:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7MgAk7fhDJRWQowLxDEK2E7hlpiBfehnzcIUqrQogWOuvcvsL7aFDHkWhbea8JMvoLr85R4Xs+8PaDvScn78HIxhRpP3D+/L7dfi/JqwHzxZuV793OpraoFtoWYcQ0pt0hXTKq8V7H6gf0JdQ5Nq2NMix/m91C1FcqLZcIwyF1wa1TF1r/mpW/4DAEYJZtzLz7GtJ52OcV7B8S6eriF+EjtXZKfP87TXz37XswG+E6AULCSuOEEVFzpQUmnc31Fn2AV/N243qCWv0+R10jcYoUDPEc9CNbtiFnMMNABR6fEDnBdUOHQ41xg5bphLbGc1cYeqdQgDp2UjwLqonEcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=EsDgTcGO1hIP4jVfXLBcXeYyp1iTULBUtc0t/LqzUAs=;
 b=kybwdv2gxGKpFy/jUXxvqg400/t6MQdKL4mnHb2OhNilm2MFwp4z5T/9Efgwy00no2IWN2wxdcG5Zn+sRnW6HZ1QDoc/RAZZWMch1pqfeGC6YaFl1B/9pYv251Yay5vdqwHF0rijdC2TeTFFZ0OVKxGqAIeqxIN2kU8+utZTqruZ5rDZWkmTnyEuhuaLGH/L2rJPFbP/MS9sz5sAtu5iBMpTG1vvCkh4bh8aQIH7/kNeGRYr3CkENXPbnr3nCB37ZWLTMQlh8QOQHgXqbHFdRts3jU8IzQo2Jah9SAPlAor+IsTTIoGaJtGTcePEu0gcqrL2/LFmseQBWfIynifNKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsDgTcGO1hIP4jVfXLBcXeYyp1iTULBUtc0t/LqzUAs=;
 b=KrVcgyH+zKsN+NsGGFA0QC2JZNNh7JcWuVWtxKlDixmtonnefhoRPglMfFKM0Eb6rXRIX4dcdJTS1DqY4P6EuTnpwDYMezRhsF82phzXLmcFrvnen8GcP99HcM3iNajFW5S+xDm/IBU1RIW/l5FWq6sUuYEcQ6usA0+i2vsAn6E=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 08:55:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 08:55:04 +0000
Message-ID: <c9a4f4ce-b626-18a4-326a-03ebfe5b5aee@virtuozzo.com>
Date: Thu, 30 Sep 2021 11:54:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] nbd/server: Add --selinux-label option
Content-Language: en-US
To: "Richard W.M. Jones" <rjones@redhat.com>, eblake@redhat.com
Cc: alex.bennee@linaro.org, f4bug@amsat.org, thuth@redhat.com,
 wainersm@redhat.com, willianr@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, pbonzini@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, berrange@redhat.com
References: <20210930084701.3899578-1-rjones@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20210930084701.3899578-1-rjones@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.15] (185.215.60.227) by
 FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.7 via Frontend Transport; Thu, 30 Sep 2021 08:55:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b199cff5-ed98-4250-e999-08d983effe8c
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1972349212888E8C36601405C1AA9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:164;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oKqwgp2cM7PRXIUJa7zv+JNNTH4SNrFVCLb+ZlGoIB1lBWlUEuPiorDVNrDgiTaPDL7oaHhSF2oYhERRKaIHvbmah9zUM3O7cGO0OyDs1GZQJEw6rDCJAbhy/nmYJ2viD1nNAwBJGPQlBE1fz/4apSLdFj9xNo86cgNRi3X8MDCVcWO/rYf3fewEa3Ts3CBTNmEbA2h1HErG46xcP9WsDq7nWdc5gEAyE7dYji/CgkpSvPkZE1QcFTrJeWjfetZSHkmCJ9gaeIhA9OnwMjYoeeAsFSDl2Z6kVl8fh/s/eovgtXp0zdgzfT0rQXiyijzTOiVoTTNWJDvnuKUtPgZXeqh7FKyWdhrAePZrCFEEtCYltkJ2Rocp29BOv7Z2vU/8yV4w/onrsnYraB4fCUJI8w3zuPmjL0U4n7El3KFlz2DoVaShIFJvM0yvcafdxFtWo8o4kY64Ko2voPHdC/SFqf15az+sXZ4yZZ1AGTJYSyXw5u+LdsTIAhJ+DICKuGt1VQDhjqRRPDKavskLbjnyce3Bt9liLw2eey7PJc/kn0/MhFi7Fs45wvQDnzSXUs3GBUnw5k+tyIRe6QaPRUNuoBomoIjQE4EBXBcswICBEQu9QLAq+N5OoKZCbWoPcBj0tvGi6QQn1ZGO7FHq8Upw6cc2GsO46MTUN1bLnka4PsyFpg1ZJU13nX/6G5JvmGm92shag1QYmPQBBDdc3QynVJvPybEXAdUlPv+1SHdNculARUUKfNVlJ3WVQKmJeMEXDpueM8TzWME82VFtCOlYxrAJuDdL2v/d99r1MY3xGis4ImTySjvayK1BcJ3+jNlEkztyJas1J7RaGYbbdPHd58rTUGl/4zq/D/2Gc9oXfRA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(52116002)(66946007)(66556008)(66476007)(83380400001)(4326008)(6666004)(5660300002)(38100700002)(86362001)(186003)(2906002)(966005)(31686004)(508600001)(316002)(8936002)(16576012)(31696002)(36756003)(6486002)(7416002)(956004)(26005)(8676002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODdPU1pKUW5nMXZzTk42SlhwNFQzMkNocklXL0VqZEY3WXJudDNJVHRmcTJH?=
 =?utf-8?B?c2lVaXE0SktxSUVGTnorb3pYUElkejNRN3BJRmpyUGFoQ2kvZlo5ZVgwUlhM?=
 =?utf-8?B?cmxaT1FvS3hTT1dheHhxS3cwNWk2SEZNS1RrVi9kRDMvNmFmeFZMWHRzMDBU?=
 =?utf-8?B?d0tNN3ZQQWF6SEhzb1lPc1Y0QkVFSkxwZVppZnJmU1NnOXFvRnEzbXVvNVUx?=
 =?utf-8?B?SEoxTUVTbmpYTEEvTnUrQjdKY0VWRkl0YlRBSWRGbWJOMGZxNXlJNDBoWkdL?=
 =?utf-8?B?RGdrZ0xwTVlXUm1UTGFHRFpQYTNKVFdVUFN2WW0zRDhsZHBsdWlzUndKT3FK?=
 =?utf-8?B?VlpDdGpxWWhJMVNsVVZzZVBBSFk2Y2xzVnNsa29DQ0VyQkFIL01qOURUeGFo?=
 =?utf-8?B?TUQweThFcmV5djYrOENTYS9uVlg4WWZaTTVJQlAwdUFWRUxzblhKL0pOeVJF?=
 =?utf-8?B?L0VyTFZNbzlzVFQvdDhRMzhNM1hEc2Z1cUZvc1NyT1RUZHJrVHpiVFB3VGJB?=
 =?utf-8?B?YUhOL0xjNE1Wai9wajgxc1lDbFNyeEMzZlVtcysvKytHTjcwZE5NZ2JFejRp?=
 =?utf-8?B?bWJNYkg4TTNBRVJuZzBHVG5rdk0vNmhPeTVMSVd2MHh3ci9TK3hCclJZbXlz?=
 =?utf-8?B?cjh3Vk9tNndYOWhaR0N0L053a1hwWStQaWxGSEw4WVBHd1pmeC9SWEtudFlp?=
 =?utf-8?B?c2lENDJSeGRzemFEdzBiZm8ydU9ab1JJQkJkQklSd0I1YlB3dHN5MkJCRnFr?=
 =?utf-8?B?QWoxQXJYN28vajNIKzU2b1czL1c4dWliZHpFNVZmQ2FKejQ5RUJJaEF0bFdC?=
 =?utf-8?B?blhCRjNnMy9uWTcyYmhMRCtMcGp6eENxWEJZYW1KNnNIejIxNHdjRDd3RHZv?=
 =?utf-8?B?ZXpFTnZYUEkzTHVLQ0l2YmJlNDg2VDU5cUJ2OWwrVThMTnBBWDJNWmZlQ3p4?=
 =?utf-8?B?ZS9Ta0Q0NHgwVTNmRkpMWmZVTHlUczFNSDQ0REtZem1GQmZGRGttdlpaalll?=
 =?utf-8?B?QnR0QnlLT0hMRi85bTdPQlFDRGJHcWE1VjVaejY4ZDRyK1c1S24wcllSbVNR?=
 =?utf-8?B?YUJHVmh0WlBrQ1VQRXlXa2g1aFRpT0Z1bXNScmhLVlVtakhheldERXppRUVL?=
 =?utf-8?B?VHNKamwwVmRCZUNsc3NuYnZ2cnNIYTJ0TGVhWEhGbmxRRitUQUdRYXJkc0ts?=
 =?utf-8?B?REpGajFLRWVjRGk2UDhaVE5yeWZpTVA5bm1xaWhWNHM5N1F3UFdYUkFSQ0Nz?=
 =?utf-8?B?bXZaWUJyWW5Lc2hGdnlXYSt6QlgxUVNEM0IyY2ZCVHI5OGIyWUdZeTF1cE9B?=
 =?utf-8?B?SzNKYnpUNTBhY1hJT0FKVWVLTjMzWmM4Yks1c2NTcnloK2FVa3h3a1REY1Jt?=
 =?utf-8?B?ZkZKMUtUTUJPblBXRHE4NE1QQVBFWmFVUklES0F5VXV6ZFNqaHRZQURSRWZj?=
 =?utf-8?B?ZmhZVkQrbWJnazZwMFB0SVQ0bUh1NXUxRFRWOTRCV0lLUTFCWlBDVENkVjRT?=
 =?utf-8?B?WnhsWThlcGo4Lythc2VnZURSM0ZPY05MVXJwTmNvUFlUZXBZcHRnTmtZbHA2?=
 =?utf-8?B?U2RlSk80OCtJSWJuUG03dEdWV01FUzRnbmxrWkpQL1VqVWJqaERRSGc5RDV4?=
 =?utf-8?B?RmZ4TjloUG9QVGFQV2xwdXRsTTdmei9QdXRVaDAySWN5WFVVTFV4RzN3WVdi?=
 =?utf-8?B?bWlUeEFpYkMyQmdCZTJMUXBCQ3JNeFFGR1l3TEQ4RXdjdG4zRHFwU2lvVVlB?=
 =?utf-8?Q?Wd+8OGKcv1bFGbdVLPdirSq6EDQVrxtyxMReOmc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b199cff5-ed98-4250-e999-08d983effe8c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 08:55:04.1432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3UgZMj8jPK6ZpRuSza7g2DjMvv6mhkSWbf65FMCuLdoM5fPOqZIjXlDZUfYV7U4CC/fqKjqImpNnssjUjOWV+fqzl6Iz+rQ/hoBjPNMs3n0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.7.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.03, RCVD_IN_DNSWL_NONE=-0.0001,
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

9/30/21 11:47, Richard W.M. Jones wrote:
> Under SELinux, Unix domain sockets have two labels.  One is on the
> disk and can be set with commands such as chcon(1).  There is a
> different label stored in memory (called the process label).  This can
> only be set by the process creating the socket.  When using SELinux +
> SVirt and wanting qemu to be able to connect to a qemu-nbd instance,
> you must set both labels correctly first.
> 
> For qemu-nbd the options to set the second label are awkward.  You can
> create the socket in a wrapper program and then exec into qemu-nbd.
> Or you could try something with LD_PRELOAD.
> 
> This commit adds the ability to set the label straightforwardly on the
> command line, via the new --selinux-label flag.  (The name of the flag
> is the same as the equivalent nbdkit option.)
> 
> A worked example showing how to use the new option can be found in
> this bug: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> 
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>

this should be Reviewed-by?

> ---
>   configure                                     |  8 +++-
>   meson.build                                   | 10 ++++-
>   meson_options.txt                             |  3 ++
>   qemu-nbd.c                                    | 39 +++++++++++++++++++

[..]

>       }
>   
> @@ -938,6 +952,19 @@ int main(int argc, char **argv)
>           } else {
>               backlog = MIN(shared, SOMAXCONN);
>           }
> +        if (sockpath && selinux_label) {

1. Why only for unix sockets?

2. If [1] is intentional, why silently ignore the new option for ip sockets, shouldn't error-out instead?

> +#ifdef CONFIG_SELINUX
> +            if (setsockcreatecon_raw(selinux_label) == -1) {
> +                error_report("Cannot set SELinux socket create context "
> +                             "to %s: %s",
> +                             selinux_label, strerror(errno));
> +                exit(EXIT_FAILURE);
> +            }
> +#else
> +            error_report("SELinux support not enabled in this binary");
> +            exit(EXIT_FAILURE);
> +#endif
> +        }
>           saddr = nbd_build_socket_address(sockpath, bindto, port);
>           if (qio_net_listener_open_sync(server, saddr, backlog,
>                                          &local_err) < 0) {
> @@ -945,6 +972,18 @@ int main(int argc, char **argv)
>               error_report_err(local_err);
>               exit(EXIT_FAILURE);
>           }
> +        if (sockpath && selinux_label) {
> +#ifdef CONFIG_SELINUX
> +            if (setsockcreatecon_raw(NULL) == -1) {
> +                error_report("Cannot clear SELinux socket create context: %s",
> +                             strerror(errno));
> +                exit(EXIT_FAILURE);
> +            }
> +#else
> +            error_report("SELinux support not enabled in this binary");
> +            exit(EXIT_FAILURE);
> +#endif
> +        }
>       } else {
>           size_t i;
>           /* See comment in check_socket_activation above. */

[..]


-- 
Best regards,
Vladimir

