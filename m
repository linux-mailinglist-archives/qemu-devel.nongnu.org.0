Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2960F358B5D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 19:28:47 +0200 (CEST)
Received: from localhost ([::1]:39312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUYST-0002KR-Om
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 13:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUYQC-0001Gf-0u; Thu, 08 Apr 2021 13:26:24 -0400
Received: from mail-eopbgr150138.outbound.protection.outlook.com
 ([40.107.15.138]:17315 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUYQ1-000739-5d; Thu, 08 Apr 2021 13:26:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ni0OF8Sh8eqUc6/XtK9jCFxPIg7e236kF1a+UxLQgujDaJ5x6QJU9hVXLvVOtUNl4eUSq6t7Py06WMavuDjGmRSEDGBCZ810FBUXuCn8iTu5meCQyYLbtjAGz58EXNHZZoT260eF/zluOTeXred5XLiEdAIADJyRmc1Phl6Rvj4leP0IRz/yNt9aRfm4DN4QEemdBfc2vLm6zd8hpTUXhYK/EdjmWNCcEfiyUC6UsurscTJp9iagbRgo8ltKZKMRL6t/OP9bvonmA/M9tv/jnu4OA+rR78DPe06uNliyroYrb3ZylxOmT6mopK4gKB6/8qSLV774q1mC7dcEdk+ofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIsRrgEJtbX3jgwvHf8vCRxcsQJYr2Rss5xV+O1Jyig=;
 b=Rs5wXVapiCr6uaVqDSSSIW2In4BDU4AV7xXZBakHpwxomWHl7eASRwjyzNagWrfTlfij2tSF+YeE6YYCxz6/GsPr5w1RFSO8Iq5GRcezQAsIvRN6dhTOQRQk32eHf3FhIgnW5Npbvf90WSLX5mZP4bxYUI7t+6RSNFotIV0/zei9PsD3UdS9XZc4no/kB2klKL+8xPslFkVCkLDEj2oY8Johk4j2o4t0wevXWs3EgJb2jhn8Z/kMTMjIib8Op5SZFH08LllyqXN7N8x8ojB2PmeDBjZFX/OTBzO8IIO+KKvlRLCmyPexkxQI9V9pDLYeUVrV/MeoJMXUWqJEZnlvFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIsRrgEJtbX3jgwvHf8vCRxcsQJYr2Rss5xV+O1Jyig=;
 b=CXyE7oeaOvKLzL+KSbkkvdIERQq0LTOcJxLgibXimu6bvb6xaEplnAaVQZ0orqI2lOvYVM2KIpbrQg4dYtW3vGJUNdNbi4ITJF6OjexSpGgE+getUx1rto8MulygCiSj5e/WF2ey7XG9d6y2gxECFWiTvNrG+OxHVRdN1CRvlFg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1651.eurprd08.prod.outlook.com (2603:10a6:203:39::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 17:26:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 17:26:09 +0000
Subject: Re: [PATCH for-6.0? 1/3] job: Add job_wait_unpaused() for
 block-job-complete
To: John Snow <jsnow@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210408162039.242670-1-mreitz@redhat.com>
 <20210408162039.242670-2-mreitz@redhat.com>
 <505ba75a-996b-0c65-0c49-add50e55e3ce@virtuozzo.com>
 <66c60724-d3b5-383b-7a19-9e9498e1c132@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ad98de4b-a51f-1cce-c44d-a80110712a42@virtuozzo.com>
Date: Thu, 8 Apr 2021 20:26:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <66c60724-d3b5-383b-7a19-9e9498e1c132@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.206) by
 FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.8 via Frontend Transport; Thu, 8 Apr 2021 17:26:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3142f506-952a-41f6-1b16-08d8fab36639
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1651:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16517F2D4FDF3960D177407DC1749@AM5PR0801MB1651.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S1M/bywI8NyUG+uJ+abka/HX0ipKFgFntI7H1jKEhNXbxOp6xh91N1PaN7uHZ0WTWQa968NagqJNDPPZbLldI5eoXKmCs0JKXOovoJ59lS8tnHVcawzfkvLhCMoqz0WYs2Km6tb1takuGvEqoTDJEqoFEUX5frHMSzj89FIkS/tvnmDKGbg64Rx6k98PEpgoWBztNoorlF93Ys4KeZirMc9KmZiHPdmwVG/hcW2pm3XMiiKvN5CCHIiGNh1pUOZm7jYlJN8f8Glf7X6LQEE6d1HHQwMUr9IjxNnrodDBd4LnixibHZtgwSGgBYy8UZW5+omxBpKqoxBNs4uQpnlYT69Y88m7k5ZVFGFMZ1YaA/FWRizGBjEugW79uOfgAKeKdpI4VTdIDr6DBPJM4ZFDwf6sRy8qwxl3WZK0KaNxUV9t8u1v9PQDC+Z8kNqm3FDpctIKZLzBFGyDGweR0RHhuiT41hlYHXK5ZdRS1xx73kn8QJT4ctIxISP6MnHQzVhIBHxDICn2bPN0Se0Nr/exhmKswhB3O1eKIK7398xreFndpT2T9OSj6FIUZ/VEgdBiO/KtdKefqbABaHPljx/CDrRBpo70C+/L2cr/vjI9Qv2+tfcPpL8k+ZA5uISud9PiOlBXBe+vpvsEla3ThXrd5hSDZED5wNu1TA/PENKL/aoUc5NzDwxQuAld5H3lqgCjWlJ82G+zgkFVU4WrfzPkDlyOIeQEeN10HTgTToCd0MFrindhGPH+th8L8S+HI2mJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(396003)(376002)(366004)(38100700001)(2906002)(110136005)(38350700001)(66946007)(5660300002)(316002)(8936002)(6486002)(2616005)(8676002)(36756003)(956004)(16526019)(66556008)(66476007)(86362001)(186003)(31686004)(52116002)(83380400001)(478600001)(26005)(16576012)(4326008)(31696002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NW1nZlFiM2xJb1N0VUtvK1EwcEt6NHdmNkU4Vm1TS1hVRFo3WC9BQS9ySU9n?=
 =?utf-8?B?SG1NV2ViMEt4eXpaU2pMREp0dXl1NGhQQ2UwMmxKaWNrcnJwem54UUlhR3FX?=
 =?utf-8?B?Y3loNXBLWEY5cWR4U1VXYmJ1cTQ3MXdwd0sxeW52WG81QkhhUFlKeXlBYlRE?=
 =?utf-8?B?VS9jZmhVOXk2R3dQenRpN284V01rZ1dTamg3OUJxUzVUeHdkMno1Y3pXQWts?=
 =?utf-8?B?QlI1UnFjWDdhUlZLVEp2eDZTQVZsOWYzSTdvM3ZPa0szQUFHdVZXcHN6SzQ3?=
 =?utf-8?B?a3g4cTNUd2luYzl3a1VaNzV4MWFTektVcDZPOGVGK0xFV2JyWEV4T3lsU0xT?=
 =?utf-8?B?YVkrVkpQNncwdVhrYnJZUkEvRndTUkhCV0dmQ1ZYNWF6UEM0RUFjclVxc1VR?=
 =?utf-8?B?eTFLTFJWYTN1WHFOdlJUZG9UUlA3UTJXaFJNMTNkbG1BNVliUGVYTDd3aHhn?=
 =?utf-8?B?ZDZCTTA1QW5nM3J5LzJTa1I0Y0ZCTmhNY25qZ3dXb3F5azV1anIxOStOWVlE?=
 =?utf-8?B?NkZtdTN1Q05iaE9uelRXZDc4RWF3ZzVhWURGcEdjLzgwbDg2bUNJQ2xKdUNm?=
 =?utf-8?B?dlZzU2lhNTN3M0hwY1Z1bWg4eWVlWWJBWUcvU1NDS1lyaXh1dzZ4a2M4dzZD?=
 =?utf-8?B?a0IzZ29hUkcvWDBIamg2QUNxdGdRUzN3TUgyZ29PekduSVRHWjhqb1NvVDRr?=
 =?utf-8?B?a0JUcHJCeFdpZnY3bGtwVWdDZ0piWWRIMmJUYmRvZ0VZSUwxSHlnRVJlOW9i?=
 =?utf-8?B?Y2gzeDl5QVVnZHNVZ2hWUGF6N0pEejZEKzZnNGQwSTA2empZVXdNOEtnWHJR?=
 =?utf-8?B?TWFnOWxvWmNiUTFGcXVDZVowOFZUZUQ5bHFOcm5XRklQNVlDelNpQ1pHZ3hP?=
 =?utf-8?B?V3IzMkRrQUk3b2pocm9BQXFpdVRHbVpRdDYyN3JiYjdoMGxqQlBBSDVnYTRx?=
 =?utf-8?B?NUFxVklNeVRrTnJORi9GeTNGWUtHcXdFZmE3NkxlOVFoOWpDdjJPVEx5a1Qz?=
 =?utf-8?B?YjFMNDFjSXRXWi9uWXlURk9Cdy8reWhIT0IwdUFNR2dyUFRBVVdOMnBnYkho?=
 =?utf-8?B?NmVhOUxjMnMzbVRLZi9UNnlVeG9WYXVQTVhKQklUcTJCVkJaNEJpajRMYW1H?=
 =?utf-8?B?ZG54RWxseXF2ZlQreExidEVrSmtMdVdWN2llNU9BYXlhdlVwSGV3RC9YWFR3?=
 =?utf-8?B?N2N3dTU4eElGOUxXanRXdG1mSUx3QWNySGFiYjB5ZVNoTDNTNE4vblZ4UDZT?=
 =?utf-8?B?VnRhRDl5b1QyMmpyQ3FYR1VyL3F4UUVKclNNVHErc3VDaXowcHBOczFIaWtY?=
 =?utf-8?B?SW43cndtem4vazBrL2VLR1pGYVZ1UCtBWlJUUjIvWVBtQlVxYzZBeXRaZkVx?=
 =?utf-8?B?UkhOU3pZWU95SHpucmViVTJTU3lKemRvYVhrWjBkbmZMNUNFOEZuMlkyREFH?=
 =?utf-8?B?TWJ2MHVEeE5SL2xJN3Jjak0zajJkUVJjYW9kR090a0J5U1lsN3A0L0xUaGF0?=
 =?utf-8?B?dVFDc1F1U25wTllUMHUrY0oxNnNieGV5T01sSzRhWGlQdHlPcldOZHk0cVRX?=
 =?utf-8?B?dkNyd1ZnMmNWWGx1eFVveXBTNkpQbFFVdEo3cTM4bm4yUEVuZGovN0FOZU1X?=
 =?utf-8?B?WDBKdllVdnVoajh3Zkt4MkJJamVqQW90OC9Ja1JYQjhFZWp0eFRhb1d5QTZs?=
 =?utf-8?B?c3FtVHhEOG1PRDhaam5SVytPa3BBLzRuaUdXMDYxcUIzMW82NGpzbzRXR2FO?=
 =?utf-8?Q?Vei2NVIF0yo0KrUDs3hlRhSGtsg56Trg78r97Kt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3142f506-952a-41f6-1b16-08d8fab36639
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 17:26:09.5089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zgg++XFA567HAiiNmEJZxWfFJ8reZ55gSL8ISupLSsW9GynqHHtO+MWidpUHEifneL7G3oT0abKBgx2h9L2tMtZz2WQMxVTH//wVUgNHnHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1651
Received-SPF: pass client-ip=40.107.15.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

08.04.2021 20:04, John Snow wrote:
> On 4/8/21 12:58 PM, Vladimir Sementsov-Ogievskiy wrote:
>> job-complete command is async. Can we instead just add a boolean like job->completion_requested, and set it if job-complete called in STANDBY state, and on job_resume job_complete will be called automatically if this boolean is true?
> 
> job_complete has a synchronous setup, though -- we lose out on a lot of synchronous error checking in that circumstance.

yes, that's a problem..

> 
> I was not able to audit it to determine that it'd be safe to attempt that setup during a drained section -- I imagine it won't work and will fail, though.
> 
> So I thought we'd have to signal completion and run the setup *later*, but what do we do if we get an error then? Does the entire job fail? Do we emit some new event? ("BLOCK_JOB_COMPLETION_FAILED" ?) Is it recoverable?
> 

Isn't it possible even now, that after successful job-complete job still fails and we report BLOCK_JOB_COMPLETED with error?

And actually, how much benefit user get from the fact that job-complete may fail?

We can make job-complete a simple always-success boolean flag setter like job-pause.

And actual completion will be done in background, when possible. And if it fail, job just fails, like it does for any background io error. And user have to check error/success status of final BLOCK_JOB_COMPLETED anyway.

-- 
Best regards,
Vladimir

