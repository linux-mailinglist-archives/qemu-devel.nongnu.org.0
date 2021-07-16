Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629A33CB4C7
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 10:55:35 +0200 (CEST)
Received: from localhost ([::1]:60184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Jd8-0008P2-FP
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 04:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m4Jbw-0006wr-Mp
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:54:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m4Jbu-0005Ed-H9
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:54:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626425656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=49+MvtLeifsws6r5PnY0dDhfttudSDi5W4PYWVeIb0o=;
 b=Dj+JxqjZF0fMueovdznQXH+VD0ifgKXrHRr89RV/rYHsN5By03Ac+RRQBQM4q5RxHp6i8i
 e6AE2W6AQyN5syt1HPO0TmOgNs1hdmf3y+9jccS+Ew0Oww9z3ZgX/9YTqU44T2azkJAhDE
 M6F5Xq/cdcyDYE4CU5kV0WC8c6mG9u4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-7ZdmYBlpOKWpJB4gKcpeww-1; Fri, 16 Jul 2021 04:54:15 -0400
X-MC-Unique: 7ZdmYBlpOKWpJB4gKcpeww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C88F804143;
 Fri, 16 Jul 2021 08:54:14 +0000 (UTC)
Received: from localhost (ovpn-112-169.ams2.redhat.com [10.36.112.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A40F5D9C6;
 Fri, 16 Jul 2021 08:54:10 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Subject: Re: [PATCH v1 1/9] s390x: smp: s390x dedicated smp parsing
In-Reply-To: <1626281596-31061-2-git-send-email-pmorel@linux.ibm.com>
Organization: Red Hat GmbH
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-2-git-send-email-pmorel@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 16 Jul 2021 10:54:08 +0200
Message-ID: <871r7yd4gf.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14 2021, Pierre Morel <pmorel@linux.ibm.com> wrote:

> We need a s390x dedicated SMP parsing to handle s390x specificities.
>
> In this patch we only handle threads, cores and sockets for
> s390x:
> - do not support threads, we always have 1 single thread per core
> - the sockets are filled one after the other with the cores
>
> Both these handlings are different from the standard smp_parse
> functionement and reflect the CPU topology in the simple case
> where all CPU belong to the same book.
>
> Topology levels above sockets, i.e. books, drawers, are not
> considered at this stage and will be introduced in a later patch.
>
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  hw/s390x/s390-virtio-ccw.c | 42 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index e4b18aef49..899d3a4137 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -582,6 +582,47 @@ static ram_addr_t s390_fixup_ram_size(ram_addr_t sz)
>      return newsz;
>  }
>  
> +/*
> + * In S390CCW machine we do not support threads for now,
> + * only sockets and cores.
> + */
> +static void s390_smp_parse(MachineState *ms, QemuOpts *opts)

It seems you based this on an older version of the code? The current
signature of this function since 1e63fe685804 ("machine: pass QAPI
struct to mc->smp_parse") is

void (*smp_parse)(MachineState *ms, SMPConfiguration *config, Error **errp);

That affects your parsing, and also lets you get rid of the ugly exit(1)
statements.

> +{
> +    unsigned cpus    = qemu_opt_get_number(opts, "cpus", 1);
> +    unsigned sockets = qemu_opt_get_number(opts, "sockets", 1);
> +    unsigned cores   = qemu_opt_get_number(opts, "cores", 1);
> +
> +    if (opts) {
> +        if (cpus == 0 || sockets == 0 || cores == 0) {

This behaviour looks different from what we do for other targets: if you
specify the value as 0, a value is calculated from the other values;
here, you error out. It's probably not a good idea to differ.

> +            error_report("cpu topology: "
> +                         "sockets (%u), cores (%u) or number of CPU(%u) "
> +                         "can not be zero", sockets, cores, cpus);
> +            exit(1);
> +        }
> +    }
> +


