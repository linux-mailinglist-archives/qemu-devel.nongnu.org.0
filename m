Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13842367E60
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 12:13:46 +0200 (CEST)
Received: from localhost ([::1]:44788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZWLA-0002Mk-KF
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 06:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZWK7-0001d8-Kg; Thu, 22 Apr 2021 06:12:40 -0400
Received: from mail-eopbgr70110.outbound.protection.outlook.com
 ([40.107.7.110]:47072 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZWK5-0001Hg-5f; Thu, 22 Apr 2021 06:12:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzTLcyskn50/0KG5KjY/ha6OzZ06WyRHiOTEz0lGzeWk86wWxjkdmZxZdhfGvtXq1F8u2QqscKXsJStbU4oDu24RlUKIzb+I1TRUTdUbP+4hN44wxGeb7MTxPd6Bj8zWe/5q3JuY7VD/erGNGDwNxod/hnumMpeHtlbWgxQtAp5rZwIReDgyEWie8kR8Ra/urO4NsGkduIrCi+/N2r5zLJyKiMBTXrYbiaqcqjwBDU7Nfpn7UXQufZqhcLQeaJ2y+X8ZQmRE0N+oL3aw0qm2b2pZqq5Qwh1myu3YbRC8QWNKfZOXEMGncClBMTR997ytG4bDHIK6zS6pwpgqgIJv+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Iy/rJtFn6KN26sKQivRA58PRGeNTeNQ2knGS/HjJnY=;
 b=cM8ZSHoANf2x41D0kt5mda+1ZCpdKOUKBVY9A+gzQdcsDa7MCf98elxxVbaa34LbI/tc4Kshfnm57Bm+P2lJRQi//T/vlPoxj3jmZcbiuoDZW6FyMxtdAa/uIoeECkSM7sC6gc/BXmcQsQhTb4RYJ6BODtCLENuVcLrZdSqhBOeDeebVIO38xurt4QOGxvPYuPBHYKGEEBpGKvAqUuOuwpF0BJjMmMI27gh1RrGbjowX4eUqMFCH5SS0hzH0oSJepQ9VNa1nLNXDaCwv9aZ4o9k/ovpIXdWuBvsOpwPNrvdrcOEAysXRjhBhdltc/HIxIIxkh4bk97HtAoa/llIWKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Iy/rJtFn6KN26sKQivRA58PRGeNTeNQ2knGS/HjJnY=;
 b=IzF9Zr8v96m1xWBec5PYDOva5m80BmahmOCjM7WG+vroOb9AgOHQH2wobwsBav/ZNTXF2P04dNAGe5GBiCrK62LKm66oenyMOxreypNAohSXnF/0kxEPTiv0xPdb1FSXXMMzDlhF9T4KC2MI7RR26kC9H3o3uiJ8szc4Du2osig=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1906.eurprd08.prod.outlook.com (2603:10a6:203:48::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.20; Thu, 22 Apr
 2021 10:12:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 10:12:32 +0000
Subject: Re: [PATCH] block: simplify write-threshold and drop write notifiers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
References: <20210421220950.105017-1-vsementsov@virtuozzo.com>
 <f13a066b-210f-2185-cd09-37b8795d0895@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ba14861a-4172-752d-0c1a-74efd63c2231@virtuozzo.com>
Date: Thu, 22 Apr 2021 13:12:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <f13a066b-210f-2185-cd09-37b8795d0895@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: PR3P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 PR3P189CA0023.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Thu, 22 Apr 2021 10:12:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9030133e-4b22-4c8f-b879-08d9057724b3
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1906:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19064173FA34405F719FF1CDC1469@AM5PR0801MB1906.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k/z4HO5dxzyUsTLlcqYadtrAYxM8XV3eeKjAuzIQW3J37nhPSouf2GytBXfCchcT2pMl5msv8ucHO0ngAVDb0WUDC3OVRldqPfz+dAf6Slk+vtDZvAvqtjn3Sr86N4qf4X3/iT5wuhxhJRDZVvereoXtcTU03t7ojQwdVr4UHLzqUCEckcuEMTcbFVMEGczTXW+yIJyMoSEXQ6i/N6rr2pnLFGCrE8bTYIkUZH/amC5crHvrRAvPqxkbll5iGhbHQAyHthZBRarAgMtlG8idEq4/uG/STgY/WMlxagWpvD3bWHNOeMtjDAoes3JUzWYCTDnPYiHARYF2Z5bYFJupN8gT63p4Bx06WpmTdY6jlB9NBB57xu9Zczp6TPWYw4XMDZ/1/pDr8tCv+ADkelA8969IrrDQOI/OqA4sPlHi4Swzsx7m2DSB/6Lynvd7h81ALvmcdy8nE9s23B6DwHe5Kzj+0BtF2ErVUCZTiMSqXoCOdw8vn+9YoiOgq1ml7MrQ6371w5BnKGWL5dcBQkYwXTRIBAlZKtAeX8Clrj3ILYA8ebKRlqKXHnvvT9EFO9okwuEnOaYqJxHNp8ljBqe6mC8QauS6zAODwVmECv/lZqjouuwGdKxjTnFPmP/Mjj5Cw2eYxsNrB7BucK8mxfCT1HNisaA4ZKNSVuKbAuA/RfsR0X1OOomNnIaoY39cyeCLMFRF7IvM/GIWHiDFOIBiVxjdojQxqZBGua47dszgwzo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39830400003)(396003)(136003)(376002)(346002)(6486002)(38100700002)(66476007)(8936002)(5660300002)(316002)(31696002)(478600001)(52116002)(38350700002)(53546011)(186003)(16576012)(66556008)(16526019)(66946007)(956004)(86362001)(36756003)(8676002)(4326008)(83380400001)(2906002)(26005)(31686004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UW4zdGV5emJkV3k3eTJxSkdrSjgrY1hBdlZQeXZlQkhZVXJ3OFZnR08wS2NY?=
 =?utf-8?B?ZzIrSTFPdGJ5NDZmSG5ESmpwMkZpRGg4bEZHbDM5TjIvVGNGckp3NXArNlhP?=
 =?utf-8?B?OERYWkNzU09SYnIwK3ZjaWw0YnphMkNnSWxTOTJsc1Q5SnhxaGdXdXczV0pK?=
 =?utf-8?B?eXRlSmgxZkgyS3p3Sk9ma0lCaGRGeVUvYVdiK1FobXRpTGczU1ZDRjVVVmpI?=
 =?utf-8?B?NEVxbG9pWHVYY29ZWjVJQm8vQkcxQ2RFN2NjMEdXUE03aVBiWks3amRzc1pK?=
 =?utf-8?B?NUR6TVl4YlZnOEdHSVJvWW9MZFBocGxPQXdGek9zQzZvNFV0SXdvd1lsTzBQ?=
 =?utf-8?B?bTRjVEpDdHd6RWR3SVliWk5vdEQ0ZFpMODUwOHNUUElFUlFMVDBMemlKNjUz?=
 =?utf-8?B?ZjJqT3JBN0QrTVhIc093Um8zN21JS3N0MEphUzFUbFVKZklaU0h5Y2pOcDJh?=
 =?utf-8?B?OFV5OU12ckIrYStHamlYSHdRMm4welF4NDlKK2RZY21VaWFQdVYzSmo2NTRD?=
 =?utf-8?B?YWVMMVBhWnppVk9jamxKblE5OGFRdzRJMUVaRUQxZ0g3VTYrd0wxZGp0N2Zl?=
 =?utf-8?B?UWpFVHpnbCtkS1V3Rit6a2VDbVVMeElpdS9GTXB3YlYyRGNHOVNORWRrMEpC?=
 =?utf-8?B?UW9ZZTFjdXROMzhObVYwdy9DQlN5d0tOdndlbGV2Z1kvVmhrekp0amd2amQr?=
 =?utf-8?B?YU9MNGFYcGVtclM5VUQwazF1cUQzK3FhbEdhNEpBMTBtR09OSi9uV1h2RUZh?=
 =?utf-8?B?TWZZRDNGYjZpcDE0STcrTTlucUlmMkpyVnA5cTNoNzY3OW5Zamh0aDhQa1Ra?=
 =?utf-8?B?dUwzRFRGME55VnlvdVFMVWQ4YVVZU0RWd3JpUzRzaDBWcUNDWG5KT0VKblJ0?=
 =?utf-8?B?RDNnb3hYaUVKMHIzWDYyem5XRU40UEJmK0MrTXgwRGVscDdXNFI2TWZ1MnBI?=
 =?utf-8?B?Q2FnN1g1cmJ4SUNQUmZhT3ErRTdleitwSjg0NHRwTGNvR2hvYmw3V2tscith?=
 =?utf-8?B?UVFvUXN1ZW5pd2VrV1lrK0FoaU51YTlvc3Yrbm9HYTlrTEJZcWljOElKMCs0?=
 =?utf-8?B?ZFZielNVK21sU29RMFFHVU9GWXk0MzRsbXN1cnN3STAvaDNldFYrV3BLQmZa?=
 =?utf-8?B?QTQ4VlEwVE9Mc1pqWUx1V1FkWG1IeTF2bUpRa012M1Y4MFk0RUpFSC9sRzBn?=
 =?utf-8?B?ZHAvdmZxMU1tYit2QU9jZTBPajh4eURnQTBsVmdYL1pCM2xqZ1JmSks4Z2ov?=
 =?utf-8?B?V0hkNWJNOW40aWMwMjRucDBzNHRlL2haczB1WDdrTmZRUUlhUk9lZnhTUU1F?=
 =?utf-8?B?N2hFdXZscE5GaTVGbkRhbWZER2RTWk1LbDRJSFRFODVrWXJQNURqYjRVeU02?=
 =?utf-8?B?K1YySy9OWmNBREhKN0VOK0tBS201L3ExUzRmK3EyWWtjalphWmlOQ1k3Q3Fv?=
 =?utf-8?B?SWdrdEd3SmNwZTNKY1BHVFZ0RlQ1NmpaWU84azRmWXRjVjBWTWp2NHFJV2tC?=
 =?utf-8?B?QUMrdHZ2WTNlakNwUitRZmd3S3h2N2k3UVFNZEkxcnc2UlRrZG5LMjZIRXNY?=
 =?utf-8?B?SjNOZnNlZ0JXQ0IvRThkd0RjMjZReUtxdCtCTjB0cU51ZG0xcnUzUnV1ZUFN?=
 =?utf-8?B?ZWNZMGFFa04xR2VwaW8vNjdFTlhDSGhlV3JVZ21LR2ZIT0FwLzk0cEhDMnMz?=
 =?utf-8?B?K0ZsMVJMSVFyR3ZBaXBDOXlYMTMwN2Z2RCtNQ2F3QXZrYi9wMTlwdVduZ0kv?=
 =?utf-8?Q?fZ5U5hFdwLHysra3H3+rRsSmofFyh1qgBIxCBC9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9030133e-4b22-4c8f-b879-08d9057724b3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 10:12:32.6184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySrgmRrPrBOii1/aQwCwhwq99uWPwH5+QVLazsqaZO995GiRiLsp4J4UbHg7hJdi3vUBwyAXs1aJ3r8fvYz7CkcfEp1MFMEJe3Bhp7voIqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1906
Received-SPF: pass client-ip=40.107.7.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

22.04.2021 12:57, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 22/04/2021 00:09, Vladimir Sementsov-Ogievskiy wrote:
>> write-notifiers are used only for write-threshold. New code for such
>> purpose should create filters.
>>
>> Let's handle write-threshold simply in generic code and drop write
>> notifiers at all.
>>
>> Also move part of write-threshold API that is used only for testing to
>> the test.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>
>> I agree that this could be split into 2-3 parts and not combining
>> everything into one. But I'm tired now. I can send v2 if needed, so
>> consider it as RFC. Or take as is if you think it's not too much-in-one.
> 
> Thank you for this patch. Since I am reworking on v2, if you want I can also integrate this patch with mines and send everything together once I am done.
> 
> Emanuele

I'd wait several days for comments. Maybe I'll have to resend v2 of this.

Also, after this patch, is something of your patches 1-4 needed? Probably you may just resend your series not touching write-threshold, and just note in cover-letter that write-threshold is covered by "[PATCH] block: simplify write-threshold and drop write notifiers"


-- 
Best regards,
Vladimir

