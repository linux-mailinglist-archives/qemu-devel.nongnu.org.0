Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8363985A2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:50:06 +0200 (CEST)
Received: from localhost ([::1]:57478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loNVl-0003ux-E2
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1loNUi-0003DG-4Q
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:49:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1loNUb-0007Q0-Kd
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622627332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PuEPxnDJEojT60HQVJ2xxPP17xqDfWEBwXQeuPUk/v0=;
 b=aFY5oC3xZyTQHjW31MPFLH2CcxYSJHi0H0ZRU3TRmX7KoqiZtrMU7qtGd0nO9PPbpvK+Ku
 w0vKvNPrZ2MsYHygkMes2g4RKzQEBy4ftCMACuPU/Ijkg817ZFPaSsQB26pC/MEbP7TTnj
 jOZeF1tZUmk/iEKWTT/qcrwp5lHzrkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-lqu581eTNBG0nsRXr-PfoA-1; Wed, 02 Jun 2021 05:48:49 -0400
X-MC-Unique: lqu581eTNBG0nsRXr-PfoA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50926180FD6D;
 Wed,  2 Jun 2021 09:48:48 +0000 (UTC)
Received: from localhost (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FA6A1B49E;
 Wed,  2 Jun 2021 09:48:44 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [RFC v4 06/14] target/s390x: start moving TCG-only code to tcg/
In-Reply-To: <20210524025256.22252-6-acho@suse.com>
Organization: Red Hat GmbH
References: <20210524025256.22252-1-acho@suse.com>
 <20210524025256.22252-6-acho@suse.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 02 Jun 2021 11:48:43 +0200
Message-ID: <877djcr404.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, richard.henderson@linaro.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, cfontana@suse.de,
 pbonzini@redhat.com, acho@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 24 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:

> move everything related to translate, as well as HELPER code in tcg/
>
> mmu_helper.c stays put for now, as it contains both TCG and KVM code.
>
> The internal.h file is renamed to s390x-internal.h, because of the
> risk of collision with other files with the same name.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>  hw/s390x/tod-tcg.c                            |  2 +-
>  include/hw/s390x/tod.h                        |  2 +-
>  target/s390x/arch_dump.c                      |  2 +-
>  target/s390x/cpu.c                            |  2 +-
>  target/s390x/cpu_models.c                     |  2 +-
>  target/s390x/diag.c                           |  2 +-
>  target/s390x/gdbstub.c                        |  2 +-
>  target/s390x/helper.c                         |  2 +-
>  target/s390x/interrupt.c                      |  4 ++--
>  target/s390x/ioinst.c                         |  2 +-
>  target/s390x/kvm.c                            |  2 +-
>  target/s390x/machine.c                        |  4 ++--
>  target/s390x/meson.build                      | 17 ++---------------
>  target/s390x/mmu_helper.c                     |  2 +-
>  target/s390x/{internal.h => s390x-internal.h} |  6 ++++++
>  target/s390x/sigp.c                           |  2 +-
>  target/s390x/{ => tcg}/cc_helper.c            |  2 +-
>  target/s390x/{ => tcg}/crypto_helper.c        |  2 +-
>  target/s390x/{ => tcg}/excp_helper.c          |  2 +-
>  target/s390x/{ => tcg}/fpu_helper.c           |  2 +-
>  target/s390x/{ => tcg}/insn-data.def          |  0
>  target/s390x/{ => tcg}/insn-format.def        |  0
>  target/s390x/{ => tcg}/int_helper.c           |  2 +-
>  target/s390x/{ => tcg}/mem_helper.c           |  2 +-
>  target/s390x/tcg/meson.build                  | 14 ++++++++++++++
>  target/s390x/{ => tcg}/misc_helper.c          |  2 +-
>  target/s390x/{ => tcg}/s390-tod.h             |  0
>  target/s390x/{ => tcg}/tcg_s390x.h            |  0
>  target/s390x/{ => tcg}/translate.c            |  2 +-
>  target/s390x/{ => tcg}/translate_vx.c.inc     |  0
>  target/s390x/{ => tcg}/vec.h                  |  0
>  target/s390x/{ => tcg}/vec_fpu_helper.c       |  2 +-
>  target/s390x/{ => tcg}/vec_helper.c           |  2 +-
>  target/s390x/{ => tcg}/vec_int_helper.c       |  0
>  target/s390x/{ => tcg}/vec_string_helper.c    |  2 +-
>  35 files changed, 49 insertions(+), 42 deletions(-)
>  rename target/s390x/{internal.h => s390x-internal.h} (98%)
>  rename target/s390x/{ => tcg}/cc_helper.c (99%)
>  rename target/s390x/{ => tcg}/crypto_helper.c (98%)
>  rename target/s390x/{ => tcg}/excp_helper.c (99%)
>  rename target/s390x/{ => tcg}/fpu_helper.c (99%)
>  rename target/s390x/{ => tcg}/insn-data.def (100%)
>  rename target/s390x/{ => tcg}/insn-format.def (100%)
>  rename target/s390x/{ => tcg}/int_helper.c (99%)
>  rename target/s390x/{ => tcg}/mem_helper.c (99%)
>  create mode 100644 target/s390x/tcg/meson.build
>  rename target/s390x/{ => tcg}/misc_helper.c (99%)
>  rename target/s390x/{ => tcg}/s390-tod.h (100%)
>  rename target/s390x/{ => tcg}/tcg_s390x.h (100%)
>  rename target/s390x/{ => tcg}/translate.c (99%)
>  rename target/s390x/{ => tcg}/translate_vx.c.inc (100%)
>  rename target/s390x/{ => tcg}/vec.h (100%)
>  rename target/s390x/{ => tcg}/vec_fpu_helper.c (99%)
>  rename target/s390x/{ => tcg}/vec_helper.c (99%)
>  rename target/s390x/{ => tcg}/vec_int_helper.c (100%)
>  rename target/s390x/{ => tcg}/vec_string_helper.c (99%)

Acked-by: Cornelia Huck <cohuck@redhat.com>


