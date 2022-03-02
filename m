Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31B14CA5E2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:24:52 +0100 (CET)
Received: from localhost ([::1]:56430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOyJ-0006Ws-Or
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:24:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPNM4-0006Jz-3Q
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:41:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPNM2-00052c-HN
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:41:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646221274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5NNmOxlce7sZu9RBTS8wyevkqdYW1ggr4Vge9jgdwVA=;
 b=FfUPArlNAzE+RWyxsFNteUJlHaIAE0gaX17+6xcPyZBfslTKvjgLDPTrSBadYmW44YIpgb
 hHgNVGBE0/FxyPOH+Kh0my+7GvDCpYmVCB1Yg+G/IKjfCaTnpaRmTG8W6hHv20jxyNdYh5
 IMaozAAfIX3ug5FhXaoXyulcIAyrieo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-MA6uGinnOYSF7bnjsV7lXw-1; Wed, 02 Mar 2022 06:41:13 -0500
X-MC-Unique: MA6uGinnOYSF7bnjsV7lXw-1
Received: by mail-wm1-f72.google.com with SMTP id
 3-20020a05600c230300b00384e15ceae4so373513wmo.7
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 03:41:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5NNmOxlce7sZu9RBTS8wyevkqdYW1ggr4Vge9jgdwVA=;
 b=Sjc4XlszQ7JJiZclLa7GOr3aIetPKj1RX+oc/foCA4HfUngY686rZosxsHZtBDXs1t
 EqTl/hWv0DZZEjNGqsW+9NprFDxi2hQ+hbYng8BY8rk2rTmRmWGfrJ7J5QvPVblxPSlD
 dYTzGPbqRdvkjg/pmEdW6eL0qUumt54/e7gE9gFe44iJS7ToRZKOvkZX8ClrlDdqsdZC
 fen5mH8Bjo97QF29M/6uIYEXgcVWyEirRKK5CJrq7bsCjaRFCyWVEja5y/qf0RDLApaQ
 +ZGLf2UxwIADyoSJXmmJ3PMZAJtxI4thhYalHplCVgl22cnVUBCLAA6pe5EEE3No8TGU
 4wRw==
X-Gm-Message-State: AOAM532aCvcUXKpUIKj5OCrHOX9p+YCmjb12GFYNWbQMPyfHQ3AmFYfw
 QF7IrS1cMnvy2/M3G6YWhJJdKic/eg/dAK60iSmw3MTWTHap1ZFfx6s68922LXFGV9zpI30WbRM
 PMJMKgoKqyQJ9xt8=
X-Received: by 2002:a05:600c:4e13:b0:381:c7ac:3ec1 with SMTP id
 b19-20020a05600c4e1300b00381c7ac3ec1mr5422812wmq.122.1646221268366; 
 Wed, 02 Mar 2022 03:41:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnDxuQZd4LFJBtywynZsEU7I8guj3KwOSykCj5lObgWAu0x2QUxFqqpPdznrl26uowf24qkw==
X-Received: by 2002:a05:600c:4e13:b0:381:c7ac:3ec1 with SMTP id
 b19-20020a05600c4e1300b00381c7ac3ec1mr5422791wmq.122.1646221268144; 
 Wed, 02 Mar 2022 03:41:08 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c351100b00381807bd920sm6389928wmq.28.2022.03.02.03.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 03:41:07 -0800 (PST)
Date: Wed, 2 Mar 2022 11:41:05 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jack Wang <jinpu.wang@ionos.com>
Subject: Re: [PATCH v2] migration/rdma: set the REUSEADDR option for
 destination
Message-ID: <Yh9X0dYbI9OoUupM@work-vm>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Queued

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
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


