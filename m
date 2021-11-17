Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B495C454D07
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 19:22:21 +0100 (CET)
Received: from localhost ([::1]:45796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnPZc-00011R-Jk
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 13:22:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mnPXz-0000C6-FQ; Wed, 17 Nov 2021 13:20:39 -0500
Received: from mail-eopbgr70097.outbound.protection.outlook.com
 ([40.107.7.97]:11352 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mnPXt-0006NS-5n; Wed, 17 Nov 2021 13:20:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/7FtQYEWjeqh0BGtMviDNEyp5PWDeTLkZzasaVFG5jrDI+UtlhSl7XRQ85iA2mm/oqL7Sfn6gxsf8HFcTm/rvS/2MYHiza/+qXwVVHOBn8muSajuMN010HBdBn5zQgWw98bQV68LDWQTrdfU8rwZuyf3s1hb3tc4j9pxIZPX6GDLEhpUygfWX/+9R/T/Qgarn8mvgxTfU1vyAGWRj/crIE7QLL83XQ7M51Mpnw/thhlNeUv+QNMJeYmapSoZzjSSQ+bfKSayJogurZP030jxz771dXwZ/1xLKrcGuNjml8rMGRWyCpinSnlQk9yCEx8lO7vVr/WPO4uXkNub5modA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LB4mcasz05vZlJMdQAkguYmLpurlQCVi8tV4b1EI3a8=;
 b=l2EXiXVjiIq/5Tx+A1Xu+PArJD7nAaQ9/HYMhgGELqH4qlm4n0CTqtx3Nu7aWXZNqvPDoYxK0HYAZLrAezMvC+EZccDEk32ys4aor+4wI+i4BKDmq2UK8YoPuQyRLzYxW6pEsv+KEY6nOYYVf5YhXt08wDZrREKA5bS2nyEqCOSNIzMl9t7J6DciOYltmlcxyHzliD3ziyBze4kSYsOe5WMFT9vk+oNYUdXmz4n67EuAsOnWqpBoha1M7Q+Nft9OYvPuy27/vDyWZMjQiYvXjTXE7F6n27SX19C4rVAHFIgTxhW665RS0Cc1UlUstgfeFzBQGBgCM2CLRBOPU9iqZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LB4mcasz05vZlJMdQAkguYmLpurlQCVi8tV4b1EI3a8=;
 b=QzSCeFuNB5f7syjGp4EOHv/HgmMrYNo+NXBKcXysjWhv0Bwlq5yU7AS5IbOkVT9nOKW36yPEqyLSphB/6vz1wADzZLLsace4jXnjHFEtHhhCoI/mCrmO1cYl3+LH6Tj024HlN8w7VWPpDP2wEm3Z3mW6pO0wYarth2GSvfEA2Mk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2850.eurprd08.prod.outlook.com (2603:10a6:205:3::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 18:20:28 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.022; Wed, 17 Nov 2021
 18:20:28 +0000
Message-ID: <92fb55dd-1f0c-bf23-2b6f-dfb46c40b3f4@virtuozzo.com>
Date: Wed, 17 Nov 2021 21:20:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 0/5] Python patches
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo
 <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
References: <20211117003317.2844087-1-jsnow@redhat.com>
 <20211117094157.cef4x5jdsddd3hfy@sirius.home.kraxel.org>
 <CAFn=p-Y-dxRLrvEwz1M=HgPumQqwzUSHe1UTy-H_9D8PuCv0xg@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <CAFn=p-Y-dxRLrvEwz1M=HgPumQqwzUSHe1UTy-H_9D8PuCv0xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0040.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::17) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.233) by
 AM6PR10CA0040.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.21 via Frontend Transport; Wed, 17 Nov 2021 18:20:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35c8209b-7a11-4b3e-9dfe-08d9a9f6ee74
X-MS-TrafficTypeDiagnostic: AM4PR08MB2850:
X-Microsoft-Antispam-PRVS: <AM4PR08MB2850078D7BBFE4040E5F24F5C19A9@AM4PR08MB2850.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dbGV0ZWL54GjcXsv6QqIHEWSMRtZvv4vF5yeaRbdoqDkcBD0juV3xZxoG/iKble+oIhFk6PPd1P7pr+dVsX7w/UFdAvJaFY5ILAqncASkeMA54yDkNtyeYRHwtxQ8mxbH6t/ZJwW988GgssyyD7y3RCfumTiEhaR3UVnz/HzOwVEF38UlJPFXmauEaf1QOWKNo/A0MUwbSu3IEEKm3xtPhY3AhTcIhg5grL+iEBYM5J5LfLATYwkJGBZZYITyx+f4B6TAh+oNQoIUc4SI3HEfy04EzwcBCU30OBKfLN/Tmo5sbKF2Hlx86pmfP3J/fw27S18r2rQbiUWryl77fJAiWbqeISfo4o+qRWN73joFhk8GTMXRaSL33DUuEMvH5CWsGsm8BSsD/i1pI+1AUbpGCN4uPEkLRpvSu8EvZGqLHpptvqRLQXD4zn9L1e0xc1UQVWpRQDyAyl0ny0SNYywYKleShtauKGrDfo1QZ/B0qA+nlOjObw1wHPymDZ8AHpoFJ8pCcjDIKXBsOip11haorTxgc7wCmc/M8sWh7CJDC0E4Zr2slMjsXfIuXEkGPh9CPBwfQXK9TLaKfIC8Tp26hDnOi5XWwznbbiPjMRoL4md0efZn1LYFX6R0jkCTOUR+SZ+hKHP6nbIQHVAP9vtnixRLjbyRy84zItu/bj78c8k3G3KiCEgUaqzrGejYcwrLNDmHklvw3FV0dnVqVlrJJVL4gDNRLb0s4hU8AnZ84THPJTYsjyr15d7UKbnX9eW5wrO/Uxqa6zBAyqh2lJ55uixIB74IIClmgNE1QMwWZinulMRCMETEaKT10BIdvKk5dLcPhJRXBVxk/G5LoCYn/4BElgiy9Vi562uOlrVquc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(186003)(66476007)(66556008)(316002)(83380400001)(508600001)(8936002)(54906003)(956004)(52116002)(26005)(2906002)(5660300002)(31686004)(2616005)(36756003)(38350700002)(7416002)(110136005)(66946007)(8676002)(966005)(31696002)(16576012)(86362001)(6486002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUtMTUl0VDRJRmRRZWU4SjA0Q2FobkliUUZZcTJvRyt5N3p1R2VkVmc3emVK?=
 =?utf-8?B?aWYraGxMTWFPaW1nQkJ2SUw1cVpvNFV4R0JOOWxqOXVyMFkyY0duajNvVS9G?=
 =?utf-8?B?T2pMaHVoYVhreGRVWFk5R3k3ZCtoSHFXYWZUS2hDcG5UMUNmc3lRMFRjN2VL?=
 =?utf-8?B?OXhzaHpNRXloTkJHbGl4Q09MYWRLalRSU0YrVHBKSTZrSFZneUlpYVRidzNY?=
 =?utf-8?B?bWdsSkR5YzZDUWkxTXVhUVpTcnAvakkrTUVtUWRZKytPcjVvbHd5dDJtUWFQ?=
 =?utf-8?B?d0hJU1k5c0FSMWY1WUJPUmtDWnNrR0NGaU9VSG9KV2ZjRmxITSs2SnNoNXlU?=
 =?utf-8?B?UFhOdDZCalhJWDd3WW1jeGFyRmVIT0RhY3B5T3JwMW5wd1JBSVB2OE9adjV4?=
 =?utf-8?B?bCtSb1IxS0hEaVZ2YU5OMjNENTYvamRqV3FHckRTbGZUMVpoOG1lTU95S05Z?=
 =?utf-8?B?M25zWmExVHN3cVVGS0NiOHVoQjdlMXBCQ3k0cExnMWsvRHdTL2pkZEFKYm1J?=
 =?utf-8?B?T0pIeUhDaVlUbXR5NExsVFEwdjB2OGtlcWE2NHNUV1h2MEU0QkZweGF3aThM?=
 =?utf-8?B?WE9jeXU0QWRYZ0JML0tTdmErTndHM0F6akpFV2FsanFBM1M4OHpJVUpkejFq?=
 =?utf-8?B?cWdZMUpRZFQyek9HakZQT2I2YzJuODRTL2wvQUxEQnhZYU5DeHpMNjhVbFFK?=
 =?utf-8?B?cDJOWGpaY3YzY3dib29oeUtQYVVCd0lySGF0VWh5d0FrY0tEUzJjamFUQUNI?=
 =?utf-8?B?OGhpRm5mSkN4d1dETXNrUTRzUlFMRjV6c1VuL0F0UVBvZ2Z2Ny9YYXFRS2dL?=
 =?utf-8?B?TDJvK3hLWERPN2p0V3RXQUk4cDFCaGRaaFZEZDdJc0pSSFI5d3BnRkJNYjBB?=
 =?utf-8?B?cnoySWVKVy9BanVac01zRks3TFdjeWlnYTV1WXo1ZCs1WjVoNnh4RURlZVVE?=
 =?utf-8?B?MktERDl0Q0w5RXp1QlJkYzJtVTJ4UWxUT294cDZHVVR1U21ReGJ1b0FKejZK?=
 =?utf-8?B?bnV5Ty9KNzU5RnBOUGJ5enIzMUFlVlVaeTFPVG9xQjVmalJkYmVwamRWMUVr?=
 =?utf-8?B?UnExdWdFSTFIUitnaVhkbCtFS0FtQmJnT3ZQZFFtVFVRYlRlTzdUWTM1eU1q?=
 =?utf-8?B?V1p5TnVsTmJLaUN5TFJPVGdHTTMvS3Q1aWR1SWNKd2QxMUpaWVZMb2w5UVdQ?=
 =?utf-8?B?bkJNekpWZWFOSHp4K3o5QndsUW1oSUEzTmlJNU9DK01INFpGSXdWcTlTb0o2?=
 =?utf-8?B?cVVYOFZRZG1nU3l4QW1JM2VzSXIweFl4ZUROS3dlS1Y0REdMZGg4ckhTa3g5?=
 =?utf-8?B?b3pEZi80d3ZRWVBTc3NGOTBGVm00ajU1QkhIZk1XdHpuNUZ0cTRTcHdMVlkv?=
 =?utf-8?B?eXFGVk1rdlRmUjlCcld0eWNpYnVWUk42cWNuK29aU0xtY3dlN3VpQ1hCZXRE?=
 =?utf-8?B?WjZoYUdoT29jZmJ0VEhEeVdJeG01bUk1MVVyVSsvNzVPNDJIYzlJbjhYYnJ4?=
 =?utf-8?B?SStqb3FHbGNtYUNraGlQSUtPZjVrbmh6TXBvK2JCQVVaWWw1U2l0RHlmYzNm?=
 =?utf-8?B?aExsWFE3dTVNL3dXc09XZjZmOVd1QUcwSmFUZFpHWlFZUUtKMWFseXZmdnZ4?=
 =?utf-8?B?alpRTlVsaFd2WTdrQmhhbnJhbUQxclRYeXhXMEFwdnk2UnpQM1h4WW1PUUF0?=
 =?utf-8?B?TzBMN0NhaisxS0loa2hybzhhbW9aa1RLU1pRZDVrVzRoQlJxZm1JejZnay9L?=
 =?utf-8?B?Q0xFdDZ6N05CYWt6dFY2SGpGUlJqRnl3TlA2amI5Q25NVEpCNTcybDNVOGhk?=
 =?utf-8?B?cEs4UndRWW5OaW5sekw3ckQ4b2pHcityaFdnaVNoZUxPbzF0YWM0OU9BalRz?=
 =?utf-8?B?Tk1DaE82emZiVUhZcFlUVHlQNGtiemVxQXdDRHgySGR5ZHFKRjluMXphVzNI?=
 =?utf-8?B?emJyeWE1dkluWEdUQnBaOGtHeHZFNUJ5QldrdzJMV3l6UHNsWFRsV25XM2h0?=
 =?utf-8?B?MDRNVEVneGtmZkJoUTkySmRhUS81SHhwL0VDd25PeU1XMXdCWGNzZ0thTDVo?=
 =?utf-8?B?VS9NVG1XOU5iYzkxc2ppZ2NhZ1oxdXVLdTZrNmFTVERWTzdwQWp2ZDMzUGkz?=
 =?utf-8?B?TUpXU1B3WU93Ny9NVkFxY2ViY1NxRStZLzhmb3BtMU4wYkcwNmtCTnJ2bW5a?=
 =?utf-8?B?b0lSUkhIZFMzWlM4ZXR0aWt5R2J6OVdRUFpBcVAzSlgrS2d4cGFlU2V3SVo2?=
 =?utf-8?Q?UIlT5U5pqI36gKYhPopZ2y9TS54jFBTfzzxEeWXrs8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c8209b-7a11-4b3e-9dfe-08d9a9f6ee74
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 18:20:27.9495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQhKh+MYuy+bAhc/i5m7EymE3U/V51gSoiLXuF7a+D4Jn95wVLH5/QzxzmvsfW11OXAxRVHZWqsCQtqZimHFeR/KCRFvSJUsITA6qS030xU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2850
Received-SPF: pass client-ip=40.107.7.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_NONE=-0.0001,
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

17.11.2021 20:56, John Snow wrote:
> 
> On Wed, Nov 17, 2021 at 4:42 AM Gerd Hoffmann <kraxel@redhat.com <mailto:kraxel@redhat.com>> wrote:
> 
>        Hi,
> 
>      > https://gitlab.com/jsnow/qemu.git <https://gitlab.com/jsnow/qemu.git> tags/python-pull-request
> 
>     What is the status of the plan to upload this to pypi eventually?
> 
> 
> Thanks for asking!
> 
> The honest answer is "I'm not exactly sure", but there are a few things to work out still. Let me use this as an opportunity to try and give you an honest answer.
> We've got four packages right now: qmp, aqmp, machine and utils.
> 
> - I don't intend to *ever* upload utils, I created that one specifically as an in-tree package for "low quality" code that we just need as glue.
> - aqmp is brand new. It was moved as the default provider for the QMP protocol in the tree (being used by machine.py) only two weeks ago. I am using this current RC testing phase to find any problems with it.
> - qmp is something I want to deprecate, I don't intend to upload it to PyPI. I intend to rename aqmp -> qmp and have just the one qmp package. I can't do this until next release, and only after we are confident and happy that aqmp is stable enough.
> - machine has a few problems with it. I am reluctant to upload it in its current form. I am actively developing a new version of it that uses the new Async QMP module. However, this might take a bit of time, I fear.
> 
> So, I think I have this timeline for myself:
> 
> - Fix bugs in AQMP package revealed during RC testing
> - Introduce sync wrapper for AQMP that resembles the native AQMP interface more than it resembles the "legacy QMP" interface.
> - Remove all QEMU source tree uses of qemu.qmp and qemu.aqmp.legacy.
> - Delete qemu.qmp and rename qemu.aqmp to qemu.qmp.
> - Split python/qemu/qmp out into its own repository and begin uploading it to PyPI, as a test. (Do not delete python/qemu/qmp yet at this phase.)
> - Transition any users of the Python packages in the QEMU source tree to installing the QMP dependency from PyPI instead of grabbing it from the tree.
> - Delete python/qemu/qmp from the QEMU source tree at this moment; "re-fork" the package if necessary to collect any commits since the "test split" procedure.
> 

That all sounds great!

> 
> Some questions to work out:
> - What tools should be uploaded with qemu.qmp? a version of qmp-shell is high on the list for me. qom, qom-set, qom-get, qom-list, qom-tree, qom-fuse etc I am suspecting might be better left behind in qemu.utils instead, though. I am not sure I want to support those more broadly. They weren't designed for "external consumption".
> - qemu-ga-client should be moved over into utils, or possibly even deleted -- it hasn't seen a lot of love and I doubt there are any users. I don't have the bandwidth to refurbish it for no users. Maybe if there's a demand in the future ...
> 
> 
> ... This might be being overcautious, though. Perhaps I can upload a version of "qemu.aqmp" even this week just as a demonstration of how it would work.
> 

Why do we need wait for next release for renaming aqmp -> qmp? Or what next release do you mean? I think you can rename it as soon as 6.3 development phase is open.

I'm not sure that's a good idea to upload qemu.aqmp to public and than rename it to qemu.qmp.. Maybe, you can upload it now as qemu.qmp? So, first, create a separate repo with aqmp (already renamed to qmp), upload it to PyPI (as qmp) - this all as a first step. And then gradually move Qemu to use this new repo instead its own qmp/aqmp.

-- 
Best regards,
Vladimir

