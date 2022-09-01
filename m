Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2615A9994
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 15:59:33 +0200 (CEST)
Received: from localhost ([::1]:37098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTkjE-0004Ow-2l
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 09:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oTki5-0002w4-SL
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 09:58:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oTki2-000114-QK
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 09:58:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662040696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WiIx364gIjS2z7dRJE0nKaQQ0mHqcrR06/I23IKZLlc=;
 b=gTYpsTV070VwHnGpnPSERx4C1wSz9g2QPe5BEePTPnTbUGURd1SINsl2oMMW6vcdA+kvvD
 Exos1tcrGX1KFNVPf3LbtkJ4APXt/BW5a2xQSISnJ/OQcAyeFNXDVWILssmYaQDZgG3TL0
 VstjzPEpWuPJa2yH2EUciSTgf0h9lCM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-9a07oUgfMoKlFcVWOgok8g-1; Thu, 01 Sep 2022 09:58:13 -0400
X-MC-Unique: 9a07oUgfMoKlFcVWOgok8g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6A1E1C004E4;
 Thu,  1 Sep 2022 13:58:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68A10492C3B;
 Thu,  1 Sep 2022 13:58:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B9E6518003AA; Thu,  1 Sep 2022 15:58:10 +0200 (CEST)
Date: Thu, 1 Sep 2022 15:58:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH 0/2] expose host-phys-bits to guest
Message-ID: <20220901135810.6dicz4grhz7ye2u7@sirius.home.kraxel.org>
References: <20220831125059.170032-1-kraxel@redhat.com>
 <957f0cc5-6887-3861-2b80-69a8c7cdd098@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <957f0cc5-6887-3861-2b80-69a8c7cdd098@intel.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

  Hi,

> I think the problem is for all the named CPU model, that they don't have
> phys_bits defined. Thus they all have "cpu->phys-bits == 0", which leads to
> cpu->phys_bits = TCG_PHYS_ADDR_BITS (36 for 32-bits build and 40 for 64-bits
> build)

Exactly.  And if you run on hardware with phys-bits being 36 or 39
(common for intel desktop processors) things explode when the guest
tries to use the whole range.

> Anyway, IMO, guest including guest firmware, should always consult from
> CPUID leaf 0x80000008 for physical address length.

It simply can't for the reason outlined above.  Even if we fix qemu
today that doesn't solve the problem for the firmware because we want
backward compatibility with older qemu versions.  Thats why I want the
extra bit which essentially says "CPUID leaf 0x80000008 actually works".

take care,
  Gerd


