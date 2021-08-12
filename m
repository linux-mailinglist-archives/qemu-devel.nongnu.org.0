Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A7C3EA34D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 13:08:46 +0200 (CEST)
Received: from localhost ([::1]:45820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE8Zp-0003T5-1o
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 07:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mE8YO-00022U-9X
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:07:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mE8YL-0003eJ-J6
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628766431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jzKfwVeazv3ZaZAtC71CaGkZVfhk+peiWZYJlSZa/8w=;
 b=GKcr4VFrM5dP+QiWqg0TbQMBidR4U748I2nTUxOB9hhp1nw+Km9euaBihcuEa5cy07Elhy
 u9gbaUZEgk9qxOuiau/fdleQA6VZDxb0dVj++o8PBiprpRnQLVaQTbLs3NunVeWGuViAb0
 cehEFLnkn+aYemu7r1UOILJS4Q3JPP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-RubxWN5qOVaMgCx5I4zyQw-1; Thu, 12 Aug 2021 07:07:09 -0400
X-MC-Unique: RubxWN5qOVaMgCx5I4zyQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B063D1853024
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 11:07:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 460601ACBB;
 Thu, 12 Aug 2021 11:07:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 24F351800922; Thu, 12 Aug 2021 13:07:00 +0200 (CEST)
Date: Thu, 12 Aug 2021 13:07:00 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH] q35: catch invalid cpu hotplug configuration
Message-ID: <20210812110700.7n7uxm7gen2n7rvh@sirius.home.kraxel.org>
References: <20210812102341.3316254-1-kraxel@redhat.com>
 <YRT33VufWIrhaS6j@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YRT33VufWIrhaS6j@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

> > +    if ((lpc->smi_host_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT)) &&
> > +        !(lpc->smi_host_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT))) {
> > +        /*
> > +         * smi_features_ok_callback() throws an error on this.
> > +         *
> > +         * So bail out here instead of advertizing the invalid
> > +         * configuration and get obscure firmware failures from that.
> > +         */
> > +        error_setg(errp, "cpu hot-unplug requires cpu hot-plug");
> > +        return;
> > +    }
> 
> What does this actually mean in practice ? AFAIK from the libvirt side
> we don't do anything special to enable/disable CPU hotplug. What QEMU
> config setting is wrong to lead to this scenario, thta the user/mgmt
> app has to fix ?

It's ICH9-LPC.x-smi-cpu-{hotplug,hotunplug}.  user/mgmt should not mess
with that, but given it is possible I think printing an error is better
than going for an assert().

If this triggers it is most likely qemu getting compat properties wrong.

Full story at https://bugzilla.redhat.com/show_bug.cgi?id=1985924 ;)

take care,
  Gerd


