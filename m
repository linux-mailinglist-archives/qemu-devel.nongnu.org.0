Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7636FC878
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:03:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwNuq-0005ZB-4p; Tue, 09 May 2023 10:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pwNun-0005YX-Ur
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:02:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pwNum-0000IP-Gp
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683640922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p2yDuC5O24uoO1UAiaGgVCDn/1NbyZpttR3+IHGZ8bA=;
 b=LDwl+ae072z8dq/+UuswPLlSMTQA38k3GPi9nYargvNtzuJwUGchCe+g3/FEtvQGS0wFjA
 zUZWd+2uofX7sUSAgq2utvf8RPPbPJwnh68jff0f193/zgjizD0jHhY4WmY9vu5ffN6HsB
 zob322Gt0Wp+MO0EtJOu+yv3iXphRYc=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-8ZdGI2zRNveYkpURXDs6bw-1; Tue, 09 May 2023 10:01:58 -0400
X-MC-Unique: 8ZdGI2zRNveYkpURXDs6bw-1
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-517bf80f491so82023a12.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683640916; x=1686232916;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p2yDuC5O24uoO1UAiaGgVCDn/1NbyZpttR3+IHGZ8bA=;
 b=Yuf8cbQo8a1vzQZMsqxdFpp1jLrpofC4RE0b5juNNpefmGlQE89/L82cn6zwcR+C/i
 f6wqR5B9SyUQ7UmRAFAz4CKQ9KHLJxw7L0InNMbBhzjLM2LQpXdv0PDPkUXDryT9u8Am
 MjNcRhJGBjRX/F3/UTf0mx/V4xEegFRAk0gnzKgVuqN+4VK+WemR+Ob3qu3NkxwFjvq5
 I2LsSiV7mENd//RaKXaVWqPC7WboznaUfUeAgerB+PlMBpNw8OyThog0g9xsyZTr/hZv
 0S1lw0uInmkO6XzM/Onc9jVv6S7Hk4DtL0aVLVas4U8KOxGZTlCEzS38ilHCOcjPjhKs
 qxIA==
X-Gm-Message-State: AC+VfDwmBmf82KJ20YrrSoHJhFWUeQ4HvO1FTdMdLOHBKCOvdMqrPOn2
 s/dzbSookp7QwlErL3eB3XQQYpyiQ6bkdbJXjSFmKBjKKkrSD0HTLfskAWRhuNruLApdcYwkKVV
 R+u5Mp9tvs9pvaXM=
X-Received: by 2002:a17:90a:186:b0:247:9e56:d895 with SMTP id
 6-20020a17090a018600b002479e56d895mr12119300pjc.1.1683640915673; 
 Tue, 09 May 2023 07:01:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4bkAr/5RttiaZqofd/yCd41t0EW5yH8RY2MFAYckmWB0d6sHYFpRj/OL5vnbIoT5TC6Bx+Mg==
X-Received: by 2002:a17:90a:186:b0:247:9e56:d895 with SMTP id
 6-20020a17090a018600b002479e56d895mr12119263pjc.1.1683640915242; 
 Tue, 09 May 2023 07:01:55 -0700 (PDT)
Received: from x1n ([64.114.255.114]) by smtp.gmail.com with ESMTPSA id
 d6-20020a17090ad3c600b002501908faffsm8809847pjw.36.2023.05.09.07.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 07:01:54 -0700 (PDT)
Date: Tue, 9 May 2023 07:01:53 -0700
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/1] hw/pci: Disable PCI_ERR_UNCOR_MASK register for
 machine type < 8.0
Message-ID: <ZFpSUXZIHU0F3yey@x1n>
References: <20230503002701.854329-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230503002701.854329-1-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

Since this one blocks mostly all backward migration for current master and
all the downstream trees, shall we consider pick it up sooner?

And I think we should make sure qemu-stable gets this too, I'm not pretty
sure how we normally do that and whether we need explicit CC: to stable
list, perhaps not..

Thanks!

-- 
Peter Xu


