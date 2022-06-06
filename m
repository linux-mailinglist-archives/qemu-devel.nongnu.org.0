Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0855A53ED00
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 19:28:34 +0200 (CEST)
Received: from localhost ([::1]:52732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyGWm-0000rO-Kx
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 13:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bwidawsk@kernel.org>)
 id 1nyGTQ-0007bC-Tg
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 13:25:04 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:58504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bwidawsk@kernel.org>)
 id 1nyGTN-0003Mf-E9
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 13:25:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6EAC6B817F2;
 Mon,  6 Jun 2022 17:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C288CC385A9;
 Mon,  6 Jun 2022 17:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654536287;
 bh=ZKigrDV9GJ7ivjkl9RUM+ZJF/2JYghwt9WdQwFyKVXc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P36W+fagZYH8k3WHNuyv3UhXegsE6hjqE9rwj30Ce9QO/8S2wzcRIGOH/domgTq7y
 brqLF4T1NULqWdD/TG3g3z2v+Bse81G8SEXUXjbnhgUO1ltuLm4ZEC83PpVuKDw0Rs
 stioBLHOoivA/GR3Yo7xJ7xMDLNKU/VnkXIwcJs18SHsaLjpXzWWH8/i3SNqiGgk3f
 a5JxROb/ZWrPXxUwNqqMapaJwUTTfT3vtM1a5xPfmiALH7qYMJw0VD05Rw4QBrbgoY
 HIgXLyJ3dWih3ioPc/WiYlzKjnF7Ha+YLKWjovhIe5EUdrQDaaA7KtCukJ4TmhzR63
 LpM5emRiZJ5OA==
Date: Mon, 6 Jun 2022 10:24:43 -0700
From: Ben Widawsky <bwidawsk@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, alex.bennee@linaro.org,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Adam Manzanares <a.manzanares@samsung.com>,
 Tong Zhang <ztong0001@gmail.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH 1/8] hw/cxl: Make the CXL fixed memory window setup a
 machine parameter.
Message-ID: <20220606172338.3g6rb6qft4o5cu2o@bwidawsk-mobl5>
References: <20220530134514.31664-1-Jonathan.Cameron@huawei.com>
 <20220530134514.31664-2-Jonathan.Cameron@huawei.com>
 <cdb07cb9-4705-5b63-4f40-a44a6f735f38@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdb07cb9-4705-5b63-4f40-a44a6f735f38@redhat.com>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=bwidawsk@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 22-05-31 09:26:27, Paolo Bonzini wrote:
> On 5/30/22 15:45, Jonathan Cameron via wrote:
> > +    object_property_add(obj, "cxl-fmw", "CXLFixedMemoryWindow",
> > +                        machine_get_cfmw, machine_set_cfmw,
> > +                        NULL, state);
> > +    object_property_set_description(obj, "cxl-fmw",
> > +                                    "CXL Fixed Memory Window");
> 
> Perhaps "CML fixed memory windows (array)" or something like that?
> 
> Paolo

I had a mail which I apparently never sent. I'd like to see 'fmw' renamed, since
that has no decoder ring in any spec that I'm aware of.

Why not keep cfmws nomenclature? It's well defined.

Ben

