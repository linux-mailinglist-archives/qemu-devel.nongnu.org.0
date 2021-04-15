Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0881736124B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 20:47:26 +0200 (CEST)
Received: from localhost ([::1]:42732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX71Q-0003Jg-Rd
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 14:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lX70K-0002lw-S6; Thu, 15 Apr 2021 14:46:16 -0400
Received: from mail-db8eur05on2120.outbound.protection.outlook.com
 ([40.107.20.120]:11877 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lX70H-00045w-7w; Thu, 15 Apr 2021 14:46:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMg/CPzr/69ZDFKzpOs+UlvUkQOBMCxWGvDcJFwwOPRqGPcwhelHIadm5mV1kYyGPbuWaRt1oFe9IAkPtnJyfeIPIRcF76YXoR1Qntatg1J4VC+J7JO5NbpM0YcPmcs2hmO3FUaLShdWy+bRn2v+2LjxcjKC8kG1OUwBPn3IfWlVYsWOeTq4EbRujCZa3VFG7/SWlQ1Tfj3L32T+ylBlicM8C8du3zixWwNaigdk+jZFWX2ntH++unKBWH9gsCokfi9pf99yVgLHV3d2m8fmJMWwxniFyGI2SyTqdluOq24LkzxgYXo8pNRBNqch+aN103yg/hFDGEA+e8tyiyEnMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsMAEF4WS+teP/9VcjVxF03875K6cHrlLHqPfRIbGWY=;
 b=Ap8+/o33WFrwBg61/8ead5Uh5XZ67Tvx4YoZ1FM8+L1Hego5FlacQ41IILueU1K5NRwiJGee9D4yOZHFO0G1gwQhUspHtlLZJcHjyHQ3UcC155FxgQfT+FmcrTY8Q4LzGpKyKwVSPyOj0BFVANcNJtRDhHwgXxVtbCS0Zs5uJISnS2ynVXot5iZbNUF820BNpx2+fAEHf01p7RFhbIXBnbjQg8cSmnewko6WDjQ5UnccWd5Hvj8lnbjR0GiSzJPd51S/TddEFAbhfoWM2uaueSHgWBhMY90lKq8V5pL0RTwfj9NDO6Tq5efUzN7qrOlUGL2x5U1qov44yLqiBHhI6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsMAEF4WS+teP/9VcjVxF03875K6cHrlLHqPfRIbGWY=;
 b=eKnNuWsIhMpUKu1sw5vYvGx81TUM5Z8tvJRMgVQ2aVYTlSCoSO8wGzUiRWxJRPjMM60JqmCn3NF7jlpX472iFuDC80deaEDAUOVLGjjwWjU4NjDDZCbNB7jqgzPS/UizeaLXjVFoa34XjLr6uRgQDca8GgKiUtUB6apm2WZrniA=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4071.eurprd08.prod.outlook.com (2603:10a6:20b:a7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 18:46:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.016; Thu, 15 Apr 2021
 18:46:07 +0000
To: qemu block <qemu-block@nongnu.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: about mirror cancel
Message-ID: <b2e5b990-ca1c-53f0-0e0c-31396156fa4a@virtuozzo.com>
Date: Thu, 15 Apr 2021 21:46:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.227]
X-ClientProxiedBy: PR0P264CA0259.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::31)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.227) by
 PR0P264CA0259.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 18:46:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b507aac2-71ca-4f10-720e-08d9003ebaf4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40718BC033C75808DD9B11C8C14D9@AM6PR08MB4071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5dVSlqu0VqtmjiiYrrNuxnWVb2wa6e5ZdBFTA9gtcS4WhNN5IKeQv/q2jced0WcfDvZmw+cYK1PuOAckk1vQY5esLTxR7DZvLDoaHqkFHJQ6TxpmLHxR/QOJBVKD3a/3DxBuvnyPppXsvpyLJevk0QfBpDqKmdjmPV4bWLplPOBK2sWSLOMaGf0SGz/RjhrQJXhRveTu78rWNw7xzh84DzY8ZlrXkfJRnT2TtDJorAODA8xh84eB6FvUaz1aTTbdZGG7s9pOjt5pf5bDpY/FtiQJVRWPPbG1TC34Sex5oVxvdEIMQHXA+2xgNKiJ6OpuDL1RRJhEy6N/F898VGaiPiSuVlxKxFONxSAqjUw5jlAvZhlSJw8aYNsLWWlxSk7ZVy07gh6XUAaf99EMdVfzkwlxf9OvXjR8nNke0zJtIJ6saCnNF2qSy+EcCmBFgf66EXebPSw8a+JaJuH/HreT6z6niA6/5xBDIlofhrwesmR7ATGmI6xHdlGW15ezjWHTG2G5ic0mMPtj1Eap8W0xPhg7iXuYI3fxoYdz1EpH5jvYQ3z2+xnGOVp47LvWCsdCU0Vp4gZeguaqwgvmbk6AwkRiofEplDZgwW7bigQt/FPybUoF/ldz4jZp//eL0q4/Uz2AGkPIE7miD9NZpJHDk6Pvsk5zxMsIO3IEFfBoWBrMB586C0qqkUXlB7aalWQ32dDB3pVMhPV5de5VbYBREWHfMgeRMmTQUElrWQLBGHcmNORs8vL5eJlaXBdf6pit8IPuVtSXeVPqjGm0oqJYpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(39850400004)(396003)(346002)(36756003)(66946007)(8676002)(31686004)(956004)(2616005)(52116002)(66476007)(8936002)(6916009)(478600001)(66556008)(2906002)(26005)(4326008)(316002)(31696002)(38350700002)(6486002)(38100700002)(5660300002)(7116003)(186003)(3480700007)(16576012)(54906003)(86362001)(83380400001)(107886003)(16526019)(133083001)(60764002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R2wvaXZlSFVTdVE2dU91aVJ2UlJoamlpVWN3K2J0cXRUMS9FQWpTZzlFZmJs?=
 =?utf-8?B?L0VqRGlITHJ4eCtDSE55MHgweEU0RnpBRXIvaEhKczVVUGdteFQ3UUkvRTl6?=
 =?utf-8?B?QUhjQ3NZbVJZd3Y5RjRSaDVQclhjUnVjTzEwYmtiU2FBREk2VWl4eTVwR3pH?=
 =?utf-8?B?Mk1UR1FiNm5zTTN0dUVZdFkrT2pCWG52RnRMK1RHeGhYWElLWDcxQVZvdGZR?=
 =?utf-8?B?bXAzZVFEZmJVTS9USGxtWWhPWXZ4SVRSRGNJVVFhekNLY2hsZE0zNU1ENEls?=
 =?utf-8?B?NkZ2YzBROFpDOXZOREY2MWpadjNoay80Q0ZGaDFtUmFOM3VxNlNvRXg2cWw5?=
 =?utf-8?B?R3FqbWVHbFBidjNXQlE4anB4cjRHM2FOQWpUbFNMK2k5a3o5eXRhaW1tQ0tG?=
 =?utf-8?B?cDd4NG9vN1E3K2xjcUltOXZPSXZ0VlFuUWExb2pLZFFWSzljTTNuSmdNQm5r?=
 =?utf-8?B?cWlXS2NKM0tjenlTMzhka0FmSkV3K0h4UmtneE9uN3hzeTIvQllZUTRpa0Zv?=
 =?utf-8?B?KzUvOCs1N3RhMXVnemhCQzU2bFltanE3UG55ZTN0ajZ0SDBIa3RNQnp6UUcw?=
 =?utf-8?B?TnBKQ3Y0cG12aHF3eUppZDdlMUpieS9OWTRuSWFHQzlncTl6ZHBVem5NUUtq?=
 =?utf-8?B?SmV1K2ZubE0yb1Rwak42VTRHQ0s2WmdqbWFpazhlU1dFK0JRbnpWaFJaZVFt?=
 =?utf-8?B?emJsb0ZseFlaTW9PamRmbHhqL2pOVEJzWHVGeFUzVVRra3ZweG82bnhnOE5w?=
 =?utf-8?B?NHg4Y25KSHJ4NC9yQXNDbElGczVGd3lEWXpmVmNxaEZXWFdjc281TTdWVGtj?=
 =?utf-8?B?NVIwSnhuR0dFTmF3cGZ3ckFnQnN3RXAwWDRrdDNBOFdJVFNiaVpnNjdMZU5X?=
 =?utf-8?B?NlNkdC9GMTc4UW91UTNMbk80R2RHZDRKSUZ6a0pnMmZtbjZ3Y1BraGl5empQ?=
 =?utf-8?B?dm5nRHVjdVdlUFJreFptTExMU21iU0pMNDRhTXNGaTZ6eWRoYkVkMVBwcElJ?=
 =?utf-8?B?ZWxOOEpnZk1LeHV0UnZjWnUwZERRUUJscnpiN3lvNzVwL2VOMmpuODV4VDhJ?=
 =?utf-8?B?UUF5V1I3VGJaWXlzNVMwbnY2VXhoMXlHejJmVTIvampxWkx3QmpxSXg5Vjhr?=
 =?utf-8?B?bUlobHdCMmZ4Zk8vRzhnaUVvaWd1RnRDWUZTS1FyOFFnSEFGVWkyS0VIRUZo?=
 =?utf-8?B?bVljeGdRY2oyeWcxRUlPK2FtZ25RNkhJaUxWYnhZTVdId09ORGVNM01KSmRN?=
 =?utf-8?B?N2JPclIzL1lLandOcWlUeXk0bEpHRjBXTTNWSXp0SUxxdTdBZHJKZjZUYjJ1?=
 =?utf-8?B?cUlrSkJvZkI1d3BTYXpDTFBFUnh3Y2tHMVJoRDBwNnE0OEY1R3EzYk5TcTh3?=
 =?utf-8?B?Zkg2WWxFT3k4RkE2cldLNlJNdk1NUXd2cWhGYVJqU2NoTzhyMXR0WXdFbWkx?=
 =?utf-8?B?TVIvWFVrRjBIQkgzbFZNZDBMU2g3TEJBdjhhS2RvRDBVc3lJc296OU9JTUxs?=
 =?utf-8?B?aEhSUUVLZXRwZzNvUnJleEkrVUl3VHZkMnlkVGhIcUt4UDdLdVJ0djZMTlEx?=
 =?utf-8?B?NzRYM0VCbDNzTWZod1dvODExUHFrdzJDbEFqdWlsSXZMYXRmeXZNZEpvdzRr?=
 =?utf-8?B?VHE3Qk5jYnJTVWhuV3hFNjVJYlBOUVJ4UkVsWFNKcEhuTW1Vb2hrSC9qRE52?=
 =?utf-8?B?bkJabkFtMk1KdjNBSjZPd3MrajJEcmg0NE9HQWhPOHZpejlFaVFPbjV5RElC?=
 =?utf-8?Q?dA8EIVxQsd2FKVS3fIhLugR7VLeoDtQsEYNAfwq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b507aac2-71ca-4f10-720e-08d9003ebaf4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 18:46:07.5962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eNJ1nvCMSlZ2IFB7OougY+/8dKl7+/4Gtlpd+xKXEiPihzrSOc9TeM5wBOMtehiumSApUHovGZwJi87D0UkrpWOpnZmYG21TFQ8bkQAJU7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4071
Received-SPF: pass client-ip=40.107.20.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Recently I've implemented fast-cancelling of mirror job: do bdrv_cancel_in_flight() in mirror_cancel().

Now I'm in doubt: is it a correct thing? I heard, that mirror-cancel is a kind of valid mirror completion..

Looking at documentation:

# Note that if you issue 'block-job-cancel' after 'drive-mirror' has indicated
# (via the event BLOCK_JOB_READY) that the source and destination are
# synchronized, then the event triggered by this command changes to
# BLOCK_JOB_COMPLETED, to indicate that the mirroring has ended and the
# destination now has a point-in-time copy tied to the time of the cancellation.

So, in other words, do we guarantee something to the user, if it calls mirror-cancel in ready state? Does this abuse exist in libvirt?

====

Note, that if cancelling all in-flight requests on target is wrong on mirror cancel, we still don't have real bug, as the only implementation of .bdrv_cancel_in_flight is stopping reconnect waiting in nbd driver. So, we'll cancel requests only if connection is already lost anyway.

But that probably means, that correct name of the handler would be .bdrv_cancel_in_fligth_requests_that_will_most_probably_fail_anyway()..

And it also means, that abuse of mirror-cancel as valid completion is a bad idea, as we can't distinguish the cases when user calls job-cancel to have a kind of point-in-time copy, or just to cancel job (and being not interested in the final state of target).

So, probably we need an option boolean argument for blockjob-cancel, like "hard", that will cancel in-flight writes on target node..

-- 
Best regards,
Vladimir

