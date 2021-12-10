Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6250346FF09
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 11:51:22 +0100 (CET)
Received: from localhost ([::1]:58320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvdUn-0001u0-HL
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 05:51:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mvdSe-00005A-6f
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:49:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mvdSa-0008Iy-TM
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639133343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JiBwa5/NVd+FCuZrOZRWrZyWzC5HC7yMWl6gXzMVzcI=;
 b=FAgWoNwgEh3iSEM1L7ilAS1IwZxqeWOK3wFszEi78lSoVfg2yQR7Dc1SAQaeW1ZZDVpKam
 +6Bn6HfSHkTuRmiXUB0n6gJULVDULFV1PY8EcM1u2qOJIosfYPd1AUhNnd1RNT8g+Fd6jo
 /lGimvhgLc08U0eXxzRPwpPaeeMJHh4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-ep4bDdrYOV-Ak93lvyVg3Q-1; Fri, 10 Dec 2021 05:49:02 -0500
X-MC-Unique: ep4bDdrYOV-Ak93lvyVg3Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so2124180wrd.1
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 02:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JiBwa5/NVd+FCuZrOZRWrZyWzC5HC7yMWl6gXzMVzcI=;
 b=aBQ9anvViFAYuz2yu+CpZ/81PtX8Q6mpUlsB9gAqUJjlH/11a+jAUbIWRFV0BuspzW
 WKFObtzLkKCPunn+VU7zU0mmwHi8E+b4SSxguhB7umB8VHNz0sYMC/e9YgzcQjLIPQtS
 it2r9U2mO7o2hQX+mizbr2oWzebHbEU3xhk8z8/36UvVPCXb+4guvMSr8wvdfro/eIpM
 W88plp7OgX+wBKPmtsZTdbfqd7klM6XE/0vRuJaJ5Rq1qgFVxMjgD7K5IxopSJLCMMAz
 z/PRVZHC2AvrKdT2WcrUa/qtC+oICwCaFpEg7CHSiMFyHdvGv7Y1TEQJ1jSTpSjH1y3X
 rN8Q==
X-Gm-Message-State: AOAM531dnKmf+UdSnljU0owbJAwaLPlUfN/HeTtxxOyCiDbdFx9Pr0p4
 uuTJffuRgpKJOLNbNyS7/3xuOEjFwsq9JYFXoZcw1a0+cEBCtkXsHAmxkBkekiZI1b3TaTZtN2f
 RZ2kbDtjydjOgChM=
X-Received: by 2002:a05:600c:190b:: with SMTP id
 j11mr15331870wmq.112.1639133341324; 
 Fri, 10 Dec 2021 02:49:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzZkNuyw4A7fORSHbTYluzvevAKNyDsgsjoOL+i9luDEYhIaopnpi0Q4kP22tZCtzABOn4Pg==
X-Received: by 2002:a05:600c:190b:: with SMTP id
 j11mr15331851wmq.112.1639133341117; 
 Fri, 10 Dec 2021 02:49:01 -0800 (PST)
Received: from redhat.com ([2.55.18.120])
 by smtp.gmail.com with ESMTPSA id n2sm11273921wmi.36.2021.12.10.02.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 02:49:00 -0800 (PST)
Date: Fri, 10 Dec 2021 05:48:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 for-7.0] scripts: Explain the difference between
 linux-headers and standard-headers
Message-ID: <20211210054601-mutt-send-email-mst@kernel.org>
References: <20211209194532.1502920-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211209194532.1502920-1-peter.maydell@linaro.org>
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 09, 2021 at 07:45:32PM +0000, Peter Maydell wrote:
> If you don't know it, it's hard to figure out the difference between
> the linux-headers folder and the include/standard-headers folder.
> So let's add a short explanation to clarify the difference.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

A couple of minor tweaks: what matters is which platform
we are building for I think.

> ---
> v1 of this was from Thomas; I suggested some expanded wording
> and since that made the patch pretty much entirely my text
> Thomas suggested I send this under my name.
> ---
>  scripts/update-linux-headers.sh | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
> index fea4d6eb655..d23851e1d3b 100755
> --- a/scripts/update-linux-headers.sh
> +++ b/scripts/update-linux-headers.sh
> @@ -9,6 +9,22 @@
>  #
>  # This work is licensed under the terms of the GNU GPL version 2.
>  # See the COPYING file in the top-level directory.
> +#
> +# The script will copy the headers into two target folders:
> +#
> +# - linux-headers/ for files that are required for compiling on a

I think it's more of a "for a Linux host"

> +#   Linux host.  Generally we have these so we can use kernel structs
> +#   and defines that are more recent than the headers that might be
> +#   in /usr/include/linux 

I'd just say "installed". Path does not matter.

>on the host system.  Usually this script
> +#   can do simple file copies for these headers.
> +#
> +# - include/standard-headers/ for files that are used for guest
> +#   device emulation and are required on all hosts.  For instance, we
> +#   get our definitions of the virtio structures from the Linux
> +#   kernel headers, but we need those definitions regardless of which
> +#   host OS we are building on.

we are building for

>  This script has to be careful to
> +#   sanitize the headers to remove any use of Linux-specifics such as
> +#   types like "__u64".  This work is done in the cp_portable function.
>  
>  tmpdir=$(mktemp -d)
>  linux="$1"
> -- 
> 2.25.1


