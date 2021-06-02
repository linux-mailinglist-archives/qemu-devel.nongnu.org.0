Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7EE3985E4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 12:06:38 +0200 (CEST)
Received: from localhost ([::1]:43618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loNll-0005vZ-VQ
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 06:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1loNkq-00059L-NZ
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:05:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1loNkm-0002CE-Hy
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622628335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2efLf69k5xsIyi7UIofiUdljXohDmUzYjBoDJoN6uA8=;
 b=ZORe9QOH7WUFhMa6VLIQRS5swHfAQ5YjwPqVOaJQBj9a2kMjCCJJIf9+YMl2HrPoXZZF+x
 427C6b/NI6uCcUFpxPjC7tOXUS+TCQkj20i2C9X+n3SdAPkk6er4a8OQhbTkA5UX2kLhj6
 zcRvP4HoM0Ekk8IBmBK5uj53Atg996s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-eV_PuTyqMaORxdeaLqdctg-1; Wed, 02 Jun 2021 06:05:34 -0400
X-MC-Unique: eV_PuTyqMaORxdeaLqdctg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AB02501E1;
 Wed,  2 Jun 2021 10:05:32 +0000 (UTC)
Received: from localhost (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F6C7131E3;
 Wed,  2 Jun 2021 10:05:27 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [RFC v4 07/14] target/s390x: move sysemu-only code out to
 cpu-sysemu.c
In-Reply-To: <20210524025256.22252-7-acho@suse.com>
Organization: Red Hat GmbH
References: <20210524025256.22252-1-acho@suse.com>
 <20210524025256.22252-7-acho@suse.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 02 Jun 2021 12:05:25 +0200
Message-ID: <874kegr38a.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: thuth@redhat.com, david@redhat.com, richard.henderson@linaro.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, cfontana@suse.de,
 pbonzini@redhat.com, acho@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 24 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>  target/s390x/cpu-sysemu.c | 304 ++++++++++++++++++++++++++++++++++++++
>  target/s390x/cpu.c        | 282 ++---------------------------------
>  target/s390x/meson.build  |   1 +
>  target/s390x/trace-events |   2 +-
>  4 files changed, 318 insertions(+), 271 deletions(-)
>  create mode 100644 target/s390x/cpu-sysemu.c

(...)

> +void s390_cpu_class_init_sysemu(CPUClass *cc)
> +{
> +    S390CPUClass *scc = S390_CPU_CLASS(cc);
> +
> +    scc->load_normal = s390_cpu_load_normal;
> +    cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
> +    cc->vmsd = &vmstate_s390_cpu;
> +    cc->get_crash_info = s390_cpu_get_crash_info;
> +    cc->write_elf64_note = s390_cpu_write_elf64_note;
> +}

I'm wondering whether it would be possible to handle this via a base
class and a derived sysemu class?

(...)

> -#if !defined(CONFIG_USER_ONLY)
> -/* S390CPUClass::load_normal() */
> -static void s390_cpu_load_normal(CPUState *s)

Getting rid of all that #ifdeffery is nice in any case :)


