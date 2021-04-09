Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1613597EB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 10:32:30 +0200 (CEST)
Received: from localhost ([::1]:53230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUmZ3-0000fG-Rj
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 04:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Yanfei.Xu@windriver.com>)
 id 1lUmXi-00006i-Fs
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 04:31:06 -0400
Received: from mail-dm6nam11on2050.outbound.protection.outlook.com
 ([40.107.223.50]:3808 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Yanfei.Xu@windriver.com>)
 id 1lUmXg-0004e0-Uc
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 04:31:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpWeHIzT+vfD61Kgtl3U4N+cujh7HUs/q8tASOi9Z/YjHzMVXNRgYV/B20wbVtxtzIZuPJZi8exYE8qgqi+TvGBcaGx1o7O7hkmJSx1sXNsFhk55B/bsjFbepfGm870VC0PvyDLR3r/4bTxtSY9cDbT1fLWhRjC7t6ql8WIOCPeh9Rr9KhvhGSlweUkfDCM9smVWzqwXugxD0BJaV0Hh0fXpzKdF3IIVw0KFFnxdZSjzkVE/7e9Se0Kkn93vRFaYb+a056O/lB7OJgLTNXhvJQaDbo1cuniu09qJzc8Fv54UYydq2iqvjZMu0O2Ky8qxTsasi+VdtGON2G40WlMF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oT8CFujFQwwvWvilqisUbJpw5py1f8K1oX2hYbcZWaM=;
 b=n0Q6ZiCG3v4pfT+kGINCUkocx3XIUY6EcKAcP6XKuAqFO/ASJnXTrcPVFwG83+yYxvazRT3RPpljs1SO72k57L8traUHSOfUA9SgTODaraauRP5Qp1qTtryQ9Y7Mug6RZi162o9OV5uOHfI8ZysoZse9lAN4KOXJRUK9ZfMy2fAOyr8LnIA1l5qLim6lBDpSLR/dOG744cCK9CMZ5qiVrKo8l8QSYTgrJunzxkec0m9mooNhg9F3bdxgMkNwizfHZZ8G6TsCX+n6G6VdmS44FAYqsjGH1DT6nPGVJ5cLKu7Ve0QX/vm8epNafgwBdYFU0dIBmVZBTXNlkx41Ih6PZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oT8CFujFQwwvWvilqisUbJpw5py1f8K1oX2hYbcZWaM=;
 b=LTntLdqLKWdNg2J8Q4kNvXX8WuODh1RRZUXNQhSD6CSQLdxe2wVq+0fx8JGoCAar2W2W5yTcdlqHvZKcHqj4SYakCpR1angB1YFvjfFl+nrBErDKs4jXZxJR1rR2ygorCZxn4tjiFDqKXxDUlZSo+/NKwW5/04GtfRqU8N4PxL0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=windriver.com;
Received: from CH2PR11MB4246.namprd11.prod.outlook.com (2603:10b6:610:40::17)
 by CH0PR11MB5235.namprd11.prod.outlook.com (2603:10b6:610:e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Fri, 9 Apr
 2021 08:31:02 +0000
Received: from CH2PR11MB4246.namprd11.prod.outlook.com
 ([fe80::2137:b1a3:9cfe:d6e7]) by CH2PR11MB4246.namprd11.prod.outlook.com
 ([fe80::2137:b1a3:9cfe:d6e7%5]) with mapi id 15.20.3999.032; Fri, 9 Apr 2021
 08:31:02 +0000
Subject: Re: [QUESTION] qemu: how to control the switch of floppy drive
To: Markus Armbruster <armbru@redhat.com>
References: <910b1361-3b9f-ec80-794e-fb335b0ef631@windriver.com>
 <87h7kf50qz.fsf@dusky.pond.sub.org>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <74b1a046-99f1-83a8-1ec6-7ff5b41bbe8a@windriver.com>
Date: Fri, 9 Apr 2021 16:30:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <87h7kf50qz.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:203:d0::25) To CH2PR11MB4246.namprd11.prod.outlook.com
 (2603:10b6:610:40::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by
 HKAPR04CA0015.apcprd04.prod.outlook.com (2603:1096:203:d0::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Fri, 9 Apr 2021 08:31:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e34d09bd-4614-4f1a-f37c-08d8fb31cf6f
X-MS-TrafficTypeDiagnostic: CH0PR11MB5235:
X-Microsoft-Antispam-PRVS: <CH0PR11MB523506DC638AD9A4EE73F5AAE4739@CH0PR11MB5235.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rNDznT59UA8zWj/dV3J/Uf+3X+6voxC++oNWGzeNqe6ZOCOPmE4ghakXQNHo3qlN6rlB0A17jFLZxEgR85Iew/Sch/vD97KSFIPomCfVKzlUw6sPFYFeKLu4oNiSTwm4eRm7m/6lu+Dbn1tYspAsYjoemMu8WJOtkIrN6y+COLG4R+8z9cs+Zcq+WJ1JRs0opN6JKdX4o37OwRm7TU6P+DvzY4JixYYYq5/FBupNZLhDRLZp26R2Ieya75bCMQAhT+4oV3+dnuXa9zG+Wc+NF6P1x8MX3vzliBh4Wl5YvcJsro8AMyau+PnbvKFCA89dtZsAt3cJQmDg3/5OPz0Pyk4e6JLwE7zNx8ZJ7J0rMT/AwL9QCi3Ba86fM0jHKmTX7DoLGxjxej5YJA0dXhFlXAmPIZ33RAiPNDXInHiTcHYDQYFO0sufalVHxMAGHe1q2Q8DP4frk6MfhuI9h8Tm8YRmxEqJRL/aQsf9Uh02FJXdjZ19TlMxBHbyNl9ziHb8ZOvtKyIyh+1qluflPHf47IS7bE67EwFM4FO9se5cpbhHdy+qBpIF0gCfv/sClBwUFJAOxvwQm9T4yiuf+1rzwbm3i46gKrQu5ww/nCm4/WEVlr3SeSZNPl/9RMTxLpy3vznKVWvdWQjp0DEpvNvLW6QPd6qchvawC0Z13QwAimb9jiisc8J8Bl5E5LEY67XLEQd/PfN7mhXc+o5KRSEkBCKY/kdDCKkGBtBskji9QcCyLdY9DjvdvIp2vO7o4tzx+WprJOuyB1pL/0XbnwLRfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR11MB4246.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39850400004)(478600001)(4326008)(31696002)(86362001)(52116002)(8936002)(8676002)(6666004)(31686004)(66476007)(66556008)(4744005)(66946007)(5660300002)(2616005)(956004)(26005)(6486002)(36756003)(38100700001)(6916009)(186003)(2906002)(53546011)(16526019)(16576012)(6706004)(316002)(38350700001)(78286007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MGlCZzdaTlh2amJqeEs5d0N0YmQrK1dENkk2UlMxTUxUWld3OGNrQWV1V1dh?=
 =?utf-8?B?WkxLZEZOYmRoUjVPbEYraDV1N0loZUZkbUh4amZIWGRrTmhkcEI4RjRJakY3?=
 =?utf-8?B?MUl4S1N5TGF0VTAybHI4Y2pZWVpPN2NkVkVraEp5SUdPbDduU1NPL2JPc052?=
 =?utf-8?B?WndqK21lMlhrc0FQdEQ1TXdxaFdyc0pZQWpoTU1Jci9tT0xqSkttWjhOdnlh?=
 =?utf-8?B?TUdGNGdHT3hMWW5PUkJBb3YyZFRtZ2ZkNzVYT2hOL1g2NlJUc0twamtJczVZ?=
 =?utf-8?B?cHZDRDIwREZNVjZ0K0VzOERuakw1Vml5RWE1VzVWeXpnNkhseHBTa3l0dm0z?=
 =?utf-8?B?SlM2Nzd0ZHNOenFGNHJaNEtUZ0ZySHZOR0gxdG56ZkdqT2QwZmd0L01pMzVO?=
 =?utf-8?B?SmhqSEs4ZndHNHNKRm1qMEhoYktoU2JyRXV4SjBCNWp2TytEQSt4ZS81ZndX?=
 =?utf-8?B?eWZlT3lMTkJDbW82S1oxd016RXlyTGIweEF5cm5RWnd1ZHhneTY5QnB1ZzZG?=
 =?utf-8?B?ajZLcVZXWGxxN21PZjVWNTdTc2ltSDUvRUhzVlNZWW1sdWdJMUFyRCtqTFNp?=
 =?utf-8?B?SWJXRlpUWHRSUnFnc3dDRGRtcXkyLzVKQjdxNjllUEpJQVA4SXlza1loZ0NR?=
 =?utf-8?B?SjhZZUxoU0U4aks5T2FXTEovTW80VUJkV1JUNG1TZDNlTTVUcFhSa0tqUUph?=
 =?utf-8?B?SUVGY2FSZUFHaXpVdUVmUDgwVFBjZVNZaVZIb2NoOUNvUnNWWHRGazdEd2pL?=
 =?utf-8?B?U2MyRUFqd0NidndyOFZvVEFEbEVNaHJkODBJSElIS0pLYy9JaGQ2R2NRMVZi?=
 =?utf-8?B?S3RtODBBdDhmVEtabXJSSjhSUmN3QzNKV29ONjAyclM5QnpOZ1RUbEVMQkhJ?=
 =?utf-8?B?NEs1dE9HV0JYU3FRMTI0SDN2L2dKVnBFVWxKaXRxMklZMnZ1SXZBbE5rdXdU?=
 =?utf-8?B?akpSWG54TmgzS1I1QmUrb000aDBQaTFDaUdBaGRZTFYrN01pSk5MelNoamVI?=
 =?utf-8?B?OW8zRTg1OVlFYXFnaEZYMjFDelhVWFZpalZQek9qN2tWUXdXOTNjMzQvRDd5?=
 =?utf-8?B?MzA3cUZaR0l2UHN6R3J3NDh4Q1JicnlCcTV1aTc5T3dHRFl3eWZwalh4b1hU?=
 =?utf-8?B?SFErYy9QdXpLWks5NWxydGxmV0hWNG1WZVlPUEVlVWo4MkF2RW9nV1JaTkJL?=
 =?utf-8?B?UWszYkg1MUpXbENtdHFOVHVKRmVvZUNmZXF5RGFOK2l1MWR3U3Z6eEhZR1pG?=
 =?utf-8?B?c0tib0lCcTdzNjlCZnQrQXM5NmZNc3AydW04U29NWHlpUDdJZ2VpaWIycTgy?=
 =?utf-8?B?Unh4SzlHZHFqVmdYTmNWRHcwKzBWZEhXMjZRNnZ2U0lOM0JUWnBHYTJBSC9Y?=
 =?utf-8?B?MmtBeG94YzJMZzZscW00bHMvRnd6OHVKc3FaOFpqMis2Rng3VHh2TldKWU81?=
 =?utf-8?B?Ym13aXFYQ3BsQ21OSUwvVzhjOTV0OHBCSDQ2eWZJS2dNL1lUc3lwNkxWSFNU?=
 =?utf-8?B?eG8rZCtOa3Q4ck1HNFNTV0oyRDR2UjNqSGt5NFJONUh3NUhGN2c5VnM3MVVQ?=
 =?utf-8?B?UDN6UmNETW1WcEJSWWtITWgveGZWWEZUQUJtVkw0dEZMUUorVllHa1JDMUhX?=
 =?utf-8?B?WjhrU05EL2c0cFUyQ3JYMHFIM1FmMlpIQUhPaHdOSXBGNVNDWE12Zll5cG4r?=
 =?utf-8?B?dUNRY1dZSzluTWpnTjE0cFhNek1WakZRVTZXSDRYdzJLNVE3U25vTmZMakgx?=
 =?utf-8?Q?eZjWB3BufJ8Acu2Go24QZspJBFtcNXRxmndJFsM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e34d09bd-4614-4f1a-f37c-08d8fb31cf6f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4246.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 08:31:02.5914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVXkyCAISQ+TT5gkngGhbTGVlG8plbD3Zazj308xFwHP16sV/fNMQInEQ5AyZmGkBAnQRSQfkszSwaSJ5K4MoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5235
Received-SPF: pass client-ip=40.107.223.50;
 envelope-from=Yanfei.Xu@windriver.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/9/21 4:19 PM, Markus Armbruster wrote:
> Machine types pc-i440fx-* provide a floppy controller.  An empty floppy
> drive is connected by default.  Use -nodefaults to suppress it.
> 
> Machine types pc-q35-* provide a floppy controller only when you ask for
> it, e.g. with -drive if=floppy.
> 
> Use -M to select the machine type.

Got it. Thanks a lot!  :)

Thanks,
Yanfei

