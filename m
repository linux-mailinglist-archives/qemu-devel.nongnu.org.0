Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5B34AE31A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 22:43:10 +0100 (CET)
Received: from localhost ([::1]:54432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHYGT-0002SZ-RG
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 16:43:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nHXht-0004a6-Ik
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 16:07:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nHXho-00079o-3X
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 16:07:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644354429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kD4dNd0ow4bJXx6e3JZZHXwT3MKszQreFGnJrxi1/ZI=;
 b=UlQFpUi6bx9GbfqxVFqmoreQtOqN/Nl4bwf14t68Ru04RpWwyBi8yVU5IYrBj3B3uMOm0n
 h17EQKFBKfeWAhXwv9SrwO4asfj5RQt5BfFLHtypgmY98cvqSzNKWf5J+oTcMF0zKt1/6Z
 eZUYXMclVJQcbIE3LT388OPMqQjbGHI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-ozmHA0w0M6e8xGeUMOdHMw-1; Tue, 08 Feb 2022 16:07:08 -0500
X-MC-Unique: ozmHA0w0M6e8xGeUMOdHMw-1
Received: by mail-ed1-f71.google.com with SMTP id
 m4-20020a50cc04000000b0040edb9d147cso237408edi.15
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 13:07:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kD4dNd0ow4bJXx6e3JZZHXwT3MKszQreFGnJrxi1/ZI=;
 b=hdSjei/IVJW+k3p+3jvtpf6Lo7Olv+j+Kuy2ZVdeub708yN1xa5Uce9VeVi/ql5el+
 mX+AbUah1qiloz5BC7NJdkl13DkjWN+lKkYIqMP9ugsjLfmrEVLCntZNjlJDkSTzheTc
 vTvZH2XUVfCe609xJ55fhtN7QUvXFZB0agiZN+ns1pHKHmjJv+99UCJicHvXOE50F6Ap
 bKcbl5pJufFa196AdpnVfQLZz7Efm8KE/Kga+NNvyRKYlNA69+rYv+lyjz+9UnebjSda
 A6CpaTx3UaG/ogjSWbI4uzR6x65p4LiyyBTzmT6Ww0wFooEXseddcUn2ax2DFkacGUkp
 t8pg==
X-Gm-Message-State: AOAM5315iKS81YkfNYRB8sIEQvM+p3HGt+QkomueBfc/tO1I+Z+KhhgV
 O0SgUihVVght+4XAjvdoFaXsQfrOWJRp60LHCrUAa09Y/+K3MyZ0Y13f9gbdZPmRDwDWkfJUzHt
 W/6sMEsJLOrY3ZzQ=
X-Received: by 2002:a17:907:1687:: with SMTP id
 hc7mr5398919ejc.301.1644354427341; 
 Tue, 08 Feb 2022 13:07:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPSDo+ytV/smc7SJk46WBcBuexSzuuujNQJGADWLhxq6PgvWyEpuPPz9Zq6qOcMjNzyOFx1A==
X-Received: by 2002:a17:907:1687:: with SMTP id
 hc7mr5398901ejc.301.1644354427164; 
 Tue, 08 Feb 2022 13:07:07 -0800 (PST)
Received: from redhat.com ([2.52.2.146])
 by smtp.gmail.com with ESMTPSA id qf6sm1330588ejc.113.2022.02.08.13.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 13:07:06 -0800 (PST)
Date: Tue, 8 Feb 2022 16:07:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2 2/4] virtio-iommu: Default to bypass during boot
Message-ID: <20220208160642-mutt-send-email-mst@kernel.org>
References: <20220127142940.671333-1-jean-philippe@linaro.org>
 <20220127142940.671333-3-jean-philippe@linaro.org>
 <87wni5tftq.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87wni5tftq.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 thuth@redhat.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 eric.auger@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 08, 2022 at 06:42:57PM +0100, Cornelia Huck wrote:
> On Thu, Jan 27 2022, Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
> 
> > @@ -988,9 +1025,9 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
> >      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_INPUT_RANGE);
> >      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_DOMAIN_RANGE);
> >      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
> > -    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
> >      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
> >      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_PROBE);
> > +    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS_CONFIG);
> 
> Hm. In the other patch, you say that you don't support cross-version
> migration (I assume across QEMU versions?)

I missed that ... where does it say this?

> Because changing the feature
> set will be guest-visible, and would need some compat handling if you
> plan to support this.


