Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB7D55BC5E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 00:49:10 +0200 (CEST)
Received: from localhost ([::1]:57174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5xXY-0006VK-KW
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 18:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o5xTS-0003k5-GK
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 18:44:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o5xTP-00087M-Kq
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 18:44:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656369890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=REIyZDSDcr2skaI6495nIQHNz4ZdQYXixOS58GS6QBY=;
 b=OzpCL/pVHfRQfrmNAASSM3HjIXweGhJ5SK3xtOm62K+MBesBhIQB11SgqFbUjz/PHQJzdU
 LFHuKjE8hIr9XIBCeNBjzhx1kGW3EWhGcVztGD6ZFgzZ0oyufQEZI/HhyY6vUA/PUySWwn
 iypEo7TIWMjJDdo8KCEH7NfYbfJ6tpo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-8fMkDoeoNraCpOE5uoze3g-1; Mon, 27 Jun 2022 18:44:49 -0400
X-MC-Unique: 8fMkDoeoNraCpOE5uoze3g-1
Received: by mail-wm1-f72.google.com with SMTP id
 6-20020a1c0206000000b003a02cd754d1so4200080wmc.9
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 15:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=REIyZDSDcr2skaI6495nIQHNz4ZdQYXixOS58GS6QBY=;
 b=Z1ory8WghISBmjZud+qvzg2rHIOJI7XgbaxKMn1hWShpH9UV381gREnny/5MtXFKUS
 Jgs+IYaUQwthi91CDPh4GTu14OIpS9igbujWh34upySEQkPphxWu4AJhnNnxXcPkfOyS
 qPUUfBsz/mI9U6UN1KutVXDFDob5TEs69uxPzJLapwvorAbReicD+VCaWwLhxxy6gYXW
 0FixyS0HCDxHkxYT1XDptlYZAULDXLpkp+e9mxgva/dwJy/zNJIjYau1QtAmuC5W8dCh
 fc45i7gZ373zVzFzHqqp42BGatyy8TaVvdu9K3u8IZmhTyNYWPk29wxkJxCN5HSbUXEx
 h3xw==
X-Gm-Message-State: AJIora+7/2PtA39RhDhkZl7FFKOHw/O7N54A+cAQILYXNycw4jTV6Qmi
 YD4m21KyIW2EozqTwsFyxfB38u1d8me9qMGy53l1C8zxJyTqVy8HkyiEXMA+mx3b48/kF1xIstF
 0jLxvyxjeZY14N8I=
X-Received: by 2002:a5d:6484:0:b0:21b:b121:679b with SMTP id
 o4-20020a5d6484000000b0021bb121679bmr15063100wri.482.1656369887906; 
 Mon, 27 Jun 2022 15:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1unK62BCp3lgzw3/+TWOS3YGbD/4DhgSP1AVRz5iZ+80u1+C2qFx0tVoz3MHJzj5Pt72JkQXA==
X-Received: by 2002:a5d:6484:0:b0:21b:b121:679b with SMTP id
 o4-20020a5d6484000000b0021bb121679bmr15063065wri.482.1656369887608; 
 Mon, 27 Jun 2022 15:44:47 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 z5-20020adfe545000000b0021b81855c1csm14187572wrm.27.2022.06.27.15.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 15:44:46 -0700 (PDT)
Date: Mon, 27 Jun 2022 18:44:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH V8 24/39] pci: export export msix_is_pending
Message-ID: <20220627184410-mutt-send-email-mst@kernel.org>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-25-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1655304746-102776-25-git-send-email-steven.sistare@oracle.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 15, 2022 at 07:52:11AM -0700, Steve Sistare wrote:
> Export msix_is_pending for use by cpr.  No functional change.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>

the subject repeats export twice.
With that fixed:

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> ---
>  hw/pci/msix.c         | 2 +-
>  include/hw/pci/msix.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> index ae9331c..e492ce0 100644
> --- a/hw/pci/msix.c
> +++ b/hw/pci/msix.c
> @@ -64,7 +64,7 @@ static uint8_t *msix_pending_byte(PCIDevice *dev, int vector)
>      return dev->msix_pba + vector / 8;
>  }
>  
> -static int msix_is_pending(PCIDevice *dev, int vector)
> +int msix_is_pending(PCIDevice *dev, unsigned int vector)
>  {
>      return *msix_pending_byte(dev, vector) & msix_pending_mask(vector);
>  }
> diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
> index 4c4a60c..0065354 100644
> --- a/include/hw/pci/msix.h
> +++ b/include/hw/pci/msix.h
> @@ -32,6 +32,7 @@ int msix_present(PCIDevice *dev);
>  bool msix_is_masked(PCIDevice *dev, unsigned vector);
>  void msix_set_pending(PCIDevice *dev, unsigned vector);
>  void msix_clr_pending(PCIDevice *dev, int vector);
> +int msix_is_pending(PCIDevice *dev, unsigned vector);
>  
>  int msix_vector_use(PCIDevice *dev, unsigned vector);
>  void msix_vector_unuse(PCIDevice *dev, unsigned vector);
> -- 
> 1.8.3.1


