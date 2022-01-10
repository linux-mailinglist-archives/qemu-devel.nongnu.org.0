Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1E1489574
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:39:19 +0100 (CET)
Received: from localhost ([::1]:39922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6r93-0005ys-Sd
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:39:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6r6i-0004C7-Ku
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:36:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6r6c-0005wa-1D
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:36:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641807403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=orsNaJJ2eBhmSz8zkjWW92NI6c/L5YtP00qtxc0bG0k=;
 b=ayxX9pZXuTFqmlv5FxCXG7+vw5UrB+s1mc26SvvxsI6fLXbUI2SxxLM9uO/cBalIAIOegS
 svKm9VpF7QjGbKf8idJPM4dhpmmhNFcZWk97IMsUVz+h3oKbsCPC35EJpvgX5+JimL89li
 rfV5r2txgJgdYwUZ6VHM/Kj7WXpkSc8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-Mw5likT8PkyFxCssDQ4Qug-1; Mon, 10 Jan 2022 04:36:40 -0500
X-MC-Unique: Mw5likT8PkyFxCssDQ4Qug-1
Received: by mail-ed1-f72.google.com with SMTP id
 c8-20020a05640227c800b003fdc1684cdeso1601908ede.12
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 01:36:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=orsNaJJ2eBhmSz8zkjWW92NI6c/L5YtP00qtxc0bG0k=;
 b=sOb9OoqSeq5DX3uzEm4Q1Yj95tytul3puiyGax4FJ/qcqRT51AujamWKpBHGquSMsV
 RX+B6Q7DmrsVXu6/jqGl+qPpFU6pRZZ6OeljzbsPcUhXkd8YomjCIP0rh6aNYvA5KaXN
 ybl+eiTw4E/ZnfRoL4tP75xsn0sUH46JdpmwJLcBN4GC0beWe7gDVBYzNSLNAfPd/57X
 sraCY6CXNM+eM6n3JFrpGCDRS+r/zs2dnoQGB+VTH9agOdfwk7ixuw0EFzraWx5N2q5Y
 Odvx9poX+Rj6sNIb3MPjOVRCrFZMXn2TVwwbGgqQ9UgNmjaAWJE3CcfH7J9P5aWYaEB9
 /vuA==
X-Gm-Message-State: AOAM533cL5/VctWBMlOim/xR63UNbbJb+S3+Xd4HJGNFzK8/oPn4It94
 pcrWXrNcJ0l2gRk0BmsskvNcFqePXXbtl4xKxqS9TIpGZt53TwuhnVqq8rKEJxDXsblU7z3Gpgw
 imk7d/XSgcWElEOs=
X-Received: by 2002:a17:907:1687:: with SMTP id
 hc7mr2468969ejc.565.1641807399279; 
 Mon, 10 Jan 2022 01:36:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy73kzeoFW6TdtCsOijf1jGH6KwVTX35Tsp4FPZZlpt3cReSzE+xxVNmLhpWKO22KBjvHmSDw==
X-Received: by 2002:a17:907:1687:: with SMTP id
 hc7mr2468953ejc.565.1641807399030; 
 Mon, 10 Jan 2022 01:36:39 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107d:b60c:c297:16fe:7528:e989])
 by smtp.gmail.com with ESMTPSA id ec25sm3276672edb.51.2022.01.10.01.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 01:36:38 -0800 (PST)
Date: Mon, 10 Jan 2022 04:36:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v2 1/5] libvhost-user: Add vu_rem_mem_reg input validation
Message-ID: <20220110043354-mutt-send-email-mst@kernel.org>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
 <20220106064717.7477-2-raphael.norwitz@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20220106064717.7477-2-raphael.norwitz@nutanix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 06, 2022 at 06:47:26AM +0000, Raphael Norwitz wrote:
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>


Raphael any chance you can add a bit more to commit logs?
E.g. what happens right now if you pass more?

> ---
>  subprojects/libvhost-user/libvhost-user.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index 787f4d2d4f..a6dadeb637 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -801,6 +801,12 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>      VuDevRegion shadow_regions[VHOST_USER_MAX_RAM_SLOTS] = {};
>      VhostUserMemoryRegion m = vmsg->payload.memreg.region, *msg_region = &m;
>  
> +    if (vmsg->fd_num != 1 ||
> +        vmsg->size != sizeof(vmsg->payload.memreg)) {

Is there a chance someone is sending larger messages and relying
on libvhost-user to ignore padding?

> +        vu_panic(dev, "VHOST_USER_REM_MEM_REG received multiple regions");

Maybe print the parameters that caused the issue?

> +        return false;
> +    }
> +
>      DPRINT("Removing region:\n");
>      DPRINT("    guest_phys_addr: 0x%016"PRIx64"\n",
>             msg_region->guest_phys_addr);
> -- 
> 2.20.1


