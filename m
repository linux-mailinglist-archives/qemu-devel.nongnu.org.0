Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F17578537
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:21:17 +0200 (CEST)
Received: from localhost ([::1]:51216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRca-0003Gv-Fu
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRFB-0006ZH-JS
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:57:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRF8-00030w-KB
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658152621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3TcdkAH2y3hXIcyp4Vue32Tw3+lFPZ90W7VEIp5PUIM=;
 b=G3Rmz1RptlHZGEyRXM1hMqgWk5V1/Ml+LOqwFZWdziW26GT2+GyAIUaP93uPzt5paPy6QW
 YknhDSDxF/HyMVl3p0svOvsdN8YBOF6sqGm+psfEHgz47gIu9YdOJdTu5BHI+gM1nWE3bE
 SjaXR5jpkMC2SKvzf8gu1RK4M1OS4/M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-sLD38LJuObiLugTC5-Bh5w-1; Mon, 18 Jul 2022 09:57:00 -0400
X-MC-Unique: sLD38LJuObiLugTC5-Bh5w-1
Received: by mail-ej1-f69.google.com with SMTP id
 s4-20020a170906500400b006feaccb3a0eso2318494ejj.11
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3TcdkAH2y3hXIcyp4Vue32Tw3+lFPZ90W7VEIp5PUIM=;
 b=b/64FCiGt/+TTt67q2iazkmNvv6VjOsaJsWL5oRho5Y8CwvMrtz2/SBJATvPc5l3E0
 q6IK/j3EAUGUJisGgA3LaMk+oEXd4f6Lraz/It/oKbhLYZIhPGLot2hDXXErqffzveZE
 gNkg+NGc2RU60Y9484J/EXoeoOTESk5xSAZs8/mKbpz3In1kSpRZJLp2bqoSX3Y/ZsfT
 EXiNFIHJBcuYmRyeUaLKFCf2syMDEebtGGN2Nq8SwYYI/yd9qEjfFaYFGGF1mv/n4lOv
 M7Cxxpdi5B5tazCZefOJoyPspbJyVHUXcv9Tvarn6XYYoDcroygf2k/hFtiumLL+SuIA
 031Q==
X-Gm-Message-State: AJIora9o8hLvNQrgLAJGtC7zc8UmVnTKu/S8W4a7+iUx/7QJQ8lJvuWe
 3tKwi0I9wuBsmO2QRU11jF3VUvpwfpNPQ4AkfxQyVH9PKlrH8lQHiQVNPD3sysrkiiijOkt66/Z
 JuWZbhLfDNld/6TA=
X-Received: by 2002:a05:6402:51ca:b0:43a:df65:d180 with SMTP id
 r10-20020a05640251ca00b0043adf65d180mr37531889edd.255.1658152619168; 
 Mon, 18 Jul 2022 06:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vEd8nRU8dqSVcXOJEC+HQNYtXA0Rov9+AKbfMPUdl6yz7pMkegYS+RPy/goDyMu1h4Fe5dIw==
X-Received: by 2002:a05:6402:51ca:b0:43a:df65:d180 with SMTP id
 r10-20020a05640251ca00b0043adf65d180mr37531856edd.255.1658152618937; 
 Mon, 18 Jul 2022 06:56:58 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a17090604c100b0072afb6d4d6fsm5637627eja.171.2022.07.18.06.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:56:58 -0700 (PDT)
Date: Mon, 18 Jul 2022 15:56:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v8 09/11] i386/pc: bounds check phys-bits against max
 used GPA
Message-ID: <20220718155657.5f975c50@redhat.com>
In-Reply-To: <20220718151622.3c38f261@redhat.com>
References: <20220715171628.21437-1-joao.m.martins@oracle.com>
 <20220715171628.21437-10-joao.m.martins@oracle.com>
 <20220718151622.3c38f261@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Mon, 18 Jul 2022 15:16:22 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Fri, 15 Jul 2022 18:16:26 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
> > Calculate max *used* GPA against the CPU maximum possible address
> > and error out if the former surprasses the latter. This ensures
> > max used GPA is reacheable by configured phys-bits. Default phys-bits
> > on Qemu is TCG_PHYS_ADDR_BITS (40) which is enough for the CPU to
> > address 1Tb (0xff ffff ffff) or 1010G (0xfc ffff ffff) in AMD hosts
> > with IOMMU.
> > 
> > This is preparation for AMD guests with >1010G, where it will want relocate
> > ram-above-4g to be after 1Tb instead of 4G.
> > 
> > Signed-off-by: Joao Martins <joao.m.martins@oracle.com>  
> 
> Acked-by: Igor Mammedov <imammedo@redhat.com>
[...]

> > +    return pc_pci_hole64_start() + pci_hole64_size - 1;

off by 1?

> > +}
> > +
[...]


