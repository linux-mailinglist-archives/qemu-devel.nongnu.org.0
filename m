Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FDB4D2954
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 08:17:25 +0100 (CET)
Received: from localhost ([::1]:40686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRqZY-00018L-FF
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 02:17:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nRqWG-00086i-Gf
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 02:14:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nRqWD-00073B-60
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 02:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646810035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+sIcVcG1K04jdt2eW0SaKqxow217xIDneM/Sk7LiU+k=;
 b=jHHhLQRhGxvIzPx1arOi3x3XdXHcJ15oRSjtiELBMiYosojtaFwIhfMV0AJLBDmPD5gWSU
 ECFVJmr/ITx4rB1f7V+12r+lMqNIPthPdZeveAEw4wVydZqXogy0o18ylAbFeQPpaXvT2N
 fwJvD3a4UNWRcp1L0k2Q4fU7+WuZn3E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-MMx9QM5dPXK9iSv1Z6RY-g-1; Wed, 09 Mar 2022 02:13:54 -0500
X-MC-Unique: MMx9QM5dPXK9iSv1Z6RY-g-1
Received: by mail-ed1-f71.google.com with SMTP id
 u28-20020a50d51c000000b004159ffb8f24so793511edi.4
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 23:13:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+sIcVcG1K04jdt2eW0SaKqxow217xIDneM/Sk7LiU+k=;
 b=x0C8rt5Gm+TMiF8g1CZajtF5iYJXqvgRAs8lUs/nBWZrrHvGTM550/nfarRD4a77Eg
 r2zh7QGEJYtjp0LgIhKL7B9EItpNat6lj1TMkNfcT5ZNFOusMvb/LRPIuQbGJHs2eaFX
 BBbEmoJLdtOpsenocL/M79RUhuH3+vrmKKFTVr4xwfB6wEZPXJBNX/Erm5MvV1r8EbDy
 2dd2d96OW4rNzjBnuUe03lLP8RIN6Wd2j7/irkBe1njhhzqPYt9XsLJX+nNh55+qyxLs
 XsIfNQbIaSGKiqMOhobtlG/DlSPoyphNPsIHX0m9sjLppXQBLJTzX878qM5mVu1FJEGN
 /9Qg==
X-Gm-Message-State: AOAM533swzWHl6qazJSPFG5vKWXQAODdnikgTs0rW889yc65MPj2+yfg
 KpE/KRhDXjNRHu76DglL0+nQyCkH3yjemhQx8PfaFF3FYIpfuHtIhIDSUBkfQB+uzOH681QFSMt
 qt74VfRFJbNL3+MM=
X-Received: by 2002:a17:907:7205:b0:6db:706e:9453 with SMTP id
 dr5-20020a170907720500b006db706e9453mr627054ejc.406.1646810033097; 
 Tue, 08 Mar 2022 23:13:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/7lw15gxh/KzXzzMnrvgw/ARCo65SYc3v4XYbAB70cqmYawoA8YpWgc2Y24lrjVEodzTOGQ==
X-Received: by 2002:a17:907:7205:b0:6db:706e:9453 with SMTP id
 dr5-20020a170907720500b006db706e9453mr627036ejc.406.1646810032749; 
 Tue, 08 Mar 2022 23:13:52 -0800 (PST)
Received: from gator (cst-prg-8-40.cust.vodafone.cz. [46.135.8.40])
 by smtp.gmail.com with ESMTPSA id
 fd16-20020a1709072a1000b006d90b4c029asm366469ejc.28.2022.03.08.23.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 23:13:52 -0800 (PST)
Date: Wed, 9 Mar 2022 08:13:49 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 1/2] hw/intc: Rename CONFIG_ARM_GIC_TCG into
 CONFIG_ARM_GICV3_TCG
Message-ID: <20220309071349.u2b4hgsprfbymf2z@gator>
References: <20220308182452.223473-1-eric.auger@redhat.com>
 <20220308182452.223473-2-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220308182452.223473-2-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 f4bug@amsat.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 08, 2022 at 07:24:51PM +0100, Eric Auger wrote:
> CONFIG_ARM_GIC_TCG actually guards the compilation of TCG GICv3
> specific files. So let's rename it into CONFIG_ARM_GICV3_TCG
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/intc/Kconfig     | 2 +-
>  hw/intc/meson.build | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>

 
Reviewed-by: Andrew Jones <drjones@redhat.com>


