Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5693B01A0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:42:40 +0200 (CEST)
Received: from localhost ([::1]:50420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdrb-0000RO-ME
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvdp6-00073f-Gi; Tue, 22 Jun 2021 06:40:04 -0400
Received: from mail-vi1eur05on2130.outbound.protection.outlook.com
 ([40.107.21.130]:22881 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvdp3-0002d4-N9; Tue, 22 Jun 2021 06:40:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zp5Pl2TPsfsEljGFSzo0F/2Yv1TE6LFzjt4FoRKlkn9wzX3w+rHHYgomPeWXeBasSITYi576OEOCyMIs2/q4cytIIMRT3xMyvnmTsZeW35jrpZPwvK5qV2HAOCxQLQjSi7gproL5W7EXET7S4DpoYhKrwLVv/wTKol1vIIoP0JgAubeqB721Oa3v7QgRSdkezWBeLDIqjhCcI+FtDJleKzVw/wcGNm5vtYIrh1sa3R16o5eexV5QTxAPAwiEtqv5/wwVUEIJ0+O7ubzzDdbDFUujprL61R7WKN0hi+3ZtHPfN0Uko8S4TGfouVEWw6hwfujeB53WgMN6cZxoVhER5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSwousMDB7UVM4G8hOGmqRqO5JIqljMjNaKrwx/n4DM=;
 b=nDZS/TfXP6/Y9E+0q2r3ncglFRgeSZSSvsD8W4fJL0QgxIMbF/MAuvcDCrGuDzbV31SvI/1hrYIIcHZCzH5d0LuCPDCFjzCIfhTEIPsm7BlGFgvPFojpbwOUGBYi0iDCf6buIU+nuDhrGtVBssYKP8M3YqHo2xq8jgRNGAta0HVx87eC65OnuUTQsrUeGSD1r1siZ1DG/DZomcBUdh1F3AGc+PKLUp6rev+Tiz4PFv/avn3asXXcOjnjXSQFtlZSBFYosBANHrwnJzvNKb53rkb0RUPwc9eyHMEkC8YaYVEBK9PC1IMC9XUOGL84lUBQWlaja9B6E9z+F2xUAqVX3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSwousMDB7UVM4G8hOGmqRqO5JIqljMjNaKrwx/n4DM=;
 b=jzNKaVhl0ZysRe0EAk5kZTxZmgUW5I/EMtSLQOQhflicDSR+9T6ThaOu/75dJk5XDSLG8BPW1YtWpJ0Ec9BcK9sA2KoTu6saN05f794kE2zI+cs/oR5KDXB45i7E8BfrHNTQVp+B+rB72so4OVwyUMFYvHV3rIHd06qt6DHL1m8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6293.eurprd08.prod.outlook.com (2603:10a6:20b:23e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 22 Jun
 2021 10:39:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:39:58 +0000
Subject: Re: [PATCH v4 6/6] block-copy: atomic .cancelled and .finished fields
 in BlockCopyCallState
To: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-7-eesposit@redhat.com>
 <fcb8849c-bedf-aacc-3831-0239d89af2d6@virtuozzo.com>
 <c06306f6-e154-ec58-44cc-33d48d8ccdff@redhat.com>
 <28d4cd1c-2495-b30d-3c9f-2d8d0d3e897b@virtuozzo.com>
 <c8b4e9b9-15a6-3ae4-cb8f-5289a221dcbe@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5e019d88-3551-4a08-6a67-e0699dd4f72e@virtuozzo.com>
Date: Tue, 22 Jun 2021 13:39:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c8b4e9b9-15a6-3ae4-cb8f-5289a221dcbe@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Tue, 22 Jun 2021 10:39:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03bcff39-4bff-4b35-b0eb-08d9356a14bf
X-MS-TrafficTypeDiagnostic: AS8PR08MB6293:
X-Microsoft-Antispam-PRVS: <AS8PR08MB629362145AAC4504A2DD0C3AC1099@AS8PR08MB6293.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QheHdVw8reJNHNyBM94eqm8D1gZ9F5F0jAXkloo4bJJiHq/OoFHl7LW+Spjc43KGh2RBYSrLEYgPMqXUZUIld/Sn1aCu3qyaH4LjfTIlFbUmrHsmuYUK/LvR9iEQ92buA3ZDTfcjuREO/KajQfGPsEKYMBmfeHeB15tbEUt/wDJTK+y2qxgql/1mlG2UURnpkBiiUZOH4QHHyweyaZ298Yvnz/QlMExXE4U8fWAi6dBk/Lv7yKwsnTrWKq+elt/nQppyQPfROMJf/A0Gepbkoa11frLck8F/zXZyKt6lnMq7KdHl3XtZshnZ6Tjosac0uEq1z0Go07KJTDp3pv7R8pnKWOr64vNdv3SAbiJABBz+YvKhoL6cNCERzMN82gIUB8XIKTYulnWNmD8KnJGcsDlH/eNncz67jlU5+jptX3oQR04tIJqlnliYEqqKHj8y+cDuAoBSI/5F3Y6SDSh2Ki8ijo7KwXh9hz0AuNHEklOkY12WjQC4LxxlIaseFOy9yKEilRoOVQNy7fWTZn1fX8Nb20gDCYbOvCqVOE7Yr7/3rXPZN9ikKd8e5zcnsXYWdMQ/NjQs1PpiLCEqno/ZI2QKkWRBgGDSzFKXzLlVQi+DHD+ma24HDLH55Qkc0/B1ciHdNZhlXfDBlmg7QVh7Hppd6UU/3aykrVnaHOvl8w3pbYsYI/x5Uq1HAVfD0yojf353J9o4fG0BCU0yCwATblPdcwkZ1iO46jr6nxgzwdqpJdz8fZSNORBkTFguDw8z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(346002)(39840400004)(376002)(53546011)(83380400001)(26005)(52116002)(186003)(16526019)(31686004)(6486002)(4326008)(478600001)(38100700002)(38350700002)(8676002)(2906002)(8936002)(316002)(16576012)(110136005)(54906003)(36756003)(2616005)(66476007)(66556008)(66946007)(956004)(31696002)(86362001)(5660300002)(142923001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjZlbTloemFKa0JrQUlUZEhMUVU3dEhUUXluVlY4OXBxTEN1UTVWZ3JnWlBS?=
 =?utf-8?B?V2dwaEQ5UFpBS1NsdjVnRE5XMnBDbDdZSmtSQUNEK2QwWE1tRS9sMndmd0xI?=
 =?utf-8?B?OU0wVWRNbzdwNWY3ckNRVStubHY5K29NT3FOb1NJTDRFTGF2NVNLUTRDQ0p6?=
 =?utf-8?B?cjVUSm9VM25tU1d4WnN0NGZWNW04UUI3RlRtNE9aa1l2TTZmeUFiQ1loQ0w0?=
 =?utf-8?B?bUFEM2NkQkFKUXFTMHdqNm9mNkxNQk5WeEhUTmRsYSswdGhDQ1lDZG9LeEpB?=
 =?utf-8?B?cGtmaW1BdmhyQ1JDUzdzNGxiQ0dqZUQ4N290Yjg0ams2MVhYYlhHQTU1TFQr?=
 =?utf-8?B?dVlsODJLenJMdFh5NUY4TWpoQkw4Zjcxc2RWVEpCbHF6dG5sNzV1djZ5eHdL?=
 =?utf-8?B?ZU5Bb3I2cDA1QzVRM3krSjl1bjlzTTJXVHc0ZlFHL0xyNkQ1ZjRHY3RKbit2?=
 =?utf-8?B?bjlZcDNPdjJrMDBoOTkzdGhkZXdlUTNRT0lZYWoxNXNiaW4yVW5lUWsrSUJq?=
 =?utf-8?B?OU84WStzMUlXWUZraXdEOFVRalVteTc3ZGZKbFN1YSt3bnBoZ0Mxazl3b0Ft?=
 =?utf-8?B?OWxmclM1L3k3WjZrczlDODhzRTBhVERBLzR1NnUyRHV6VnVvYnRCNnNhV0ls?=
 =?utf-8?B?VXMvN3hNNkZOZTJSRTFmK0VSc1BHSXNDRHhWZ0JMbkxmMmo0Nk85bWtXWHI3?=
 =?utf-8?B?a2czTHhsaXZVbW1kS05wZy94Ky9zZVYrZmU3Q3ZZQTc4eHFQZGsvSzcvcWtK?=
 =?utf-8?B?R0V2T3ZCNENuZUFxQjZrcmk2M2E1NWNTWlVEUEFEUlAwNUtLTEd5bXhTa0p0?=
 =?utf-8?B?eE5NdHNIbVpneDVHaU8wV0E1L01CUVhMSjE2QVBJYktCOE5VM0pnY1FmeG5h?=
 =?utf-8?B?a0pFSGJ5YjhWci82ZlBpejQ3emtleTZIekxpcjIxdkpXdmgyZk5TdzFVL1Rz?=
 =?utf-8?B?ZTM1T1pZNGtHRzk0ZmtNZStobDVHdy9DRVFkbWdJdU5BMWNQd3BlamVZNmVj?=
 =?utf-8?B?U1FJR09nRDIrRGFySENPb2RBRytLU050VmFPRG1Ra0ZqK05sTHFjUVJvWU4w?=
 =?utf-8?B?c3FUaW13SURtdGhkOUVwTEd2QU9Wc2dHWGxTT1M4L1hCQlJJcy80eHFpdUJT?=
 =?utf-8?B?dVNuR0dkRjIxa1ZqSURXWnMrRzhsY3ZuSk1qbEdJY0tNaXA0ZEFYVVphTnlJ?=
 =?utf-8?B?eGdsc3hpMHlyVUppZzZNYXhYSjF4MXpJTHNvYVpQU2FRVG5JanBTZFgyaXJO?=
 =?utf-8?B?K1pOWFBiRnhWdTlJbENTZzBUU01NYjV5LzFCU05odkRmZmU1b2RXeTF3d0Rn?=
 =?utf-8?B?WFU4dFNVa3kzZkZJWlVwNU83ak93bnYyQ2FQUk9aeFpNSThwKzlLVFJVNHpN?=
 =?utf-8?B?UTdJSFhmR3VILzB2MXdIenZmNjNCUzk5V1h0LzRzQTg2YVZ2N2srZHQ5alps?=
 =?utf-8?B?MVNoWGhiSGlUWjJpQXJEMERnSCtqQ2JhRERYeWJtcWNjWDQrTGlBWlhFa3NU?=
 =?utf-8?B?VkVpSjI4Z1BtVVFaU0tETTd5djRwUXgzRXhzZ05FMXVvSGF2dXJhdmo4Smlp?=
 =?utf-8?B?cmhvU2owbVZSZ1BkZCt5amhIMU5yUHN1TWViREMrZHB0ZUdkZTNKTDdJRjRH?=
 =?utf-8?B?WHk1cnI1MTB6NndsdWpveDFGVW1paCtvRlhpWVhRWkxLQ2VTV2ErVmNoaTRY?=
 =?utf-8?B?ck1uTHY4czhYdmtNNUovckJxcUUrQW5tcTY4NkR5MHRkWkx2TU9lWmp5dTB4?=
 =?utf-8?Q?cr9tbnt+uWMOfzRH3yjZ//OTtVeGOWwfwSc3BSm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03bcff39-4bff-4b35-b0eb-08d9356a14bf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 10:39:58.1334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTCg4zlTsSl57d+mtvsf5Ra8s+CWLynIvecqhTKLQ6YRtsPZqo6swi2liWyF6adJi8opXUISCxb/CFlsv2H1qAvKEgIlRYLsEOdJ85PbT0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6293
Received-SPF: pass client-ip=40.107.21.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

22.06.2021 13:20, Paolo Bonzini wrote:
> On 22/06/21 11:36, Vladimir Sementsov-Ogievskiy wrote:
>>> It does.  If it returns true, you still want the load of finished to happen before the reads that follow.
>>
>> Hmm.. The worst case if we use just qatomic_read is that assertion will not crash when it actually should. That doesn't break the logic. But that's not good anyway.
>>
>> OK, I agree, let's keep it.
> 
> You can also have a finished job, but get a stale value for error_is_read or ret.  The issue is not in getting the stale value per se, but in block_copy_call_status's caller not expecting it.
> 
> (I understand you agree, but I guess it can be interesting to learn about this too).
> 

Hmm. So, do you mean that we can read ret and error_is_read ONLY after explicitly doing load_acquire(finished) and checking that it's true?

That means that we must do it not in assertion (to not be compiled out):

bool finished = load_acquire()

assert(finished);

... read reat and error_is_read ...


-- 
Best regards,
Vladimir

