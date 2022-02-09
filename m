Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FE54AF281
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 14:18:47 +0100 (CET)
Received: from localhost ([::1]:58304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHmru-0006Nv-Mv
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 08:18:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHmhJ-0002Ok-Tv; Wed, 09 Feb 2022 08:07:50 -0500
Received: from [2a01:111:f400:fe0c::726] (port=59486
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHmhD-0004kn-PW; Wed, 09 Feb 2022 08:07:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niTtmq3rIOZ5NnNqUB73vM4sGnbaqWZ4O2CxqX/OfswMPAmFbThHWynUFHC0+D9qrwTek+kPH4O+WElQ1+9vAhzSxWnZrr8BeVydJMlNU7fPunnCqNUvSi4QjzfCNsr5Vuo2xqTSYbP5Cz+klxTmOWZ+DmiJfLLVVOgq3HmxENWnA92Zh30ElewS7da6DmOB4iopAjQACKhEinAK8kvFc6THgYqJKaOECO8vdCH1dwtwWU7UFZcZ6oFDOI+7OdijF7NGHIAZkJdXiXGgCbrNoSt12esFBfumG7Gm3cLyjSX4gvSZqrGQ50JaKsUSKLEjdShFJ53IQEGDkJFmyYOnbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEj4qiVrtBwL+26BSnps0b5AEwzdANw0glcSCpmR7fU=;
 b=chuK+d0uN1jvqRv1X1sPE54gl58bbMZHMq4BW+coZ1FE5Nq20cVTSGOVcadl0oWDKMX1yk4N7PoKp55SAvSooCWsOrx7pbE1CsxOyJAx+KwSFKQshYqYF1wn6LXNEw708xdeuqfuHXNgznhAOL35IkP1SVnk22M6unHFPSI31RIRjYSIwdlx+mBqhZky222xx6bKm9uJjHZXHfLzDcpRcBZpyqRPExvPq0gmXW1IpVpqXOGrPqoctpMTF2hbxlS9pHqNmsa669FYlvQJJM7zFKbv1bvQirDsMexMK2ZTr9FvEsUNgK2fUXNUnaakinwtEe0nWP/XTxMf5JYMIZfj0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEj4qiVrtBwL+26BSnps0b5AEwzdANw0glcSCpmR7fU=;
 b=THZS14j3bhRlITqAItxTULcMdCrR2WdomkRipt3k2E3jGpxLfGI0WF3VxPY/Q/fmUqx07mnrBCT0At6KmQz3DEogM9ytWoE068MRlNpKAiG6Mx60LiL0BAWKYzRTHZKpaqvxeiKsv9JWCdH6L2elEfNfn8h34UIoFvIcMpqoCls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AS8PR08MB7127.eurprd08.prod.outlook.com (2603:10a6:20b:402::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.16; Wed, 9 Feb
 2022 12:33:06 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 12:33:06 +0000
Message-ID: <5c95f20c-df30-9d24-0e1b-f82f4d5a798e@virtuozzo.com>
Date: Wed, 9 Feb 2022 15:33:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: qemu block <qemu-block@nongnu.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster
 <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: downstream extensions
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d4de1fa-189c-4e18-5a9b-08d9ebc85295
X-MS-TrafficTypeDiagnostic: AS8PR08MB7127:EE_
X-Microsoft-Antispam-PRVS: <AS8PR08MB7127DB0B2CF59D34316FF142C12E9@AS8PR08MB7127.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4HOn1kGkKPP8mCT3q7ogVGseuKymaGGLEwU7y0nHAz3EeuoMyH8jUs/nhh9g277H+k5ijeZq1hXphIpp2q56/jweYzObf3K/4On/dLsQ+LRIYZca70rxvyKElK8GO0ZU0/ylaPkByZxKCA/yn6EaZXz0rjixC3/WKK+t5jZapOIYcPHDnc3R6kZhjWiRNGK3PTZGmgPO4JoDpWINwn0cPJ1+OGGDDwDkqt0E/BPq5mOSQ5sYvEhvkStrDf3iHMYER2UEmvOyXYUX9M/ICb+tDtLZ2CYJmoMDEkJXS5wJfkFlMtxrjwTGlCUoOag2T/52aW/s4ERb2S3waqxo9VHGftQpR63amxYiFLL0FnjdTNCnFXjxjl42BjvoXpZUYe9xodlXrwrqwJ7tE9Am+JRNIao/RYtVxIQUQUEmYnTC7a3kAOrRlhH88ZlwqUMURfXirN4BCMz3p3cGokFWqQYB/KIYhYaYGPrqGhEMkva0/TrlL6QW2u9UrJDYTOAtpgcXaCb6L5UzKmFWj6M5F4jLel9+WXdN8ncrIEc9ng+lK5p8EClkr8wuJFqfnud5UoMqfLd52U0KiDVZWt41aLEq1B2VbpEFdyPnFW49z1l0F7yhAInPY34zQMvXFS2V1hDP1CW1kS+WHD1jPNY5mu7o+hsI/wDU968ayHfbBWQXeSXAparKrQy/luDt2koa1IOPi4NG0I6hvDBTvdU1Pfq0jqFANzIPzZASADkytLp3I6+BdgoXU0ManiJX3v4NMhgeNJz4m8Qw6Z5dctZRU73o+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(3480700007)(38350700002)(36756003)(66476007)(66946007)(8676002)(66556008)(508600001)(8936002)(7116003)(38100700002)(5660300002)(6512007)(54906003)(6506007)(6486002)(4326008)(6916009)(26005)(316002)(2616005)(2906002)(186003)(52116002)(31686004)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGFpbTN4dHpCRkdKbU1vbGZMV1dvNlJJVnVQaTNTbVhmK3c1dWNseUZPVGhY?=
 =?utf-8?B?TmZQNkdJNjNmSW1rWXJrc2FiMDl0TktqMXVyamJFT010WUtSYUFSbVB6ZTBG?=
 =?utf-8?B?TUE1WGZtRkJ4Z1drRk1yejBIRm1TRzZncSs1SDNQVE84VlE0dFJlaDNsYm4r?=
 =?utf-8?B?WHlEbnF1UDBrQ1ZmRzVUYy9yaFJVZUp5OHg5aVdvZ3NDKzRuOHpEU0hubmk3?=
 =?utf-8?B?bkRoL1hmbmRkTFBWSXAvUXlJRFR0aFZ1ZFcvL1B5V1JNRWlwOWNlcFMzRHlL?=
 =?utf-8?B?bkZTbzR3WWNleG12b0RvK0ZYdUFNVWhPQ3ZuZDB2S2svNXYzNFJjQVlOcDl1?=
 =?utf-8?B?cGZzN1gzR1RpMjE4dmlmVUFiMEZwc0hxZ3N1T1NBYjhoUTVJNVBSMGE2TG55?=
 =?utf-8?B?Z2pkMUNpa2E1SVZOS0hQNlZ2bnJEKzE5ajJHeThpRFRXMFQ5M0Uwem1vbVhy?=
 =?utf-8?B?dG5VbW0zazVXOWRuYnJUcGVPMGhBV0FzTHRXNzBCK1dOd1pKUmJwQ2RHVHRm?=
 =?utf-8?B?S0hwQjN1MWJ1dkdBWnlGRmFkRFpndlJTcGsvbGVFd3A4QzIzQkJxbGUwYWU5?=
 =?utf-8?B?bWs5djRvYVBjWFBkUGlhZlhURTUwd0xXMTJncnN2UWo3eVVCcEpZRnR2Qmxa?=
 =?utf-8?B?cnFHVGFhdWRvRXF1MGdHM1ZoOU9TSEE3OTk1UERPSnR0UzErMU9SbVErbHJl?=
 =?utf-8?B?b2tXNk9xd2xvcENxR0tQTGp3NVBxakVUbFBXNUZyTXV3VDZwT3BXU21PQVYy?=
 =?utf-8?B?WjRrSGU2S0Fic1B0eXdtZkhWM1dRWmt2YXVaUFFPVEpFKzNrcWRrbGxUYS8r?=
 =?utf-8?B?aTAzSmVHd0Uzek1xVWdoMFpRN1dxVXZBL0xiZk5VZUU0UWs0WGxaQmJXMWs5?=
 =?utf-8?B?MWFtekZzcGVGSmxyb3I0UUhMWjQ4VGg3bG1aNlVnT3VoUVduMFJLNUc1bmdH?=
 =?utf-8?B?NjhFK01YSUNnY0xCWXdBUm1ML0s4U1JqV05iYjN5THh6NlN3S05BS2F6Q2VM?=
 =?utf-8?B?RjVnYlgrR29pRXRUa01lcG10WW5WaVlZOVNwd2s3ZjhrT3BxYkUrbzhZRldm?=
 =?utf-8?B?RlBTU2kwUG93VWZadE1ia1FqMjQyZUk3N0c1Z2llTkx6bFl5NUYwZ2V6eDNS?=
 =?utf-8?B?amFGM0lDYWJrRXVkeXhIYmFuV00wNk5LRnRxTW5MQU1xYVdIM1E4eFQ1ZUo2?=
 =?utf-8?B?SWlheHhKQkYvWVQyRnlSSnhRN3JQZzF4dGt6WjhCYkFJbGI2aGNsZGpmMkhj?=
 =?utf-8?B?cGw3NkRFMjcybnBpeHQxSXVKamVJdFlZODVrUmczaFVVbmJvdGU0RG5WZVpW?=
 =?utf-8?B?ZjdHbnlDMktzSVpXUUFaM1A1ME9IRjhBSnJTajFHanVZTHNVNjMwd1AwWHZE?=
 =?utf-8?B?RVp2ckpaYjUrZUdOc0diUVJYRU1qMjJQR0NqcXVsNzRFUXhlVjhVUS8rTmRw?=
 =?utf-8?B?YW51cGZpcUM4VkZlVERKdTJqSU9Xd3dhNnU5emJNVFBraCtBKzRyaDU5aW5Z?=
 =?utf-8?B?VForODdjZjVGekNIcllQc2pNS1Mrc2Ira1BTSVp2NVNNNStHczdmMlh5eVVa?=
 =?utf-8?B?R1FkSFF6cWFGNmtvUkJRc3Bab0FPa3RzdmprNjFNVTJHc2NWbkhoUmd3Wjd1?=
 =?utf-8?B?bWY5K1owbEhtbTk1N1NWOEJOcXlLaDFhQ25CSVo2N2ZiWjNueEhYRVgwUG9p?=
 =?utf-8?B?dTVWV2t2bGo4WWJNcE9hT3pRb0w5ZTRMQTRVWEtuWTkxMVgxWHgyL2liRW9x?=
 =?utf-8?B?a2NHeGJpZXROSmVHKzNOaFRTSzlJdk1LOVhtemExT0hFKyttK2tOMUhjbW01?=
 =?utf-8?B?dEkwOFJMU25Hc0J6YTdpTnRSbEtPZ3hPZjhsOC80Y3F2SFpRSFFjdnd1c2VD?=
 =?utf-8?B?NENLUTlQVWsyS2hKRFVnOVZnOGttdmRtazhoM1M3c3hNbEgzdEgyb3c0amh1?=
 =?utf-8?B?Vk5QS2g0Ymt2MEUzSWZxakdRT1RNSE1BYlNSNW5BbTczMnNkcS9CK3N1SWVm?=
 =?utf-8?B?NklVcktrRnhZVy9ieEh3MVZLSGgwb25zb1U4dlFZK04rQXNrYUtNTVhVT0ps?=
 =?utf-8?B?K01IS0FMcXEyTnMzbk9SUlprczZIcm9CbXFKSE4rWWliVFJrSllJaWRINldp?=
 =?utf-8?B?K084T0M1NGl6eHZFM0RpcFpucTg3akFiK1MxQ3NmMW9zNGxVeThPejlvOEZw?=
 =?utf-8?B?VkN5NU42QjhJcDBqVXF1NWNLMVJGOHVqbzY4SnQrYitKa2hzTTBGcEpvNU9W?=
 =?utf-8?B?Wk9KaHVBSnJqemkxMWIxbzJmcVJBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4de1fa-189c-4e18-5a9b-08d9ebc85295
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 12:33:06.3484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARW9aw1d3Fv/lLCalGEC3JB0tNsZxxNm8kHtaGelhx1lHh/JiCq0xN6RiM8f0g73iQysoznUN0H8coU7ptb6et6pFLh1dCXAxBQQALPKaa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7127
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::726
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::726;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi all!

We declare a kind of __com.redhat_drive-mirror syntax for downstream extensions of QAPI.

That's inconvenient:

Assume I want to merge now my keep-dirty option for Qcow2 driver "[PATCH v2 0/2] qcow2: add keep-dirty open option" to our downstream. To avoid possible conflicts with upstream in future, I should now call it __com.virtuozzo_keep-dirty. Not saying about this being too awkward, there is a real problem:

I want to support dot-object-notation syntax, i.e. something like

qemu-img check --image-opts driver=qcow2,keep-dirty=true,file.filename=img.qcow2

And this way, a period inside a name looks ambiguous, as it looks like subproperty of "__com" property.

I now tested, it still works somehow, and test from my series passes with

  keep_dirty_opts="driver=qcow2,__com.virtuozzo_keep-dirty=true,file.filename=$TEST_IMG"

But anyway, it looks ambiguous, and I don't want to use it and share with my colleagues.

In past, I used x-vz- prefix for downstream names (before I heard about __RFQDN_ notation declared in QAPI spec), that was more convenient. But still, that is not correct..

I now think to use just __vz_ prefix. Such name will never appear upstream, and unlikely to be used by Rhel downstream which is our base. And I don't care about any other downstreams.


Any thoughts? Should we change the recommendations somehow? I think allowing dots in names in the object model is a bad idea.

-- 
Best regards,
Vladimir

