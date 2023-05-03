Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35696F5AB7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 17:12:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puE7t-0006gj-S6; Wed, 03 May 2023 11:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puE7r-0006fC-A2
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:10:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puE7b-0004GD-Bt
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:10:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683126622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l+seuuDcwXGP9E4dAMeUcmrbjbZK9Sq/rTzFADY5C34=;
 b=gGWOp18R9hkNttny/0jz2AmFKK2Sy+qgzWs6d5qcsF+vEQCyymAgSkrE/sRuAFE3OgkbFD
 Ksm1zmuRAnBxL2Y4iKcMxcfD/FB0M/1ZCVec5ZB9+Px9tuaefjShbE0O9NF7d4m/LOGxot
 jnE0lzvmvUFEALVInx0tev0p/YkQhrU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-TCCIzhq2Omao9c4zWFmiYw-1; Wed, 03 May 2023 11:10:19 -0400
X-MC-Unique: TCCIzhq2Omao9c4zWFmiYw-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-61b6f717b6eso2097566d6.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 08:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683126619; x=1685718619;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l+seuuDcwXGP9E4dAMeUcmrbjbZK9Sq/rTzFADY5C34=;
 b=f/sll4Y+tSlilpjfXRCfZOWnFc4do2ZHvpDku7MtZEs8btaC7JrMQ5Y33+UhSSAuTt
 XZWozYDc5AF5A53ACgfJ6FS70Xud3seX2YywpkJM4Aii/ODJXkj992zJwgNGgz+T5MAp
 zf/8Rntfo/v05SEsaR+Z5WuSWonyZQQmwY23HleqfjgwCZ84SzNlkIasEqFEkLLO1056
 zhoysi8cz9pSI3SWsfr53o8ahkC8XSMB4gLsCi2cPBQXAkzDBSECnVY6qEO4Inql6YtI
 RBq8mf9zZwlyUI7h/U8z12Ppw4VtcEyhgSpaquNXA/xxQ+H43dv8Mc5HfT+Fvfnu3WwG
 O0yg==
X-Gm-Message-State: AC+VfDxFsWO5nvtKVPQyS+rdAqfkDqrlSs2llC9TDvrlQ88BqGIEtqW+
 FEDarjjkE2AjzZTkQHTsqJTE6Na8M4+eYvcGsSwNfKcZFpJGulcC1vhaJIjFnqJYCVLzfHxLieD
 K7gOtCTjaLlaCuCU=
X-Received: by 2002:a05:6214:4104:b0:5ad:cd4b:3765 with SMTP id
 kc4-20020a056214410400b005adcd4b3765mr9257917qvb.1.1683126618821; 
 Wed, 03 May 2023 08:10:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7THjRx30NT/Pdj6ikyL5bXxt3Ysh1hG9VDdzL2SCZSqvZR0lIG08HG7YVWQ248mq9tWnPXRw==
X-Received: by 2002:a05:6214:4104:b0:5ad:cd4b:3765 with SMTP id
 kc4-20020a056214410400b005adcd4b3765mr9257894qvb.1.1683126618558; 
 Wed, 03 May 2023 08:10:18 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 z34-20020a05620a262200b0074ca7c33b79sm10770648qko.23.2023.05.03.08.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 08:10:17 -0700 (PDT)
Date: Wed, 3 May 2023 11:10:16 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/1] hw/pci: Disable PCI_ERR_UNCOR_MASK register for
 machine type < 8.0
Message-ID: <ZFJ5WLQRo656hqz9@x1n>
References: <20230503002701.854329-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230503002701.854329-1-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, May 02, 2023 at 09:27:02PM -0300, Leonardo Bras wrote:
> Since it's implementation on v8.0.0-rc0, having the PCI_ERR_UNCOR_MASK
> set for machine types < 8.0 will cause migration to fail if the target
> QEMU version is < 8.0.0 :
> 
> qemu-system-x86_64: get_pci_config_device: Bad config data: i=0x10a read: 40 device: 0 cmask: ff wmask: 0 w1cmask:0
> qemu-system-x86_64: Failed to load PCIDevice:config
> qemu-system-x86_64: Failed to load e1000e:parent_obj
> qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:02.0/e1000e'
> qemu-system-x86_64: load of migration failed: Invalid argument
> 
> The above test migrated a 7.2 machine type from QEMU master to QEMU 7.2.0,
> with this cmdline:
> 
> ./qemu-system-x86_64 -M pc-q35-7.2 [-incoming XXX]
> 
> In order to fix this, property x-pcie-err-unc-mask was introduced to
> control when PCI_ERR_UNCOR_MASK is enabled. This property is enabled by
> default, but is disabled if machine type <= 7.2.
> 
> Fixes: 010746ae1d ("hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register")
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


