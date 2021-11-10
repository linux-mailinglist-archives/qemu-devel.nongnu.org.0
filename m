Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA9C44C1A3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:55:28 +0100 (CET)
Received: from localhost ([::1]:35228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkn8Q-0007NQ-Nd
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:55:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkn55-0001gQ-PF; Wed, 10 Nov 2021 07:51:59 -0500
Received: from mail-vi1eur05on2104.outbound.protection.outlook.com
 ([40.107.21.104]:19680 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkn51-0003ha-BF; Wed, 10 Nov 2021 07:51:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0Mjm90iB+DPSPvpqR23qIFhTI5n8tewLeNn4K4b6ACu3c3ioSSh+J/dRhne5wnsancYL58HJvR6p4XOezPrahXrRn1/qpAEiicXQSitU7QbcScjzEN8SwFLQ0iJe6HQfOgsXl38Cr+dEaT/q96Og0659sa3LCuomoPq8ECJTO4UCLeZ8bNMllfwBaVBy0OLib7gVF5QENSakNDMNH9qJJ5/95vXg9AUgEDMw51RtzurDDZFDzIQxuLxI4nMrG1/ptdvg8VdK4dwUafqTzqQWv1BJ02/rOpbo/h/xRu5HDeGGzYRfXTGIUdiQ2iG40y0+Uni9bT/jzPnr6eFsU++vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8CSJBpw7AH3rb1qTLkKN7yqQRcHQ1LSpEXZ8o4iLL0=;
 b=QJ3ZI7x9ixmsuaBtn+rXenGjfWRSpKOstf4oqC0Krxp+L7rZAoN6veACOTOThdR8AMgDAbD7dCADDs6At/yHYSTphtqjWfg5kpa1w9qxCMmq16OL0sDXyipZSOb5Ju306lNu+AkcKKdMQTvDiAVbCThZixezfyjfz/VxgfzBB6h+0vgzAk7ZZlSQe+ibi7nWZkVWietdPZmZ+UfhJyF0C51z5f5pmwd51X47k/I3m5oxCLstKQvf14Vnu/eMW77K2ZecbYd5Lhn2HzNAlXAGAsN5xKFglyTRvIK+45eO1pRh/ZE8OLFAaob1CZNnlSKFeS7ld8AqP0/wjXt6yVyOzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8CSJBpw7AH3rb1qTLkKN7yqQRcHQ1LSpEXZ8o4iLL0=;
 b=W83sY/V85QLJ/0CtDOAITRp0A31SnCQ4xCazTxNXPPFxu5ko9qY8OSC/TqcCfmLzMKp/D0+yOyVBxkHyfBxxOi4prAaFyw4E2J1ruqoxkoDabUYRcYKlgdydhN0EGXx/ZCwPBpf78c9f+owRPP7/s3sdR5ozJD1tHCrS1BfVVoQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 10 Nov
 2021 12:51:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 12:51:50 +0000
Message-ID: <0a45f660-e3d7-7d23-fdaf-ef9e613b19db@virtuozzo.com>
Date: Wed, 10 Nov 2021 15:51:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/7] block: Manipulate children list in .attach/.detach
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20211104103849.46855-1-hreitz@redhat.com>
 <20211104103849.46855-3-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211104103849.46855-3-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0013.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::6) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.243) by
 AS9PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:20b:488::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Wed, 10 Nov 2021 12:51:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cea16243-c74f-43aa-790e-08d9a448dd58
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5078D928CDAA4FA09C231C1AC1939@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: frIZ8WTVNJXSQ/pw2nOVe2g+lPH6DbJxc26FbXmrTizaeF4Q/2FAaLGNCYxQjQAjVhLHTRKU3eJbHdgOVvYFNcy2Yb8DcrwKQvdtt4+6ann9XU8bMGDcq3sJu/ZqXQAxImF1OZ/QVRnC8d3MVCpg4xjxOAzmycblLJZw+8SHjs8gPpl1n+k9b25Hn8KH3VJF7wAe0IMX/sqmVA+a4GwEmFjnbzIzvWqEs9HMS/vtiQSUH/R6pSSd32ljOSjb95/u0k4OYRFHhmJvqiz3HU56LqwqXAqhcBp9QCBgrRekKfOZ2EulxSlofZ1LGVaXxNuLe97cTEBfT+KJwFckACws6dj25dH4HAi0QqcgHbOfEG4KugXlFBIDo96Kdt6sJ1knv3sV58HT7F6aAZ613ffy9d7g6geDVBkOQLfUrXwYUbt2camMMFwL7oBjKcc1id3c7u4+K3DtlfdzJiqwMnPHMrg1N0aRhjSuILeeEKAQB638VHyIzkG+EiUDBI8eNi40nzYboETpUAR+n93/balBTTsvHHTMgLgt61wo7eIeWIcu5BLVO97DJMYQchuWnruB338HtLkLH+l1vvA3tdah9DunI6Wz2Gm5G7L8CkpYbnog8RXxcIeN1trhtMVpGZQBZL0quCTLRqzdvJ5BZSvmpe22Z1iL+foWsuM5pEFzpxMiRNk+7UaqaJqMy/3iwMOA2md/YkOPYyO8961LtYHbRr+YqYdbGHRkEV5n1/j50UrsplCXM2Pm3ZTocGVLDLwfQVu2qeUegdxvfwG8afLr94hElp8JX7RNkheKvZqyV3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(31686004)(31696002)(2616005)(956004)(86362001)(66946007)(38100700002)(66556008)(52116002)(38350700002)(66476007)(186003)(508600001)(8936002)(26005)(8676002)(5660300002)(4744005)(4326008)(2906002)(6486002)(316002)(16576012)(142923001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUdXb1NQR1BCUDhQa3BOekZJQ21Nb0F3SnFWbnQ2OE9wSkZzMU1KVFk4T0N2?=
 =?utf-8?B?VS9ld0pyK0FLVytDNUxISmRiQlZPWWczMmRMb0kwL2E2OW53OExWLy9BZlRj?=
 =?utf-8?B?Ry9VRTRIVWVCT3JrS1FsUlM5aVV6ZFlNL245emFjYWEwMzFsMW9UWGk4QS81?=
 =?utf-8?B?UGcwKzlCTSt1TDFDUGlHRVBXbEVNblhPVjd4WUE2Z0JkRjJpU1owUktrT2ZH?=
 =?utf-8?B?bkVnZGExcSsycUxTeldnVUdSMHRXQU4rcGhPb0RSYkRzMWtGTFdZZk54SFBS?=
 =?utf-8?B?a1BJanRTZGRsbTRLbFA1OUZUZzlzNDdwYzJJcE9icTJSckVBUFJvNENUb0to?=
 =?utf-8?B?T1FBSWdySURxb1JnVFFIdFhJcyszSFZmQTBZWUVlbklIcUREeEM3UlFCUzNw?=
 =?utf-8?B?eEd3UlRyanpISmcrNjk4VDcyeHNsOEdoaVZ5T1NxNXNuZk9NYUVZSzdKaHR2?=
 =?utf-8?B?THl3K3RIZ0dNV3NhaUJpVG1GYURtU3FiK3MyeU1ldGlFbGJZZkZGZ1NQaTdT?=
 =?utf-8?B?bXM0bEJnYm5HV1dWRlZjbkp6U29oN21vcVA2VlZ2SGlkUnFEWG5JREs2RDFa?=
 =?utf-8?B?VEtPVlpUUExnRjBKWkkwYVIvcU5WUCs5ckl2MXBlRzhSNUN5aXYzTGxLd29R?=
 =?utf-8?B?ZXBEV2VCVDNrVks3ZCs5WC84ZnZaZXY4QXpRWDhJcFdtcGh6V0Vlb0FvOUJu?=
 =?utf-8?B?SnNUQkx5OXI5cDlvZnNWNzNGakcxUFlhV2FVQTAzVUp3SURoRDZWUGNmNlN5?=
 =?utf-8?B?L1l0RFV0bnZHUlVhWHc5V3ZOdjF1NnVDNzgwSkt4eCtQdGhueXpkWjNXNDZ5?=
 =?utf-8?B?WGZtWHUwdjhtU3Mva1NGLzVVQXVMdEFiblVOeHM3OEx0Sjd5YTl0WmhxTU83?=
 =?utf-8?B?TldLSmNzenpEU2UwRVh3L3JNRUFzZUY5MndIb1dzbjlhQXJFMHh3WVpLVTlu?=
 =?utf-8?B?L1lOYXZtcnRNN3FKS1BmZGQ2NCtoVkljRTNqaUlDL1JQQmhyNE9SL1ZsQXBT?=
 =?utf-8?B?NFFDQmE4RlQyZCs2ai94RmQ3QWp6MG5GZmk4cmZyOE82QnZkdWl1QW5NTkUz?=
 =?utf-8?B?dXJxcmlsbThsbE5qWG5kc0gyZ3FxT3ZLcEM3T1ZueVNNazAwOU1jdDUxaEY2?=
 =?utf-8?B?QXlrMDhjczNNLzF1amhBQzFhb0plcGM3cjBZZmZDL0pweDJxNXBNRDhuTTJL?=
 =?utf-8?B?RnNXblpxbndoUXhMWFhaMTZwQWttVzh1NjFVd1hvYUVqV0hkMm4vOVBRcHh3?=
 =?utf-8?B?ak9yajlpZDhlZ2xVM0xLUDl0c1IrNHpTaDVqbTBITnAyNnZVYlZHLzJtdW0w?=
 =?utf-8?B?aEZ6T2lEWERQSW5wWTJXclB3MHNhVm9sMzllNTVSTUhSYTZpUUdrbmdlc21R?=
 =?utf-8?B?WDVRbzdxZWt3SlE3UjYzRFdZMzhXOVlTcmJvSWdJc2N4UlAwY3MyVTNHM292?=
 =?utf-8?B?TVVmUmIvenlYTlBKL29ON3NaM0dlQndFdUdtQmZtTGR4VHFsa3hsa2V2dnRV?=
 =?utf-8?B?NjN3K3BPSzNvbDNFeUVES2ozR1VaNlhkbkQ2R1JJZVFualZmUEQxNXpMbFND?=
 =?utf-8?B?MGxxUlVVZmNoVkJZdUV1R29yckVnTjRtT3FVN01OdHhMdjhiaWNWQW1BZmwr?=
 =?utf-8?B?aGM2czJJVkluSDBwNXFyNjgyL2huSVV6RGdzWTJsb1NaUFUvSVc3SW02MXBC?=
 =?utf-8?B?T0lvcnE3NGVJU1AyUWNhbk9EVTM5b0xOZ2VrSThaQys1dTJwSWk0c2tDUmdi?=
 =?utf-8?B?ditEQ3M5b2c0U056ZzluMlMyWFpaeHBEelk5Wk5WYUlwc3lvbmoyWHZ0UzRo?=
 =?utf-8?B?VWoyWWlSUmFMcENiaUxBbXUzSFRvbE10NWJRVTdKdTJ2bi94VFlUOU5zTnhU?=
 =?utf-8?B?M1FJc1hGaFlGWm9wMGlxdk8rUzlJZkdVWERxQ3k1T2FlNU1tUm90RmZ5TXI2?=
 =?utf-8?B?WW5rMEdCVnJ0VnJjOWowbGZNSThRMWhkVlBTTG5jL3lQOStnVjI3TGVEeVBj?=
 =?utf-8?B?RWNITk1UTW1kMkhHZXBQSE9INDQ4K2dwK05HVW50TG1FTHJtK29Ubm9XSnlk?=
 =?utf-8?B?ZVg4ZzZNNFl3dnhtdEtNSzlDQnBsSXdjRDdUazhvaU56OXM0VU9Zd1lzNmtQ?=
 =?utf-8?B?RzM4bnkxYnBwNHdyV3ZPZW9nQ2NnT2xsZmRTQVFKNlIwQmlKdjZhejRmWFVl?=
 =?utf-8?B?RnpKZVVvU08yckZ6VkY1WmNNYm56M1RsUyt1WlFuNkF1QzNDMWZCczk1dUNM?=
 =?utf-8?Q?7l1r2xyfFNbQ1g0OVdV8TljScRtEyJkye/Bdbn2xHw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea16243-c74f-43aa-790e-08d9a448dd58
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 12:51:50.8376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+EH0j+NDc41LM6PU5m84/giVSI4RJUenM5XKhFPnWG/C1BtMvDChm3IHXh9Ter0ZRzCBG/ilCrAHLhZMe/4m6Y5VMSdHVecMsD6RdlFUvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.21.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

04.11.2021 13:38, Hanna Reitz wrote:
> The children list is specific to BDS parents.  We should not modify it
> in the general children modification code, but let BDS parents deal with
> it in their .attach() and .detach() methods.
> 
> This also has the advantage that a BdrvChild is removed from the
> children list before its .bs pointer can become NULL.  BDS parents
> generally assume that their children's .bs pointer is never NULL, so
> this is actually a bug fix.
> 
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>


Interesting that nor child_root neither child_job do similar things in .attach / .detach ... Should we do something with it?

-- 
Best regards,
Vladimir

