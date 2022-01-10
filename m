Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAC5489DAA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 17:35:56 +0100 (CET)
Received: from localhost ([::1]:57152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6xeF-0008W8-EC
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 11:35:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1n6xcI-0007jM-6A
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:33:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1n6xcE-0001YT-If
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:33:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641832429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LCCYg47zaRz4DiIP1RGeEBO+DJMi6R4KCquIn8uCTpM=;
 b=XlbFO570AvypKZKAds9kpO6nrBc3DMS9BpOgXAJ1zF8PyFwHr4KE6z3KazbF5FnXu97UeQ
 RGfre6ezVSBzGW98yWGAT8UYyg33XDErBUIW2LUZEfVNhs7CQPsHgHSYxhAzPzYnckKuoL
 lBZYoQkC1HEx+DjmyGH2t7s/M22pXig=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-DkNTma3TP8m-72KGZGgmRg-1; Mon, 10 Jan 2022 11:33:48 -0500
X-MC-Unique: DkNTma3TP8m-72KGZGgmRg-1
Received: by mail-qk1-f199.google.com with SMTP id
 p203-20020a3742d4000000b00477981b71e1so6162884qka.16
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 08:33:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LCCYg47zaRz4DiIP1RGeEBO+DJMi6R4KCquIn8uCTpM=;
 b=fpFbhP4GGMZEZ1ccKVWyn+B6/Ux8xyN8jGdaT0HkFjOx0NWp9sG5/pwaHqWE1jfWr/
 DD2xU0hbAhr5+897x7ZbhmjciKwsfaOWrIF9oFXwdMXs5QhLu+eL21FC/12u0Szk9ZKV
 emM1mpFRlsQdvwd/tgifHf8NrJeoDGm4De6Z40RAcpgzUyXtY/UoV/79fLrUwgSMkCoE
 pTBIYfNzDVG/IZAk+1IAo585HsSAKEi4dkyQYBZl1NaD51TdiueGUOobZRv4FuXqS1Xx
 Y8GEXw8lgBpuPmfdMjeCMJ91fgj/LVzTgy66trh/p4t0vPgyGAbXxGVcWqdBNwsWQrlE
 ULpA==
X-Gm-Message-State: AOAM531v94g08gOfSb6kAqVtNz0fIk8nqPysXrGFX0qyD8a56uyM6P/1
 /y+djV8luX1nje2DqkmIpNXvRQudmW7JhRnql7EauQza8nrSeaQyYt+AMXRP6ekWwWgpP6c88Ah
 7DPGceSWPKYna8A0=
X-Received: by 2002:a05:6214:2269:: with SMTP id
 gs9mr194194qvb.40.1641832428055; 
 Mon, 10 Jan 2022 08:33:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzah6uNPVyeOPUws82u11QLJXIdRHQ0y9I5LAH04qCL76UQ+pq4Gxc/LCFiaYWkXuUlL081qg==
X-Received: by 2002:a05:6214:2269:: with SMTP id
 gs9mr194171qvb.40.1641832427785; 
 Mon, 10 Jan 2022 08:33:47 -0800 (PST)
Received: from steredhat (host-79-51-11-180.retail.telecomitalia.it.
 [79.51.11.180])
 by smtp.gmail.com with ESMTPSA id q15sm4607594qkj.108.2022.01.10.08.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 08:33:47 -0800 (PST)
Date: Mon, 10 Jan 2022 17:33:43 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Patrick Venture <venture@google.com>
Subject: Re: [PATCH v2] net/tap: Set return code on failure
Message-ID: <20220110163343.d2pmwhy2pzrgnp3h@steredhat>
References: <20220105164214.3381151-1-venture@google.com>
MIME-Version: 1.0
In-Reply-To: <20220105164214.3381151-1-venture@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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
Cc: jasowang@redhat.com, pefoley@google.com, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 08:42:14AM -0800, Patrick Venture wrote:
>From: Peter Foley <pefoley@google.com>
>
>Match the other error handling in this function.
>
>Fixes: e7b347d0bf6 ("net: detect errors from probing vnet hdr flag for TAP devices")
>
>Reviewed-by: Patrick Venture <venture@google.com>
>Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>Signed-off-by: Peter Foley <pefoley@google.com>
>---
>v2: Fixed commit titlewq and updated description.
>---
> net/tap.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/net/tap.c b/net/tap.c
>index f716be3e3f..c5cbeaa7a2 100644
>--- a/net/tap.c
>+++ b/net/tap.c
>@@ -900,6 +900,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
>             if (i == 0) {
>                 vnet_hdr = tap_probe_vnet_hdr(fd, errp);
>                 if (vnet_hdr < 0) {
>+                    ret = -1;

In case of error, `vnet_hdr` should contain an error code (negative), so 
we could assign `ret = vnet_hdr`, but looking at the implementation of 
tap_probe_vnet_hdr(), in case of error it returns just -1, so it's ok 
too:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


