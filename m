Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC8631DBDD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 16:03:12 +0100 (CET)
Received: from localhost ([::1]:47510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCOMB-0004mO-9F
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 10:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lCOJk-0003uk-Lq
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 10:00:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lCOJg-0004SV-4r
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 10:00:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613574034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=74DLMHjhJFMtB+NcIwM3j9L1ICcifG3bNLcJgFghpmU=;
 b=eRha18S+b6HIpbSgD5fCvMIt9ywTz9p1+lX/wH24y2o8rrBxcbUgeBXOrk5fM2oZqDDNse
 CalNdFW+8EXAKyFu7iApS4Q0ZArf+4zkMvz/K97I7/F4Fr2hIQPtFQG5SbZwbeE2SWG34O
 Lf2UuEPFjxgKSGJZUxOsAXAwQ19reNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-XKoAifsVPESxtzGaUUllVw-1; Wed, 17 Feb 2021 09:59:26 -0500
X-MC-Unique: XKoAifsVPESxtzGaUUllVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9FEE192D786;
 Wed, 17 Feb 2021 14:59:24 +0000 (UTC)
Received: from starship (unknown [10.35.206.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF02460C5F;
 Wed, 17 Feb 2021 14:59:22 +0000 (UTC)
Message-ID: <d78503568990dc4ba59cf5b15dce5f95831508eb.camel@redhat.com>
Subject: Re: [PATCH] event_notifier: Set ->initialized earlier in
 event_notifier_init()
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Date: Wed, 17 Feb 2021 16:59:22 +0200
In-Reply-To: <20210216120247.1293569-1-groug@kaod.org>
References: <20210216120247.1293569-1-groug@kaod.org>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-02-16 at 13:02 +0100, Greg Kurz wrote:
> Otherwise the call to event_notifier_set() is a nop, which causes
> the SLOF firmware on POWER to hang when booting from a virtio-scsi
> device:
> 
> virtio_scsi_dataplane_start()
>  virtio_scsi_vring_init()
>   virtio_bus_set_host_notifier() <- assign == true
>    event_notifier_init() <- active == 1
>     event_notifier_set() <- fails right away if !e->initialized
> 
> Fixes: e34e47eb28c0 ("event_notifier: handle initialization failure better")
> Cc: mlevitsk@redhat.com
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  util/event_notifier-posix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
> index 5b2110e86198..8307013c5df0 100644
> --- a/util/event_notifier-posix.c
> +++ b/util/event_notifier-posix.c
> @@ -66,10 +66,10 @@ int event_notifier_init(EventNotifier *e, int active)
>          e->rfd = fds[0];
>          e->wfd = fds[1];
>      }
> +    e->initialized = true;
>      if (active) {
>          event_notifier_set(e);
>      }
> -    e->initialized = true;
>      return 0;
>  
>  fail:
Sorry about that!

Best regards,
	Maxim levitsky


