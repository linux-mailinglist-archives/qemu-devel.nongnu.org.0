Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166FF568B09
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 16:15:03 +0200 (CEST)
Received: from localhost ([::1]:41482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o95nx-0003xP-PO
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 10:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1o95lj-00036g-LT; Wed, 06 Jul 2022 10:12:43 -0400
Received: from mga01.intel.com ([192.55.52.88]:62060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1o95lg-0000LZ-UN; Wed, 06 Jul 2022 10:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657116760; x=1688652760;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X/Bc484KCZmC2/dF4uqZSSUSgZlE+646o4fdl1UfXdU=;
 b=jvlbDgTSuUlWnMKcKxCbaIzJnQUbBqczEGTYWyKWRm+LebAXdc2JTCII
 75/rxXQ8ZBRFrMv4hskfgW/HoPgHtKreAvz/eHMhHQ/mzEWDWqYR1Z3kO
 kp5kWUyBkApHWU8YKTq3gTwHzV0gkrpeOtSKEQqZopjQqhlhRhURVSGDI
 zhfgYuromQPkZLA3Bt5zxfL3Vpj9FflP4NW6ICNnhaz5XuHEwhYucLLHs
 owK2DDULURZGSk+jq3EYLVoXOr/zRolVDl6BQkiWZJdkkNk+nXCwMf4Bj
 hlfVwpXn46BOPtclVrNRSHWO6AQlQPjNh7PbPUjeWvKz6HgVhS2myyA33 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="309306744"
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="309306744"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 07:12:33 -0700
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="920182655"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.23])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 07:12:31 -0700
Date: Wed, 6 Jul 2022 22:12:14 +0800
From: Chao Gao <chao.gao@intel.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: fam@euphon.net, pbonzini@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [RFC v1] util/aio: Keep notification disabled as much as possible
Message-ID: <20220706141208.GA9972@gao-cwp>
References: <20220701091348.215320-1-chao.gao@intel.com>
 <YsV5IYtyaqKoqRZ5@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsV5IYtyaqKoqRZ5@stefanha-x1.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chao.gao@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jul 06, 2022 at 12:59:29PM +0100, Stefan Hajnoczi wrote:
>On Fri, Jul 01, 2022 at 05:13:48PM +0800, Chao Gao wrote:
>> When measuring FIO read performance (cache=writethrough, bs=4k, iodepth=64) in
>> VMs, we observe ~80K/s notifications (e.g., EPT_MISCONFIG) from guest to qemu.
>
>It's not clear to me what caused the frequent poll_set_started(ctx,
>false) calls and whether this patch is correct. I have posted some

Me either. That's why the patch was marked RFC.

>questions below about the nature of this issue.
>
>If ctx->fdmon_ops->wait() is called while polling is still enabled then
>hangs or unnecessary latency can occur. For example, consider an fd
>handler that temporarily suppresses fd activity between poll start/end.
>The thread would be blocked in ->wait() and the fd will never become
>readable. Even if a hang doesn't occur because there is a timeout, there
>would be extra latency because the fd doesn't become readable and we
>have to wait for the timeout to expire so we can poll again. So we must
>be sure it's safe to leave polling enabled across the event loop and I'm
>not sure if this patch is okay.

Thanks for the explanation.

in aio_poll(),

    if (timeout || ctx->fdmon_ops->need_wait(ctx)) {
        ctx->fdmon_ops->wait(ctx, &ready_list, timeout);
    }

if @timeout is zero, then ctx->fdmon_ops->wait() won't be called.

In case #2 and #3 below, it is guaranteed that @timeout is zero after
try_poll_mode() return. So, I think it is safe to keep polling enabled
for these two cases.

>
>> 
>> Currently, poll_set_started(ctx,false) is called in try_poll_mode() to enable
>> virtqueue notification in below 4 cases:
>> 
>> 1. ctx->poll_ns is 0
>> 2. a zero timeout is passed to try_poll_mode()
>> 3. polling succeeded but reported as no progress
>> 4. polling failed and reported as no progress
>> 
>> To minimize unnecessary guest notifications, keep notification disabled when
>> it is possible, i.e., polling is enabled and last polling doesn't fail.
>
>What is the exact definition of polling success/failure?

Polling success: found some events pending.
Polling failure: timeout.

success/failure are used because I saw below comment in
run_poll_handlers_once(), then I thought they are well-known terms.

            /*
             * Polling was successful, exit try_poll_mode immediately
             * to adjust the next polling time.
             */

>
>> 
>> Keep notification disabled for case #2 and #3; handle case #2 simply by a call
>
>Did you see case #2 happening often? What was the cause?

I think so. I can add some tracepoint and collect statistics.

IMO (of course, I can be totally wrong), the cause is:
when a worker thread in thread poll completes an IO request, a bottom
half is queued by work_thread()->qemu_bh_schedule(). Pending bottom
halves lead to aio_compute_timeout() setting timeout to zero and then
a zero timeout is passed to try_poll_mode().

>
>> of run_poll_handlers_once() and for case #3, differentiate successful/failed
>> polling and skip the call of poll_set_started(ctx,false) for successful ones.
>
>This is probably the most interesting case. When polling detects an
>event, that's considered "progress", except for aio_notify() events.
>aio_notify() is an internal event for restarting the event loop when
>something has changed (e.g. fd handlers have been added/removed). I
>wouldn't expect it to intefere polling frequently since that requires
>another QEMU thread doing something to the AioContext, which should be
>rare.
>
>Was aio_notify() intefering with polling in your case? Do you know why?

Yes. It was. The reason is the same: after finishing IO requests, worker
threads queue bottom halves during which aio_notify() is called.

