Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6532F2D5DFC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:36:54 +0100 (CET)
Received: from localhost ([::1]:56420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knN3t-000673-D0
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knMuS-00014q-Bg; Thu, 10 Dec 2020 09:27:08 -0500
Received: from mail-vi1eur05on2131.outbound.protection.outlook.com
 ([40.107.21.131]:11424 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knMuL-0007RM-Jj; Thu, 10 Dec 2020 09:27:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0uUY/t1RXKNZ46EE39IFdDavND57g2fcX7C9h+MLuV3yK8qAIEyk3YVqMUQ2TqhR6eRe1VjasT2Xj/4gUyD4y+XaVprjYDnlKtofoHP7U5qtnUtXpqzXW4BFRAppptjUB9jMTxO/lkEXlIm+osPSEaWVsdalFzk/HjZ7i//6OljDGliZozG1Ho5iUQQUAaG+Gq2Pn2RAaHaj7Fzk84B4+Saqk7g37VjNx91VwM4gkyQUoDBauFdholSHBAsceWXBvEWn6XMgBRzN2wxtE413f4w69E33VZxtOs1RHM3dZw6E8pCa7BQmuw5Sdh5C6wJ8WL5LhZR/H+nSLXmTkyOCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaF4cPHj5DX/Vn+8JPFoePpHOV1uu6EIvL74JGNqMlI=;
 b=H/8zUw4/E+BItyqzXJi63cLTkk6TM2toZ1RaJGKVTyi2m3sXkuyurVYVqFNA/UNRfk5seitnzXoZGld3VAoMZCGAvMuU+m4NWDS0sLe4LP/xwtrqSQP+zgImencyql4V/OSlGh3tdDpdHEIS4Wrdc99uWl1SOypcjyu05v19gU8v9/gIKBDZVnZFXe1x50McWJmVzz6F6f4S6GyEBsEEVuH/jU9CAgf73zpbl5w1m3wXOrXT2jylm2dzE7OVkRQjTfO9sI+j4vQA+7RM3BpD/B5tnRuaBc3ZDunTakMvQL4IrINaSu0BTKtg7GwMNWX/SuWAQs9+xAXlZByVEBPY8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaF4cPHj5DX/Vn+8JPFoePpHOV1uu6EIvL74JGNqMlI=;
 b=haFNhBHjUPQ/NeN+RytD5ZDOnMknUXhWkutC89BlcivhONKjy23lGHHb3Bi8nhr6r2U2aZmQOnMBKrQIrRkS2CaHOl2hpq35NQgT7uitbbIYWHOjthIjzC3oHy5yAMervgVygBkkxhLPm84iPC0iHw78TAc8/ZThYWiuVEkfsMM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 10 Dec
 2020 14:26:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.012; Thu, 10 Dec 2020
 14:26:54 +0000
To: qemu block <qemu-block@nongnu.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: RFC: don't store backing filename in qcow2 image
Message-ID: <20581556-6550-e0f7-aca9-6b4034821f6c@virtuozzo.com>
Date: Thu, 10 Dec 2020 17:26:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR08CA0003.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR08CA0003.eurprd08.prod.outlook.com (2603:10a6:208:d2::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 14:26:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d543b7f1-6564-4d7e-0b2b-08d89d17a4b5
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB611937E371E9B3F6DCC6EDB9C1CB0@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aWo3sPsiyxRRR4cM6JNKb5ULpozH8+fXzB+jrERDVFEVVkuyF5ELlnqny8OF5wZyXjrRKSVHqnnHwIqLc9wLujFvkcbc2ha5F19vjcGvcCErVA/AtE65GXCs8d4ES9G7yi7u2UNcAGlRpeklM4JJkKD4YusxwkklcKlfG3PyiBgbwOYdO7IChvsZqkMOIXJZD5Jr98Wkv++Vz3FXgJVCNNu8vJ/HnOPxUtR++kM5yMudyoqw/3O0rkhBBvPC8F5jJtLlkIdbuz8l81sopQyA1WZ5XQYcjf+JnRU5ot+o8fGnwVhKRJEQI8Za/p7rbtxNKKJLNovR8YLJcVWVx0fuLucta/cTP7m/Wp9FRYBoQtESV6Er9H4MZljl2ograElbLUiNTGpoJYgWchrVVvtH8e5FNhUJV3UrAlV1Z4M9uNA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39840400004)(136003)(396003)(366004)(54906003)(6486002)(6916009)(316002)(16576012)(83380400001)(8676002)(31696002)(186003)(26005)(86362001)(8936002)(66556008)(2906002)(66946007)(5660300002)(36756003)(16526019)(52116002)(66476007)(2616005)(956004)(4326008)(478600001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VzQ0MDc3emU3ZVlvc1gwdC9KR1cvMkgrVHFNVEFMM3RDNVZCSlIyalhDcmRx?=
 =?utf-8?B?VCsvbjNHcWhHbkJtTFFHNGN0dUhiUEZJNmsycm9pVE54emk1VGcxKzV2TU5D?=
 =?utf-8?B?VnVZTDR1ZG9tcklnd3RBT1p0alY2Vmt6cFMrMUdSdzdPRVpkd1ptdURaSk8x?=
 =?utf-8?B?b0prYlFIYXNrb0FSanR6clhzNmdSbnh2VDNUOXhReUZ1Z01HR25MVzNCRjNi?=
 =?utf-8?B?RDd2WGtBRy9MVkFWdGhNbDdqZm55bXkvT21JSG05Vm1zRENmS25rQ0pFUW5i?=
 =?utf-8?B?TVQrZDJzZ3kwSXVKRGNVM2pxZFg4R2dIRUxsNmNBMDdJNWVVTjlNa2NJN2hV?=
 =?utf-8?B?Z1NTekRFRlMxaThYQWdRWWNVZlowVE5nUllmYU5oNmVjeVVNQWtMTGVTL05w?=
 =?utf-8?B?R1pQdGRyb1RCVlM4TXJOd21XM0o1OUlSN1NYUWNtMXdjMHNmSkJPb1c2NlJz?=
 =?utf-8?B?ZlBQUXJScTB6Nk9yQWd4Q0dMSlp1bjlpK01JSHZ0L3JwWXpmbW9hdDU3TG5w?=
 =?utf-8?B?VGpmcXh0ZU5jYW9OK1dpNzY3STlYSFhTbWUrSFJmRktFaDJEN0dWWUMzUEw3?=
 =?utf-8?B?eHhuNENaeFg3SnJWKzdDZ05UbmFsV1N2aG5uQzI3T3VObjdyY1dqb2RFeGdF?=
 =?utf-8?B?NmdmMXMzamdsN0Ftbk5LVGpHVzY0SS85YThHZ2NCYUFsbXRYMGZ0N3pmR1Nt?=
 =?utf-8?B?LzdTUjEvQlg3VUY4Um1ydUpUNHI1cDd2bUFPTTVHOEVZck0xVC9IK0xSelF6?=
 =?utf-8?B?NHBPL0lkTHZCSWQ0bGI5dkJFbjFhSU4vTy83S2RzTTI0MkVGY2l5N2RPSHdO?=
 =?utf-8?B?Mkw3YURqVkpEQ3dlb2FwRWIwUkxudjlsOWlVSG9URlFFTExKSWdaempFZ2l3?=
 =?utf-8?B?SVNQT2ZBTVZxdExybGdnOGI1VTdDMC9kaVpMRUt3RkNqRlpPS0hXRG1kU09J?=
 =?utf-8?B?RXBzM0c1UktLMHFOck5iRHdEbzNldENwS0RlUkxpN0JmRXNKZWFremJnbmp2?=
 =?utf-8?B?MzR2TGEzVnpiM2p0a3IzT1YzQlRtRk9nQzZPRWVnOTFwakQ5QmFUWXBYcVdK?=
 =?utf-8?B?anU2TTZzMkVsOE9GYUZTdzVid0lhd0dMbHVyL2Fzb1g4RWNTUE9nOGlFQWhJ?=
 =?utf-8?B?ZUEzV2hVN09nL1hZYjVQTUxCRzlEb1JaVmFReTJ6WUs0V0IySkpiVUQ5ZDBG?=
 =?utf-8?B?VXVlS3BwQTM5OUlKSW9Vam4yN1E5Sm0wMEhPZ1I5cGNQbnVCOUNQTUNyNEJI?=
 =?utf-8?B?QVpEOXpJck15cE5QWEQyblFsZ1NvemYxOWtldlFzSU9RK1A5cFhsd29DNUF2?=
 =?utf-8?Q?9OHf3YNDgumVl702CGrUCGH3EaDvgvAIzj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 14:26:54.4937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: d543b7f1-6564-4d7e-0b2b-08d89d17a4b5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5LLxCxz9wV2GPvxaENrr7/YVtIF0z7uIRDscXwZJAfUMbW83ixkCOqFH3qZbSKcUUmYGHrNjGm5uH1n5Qwb036QZty3JlLk9z1RZxVw2KM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.21.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 Alberto Garcia <berto@igalia.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

I have an idea, that not storing backing filename in qcow2 image at all may be a good thing. I'll give some reasons and want to know what do you think about it.

1. Libvirt has to manage and keep in mind backing chains anyway.

This means, that storing this information in qcow2 header is a source of bugs when we update it in one place but failed/forget to update in another. Of course, Libvirt is not the only user of qemu.. But we are moving to "blockdev" anyway, when management tool should control all node-names at least. It would be strange to not control the relations between images in the same time.

2. backing file name specified in qcow2 metadata doesn't relate to any other thing, and nothing rely on it.

3. calculating and updating backing file name in Qemu is a headache:
    - with some options specified or with filters we risk to write json filenames into qcow2 metadata, which is almost never what user wants. Also, json may exceed the qcow2 limitation of backing_file_size to be <= 1023
    - updating it in transactional way for read-only image during reopen, when another transactional permission update is ongoing is difficult (who know, how to do it?) (remember recent d669ed6ab02849 "block: make bdrv_drop_intermediate() less wrong")

4. Moving qcow2 files to another directory is a problem: you should care to update backing file names in all dependent qcow2 images.


So, what about moving libvirt (at least) to not rely on backing file name stored in qcow2 image? Backing chain then should be in xml? Is it hard or not? Finally, will it make the code simpler, or more difficult?


Then, if the idea is good in general, what to do on Qemu part? If we want to finally get rid of problem code (see [3.]) we should deprecate something.. Just deprecate support for qcow2 images with backing file specified, requiring user always specify backing chain by hand? I don't see anything that should be changed in qcow2 format itself: no reason to add some kind of restricted bits, etc..

-- 
Best regards,
Vladimir

