Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4486F4C63ED
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 08:45:32 +0100 (CET)
Received: from localhost ([::1]:55004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOaip-0005Tf-8h
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 02:45:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nOadZ-0003Om-R8
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:40:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nOadY-0004nB-2H
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646034003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SMrkXwh5KB5/1HGaTUCtLFcKOkBGRyUZUSggM8u559E=;
 b=hzp+gwqPhkSRiTo1crM9nNV+wQubACVXC7Z+EX0cOv0yLSccepnKO6+uCxlTlTHDoIPurt
 IA8QvNvy6A3ER4Yn5jJmWzrsTPnTmm6W212K9BaLllvizD2/Re1m9xG24x1I8O596oVm0/
 6wKGj8uSzps/ikXp+fD246Alq1NNQ+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-dm0yUrt1N5G9UgERzrCifQ-1; Mon, 28 Feb 2022 02:40:00 -0500
X-MC-Unique: dm0yUrt1N5G9UgERzrCifQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6F271091DA0
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 07:39:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A04A727BCF;
 Mon, 28 Feb 2022 07:39:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 98DCA1800393; Mon, 28 Feb 2022 08:39:57 +0100 (CET)
Date: Mon, 28 Feb 2022 08:39:57 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 2/4] pcie: update slot power status only is power control
 is enabled
Message-ID: <20220228073957.e7izpppvu4in6fr4@sirius.home.kraxel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
 <20220224174411.3296848-3-imammedo@redhat.com>
 <20220225101259.begp7wy5o3jlafcf@sirius.home.kraxel.org>
 <20220225140231.16c13306@redhat.com>
 <20220225080628-mutt-send-email-mst@kernel.org>
 <20220225143528.3510dc98@redhat.com>
 <20220225084140-mutt-send-email-mst@kernel.org>
 <20220225163917.7519454f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220225163917.7519454f@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,
 
> This where I wasn't comfortable with idea of calling random PCIe code
> chunks and thought about chaining callbacks so that
> pcie_cap_slot_[pre_]plug_cb() would do necessary PCIe steps
> and acpi_pcihp_device_[pre_]plug_cb() do ACPI specific things not
> intruding on each other, but that requires telling PCIe code that
> it should not issue native hotplug event to guest.

I think with both acpi and pcie hotplug being active it surely makes
sense that both are in sync when it comes to device state.  So acpihp
updating pcie slot state (power control, maybe also device presence)
looks sane to me.

Not sure whenever it would be better to call into pcie code or just
update the pci config space bits directly to make sure pcie doesn't
take unwanted actions like sending out events.

take care,
  Gerd


