Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19105361ACC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 09:48:58 +0200 (CEST)
Received: from localhost ([::1]:50454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJDk-0002Hb-N9
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 03:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJB7-0000Qb-NH; Fri, 16 Apr 2021 03:46:13 -0400
Received: from mail-eopbgr60120.outbound.protection.outlook.com
 ([40.107.6.120]:43589 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJB1-0001yr-Vf; Fri, 16 Apr 2021 03:46:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8E8SSrZocDRHKilBOJKDSjhsiNLB+LfNy621BoKHSbJd5nMRemeKABiBEajGCvDL2YL1bU7n47s2+bXNaB62pT7TJcp+I8OT+0pKCTAfC2ld+Yz4PUPzqNp15WZScVz8/G0o2TZTX0f9PfnoDIjvsGKwoWmSkZBMgS+0YinevLfbFX5X8UFOji56RqyIZ508yStzOSQhcRijqM/vo7Vj3UFOzOkbktUCcaPSULkhTTv7t1JJSR9EZkBxjslt0Pn12oQFDHF7avImZGTa6AqE9neGTigYDpV8LiFOF1ogoFJfAcKVkrJMk3lsxhG9u1c5TzRY4jpcjQSVeykwQgbng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWF/1H0zdXLIpDrq7+/C8rbUZlrsXX+2/uSKr4OcxC8=;
 b=mJwXFrh/wiQRccGtUwLVqCJ2gWSETuoRwUVXS9XVMJ7kXEFuFte9ko/ZJEesywVe32WEhHGnuaoCCUv1F6e0V/vNjYI7jqnHKGhMcxk6jnivr3rrgL0yQOFZOQisc2LUCErWPIHLagBeZ61oybjvBZRervdMrMf4gVIj5yrm8gOGemcjBMKaDeD25IrK0eq52wAruC/c4SxiMzinAYNK1QjRpYArPmXWVI5feQkWPwuApSmVNxTK5rSj100cewPqtekT9EXW2aONlrAcafXTrq7SwtgHcA+yhGIMrX7XV0cFwgOgmWvXUP1cnAG9I7NlNRkmAGslwk+7hLJK8rWDcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWF/1H0zdXLIpDrq7+/C8rbUZlrsXX+2/uSKr4OcxC8=;
 b=UKYtvmuLn7Y3eB+A/nBnVpn0Dh7h8To5twBsHn9f+h2JRn3JCOzVFDlvj5ZFKHpBdlsXu+8Ivt9FmyqpPLp3fzPiIxcONVumHlU86xQzTZDo9VEOUc9MLiARCaWbki187Bjrq1/44XWAxUzsMhYTDjhSvswbJbn0cuxnm3JqOzw=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6261.eurprd08.prod.outlook.com (2603:10a6:20b:295::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 07:46:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 07:46:01 +0000
Subject: Re: about mirror cancel
To: Max Reitz <mreitz@redhat.com>, qemu block <qemu-block@nongnu.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Denis V. Lunev" <den@openvz.org>
References: <b2e5b990-ca1c-53f0-0e0c-31396156fa4a@virtuozzo.com>
 <5df8166f-a204-6510-e27a-1b334f0bb3f3@redhat.com>
 <ea96f574-dc36-2546-53be-ddb02ba02880@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <02fab6a2-5665-6e3d-090c-68eff4bfc7a6@virtuozzo.com>
Date: Fri, 16 Apr 2021 10:45:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <ea96f574-dc36-2546-53be-ddb02ba02880@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: AM4PR05CA0005.eurprd05.prod.outlook.com (2603:10a6:205::18)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.206) by
 AM4PR05CA0005.eurprd05.prod.outlook.com (2603:10a6:205::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 07:46:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a9ae95a-6bdb-4998-ddcf-08d900abae56
X-MS-TrafficTypeDiagnostic: AS8PR08MB6261:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB626177E4AA31476E5CB1C28DC14C9@AS8PR08MB6261.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p79B/qJagr4tWiV20zT+LOAQAUx3sHxZGfHM5QT+kncI69ciz9csTpH8+9RBLbVMgqqYz9SW6paobiyMd8ZvFkk2YY0nxKBx28Ntw2JK9OyWB+QQVigUsmfurv5KaOr2bViWGAZgVP1+nUEdrn8C/IFBZKJ459B4peLTj+V8Hiiu2lXrllhT7aTBJrp01wqNjBmVbr/xiuVmcD9EfLqeWRSf8YCMSXnMP6Ww0yyHszL60vjATYVYCeCVE20F3x6PJGmh9sj5B/ddnowvpq90GxONFdje4XI42uMjb6e0Ib55Sho397kW1EmUMknC6tGM9or62jlbBU4IgFR/ooSr2TMr7J0M56KvzWQaaLQH02t2k65qtfNiA4H5MRg9rjkMaL/vZMcYwcnOgcIpXByRuUVAfHCfPVNIZ4/74+SLTWLhL6QeqTfqaK9vWpLgRZMuFw/V4HRMyGqLqNIqQAEu7Tu4yC+UByD89Bnl/rcyMzWHlBKmbY0vPEitC8u5uOtztz7hQMROCK8UW0V/cmC8PTuLCepcml6Y/vGq5lomA/qZ0rEflr0Fzgv/l0/RVM8TJYEa3PTyWuWBx83uK86vEXnokvRDzM7Q9LnAUCD8Q3DcLuLbrWNKC2PlLkrcQrMWy+X+kYGv2vd/9oxGXo5T9sfh5mRecs5uCF8WKyAwkUMXkjz1ZrqByt1oSSRigFqiJjh1yiXe8bcjRMA1yXqZg6HYOWCGYSonadWYsqC+lZs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39840400004)(346002)(396003)(366004)(3480700007)(86362001)(31686004)(66946007)(110136005)(83380400001)(38100700002)(2906002)(26005)(38350700002)(36756003)(956004)(316002)(2616005)(186003)(54906003)(478600001)(6486002)(4326008)(8936002)(107886003)(53546011)(66556008)(31696002)(7116003)(16576012)(52116002)(66476007)(8676002)(5660300002)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aFFXSjc3ZEpSUjlyVzFNWDQ5V3ZaNmZRYTFDQkVsbVFOelhPbzVCelkxWlZV?=
 =?utf-8?B?a2FSL3dEc0plVVVBSnd1MEw4amg3WlZlbllDWnR3TW5aWVNhN3pSSGlnQUdO?=
 =?utf-8?B?Nnp3OVhaNFFUU3lWeXhiWTQ2L3FsZmdMeElBaGNzRVF0ZUlqSCtIbEg2eUFO?=
 =?utf-8?B?eEhmV1hyMDZuaC8zOHlsUE8rYmUrRU5BeVJ5SDFYRWk5eHlTUFZ0Q3d2R1VW?=
 =?utf-8?B?VjBlM0FJNWJ5STRSY0VvOGhkK3BWZEgzQk9nMmNOY3FTdzVKYTZCenJMeUpw?=
 =?utf-8?B?amhUMVIxNmdxQVFtSTBzekI4NHp1UWltN2R0L3gydGYvaWF2VnplZUdyS0dD?=
 =?utf-8?B?TE9YZWt4OFFoRVMvT2VCWU1UTm9QZFAwOWVudnRJSEJiZ1dlM2hxeDFpWDB1?=
 =?utf-8?B?cFFWVjAyS0V5ck1tRWxrTW9LTzlLa1lOeFhqWFdQc1NDbWFyN0lKdjhXSkZX?=
 =?utf-8?B?ZXVtdWNyOEZDdHBQNGF6YS91dUtKUUxiaGRUVzhLOStKcnAvMmhPVnU3NHJS?=
 =?utf-8?B?dU9vd2I3T2VaR0RBVk0xM2tBbHQ3cnFFQmNNV1YvTkxvVWNLNEpGRTNWRGdw?=
 =?utf-8?B?UEZVbVd0bDIyOU9BQmpRSkJCL1lRVDJ2QUlJcUZET3NoMDM4NjZBN056amVw?=
 =?utf-8?B?Vm9zMnMwejVFUG13T3hJdno0cXlCcmhXeVYzRkgzYVo4UlNiR2Q0bVI4WWV1?=
 =?utf-8?B?NG9wb3RXTUtBV2MvNC9tOHNsOElpRmRDdmVHdEZqNUZBUGRLZDJ4bk5lNE5j?=
 =?utf-8?B?ZEVHUUFMdVJVdzFmNXBROEk2dzFKdVR5VWNvbFB2L2RYWTM3V1dRcnVWL0Vi?=
 =?utf-8?B?MEE2SUtTTjZYaWJGdktZRjdSbFlZMStyM2NRNTZua0lDdTQxbEVyMlBFcWlv?=
 =?utf-8?B?RE80cS9TYlo5dTF1S0JNMHpwYzZXQklUWWIvTjhzWVJBTDcwcmxwclRwbFJW?=
 =?utf-8?B?QXR5ZyswNTlLSlhBTUVkanZXSlVob1RIVlFoVFpGaHErTXJoVmllUlFFTG5V?=
 =?utf-8?B?VXNsVitLQ3lRWkNkNXYyd01rUng5cG9zd0twMG9vTjRNZ3ZKVXpDTEl6SFZR?=
 =?utf-8?B?Rm4wYk5hZlNoakphWkJmdEhUNkpKb1B2NlcwVGVtZ3VFblQwekMra1dCZ1RQ?=
 =?utf-8?B?Q280Q293QkF2OU96MFNIekhrU011SUMvR2o2OUJoTkZKZWRZL1RqM21KeERt?=
 =?utf-8?B?Y1pDL0ltU0NVdVJhdzA5a05vMU96RWloTUlGOWtPY1pwTFJHdkZKd3pBcmJ3?=
 =?utf-8?B?MjFnRHhsUFhiYStuYTBSZkNEY2FqQzdDbXV6aVE3RmNjYWFBeEttMWMxZlNV?=
 =?utf-8?B?TlhxTDJMMWlleTloSEtGRWt1MXBwa1pJTjhwMjVHMEQvajZQLzdiSXMwUjVo?=
 =?utf-8?B?N2Z2YTRlNGlSeW85bGdMMHUwUURVbUhmRUtVSUNIald6ZW9LSUZoRmZvZXMr?=
 =?utf-8?B?aDBZWUxvNVpUeE92TWIvL3R0TG9MMUk5MW9PV1AwY3pNWWxvSjhiQ0ZOTzg0?=
 =?utf-8?B?cVZsVUVKQmFBaFN2cTY1YTU5cStLVDd4QU9HRFFPS2tTdm56cHRyQXZCb0hQ?=
 =?utf-8?B?Rm1UTGZXWjA1WVhrNUcxRDJzQWg4emJCRk56c2d4dXlISjlVMnFxeHczWkMr?=
 =?utf-8?B?Vm9DQjU5dEc3eUV4cDQ1RlJRQjRudXpTYUZTRlNvRy9QOEhLcG5NVlRzMG9E?=
 =?utf-8?B?czlkSVU1dkN0aFpFS085SFlEMzh3enAvZVpGVndjVWxOK25SUWpNM1NjOWNm?=
 =?utf-8?Q?XbWx9FhE67QDoTH6Avt/boRQL7l01/faY64gj4S?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9ae95a-6bdb-4998-ddcf-08d900abae56
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 07:46:01.5853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: osqCPLKlI7O4VzNpszOKI0q7J7rHxOqwaOV//Eqz0Y+JwRvUcQFAI7E7xRQQoINNaogl/HigrvU+tdr1bkkkpqK5XfPJ6iZ2kbGvUAC+2/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6261
Received-SPF: pass client-ip=40.107.6.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

16.04.2021 10:11, Max Reitz wrote:
> On 16.04.21 09:05, Max Reitz wrote:
>> On 15.04.21 20:46, Vladimir Sementsov-Ogievskiy wrote:
> 
> [...]
> 
>>> Note, that if cancelling all in-flight requests on target is wrong on mirror cancel, we still don't have real bug, as the only implementation of .bdrv_cancel_in_flight is stopping reconnect waiting in nbd driver. So, we'll cancel requests only if connection is already lost anyway.
>>>
>>> But that probably means, that correct name of the handler would be .bdrv_cancel_in_fligth_requests_that_will_most_probably_fail_anyway()..
>>
>> It’s documentation states that it should cancel all in-flight requests, so it’s more likely it just isn’t implemented where it could be.
> 
> Oh, I now see you added it in the same series.  Well, then I suppose you’re free to change the semantics as you see fit.
> 
> But be aware that even cancelling those requests means that you abandon the target.  So it must then fail instead of emitting the COMPLETED event (AFAIR the mirror job emits COMPLETED when cancelled in READY with force=false).

Note that BLOCK_JOB_COMPLETED can indicate failure, it has error field.. Interesting, does libvirt aware of it..

> 
> If the user wants the mirror job to create a consistent copy and so cancels it after READY (with force=false), I don’t know whether cancelling those hanging requests is what we want.  If the cancel hangs and the user sees this, they are still free to decide to cancel again with force=true, no?

Right. All right, I'll remake the feature to cancel requests only with force=true. Thanks for explanations, and great that I decided to ask.

-- 
Best regards,
Vladimir

