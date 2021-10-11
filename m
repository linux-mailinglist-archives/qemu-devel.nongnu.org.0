Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF7F429631
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 19:57:48 +0200 (CEST)
Received: from localhost ([::1]:58928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZzYY-00087W-LI
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 13:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mZzWJ-0005QF-Md
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:55:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mZzWI-0001XK-8M
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633974925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PXOJlnevGWDMoKd6h49IaIBV6Im57KrkuuWGi6JgTnY=;
 b=VSh2WCT4CJpLf022AohadlUIi+fc9XHe53kJcsEJetjEI7RaCOlNSQg1X7NkOml4gNTvno
 8IaY/kCYoV43aeFxC5eja1zCxWy1ahqcqIWva50IjcShIpTVp6P1igbGpLiTvz49fXMDuD
 rb058FLuPOpZ4YhEqYhrZjMYEBl7YFQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-zwxcx-ciNMODzw3_sbWsng-1; Mon, 11 Oct 2021 13:55:24 -0400
X-MC-Unique: zwxcx-ciNMODzw3_sbWsng-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso13872805wrc.2
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 10:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PXOJlnevGWDMoKd6h49IaIBV6Im57KrkuuWGi6JgTnY=;
 b=MNIurkm5UqfQ9omtws1SbjlSGyF5sGTZDeupgN9VMaA7BtnPYO53eqNSwx8gSZ1PkM
 g/yg78SxNxSJHK3EctIHpOdH0SpUf4M9mcMgmEvQYbYEHQ5tlvHl1YNak3gyCobx7dU8
 ayeFnELIQGYzRCEnv4vKB+yZpca7kVGHsHDuinCcK+0HYBYPKdC/fP49EupwztOG2pRs
 QLRCbWHYwJC/8L4gBZ9XT/RDJy4qx2PhTERwma1o0Qn0vC//DKeeF8CkPXMzEELx0ezv
 imfcY8BayFUpg2owppEIUENl5n/Jk0BEeiLv0PX+K6Dp9bMGh5iPLzUrmUh9L6OCoMTZ
 Ml1g==
X-Gm-Message-State: AOAM533hZbI+sEzSeDTIkCKo+fczYp3s0iiw7Kgi4tlHO9KLqTcD9geA
 YFMFLdFs/Sx3SdHLvQPOayW8sFPZloxXJreT/JdznFejE4MVdoNlJOwUZdYBoWl+FXNX9w305Zw
 LNzUPmtxx5hHONYM=
X-Received: by 2002:adf:d1ee:: with SMTP id g14mr26788282wrd.165.1633974923429; 
 Mon, 11 Oct 2021 10:55:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAG7SfkNTr0h2RaxxL3+uRS+t0P3wXCgZU5kMCKMR5x+zTSlkUHyJfD2dPRbI1x5Kbuq432w==
X-Received: by 2002:adf:d1ee:: with SMTP id g14mr26788252wrd.165.1633974923193; 
 Mon, 11 Oct 2021 10:55:23 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id l6sm222726wmg.10.2021.10.11.10.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 10:55:22 -0700 (PDT)
Date: Mon, 11 Oct 2021 18:55:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH 1/2] target/i386/sev: Use local variable for
 kvm_sev_launch_start
Message-ID: <YWR6iPrZQUiv3FWC@work-vm>
References: <20211011173026.2454294-1-dovmurik@linux.ibm.com>
 <20211011173026.2454294-2-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211011173026.2454294-2-dovmurik@linux.ibm.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
> The struct kvm_sev_launch_start has a constant and small size, and
> therefore we can use a regular local variable for it instead of
> allocating and freeing heap memory for it.
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  target/i386/sev.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 4c64c68244..0062566c71 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -647,31 +647,29 @@ sev_launch_start(SevGuestState *sev)
>      gsize sz;
>      int ret = 1;
>      int fw_error, rc;
> -    struct kvm_sev_launch_start *start;
> +    struct kvm_sev_launch_start start = {
> +        .handle = sev->handle, .policy = sev->policy
> +    };
>      guchar *session = NULL, *dh_cert = NULL;
>  
> -    start = g_new0(struct kvm_sev_launch_start, 1);
> -
> -    start->handle = sev->handle;
> -    start->policy = sev->policy;
>      if (sev->session_file) {
>          if (sev_read_file_base64(sev->session_file, &session, &sz) < 0) {
>              goto out;
>          }
> -        start->session_uaddr = (unsigned long)session;
> -        start->session_len = sz;
> +        start.session_uaddr = (unsigned long)session;
> +        start.session_len = sz;
>      }
>  
>      if (sev->dh_cert_file) {
>          if (sev_read_file_base64(sev->dh_cert_file, &dh_cert, &sz) < 0) {
>              goto out;
>          }
> -        start->dh_uaddr = (unsigned long)dh_cert;
> -        start->dh_len = sz;
> +        start.dh_uaddr = (unsigned long)dh_cert;
> +        start.dh_len = sz;
>      }
>  
> -    trace_kvm_sev_launch_start(start->policy, session, dh_cert);
> -    rc = sev_ioctl(sev->sev_fd, KVM_SEV_LAUNCH_START, start, &fw_error);
> +    trace_kvm_sev_launch_start(start.policy, session, dh_cert);
> +    rc = sev_ioctl(sev->sev_fd, KVM_SEV_LAUNCH_START, &start, &fw_error);
>      if (rc < 0) {
>          error_report("%s: LAUNCH_START ret=%d fw_error=%d '%s'",
>                  __func__, ret, fw_error, fw_error_to_str(fw_error));
> @@ -679,11 +677,10 @@ sev_launch_start(SevGuestState *sev)
>      }
>  
>      sev_set_guest_state(sev, SEV_STATE_LAUNCH_UPDATE);
> -    sev->handle = start->handle;
> +    sev->handle = start.handle;
>      ret = 0;
>  
>  out:
> -    g_free(start);
>      g_free(session);
>      g_free(dh_cert);
>      return ret;
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


