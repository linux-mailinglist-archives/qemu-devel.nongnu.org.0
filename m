Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96283F8A52
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 16:43:17 +0200 (CEST)
Received: from localhost ([::1]:34336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJGb6-0002ev-Ua
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 10:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJGZj-0001HN-5M
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 10:41:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJGZg-00044C-AO
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 10:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629988906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WU+aF/LVCUD28eTUdc1U8cJIqNvVmxz7pEKDDmP0L7I=;
 b=CQVVf1QgbhMofey3b6U21OdblQYeXHUHXFQp92bSB/yJYQEg3fBLTFce/Y5NtY7iXS0UXK
 B+86CrpvEt5rXJPngr5XWyAMYLNlNjqBYxTtQdVwQgdennAii3j3LU0KXug9OFyabGrPHH
 VSPGPNrrGSFLWWbrzHYhwD2ORLik/x0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-KXoAcDTJPwuU72JUGvTBzg-1; Thu, 26 Aug 2021 10:41:43 -0400
X-MC-Unique: KXoAcDTJPwuU72JUGvTBzg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F38BFC73AA;
 Thu, 26 Aug 2021 14:41:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B130B68D97;
 Thu, 26 Aug 2021 14:41:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4A75411380A9; Thu, 26 Aug 2021 16:41:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 6/8] arch_init.h: Move QEMU_ARCH_VIRTIO_* to
 qdev-monitor.c
References: <20210730105947.28215-1-peter.maydell@linaro.org>
 <20210730105947.28215-7-peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 16:41:40 +0200
In-Reply-To: <20210730105947.28215-7-peter.maydell@linaro.org> (Peter
 Maydell's message of "Fri, 30 Jul 2021 11:59:45 +0100")
Message-ID: <871r6gjmjf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> The QEMU_ARCH_VIRTIO_* defines are used only in one file,
> qdev-monitor.c. Move them to that file.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/sysemu/arch_init.h | 9 ---------
>  softmmu/qdev-monitor.c     | 9 +++++++++
>  2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
> index 60270c5ad15..e7789399508 100644
> --- a/include/sysemu/arch_init.h
> +++ b/include/sysemu/arch_init.h
> @@ -30,13 +30,4 @@ enum {
>  
>  extern const uint32_t arch_type;
>  
> -/* default virtio transport per architecture */
> -#define QEMU_ARCH_VIRTIO_PCI (QEMU_ARCH_ALPHA | QEMU_ARCH_ARM | \
> -                              QEMU_ARCH_HPPA | QEMU_ARCH_I386 | \
> -                              QEMU_ARCH_MIPS | QEMU_ARCH_PPC |  \
> -                              QEMU_ARCH_RISCV | QEMU_ARCH_SH4 | \
> -                              QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA)
> -#define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
> -#define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
> -
>  #endif
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 721dec2d820..a304754ab91 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -52,6 +52,15 @@ typedef struct QDevAlias
>      uint32_t arch_mask;
>  } QDevAlias;
>  
> +/* default virtio transport per architecture */
> +#define QEMU_ARCH_VIRTIO_PCI (QEMU_ARCH_ALPHA | QEMU_ARCH_ARM | \
> +                              QEMU_ARCH_HPPA | QEMU_ARCH_I386 | \
> +                              QEMU_ARCH_MIPS | QEMU_ARCH_PPC |  \
> +                              QEMU_ARCH_RISCV | QEMU_ARCH_SH4 | \
> +                              QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA)
> +#define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
> +#define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
> +
>  /* Please keep this table sorted by typename. */
>  static const QDevAlias qdev_alias_table[] = {
>      { "AC97", "ac97" }, /* -soundhw name */

qdev-monitor.c is perhaps less than ideal.  It's better than
arch_init.h, though.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


