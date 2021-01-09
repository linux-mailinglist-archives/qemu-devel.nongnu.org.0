Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ABA2EFED6
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 10:51:48 +0100 (CET)
Received: from localhost ([::1]:59152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyAuQ-00022Z-Q7
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 04:51:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyAtH-0001Ma-2O
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 04:50:35 -0500
Received: from mail-am6eur05on2122.outbound.protection.outlook.com
 ([40.107.22.122]:65377 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyAtE-0008Rz-B2
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 04:50:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdRkPximaAedxqZLx2pPVkonHCOslFBl7IbasaYri6DF76+gx8N9gNuVOCLwO63yTnFZpsU7hda8aNE0wihORwLnAnQpU43jeu0mTSRFGhAtVWc/4b7s/eppQoZt0FN0BZog1tjH2InGXDWvcnJ/og3VepONxh9241ztkcDxoM8r9AY8HE38LkWkEuEQsPCkz3v06eAD/a7mbhIozQL8Psgfoc0W9RmFYx4XnAhm5supPy4IA/dG5+gCRNc7RIh64zqJ+co8WtXBZPij17/VslG+LvFlz+Bvgn7lrTc9KvOlR4XGt7GfdhSdFQjfQK4B7To3mJr+P+HXWoSB+lj5uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozhXqQ5AExjRKiG+0vbrHDvEnF1SOAbGeBmgYz/Q2gM=;
 b=a3Ywrq9R9iGq736IcUSiUW2dHrC1WNOedbmXxxTvtHkkDgCNsm8zzyZ6muyEiyO0mKVcSIfH1P1Hffcgv7fbFWD3Au3dmhTHQX47J23Lg3p2M0klclHa3CaeMxG6+uecul/nWFtc50yFhuCJaCUSeJS6IAlti979dO6Cv1UN1izxsu/cSTqKSklHIw4nERpFlxwWj3XV8XiIFa0BCmlWAu9nNEcEA5AzwChzb0INAeG6MlMQqJldEp84qdP+1IuOtbV6NtpVLN670R3vyVfTBwAAq1/oTzUbB9F39IgEkwZkj+VuSqpfIKdrddNEThNxrizmhZoTWy5vIlUjPwOjSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozhXqQ5AExjRKiG+0vbrHDvEnF1SOAbGeBmgYz/Q2gM=;
 b=baWhHoIySsptAznjO2gDWa1GZX+xGkucmcarC/4PLTAU1fsdYX7lb0ixuWNmomAHlf2Cfzp77ZRvc39Ykhg65murRjWoO4B2M6xJhlskA354oPQKEBOQsOsBj4u3idp8mG0xr1LshSoldQ6C2JZZexP+KjGsWOZZAkPidd5Nvxs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 09:50:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 09:50:23 +0000
Subject: Re: Question: How to change backing file ?
To: Kevin Nguetchouang <kevinnguetchouang@gmail.com>, qemu-devel@nongnu.org
References: <CAFoyTzs4m1KeoFgyxmsKPr15HTToNLskib2_OyyW82yS3+z4aA@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e3af1482-9f60-31a6-38d9-be9920ef04a0@virtuozzo.com>
Date: Sat, 9 Jan 2021 12:50:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <CAFoyTzs4m1KeoFgyxmsKPr15HTToNLskib2_OyyW82yS3+z4aA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM4P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.119) by
 AM4P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 09:50:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95d25fab-e883-40fc-7e7e-08d8b483fbc6
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4915C0450AB14F0694A5D4E5C1AD0@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xuuRJPEIEppcEWrC1sN3x1VKj/Vy38cju+xJeHCde01mIiwjWq0VoxgN6gF9RkbCoP02nZXY0B1VXbDcgZLAcyEW8tVHiPa2KgAgFcICClIMVruaKJGzy7GGd5s7PEAl0VDXwKLAz8/QGP6NQnjafOstC7vvw50hkFYAiUzESo6rh8GFYqftJ7DSByS35VBs+4Et7td+O5yfIzPzYVO7hF1hDoqNNn9qSaHFozw81vf05SFkk0kN6XnBDGIvNlMJZXEnnsmZXRlHw2NR2iNPINPZLG1LfppdjRsjqeYtsavSZ18sGFwrs0154xrWSSzrmo1+XzPJM4SModG+D24uALJMiZVdEf5DqWs/7MZyc804oG1MiUFl3NSZIgSMo+IyCSU/kwJYXKwTFyaSwxcHvUu1/gzhg657iqMCcCv17jPwVcs/bCCDLKqnz8xY3qXUlkV+sntmXBpthf0V6Omyu98lEQKzm1F3DASc5qN1q+I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(136003)(346002)(376002)(366004)(31686004)(5660300002)(316002)(478600001)(8676002)(956004)(2616005)(66556008)(66476007)(26005)(86362001)(83380400001)(16576012)(8936002)(66946007)(6486002)(186003)(31696002)(52116002)(16526019)(36756003)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SGIrVm84ZEpTL1I5ckRLRUp3L1BUT2NrQUlMeDB4Q3YvblpZY0UxaTJIVDU1?=
 =?utf-8?B?ZENiVGhRbG9iT3JxQXJNdEVFOUV5a3lUL2hnNnZsUkdFZytsdHVtZzNSbEpH?=
 =?utf-8?B?Yy8yWE9yYVYrT3drSmR2bUtRZTl1UEUrWUpnc0pDU0R2OHVyM3RuMWRvaGVV?=
 =?utf-8?B?c0c2R0dFcXFJcjVQNHVQT2hOMWpYV1drZHo0anhPVk1yWmp2UVczN1NHYW1Y?=
 =?utf-8?B?eXM3OVRHek9ka0tjUTVBWUhwZjMxU2NYMERxNVRMYjdtbHRNaFBoT3RZWnBX?=
 =?utf-8?B?STZCUkJMOGE4S2VOYmxPVDFxbGJyb3NwMWNQWGlpaHV3Nk4wNTBkV2MyQWxv?=
 =?utf-8?B?dVRJRmh5WXFERDFVa3p4ZWN1bitFTEl2U1BGKzNkZitibnJRZndBajE3M29l?=
 =?utf-8?B?RjNaeGlWdGtMT3pjU3IzNEtVU2pSWk5UNU9sN2daUEJ4cEhoRFRmekpOcWhC?=
 =?utf-8?B?aUZhdlpvZlZsN3djMU04R0RvQ0l2cmJQUE9jb2U4NnNLM3hLVXdXQWgzMWR3?=
 =?utf-8?B?SjVlY3Z4czZCdmtGcFp6WlVDTWNVZHl4S0VtaGU0QjF3ZDkyczY3QlZYak9j?=
 =?utf-8?B?V0FkVHkwUjFYYk0wS2laTlJjb2oveVNuekp6LzhGNVNJT2s4UFp6c3p5dTJX?=
 =?utf-8?B?Q3o1ZFRGNVRUd21pbWlyMml1bXlobVg5N3NXRGZ6RVlGekZuUGdmVmczMkpM?=
 =?utf-8?B?VTBEZGU0engvUkpuRUFFWTFQcGU0ZkJiRGJ2Z2NDL3h4dXZ0dUJrcUpwdWds?=
 =?utf-8?B?YlJlOFNDNGxnaHdjUFd3SWphRHZqOHFKdjV4d3dnVzJLbGlpUGRCY0RMbkJj?=
 =?utf-8?B?TDZkUWhXMklhNG9TZ2VzNFJjOVJBZDBaMTRQZkNoc2Yxei85YlRScC9hOWNi?=
 =?utf-8?B?SjRpZzdBOE5taml0WGtnckVhc095NytsdzVaVVpTQXQrU0xwZUtLUk9LcnRI?=
 =?utf-8?B?TllxQzFHemJCcjZSZ1hZZnc2UnNMbzFXRzBCTUxnUTdjM1gzMGJtVGNadWc3?=
 =?utf-8?B?dTQrbXgvVlpDeGNSb0lxK2taOCt4RE1vWEFINFpOaHM0bERlTElCSGlSYndO?=
 =?utf-8?B?TmNacFpzSVBNQkVFNmZqMFNSalNDK2xCc2hNay9sZEIrbWxKOFY3TE85SVky?=
 =?utf-8?B?bkhha3RuZnNiU3Q1ZWFoNFpYcjR4VWNrUVB6N3RKQlRuemR6b1daRHg3YXBm?=
 =?utf-8?B?ckVHTVlpWmJWZWN4aVFqR08rYUNSdjBTOHFWUnc3RGFZOVpzUGR3R0thYlBE?=
 =?utf-8?B?TTlpQ0dWd2JsaXFSbXhSL2JUYmVKd1ZaZHdJWE5uOHJJS1E4M3hoYmdHTURS?=
 =?utf-8?Q?235kNvg7H1IVhNMsy0IKTE8h5WtYpnaYQx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 09:50:22.8719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d25fab-e883-40fc-7e7e-08d8b483fbc6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPqhTyhMEyUszisYHN0HERARNXVJRTOEXojWa7peHLusGhPcdIxECc1xUujXXGA496aGVHQ5FdUntQ4HkQFJiys7fYdxKwTscIXf7zQTT9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Received-SPF: pass client-ip=40.107.22.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.241, RCVD_IN_DNSWL_NONE=-0.0001,
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

Hi Kevin!

28.12.2020 21:03, Kevin Nguetchouang wrote:
> Hello everyone, in a class project, i would like to change the backing file of the current image opened with a particular path file.
> 
> I try differents functions i saw in the source code
> - bdrv_change_backing_file
> - bdrv_open
> - bdrv_open_child
> 
> but no one work... from segmentation fault error to bdrv_attach_backing passing through parent->blocking_error, i don't know how to achieve what i want.
> 
> -- 
> /Kevin Nguetchouang./

First, you should understand, that there are two different thing in "changing the backing file":

1. Change backing link in the block nodes graph
2. Change backing file name in the metadata of the image (for example in qcow2 header

For example, look at the bdrv_drop_intermediate() (block.c) function. it's aim is to drop all nodes in the chain between top and base, and make base to be new backing file for the top.

Key things in the function:

- bdrv_subtree_drained_begin/end - to pause any io operations during graph update

- bdrv_replace_node_common() - which actually replace backing child of top node

- c->klass->update_filename() - which will update backing-file in the metadata of top image


Another example in block/stream.c, in stream_prepare():

- bdrv_set_backing_hd() to change backing child
- bdrv_change_backing_file() to change backing-file in the metadata of top image


(hmm, why don't we have drained begin/end here? why we don't use bdrv_drop_intermediate()? - just good questions).


Hope, it helps a bit.


-- 
Best regards,
Vladimir

