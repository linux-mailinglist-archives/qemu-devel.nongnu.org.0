Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B0149E3F3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 14:58:34 +0100 (CET)
Received: from localhost ([::1]:45634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5IH-0001p5-Rb
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 08:58:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD5Ff-00012h-Hx
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 08:55:52 -0500
Received: from [2a01:111:f400:7e1b::725] (port=13665
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD5Fa-000832-Ct
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 08:55:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kxhrldm3MkMCBzyFWn2B2O9foKRZkO1wvFrR3FBZ5Fn92a3pGbl+gM58FkOX/VMwq6FbKT1eUR+qf72Qu2zdgjSPkDi7RGVkmTkKFUjIJlQGrzPNQKzdXSYyFu9h4tSQfLWzszs38CtxD7E/e8H1o84QvknkMWjs6kbouf1snLlg4xBpWoYjTz5lGS2pEybsdQW6jrKsZmHkIf6+iXjX+uaIWl7xFmkPDLE+zGO5jyzCOV1L8J8rYj7zdIgJA/fKMi2b/14wz1tpzpzWN8Fwd1xug9100Bm+FeAr6Oy7hfFg5kXvvBjmNZiZgMOHhsy023zrI1wV6Q4fD2HeMDQK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96uULXEl68GccJ6PfWEk5B3h5QcH3+luoFwNiH4fwaw=;
 b=nyqLFdxIYsD1Z2Cpwb4xMk6OMvilnhFWYZbsz1GCV3/v1n+FYfVPlJiivFOQCRTjtMbZUR0dVchqsZX/6Ow750vzktYtu8DLnbDk2DxK6HXxTn5fiUwOAWDZU6xjZ5Eix7c4j09RqhEQo3RiSZjG1Wj/GKL0Z7F7I93xodlCgiaJ0TEVdFUVL6VtTBGvrlvQOQI51QqdKLFDMZa9yg1p17igYlOfQj2GPmRqOPWnOBfGKh+a0cMSAH6ofGZoZ2Gg04DammqQZR/hCPjpt2PTmbwxPfWbHsn6kWs+ya4dr2fVSMqW+0rqJptUdSW1mMOU7PzDw+Ly3dAnGtZw5Z5lIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96uULXEl68GccJ6PfWEk5B3h5QcH3+luoFwNiH4fwaw=;
 b=qoXw4v6pLWx2XI9X3VbAhJkMMIz/i2NGZB7oH7BM3XZlpGR5yt8tRcasdqGCBBcQa8BsLGDEmKocELSDQCSkObWGOvoFckHBGG0f0a8jgzizD/VjyGWKY4I/Uq/n3cuMiClVfZC5aT17iDWkDG84xVJDxm0gh02z6JP/OVuNNUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3113.eurprd08.prod.outlook.com (2603:10a6:5:20::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 13:55:40 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 13:55:40 +0000
Message-ID: <d80654f3-9da9-e3f0-3968-a0658627e6e1@virtuozzo.com>
Date: Thu, 27 Jan 2022 16:55:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 0/8] QAPI patches patches for 2022-01-27
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220127112859.222484-1-armbru@redhat.com>
 <CAFEAcA-63VsRor-FbOo7KhR-5R1a2AeBmJc=GzNTZmPoq5kWWQ@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <CAFEAcA-63VsRor-FbOo7KhR-5R1a2AeBmJc=GzNTZmPoq5kWWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc47bf5f-d8f3-4d2d-d1bf-08d9e19cb3f1
X-MS-TrafficTypeDiagnostic: DB7PR08MB3113:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB311394A5C09A8CB6C7F2C9B7C1219@DB7PR08MB3113.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eeYGTSGgkFACaYzLcNeePvxzilWiL1Er2Cl4ZydJhXkQt/6NSZp4+11c1znk0g1FPopXD+eLY3suUB9HMMYbDzQiOl2csHbSLGs8Eb9j3ZDqCG7yFwZH+lw5dopCKZbawRrOo3jlVtqR5ONWRfolq4h3TRKEJ79iSEosHCpEB0STtMULRbATw3ntgLBKDtXFLzIoBu/GFxSfi0CEfdh3bwzjLXIvCUp2vP0UUmNDlXmQYXjo6S7JdbTH5F3YcFlZj9JPNA68jvdJ5i3/VvxlQPn/AFst8VUhIEifi/u/U5hzoOEvOfLEGU9xL86H5Xk/mXvCY0mjdKnAO07J1dJRyN4mmhZS7H1PBW0jwhHbgot1j8ZyVGRSiAa/goCAqL2JKs0xd5wBFIjJB72q1N06/7/LpcOLLXOR75jJQRr96xakdDqmBuZrxiPLODOo9oHqDFYPxCS2gYsHjKYPCNCJmmfLFwOAFEkA/oQjzOLDZSAjZ0xW+j2GcXn/Vu9Qq2atYCfMv58WmJmVliAcR6D09tnVrJIR9NIp8njmWecbM6bJeUkKGfb6GjGBK59aotA8QiYQEjRc85SU0IlEJBzYKQmSY0MmrEpNB++WIiYQOCWqOFTE8Y0c8Pgr6umHNRC/WeIE65aNmGRCA5He2oHG0AkKXGvbX/6+MdU3uY/bRDvKCfHcy+EUPyQq4DWoXib/+NPQqICDuqOylFbpFkxhy70zpq4XC9RKg1KTlIEg3e0508ki+fjE2YOCRMkGlDTYvl/639x87jQe5w732MKxCoOz22ssdI0jl1p3f2dY/shwKAvIle1mVVVbmycgfquZxs9sHNahjsNUSYNd5nIp/A3s+jOGSlso2tSziTJUaHs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(508600001)(36756003)(6486002)(66476007)(83380400001)(966005)(66946007)(66556008)(38350700002)(4326008)(38100700002)(316002)(86362001)(8936002)(110136005)(8676002)(31696002)(186003)(6512007)(6506007)(26005)(2616005)(31686004)(2906002)(52116002)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blFLUVFDd0VBT29pYTlGcjByVjFBckVPNnZ6RDR4a1FGMzdRaXBydDg1SE1S?=
 =?utf-8?B?Z0VnK0ZYcE5wT0UrdEFlY0ZPemVCTEJtaTBoNkVFL0V0VkR6OUhmWWFHVDhH?=
 =?utf-8?B?SjM4T0dmaktaSnJOa0Y5VG14WVpQdlFoandsN1FpNFJTTkdUczd5OCtSelM3?=
 =?utf-8?B?M09xR3NNOC9nK1VFdnNiMk1Ia1ozcCs5bzBBYktyY0psODlFZjNqQnZ6UUxr?=
 =?utf-8?B?MU5Xc0FIWjBGVXcvOUpOOTdSTGVOVmI1WDBxZlhIcW1mV0RKUmg5bGpaK0JM?=
 =?utf-8?B?b2dTMzBWZ0JLOXdwLy90Y2VKUXRkSzVROGhtUEwrWUc5dWJpRStJL2krRnJx?=
 =?utf-8?B?eEQ3cGdjL2Jmb3dYdGJFb2ZBcEhMV3ByU1BxL3pYcGZzZkRacTErVjQ1dW93?=
 =?utf-8?B?VTE1Nm8xYzU0M1QzaXF2dk1sR2lpN0hUT0p3ZHNCSVdoOHA0UzR2UGgyUmtQ?=
 =?utf-8?B?TkhYdHNCU295R0d2K1h4V0xUMGZPd1BSZU4wUHBqVWNRWUQwb0ZkTGsrYWZS?=
 =?utf-8?B?emdKRENUUDY4dGxWY1prYkd3eHVpWE5xSFBGbzkxTitZcG5TajVPVGxhRUcw?=
 =?utf-8?B?QXFnWkRQR0s0aXVsSGN0RjVwdU1QaEp0dUliVnFrdC82b3VNaHZZaGcwdVZ2?=
 =?utf-8?B?MlZNM3JCbjQ2bXI0R2J6VmVMWDdnOU12OXU3TitFbXU5YnV1SlNYOURZUGZ6?=
 =?utf-8?B?L2hlSEZPUmFseEFJd1ZZak1YdEpHNTVaTVc3eDlpcFMvdnhvN3A3cHJBeWdN?=
 =?utf-8?B?YjdkRnpyVHU1ek5WVDFadktXbnVRL3NCSjFWTTV0eTYzNmVaNUpiZWRvMk5n?=
 =?utf-8?B?Z0Z4Q2k4ODBJSHZsSUhjUi9BTXkxYkhQd2lLS2lUK2JlNUVzYVNsMnpoRHg3?=
 =?utf-8?B?WHRVZXlRZUpOSENQcU9BSFJoSGludFF0dHJHcU8rU0NwU1ZHZkw4a2xlUGNs?=
 =?utf-8?B?eVJNdnY4bjl1Y056Y0s1UXFQM1B3bnkyWk9GV2l5bE9GMGZUM2ZvL2F6eW1m?=
 =?utf-8?B?czE0TllqZTE1UFFZdGlBUmgxR3pzZUVkSGdtY1hkSktzZ0VhR2tDVXJ0Qm1G?=
 =?utf-8?B?dTJuRzhsdjJQVndqaHlMMUFURGI5ejErV2RweXhoaHJQVlRSK3dKajdwREx0?=
 =?utf-8?B?VWRkeDhHY243VmpWek9xUWVZZHZFN3grVURyVEtkVVJSSHlCOXhtL1liQVdx?=
 =?utf-8?B?b0EzL08xRTJ6Mll4dFJRYXZ4eHVGVzFSSTZ5RmZBSU9HbEJmUHhiSG0wd1Ft?=
 =?utf-8?B?Rkw0QmErWjZjQ3czbFdsOHp4VWgzeVEwODViK01pK2VETko0REVHYTlwZ3Qz?=
 =?utf-8?B?aGZrMk5XOWlMaXpGWVc5bHMvdXpwT0cyZTcxL1dFajJRNFp5MXp6YkZua2ZE?=
 =?utf-8?B?aDNLeFJDTmNxSG5XdkhBL2I3dzZCQjRiWnFHcmI3TkN5anNoRFVZRUc0RU1V?=
 =?utf-8?B?TnN0NXJWbGZCTjc0RXVhblllU1REMERCZmZMaG1Sa0F6US9qVThXRnhoS29U?=
 =?utf-8?B?TVVSN091ajhJbThLMno1bEJMRWsrSlp1ejl0bmptd2xIaFc4ODhETnpNQ0dO?=
 =?utf-8?B?blViWmNaM2JuWnpGd1ZPKzBkd05jVjF6disraVBGaU9IZ0pXLy9pNE5ibHVG?=
 =?utf-8?B?WldhZmVVc3hQOW1jQ0szUVM3SGR5RWpCSXRoUk4wWDY2UFh4UnlQQzRuN3J1?=
 =?utf-8?B?dEZmWDFGUjNySnVzaWhaS1RMaWdSN2tqdjZVaXRXSW0wRnExUkNZdHJFeFhG?=
 =?utf-8?B?VG1Sa0xXVDdOZzk2YkFERXI4T0E2a0tzTlVzQ0tZNEpzalMxMzVOMis2RWdy?=
 =?utf-8?B?M3BNODVOVFBBWU5BZEN6OHQveWNCK2dXWW5STUc4TlFWU3V1WUN6LzkyczJq?=
 =?utf-8?B?MHNKaVhNVS9lVjhMUEc2alRpaVhMckFwR3ZFZmNGcVZXWnBBNUMwaFpFem9i?=
 =?utf-8?B?MGFJWUxQM0NQTHhCWkpXYUNROE13VjBsSmlweEdOVkpYdWJpditCY2tlQ2Mr?=
 =?utf-8?B?RUZuZ0xGdjZUblEySkRaQ3QzUCtWZFFFS0pPMEk3eDJXdjd0ZjMwWXB0RGRO?=
 =?utf-8?B?NVNHR25hTDlZcUhDMFdZeCtNMFZPZndZMTM5cm1Nb1NzcTJITlMvTVEzZTJq?=
 =?utf-8?B?eEorb253RVJzdUhiVms3SzNYYkoreUdBaUlhZ1RFWWFpWk5rSkovR0E5TjR0?=
 =?utf-8?B?STJEZU4zM1lXKzZhcllYaWtZbmlhdURIeHY1eXFNYXdjZnZ1d1FMSVpWYTdp?=
 =?utf-8?Q?j3Yy8KSW/oJ+t7R+1wF2kR23G/VubrRotJHdmxRUQc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc47bf5f-d8f3-4d2d-d1bf-08d9e19cb3f1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 13:55:40.2408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6F2rxWB6IXLl5h12gCP8e5dO7odKtxEngp9mO60ji0D5cJyz22EuOrRZ+dpk4nIW5rt1ljrj7U7rvAAg/ujmJUIAec68pBj383cphGHpYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3113
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::725
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::725;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

27.01.2022 15:56, Peter Maydell wrote:
> On Thu, 27 Jan 2022 at 11:29, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> The following changes since commit 48302d4eb628ff0bea4d7e92cbf6b726410eb4c3:
>>
>>    Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20220126' into staging (2022-01-26 10:59:50 +0000)
>>
>> are available in the Git repository at:
>>
>>    git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-01-27
>>
>> for you to fetch changes up to 5161c168b44f3a8fcae8c4f29c81f374ab0af8e1:
>>
>>    qapi: generate trace events by default (2022-01-27 11:28:44 +0100)
>>
>> ----------------------------------------------------------------
>> QAPI patches patches for 2022-01-27
>>
> 
> Fails to build on the CI jobs that build docs, eg:
> https://gitlab.com/qemu-project/qemu/-/jobs/2022584945
> https://gitlab.com/qemu-project/qemu/-/jobs/2022585026
> 
> Warning, treated as error:
> /home/gitlab-runner/builds/CMuZxyfG/0/qemu-project/qemu/docs/devel/qapi-code-gen.rst:1634:undefined
> label: tracing (if the link has no caption the label must precede a
> section header)
> 

Sorry :/ again, me not enabling docs compilation to save my time and waste others one :(

The fix should look like this (squash to "docs/qapi-code-gen: update to cover trace events code generation" patch):

diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
index ba83954899..4290ac42ee 100644
--- a/docs/devel/tracing.rst
+++ b/docs/devel/tracing.rst
@@ -1,3 +1,5 @@
+.. _tracing:
+
  =======
  Tracing
  =======


Than link works. For example, in docs/devel/build-system.rst we have :ref:`kconfig` and docs/devel/kconfig.rst starts with

.. _kconfig:




-- 
Best regards,
Vladimir

