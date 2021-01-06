Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B3D2EC3A8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 20:05:28 +0100 (CET)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxE7b-0003f9-8h
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 14:05:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxE68-0003Bd-6p
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 14:03:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxE65-0002AZ-46
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 14:03:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609959830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G4x5170F5zIYQR5/+CnSqblOl6u1fejziN41HGqkdek=;
 b=BxiKMaXMMjjR6idVqgOIqCjbnm4OSzkoSG89cgISPGA5H7Zs0wAQJjmy7AfQ1qrZe6eqFZ
 H4DGWsiXSpTSq0RAZ3dvXuCQDyCVkJyOvZuRotxxj4xm4XITN2ferSAaw5+HC1O92wdcDQ
 VyLvlui12I1bhBmOF3tt2A77T0kyCL4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-venVKyqbPea4TwCMUXoEFg-1; Wed, 06 Jan 2021 14:03:49 -0500
X-MC-Unique: venVKyqbPea4TwCMUXoEFg-1
Received: by mail-qv1-f69.google.com with SMTP id i13so3043177qvx.11
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 11:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G4x5170F5zIYQR5/+CnSqblOl6u1fejziN41HGqkdek=;
 b=uWSlXMMjO4LCR3OTFUJ4P+R/PvjOKge+00BJtD7K6m9zdNjWTXmi/5M4nM9UafIkQy
 /jCOZJdhqpbSLdBUN1+rQfYpMIPzyQsrjRDs6u07GIdGIzT0pT5PQFYEIrULDYH5MNja
 Ngn3V6vY0vJUqFoCKBffv4GjRRZnMHmvhCXNtKuMb76VcIbRhNMH7DrQ/Ot4Y41KHSj0
 CrLT1RJLBmlCRTAAxv5npBMJ0YVEpnu50kg85CjKwAOkSUPX4q3pAImmXmcwuklvVS2W
 95WAAlc0YQaJZO5PQjE+wPl+w0yKE9bDT0iV9B9G+6xOT641VyiT0TEuN/HQB8leGn9f
 izeA==
X-Gm-Message-State: AOAM532Gfq9RNP/Bosm/fMMc/n/Chvlznbbbb5fApmF4m0JhPsvkDqwg
 mATMMBSUQ9bL9WIFdc1z12cPJ7oldEesT1VcMfZmnvl2XY1PGdV2oQ1zAFWQfCZ+SjV9WDpe9cR
 tCuL2Gw7vEWpr1JA=
X-Received: by 2002:ae9:f70a:: with SMTP id s10mr5547357qkg.416.1609959828522; 
 Wed, 06 Jan 2021 11:03:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/Ry8avEJ9BhfbZHQoMQRSovnQ8JCGlsL/s0PQIxCSkbu0DgBu7ZG+79kIDXeFH8u7FKB++w==
X-Received: by 2002:ae9:f70a:: with SMTP id s10mr5547337qkg.416.1609959828315; 
 Wed, 06 Jan 2021 11:03:48 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id c42sm1672246qta.17.2021.01.06.11.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 11:03:47 -0800 (PST)
Date: Wed, 6 Jan 2021 14:03:45 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v3 1/3] update-linux-headers: Include const.h
Message-ID: <20210106190345.GJ149908@xz-x1>
References: <20210104202057.48048-1-farman@linux.ibm.com>
 <20210104202057.48048-2-farman@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210104202057.48048-2-farman@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 04, 2021 at 09:20:55PM +0100, Eric Farman wrote:
> Kernel commit a85cbe6159ff ("uapi: move constants from
> <linux/kernel.h> to <linux/const.h>") breaks our script
> because of the unrecognized include. Let's add that to
> our processing.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>  scripts/update-linux-headers.sh | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
> index 9efbaf2f84..fa6f2b6272 100755
> --- a/scripts/update-linux-headers.sh
> +++ b/scripts/update-linux-headers.sh
> @@ -41,6 +41,7 @@ cp_portable() {
>                                       -e 'pvrdma_verbs' \
>                                       -e 'drm.h' \
>                                       -e 'limits' \
> +                                     -e 'linux/const' \
>                                       -e 'linux/kernel' \
>                                       -e 'linux/sysinfo' \
>                                       -e 'asm-generic/kvm_para' \
> @@ -190,7 +191,9 @@ for i in "$tmpdir"/include/linux/*virtio*.h \
>           "$tmpdir/include/linux/input.h" \
>           "$tmpdir/include/linux/input-event-codes.h" \
>           "$tmpdir/include/linux/pci_regs.h" \
> -         "$tmpdir/include/linux/ethtool.h" "$tmpdir/include/linux/kernel.h" \
> +         "$tmpdir/include/linux/ethtool.h" \
> +         "$tmpdir/include/linux/const.h" \
> +         "$tmpdir/include/linux/kernel.h" \
>           "$tmpdir/include/linux/vhost_types.h" \
>           "$tmpdir/include/linux/sysinfo.h"; do
>      cp_portable "$i" "$output/include/standard-headers/linux"
> -- 
> 2.17.1

So I think I came to the same change when trying to update the headers. :)

Reviewed-by: Peter Xu <peterx@redhat.com>

Could I ask why the const.h is installed into include/standard-headers/linux
rather than linux-headers/linux?  When I was working on my version I failed to
figure out the difference.

One answer is ethtool.h is there which included const.h, but I guess that's not
the real one.

Thanks,

-- 
Peter Xu


