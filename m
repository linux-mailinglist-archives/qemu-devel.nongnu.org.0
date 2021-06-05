Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B4139C8D2
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 15:31:52 +0200 (CEST)
Received: from localhost ([::1]:37658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpWP1-0001e9-Uj
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 09:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpWOD-0000yw-PJ; Sat, 05 Jun 2021 09:31:01 -0400
Received: from mail-eopbgr30091.outbound.protection.outlook.com
 ([40.107.3.91]:42726 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpWOB-0000pl-W8; Sat, 05 Jun 2021 09:31:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZSYDWnxCgsxuhc2ifylNXWJ+FzGkABECVuuEP5CrZoC88bB/eK5EUtW3iFI4oM0lSUebcjpE5jJFOJZqLkPMIo76YgYVH7QCavz4Vkvafj52l1RpWFtpU/Kucyr//Vcju7InnXs+Hwonq5EphmcgNKUX9L6/Tbatgp78o5GwdgE7QRxSBcBRCa5PT2Mfq9xrfK2gwSHLMDIiFldODHj32iXdzqV4za/i8ponmT17BKxopjlBd6qaBXo0MmAkA/xgRUhJihSnurRismifTuu/eLUoH2XUjnTDe+cXI3/8XloJoh//PM60JwB67M/Wcjo1XCgF+Op2zNVn0aRnst4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aId1oz9nbNksEwCFmpyoGIcU3KQVhNaBpXEwe+ys9/c=;
 b=WDCTerFt7pOCBtoNEzoPnCdLATCWxunhi9vvF8PwAGIEKo45nLsd545qTcHUOzmJRRmonkaDxoNpS13zQt3zXC8RIDG1A/pm5YudmwUoP4B7+KNPonyrvWwjTu8idxBFtwOmHtD3f6fnMKUwskOUYqOIqgjEKFjm7OHfgvRq6e7VYCeZyydwS4NaRmUbNFyZ2kdiYnkeWjwQLmYkdpS+CDCabiOqBhZZRU2tut0xt7H3a0hy5TTwrZ1nBFRh7YAg9xHgynm2ljITq3wxNZkgp6q3n/qpX6J0pqEm4bbW+czpwOEYPGMUzTvL09V4UXCdXkm4uomdS+/u4RwffC/+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aId1oz9nbNksEwCFmpyoGIcU3KQVhNaBpXEwe+ys9/c=;
 b=Fuzw6fBOZl5CR8sDUliqRhfTyx9L3WVY7bnY/pHnkuvwOLXDILB7iS3v0zjXZCpDtnFS8ekq58lXuFvQxIz7BjcE7z0+V1h+/GtxfNrmgqtpR0RsgChCeVR9LxQIH2Tr0vH8mn9VB+k8+yzazXXw3uONns5s+UBSNe+ygisuHFA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3896.eurprd08.prod.outlook.com (2603:10a6:20b:83::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Sat, 5 Jun
 2021 13:30:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.029; Sat, 5 Jun 2021
 13:30:55 +0000
Subject: Re: [PATCH v5 02/16] python: Reduce strictness of pylint's
 duplicate-code check
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20210604091723.13419-1-eesposit@redhat.com>
 <20210604091723.13419-3-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <399f8d2b-f66b-c516-e04e-b9ee1654a0b2@virtuozzo.com>
Date: Sat, 5 Jun 2021 16:30:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210604091723.13419-3-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.208]
X-ClientProxiedBy: PR3P189CA0086.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.208) by
 PR3P189CA0086.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Sat, 5 Jun 2021 13:30:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc402f7d-6a85-4dcb-52d5-08d928262547
X-MS-TrafficTypeDiagnostic: AM6PR08MB3896:
X-Microsoft-Antispam-PRVS: <AM6PR08MB38961CF005A1D3B22C7F5639C13A9@AM6PR08MB3896.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kLEpSnYc6EPIYV/p+Nyp02fX8s410szD8fyNItsmoOouc6xOO09KmuBDRqvl3X21bcdrquFXbzwDvsuSp9HgqygZcwS6JP9T1QapeAhnff82e7UE9nkWfpcKvmA8aEIPpqnZ/JlCeWrcO1UnrMn0ntP30kHi4wEMODbibQFKRoFF5/N2Ht7q7gmJ14okWcl9YAGXcAByAThmy3JFFqnWbfaBS8fJYldwIf7BfVOol/hwJ5LKhWMVX9KFxM/ZtEjZU1YiEKc9ld/m12RBCXbvioCaI3AaFLm+oLHtzAhwEwj5nAUayWfPPO2FvoTrM81AU3+50Q6hBFQxR5+mHR44XZHvqH4YhtgzlYHaPCYaquBr8R/iZN8Q0/TiOEMLRZYUmhtXM13lAluBuJ6lxATGX8VKXGMPk/y+UCjFblGI0v0rBNSJ/z7Wkimxiw3FLOiYOOGWf5qaDlg4TLoIs/CFSKFZo7zdEz0uOPFT6mO2RNuSD0Jeb1xDvFnEkXqIgEg6ftnKRT6Agufm+V2k5wyI/4A3KHzev96Ehuo3JQHHkFncCZfUiRZrwNREVnVZh7UNhFIJifKB92ROLcz6+O4kI2gOUBpPXMGuGd1FoqCZdzmNALKxZc+s3b28CQuCEx3YtowXpY++HO60V+4rP7H8HVk1AoGBdNDzOpxI6Vs26QPRXrQYAkM5WHCpfdEfRotCzqqFkbIXtYJAbMXWrJlKqRlzbAAGCfvV9iDT5kpQvk5Zyacmd7tYL0M1YAVFhHYh9F5C8+0Qe4ndZuFnJjNoRNd+qM8cAFN9uU+TU+NrZWQkirtiKY2Oh3DB9GqjmgY2p6uqgf+QHF5HPC5wKwsTFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39830400003)(396003)(376002)(2906002)(38350700002)(86362001)(54906003)(31686004)(4326008)(52116002)(5660300002)(8676002)(2616005)(83380400001)(6486002)(38100700002)(66946007)(16526019)(4744005)(31696002)(16576012)(316002)(8936002)(26005)(36756003)(478600001)(956004)(66556008)(66476007)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aWZjKzN0YVdwd0o4M1crMS9zVHp2UnczSUNuTFdpbU80c1ZNam9ESk16b1JE?=
 =?utf-8?B?MGVQb3BWcE1kT0d6UmJaK201emZ2RnFMMTBuUjhRODBZd21vS1pKN2lxUW12?=
 =?utf-8?B?akRsdVJOeEdxdis3bmRvTWkwS0xMbXpXOXJDUWswT1cxTkYrUkJnZkYrVmls?=
 =?utf-8?B?cGFNWGtpY2lNanl2TC9XTmRHM2p4Z1BXZzB3Rnk1eWV5T3NqYTVyNlZOaGd4?=
 =?utf-8?B?N3JRRE1PTEE5Z1V6bWRCeW5wVzVmREtNQ3F2S1lBSkFlbUtuR2k2VEY4Nk41?=
 =?utf-8?B?UDFWd2R0SExtcDhwWlFMSy96eURicWNnZjJzYncxODFmeUlPSEEybCtNZ3U0?=
 =?utf-8?B?TG5zVzluWVJLTy9KUzl4WVh6djEwejd5bVBZSmtSQk96UEx3TGp4N04wdDJ3?=
 =?utf-8?B?VmZyNGg1OGl3RnNsNFg5QWtaZW9tTVNldUw2RGE2bER6ZHVxMjhXZXpqUGFm?=
 =?utf-8?B?dTRNS29ZNm1SWFBYcUNScG9xcDQxN3g2dTdFWmRIMjYwQ0NSQUFKTzRRZjZH?=
 =?utf-8?B?bFJtK3NMRUxveXZwY25jc2U3TldjWkV1WFhXaUl1am1ZcU54cHZDdEtuZkQy?=
 =?utf-8?B?K3kzQXN5WVMvYUhoM2xBYTRaeWtUUSs4OTd1aktxdTR0VzhHUGkzdmFDQmYy?=
 =?utf-8?B?ZVh4TnltUEFQSjBFRzQxQnEvZ2RCOEsxNTgxTzVHMU5ZWE9XekVpWkI0WDlx?=
 =?utf-8?B?S1lEamt4OGljbG5qY1hSZTVkOCtGWGIyeGtUL1dFU0VBUkluM1V3ekdqbWNj?=
 =?utf-8?B?V0pWN2FZME8wU1Y1NXVJcnZIQ09nVUMxRGpEZ015SEVoZUg1dkxEMlV6VlVK?=
 =?utf-8?B?b0ZZbDFmZXF1OHVkTlA3SFFIY0JRYlBaL05JcERLSDNSQjIzMGlQdld1VFQx?=
 =?utf-8?B?VG1SZmVuMVoxWTR0clY4MTBCem40azRMVFlEZHRNTHZ3Q1ZRWWFHcHI2dW9O?=
 =?utf-8?B?YnN5eXA0Nkw5bWFRc2dxcnIwbU82K09mMkpnamFIMTA2ekcwUHZXdkpmTTlG?=
 =?utf-8?B?OFY4aWRObFIvbGl0RVYzak5EcFM2MkZtRnlDUnpvQ2M3dzJPeDRDSnZabE1s?=
 =?utf-8?B?U3pjT05BbDZBckoxbHR4MS9BSGlXaHB1aDVqbDdEek8vVHd5WHFJdmdLdFFN?=
 =?utf-8?B?MlZzOGQ3VzVWRDg0WHNtQmtndVNMTzBNelduLzdqZUxOWFlYTEQ5WE9PVU9h?=
 =?utf-8?B?RmZpM294UDR4R1ROZmxGcG4xVWlqSUJMYllvWFJkTE4rT1NDSE8zaldRNVAz?=
 =?utf-8?B?dWJBdFVady9rM3VoeEV2eTdvSlM1QXNuS2tPQzV6dWZsN1I1WjI5dERSR3Ez?=
 =?utf-8?B?RWRtOHltWHRxbCsveVJkNmxGTUYyTHhlcHpEVjZVSDEwWjAxTEVSQWNBaDBS?=
 =?utf-8?B?dnRJQkY4eVh5STh5dUtFZ3JuU0ZnY0ZQMlgzNUVxRS9EdnBVNndUWGlOek9T?=
 =?utf-8?B?bHZFU1dqREZhcFdVY1czcDZMWU9HaloyT0pOQVlLRTFsQzFnSzNpZ3ZGZ3gz?=
 =?utf-8?B?K0xVR3VDTTlpaGpuZk5uOG9XUGxjKzBtNGRtSlBoTCtkRWRtT3YvamZTVFc4?=
 =?utf-8?B?ZmJsOHlqaGRYTnE0WUNjTVRlczJZQWZlbmdvc0xtaUhPblhHaUJ4Q3JhK09L?=
 =?utf-8?B?QmJUczREbHUrMkJONG4xQzkyZ0EvcHZxOVVJZ3IxRXFhT2hQMXBzRXY5TjhY?=
 =?utf-8?B?YXZNQkMyMTV3bmtuRjBuTkcxWWw1aGZtZk5GWlVoRGtBdmNBdENVTVhQL2Ru?=
 =?utf-8?Q?SPPPuUFh16BixwVQsPQ+BCbOsOSndLDugxqXFyl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc402f7d-6a85-4dcb-52d5-08d928262547
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2021 13:30:54.9592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05Z4bBQ3V6qpI7BBw2voDdGd72MSPPaqWt1qLtP0ngfcFyXJ0ZgAKeGS8YonV0FGxgTrLKZFIufRrYWEUaStmMybDLFqa8yuoA2Vsrhkt8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3896
Received-SPF: pass client-ip=40.107.3.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_LOW=-0.7,
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

04.06.2021 12:17, Emanuele Giuseppe Esposito wrote:
> From: John Snow<jsnow@redhat.com>
> 
> Pylint prior to 2.8.3 (We pin at >= 2.8.0) includes function and method
> signatures as part of its duplicate checking algorithm. This check does
> not listen to pragmas, so the only way to disable it is to turn it off
> completely or increase the minimum duplicate lines so that it doesn't
> trigger for functions with long, multi-line signatures.
> 
> When we decide to upgrade to pylint 2.8.3 or greater, we will be able to
> use 'ignore-signatures = true' to the config instead.
> 
> I'd prefer not to keep us on the very bleeding edge of pylint if I can
> help it -- 2.8.3 came out only three days ago at time of writing.
> 
> See:https://github.com/PyCQA/pylint/pull/4474
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

