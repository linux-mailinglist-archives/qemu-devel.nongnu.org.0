Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39A839AA0A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 20:33:19 +0200 (CEST)
Received: from localhost ([::1]:42384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1los9e-00038i-En
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 14:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1los8S-0002HO-3B; Thu, 03 Jun 2021 14:32:04 -0400
Received: from mail-eopbgr10091.outbound.protection.outlook.com
 ([40.107.1.91]:6568 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1los8M-0004In-5z; Thu, 03 Jun 2021 14:32:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOpwx3+8OyUj2RKbEykBRnRZGc+EEZB7jXHCbKMMPiDl37uR5WufQ/ykqjiULqsY7yX8FKtCAshTm8TlbZov7ziI3gyHNcSfKaVk0tsKTlixWY0VC/IKi4X5mvXb1qrXyPQNB9zuhW0+xipjng2Cv4tcQPO8HN4tLyftNMQT38Jt/l/kbfC5nRccJUCO7uIgKAK3mGpxEMzp2WmoiygkrnxoEzmSG+jmJm1FeL7O0LahomzYEvSCXOwARo1gD133K5SU7xQ1uvEdSuSN9i4/zNp+qpqSuyuNOIUlNYvPaDrFcRoeJEA0ehWiOu0v7BSOsMAgmNB0H0dlKN+PZ/B9gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/l8KdoSTeD1kpEKteVi24FhFqa08zeKZ9T9hDIJSISw=;
 b=UmI3h+JNJbKhw/6ESjBUQXHkkE7vQMUHMG3r/AICIzCgKZiRZz9rKn4TZWbDx/VBNtIFmjAankeN/D/FVOWepPX97jTojKgjrriwVsD7kv4Db+VVSz8XKkd+qDTzI13Ni9M7RGL+82rFpEyXJZPDG6ssVIihu9C9o/ZVTfUWuhNYzvv4P+FxSV+a/XNjQBijwepJPhvAdLL30uqSKS7UGNPVMP2w+0yHmfvOimLGCWNzoqOFfiFB3gC6niT9xJlZ7SAe7XtgktF/P6xWeTqtyFpBLd2jKhhkpSX3C7e0Vno1JPvot4qA4/6UT5fbzj6ANwq5LuSicl1wXBvCvwPHVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/l8KdoSTeD1kpEKteVi24FhFqa08zeKZ9T9hDIJSISw=;
 b=iDJxnH2filtwDhvzybQfzXVPd/IXS2MVIj35U2l9lVRbGpMosi5cfa0r1AYb2REYgOhGNWSpNMGiCIY8qbYtQLZPdyHLbSDco4oQ+oRx6XNisRL09fclN4IX9BIf02Kp/SoR5ox5NNlVPyscq2CtVh0IJvDFZrWfjOOmzPLKvkk=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5493.eurprd08.prod.outlook.com (2603:10a6:20b:102::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Thu, 3 Jun
 2021 18:31:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 18:31:52 +0000
Subject: Re: [PATCH v3 22/33] block/nbd: pass monitor directly to connection
 thread
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-23-vsementsov@virtuozzo.com>
 <20210603181624.zpfzmrruvvs2nwgx@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7ae1b61e-fca1-b315-2bef-cdb8ef8ba20b@virtuozzo.com>
Date: Thu, 3 Jun 2021 21:31:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210603181624.zpfzmrruvvs2nwgx@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.243]
X-ClientProxiedBy: PR0P264CA0109.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.243) by
 PR0P264CA0109.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Thu, 3 Jun 2021 18:31:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cf9fb24-5044-4c7f-3058-08d926bddbc4
X-MS-TrafficTypeDiagnostic: AM7PR08MB5493:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5493534A5B72F84D59C7814CC13C9@AM7PR08MB5493.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xzgnhmcoNsrXSe2w2pTBRJ6+nFTNvbRoz0rV2fAc6j20epSa1sfLoXlFkmpGprCBmygkO95i0vQdjhfCNL+9iaSwJGMAjJOxwX0EHMz74MWd974u0qeau+o4/sgEmyKsdv4+liBFd2bKn0bEmLHHnBuex3ib0ATYOrPHcBhrZ7jJfPIjmbsJnxVfDsuZ7lmUUe4Yg09JQhoYzFq905pfdUeeevcn9T9ili9q2QtMraX3pmKkt3PbYqHQpTO36unwWCYT7jG9DUiUbV0pyuk4ond3KEc2VxShb6ibxKzy2YDmCfmLsY+FGe0gQ61dxr3qyoCgX/LLm9yC9Kx8efsP/TK0iXii6HYKsVsc0O5sqk3ojOdeNddkMTjc6j2mBL1Yf9E5MWRfmRsKCw69VUAMzHdnxBYpNSyg+CfNWWHILop8tCjnRQ0k6WPh3XxPQT/H5AUifayH7TWIcucRBSKUUKioJlnX4saYbDLUY2PSAi7dSOCSUTJT7Nt0rR+dwtjBhb6qddZ2eahggp/mOkPSo/bDO2wi7N/RgOu13tXNWKBX0lEWSg47a4RKNjqdpmId+nHwKNVCHcY+ygGaqvakXOccXF+zFs+Sp0lz4Am2TF5IMlrNw3r+WaG1klO4Dfn4rOPro8oAvSnBYXnQ9hjPmf/GflztQi8vapsYHPcW/q7iUZz6Lvvhz4IKABLz3BESz4Jk61BCNRxIKRh11WTbqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39830400003)(186003)(6486002)(16526019)(8936002)(52116002)(478600001)(2906002)(107886003)(36756003)(66556008)(66476007)(5660300002)(86362001)(8676002)(2616005)(4326008)(66946007)(38350700002)(38100700002)(31686004)(83380400001)(31696002)(956004)(6916009)(16576012)(316002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2tJR3FvQjlBNVBWRGkwS2Y2VUFPbUMrR0FnV3kxMkJYZnlpRVdpVHF0Qk9x?=
 =?utf-8?B?MFhjUHRBejlvbks1ckpJZTJJWkhMUGFjZnVmTHB4WnU0L0NlWmlLcVNaTytQ?=
 =?utf-8?B?SEpSUXBLMHpQTDJleC9YcldSZ3kzODBZMEFSNXh3dnc1OXNWTUh3UC9wc2hr?=
 =?utf-8?B?N2dLZEdYNDNJeDBxTlFKRWIrdzlxcndrWGJTR0lVL3I5Z20zVm1wY05HaFox?=
 =?utf-8?B?bStZRjdEVUhHRWJ1RWlmNXdwZElmLzZvMzI5WHA2N1lzb1RyUXFUTTYwNTBy?=
 =?utf-8?B?NStGeGtxcnBtZklqUnRxcEFOdFlQS2tlVzdZRkN4OWNwUFBGZ0ZPanhTZStI?=
 =?utf-8?B?elFyQVVsTXQ4czFBNmFRUHhDNE9XN3lnWkEzOWptc3RQRENqZkFnaUo1MUZ5?=
 =?utf-8?B?ci8vdFdXZVFYQU5qdXRmdEhnbkp6MUh3KzJhNVhQUms5cHIxNW9iVHJrRTNR?=
 =?utf-8?B?K2RPRGc4YTRRSlp1K3MyTGNnT3dOL0J0emRydWxkUkd6YktnUUpPRjdQT24x?=
 =?utf-8?B?M3EyTGdHQU1KdlhTK3EraUsvRlpTTzFsZkplb08zTGNkTTlIaCsyZkFuTmly?=
 =?utf-8?B?K1pCNWVPZHZIOCtDRHc1V1BRU2VWb2tJTHBTVnJ3ZlpsUGxzanFoQmZmSlVX?=
 =?utf-8?B?aDBVSWF3RDBuUHJXNDhERnFxbEQ1WE1SOXZFdnRwbFhXdFM0VWYxd1EwMk1y?=
 =?utf-8?B?c3ZsRDdxR1F2NFJNYW1ZV1V3KzR6L3d5QzYxZEp5eGNmMWE3VEVDZkVBTUV1?=
 =?utf-8?B?eEdiU0w0OElFZkxsWEMxcFZuTWFGR2dqamc3eDRkeWt4Q2duWDdsc3FHR2VL?=
 =?utf-8?B?V0RlWjNTZWpUb0YzWmtVcG1uZDJqSTljVndvc3BNM0ZlMmx3NE5RMGFtaXpZ?=
 =?utf-8?B?Wng0UDhyMTZTa1BiOUdLZEx3UXFxYi9ZRTRRQ21jWGNqZ0NmYTNEYTdTNm1j?=
 =?utf-8?B?V2VZVUYxUlNXY2JILzJTbG1ONEFqSGY4QUZZQ0NmeEJJTVpSSHl5L1RsS3l6?=
 =?utf-8?B?RlBON0h3RGF6bElUR2RzU2lqdzZOckNQY3JMSG9Md0NldkltWHhJYm92QVo1?=
 =?utf-8?B?WlVvVlNkWDFzZXhZSk02UHVZcjhqTXJZcGQ3SmF5TkRpUmxRTnNJeDVEOXIv?=
 =?utf-8?B?YlB4V0t0QU1FUGJSdkVVOHBUZjhYWHplZ01SZmJYaVNPblQ3WC9NR3ZGY3Vn?=
 =?utf-8?B?YTJRNk1ibVJtKzFjL1FGcHE0VEhTSzllYm1tM2g5aGhCcUF2ZWZTcVJkNVJ2?=
 =?utf-8?B?ajhEZitPenRxMVM2TkQzQlVLUHNHbVBmYWNsWndnSGt4QUdHR2FLZU55Z3cx?=
 =?utf-8?B?ZGxaa0RBUkZCNHM0RTBjbnhUYmpUNkgxNXFML0Y3enVWYlRHQVNPdFN0Ukh3?=
 =?utf-8?B?L1pIMEpvSGpMbC9WTVpJL2Q5NkhzRzdPQlVnREYzSlFaQkFZVFg0SmszdURk?=
 =?utf-8?B?QjdkS2VZKzRhR1FsR2dZWXFlQ0NPSEx1cHRIWmxZcUhhYjIxS1g5TlNjV200?=
 =?utf-8?B?M3FLNmZEbTU4ZDA5ZkJZdDZhak8wQjBZbEhiVjZnOWdLb0l2UjRUV0lqT0pL?=
 =?utf-8?B?bFRlV0FjTDBhczlqZ1pjanRHUS9Fekl0MGdaaXRubVRiOGFJL3R5Ym9qZkVL?=
 =?utf-8?B?SEl3NHcvQUNMRlZmbGNBNW5hWngvcDY3VTJ6VHJXb1QrVHJPcklDT3VTNDdn?=
 =?utf-8?B?cXNKSFE1SW5sTkFDTnM4T0FBVm05Nm5yR1phZjQvYmtKWlNvckp2S1Bnb29u?=
 =?utf-8?Q?biIzYsV0Icaln8bNCD1kytxoXBg8lpLW8F5TyXw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf9fb24-5044-4c7f-3058-08d926bddbc4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 18:31:52.8423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rc8jOZTcde9qLcma/AYzJLQH7NG8BOx+j45ZagWISCNU0V8RMYkUF0dpmOjEbBWzzA/2HhPy4DGeMtdT35CRj8fyPWNfiM99QQSlrXwdio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5493
Received-SPF: pass client-ip=40.107.1.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_NONE=-0.0001,
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

03.06.2021 21:16, Eric Blake wrote:
> On Fri, Apr 16, 2021 at 11:09:00AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> monitor_cur() is used by socket_get_fd, but it doesn't work in
>> connection thread. Let's monitor directly to cover this thing. We are
>> going to unify connection establishing path in nbd_open and reconnect,
>> so we should support fd-passing.
> 
> Grammar suggestion:
> 
> Let's pass in the monitor directly to work around this.  This gets us
> closer to unifing the path for establishing a connection in nbd_open
> and reconnect, by supporting fd-passing.
> 
> 
> But given Dan's review on 21/33, I suspect you won't be using this
> patch in this form after all (instead, the caller of
> nbd_client_connection_new will use the new monitor_resolve_fd or
> whatever we call that, so that nbd_client_connection_new remains
> oblivious to the monitor).
> 

Yes.. I even have some patches for it locally. Seems I didn't send them, don't remember why :/ Will check tomorrow.

-- 
Best regards,
Vladimir

