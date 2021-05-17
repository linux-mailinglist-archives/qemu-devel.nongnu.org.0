Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD11382C32
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:33:43 +0200 (CEST)
Received: from localhost ([::1]:35994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licRK-00061e-Ov
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lic2N-0000DI-Du; Mon, 17 May 2021 08:07:56 -0400
Received: from mail-db8eur05on2133.outbound.protection.outlook.com
 ([40.107.20.133]:54592 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lic2E-0001KL-20; Mon, 17 May 2021 08:07:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIcdtr1OqQvNTxYIMBMInUNKBa60VX47fY6y4F7uRnqfehgrUzda7MjmoXOHRZ6VatD+vnL3Vlt1Ux/pvGdzhvBLp/tFM1NB2phWPDv4hrU8oLEn7oK8erngZIMD8FdwAh23aA+66vTO4Hou4fjFhR6qCY6YaORxXZ6qpG4e5zHSVyUn+hQgSMqhzniGt22hy2K/p7PpcmX55vVesjgPSlhWZiIwtoEklBowb4y1fdx/HFj9ArRtEw/LNRkBRbbkiluqETmDF9ywT7/VvHVVljQR9qDwAKbEw0Kv4LLSRgCNE76g0oKkk8z6VRqiLwdpvRkvBH8vgANZgFt4QLXuJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9t5/xOwmdM+QT0jt0n04wGdevNku3WEJh4TuxdaLTzk=;
 b=UqesGNp7Jx9xc+ruA2mT3FPcvXUViiJtYj9rNNN/FccVeZ/qj0aiOJsApOZCT13tm/XsqLGKwMOfweHg1Rlkdnc+QwbmlnLcRGZG+xN730O5De+PyrYYvZ05oyi8YdJvpmtPyHyvmc3demBJkAjf7abSrPE5oVC9Mx2QShTehCzPM+UBZRQ8KNRdrO95NdYAYsn0wBJvl11t8HOq2pT9aQ8tav08bq4o5ihE/grLHiKjvnjCswsbNJz5Klqd5svN9zwXXkCAApKY9rJ6PuNf8lvn/CeLK2DJ4ec2jtJlJeIG/0xR0KWSZNzQtWU1uuuZAVDTsK4fvYXDWnc/OhVO/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9t5/xOwmdM+QT0jt0n04wGdevNku3WEJh4TuxdaLTzk=;
 b=sf7/bhm10DPMxfNnAhX25lTIeL4qtgFeSJE2/BQrFqkxyzCA8msEnmXr8J4vCc0HOC0B6KR2ta2CJxWnO5lgNWEEqCeMDaCCAWZ/zkZV9l8u/gvQraSkNE1LAANq7QGX6mCwG8hj8/a1nydpdqqwN4ZwPKG4iLMGtWsg4stTYP8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4949.eurprd08.prod.outlook.com (2603:10a6:20b:ee::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 12:07:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 12:07:42 +0000
To: qemu-block@nongnu.org
Cc: qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>,
 Dmitry Mishin <dim@virtuozzo.com>, Igor Sukhih <igor@virtuozzo.com>,
 yur@virtuozzo.com, Peter Krempa <pkrempa@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: RFC: Qemu backup interface plans
Message-ID: <ad71ced7-d0f6-5d99-4678-7d0e2d3e2561@virtuozzo.com>
Date: Mon, 17 May 2021 15:07:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: AM3PR05CA0094.eurprd05.prod.outlook.com
 (2603:10a6:207:1::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.231) by
 AM3PR05CA0094.eurprd05.prod.outlook.com (2603:10a6:207:1::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Mon, 17 May 2021 12:07:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ef6c1b5-036f-4e27-c16c-08d9192c5fa8
X-MS-TrafficTypeDiagnostic: AM6PR08MB4949:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB49490412C6069D4A0028BAB1C12D9@AM6PR08MB4949.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4d3j31OEqwvpPGe7aQwOBk9F5WzQ223RvVQfImXiRZ0e4KFYZVl8eJJBLT9s5gO+4tUa64xB2m+sCwjYvRMhLgajNvbg4xgDIlZnrAlJvGc7aXHhZJSQkIDBj0C4iK+yHZ0xr0XB+u88GtiJeGfte7Zc+wNMdUAoOoHjiVYleHRY3q54G3b/UVU2DJEes00RbgTaLkrArAzXWK5oRx5lsDc6iSGK9OqjB6AU5jDLcyx1yLW5sD8B5UBBSU44gXwoBRNjU4K85nXTGDX2bb7z1oWx8ZvFSWqbn4aR0zbcUm+iCrzlbid/5XMTd4hpgNAd7osbQDNKrloG1XlmFuUYJk6okqDf54hnb5PZQzKJnBTrIBZiW4SoLL5D9x1BUMShZdcDUPdxsveSRCq4FQ/uqhxIqXahiVLbU0vsbVMwAm56ZcXmARYBUz1zFjmU/hpTL3gDATemdrChW9L4rrkfdU+TqIRj4zUuSB1WeFgFwv1pROlTV6SS36obNCLFwy+HzAn4SzMyBWcQth+7lhaRuevbYgDypUhAI4CQjKDbfVUhls/rlC+PcnAgZZFV8f5SLxTRfQivG0C7O+87+SjweKM/nCSbKY9YBVtAgAlum8OYe5VcB7HuNfHGtC3LKpdIOyeBsST1pdcibDj3ji+HPDUKW5LnkaAvRtYI8vI+8E+3joYhUDj00e2sCji/awc0loy72BiSz71q+VllY/WFdNbyIaooPraqlrz878XaHgFjrPHcy/p8IylnTyqXPfVBLTh88YQtFHmOUezWdLe6ydV4yddPTgXj1nsbhuoP0fI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(396003)(39840400004)(376002)(966005)(316002)(52116002)(38350700002)(36756003)(38100700002)(26005)(5660300002)(4326008)(16576012)(31696002)(54906003)(66556008)(31686004)(30864003)(16526019)(8676002)(956004)(2616005)(66476007)(8936002)(6916009)(6486002)(66946007)(186003)(86362001)(83380400001)(2906002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZXpFeStXRkEydVIyaThnUjNMZnFjNWNqSVhpMUEzMEV4ZlczVCt2RUJyWGlZ?=
 =?utf-8?B?WGFTbzE2T2ExSUk5eEhnamtqODdOUzRBMmVXdEF0L1U2OVZaSm1SNFNvSFNh?=
 =?utf-8?B?RkdkbVFDamdNYW5JcHN2bmVaVklDeWtucUlJKytuYlFsaVBiaHFRaFlPdmJQ?=
 =?utf-8?B?bldJT0lkcXZDMmkxQWpDSi9VaHRkWTg1L2h6ektCWlpadVB3bDY2NFFqRWZk?=
 =?utf-8?B?QXZWaHdQeGM2Ri93MXRlb1NsVWNYMDI5cTZBM2ZJbUZlQk9ueTNKaGZXaVVG?=
 =?utf-8?B?QkVnYmp4dUJyM2h5WWxjWEg1RmhqR2xOSSttWDBoVzhlQ3ZvM3RvZFFORk1O?=
 =?utf-8?B?WGtoby8vMjZ0NCtFWVNXR3ZZWnhOanZlQjM1bG1JNTFQQmdBeEFPUGlRUm51?=
 =?utf-8?B?NmJtV1BkMmM4VkpwWTJZNy85aVVtOEVwUDRXR2lQb2VEdFdyN3hTcE1DVzNz?=
 =?utf-8?B?ZnczdWE1d1ZBNGRvV3BiMENqeVg0ZDVQanMzeVFIMXR3SFdtRk5rNmZoRnZT?=
 =?utf-8?B?RTgwU1pQamZjR1pqbXQ2WUpPSDgyQS9LUEZYMEpleHNrSllESGJ1QU4zV3ox?=
 =?utf-8?B?eXp5Zmt2Z1JFZWJBeGxmME5HT1RaTHJTRmw2Nzl2M2RpaFQ2aW1ZcGpSTzNK?=
 =?utf-8?B?VEZNcTZZL0ErNDNIdkRWWUJyM2VzK2dsNk5LYng3R2RFVmJWaFZ0RWs2dkRE?=
 =?utf-8?B?S3Y4Q0RHNm9aSXg0RnFpSHlHc0dDTzFvYzNqVCtKc1cwOGJ0QjRGemRyUVlU?=
 =?utf-8?B?UkI3SmRlVVBuK01IN2dTSW9FOTNtb2FUTEpTSzlyY1NIWDZBck1Jams1alJV?=
 =?utf-8?B?VmdLWjhmUXF1S2poRDZPUjVsUWtxQ1JlK3BjQVYyTU1YTFVoZmdaeTJESnZF?=
 =?utf-8?B?TXFidlE2QXNZU280dFJwUzgzYVBNb1NJeVF2Y21YaUg0Y1laMWF1V3JONGIy?=
 =?utf-8?B?WjJncTJJMUg5bGl5d3QxcU5IcWtRY1VRSE9USE9xRHgxMEF1VEJOMFVWemlH?=
 =?utf-8?B?TXVsODZOb21LYlhDOXcwSElqNHM4OEhoMjBPMkQ1T2dQc1NVYkhmNW40cGZr?=
 =?utf-8?B?U1VoMExKNGJqS1BsWDFxcHR2eUk0MmdZbzZ1K2F2V3ovc0VNbEhuQVErdDRY?=
 =?utf-8?B?Si9LbGhjcldXZUM1dmQzdmlQbHVFQ0tBSnhhbVN0VEVobjBCQXFpa0pld1Nk?=
 =?utf-8?B?RnUwanNydVhSUGNWNWdzRTlTYmZsemJwSWZUYW5RTlA5VkNyMkZXYlR1dE93?=
 =?utf-8?B?VGUvbkdUcXdObVNDa096QkptT0RmSzZVUmRFN1ZKcG1NTVBZb1Nhck9ScE82?=
 =?utf-8?B?QmZGY0huUmRaYktXUmc0VVB3SVhCQ1dUcFBaM0w3dTRzVll5RTVQYVcxT0RF?=
 =?utf-8?B?YllnM0pqakxmcHZlL2hOM1RNTTNZRlQrUThsQzl2M0o0cnVOZ05VWFlXa25Y?=
 =?utf-8?B?M2Jvbm4zMVpodHZ6YlZxYnlNNk44cTJJczZOdElSV2R6cGMrQ3hJNS9ZRE82?=
 =?utf-8?B?VGg1eVErOGp0WG1zN2tvb0xDQXo5UWxEeFUzZjQxSGJaY2dpWEVhYlhnODND?=
 =?utf-8?B?eTBCZXNQU1dZVGV0Nm5PT3RSYXdyYk5ubmFlTnRYa21FT1czUHcrTlBteGxl?=
 =?utf-8?B?dDNWUk5wQ09YRFJQYnd6OHQvVGtuK2pKcys1bWdYSDllaTIzK2g5YlFUQnBh?=
 =?utf-8?B?TlQ1V3dFMU5mbUgzaXU3M1VHSlVKOE5XcUJGM2RWRmJrK1Y0d2pKR2ZRUHdB?=
 =?utf-8?Q?0S0/F7gBjvwCh7Z0pikSw/V5PFahcaXDM9fN+KH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef6c1b5-036f-4e27-c16c-08d9192c5fa8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 12:07:42.5498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: es1X//3CbXA3oKIulJayyWKDgfb/bHM5SN/Z/g/rpvo3uiHHOORfLG4nO5+x+1OkHHQmzRuZnmbyN46XWEUyjzkvTpOOO5bpUoAd6KdHCzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4949
Received-SPF: pass client-ip=40.107.20.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

I'd like to share and discuss some plans on Qemu backup interface I have. (actually, most of this I've presented on KVM Forum long ago.. But now I'm a lot closer to realization:)


I'd start with a reminder about image fleecing:

We have image fleecing scheme to export point-in-time state of active
disk (iotest 222):


                                       backup(sync=none)
                      ┌───────────────────────────────────────┐
                      ▼                                       │
┌────────────┐     ┌────────────────┐  backing             ┌─────────────┐
│ NBD export │ ─── │ temp qcow2 img │ ───────────────────▶ │ active disk │
└────────────┘     └────────────────┘                      └─────────────┘
                                                              ▲
┌────────────┐                                               │
│ guest blk  │ ──────────────────────────────────────────────┘
└────────────┘


Actually, backup job inserts a backup-top filter, so in detail it looks
like:

                                       backup(sync=none)
                      ┌───────────────────────────────────────┐
                      ▼                                       │
┌────────────┐     ┌────────────────┐  backing             ┌─────────────┐
│ NBD export │ ─── │ temp qcow2 img │ ───────────────────▶ │ active disk │
└────────────┘     └────────────────┘                      └─────────────┘
                      ▲                                       ▲
                      │ target                                │
                      │                                       │
┌────────────┐     ┌────────────────┐  backing               │
│ guest blk  │ ──▶ │   backup-top   │ ───────────────────────┘
└────────────┘     └────────────────┘
  

This scheme is also called external backup or pull backup. It allows some external tool to write data to actual backup, and Qemu only provides this data.

We support also incremental external backup: Qemu can manage dirty bitmaps in any way user wants, and we can export bitmaps through NBD protocol. So, client of NBD export can get the bitmap, and read only "dirty" regions of exported image.

What we lack in this scheme:

1. handling dirty bitmap in backup-top filter: backup-top does copy-before-write operation on any guest write, when actually we are interested only in "dirty" regions for incremental backup

Probable solution would allowing specifying bitmap for sync=none mode of backup, but I think what I propose below is better.

2. [actually it's a tricky part of 1]: possibility to not do copy-before-write operations for regions that was already copied to final backup. With normal Qemu backup job, this is achieved by the fact that block-copy state with its internal bitmap is shared between backup job and copy-before-write filter.

3. Not a real problem but fact: backup block-job does nothing in the scheme, the whole job is done by filter. So, it would be interesting to have a possibility to simply insert/remove the filter, and avoid block-job creation and managing at all for external backup. (and I'd like to send another RFC on how to insert/remove filters, let's not discuss it here).


Next. Think about internal backup. It has one drawback too:
4. If target is remote with slow connection, copy-before-write operations will slow down guest writes appreciably.

It may be solved with help of image fleecing: we create temporary qcow2 image, setup fleecing scheme, and instead of exporting temp image through NBD we start a second backup with source = temporary image and target would be real backup target (NBD for example). Still, with such solution there are same [1,2] problems, 3 becomes worse:

5. We'll have two jobs and two automatically inserted filters, when actually one filter and one job are enough (as first job is needed only to insert a filter, second job doesn't need a filter at all).

Note also, that this (starting two backup jobs to make push backup with fleecing) doesn't work now, op-blockers will be against. It's simple to fix (and in Virtuozzo we live with downstream-only patch, which allows push backup with fleecing, based on starting two backup jobs).. But I never send a patch, as I have better plan, which will solve all listed problems.


So, what I propose:

1. We make backup-top filter public, so that it could be inserted/removed where user wants through QMP (how to properly insert/remove filter I'll post another RFC, as backup-top is not the only filter that can be usefully inserted somewhere). For this first step I've sent a series today:

   subject: [PATCH 00/21] block: publish backup-top filter
   id: <20210517064428.16223-1-vsementsov@virtuozzo.com>
   patchew: https://patchew.org/QEMU/20210517064428.16223-1-vsementsov@virtuozzo.com/

(note, that one of things in this series is rename s/backup-top/copy-before-write/, still, I call it backup-top in this letter)

This solves [3]. [4, 5] are solved partly: we still have one extra filter, created by backup block jobs, and also I didn't test does this work, probably some op-blockers or permissions should be tuned. So, let it be step 2:

2. Test, that we can start backup job with source = (target of backup-top filter), so that we have "push backup with fleecing". Make an option for backup to start without a filter, when we don't need copy-before-write operations, to not create extra superfluous filter.

3. Support bitmap in backup-top filter, to solve [1]

3.1 and make it possible to modify the bitmap externally, so that consumer of fleecing can say to backup-top filter: I've already copied these blocks, don't bother with copying them to temp image". This is to solve [2].

Still, how consumer of fleecing will reset shared bitmap after copying blocks? I have the following idea: we make a "discard-bitmap-filter" filter driver, that own some bitmap and on discard request unset corresponding bits. Also, on read, if read from the region with unset bits the EINVAL returned immediately. This way both consumers (backup job and NBD client) are able to use this interface:

Backup job can simply call discard on source, we can add an option for this.
External backup tool will send TRIM request after reading some region. This way disk space will be freed and no extra copy-before-write operations will be done. I also have a side idea that we can implement READ_ONCE flag, so that READ and TRIM can be done in one NBD command. But this works only for clients that don't want to implement any kind of retrying.



So, finally, how will it look (here I call backup-top with a new name, and "file" child is used instead of "backing", as this change I propose in "[PATCH 00/21] block: publish backup-top filter"):

Pull backup:

┌────────────────────────────────────┐
│             NBD export             │
└────────────────────────────────────┘
   │
   │
┌────────────────────────────────────┐  file   ┌───────────────────────────────────────┐  backing   ┌─────────────┐
│ discard-bitmap filter (bitmap=bm0) │ ──────▶ │            temp qcow2 img             │ ─────────▶ │ active disk │
└────────────────────────────────────┘         └───────────────────────────────────────┘            └─────────────┘
                                                  ▲                                                    ▲
                                                  │ target                                             │
                                                  │                                                    │
┌────────────────────────────────────┐         ┌───────────────────────────────────────┐  file        │
│             guest blk              │ ──────▶ │ copy-before-write filter (bitmap=bm0) │ ─────────────┘
└────────────────────────────────────┘         └───────────────────────────────────────┘



Operations:

- Create temp qcow2 image
- blockdev-add to add the new image, setup its backing, and add two filters
- some command to actually set backup-top filter as child of guest blk. That's a "point-in-time" of backup. Should be done during fs-freeze.
- start NBD export on top of discard filter (and we can export bitmap bm0 as well, for the client)

Now NBD client (our external backup tool) can:

  - import the bitmap
  - READ the data
  - send DISCARD requests on already handled areas to save disk space and avoid extra copy-before-write operations on host node


Push backup with fleecing:

┌─────────────────────┐
│ final backup target │
└─────────────────────┘
   ▲
   │ backup job (bitmap=bm0, insert-filter=False, discard-source=True)
   │
┌────────────────────────────────────┐  file   ┌───────────────────────────────────────┐  backing   ┌─────────────┐
│ discard-bitmap filter (bitmap=bm0) │ ──────▶ │            temp qcow2 img             │ ─────────▶ │ active disk │
└────────────────────────────────────┘         └───────────────────────────────────────┘            └─────────────┘
                                                  ▲                                                    ▲
                                                  │ target                                             │
                                                  │                                                    │
┌────────────────────────────────────┐         ┌───────────────────────────────────────┐  file        │
│             guest blk              │ ──────▶ │ copy-before-write filter (bitmap=bm0) │ ─────────────┘
└────────────────────────────────────┘         └───────────────────────────────────────┘


Note, that the whole fleecing part is the same, we only need to run backup job instead of NBD export.



Additional future idea. Why we need push backup with fleecing? To handle cases with slow connection to backup target. In any case when writing to remote target is slower than writing to local file, push-backup-with-fleecing will less disturb the running guest than simple backup job. But this is not free:

1. We need additional disk space on source. No way to fix that (that's a core idea of the scheme, store data locally), still discard-source option for backup job will help

2. If connection is not too slow than probably part of CBW (copy before write) operations could go to final target immediately. But with the scheme above all CBW operations go to qcow2 temporary image. This can be solved with help of ram-cache format driver (to be implemented, of course):


┌─────────────────────┐
│ final backup target │
└─────────────────────┘
   ▲
   │ backup job (bitmap=bm0, insert-filter=False, discard-source=True)
   │
┌────────────────────────────────────┐         ┌───────────────────────────────────────┐  backing   ┌─────────────┐
│ discard-bitmap filter (bitmap=bm0) │         │            temp qcow2 img             │ ─────────▶ │ active disk │
└────────────────────────────────────┘         └───────────────────────────────────────┘            └─────────────┘
                                  │               ▲                                                    ▲
                                  │               │ file                                               │
                                  │               │                                                    │
                                  │      file   ┌───────────┐                                          │
                                  └───────────▶ │ ram-cache │                                          │
                                                └───────────┘                                          │
                                                  ▲                                                    │
                                                  │ target                                             │
                                                  │                                                    │
┌────────────────────────────────────┐         ┌───────────────────────────────────────┐  file        │
│             guest blk              │ ──────▶ │ copy-before-write filter (bitmap=bm0) │ ─────────────┘
└────────────────────────────────────┘         └───────────────────────────────────────┘

This way data from copy-before-write filter goes first to ram-cache, and backup job could read it from ram. ram-cache will automatically flush data to temp qcow2 image, when ram-usage limit is reached. We'll also need a way to say backup-job that it should first read clusters that are cached in ram, and only then other clusters. So, we'll have a priory for clusters to be copied by block-copy:
1. clusters in ram-cache
2. clusters not in temp img (to avoid copy-before-write operations in future)
3. clusters in temp img.

This will be a kind of block_status() thing, that allows a block driver to give recommendations on sequence of reading to be effective. Not also, that there is another benefit of such thing: we'll implement this callback in qcow2 driver, so that backup will read clusters not in guest cluster order, but in host cluster order, to read more sequentially, which should bring better performance on rotating disks.


-- 
Best regards,
Vladimir

