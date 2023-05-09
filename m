Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0A86FC7E5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 15:30:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwNPr-0002Pj-UX; Tue, 09 May 2023 09:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pwNPp-0002PX-Jf
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:30:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pwNPn-0001Cl-RM
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:30:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683639002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=29OFH2CreJKYkMUAMtHXYKr7NjIyYCgIoTC84mE9uhE=;
 b=cZnk1/gWyxPxqj8/5QEUuxzUwLrORkLfsV40oGUw2GR4aHgCDrBVK8gQuD7GxIExSuxJMx
 gme2dTCfCeaCEUHH1SzbnyfIksziQLAfmJcWmqNkCBuuuklOx3Ui5z+qKPvgRfU4T4lEVU
 wpKA8IZLp4cHlTNLBleULaMV+oakUDg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-FkYfTupSPw6dwh1CHMCSTg-1; Tue, 09 May 2023 09:29:56 -0400
X-MC-Unique: FkYfTupSPw6dwh1CHMCSTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 535F2885621;
 Tue,  9 May 2023 13:29:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D241CC164E7;
 Tue,  9 May 2023 13:29:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6710518000A6; Tue,  9 May 2023 15:29:52 +0200 (CEST)
Date: Tue, 9 May 2023 15:29:52 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Yuquan Wang <wangyuquan1236@phytium.com.cn>, qemu-arm@nongnu.org, 
 rad@semihalf.com, quic_llindhol@quicinc.com, 
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: Problem of initialization of platform-ehci-usb in sbsa-ref
Message-ID: <e4ljd7cckcoe5s3cphztjjqacswssjkap3l3dtre22rtew64kq@cbo7oi7s4wow>
References: <11bf324.342.187b3418349.Coremail.wangyuquan1236@phytium.com.cn>
 <CAFEAcA9pa+uHGk34uCGX1ZHiCBDeDHXFLDFyVDAVvDxQScEChg@mail.gmail.com>
 <70009a13.15f.187bc308951.Coremail.wangyuquan1236@phytium.com.cn>
 <CAFEAcA-jZBiSL8vNzgcwUT2Lqtgf9JyyaQx7kD4j=Tc9neD_OQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-jZBiSL8vNzgcwUT2Lqtgf9JyyaQx7kD4j=Tc9neD_OQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  Hi,

> Gerd, is there a particular reason our EHCI controller only
> claims to be able to do 32-bit DMA ? Should we give it a QOM
> property so boards that only have RAM above the 4GB mark can
> use it ? (Would the x86 PC benefit from allowing >4GB DMA?)

Can be done, but it's more complex than just a property.  All
the EHCI descriptors exist in two variants, one for 32bit and
one for 64bit.  The current code base only supports the 32bit
versions.

Alternatives:
  (a) use an iommu to map 32bit to 64bit dma addresses.
  (b) use xhci instead of ehci.

I'd recommend (b) as the xhci hardware design is much more
virtualization-friendly.

take care,
  Gerd


