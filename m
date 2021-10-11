Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F14429690
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 20:12:03 +0200 (CEST)
Received: from localhost ([::1]:57064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZzmN-00010Z-05
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 14:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mZzYq-0002TE-RX
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:58:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mZzYp-0004Fh-9I
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633975082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g7QzTfoU1QAxpAq8IQJ10ibFQTWERt9RsM+3c0a6M0M=;
 b=RJ9rB2w28ua0YboPXgq1qJu+mQ6rYqBmoav3d9P/pk0YjiL7DQTgfSxigZ0ysQ5+cs9MHh
 skNgFBpl4cJPsJwGlvQ/qYzvPXuagOfasexnp0eatAglqRPkrAQ/1O5u3LVtkHJnQ4NxT9
 JpuyWnIwnzohwxjJVfy49BRK4xmxV5A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-Pwn-2oyGO9GB_-pth3hTMQ-1; Mon, 11 Oct 2021 13:58:01 -0400
X-MC-Unique: Pwn-2oyGO9GB_-pth3hTMQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 j19-20020adfb313000000b00160a9de13b3so13870648wrd.8
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 10:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g7QzTfoU1QAxpAq8IQJ10ibFQTWERt9RsM+3c0a6M0M=;
 b=E93juHMytg87u6AbKAV02bQVeymXVlq457+pkFgnyt/EQPTrAsLCTDPVM1N9tcxPov
 5fHGM0zpshWu/KlVjJ/XqMv9NL5t1++1WV/kMYn6YPT/+MWHvy7OOVVIALoUF/ISaG7z
 EdOeBvKTyvKowh5TkckVQAjgbCzuEOuUSkv6Y+r4SHc03FtE4//3PPwXzQkbIryF95mu
 +JWdNluqhI9KZzF6R9ExiBzU/Eu2dv+ZN+5YIA9fghdVevYihqYQTtEpqZGbVWb26EZm
 8o3gu8gcAstDkn8WMgA3DtCvp7fDfF9Tak9A6SDSy21Ba5xkMYlPlqmodce4Ajj820+K
 mY7Q==
X-Gm-Message-State: AOAM5337C5Tq5qAoVMtL7e4YKbEEhszuxEgmlUdSYFPFq6TD36fGffVG
 Cld7WSvDoJqx7adc0JT3nOTNzBWf9qjvizWLZFMFhwBNu9xtylfcN3eZ/YNYnb9JkBxi5uTbnqJ
 rxifYA1+snNqAd7k=
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr483766wmd.96.1633975080232; 
 Mon, 11 Oct 2021 10:58:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBCXcnWfGdQihLTers6t02/hnnCbE5TODilGFb5Yx6LPyrjapLBoJDMw+i6C6Vi9cGeoaYeQ==
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr483739wmd.96.1633975080049; 
 Mon, 11 Oct 2021 10:58:00 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id e15sm1110091wrv.74.2021.10.11.10.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 10:57:59 -0700 (PDT)
Date: Mon, 11 Oct 2021 18:57:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH 2/2] target/i386/sev: Use local variable for
 kvm_sev_launch_measure
Message-ID: <YWR7JT6XcqEL6R4B@work-vm>
References: <20211011173026.2454294-1-dovmurik@linux.ibm.com>
 <20211011173026.2454294-3-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211011173026.2454294-3-dovmurik@linux.ibm.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dov Murik (dovmurik@linux.ibm.com) wrote:
> The struct kvm_sev_launch_measure has a constant and small size, and
> therefore we can use a regular local variable for it instead of
> allocating and freeing heap memory for it.
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  target/i386/sev.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 0062566c71..eede07f11d 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -729,7 +729,7 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
>      SevGuestState *sev = sev_guest;
>      int ret, error;
>      g_autofree guchar *data = NULL;
> -    g_autofree struct kvm_sev_launch_measure *measurement = NULL;
> +    struct kvm_sev_launch_measure measurement = {};
>  
>      if (!sev_check_state(sev, SEV_STATE_LAUNCH_UPDATE)) {
>          return;
> @@ -743,23 +743,21 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
>          }
>      }
>  
> -    measurement = g_new0(struct kvm_sev_launch_measure, 1);
> -
>      /* query the measurement blob length */
>      ret = sev_ioctl(sev->sev_fd, KVM_SEV_LAUNCH_MEASURE,
> -                    measurement, &error);
> -    if (!measurement->len) {
> +                    &measurement, &error);
> +    if (!measurement.len) {
>          error_report("%s: LAUNCH_MEASURE ret=%d fw_error=%d '%s'",
>                       __func__, ret, error, fw_error_to_str(errno));
>          return;
>      }
>  
> -    data = g_new0(guchar, measurement->len);
> -    measurement->uaddr = (unsigned long)data;
> +    data = g_new0(guchar, measurement.len);
> +    measurement.uaddr = (unsigned long)data;
>  
>      /* get the measurement blob */
>      ret = sev_ioctl(sev->sev_fd, KVM_SEV_LAUNCH_MEASURE,
> -                    measurement, &error);
> +                    &measurement, &error);
>      if (ret) {
>          error_report("%s: LAUNCH_MEASURE ret=%d fw_error=%d '%s'",
>                       __func__, ret, error, fw_error_to_str(errno));
> @@ -769,7 +767,7 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
>      sev_set_guest_state(sev, SEV_STATE_LAUNCH_SECRET);
>  
>      /* encode the measurement value and emit the event */
> -    sev->measurement = g_base64_encode(data, measurement->len);
> +    sev->measurement = g_base64_encode(data, measurement.len);
>      trace_kvm_sev_launch_measurement(sev->measurement);
>  }
>  
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


