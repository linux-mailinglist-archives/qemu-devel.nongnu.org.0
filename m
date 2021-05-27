Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFBD392C14
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 12:44:04 +0200 (CEST)
Received: from localhost ([::1]:39742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmDUh-0001yv-7J
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 06:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <someguy@effective-light.com>)
 id 1lmDOf-0008MD-Uh; Thu, 27 May 2021 06:37:50 -0400
Received: from mta-05-4.privateemail.com ([68.65.122.25]:20275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <someguy@effective-light.com>)
 id 1lmDOd-0003Fo-Ks; Thu, 27 May 2021 06:37:49 -0400
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
 by MTA-05.privateemail.com (Postfix) with ESMTP id C4BC16004A;
 Thu, 27 May 2021 06:37:32 -0400 (EDT)
Received: from [192.168.0.46] (unknown [10.20.151.221])
 by MTA-05.privateemail.com (Postfix) with ESMTPA id C7F6660051;
 Thu, 27 May 2021 06:37:31 -0400 (EDT)
Date: Thu, 27 May 2021 06:37:24 -0400
From: Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH] linux-user: make process_pending_signals thread-safe
To: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <CIHRTQ.JLYE6DOVVWC1@effective-light.com>
In-Reply-To: <CAFEAcA_Z-fe1pT8=-TCFxVkpBpXpKXD+vKi1i=CBFLg4ANYE1A@mail.gmail.com>
References: <20210524024655.11115-1-someguy@effective-light.com>
 <CAFEAcA_Z-fe1pT8=-TCFxVkpBpXpKXD+vKi1i=CBFLg4ANYE1A@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Virus-Scanned: ClamAV using ClamSMTP
Received-SPF: pass client-ip=68.65.122.25;
 envelope-from=someguy@effective-light.com; helo=MTA-05-4.privateemail.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, May 27 2021 at 11:16:56 AM +0100, Peter Maydell 
<peter.maydell@linaro.org> wrote:
> If we do want to change from sigprocmask() to pthread_sigmask(), we
> should be consistent about doing that, not just change this call 
> only.)
On that note, do you think it would worthwhile to have a Coccinelle 
script replace all instances of sigprocmask with pthread_sigmask (in 
linux-user, of course)?



