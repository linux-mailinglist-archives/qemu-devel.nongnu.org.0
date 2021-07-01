Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C093B8FD0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 11:32:49 +0200 (CEST)
Received: from localhost ([::1]:45142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyt3w-0006yp-5n
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 05:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyt2u-0006Hm-KD
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 05:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyt2s-0002Kl-16
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 05:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625131900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f+MY9B/CqY8+QtcrZ+2joh8dN/mAJnrq517I8NAj6IU=;
 b=EpeRpTNP0WXnsc/sLkOF7Wj0vqPD50df0NS4+un+KW2AbGOtehPXeodzs9nAQ+cKi/tvk/
 UkRB4U3kcdKy2trU9/XX5AB75pE+ffkCLrxEGJhyF8wBakwFZPCyXNxCOE32owpCUzfWCz
 jVlfxuT0NkeUZToL5h7arDVDgI487ls=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-hDDNMtlfOvKUeMUBe3NyHA-1; Thu, 01 Jul 2021 05:31:39 -0400
X-MC-Unique: hDDNMtlfOvKUeMUBe3NyHA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j18-20020a05600c1c12b02901dce930b374so1904558wms.2
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 02:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f+MY9B/CqY8+QtcrZ+2joh8dN/mAJnrq517I8NAj6IU=;
 b=ObldQPlNEmudrvzU2T1RXRdoatkmkM0BtzbUfGOpr+u3/yfGssuvFPjhn7uTC54VwU
 V2bbCsq5B5Q18WnfHoyh1H114NmDiuUSL/v8xk2PYtXwbYHeU7FhWUKhEr5veFvOSjhN
 8dmN5bg/P7GWUvgBLtm/6pvWliMBgP9oO5Y3agb5JrVTM21onGOGzG73kvVV96snPLDo
 n7CoHUtv2wjnwT6ddqNytELllh6g0vv/vVhNNyuyAju4ZFZVz4ZSyQDWPZDO+oQ/6HnG
 zpW7p7HcLdMg16/axLO4jerl6KXXYohJAI11kp3+q/bkF/t5kG9k0JtwJtcZ+8jJrohX
 wdhQ==
X-Gm-Message-State: AOAM532CCKb7TrHhFmkWwp80XjKXXSbAVz4EFmbdrGMy1SVHVmLEu/Op
 edRFk0Ri4X+QKeGLHmTCQtMUO+jiioxs04nwPyf4cxe+CSDu1fslKyxRo3n97NoMvpzxLLT0C4r
 brR60GG7sHM/QD/s=
X-Received: by 2002:a5d:64e5:: with SMTP id g5mr33266593wri.111.1625131898082; 
 Thu, 01 Jul 2021 02:31:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz06WsQR06tQwFp1DdF9/AJGmdV7jGH9T/+a7VbbfSiUj7aJB6mjtbL7TzFU1K6VEjO2a77lA==
X-Received: by 2002:a5d:64e5:: with SMTP id g5mr33266574wri.111.1625131897883; 
 Thu, 01 Jul 2021 02:31:37 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id a186sm2457877wme.25.2021.07.01.02.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 02:31:37 -0700 (PDT)
Date: Thu, 1 Jul 2021 10:31:35 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH] migration/rdma: Use error_report to suppress errno message
Message-ID: <YN2Ld+HvZJCd51h1@work-vm>
References: <20210628071959.23455-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210628071959.23455-1-lizhijian@cn.fujitsu.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Li Zhijian (lizhijian@cn.fujitsu.com) wrote:
> Since the prior calls are successful, in this case a errno doesn't
> indicate a real error which would just make us confused.
> 
> before:
> (qemu) migrate -d rdma:192.168.22.23:8888
> source_resolve_host RDMA Device opened: kernel name rxe_eth0 uverbs device name uverbs2, infiniband_verbs class device path /sys/class/infiniband_verbs/uverbs2, infiniband class device path /sys/class/infiniband/rxe_eth0, transport: (2) Ethernet
> rdma_get_cm_event != EVENT_ESTABLISHED after rdma_connect: No space left on device
> 
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

and queued

> ---
>  migration/rdma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index d90b29a4b51..b6cc4bef4a8 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -1006,7 +1006,7 @@ route:
>      if (cm_event->event != RDMA_CM_EVENT_ADDR_RESOLVED) {
>          ERROR(errp, "result not equal to event_addr_resolved %s",
>                  rdma_event_str(cm_event->event));
> -        perror("rdma_resolve_addr");
> +        error_report("rdma_resolve_addr");
>          rdma_ack_cm_event(cm_event);
>          ret = -EINVAL;
>          goto err_resolve_get_addr;
> @@ -2544,7 +2544,7 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp, bool return_path)
>      }
>  
>      if (cm_event->event != RDMA_CM_EVENT_ESTABLISHED) {
> -        perror("rdma_get_cm_event != EVENT_ESTABLISHED after rdma_connect");
> +        error_report("rdma_get_cm_event != EVENT_ESTABLISHED after rdma_connect");
>          ERROR(errp, "connecting to destination!");
>          rdma_ack_cm_event(cm_event);
>          goto err_rdma_source_connect;
> -- 
> 2.31.1
> 
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


