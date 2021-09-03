Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02AE3FFF8B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 14:07:47 +0200 (CEST)
Received: from localhost ([::1]:59958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7z0-0000RI-W4
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 08:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM7v4-0004Mz-AI; Fri, 03 Sep 2021 08:03:42 -0400
Received: from mail-db8eur05on2124.outbound.protection.outlook.com
 ([40.107.20.124]:53089 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM7v2-0005Cx-F3; Fri, 03 Sep 2021 08:03:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPfLFw2ej7buaI8j+RcG0CjZjt+SO30LmzUYyc6ABSH5AFKkp+E3VKX6isoKOGHFDmPEn3ttzdeALpXk+yFLfX3Kg4+GmmV9PZjWEBrTK53U8CSvvnZaDq2Ff5n04I1mcNSKFvDbh6Ib8Jen1g8/sTWvzcMJqwtbmgabRX4eazFhsY7duX0TTcrqeFVE3mnzKfcVQyZdOONALd58H6aIefew8/u02xsakcOHs+/8lLHQ86BkmMEVtsOI8CX8gN6QB22OH4NeNLrEvJBX1w+1pWjUmaN2hYsgDtUYXJBoU0iPTQKwiV7uXMWbIMsG+OqUN0UjQh2AIJaTAp4DIi1GIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=zz9xI0L9/Xj/OgalLlKlVprKCj955/O8qMKUiQ/gCZY=;
 b=AySDBHxKWJeiSzNunAqGOp9iG07LpEdtMdaLUoJ6LKLGXSTvaYf2QoWtX6J/aC3KE0BSroB1the21tCeeohAF6s35i47lgIPeAAluXqknZ8hLZTKImpf3tbxw2B5uN3D4d6Y5wCuE0k3bN/Xm9mtbEdKW1xC80W+rIv7uZFMbbSBGaVW4Nx6vw9Jm5ySHMUQm0hnKWXJ4ek6FWSkWmvyAMR0p+3hYN/WeWcfTiRwhZnvAP3tbVt0IBGjCVk0cFCxeS/1aGxCMZLmM9y23MFQa+AJ//7nq1iC7R2TX4aDqZWuPFQQHS69uJ0IploKEE2lGsx3k3OfxwrlsRe1a0LxBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zz9xI0L9/Xj/OgalLlKlVprKCj955/O8qMKUiQ/gCZY=;
 b=vXI9O2CupVCljuxmn9uIlty2BYmSHFo4zV+K0iOzHYUQvUReVs7rZBDJu5hNG237ZhwncG3BMrTRTB4G7YEzMmVCoDflDAYB61lQX9sYx+WpyKpt60KOQQXaSdOh7IkcFnlbIAk7bXfKghpUsdv7q1MsA0G+y7iqep370+7qhgI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6568.eurprd08.prod.outlook.com (2603:10a6:20b:338::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Fri, 3 Sep
 2021 12:03:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 12:03:36 +0000
Subject: Re: [PATCH 02/28] glib-compat: Introduce g_memdup2() wrapper
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Helge Deller <deller@gmx.de>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, Alex Williamson <alex.williamson@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20210903110702.588291-1-philmd@redhat.com>
 <20210903110702.588291-3-philmd@redhat.com> <YTIEDKAgWGRt/I6y@redhat.com>
 <04ba0442-08ca-bf88-3f04-0be00c11bd1b@virtuozzo.com>
 <YTINZmrWJLOnp193@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3de7d220-4a54-79f4-86e0-71645eea8f98@virtuozzo.com>
Date: Fri, 3 Sep 2021 15:03:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YTINZmrWJLOnp193@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P193CA0029.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM9P193CA0029.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.20 via Frontend Transport; Fri, 3 Sep 2021 12:03:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d9505e0-d68c-420b-f083-08d96ed2dc2a
X-MS-TrafficTypeDiagnostic: AS8PR08MB6568:
X-Microsoft-Antispam-PRVS: <AS8PR08MB656872A56DF0B0BB18EEC5DDC1CF9@AS8PR08MB6568.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dHinGg58iaJnDspYikEjWPTMxR6rs3zBjxwUVHOVsW4xKNpIA71NcK5/D/vX3HeWrOtnJ+CSSsSiugNvL2sGFEXAWtA5OuX45Z58W92R07M06J/IDNMalsJKnreI6ntsfp4SK+GVY7Arfzd/jZVI6Vu8SZRhfUihGQLKc6nNozvl0ciPzfn2iyCcENBViwer/Y9GNROz/uSaBi632oyDtRYE76mDi7V0hXwFLGiuY5CL9e1DwD5ElMPs5bxwN9SdTcwvYbFYO+19GCp06QBy+S8XexeqY/LWpsDPt5ek7JLFuZsxfFdZvFfqwj5AAOs5EJ0ijHTTa2XABADCKn/t1+1OxWWQE8e1pQD04PqXi3ko4lHb77dxxUh9x0F0pgSGEFLWfLk5V3JQ2hO9zOHtz8t5fcMBJCirkE4elxykRU9YhtbclLNxPbAj7fTdPAydG1mmuneOoVVuXVH6k//YZGW68yaM7OZOQuGI23albfMmWoH2bKvf407JYQnJVGAIXkTxJu1F19eWpImFD2/ROhXDjyt3QC7iXkob7jZugeY6pnwbhcKUrgUbeSGQ74QJwZjqijLRiTo5PH9wjFT/7EJdCNF/5IgWiLNG3VfmWAUlZbnAYt+cBIOuLxirJqZw1h7ZXpG9zUGTjKidDkHl/ssTlrOLBxghm4txThQjrAWPNJpF4G64RycB/+skWAd0WpXl1qd7ERPe/2hxagPcMbrUNrbYQvpCZejQRdYqPbpUPG28GzrQwoGKl9Owg1dHvVNZ/0ySEHdiSGCBwyNHUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(31696002)(36756003)(54906003)(508600001)(66476007)(16576012)(7406005)(8676002)(66946007)(52116002)(5660300002)(4326008)(7416002)(8936002)(2616005)(6486002)(956004)(2906002)(66556008)(316002)(6916009)(26005)(38350700002)(38100700002)(86362001)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDl3ZlVKbWMveFhkcFk1ZlpLaVR1cEdIMjMvQUhjTEI0ejBESkVRM3pyeXhX?=
 =?utf-8?B?d2dmckE1TTlhOTk2MGwwRUEyNWZYOWprdWVJQ2dzUTR5N1o4L0ZIbzFYR2tm?=
 =?utf-8?B?RFZaaUZXVkNWcG0rMExMM2l6K0VLMWhWbEdHRERyZHM4dlBjUkozeHRGLzZr?=
 =?utf-8?B?SkYyWUdLVWJ6V0EzYmpUVEd1cFNJQjg3RVN3L0ZYNkg3aFFDVGZpVlprdTNI?=
 =?utf-8?B?OWFXYytmMGljRkV3MFR1bkdLdldSNDNadnE0TWhJZmxqTVRDeWdEUHo1UUQ5?=
 =?utf-8?B?ZVd4S0JHZzFPR2V6azd2a29zdlZuL0I0SHhkcG4rNkY4cFpDUlkzNnJEajVB?=
 =?utf-8?B?TnFmMUgwWlJvdVRxS1hLWmVqYldxWSthaXVJTDZ0Uk5KYW0zZ2M0T3FMT3Mz?=
 =?utf-8?B?TStsWjcxd0hFQVQyVWFRTk9XNmlXamhlYjNBODhsNHp3S1FKOTFmSk1Mb0hB?=
 =?utf-8?B?c0Rtc2d0WHUwbHJQZzh0bnhqSU1ySGlxSHowQk82RmtZYk94aXhaVlRZbnZy?=
 =?utf-8?B?TG5WQkQrd3Z3bzFMY0JjZWdZQ1E1RUlONGdadnBrc3k0N0RsK3hPVHF3NHFj?=
 =?utf-8?B?aVphajhhMWpGOXd5cDZjWWFrVVdZY3RUZHdDd1RMZWdkT3MveVdoOU1MRm5r?=
 =?utf-8?B?OElncDR0cnZlOHZGT1RvL1BiU2dsaHkrUEZJK1lwNGN5Rm03QU01S0tOalgz?=
 =?utf-8?B?eSswZXRYV011UjN6OFprNnEwSVhoc2xsdUV4L3JOVzY5cjR1eFloSTFBaW14?=
 =?utf-8?B?VkR2SG9tODRXN29PTkRaaUN6MlpNa1V4OHpkVUFwZW9RbEpGMFUwd3NOM05m?=
 =?utf-8?B?SVM5Y3pMYTJMVi92cGczaE55T3B6TWNIYXhNZHJrT3B4dERGRDI4L3Q4TTZr?=
 =?utf-8?B?VEpmOHVUUmxBQ2U4a2prVmxQWFRPNXRlNU1XbFExc0tXZ0ZwNnN1bSs2dEZU?=
 =?utf-8?B?bk0zZkhoZFJVODhoSGl3RVRwejhkc3ludWZRM0pBQ2M0VHF5ekY2c1ZRRFMv?=
 =?utf-8?B?YWNxazVnbU9lUDZGTFA5N0hLMEZKSHhlSXlzNzJGR2RPVGVFbTZuSUEyaVp1?=
 =?utf-8?B?WGY1VXNMbFpNY1dKdTQ2MVB6cnRvbU9wRUI3dWlZZDFjRVA5UDNUbmkvWEFw?=
 =?utf-8?B?aDJxazJqUndWQUhhT3hTUVcycG85LzJpSHFXL0pBMGRyQXlPcGt5azI5MVVi?=
 =?utf-8?B?TDNCK0syc05UUnpLVExBNlh1YnBHamRoWkJXMTlTRlZwdS9ac0x5VXJWUklu?=
 =?utf-8?B?eHdIVU1iZFhyTnoxUEN6ZmxuZWVHZGc2OUMxS3RZcEdaRDh6NEdYcDArMXZ5?=
 =?utf-8?B?QkZHNUZEU3RaMXM0UzJCQXcvb3pCWExKRVRWS0g3a0YxNktXbFpMZGxtQ2V3?=
 =?utf-8?B?YVJHT3ZVam8zaU5XUkc5VDlHVFNERXowNU5sZW50NU9venhvcFN1WWtMOU11?=
 =?utf-8?B?WXBta082aXNXRmNJUXBUWFEwaGMxVEpaRm9GN0g1U1FlWmZnam9IVE9zUzJx?=
 =?utf-8?B?ZTlUanA2Z0NzYTlFZ0QzTThxdzRKZTQxR1dZU01WOTByQTdKWG9vZk1zTU5n?=
 =?utf-8?B?OFJqek9Pa3EwV3ZBZ2VlVWFOSlVHUnNDZnpHVGhqSU03eWhFR0poS3kxUFJS?=
 =?utf-8?B?RFJhNGZsQ0ZNUWxVMDRlMU5oQ043eWpNdVByVUNGdG1uaURhN0UyZjhoRjZV?=
 =?utf-8?B?cHQ0N281SmFBTHVQN2J1cXN6d2hZOUNzRVFGTklqT0ZJMUdsZDIvVjY2YjQw?=
 =?utf-8?Q?vWzmqxhc6LyXDheqwVDRXTmCj5iBcGy0Ywwvy0i?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9505e0-d68c-420b-f083-08d96ed2dc2a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 12:03:36.6859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +IypOfwEwAM9XthOGKSMlP2Q/CCLo3RsVkm8Sf4qwKtw9azCcneY0N9skUAjk0Th/Cyrvie7cRY6ffbNwJh+pKFdtgIaBcUBRzU86K9NRkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6568
Received-SPF: pass client-ip=40.107.20.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.888, RCVD_IN_DNSWL_NONE=-0.0001,
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

03.09.2021 14:56, Daniel P. Berrangé wrote:
> On Fri, Sep 03, 2021 at 02:51:21PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> That was most probably already discussed, so sorry my question:
>>
>> Why we can't just do
>>
>> #if ! GLIB_CHECK_VERSION(2, 68, 0)
>> static inline gpointer g_memdup2(gconstpointer mem, gsize byte_size)
>> {
>>      gpointer new_mem;
>>
>>      if (mem && byte_size != 0) {
>>          new_mem = g_malloc(byte_size);
>>          memcpy(new_mem, mem, byte_size);
>>      } else {
>>          new_mem = NULL;
>>      }
>>
>>      return new_mem;
>> }
>> #endif
>>
>> ?
> 
> This doesn't play with GLIB_VERSION_MAX_ALLOWED - any use of
> g_memdup2 will trigger compile warnings since we're using an
> API that only exists in a glib version newer than our declared
> baseline.
> 
> The inline wrapper  + macro is a trick that lets us backport
> new features, while avoiding the compile warnings.

Ah right, with macro, compiler doesn't see g_memdup2() invocations in code. Thanks!

> 
> This is documented in the include/glib-compat.h file that Philippe
> is modifying.
> 
> Regards,
> Daniel
> 


-- 
Best regards,
Vladimir

