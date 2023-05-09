Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A856FCA4B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:33:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPKD-0005ym-NO; Tue, 09 May 2023 11:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwPKC-0005yd-5U
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:32:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwPKA-0002Qa-Nw
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683646342;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Nyzdg0tNiWJue4vmGobUl75yV1q86UANlTD/HvK73yQ=;
 b=RJIiGgg1mfz80VtefX28IyaKBBCeptNsQ7yE3Rv+CoRTCDfETYictVwsyaq0F2z0g4+dD2
 RYhAdkOP/oPltETt3/YqvYSQ52O6ikXSDRECKwF5OPiMW8iwsj5IdJsoP5MGmtnHGYDT2Z
 oVd7/TVlYBbDXH0nXGMF7UIoj2sE+4w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-At76yWQgMeSbU9GyYLFpPA-1; Tue, 09 May 2023 11:32:20 -0400
X-MC-Unique: At76yWQgMeSbU9GyYLFpPA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f420742d40so12330225e9.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 08:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683646339; x=1686238339;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nyzdg0tNiWJue4vmGobUl75yV1q86UANlTD/HvK73yQ=;
 b=Fc8Apo+E6+lE5N9qMvJ+AaNhjoIK9lh0DrZTLzrvGVHuT2c7vKjYvYZzzZfq1jiIuu
 9+rwDRh2nabr8PUg8ZGcpTqFu6u2u5XykEcAaDxXhO/HLx+pW+QXH8A+hfypxFW1hjsC
 NgK1wSVtINZXGPLjt8EKjrg0p03mFtAQsGIsnhE1ZVBSRuif/8AI2tbRgBVOv/5W3Vu3
 +FsafAZk9ubvCIii9QPR/aBoryCvIST7t4vaD6mp95IHhOasaekDPSNFbd5IyPWjSG/4
 rjSdhkGhwhadQTGTfvzbfPTslN85wrNp/zeoCad1JlSly6eKpp/lTR3pPMng56ZBz2bT
 UnWA==
X-Gm-Message-State: AC+VfDxMWuC7uTmo10UYIYklvetpo8G+1fVbRQ/U32CA6UVN0CtUCTHa
 ApW+7lWJ05ZaICl9ZXtew46v4zQW6y66hwPXfQlztxRkTC8Xj+wQVSdF+FKDVXaEfxDmNVrjxnB
 cqkplAcxXfpVbVCc=
X-Received: by 2002:adf:f191:0:b0:306:39f5:afd0 with SMTP id
 h17-20020adff191000000b0030639f5afd0mr11009097wro.21.1683646339676; 
 Tue, 09 May 2023 08:32:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ77gu/6+eJRXQGIOx7nhpKmCYZj11QEICSdJBvHF61oPQgljKpK14Z0EiFMVqSX+ULvDBXdGQ==
X-Received: by 2002:adf:f191:0:b0:306:39f5:afd0 with SMTP id
 h17-20020adff191000000b0030639f5afd0mr11009080wro.21.1683646339391; 
 Tue, 09 May 2023 08:32:19 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 e13-20020a5d65cd000000b0030789698eebsm11078823wrw.89.2023.05.09.08.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 08:32:18 -0700 (PDT)
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
Date: Tue, 09 May 2023 17:32:17 +0200
Message-ID: <87lehxcygu.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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


