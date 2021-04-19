Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC560364D70
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 00:02:40 +0200 (CEST)
Received: from localhost ([::1]:44850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYbyZ-0001kG-GS
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 18:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lYbw2-0000QV-HZ
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 18:00:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lYbw0-0003AH-2F
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 18:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618869598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rKe7I0eanwfoFoAVCbP7AGFZhP82a00oYBmoP2DdsdY=;
 b=UuKvTwXywTv0vLpeGbWUloRVfkljayjR3aIFvqabkjhXk+5nRVtBrqmsv+hev8qPIANXa4
 44SeiTNUUEREaeQ3Ja+Cs530f956rjsDG8OCy/N0nbvfJGGjvDykje9SIil+1E1rokFuyl
 TabRriy83kwgVQgTO7qcR83fhsR0Ogg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-G91EH9kJMqavWt0G9Ewirg-1; Mon, 19 Apr 2021 17:59:54 -0400
X-MC-Unique: G91EH9kJMqavWt0G9Ewirg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA2491008063;
 Mon, 19 Apr 2021 21:59:53 +0000 (UTC)
Received: from localhost (unknown [10.22.10.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E91260636;
 Mon, 19 Apr 2021 21:59:53 +0000 (UTC)
Date: Mon, 19 Apr 2021 17:59:52 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [PATCH v5] i386/cpu_dump: support AVX512 ZMM regs dump
Message-ID: <20210419215952.cganarekhjc3jy6t@habkost.net>
References: <1618538904-93433-1-git-send-email-robert.hu@linux.intel.com>
 <20210419201825.43ejc5d4xaj7ebj3@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210419201825.43ejc5d4xaj7ebj3@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 04:18:25PM -0400, Eduardo Habkost wrote:
> On Fri, Apr 16, 2021 at 10:08:24AM +0800, Robert Hoo wrote:
> > Since commit fa4518741e (target-i386: Rename struct XMMReg to ZMMReg),
> > CPUX86State.xmm_regs[] has already been extended to 512bit to support
> > AVX512.
> > Also, other qemu level supports for AVX512 registers are there for
> > years.
> > But in x86_cpu_dump_state(), still only dump XMM registers no matter
> > YMM/ZMM is enabled.
> > This patch is to complement this, let it dump XMM/YMM/ZMM accordingly.
> > 
> > Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> 
> Queued for 6.1, thanks!

Dequeuing, as it causes build failures on multiple configs:

https://gitlab.com/ehabkost/qemu/-/pipelines/288890306

Example:


../target/i386/cpu-dump.c: In function 'x86_cpu_dump_state':
../target/i386/cpu-dump.c:511:50: error: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'uint64_t' {aka 'long long unsigned int'} [-Werror=format=]
                 qemu_fprintf(f, "Opmask%02d=%016lx%s", i, env->opmask_regs[i],
                                             ~~~~~^        ~~~~~~~~~~~~~~~~~~~
                                             %016llx
../target/i386/cpu-dump.c:517:47: error: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'uint64_t' {aka 'long long unsigned int'} [-Werror=format=]
                 qemu_fprintf(f, "ZMM%02d=%016lx %016lx %016lx %016lx %016lx "
                                          ~~~~~^
                                          %016llx


-- 
Eduardo


