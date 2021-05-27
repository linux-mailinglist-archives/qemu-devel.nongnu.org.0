Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44091392DE9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 14:26:08 +0200 (CEST)
Received: from localhost ([::1]:44958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmF5J-0007Pq-Kn
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 08:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <someguy@effective-light.com>)
 id 1lmEw5-0004GM-SQ; Thu, 27 May 2021 08:16:25 -0400
Received: from mta-07-4.privateemail.com ([68.65.122.27]:7667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <someguy@effective-light.com>)
 id 1lmEw2-0007Gz-DI; Thu, 27 May 2021 08:16:25 -0400
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 8AD4360052;
 Thu, 27 May 2021 08:16:18 -0400 (EDT)
Received: from [192.168.0.46] (unknown [10.20.151.229])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id A49AC6004E;
 Thu, 27 May 2021 08:16:17 -0400 (EDT)
Date: Thu, 27 May 2021 08:16:11 -0400
From: Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH] linux-user: make process_pending_signals thread-safe
To: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <Z2MRTQ.QBPUAAPP6M0X1@effective-light.com>
In-Reply-To: <CAFEAcA8koCJTd5JY4NWX26EPpHq_QMwi11-FYf4OJhZyhecT-w@mail.gmail.com>
References: <20210524024655.11115-1-someguy@effective-light.com>
 <CAFEAcA_Z-fe1pT8=-TCFxVkpBpXpKXD+vKi1i=CBFLg4ANYE1A@mail.gmail.com>
 <CIHRTQ.JLYE6DOVVWC1@effective-light.com>
 <CAFEAcA8koCJTd5JY4NWX26EPpHq_QMwi11-FYf4OJhZyhecT-w@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Virus-Scanned: ClamAV using ClamSMTP
Received-SPF: pass client-ip=68.65.122.27;
 envelope-from=someguy@effective-light.com; helo=MTA-07-4.privateemail.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, May 27 2021 at 11:45:26 AM +0100, Peter Maydell 
<peter.maydell@linaro.org> wrote:
> What issue are we trying to fix by making this change ?
I suppose that it wouldn't fix any issues in the current state of 
affairs,
maybe it is something to reconsider if glibc ever changes such that,
sigprocmask is no longer MT-safe (which is within reason since the MT
behavior of sigprocmask is undefined by POSIX).



