Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0046FE28B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:33:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmkf-0003s7-O5; Wed, 10 May 2023 12:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pwmkd-0003rq-Se
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:33:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pwmkc-0004ch-7b
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:33:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683736392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LmNMPwI5Ll9OEBWTyifxv1/cUWvFkQYU+tU+1bsKEAU=;
 b=hR04LuDev72yp+rhKjO4gntmp70X2neqTHx5Yk36RBDWFHJIlF3/Fdf+IRSoQFQJqlKA4u
 H7DPK29c+fOHjBL0yOLSj9tPusV/yacd9Vgo+wdrPAPKOYi9/TMuVeLXPbgYFehiZ2xIKh
 IXrf2GCXgvCmgD5W2OLl/vks+uZHv6A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-nH6ijqY2OZeojiv7765K_Q-1; Wed, 10 May 2023 12:33:11 -0400
X-MC-Unique: nH6ijqY2OZeojiv7765K_Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f433a2308bso29585415e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683736389; x=1686328389;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LmNMPwI5Ll9OEBWTyifxv1/cUWvFkQYU+tU+1bsKEAU=;
 b=EHs88jB4rrVdS7NrECeXeXisfjVVQFhFq96FJSlQRtNDpdrRcBtNZ0xl+8en0jWy7d
 38WNc/tGqyMXnOzaDN9RIP41tL/XtMKWkqZG5O3Ts6+ugMnMDe8f3DMht3nFnRbkMc9E
 ndSuLHLvrskgjTyDgJ8hHTTJo6rrW91dvtgcamLteqOgw2RSK9opG/vM/DnCL3KTqKys
 uXSIrfhKZOmt3MIaP5CFdVffUq08+rJr5c2UPLa+8DY6nTdP6xva/DxDqzYEAo0HJoqi
 nsDLawaakIY5TghEP4py2BwDAYrXZUcv5X/1M4hUR7T7RObvuSKekoHBaOXAVlngv16Y
 WgTQ==
X-Gm-Message-State: AC+VfDwIrNZZoND1MESuRbAorKZ2aCI+uH+jBUq+nxI1sfoj3sAW9418
 8RJ7N9ZClBUNV8HGgGspfCu7FGFYH0IuSDIxh3iAZNYM7G2ni4ZqxVAx2tSolyAvyCiRxYR69Cy
 /hNMF3HoALCBLnkE=
X-Received: by 2002:a05:600c:4444:b0:3f3:284d:8cec with SMTP id
 v4-20020a05600c444400b003f3284d8cecmr13053303wmn.2.1683736389761; 
 Wed, 10 May 2023 09:33:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7USHdH6ckDTlW5QaF0YbtTy+HmCdbfoX+zosueHwwXaQUHOeBSeTiJ5oh0bHDaruUELt600w==
X-Received: by 2002:a05:600c:4444:b0:3f3:284d:8cec with SMTP id
 v4-20020a05600c444400b003f3284d8cecmr13053291wmn.2.1683736389487; 
 Wed, 10 May 2023 09:33:09 -0700 (PDT)
Received: from redhat.com ([2.52.1.223]) by smtp.gmail.com with ESMTPSA id
 g22-20020a7bc4d6000000b003f049a42689sm22956670wmk.25.2023.05.10.09.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 09:33:08 -0700 (PDT)
Date: Wed, 10 May 2023 12:33:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Leonardo Bras <leobras@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/1] hw/pci: Disable PCI_ERR_UNCOR_MASK register for
 machine type < 8.0
Message-ID: <20230510123241-mutt-send-email-mst@kernel.org>
References: <20230503002701.854329-1-leobras@redhat.com>
 <aab782f3-5639-d7fc-5886-5deda5a18759@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aab782f3-5639-d7fc-5886-5deda5a18759@msgid.tls.msk.ru>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, May 10, 2023 at 07:29:40PM +0300, Michael Tokarev wrote:
> 03.05.2023 03:27, Leonardo Bras пишет:
> > Since it's implementation on v8.0.0-rc0, having the PCI_ERR_UNCOR_MASK
> > set for machine types < 8.0 will cause migration to fail if the target
> > QEMU version is < 8.0.0 :
> > 
> > qemu-system-x86_64: get_pci_config_device: Bad config data: i=0x10a read: 40 device: 0 cmask: ff wmask: 0 w1cmask:0
> > qemu-system-x86_64: Failed to load PCIDevice:config
> > qemu-system-x86_64: Failed to load e1000e:parent_obj
> > qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:02.0/e1000e'
> > qemu-system-x86_64: load of migration failed: Invalid argument
> > 
> > The above test migrated a 7.2 machine type from QEMU master to QEMU 7.2.0,
> > with this cmdline:
> > 
> > ./qemu-system-x86_64 -M pc-q35-7.2 [-incoming XXX]
> > 
> > In order to fix this, property x-pcie-err-unc-mask was introduced to
> > control when PCI_ERR_UNCOR_MASK is enabled. This property is enabled by
> > default, but is disabled if machine type <= 7.2.
> > 
> > Fixes: 010746ae1d ("hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register")
> > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> 
> It looks like 8.0-stable material to me, is it not?
> 
> /mjt

Good point. Feel free to CC stable.


