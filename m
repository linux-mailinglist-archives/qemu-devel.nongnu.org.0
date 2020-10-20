Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D7628C221
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 22:18:07 +0200 (CEST)
Received: from localhost ([::1]:59556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS4Gk-0004P2-Hi
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 16:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kS4Fj-0003yH-9x
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 16:17:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:53090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kS4Fh-0000U1-N8
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 16:17:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CCFFAC12;
 Mon, 12 Oct 2020 20:17:00 +0000 (UTC)
Subject: Re: [PATCH 0/2] Add Xen CpusAccel
To: Jason Andryuk <jandryuk@gmail.com>
References: <20201012200725.64137-1-jandryuk@gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <c2b2ed9a-879c-f676-86f0-22b3a77b770f@suse.de>
Date: Mon, 12 Oct 2020 22:16:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012200725.64137-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 01:21:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/20 10:07 PM, Jason Andryuk wrote:
> Xen was left behind when CpusAccel became mandatory and fails the assert
> in qemu_init_vcpu().  It relied on the same dummy cpu threads as qtest.
> Move the qtest cpu functions to a common location and reuse them for
> Xen.
> 
> Jason Andryuk (2):
>   accel: move qtest CpusAccel functions to a common location
>   accel: Add xen CpusAccel using dummy-cpu
> 
>  .../qtest-cpus.c => dummy/dummy-cpus.c}       | 22 +++++--------------
>  .../qtest-cpus.h => dummy/dummy-cpus.h}       | 10 ++++-----
>  accel/dummy/meson.build                       |  7 ++++++
>  accel/meson.build                             |  1 +
>  accel/qtest/meson.build                       |  1 -
>  accel/qtest/qtest.c                           |  7 +++++-
>  accel/xen/xen-all.c                           | 10 +++++++++
>  7 files changed, 34 insertions(+), 24 deletions(-)
>  rename accel/{qtest/qtest-cpus.c => dummy/dummy-cpus.c} (76%)
>  rename accel/{qtest/qtest-cpus.h => dummy/dummy-cpus.h} (59%)
>  create mode 100644 accel/dummy/meson.build
> 

Yep, forgot completely, sorry.

Acked-by: Claudio Fontana <cfontana@suse.de>



