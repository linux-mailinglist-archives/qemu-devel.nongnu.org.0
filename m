Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2DC4BB496
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 09:50:39 +0100 (CET)
Received: from localhost ([::1]:44194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKyyM-0007Gn-SS
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 03:50:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKya2-0007l2-UZ
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 03:25:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKya1-0001Yi-48
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 03:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645172728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zrpKsyi8D+sAuCtM2ktADwORuxYImetxrRZM2pjQHns=;
 b=Hm9/H5XcmjrJbEyEwk9sILbjvWfsVCdgRK52/0+DqB29+Ps3MXkuY5cSq4AIgDXzCIy10J
 U175Rzh3HwqAdN6PN1uYWXGyfFrtBIov/H7Xqkem0ATb5VFt8315V/8dpMNxyLjM79f50E
 9MaGrCxRxgZQBN20sRq/bu+NGNkQ0h4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-qTzruKRIP62Dbnwk-HuSQQ-1; Fri, 18 Feb 2022 03:25:25 -0500
X-MC-Unique: qTzruKRIP62Dbnwk-HuSQQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso5082312edt.20
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 00:25:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zrpKsyi8D+sAuCtM2ktADwORuxYImetxrRZM2pjQHns=;
 b=PR0qhIx9R9iR3MSkbfI71/14qngle1t4URYcflMz/st0dWurOCh/eLZZtrrAF+hTc4
 Jf6b50kXqmTbEaZRhad3DJQTTjoNx794yl6ZHxFersSuCHLTnGhpDu3wtQlixQYlGTpV
 odm/qgMkonAkdKGiktha1NY3EcxT4Rfe4Ez2uAnZ5Qv9qKOrOFzaQYuPKlx1UroYIwBO
 OLADA8m9xUzudHyvB23lf5GSuxV1k2CLDVwJU+pNjVNfW0HUw9wILuuRdLukGlR8vQtc
 o56pd8eUODfnBf9XRUwWwLlHcUmgUewTto15Ac7kf1YHPmWIN/wZnCcA4W2ht9nwDqGA
 tHzA==
X-Gm-Message-State: AOAM533OBNkb5/qu78tZev+bqikmJ/6yZX+eE2lExHBEP25sbmJbEghR
 22QbtTF84PoPysfxGWfrpoztkI88RQB1ierueNWFl+TNvP1wIULIQLfTn9YDa07f+myXpbRUNBi
 GOsRPHEjuuD2FJeU=
X-Received: by 2002:a05:6402:13cb:b0:410:820f:4e8 with SMTP id
 a11-20020a05640213cb00b00410820f04e8mr6684584edx.352.1645172724217; 
 Fri, 18 Feb 2022 00:25:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyR/roJXRIPnc0NRg48vu6GWWlDXwCXUFshBpUDCwwyORcMwqRSVPKG6DP4fyE599sN5+WmgA==
X-Received: by 2002:a05:6402:13cb:b0:410:820f:4e8 with SMTP id
 a11-20020a05640213cb00b00410820f04e8mr6684570edx.352.1645172724052; 
 Fri, 18 Feb 2022 00:25:24 -0800 (PST)
Received: from redhat.com ([2.55.156.211])
 by smtp.gmail.com with ESMTPSA id t29sm1620195edi.84.2022.02.18.00.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 00:25:23 -0800 (PST)
Date: Fri, 18 Feb 2022 03:25:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v5 04/15] pcie: Add 1.2 version token for the Power
 Management Capability
Message-ID: <20220218032515-mutt-send-email-mst@kernel.org>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
 <20220217174504.1051716-5-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20220217174504.1051716-5-lukasz.maniak@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 06:44:53PM +0100, Lukasz Maniak wrote:
> From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> 
> Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  include/hw/pci/pci_regs.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/hw/pci/pci_regs.h b/include/hw/pci/pci_regs.h
> index 77ba64b9314..a5901409622 100644
> --- a/include/hw/pci/pci_regs.h
> +++ b/include/hw/pci/pci_regs.h
> @@ -4,5 +4,6 @@
>  #include "standard-headers/linux/pci_regs.h"
>  
>  #define  PCI_PM_CAP_VER_1_1     0x0002  /* PCI PM spec ver. 1.1 */
> +#define  PCI_PM_CAP_VER_1_2     0x0003  /* PCI PM spec ver. 1.2 */
>  
>  #endif
> -- 
> 2.25.1


