Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6544132AB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 13:36:07 +0200 (CEST)
Received: from localhost ([::1]:57642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSe4E-00011j-98
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 07:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSe1I-0006sh-1Z
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 07:33:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSe1F-0007IH-KX
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 07:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632223979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nWs9yyLBFqnyqCgXz5BkJHc9qA1V8caDMo+P2PfOzhE=;
 b=HI5V+uUuSkMrYFMOIVV+j3EJKWz0yKB/as+w/5vK1KHh4dcqwhhorxhZVX8cie3pa8yLQS
 j88KQl2Nrl/XLh6aCM4l+X6z7Bdf6TW0lMBcn9v13e1HcnOA3/ZW1NVAbaAsTAGu6Tq+2W
 G0+We20EWXTQpwvCrFuGZR15AurOUOI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-XjEXaaszO9K9SyNugFNxZA-1; Tue, 21 Sep 2021 07:32:58 -0400
X-MC-Unique: XjEXaaszO9K9SyNugFNxZA-1
Received: by mail-ed1-f69.google.com with SMTP id
 14-20020a508e4e000000b003d84544f33eso7451677edx.2
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 04:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWs9yyLBFqnyqCgXz5BkJHc9qA1V8caDMo+P2PfOzhE=;
 b=i7X0NcSrAHnJ7m1KeLQ+UZcT/AGBxUtcFJFtOfC/n2PQbwv3fEhn3FhLZTTlhdIphN
 orD2au6U+B5enNZP75Ym/nlvwKy0SmGUlofV0V6NkEa9HBPBFs0e32OQPLgWZSX636Hy
 w+Q4KOnx7WR/GXeLPo6SHny1FGCIOX7S7YtfNxcvLO/oxMcUyf1Dj6Z7+V5LuJfmkUQI
 QAS6rT1nF3oOSh2cIAIvDz4IBhptGlPnm2HqQr8Sz9i3DnLjTz0XRUTvxcTAvZoZMGzt
 +euwFEZLP3n4AcTIPeQTiQ48PJ46aAR/TKzP+wBgJ88lrjY15/JQfYDG4NAe+zWMi/Pu
 P0Aw==
X-Gm-Message-State: AOAM530zdXiAnRxNHxtVS4D+Io0mpg0tp90mqtwaP5lbCrMt4UfaX9sA
 a6ALCj8MzEQSOvCwvclZll8Ihxdw7T7/OgIAEDN46CXsE1EBolK+oFhfpAq2D0xdHsZHia3R1Vi
 fVZodhYBYdbt//Mg=
X-Received: by 2002:a50:d9c5:: with SMTP id x5mr25015443edj.37.1632223977357; 
 Tue, 21 Sep 2021 04:32:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweBGHq8t5N/srVzVKcQ3Dk9C7zBk1B2i+QUo35qr/X6ii318FHR8xb1oOMSdSDNiGxJVSWNA==
X-Received: by 2002:a50:d9c5:: with SMTP id x5mr25015435edj.37.1632223977212; 
 Tue, 21 Sep 2021 04:32:57 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id w13sm8996612ede.24.2021.09.21.04.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 04:32:56 -0700 (PDT)
Date: Tue, 21 Sep 2021 13:32:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v6 03/10] ACPI ERST: PCI device_id for ERST
Message-ID: <20210921133255.02a67ad9@redhat.com>
In-Reply-To: <1628202639-16361-4-git-send-email-eric.devolder@oracle.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
 <1628202639-16361-4-git-send-email-eric.devolder@oracle.com>
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Aug 2021 18:30:32 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> This change reserves the PCI device_id for the new ACPI ERST
> device.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/pci/pci.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index d0f4266..58101d8 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -108,6 +108,7 @@ extern bool pci_available;
>  #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
>  #define PCI_DEVICE_ID_REDHAT_NVME        0x0010
>  #define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0011
> +#define PCI_DEVICE_ID_REDHAT_ACPI_ERST   0x0012
>  #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
>  
>  #define FMT_PCIBUS                      PRIx64


