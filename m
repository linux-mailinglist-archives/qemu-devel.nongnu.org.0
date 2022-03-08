Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7819A4D1097
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 07:58:33 +0100 (CET)
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRTnk-00050u-2T
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 01:58:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRTmJ-00048n-Ho
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 01:57:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRTmF-0002mJ-Rz
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 01:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646722618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TmNbgGKtBywCvQ+zfZ8aO/L6X9gvzOP7NwZdPOUyNiI=;
 b=OLKbWZFVrx/vVZer9sAHXCUhCpHAAxoohXYmDBB6yNpbafr973+JQ5QKDad0kaYvAcveqF
 nuQheYfL5BzxR69Yh9PdLectUH9gafmQYp00AcGVpsmxlk5LsaIE7H9wjCiaGHi70mo3ZM
 Vc9Sn+WAId1M/SQMopGTKgygG6Whk1I=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-hn7NjCMSMluv3I-w0KG4JA-1; Tue, 08 Mar 2022 01:56:54 -0500
X-MC-Unique: hn7NjCMSMluv3I-w0KG4JA-1
Received: by mail-ej1-f70.google.com with SMTP id
 go11-20020a1709070d8b00b006cf0d933739so8151286ejc.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 22:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TmNbgGKtBywCvQ+zfZ8aO/L6X9gvzOP7NwZdPOUyNiI=;
 b=7juJwHIkskukTV/UTfKHQdyl9SztQn0/JsyqbWNM7aTsRmiSmg2GnX7/kyfUCDS2Aw
 o2p1sxiVGCIjU49x7g5wuEMPp3itbOj1FfjstooKf9Et+cMCqLyp+iOIlnkx59crPHfE
 MlCaegKAcfRxIVhuVnmaew4/IJF3eCdaHMaU86/aP/4HZnbpwKx9tovG5KAoJWZtNIzH
 tsTUdFpNkzgUTNiwFXSYixKcDbBo6PwDsTjwPR2npwD2Y2scHHatSyY489VzqbVf1ce/
 ZYpa6CPqL31ulob+9l4FafrxbSb5k4Slzu38FtZmLFUDFffA1FHPy+VTUiNS3rpQVCCq
 UP2w==
X-Gm-Message-State: AOAM533DVr3RpfcIIuO+LQsRL3/U/fBVHenfv5ypeLJ9U4KeyCLf7MrD
 GGKpAk0W1XiwaYk8xxdxQ8xpXqIyrbKDxAq49En+E1xZcDf2BjOym+HG406hoOXcPqqp587KAr5
 Doz0ThsPvGOCFCRs=
X-Received: by 2002:a17:906:7c42:b0:6d6:da70:dfa with SMTP id
 g2-20020a1709067c4200b006d6da700dfamr11673488ejp.3.1646722612965; 
 Mon, 07 Mar 2022 22:56:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqJZbzQ6jIn7SyTsFOKeddAXrrjngh0xdR3bon+bczsXAOhIF5S/TtGKtVEk4TnnZi6M7+EQ==
X-Received: by 2002:a17:906:7c42:b0:6d6:da70:dfa with SMTP id
 g2-20020a1709067c4200b006d6da700dfamr11673473ejp.3.1646722612705; 
 Mon, 07 Mar 2022 22:56:52 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 z16-20020a05640240d000b004165f6ce23bsm1509869edb.24.2022.03.07.22.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 22:56:52 -0800 (PST)
Date: Tue, 8 Mar 2022 01:56:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] virtio-net: fix map leaking on error during receive
Message-ID: <20220308015601-mutt-send-email-mst@kernel.org>
References: <20220308055642.20961-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220308055642.20961-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Victor Tom <vv474172261@gmail.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 08, 2022 at 01:56:42PM +0800, Jason Wang wrote:
> Commit bedd7e93d0196 ("virtio-net: fix use after unmap/free for sg")
> tries to fix the use after free of the sg by caching the virtqueue
> elements in an array and unmap them at once after receiving the
> packets, But it forgot to unmap the cached elements on error which
> will lead to leaking of mapping and other unexpected results.
> 
> Fixing this by detaching the cached elements on error. This addresses
> CVE-2022-26353.


Pls use a tag:

Fixes: CVE-2022-26353


Besides that

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Feel free to merge.

> Reported-by: Victor Tom <vv474172261@gmail.com>
> Cc: qemu-stable@nongnu.org
> Fixes: bedd7e93d0196 ("virtio-net: fix use after unmap/free for sg")
> Signed-off-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/net/virtio-net.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index cf8ab0f8af..65b61c836c 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1867,6 +1867,7 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
>  
>  err:
>      for (j = 0; j < i; j++) {
> +        virtqueue_detach_element(q->rx_vq, elems[j], lens[j]);
>          g_free(elems[j]);
>      }
>  
> -- 
> 2.25.1


