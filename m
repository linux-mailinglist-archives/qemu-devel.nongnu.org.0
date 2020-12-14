Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02212D9FFE
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 20:13:04 +0100 (CET)
Received: from localhost ([::1]:60184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kotHK-0005Mi-DG
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 14:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kotF9-0004iW-Du
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 14:10:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kotF3-0005Fl-MX
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 14:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607973040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v8MmnAh/p+EHaCwCqFLAqNBntfBx8LxQ2mQQ56w76jY=;
 b=HOnuDSIjb/z/5OIteuE4z5iQ/nphZUACm1PjbcjPbtSPAAsCwD5393RwVHD9RvBixJlTGr
 Uc9F9G47CH3t1DQK9bEvvmh6jY0geRmkwiXL6YX5PrYNHDJqZeEsKNPscF6E+w8pB5T83k
 LvMOrSqUPcLSv6DCwwqHq1LSeFS+qDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-F0Io41y8M4WWQl2rPcHiEw-1; Mon, 14 Dec 2020 14:10:38 -0500
X-MC-Unique: F0Io41y8M4WWQl2rPcHiEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 568B8107ACE6;
 Mon, 14 Dec 2020 19:10:35 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74ABC6EF43;
 Mon, 14 Dec 2020 19:10:31 +0000 (UTC)
Date: Mon, 14 Dec 2020 14:10:29 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v12 16/23] cpu: Move synchronize_from_tb() to tcg_ops
Message-ID: <20201214191029.GO1289986@habkost.net>
References: <20201212155530.23098-1-cfontana@suse.de>
 <20201212155530.23098-17-cfontana@suse.de>
MIME-Version: 1.0
In-Reply-To: <20201212155530.23098-17-cfontana@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Dec 12, 2020 at 04:55:23PM +0100, Claudio Fontana wrote:
> From: Eduardo Habkost <ehabkost@redhat.com>
> 
> since tcg_cpu_ops.h is only included in cpu.h,
> and as a standalone header it is not really useful,
> as tcg_cpu_ops.h starts requiring cpu.h defines,
> enums, etc, as well as (later on in the series),
> additional definitions coming from memattr.h.
> 
> Therefore rename it to tcg_cpu_ops.h.inc, to warn
> any potential user that this file is not a standalone
> header, but rather a partition of cpu.h that is
> included conditionally if CONFIG_TCG is true.

What's the benefit of moving definitions to a separate file, if
the new file is not a standalone header?

If moving the definitions to a separate header is going to
require too much work, it's completely OK to keep them in cpu.h
by now, and try to move them later.

I'm worried that the scope of this series is growing too much,
and discussion/review of additional changes in each new version
is preventing us from merging the original changes where we
already had some consensus.

> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> 
> [claudio: wrapped in CONFIG_TCG, renamed .h to .inc]
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  include/hw/core/cpu.h                                | 10 +---------
>  accel/tcg/cpu-exec.c                                 |  4 ++--
>  target/arm/cpu.c                                     |  4 +++-
>  target/avr/cpu.c                                     |  2 +-
>  target/hppa/cpu.c                                    |  2 +-
>  target/i386/tcg/tcg-cpu.c                            |  2 +-
>  target/microblaze/cpu.c                              |  2 +-
>  target/mips/cpu.c                                    |  4 +++-
>  target/riscv/cpu.c                                   |  2 +-
>  target/rx/cpu.c                                      |  2 +-
>  target/sh4/cpu.c                                     |  2 +-
>  target/sparc/cpu.c                                   |  2 +-
>  target/tricore/cpu.c                                 |  2 +-
>  include/hw/core/{tcg-cpu-ops.h => tcg-cpu-ops.h.inc} | 10 ++++++++++
>  14 files changed, 28 insertions(+), 22 deletions(-)
>  rename include/hw/core/{tcg-cpu-ops.h => tcg-cpu-ops.h.inc} (55%)
[...]

-- 
Eduardo


