Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BB54395C2
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 14:13:07 +0200 (CEST)
Received: from localhost ([::1]:49772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meyqg-0003zh-7W
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 08:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1meyma-0002Ge-8w
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:08:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1meymV-0001rZ-4R
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635163726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hGj8xwzrjUO4HT1h/9J2yRUrYtfsSmkXWaVmUX4FMRA=;
 b=YW4jD7adXc3x0Ws8xt0/p34cVR/i/XamatpItYtWtV76TIWCjX9pGkAVnIGJ+iKZJVWOi5
 sV7SMsJPi1dfWZ5vTT4Bwa6pEus30GUzghTo72haQwmzTME8QjFVtNneJvuXwF5dReXoYJ
 BaB4+7s9kaUZcq+o8TaNwGewhcdGaS0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-HkahICQjOkWUti92_p97Xg-1; Mon, 25 Oct 2021 08:08:45 -0400
X-MC-Unique: HkahICQjOkWUti92_p97Xg-1
Received: by mail-ed1-f70.google.com with SMTP id
 v9-20020a50d849000000b003dcb31eabaaso9693073edj.13
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 05:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hGj8xwzrjUO4HT1h/9J2yRUrYtfsSmkXWaVmUX4FMRA=;
 b=1j/8+1GfKGiOBoDzfH4AK00nCmFbP3s+iSIIXtCdvP6wYsanKlXhVk26CItw75Vm3K
 8xUupbicc7V83ml4JR8V7qXnCG28KqnutMqU25ETIoGsFmSREuHtrZECgqkYmViAWT/t
 5ZRRPqHh15H+43hHxHLAJuJx335dpohJxdgPTnHZfcB5wpnB4jQF3LF9eH6CPOKI43cG
 tUVQBkcG0Mhws7krx0dq5TFkQB7HK7e14EAebBEU8NsfXfxAS+QZyMsItL7SW6CiZD5f
 VbQ+a10+pGwDZ25RFzf697+5+4gRRDa9p6QtQT0kuPQplyUrgtP1XdSU0O6AYHPSIrxk
 r/fg==
X-Gm-Message-State: AOAM532hykDEdK1GyczcMh3xw2XB8cb09oHU88fAty3zCnJuCign6L7g
 1dCHVYcUCYJrIVXPLtLoKBpiadN2nZEVIT7QFAcjG60Bu25y8XxoF3ccjVq+qsTlamkxWcpeBeb
 KfI03D+V6+vHBZ2g=
X-Received: by 2002:aa7:c68b:: with SMTP id n11mr19363592edq.360.1635163723881; 
 Mon, 25 Oct 2021 05:08:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymX1bhGKuamVLaFkjTv59AAY2SR3HVk2G7fBbUgwewmqdaywrBigxRQyQZ1EvsAoGdbJRAxw==
X-Received: by 2002:aa7:c68b:: with SMTP id n11mr19363584edq.360.1635163723697; 
 Mon, 25 Oct 2021 05:08:43 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207e:bfd4:918:2bfe:a2a5:6abe])
 by smtp.gmail.com with ESMTPSA id qa19sm3325349ejc.54.2021.10.25.05.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 05:08:43 -0700 (PDT)
Date: Mon, 25 Oct 2021 08:08:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] Add a comment about endian-ness of capabilities recorded
 in pci config space
Message-ID: <20211025080451-mutt-send-email-mst@kernel.org>
References: <20211025101736.404148-1-ani@anisinha.ca>
MIME-Version: 1.0
In-Reply-To: <20211025101736.404148-1-ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 25, 2021 at 03:47:36PM +0530, Ani Sinha wrote:
> Values in PCI configuration space are written in little endian format. This
> includes capability values recorded in pci config space for pci bridges etc.
> Add comment to remind developers to make sure the values are written in little
> endian for all platforms and that the code must be endian safe.
> Please also see the following fix which resolves an issue related to code not
> being endian safe for BE systems:

drop an empty line here maybe

> 
> 0e464f7d99311 ("pci: fix PCI resource reserve capability on BE")
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

If we are doing this, I think the correct approach is
to start adding __bitwise__ annotations and fix up
make sparse so we can have endian-ness automatically checked.


> ---
>  include/hw/pci/pci_bridge.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
> index a94d350034..5fc6841833 100644
> --- a/include/hw/pci/pci_bridge.h
> +++ b/include/hw/pci/pci_bridge.h
> @@ -143,6 +143,8 @@ typedef struct PCIBridgeQemuCap {
>  /*
>   * PCI BUS/IO/MEM/PREFMEM additional resources recorded as a
>   * capability in PCI configuration space to reserve on firmware init.
> + * The values of these parameters must be in little-endian and
> + * the code assigning the values must be endian safe for all platforms.
>   */
>  typedef struct PCIResReserve {
>      uint32_t bus;
> -- 
> 2.25.1


