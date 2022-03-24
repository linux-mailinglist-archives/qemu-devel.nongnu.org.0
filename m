Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D92C84E6177
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 11:06:09 +0100 (CET)
Received: from localhost ([::1]:44462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXKM2-0002xt-IC
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 06:06:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1nXKH5-0001d7-G3
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 06:00:59 -0400
Received: from exmail.andestech.com ([60.248.187.195]:29901
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1nXKGy-0003sN-5s
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 06:00:58 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 22OA0chc053247;
 Thu, 24 Mar 2022 18:00:38 +0800 (+08)
 (envelope-from dylan@andestech.com)
Received: from atcsi01 (10.0.15.167) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.498.0; Thu, 24 Mar 2022 18:00:34 +0800
Date: Thu, 24 Mar 2022 18:00:34 +0800
From: Dylan Jhong <dylan@andestech.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/char/serial: Support serial_mm_init() with wakeup
 event.
Message-ID: <YjxBQqnpAbeX/h0Y@atcsi01>
References: <20220323091637.5609-1-dylan@andestech.com>
 <CAFEAcA-iYmzGg4aqW6qPhiGhbWtp+kY06pGsPHgDiOyyn6YpUQ@mail.gmail.com>
 <YjwUXU0+0xSCjfpN@atcsi01>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YjwUXU0+0xSCjfpN@atcsi01>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Originating-IP: [10.0.15.167]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 22OA0chc053247
Received-SPF: pass client-ip=60.248.187.195; envelope-from=dylan@andestech.com;
 helo=Atcsqr.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 05:37:10PM +0800, Peter Maydell wrote:
> On Wed, 23 Mar 2022 at 09:20, Dylan Jhong <dylan@andestech.com> wrote:
> >
> > Although the "wakeup" parameter is declared in SerialState,
> > but there is no function actually setting it up.
> > Support "wakeup" as parameter in serial_mm_init().
> 
> This patch seems to provide a new argument which every
> caller passes the same value for, unless I missed one
> somewhere. What's the reason for this change?
> 
> thanks
> -- PMM

Hi PMM,

First of all, thank you for your review.
The purpose of this variable is to allow users to specify their own wakeup reason id.

At present, there are only 4 wakeup reasons provided by QEMU[*1].
Take uart as an example, which are classified as QEMU_WAKEUP_REASON_OTHER,
so there is no way to distinguish the source of the wakeup reason when designing a custom power manager device.

Indeed, as you can see, currently there is no device that supports the use of "wakeup_reason".
But it will be used on the board we are going to upstream later.

The goal of this patch is to make the "wakeup" feature support more complete.

[*1] include/sysemu/runstate.h:42
typedef enum WakeupReason {
    /* Always keep QEMU_WAKEUP_REASON_NONE = 0 */
    QEMU_WAKEUP_REASON_NONE = 0,
    QEMU_WAKEUP_REASON_RTC,
    QEMU_WAKEUP_REASON_PMTIMER,
    QEMU_WAKEUP_REASON_OTHER,
} WakeupReason;

Thanks,
Dylan

