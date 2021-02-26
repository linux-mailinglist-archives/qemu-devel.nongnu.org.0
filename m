Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74323262C7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 13:35:13 +0100 (CET)
Received: from localhost ([::1]:54158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFcKu-0000hb-As
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 07:35:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1lFcJW-000089-1O
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 07:33:46 -0500
Received: from kerio.kamp.de ([195.62.97.192]:55227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1lFcJT-0003jJ-Tj
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 07:33:45 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 13:33:35 +0100
Received: (qmail 32438 invoked from network); 26 Feb 2021 12:33:39 -0000
Received: from ac93.vpn.kamp-intra.net (HELO ?172.20.250.93?)
 (pl@kamp.de@::ffff:172.20.250.93)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 26 Feb 2021 12:33:39 -0000
Subject: Re: block/throttle and burst bucket
To: Alberto Garcia <berto@igalia.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 qemu block <qemu-block@nongnu.org>
References: <efe8ee1c-e12f-b739-b9dd-9bd6d80527cb@kamp.de>
 <w51blc7ji0b.fsf@maestria.local.igalia.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <3b68544d-66bc-1790-26f9-6e50683119cc@kamp.de>
Date: Fri, 26 Feb 2021 13:33:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <w51blc7ji0b.fsf@maestria.local.igalia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.349,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 26.02.21 um 10:27 schrieb Alberto Garcia:
> On Thu 25 Feb 2021 06:34:48 PM CET, Peter Lieven <pl@kamp.de> wrote:
>> I was wondering if there is a way to check from outside (qmp etc.) if
>> a throttled block device has exceeded the iops_max_length seconds of
>> time bursting up to iops_max and is now hard limited to the iops limit
>> that is supplied?
>>
>> Would it be also a good idea to exetend the accounting to account for
>> requests that must have waited before being sent out to the backend
>> device?
> No, there's no such interface as far as I'm aware. I think one problem
> is that throttling is now done using a filter, that can be inserted
> anywhere in the node graph, and accounting is done at the BlockBackend
> level.
>
> We don't even have a query-block-throttle function. I actually started
> to write one six years ago but it was never finished.


A quick idea that came to my mind was to add an option to emit a QMP event if the burst_bucket is exhausted

and hard limits are enforced.


There seems to be something wrong in the throttling code anyway. Throttling causes addtional i/o latency always even if

the actual iops rate is far away from the limits and ever more far away from the burst limits. I will dig into this.


My wishlist:

 - have a possibility to query the throttling state.

 - have counters for no of delayed ops and for how long they were delayed.

 - have counters for untrottled <= 4k request performance for a backend storage device.


The later two seem not trivial as you mentioned.


Peter




