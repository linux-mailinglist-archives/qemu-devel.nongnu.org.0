Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E4D38FDC3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 11:26:24 +0200 (CEST)
Received: from localhost ([::1]:38966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llTKR-0003uw-CJ
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 05:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1llTIv-00038c-Dn
 for qemu-devel@nongnu.org; Tue, 25 May 2021 05:24:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1llTIs-00033Y-Ok
 for qemu-devel@nongnu.org; Tue, 25 May 2021 05:24:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621934684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o3IhBA5cdt5GXNvjYO7k3l+sVlEQx4vvWsz/aS5i2nE=;
 b=T4OSL+ejbPeAHPTrRzrxS4geEHmcAINwp1MX7pVzlBk7qnt4aRIPFy/ZeFD5g5gxzZ0WC3
 UItmEHp/4BjLzNG7u1T4on76qd+98Cr8po96/cam452abN0q3gg3KGS+IjxIE05fjvVMHF
 t5t9PqoOXPn0/Nn7ArDKj5Ia5vc1chU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-MtvR4aCHML2ArSchEEKv1A-1; Tue, 25 May 2021 05:24:42 -0400
X-MC-Unique: MtvR4aCHML2ArSchEEKv1A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0156C8042BC;
 Tue, 25 May 2021 09:24:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1ED62ED8D;
 Tue, 25 May 2021 09:24:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 436C718000A0; Tue, 25 May 2021 11:24:40 +0200 (CEST)
Date: Tue, 25 May 2021 11:24:40 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v5 03/13] virtio-gpu: Add udmabuf helpers
Message-ID: <20210525092440.u5m6565imc64sath@sirius.home.kraxel.org>
References: <20210519001414.786439-1-vivek.kasireddy@intel.com>
 <20210519001414.786439-4-vivek.kasireddy@intel.com>
 <20210519061339.dq4yfrc7j42jdj5g@sirius.home.kraxel.org>
 <3c23985ffb484236a3e29682585cc366@intel.com>
MIME-Version: 1.0
In-Reply-To: <3c23985ffb484236a3e29682585cc366@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> [Kasireddy, Vivek] Gave it a try but because of res->image, we'd need to consider the
> Pixman dependency. I think we have the following options to address this:
> 1) Add pixman dependency to stubs. This may not be acceptable given that the other
> dependencies are glib, socket, etc which are pretty basic.

res->image is a pointer not an embedded struct so this could be handled
without requiring pixman.

Beside that pixman is a core dependency for system emulation, so a
pixman dependency in stubs should not cause any trouble either.

take care,
  Gerd


