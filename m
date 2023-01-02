Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD4665B057
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 12:13:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCIjb-0004Ph-HL; Mon, 02 Jan 2023 06:12:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pCIjZ-0004PG-4R
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:12:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pCIjX-0005WZ-4h
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672657917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fiJ3JeY3DZH1QGAPckdlcCvotyDT4BcfHg/xG3h7YOM=;
 b=ixbAIB31M3LIFkrd1/JBJWrKPgPqXQjPtcIqrfCE8BFC4Oy5Q5ni+CcU5HvYsjN/j+AOjo
 FtlCAGWOG8m4aTB9qJ77fAXLReUfz4dby5rZqbbdsH16/A3KmyX8+HlBDxp5hZR/aP4+hD
 dOSTXel/KTvGPoQd17nVjDs7qzorAd0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-Uk9XEoYHOFiq1dj-1XoxxA-1; Mon, 02 Jan 2023 06:11:54 -0500
X-MC-Unique: Uk9XEoYHOFiq1dj-1XoxxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 995473C01DE3;
 Mon,  2 Jan 2023 11:11:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F8EC140EBF5;
 Mon,  2 Jan 2023 11:11:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A9A9418003B9; Mon,  2 Jan 2023 12:11:50 +0100 (CET)
Date: Mon, 2 Jan 2023 12:11:50 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Xiang Zheng <zhengxiang9@huawei.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Markus Armbruster <armbru@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>
Subject: Re: [PATCH v2] pflash: Only read non-zero parts of backend image
Message-ID: <20230102111150.yd7jv56tp63znbgt@sirius.home.kraxel.org>
References: <20221220084246.1984871-1-kraxel@redhat.com>
 <a31967f6-6de5-bed2-8a1a-68a909850dd5@linaro.org>
 <20221220153301.ku3zxwglhxepet6i@sirius.home.kraxel.org>
 <CAMj1kXF=SNeK6fSgo0821XF+dgs-i__bEoUwvJsDRCtpixsTsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXF=SNeK6fSgo0821XF+dgs-i__bEoUwvJsDRCtpixsTsg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

> > Moving away from pflash for efi variable storage would cause alot of
> > churn through the whole stack.  firmware, qemu, libvirt, upper
> > management, all affected.  Is that worth the trouble?  Using pflash
> > isn't that much of a problem IMHO.
> 
> Agreed. pflash is a bit clunky but not a huge problem atm (although
> setting up and tearing down the r/o memslot for every read resp. write
> results in some performance issues under kvm/arm64)
> 
> *If* we decide to replace it, I would suggest an emulated ROM for the
> executable image (without any emulated programming facility
> whatsoever)

Sure.

> and a paravirtualized get/setvariable interface which can
> be used in a sane way to virtualize secure boot without having to
> emulate SMM or other secure world firmware interfaces.

Suggestions how to do that best?  The only option I can see is moving
the variable policy processing to the host, so any variable update
requests are checked even in case the guest OS bypasses the firmware
(which it can easily do when we don't have SMM mode to restrict access
to the paravirtual efi variable service device).

take care,
  Gerd


