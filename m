Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E15428D5C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 14:52:06 +0200 (CEST)
Received: from localhost ([::1]:52306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZumj-0004dA-6z
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 08:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mZukd-00037C-MQ
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:49:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mZuka-0001Po-I1
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:49:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633956590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wBY7SUst2ebkhgUBeqOA3vFzm7TrJpRjV2RpkO7AGoU=;
 b=TQ70OgvgrRC5lifctJCCoYv5TVPdyqlPfD3t77XX3AJHTOxKmh9q2O17ccxAKbgXbLtqsx
 Ay7tqKKLB/16Gd/IC42Uylxjql5fTFM34EHs6xYdjLjl4g7MNTnfisw/7yKv3MP08Ayekb
 wCjpOj66HZBZ8igRkRaC48P69kEKwWs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-FjsNUmXRN9yVDrVkKQy4Eg-1; Mon, 11 Oct 2021 08:49:49 -0400
X-MC-Unique: FjsNUmXRN9yVDrVkKQy4Eg-1
Received: by mail-ed1-f69.google.com with SMTP id
 x5-20020a50f185000000b003db0f796903so15771181edl.18
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 05:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wBY7SUst2ebkhgUBeqOA3vFzm7TrJpRjV2RpkO7AGoU=;
 b=D2QkUOVTNJWuu7IWnhKiCh1CTriQskVVQK+7VM9yxMbPrawzdNztmtof0y/xlTD5Wr
 Nl6WbgkDXFSRB6bpZunUE6C/WRqQMSwf1+cBF7mOTMXziaj1cPe9aevACUo/b7dwAPpk
 zrzpqPGHO1fiYFQHfyeFg5PpR0ovkAy4sO0aA9m/r0YOZAJ4MDHfC/fydqjZGg+B8ob1
 BNM19LpdSa3WDg3omEkL622vzTIEAcsuBwXVi10FJQcmsm4B1B+aXDOlm22tx62GrY3H
 JCmrk6yUQus+oqI42ZBNJHLcZmx6lWHTsPLXm6c3h7GuTqgbXFFoPufOkDk5WYD4dVCR
 7Htg==
X-Gm-Message-State: AOAM5302/SH4NwPTt935GNNoxvF1zA1F2FRAIXxALnElRpLHSgtO0pH1
 d9tPKUIqWUehs8d7t6OFstEjQuW9SLupTvibistNzrcHgk6B9uA6NChIp4EUFC9j5JEhwfWY+8z
 fMRaXOHzaemaA5vE=
X-Received: by 2002:a50:bf48:: with SMTP id g8mr41048590edk.10.1633956588110; 
 Mon, 11 Oct 2021 05:49:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUPFT39Q3CdPYDUfvnhNfoI5wQ+j7u7DECxgLwG5Gpn5Rn4ZecCXNrCuVwq0c5Pw4Ks2JvqA==
X-Received: by 2002:a50:bf48:: with SMTP id g8mr41048571edk.10.1633956587918; 
 Mon, 11 Oct 2021 05:49:47 -0700 (PDT)
Received: from redhat.com ([2.55.159.57])
 by smtp.gmail.com with ESMTPSA id q6sm3414054ejm.106.2021.10.11.05.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 05:49:47 -0700 (PDT)
Date: Mon, 11 Oct 2021 08:49:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 6/6] pcie: expire pending delete
Message-ID: <20211011084310-mutt-send-email-mst@kernel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211011120504.254053-7-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211011120504.254053-7-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 02:05:04PM +0200, Gerd Hoffmann wrote:
> Add an expire time for pending delete, once the time is over allow
> pressing the attention button again.
> 
> This makes pcie hotplug behave more like acpi hotplug, where one can
> try sending an 'device_del' monitor command again in case the guest
> didn't respond to the first attempt.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/qdev-core.h | 1 +
>  hw/pci/pcie.c          | 2 ++
>  softmmu/qdev-monitor.c | 4 +++-
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 4ff19c714bd8..d082a9a00aca 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -180,6 +180,7 @@ struct DeviceState {
>      char *canonical_path;
>      bool realized;
>      bool pending_deleted_event;
> +    int64_t pending_deleted_expires_ms;
>      QemuOpts *opts;
>      int hotplugged;
>      bool allow_unplug_during_migration;
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index f3ac04399969..477c8776aa27 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -549,6 +549,8 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
>      }
>  
>      dev->pending_deleted_event = true;
> +    dev->pending_deleted_expires_ms =
> +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs */
>  
>      /* In case user cancel the operation of multi-function hot-add,
>       * remove the function that is unexposed to guest individually,


Well this will be barely enough, right?

	Once the Power
	Indicator begins blinking, a 5-second abort interval exists during which a second depression of the
	Attention Button cancels the operation.

So I guess it needs to be more. Problem is of course if guest is
busy because of interrupts and whatnot, it might not get to
handling that in time ...


> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 0705f008466d..5e7960c52a0a 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -910,7 +910,9 @@ void qmp_device_del(const char *id, Error **errp)
>  {
>      DeviceState *dev = find_device_state(id, errp);
>      if (dev != NULL) {
> -        if (dev->pending_deleted_event) {
> +        if (dev->pending_deleted_event &&
> +            (dev->pending_deleted_expires_ms == 0 ||
> +             dev->pending_deleted_expires_ms > qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL))) {
>              error_setg(errp, "Device %s is already in the "
>                               "process of unplug", id);
>              return;
> -- 
> 2.31.1


