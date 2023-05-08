Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4977E6FA2EB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 11:04:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvwlG-00054b-FG; Mon, 08 May 2023 05:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pvwkx-00051X-M0
 for qemu-devel@nongnu.org; Mon, 08 May 2023 05:02:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pvwks-0004HN-A2
 for qemu-devel@nongnu.org; Mon, 08 May 2023 05:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683536520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U/DLR0lAOL7nu6A4wNj2kE90cyK+KX0/XaVLod69rkE=;
 b=EMSsK5pd9zN5x2ERc496LF/r7K+qP05Fh9ochHhBng+abBUspCrZhY6FSRhv3nsBaaXTJM
 dm9oFGYnx1iWkFlYuw9dP1HAJD8KY9ggS1hV6Qd9uIwbVKeIFJlomLFMt0vnmAqxIKdVmo
 rEzFmqyBKUHsiSb+hOiRgH9Eqr+M47k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-SSuigBYjO92F3dR0QouTyQ-1; Mon, 08 May 2023 05:01:57 -0400
X-MC-Unique: SSuigBYjO92F3dR0QouTyQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B10E3C0F436;
 Mon,  8 May 2023 09:01:57 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E37D3BC88;
 Mon,  8 May 2023 09:01:56 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
Cc: qemu-devel@nongnu.org
Subject: Re: css_clear_io_interrupt() error handling
In-Reply-To: <87fs87ny6e.fsf@pond.sub.org>
Organization: Red Hat GmbH
References: <87fs87ny6e.fsf@pond.sub.org>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 08 May 2023 11:01:55 +0200
Message-ID: <873547dwn0.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, May 08 2023, Markus Armbruster <armbru@redhat.com> wrote:

> css_clear_io_interrupt() aborts on unexpected ioctl() errors, and I
> wonder whether that's appropriate.  Let's have a closer look:
>
>     static void css_clear_io_interrupt(uint16_t subchannel_id,
>                                        uint16_t subchannel_nr)
>     {
>         Error *err = NULL;
>         static bool no_clear_irq;
>         S390FLICState *fs = s390_get_flic();
>         S390FLICStateClass *fsc = s390_get_flic_class(fs);
>         int r;
>
>         if (unlikely(no_clear_irq)) {
>             return;
>         }
>         r = fsc->clear_io_irq(fs, subchannel_id, subchannel_nr);
>         switch (r) {
>         case 0:
>             break;
>         case -ENOSYS:
>             no_clear_irq = true;
>             /*
>             * Ignore unavailability, as the user can't do anything
>             * about it anyway.
>             */
>             break;
>         default:
>             error_setg_errno(&err, -r, "unexpected error condition");
>             error_propagate(&error_abort, err);
>         }
>     }
>
> The default case is abort() with a liberal amount of lipstick applied.
> Let's ignore the lipstick and focus on the abort().
>
> fsc->clear_io_irq ist either qemu_s390_clear_io_flic() order
> kvm_s390_clear_io_flic().
>
> Only kvm_s390_clear_io_flic() can return non-zero: -errno when ioctl()
> fails.
>
> The ioctl() is KVM_SET_DEVICE_ATTR for KVM_DEV_FLIC_CLEAR_IO_IRQ with
> subchannel_id and subchannel_nr.  I.e. we assume that this can only fail
> with ENOSYS, und crash hard when the assumption turns out to be wrong.
>
> Is this error condition a programming error?  I figure it can be one
> only if the ioctl()'s contract promises us it cannot fail in any other
> way unless we violate preconditions.
>
> Is the error condition fatal, i.e. continuing would be unsafe?
>
> If it's a fatal programming error, then abort() is appropriate.
>
> If it's fatal, but not a programming error, we should exit(1) instead.
>
> If it's a survivable programming error, use of abort() is a matter of
> taste.

From what I remember, this was introduced to clean up a potentially
queued interrupt that is not supposed to be delivered, so the worst
thing that could happen on failure is a spurious interrupt (same as what
could happen if the kernel flic doesn't provide this function in the
first place.) My main worry would be changes/breakages on the kernel
side (while the QEMU side remains unchanged).

So, I think we should continue to log the error in any case; but I don't
have a strong opinion as to whether we should use exit(1) (as I wouldn't
consider it a programming error) or just continue. Halil, your choice :)


