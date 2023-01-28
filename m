Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB1867F411
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 03:39:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLb70-0004lF-MY; Fri, 27 Jan 2023 21:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLb6u-0004kQ-Mi
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 21:38:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLb6s-0007Ai-3z
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 21:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674873508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K3skPhwWYqq9+Q3dD207lI3pLKfO52pZ5NMeq4QYCiU=;
 b=SpvjPqi18cO2IoL9cuigtTwjfMj/rpBrXx38PuldsR+C0h8qn3p1DJtKXg6QNt5T9FHpe2
 331tPUAjl1atE7bimT2uAFNixgdzfzdr2W3D8HpNBazEkhGD+IZ3GbBIeVrxO1OG6/hi61
 nUFo92fE4gT5TeBtevWs+wlIYtu+ufw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-211-X8d837rXPYGkI2atJ2LN5A-1; Fri, 27 Jan 2023 21:38:25 -0500
X-MC-Unique: X8d837rXPYGkI2atJ2LN5A-1
Received: by mail-wm1-f71.google.com with SMTP id
 j24-20020a05600c1c1800b003dc4480f7bdso644831wms.5
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 18:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K3skPhwWYqq9+Q3dD207lI3pLKfO52pZ5NMeq4QYCiU=;
 b=uqIfY09lj29J5SBEBgdBHTMf2qn4l3nmAGl9pYeHEu3cGYEPtWz2gmGNXTCVsUHXvL
 qxLWXaHXgD8wTm/rDlvzErAdzANbeTg6mGswALwVjjJUotbJBFS0mzFV2KYb/sLRqhrR
 rRKS+0guX0l0uJkD4XQnqn6oSfAWKSgHKFZuPFodoO1rhnhP+pyB1Mzc7yYOScG8IEtR
 NoX9T5D4Y86dqtLtjOOhAdxYm1MrcupbE9/hIh7yBWrMcuUxo08Ng1jOLW1xFfrS8a+H
 9bEVqh/rt2s2RqKRs8LBFkkWXHvZIC5ghfTSNb+cfaK6/QStnGsolgW9hpfD7jB0uaUN
 FKpQ==
X-Gm-Message-State: AO0yUKXTTgDs2mZKJmsqwomnu2eUcPwI4vKZRSegmzXHrWefPhiWX5WG
 KmGH2A6jtCPcingC/YidSAtFZRA7kZ3plnIiQpLAM/0W1KBSUeO9CDVKSA0xmkkT95dvE+H2RHu
 KOvOVW2ZbyIsuN6s=
X-Received: by 2002:adf:b35e:0:b0:2bf:cab7:cc36 with SMTP id
 k30-20020adfb35e000000b002bfcab7cc36mr6102568wrd.23.1674873504373; 
 Fri, 27 Jan 2023 18:38:24 -0800 (PST)
X-Google-Smtp-Source: AK7set/Guu/iMw5Lz8J/77+zWTOLOhGbk1kcf/z87YNYZuGR6ion1t0t0yEwMF863rJcsDgTRoHWBA==
X-Received: by 2002:adf:b35e:0:b0:2bf:cab7:cc36 with SMTP id
 k30-20020adfb35e000000b002bfcab7cc36mr6102555wrd.23.1674873504117; 
 Fri, 27 Jan 2023 18:38:24 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 d3-20020adfe2c3000000b002bc7fcf08ddsm5209714wrj.103.2023.01.27.18.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 18:38:23 -0800 (PST)
Date: Fri, 27 Jan 2023 21:38:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Ben Widawsky <bwidawsk@kernel.org>,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Ira Weiny <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 5/8] hw/i386/acpi: Drop duplicate _UID entry for CXL
 root bridge
Message-ID: <20230127213645-mutt-send-email-mst@kernel.org>
References: <20230112102644.27830-1-Jonathan.Cameron@huawei.com>
 <20230112102644.27830-6-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112102644.27830-6-Jonathan.Cameron@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 12, 2023 at 10:26:41AM +0000, Jonathan Cameron wrote:
> Noticed as this prevents iASL disasembling the DSDT table.
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

This needed but it looks like you did not bother updating
expected files for the tests. Did you run make check?

> ---
>  hw/i386/acpi-build.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 127c4e2d50..a584b62ae2 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1482,7 +1482,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>                  aml_append(pkg, aml_eisaid("PNP0A03"));
>                  aml_append(dev, aml_name_decl("_CID", pkg));
>                  aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> -                aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
>                  build_cxl_osc_method(dev);
>              } else if (pci_bus_is_express(bus)) {
>                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> -- 
> 2.37.2


