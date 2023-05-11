Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29926FF01F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 12:49:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px3qV-0000gv-Ik; Thu, 11 May 2023 06:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1px3qT-0000gG-6m
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:48:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1px3qR-0001om-89
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683802101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xKYraAuKyOO3qf9kXJegQyZ42mM3I1bxt7OCsn76K00=;
 b=BnmeXAAlwMyEV9HBLB/SXOblaSo6iz8hnbUfW0eBByNcuSftKLb2vqN3rFhvnW4j7mITYz
 vR5Vo/QZFro5eSONCCVRA7QZQqkn0Tm/i/O8joufLughZB32/tjHlaeMJ0H/EmON4SSmhA
 sDUcB3lfk+aYqqlNKUxgNEtVxzXtwic=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-1RSd6VUROs2vdC6YKvOKvA-1; Thu, 11 May 2023 06:48:20 -0400
X-MC-Unique: 1RSd6VUROs2vdC6YKvOKvA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-306362a1607so5126833f8f.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 03:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683802099; x=1686394099;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xKYraAuKyOO3qf9kXJegQyZ42mM3I1bxt7OCsn76K00=;
 b=JDJgzDgBufKYoVCYNKdicq2ZKS3np1vimRC8DkZAaNGwqY9FABn22cqac+XhuENhWp
 om5sfg74lx0FHA50kKP1sBMLFTredJASFmeurAC+1TR1uL+OsRs2JZuoktefFwxoUo07
 GvXrLH5kdYEbQZuLNC00SwyxzEabehh3D537klbR5TCpViEZZ+bXKUwjjY/ach6rSFl3
 nC8sFRcAcmdiXbKDvNeR1Ff0RF9QXAMAsATP0VA1qJ9lzaZpauMfahhVNAi15myQO+lA
 HVN5KaGbEpL/Yta4CoRs1evhGe0UNzUA7DehBXPw70kvI3gviO/zV8omKeNxXMJLcXuW
 OWzw==
X-Gm-Message-State: AC+VfDzjUuFmbcMvkwJXoq3Tk6sFMel9kPvaw2wQUzgP0D8ap6a1vY3K
 74dEj9wb6EzUg5Fx+5YEdUxHajNo9UsJntypsPxphc7ZhzHuy+9/psrD9fidcPF3UsYSLPqv/CJ
 AFJSrkpQVBLY0E5jbj8MObhc=
X-Received: by 2002:adf:fb06:0:b0:2f8:cb68:8203 with SMTP id
 c6-20020adffb06000000b002f8cb688203mr14453887wrr.0.1683802099438; 
 Thu, 11 May 2023 03:48:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5f3tstVUwTq5H5CIC2vMhcwM3ndeYc/T1LFvD/fWOf5RuX3AQ06kvks1/VaSklTBteAVokTQ==
X-Received: by 2002:adf:fb06:0:b0:2f8:cb68:8203 with SMTP id
 c6-20020adffb06000000b002f8cb688203mr14453871wrr.0.1683802099097; 
 Thu, 11 May 2023 03:48:19 -0700 (PDT)
Received: from redhat.com ([31.187.78.61]) by smtp.gmail.com with ESMTPSA id
 a24-20020a5d4578000000b003063938bf7bsm20191641wrc.86.2023.05.11.03.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 03:48:18 -0700 (PDT)
Date: Thu, 11 May 2023 06:48:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: Leonardo Bras <leobras@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/1] hw/pci: Disable PCI_ERR_UNCOR_MASK register for
 machine type < 8.0
Message-ID: <20230511064306-mutt-send-email-mst@kernel.org>
References: <20230503002701.854329-1-leobras@redhat.com>
 <7f308149-5495-d415-5e51-1fa15fc20f84@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f308149-5495-d415-5e51-1fa15fc20f84@proxmox.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, May 11, 2023 at 10:27:35AM +0200, Fiona Ebner wrote:
> Am 03.05.23 um 02:27 schrieb Leonardo Bras:
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
> Thank you for the patch!
> 
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/1576
> 
> AFAICT, this breaks (forward) migration from 8.0 to 8.0 + this patch
> when using machine type <= 7.2. That is because after this patch, when
> using machine type <= 7.2, the wmask for the register is not set and
> when 8.0 sends a nonzero value for the register, the error condition in
> get_pci_config_device() will trigger again.
> 
> Is it necessary to also handle that? Maybe by special casing the error
> condition in get_pci_config_device() to be prepared to accept such a
> stream from 8.0?
> 
> If that is considered not worth it, consider this:
> 
> Tested-by: Fiona Ebner <f.ebner@proxmox.com>
> 
> Best Regards,
> Fiona

Yes any fix is like that. We keep encountering bugs like this
but there does not seem to be will to create infrastructure
for fixing it, which would involve describing
version of qemu being migrated to.

-- 
MST


