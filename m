Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4C16F5C7E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 19:05:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puFtl-0004kM-EN; Wed, 03 May 2023 13:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puFth-0004jr-DM
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:04:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puFtf-0002CO-G6
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683133446;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Nyzdg0tNiWJue4vmGobUl75yV1q86UANlTD/HvK73yQ=;
 b=WvBulrbwnSPJSnreqQ3XCho/ilxM+1DSYa8wDCsp09UOZw9XD9TJvs+aUYiZke2mvyK7SA
 f2JPf8YSTaqgQhDjK0cloIyXRdyC4e12j8Hvw3jpjoe4Htuhpf0EA67qKNUhR8BIqj0Eg9
 6teKdcL2wkTXzJWLQobG03LHM7cHDUc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-QbB9owv5PQaEbHZP3EY3mQ-1; Wed, 03 May 2023 13:04:04 -0400
X-MC-Unique: QbB9owv5PQaEbHZP3EY3mQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f1754de18cso33457235e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 10:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683133443; x=1685725443;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nyzdg0tNiWJue4vmGobUl75yV1q86UANlTD/HvK73yQ=;
 b=XdDoSJ8r5vhRSiPBH8QUICVFD7nrQ06TRF/NG7LJMFFEFXgEj91bje+fJ0b/6pJQbz
 2Y783gIlb6iirZVrMu3dbKQIPgaQpYtHkP6/poG3SYXsTTbEkjj5Wp+I4d6odMecekfh
 7HjsjdTTby4FbXOIngc62S1N4Y1tRsniOvzqtldxJyctlf3CDLlu3lw4/2NRQb45Vgzt
 KEj65SOqYMTRLXMl9+pnJpMRSwT1HUggC6ncA/WJnh43tp0VXch6bCAv95E9qwHWpvA8
 9v8xfYioEL4Advr6d9nkcXPHLIS3wYKkWQhAMqF4MJURxpVFvNd7/EtI4SAkXqFhpZ0G
 tI7A==
X-Gm-Message-State: AC+VfDyMS3yC1GD2KqkjlmUFr+nIXdcnNB/vupNOwND4ovqCI06RG2lQ
 Weel0NuKQ71vXp2Ch+LEGofaIxuERWAkCr56W8LGnwtSyhgvDupYnhduJ6X9VfRaSQ4Ju86YuUP
 Ty+GfjNPLyDLXFvU=
X-Received: by 2002:a7b:cb0d:0:b0:3f3:468d:d00f with SMTP id
 u13-20020a7bcb0d000000b003f3468dd00fmr4340090wmj.20.1683133442906; 
 Wed, 03 May 2023 10:04:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4RRq1AMq+DNVIFvaBePUZ217tFvS7iCHakCnTKDIDQY7xrC2/bATSV9HwPsOVvFZlSpe9xEQ==
X-Received: by 2002:a7b:cb0d:0:b0:3f3:468d:d00f with SMTP id
 u13-20020a7bcb0d000000b003f3468dd00fmr4340069wmj.20.1683133442621; 
 Wed, 03 May 2023 10:04:02 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 x2-20020a05600c21c200b003f182c11667sm2427782wmj.39.2023.05.03.10.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 10:04:02 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Peter Xu <peterx@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/1] hw/pci: Disable PCI_ERR_UNCOR_MASK register for
 machine type < 8.0
In-Reply-To: <20230503002701.854329-1-leobras@redhat.com> (Leonardo Bras's
 message of "Tue, 2 May 2023 21:27:02 -0300")
References: <20230503002701.854329-1-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 03 May 2023 19:04:01 +0200
Message-ID: <87fs8dqrcu.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Leonardo Bras <leobras@redhat.com> wrote:
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

Reviewed-by: Juan Quintela <quintela@redhat.com>


