Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D7B4962A1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:10:24 +0100 (CET)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwUY-0002Ed-HE
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:10:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nAwP7-0000z4-6v; Fri, 21 Jan 2022 11:04:45 -0500
Received: from mail-eopbgr70135.outbound.protection.outlook.com
 ([40.107.7.135]:62018 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nAwP4-0005nG-B1; Fri, 21 Jan 2022 11:04:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZxcL9jH1vcb4S4LqBbI6YU29mFA1c/+misDkFCYA8jbUI9CfPQ0uB+NoGZUMLzlnDFz01cgD+VlLFkOzZDKVZ6atDErP6FpSUMeEl/DCF+Llcxtjdhc9aqfnpmgnuUR+xviTGU4IA5Bsyhvu6yLKp1CBKdezIQIswlHyPzEndaDTCqKNTw1Jgyt+bWBhMGgRr2O8qbiJvuWBvx6oQBtyfcGxRl6xep27zXpG+UY/oiGTVNozZIjPkLurpRcJoBlJY+xQMK/XrY74cAKnBYO6DAMVIE4yttkDHkiIiPNhKj3OFYtBU36krfzHpxFJZ3f98UVKJep9MB8LvdlJrk9NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnIKg+X2Ff/euVTsIH76RlLWxY1/MkbEcaLUL7f+pF4=;
 b=a/xrYjIK125awLW5SGZaL32wQI5XieZD3blJhqoD1XutVrUxZ/fGrFSzceqQjRFfeMUkFEqGt1JcBs4a0L8u4iEfOEZ9idqq2xOs9Rpa5p7sxInX7oytCqSC7AfwugKYeAiU/IxcHtQ1Wz7k1Y1Y5m2GdPOmoyuD2S4KK58avWMPXG/ADQJLCHFnTCugl61Dq4AHq66SzI4dpFvnwgsircyHT/x1DEUmkYy+VZlFpxgc680AatxteksigGOhz49GpDITsafuNsA8Mvu2QgUh/zrlzD6uFTpLG2ZqfhexjTnCo/3EPVTpDd776sudfLBiRMZqllPtC9XnbxcouxQcYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnIKg+X2Ff/euVTsIH76RlLWxY1/MkbEcaLUL7f+pF4=;
 b=bJQIJuXgDerxvZlB9ps1TXYZmwdfhsL25l6jzEOMWB5YAjgkYG0PkybC5SUo1Dli2/HJNMRTWabD/BCKUVeQ9LMAcMoxdubKBJx/0NZoSOe5/CJ0TkDyFynL3YwJuvwX3j3MXvKUtJ8Dp2aUrf0P+Edu/NDlXx7BplJbvwfVpTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3209.eurprd08.prod.outlook.com (2603:10a6:5:1e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.13; Fri, 21 Jan
 2022 16:04:37 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 16:04:37 +0000
Message-ID: <58f1095a-ac51-67b2-467a-fb2611664423@virtuozzo.com>
Date: Fri, 21 Jan 2022 19:04:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 03/16] job.h: define locked functions
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-4-eesposit@redhat.com>
 <6a9dafe7-b3e2-68e7-e727-2086c7ceca6d@redhat.com>
 <93565619-bff8-9f64-50f0-3e9acd570777@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <93565619-bff8-9f64-50f0-3e9acd570777@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a5a7814-0d2f-42a4-399f-08d9dcf7b959
X-MS-TrafficTypeDiagnostic: DB7PR08MB3209:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB32090BA9C282E8889CF5785DC15B9@DB7PR08MB3209.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d+7tgW2kgnHq1mgG1kr0tURCuZLODXlWTijFYDIZvd+ovPCcBsJW7QsSW0KBi3L5sqIKBCFg5FBX/vyyt9exY/6NT098sEN6dAs+J4+CK7b3tagfzut0cBieL34pxFUbBnhxherog40XmIdjWVn7E9zoKZ5535hWj4GNP5lAJf5y6FVwvJIJveaMiUoe0XW4Jv8tbk7h9IN6nwUuPXXgF4FJVagYoIOTIGkknXV71eU7JsqGXz6KW+boBvcOOPKBtSEWUZxBH1ibT23dyvt15XnPpp11ZasWu7AgVFovOexTHOqVLHGvY/uyqmRK2/gOnLm5TWC9sTDIu0OTaCE5GNDRXLSLca7WXXx7Guv1iE1rrUNJnCtulj+w/DzuDCQUYov14MWvtS5yvnoFbLmSpHrZkrtIkhuxoNUoag/gUrwRvbIYgi6UhH/W6p6ORdwg/2EeW5utchHV/WaL624zsXk0z+7TdlaqD0QLMg8A6Z5ErbRLp26FohbxUwR/6ztDLtkIaylQmwZzfDXOf7GwB1FlBOcC8w86WPxzsij6zMej0hZXpJLqr8Dipday+Iz8Q8+Yu1KagPCIEP8QNp0S1OwZwbWSgONefF7Tg/Ikn4iJylfKRJi5AvKeBeWTzhaIwR9XvHm/LS2rAelyS+4fxlAdwHtjcJoXtR3VT++Cd0Nx2TyiSoVJwayiQDoWT4sgGR5yqggys0hiCo7FcvjS2phtBSYm8luud9l0kzztc0O+W2sJ5JwQ5gmQCASjdjk8fY7daCYdGkmHTxMzPjFO3HHEksoC//d6llTWobdF0jXgz+MzSuzfARYD4Xh9zYieWV35ybyRi//KQOrr6eG0jwpe74iKgaoZTZC/Q/GNYG0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(38350700002)(186003)(66946007)(66476007)(66556008)(4326008)(36756003)(110136005)(2616005)(31686004)(5660300002)(7416002)(52116002)(86362001)(966005)(38100700002)(316002)(508600001)(26005)(8676002)(31696002)(83380400001)(54906003)(2906002)(53546011)(6512007)(8936002)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFlxcnk2L0p4QUVDekIrMXdOUFVlQ1RFNEh0UUZyVlEwaGYwWkV2a3o0d2dY?=
 =?utf-8?B?NmlBTFliQUxVK3YzV3VsR0hzU1E2NTVBRldTNW11M0N2Tm9wVDhuVzBDNjRs?=
 =?utf-8?B?clV3TzE5N0daZHhuVHJtbjQrdDFzK2tLVFJ3Z04vN25JdFhuQUl3cHBBaUd5?=
 =?utf-8?B?K01jR2d0TjNpbGNDeW04WFdIYXg0QkdicFU3SVE0SmdZWEI4Wk9SLzE4SDRF?=
 =?utf-8?B?eUVvV0h2WFN6aDVGYjlLR2F6bDVwM0NwUDZvYUNJZGZqTDhsNU1Hd21JbVpK?=
 =?utf-8?B?bFArclAwUDFqazQreWg5UGFNQVlZblh4M1h5VXhla0FwMmNlL2FXdWp5VFJt?=
 =?utf-8?B?Q3hscTZNMVpiYnE2WVV0M2N5am9TVVBIclo5dzJMajlRaFJCTkdwaVpQREFK?=
 =?utf-8?B?K1Z6UGF2RkdoZ3BBUkJ6cU1VMGtsRHRoU2tmWVhBTHREK3FodW5KK0tCSldO?=
 =?utf-8?B?eDVsMkhJc3NWOUdzb0c5a1kyeUU3Y3hHMDE3Y3pxa1FFU2lvNUVabkJkNW1R?=
 =?utf-8?B?cmpmTTRCbGhLdWFxTVVKdHZZWVlsVkd5d3RZZ3BLaldEVm84VVdVbnU1bzRS?=
 =?utf-8?B?dlZEZkxzQlk4SnlBQWFwQ25URTVDbUl6NUo0MHpMelVzcHdET3dmeHdjMXNx?=
 =?utf-8?B?RVkxOGhhdEhKTFVYSkxyNjBNVzRTQkRvL01LdTlTdXZJNVNUWlU3eGFYUFR0?=
 =?utf-8?B?QjBheXJ6UXV5KzJHbTVqZDhCQytHNmRGdnJZQVNXK0RFQ3dKQnhabllTbWNB?=
 =?utf-8?B?TWNUbjkrazMyR2VEU1d5bThDY2h0cjFkZnVVWGJjTEd3SVhtL3Y1VlFsMUhP?=
 =?utf-8?B?c2NqbGlvd0lNR1JpUjdzZXpyaDhxWlRxVmc0TTVzbXZYeDI5TUxUektndUcz?=
 =?utf-8?B?ZkRDY041V1RtUWpIL2h5dk55djdPUjJWR0ExdXkvL3BNckU5ZDNyTTM1ZVpr?=
 =?utf-8?B?UnJKemxGaXovMlFtNjRQTmE0MHhXb2oxVjFVQXpnRjdhRVdjRjN1RFV4Q1Zo?=
 =?utf-8?B?amxvZ1JlQng4eDFVRmM3dEJsdWFGMXBPY2kyVDhCNVVVLzZBWkl1VWZ4MGFD?=
 =?utf-8?B?ek1CK01yMHNraGIwTnV3anJJT29EK1pIK1dnYjFJem42NGhERi91L1BadkIv?=
 =?utf-8?B?Mmw3U3hzaFpheCtQcGpwQXhtYlllOU9zbUNqR0s4dGZZc2NTTEcxeWJ0bHpS?=
 =?utf-8?B?dWpkbkpxc0ZCcEYxUHFpMmxQYmxjazNqdm5GaGc3c3RFR01odWlPUzYxb252?=
 =?utf-8?B?RFAyOGo3dWYyZ0MxNW1uc0ZtWFU0VzhFVkFwRHkxNFFKTXRaM3lDUitRR2pn?=
 =?utf-8?B?TUpaYmIzWXQ2SmIwTFMwRlR4NmRCZDB6REtvMFpGdW04TmxqdHNZZ3hsYXNV?=
 =?utf-8?B?b0l6Vzk5Z0ZrbHU0TDZZOHRhSGszNHhwN2o4ZlgwZW5QSDNRSUUrcmtpMEla?=
 =?utf-8?B?ekFWNGxsTlNPQWtJOEVVMi9lNWxHT0Eyc25FK3BldDk2bGI2V2Y2RHN1VFFT?=
 =?utf-8?B?bWhYbG9iU0xsby9LVDAyM3hFaG9wcDJHaE54VVdjeDVkc25jcTlEWXU1THVo?=
 =?utf-8?B?Q3dZb3liM095R0QzTEdBdEUzV0ovemZOd0VsNmJ1bVlvU3ptRmp1VlZBcnF0?=
 =?utf-8?B?RzBNRlNzbzhQeHRYUkd1SitNcGlNT0VRY3diV0MwdXIvNjZTTHRKYnpkVG1C?=
 =?utf-8?B?VmFuQWVQTUJiT0ZxY213eHRXN1Z0Vk1QazZZbUlLVzJDRDNURWtPUnhwUVhs?=
 =?utf-8?B?MFpEbmVSRitLallieXZnbWQxZDB3ZkR6eWZUTTdidUpuNTVNUHhLWmtjdUdZ?=
 =?utf-8?B?VEx1U3FKeEtSdm1SQUJwSW15Nk9QN0pXc2pPbkhLZ3VFVlozejJYcVZFVmZ5?=
 =?utf-8?B?aEJPVGRQejRvRkFTWWRtNG5rVWR6bzZxV25MNkR2bGYvelduS01kRXk5a0RD?=
 =?utf-8?B?YXBOeDArQ0hUc0phcHlMRU8rRmZXSmxNT1orcURqUm41YWNST2YwdHovZTJO?=
 =?utf-8?B?NHUwbU5Pc1pHS3EvdWlzOGtKMFRuNDFJanFhUUtPakxkOHl1M2p3YzZqU1hG?=
 =?utf-8?B?cW42WnRTTFcxNnd2VUxKQlNNa0Y5T3pIdFlsSmtYZEYvTFBXa2dMc1hXa3pF?=
 =?utf-8?B?NjNUbWJnbFExaHNNYWZ6WnZWSkpnMkJueUNweU1JNjdHVjRSaVVOYXpkWkQy?=
 =?utf-8?B?dmxFRTNCUDhjb0NwL2ZtSmtUSU1nWm90WUlwOHVockp2L2ZBRVE3SVpQeFpm?=
 =?utf-8?B?VXZoeGVjTFlRMW5QcER2VzRvbFFnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5a7814-0d2f-42a4-399f-08d9dcf7b959
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 16:04:37.6188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54S4ZOnTXHGpV6Fbs/ILly3Ke44RtCqa7YEyA+eR9pAyhPykSSKrjaYcFCQXZelxE9DaLe3kTj/9pR0Wver52lqIn2+bpkyPlU3s+fX9fuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3209
Received-SPF: pass client-ip=40.107.7.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

21.01.2022 18:25, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 19/01/2022 11:44, Paolo Bonzini wrote:
>> On 1/5/22 15:01, Emanuele Giuseppe Esposito wrote:
>>> These functions assume that the job lock is held by the
>>> caller, to avoid TOC/TOU conditions. Therefore, their
>>> name must end with _locked.
>>>
>>> Introduce also additional helpers that define _locked
>>> functions (useful when the job_mutex is globally applied).
>>>
>>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>>> are*nop*.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>
>>
>> So, this is the only remaining issue: I am not sure about this rename.
>> The functions you are changing are
>>
>> +void job_txn_unref_locked(JobTxn *txn);
>> +void job_txn_add_job_locked(JobTxn *txn, Job *job);
>> +void job_ref_locked(Job *job);
>> +void job_unref_locked(Job *job);
>> +void job_enter_cond_locked(Job *job, bool(*fn)(Job *job));
>> +bool job_is_completed_locked(Job *job);
>> +bool job_is_ready_locked(Job *job);
>> +void job_pause_locked(Job *job);
>> +void job_resume_locked(Job *job);
>> +void job_user_pause_locked(Job *job, Error **errp);
>> +bool job_user_paused_locked(Job *job);
>> +void job_user_resume_locked(Job *job, Error **errp);
>> +Job *job_next_locked(Job *job);
>> +Job *job_get_locked(const char *id);
>> +int job_apply_verb_locked(Job *job, JobVerb verb, Error **errp);
>> +void job_early_fail_locked(Job *job);
>> +void job_complete_locked(Job *job, Error **errp);
>> +void job_cancel_locked(Job *job, bool force);
>> +void job_user_cancel_locked(Job *job, bool force, Error **errp);
>> +int job_cancel_sync_locked(Job *job, bool force);
>> +int job_complete_sync_locked(Job *job, Error **errp);
>> +void job_finalize_locked(Job *job, Error **errp);
>> +void job_dismiss_locked(Job **job, Error **errp);
>> +int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
>>
>> and most of them (if not all?) will never be called by the job driver, only
>> by the monitor.  The two APIs (for driver / for monitor) are quite separate
>> and have different locking policies: the monitor needs to take the lock to
>> avoid TOC/TOU races, the driver generally can let the API take the lock.
>>
>> The rename makes the monitor code heavier, but if you don't do the rename the
>> functions in job.c are named very inconsistently.  So I'm inclined to say
>> this patch is fine---but I'd like to hear from others as well.
>>
>> I think the two APIs should be in two different header files, similar
>> to how you did the graph/IO split.
> 
> The split was proposed in previous versions, but Vladimir did not really like it and suggested to send it as a separate series:

I didn't really like it as it seemed unusual and unobvious to me. But if we already accepted similar split for generic block layer, no way for me to resist :) And if we follow new logic of generic block layer in jobs, it's not "unusual" any more.

> 
> https://patchew.org/QEMU/20211104153121.1362449-1-eesposit@redhat.com/
> 
> 
> Vladimir's comment:
> https://patchew.org/QEMU/20211104153121.1362449-1-eesposit@redhat.com/
> 
> Thank you,
> Emanuele
> 
>>
>> Paolo
>>
> 


-- 
Best regards,
Vladimir

