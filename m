Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937BF4AD60D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:18:12 +0100 (CET)
Received: from localhost ([::1]:46136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOVf-000342-N0
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:18:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHOCS-0002pG-Fg
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:58:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHOCQ-0003LJ-9g
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:58:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644317897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dteOYlXbqqHWDCqvd+MH3Tp9mMUWrFsfsJBRJquTAS8=;
 b=gEXw7lfLyiFWmbvMw8+03PHSj4rUorOZI8jVXd2BGMkgzJGULihTevAgbTJthiBHrtv0vU
 Xp4mMq7O5kqoUxdbnws8gYrqwuZEEuPD662L2qXj0+6hkScvKeXx6i6JQhqCYxsQR6GhOH
 z/TrfYrllJCDpeKzg64qss2X7of4lZI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-oTiKG2kcNI6BpFvulUESFg-1; Tue, 08 Feb 2022 05:58:16 -0500
X-MC-Unique: oTiKG2kcNI6BpFvulUESFg-1
Received: by mail-wr1-f70.google.com with SMTP id
 c9-20020adfa709000000b001dde29c3202so5919160wrd.22
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 02:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dteOYlXbqqHWDCqvd+MH3Tp9mMUWrFsfsJBRJquTAS8=;
 b=jr4qpFwdu+4RIksFr5yo+3xuUd6SXHnaKKKRepT8mqxGLjD8EFCVwQ+M0ECAAJxBxl
 qhPQ2GcthB1x+ZJTne5Ub3FUNT6fbff3UuSXc1gwIBQUybjJwCaRZX0yoGxIvb3LT5rL
 8kkrgd8hP9fuRoKUSTwY0q/5rZ84NIkaosYZjdWUFntTxr3k4BJ5RtU51eqRC7AXjTxS
 E9Jh9J26qZ6Z5pW6WnySItOHmE3IV8SFeGt4AxgcjSGBWkdjZFxkT9z8r7pqkWhIG9MM
 hgBfdF8EHX8E/wK9AIfSL6/hojhI1LseFGrc7/FeyxJA6YVAFFFVssHwEvY+E8Y7PqO0
 RWEg==
X-Gm-Message-State: AOAM530Dysr0PMJbXxHn+Ah9H+dQuWQu7Vw9cLBPuz9kwKAQLUj3d66H
 AgUMsPhUSsr3WQ7sFo3mKciQAg+cVxx0eIQL4qFfCArT91N/iMUvFadfFLS2emo6PzysmzrBivE
 iay2biIyJGxFpx7Y=
X-Received: by 2002:a5d:6a85:: with SMTP id s5mr3124954wru.510.1644317895453; 
 Tue, 08 Feb 2022 02:58:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbdychG7ua+m8N5qbyG6hmGiw/aNdcQP64in9DaOf2Pr9//12CQzOfI+GFWSxJmr/rb4jj5g==
X-Received: by 2002:a5d:6a85:: with SMTP id s5mr3124935wru.510.1644317895262; 
 Tue, 08 Feb 2022 02:58:15 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id ay38sm1994968wmb.3.2022.02.08.02.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 02:58:14 -0800 (PST)
Date: Tue, 8 Feb 2022 10:58:13 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jack Wang <jinpu.wang@ionos.com>
Subject: Re: [PATCH v2] migration/rdma: set the REUSEADDR option for
 destination
Message-ID: <YgJMxVMcGjrcKmuA@work-vm>
References: <20220208085640.19702-1-jinpu.wang@ionos.com>
MIME-Version: 1.0
In-Reply-To: <20220208085640.19702-1-jinpu.wang@ionos.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, pankaj.gupta@ionos.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jack Wang (jinpu.wang@ionos.com) wrote:
> We hit following error during testing RDMA transport:
> in case of migration error, mgmt daemon pick one migration port,
> incoming rdma:[::]:8089: RDMA ERROR: Error: could not rdma_bind_addr
> 
> Then try another -incoming rdma:[::]:8103, sometime it worked,
> sometimes need another try with other ports number.
> 
> Set the REUSEADDR option for destination, This allow address could
> be reused to avoid rdma_bind_addr error out.
> 
> Signed-off-by: Jack Wang <jinpu.wang@ionos.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> v2: extend commit message as discussed with Pankaj and David
> ---
>  migration/rdma.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index c7c7a384875b..663e1fbb096d 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -2705,6 +2705,7 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
>      char ip[40] = "unknown";
>      struct rdma_addrinfo *res, *e;
>      char port_str[16];
> +    int reuse = 1;
>  
>      for (idx = 0; idx < RDMA_WRID_MAX; idx++) {
>          rdma->wr_data[idx].control_len = 0;
> @@ -2740,6 +2741,12 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
>          goto err_dest_init_bind_addr;
>      }
>  
> +    ret = rdma_set_option(listen_id, RDMA_OPTION_ID, RDMA_OPTION_ID_REUSEADDR,
> +			  &reuse, sizeof reuse);
> +    if (ret) {
> +        ERROR(errp, "Error: could not set REUSEADDR option");
> +        goto err_dest_init_bind_addr;
> +    }
>      for (e = res; e != NULL; e = e->ai_next) {
>          inet_ntop(e->ai_family,
>              &((struct sockaddr_in *) e->ai_dst_addr)->sin_addr, ip, sizeof ip);
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


