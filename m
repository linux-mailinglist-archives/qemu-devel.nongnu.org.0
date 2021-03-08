Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B6733110F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:40:34 +0100 (CET)
Received: from localhost ([::1]:51628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJH3h-0001fN-Nh
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:40:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJH2D-0000gJ-A1
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:39:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJH27-00056u-Ak
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:39:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615214334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=59gGKL4Yyd65EMEKMhGO6s3r2bHBERkQMxkdw9kaBI4=;
 b=g2pLCzVjUhO9P7Sg2UcdaOyPoqPBm1lpVctvdIEzbUOED14sePum89sVBvt6mecPrMLQPt
 fljbfKMklUB+VOU5dYYqGARPagkcFYLGJP3/oB6PeETxyK9naWV9as9Q1KuGxsscy1xTXm
 j2AB5PJAWvm/4bPHwakWWMI48ZAEdKE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-LuNsfuRzMgGwYR4zmVk2Mg-1; Mon, 08 Mar 2021 09:38:52 -0500
X-MC-Unique: LuNsfuRzMgGwYR4zmVk2Mg-1
Received: by mail-ej1-f72.google.com with SMTP id a22so2429992ejx.10
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 06:38:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=59gGKL4Yyd65EMEKMhGO6s3r2bHBERkQMxkdw9kaBI4=;
 b=c/UlDXSuefzeNkYfaF2wwwoy1WwXT6TlCBABbr6taTX05AAptpbz3KHS1EzF3BKm4p
 vtsz8NiZ1sz48VF6KrwzrPTP/SmMWOw5qORGpnfeuV0K5hjLW9Xw2+6ZPXJIYsC0sUry
 XUX1VjDt83K7aWgfpxhKQa94ondIn1WQlO95L9TPkZdj7A/Dg0Xannu7aUsKBFdqebmt
 i9Oz6D/klQRZEjfH6diXtarfae1qca2GgFF+YfXCZO3jgDFHaWqXfCGD9KhChTWpbZ+R
 Jpn4MtcUeU64uk9goKqryFFHubR3QJ59gdAr/aIVYSVpoifWn8mqKC6BzOf5VlRoP//+
 5xuw==
X-Gm-Message-State: AOAM5333ASv+cSySoColDvHXKuYu3DU80kazAkG1CUIn3LERNXbN9tUA
 xqmz5bMlidO3VehjDPdgDRTpj9v5uaod2MCHVaIW93imBOgG8l3Ay/9oJGZnMk0We8/acMToTs3
 tmEraVNWPM/SK/hM=
X-Received: by 2002:a17:906:f88a:: with SMTP id
 lg10mr15549893ejb.39.1615214331609; 
 Mon, 08 Mar 2021 06:38:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5EuiPpvju0xe6Z4a96WhY/O8sCqQp56NmC+fXqnSgrjpddxZVtGzgCVdSw/Cz84fx8yJhYQ==
X-Received: by 2002:a17:906:f88a:: with SMTP id
 lg10mr15549872ejb.39.1615214331436; 
 Mon, 08 Mar 2021 06:38:51 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c20sm6718960eja.22.2021.03.08.06.38.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 06:38:50 -0800 (PST)
Subject: Re: [PATCH] xen-block: Fix removal of backend instance via xenstore
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
References: <20210308143232.83388-1-anthony.perard@citrix.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c49581e6-6132-a4e2-9beb-a9948fc7ab25@redhat.com>
Date: Mon, 8 Mar 2021 15:38:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308143232.83388-1-anthony.perard@citrix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 xen-devel@lists.xenproject.org, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/21 15:32, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> Whenever a Xen block device is detach via xenstore, the image
> associated with it remained open by the backend QEMU and an error is
> logged:
>      qemu-system-i386: failed to destroy drive: Node xvdz-qcow2 is in use
> 
> This happened since object_unparent() doesn't immediately frees the
> object and thus keep a reference to the node we are trying to free.
> The reference is hold by the "drive" property and the call
> xen_block_drive_destroy() fails.
> 
> In order to fix that, we call drain_call_rcu() to run the callback
> setup by bus_remove_child() via object_unparent().
> 
> Fixes: 2d24a6466154 ("device-core: use RCU for list of children of a bus")
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> CCing people whom introduced/reviewed the change to use RCU to give
> them a chance to say if the change is fine.

If nothing else works then I guess it's okay, but why can't you do the 
xen_block_drive_destroy from e.g. an unrealize callback?

Paolo

> ---
>   hw/block/xen-block.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index a3b69e27096f..fe5f828e2d25 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -972,6 +972,15 @@ static void xen_block_device_destroy(XenBackendInstance *backend,
>   
>       object_unparent(OBJECT(xendev));
>   
> +    /*
> +     * Drall all pending RCU callbacks as object_unparent() frees `xendev'
> +     * in a RCU callback.
> +     * And due to the property "drive" still existing in `xendev', we
> +     * cann't destroy the XenBlockDrive associated with `xendev' with
> +     * xen_block_drive_destroy() below.
> +     */
> +    drain_call_rcu();
> +
>       if (iothread) {
>           xen_block_iothread_destroy(iothread, errp);
>           if (*errp) {
> 


