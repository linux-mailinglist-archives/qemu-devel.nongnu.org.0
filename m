Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E69E423844
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 08:38:08 +0200 (CEST)
Received: from localhost ([::1]:49258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY0Z5-0007YZ-LY
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 02:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY0XC-0005rG-0T
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 02:36:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY0XA-0003YC-HY
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 02:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633502168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2l9E43JkOrZMuVpdd8mAX/XuX5CbJ3P/IZfh7LCORXU=;
 b=FU5IUHo/po7GxeDpjVLz5r8pWVKEMSQUMFOd2vegXKI/gqktITUYF9FqRbSKOx70UN5W00
 +JDmK+dkSuCgVFoTMpTZFFpUjliEKYzG5wc4HuBIan/rcmrwX2y/jMXGUSqLBZHXNQCgVi
 F3m16jaPQhKJyYKkkBJIoyRElGerXcg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-0Xg2qWavO5m9Q4yr_6VYgg-1; Wed, 06 Oct 2021 02:36:06 -0400
X-MC-Unique: 0Xg2qWavO5m9Q4yr_6VYgg-1
Received: by mail-wr1-f72.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so1159714wrg.10
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 23:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2l9E43JkOrZMuVpdd8mAX/XuX5CbJ3P/IZfh7LCORXU=;
 b=3Zhua6RDfB8eC6ZYESbgxJoPV1tlVL6ru5LGmM5lZB0yQrs9KYGjDMw63Qewp9IjRN
 68mMfzuQkH+xg8Yg/01NU4Aac+pf8xSrf8ymdrcFnqGFl5QKHx0288i7FirkISHErs9s
 o6W8S6qDtVQBVmQiC/hM0BBzSEp1r3r3uuVA9xXJdgowKpxMylxdjNNtHY6xrnhiyFMj
 wRKzPbIvNTOyNvE35HYUsTeT9y90zP9sF3WE8HsiRrPlPMHzgQSf/mzHQsoA1vEIyaRM
 ju+X2DgmKcJvMzFwr6oIjU2t7126cslRsxH5izD+FNQGDsF2lOuvzYPcZlKjndFeaXKD
 cT1w==
X-Gm-Message-State: AOAM531/QAVbbai0TvoyemNFxXR7vOn+3NGns4L0RpRBSmy+enaWwcWE
 IC8zAwhdhq2UDTCjz7GXR8XP3CVdqIViY3XBNi+y6vcgMS5OhEefDRT42MetEi3WQjrFkXevNMH
 fzd0xZg3vLs+Mfmo=
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr7745941wmj.11.1633502165750; 
 Tue, 05 Oct 2021 23:36:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2yvwBr+emsQjdSXob1Z+f0fAHCPVuccfZMkcio0SFH+ZCPEeYhza914rSaC2ApYu9/lLDKQ==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr7745924wmj.11.1633502165620; 
 Tue, 05 Oct 2021 23:36:05 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id l11sm5403075wms.45.2021.10.05.23.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 23:36:05 -0700 (PDT)
Date: Wed, 6 Oct 2021 08:36:04 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 05/11] hw/arm/virt: Use object_property_set instead
 of qdev_prop_set
Message-ID: <20211006083604.4ce3cee3@redhat.com>
In-Reply-To: <20211001173358.863017-6-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-6-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  1 Oct 2021 18:33:53 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> To propagate errors to the caller of the pre_plug callback, use the
> object_poperty_set*() functions directly instead of the qdev_prop_set*()
> helpers.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 36f0261ef4..ac307b6030 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2465,8 +2465,9 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                          db_start, db_end,
>                                          VIRTIO_IOMMU_RESV_MEM_T_MSI);
>  
> -        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
> -        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
> +        object_property_set_uint(OBJECT(dev), "len-reserved-regions", 1, errp);
> +        object_property_set_str(OBJECT(dev), "reserved-regions[0]",
> +                                resv_prop_str, errp);
>          g_free(resv_prop_str);
>      }
>  }


