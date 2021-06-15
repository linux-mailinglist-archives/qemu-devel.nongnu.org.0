Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5603A79C0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 11:03:41 +0200 (CEST)
Received: from localhost ([::1]:59024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt4yy-0006Fq-Cv
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 05:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lt4vX-0004Vf-NY
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:00:07 -0400
Received: from mail-eopbgr30109.outbound.protection.outlook.com
 ([40.107.3.109]:19086 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lt4vV-0003Ep-O2
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:00:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXLE6ujZo5YKvaW0JsfH797p+0rpGdluMrAWnIMK1T9LViXkojKgD5zMsWHN4QJPKQFsJdT20f8hQB3RrXbbjgitMZS1u32ABqtRzq4JVif0pRF0HtMpq6WUB5jsXy2wix9SFlhBLaVOJP8gi7BbtRg4GeU2JGEIrpR6BfsLsDdXe6fd41gV81rM5+DDt5dO7nDei6cL8xGws1IWB/EHEfCTutUC4E2Oek1AVI+CL5EMFW3iw6I0WOH/7ikgienLCkmbVTwAVGnXpBX31zecNXPPGP4IlcezkSnFnqVswJgF1/UN50egahEzhLrrsRm96oCG00uGUHeP2TP0rgwQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohrCpyw15Btn2pE6VrzZJxwP+efOMAVJO7d9xwVN9Uw=;
 b=dr9ei+WvnFiy8QMoVKXWutJKzFZJSd085rzNKf+Xrl6eTjB/1jMB8EyjaPcPTkGbwMhGwEMg2TfATwnNQKL+8B288wR3yc9e0lO5EtE+A/Ex1nxueJzssTfB2ACx0sPGaftfKxzZnG+jfTuWJ/Jmfds1WdgS+P280vxX87xoC0YlIqnU0QQlwd7RiFh/ui5SR8D4U2WGi+zLcGJla6YS0ub3iAKWFfPZVtVnFWv9UcpN8mljDlhCoY3H/ay+coAVmekpitQVSx1IbFw+2NfnNYFuOModhMfh3rW46fhvataiAhS1WwqF2DYciO7xYgllYwxjYJlLxwHb1Yda9WwEfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohrCpyw15Btn2pE6VrzZJxwP+efOMAVJO7d9xwVN9Uw=;
 b=LHAfM9HM/fhTwtJq60CRe7SBrkYggF8BAWpAmWaGCWuZe2r55593fava/Ziis1TLglXRt4XPICShUfbW8uiV21shXRqjcS2rUW5zIncLi+uktAo1KEY7DtnAxMzvNcb+4xVmvZIwHYdrPGe7EOSVtm1g7KN7VkwKfj6JS7swJpo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1779.eurprd08.prod.outlook.com (2603:10a6:203:2f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Tue, 15 Jun
 2021 09:00:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 09:00:02 +0000
Subject: Re: [PATCH] tests: cover aio_co_enter from a worker thread without
 BQL taken
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com
References: <20210614110214.726722-1-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5222a91d-4916-5ec9-79b8-392000935ec2@virtuozzo.com>
Date: Tue, 15 Jun 2021 12:00:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614110214.726722-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.224]
X-ClientProxiedBy: PR0P264CA0166.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.224) by
 PR0P264CA0166.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 09:00:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abbc4306-921d-4b98-656c-08d92fdbf5c8
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1779:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB177958C1959A340335C8D7A7C1309@AM5PR0801MB1779.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mmqgH69WY3qoJcHyAJ43wYslnfi+QTlqJpSKwzYVTlX8JrFshVlORLtY7niqPJTRHIDa69szEAG1EZIscRTGfOxycq1U9x1jaeGhLZl6JtOY2xMF9eCP5/n5k264FJgQg4t00I1V3do6sd5xY7c4I7i2lPIkunSq6uUihqC0NxnklrLULgdIgedVd38hBlg7hKhzIH4idYlOzG+LDJP66xyXVtTQtxt35CWPr/lB61+4KXpN3Btkh1FhyF5KvhNgISzfx4I8mIp1PdCceARyg2Y2ySZYMsZT0ahntRIWBtE/rWx0Ije0zD4HwwOuucskH8W6d+NKYfhmIOql8UbAWlfMCQuIyxR0klCO8pETMWqny3fLBJc5YigrWJy0TF6zxij8RLpkFU4qnJsU+FGfUGmIW3tT7YmLVRMZzJxgx0L6B7ZOwMPJkQGQXd2zhs6U3G5TpE5bkrWnOY5LLSQKrst+/6hGGSJUsnSy1Ymx7PNnRAO1XNkhhlepRPMUYO+DIoZsR4mIyDLupHFQowmGuv0qjp5/byBjOLyNzdhz5Xd/Z2qNS84j4maIcqXxGwdPnO/nwDJEmA5JsqhS9u8cS0MrADWtIs7ttq8myILenThAp0RGre6KUkjRazJ5od2o3qu3uveYg3Lsg9qcHY7jawDX5ZyWKEiqAZD2F1yKWx1QSzKLgl+ui1/W5t2a5bE9sYnZEJwkujdX6/N6GKtbEM+kVL1nJFm/CYQe7S9Bxkg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(39840400004)(136003)(2906002)(558084003)(316002)(52116002)(16576012)(66556008)(66476007)(38100700002)(478600001)(66946007)(8936002)(38350700002)(5660300002)(4326008)(2616005)(956004)(31686004)(36756003)(31696002)(6486002)(8676002)(16526019)(86362001)(186003)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXdiMmk5RjNjNFl0aGY5SVBibHhqZktFRk9qMFdGZXdab2hGUUJ4U2gzZm00?=
 =?utf-8?B?MFo2THpqaGlad1JtNThicjJkZlM5a0ZBK3JGWVd4K0QzYXR0eU05Qkp3aTV2?=
 =?utf-8?B?c2NIOHJaZWRuM3FWc0FYZXJRdnllYis4a0ZBOGZvYkl4UC91Q2crT3VTTHpt?=
 =?utf-8?B?dnZibkVQNUxZbGVJWEQzMURlNi9qSW1NUGRaT0xRcllDaUkzWUJPZ0xENlly?=
 =?utf-8?B?TFh3dW1XU0lTR0ZPUi91QTBxeTg2YUk3MklYYUNVTWxiMTMwMDVVS0tBTkV3?=
 =?utf-8?B?ejcrNzJWbzd4dm5QQlBkSGxKN1hkYkFJeUlpU3RhY25aMzU2VW5HYmdKMHAw?=
 =?utf-8?B?YWJuZThuaHFGdWZnYXlLUkFxYWg4QXFTRllQSThhc3AzcjdBM0txWHcvUDB6?=
 =?utf-8?B?R3lnaGJGemR3L0NqUGM5SHBsYW9OUzU4d200WFk1QmFlbi9XSmtxQldGTG5u?=
 =?utf-8?B?YWRMQ3JxWGZ6d3ZYQTI2aEZKeUltVnBQTkc0bHErd0NnRk5EYlgxbGJ3VEJJ?=
 =?utf-8?B?MXREc1NybGR2aDQrdVM0ZE9GQVlFWUhlRzh4YVNZTUpWOFowWGtEakd2Q0JQ?=
 =?utf-8?B?NkxrWTZjTXgva2dXdFBMWVhLblp4N2h0QzZKMTdPV0RocDJCZDJhQVJXU2VV?=
 =?utf-8?B?OFg3QTFJSnFDUmhPVi9SVXk5UURTWWdLbUpqK3p5SS9na0EvMXRUTGRqVUR4?=
 =?utf-8?B?cEc5bThkUUJvbHJlTE5ZVDc5eVowVGY2cVk4ak9qWmZHaVR1MkdWQnFzSUc1?=
 =?utf-8?B?QjFqZDJBcFVyY2R6bXRjS0p4Um95V29EZ2YrQytoaU5nb1htNU5zYnlnejZB?=
 =?utf-8?B?cXBibis3Sk5ZY0MyZnFaQnhhQjVhYXllNmhGVzlkcjhpcHdBYm0wVm1yRC8x?=
 =?utf-8?B?UnV0QkNrM09MR3FyVS9ma1Q4aTlVVnNpSW55SWY2YWVJSndXOVdvSjJKYlAr?=
 =?utf-8?B?N0ZrdWpQSStRN0xPZWtGdGRyS1VObEc3MVU2Ym1oRmtYZ0VrcFVpNWxxM0Fz?=
 =?utf-8?B?bGxIZG50aU5PS0ZjVXh5ZXJsOXB5blZvdkVHQ2lKQ2hxKzdWMFk4WExTWWVp?=
 =?utf-8?B?VnZKWVpsdFFBYXFLV1MxbFQyV0dPMENQdmhONHp1Y3BtSHlnNFh0ZXE2L2Y1?=
 =?utf-8?B?bVpOTjlHWUF2MlJWMXlVandBT0o0K0NZemFxbWVuM1JMWjZFaXQ2U3hiaTBr?=
 =?utf-8?B?eHYxeE1BTXRPVy91TUh4R3JKam41QXFsV3BLb1FubUdrQTEvditqTDJtS3Ra?=
 =?utf-8?B?K1FjU0VhR1VVVG43aGVBL1dEaCtxeERvQkptZ1VlOXNGVmczR2ljSE5yazRn?=
 =?utf-8?B?T1A3dzgzOVhrbk5tSDdVejJDaTZXeCtkanVDRzl6WUVISVMxc2xJcXBMQi9a?=
 =?utf-8?B?QVp1UDF6Y3RCdUcwb3ZNYUVackd1MEVBaFJNaDhJbUlVTzlseDlWNEZpTmRW?=
 =?utf-8?B?ZHVBM09lUElyMUdvTXZyZ0RERGxRSGUyZll5NnM3MXJiVlNzZDRSaXJqa3VH?=
 =?utf-8?B?bVZuMFg4Mm41TFp5RWNOamFnaE9GQkk4Y1NNc25TOWVlVVVteGdsenVzVU1a?=
 =?utf-8?B?R29uSHZxMlZHa2FGTDUrdExNMlFCcVlsUkNzeDBadjBnMW5WbHZqRlJkY2FY?=
 =?utf-8?B?c2NKSENwSzI3VmFvNXVuTnZxVzhWcEJaZDN1c0ZrWnpRRUl5Tk5wUzNKTkNz?=
 =?utf-8?B?VXR2eGNGbDZOL01kNi9jbmtZdHFwL1FhSCtoc2JwRVArNkJ5NlZ1OVlmOTRm?=
 =?utf-8?Q?u7akioq31LVRaQR/SCMEMArPqSjOCxSpLV82glr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abbc4306-921d-4b98-656c-08d92fdbf5c8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 09:00:01.9989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JbPdtWLgCk+XWn89rLUdV56Z/tTxsuHCmrmLv6XTBXmg2/jnSW7gYTFH9o+tWnmDmATlIeQC4oEsg7OHCEsngDlGqGSLXU0jF064wVMqOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1779
Received-SPF: pass client-ip=40.107.3.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_NONE=-0.0001,
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

14.06.2021 14:02, Paolo Bonzini wrote:
> Add a testcase for the test fixed by commit 'async: the main AioContext
> is only "current" if under the BQL.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

