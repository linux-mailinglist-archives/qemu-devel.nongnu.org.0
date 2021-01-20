Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9655C2FD164
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 14:47:26 +0100 (CET)
Received: from localhost ([::1]:55750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2DpV-0003cN-MN
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 08:47:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2Dly-0001rx-On
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:43:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2Dlx-0000g6-BY
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611150224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YgXZ5MAnxDSLnEk3RRDb8LxCEn0dB4JXxfrp6fa1GYU=;
 b=fqdfFMzBB2afFNnwYdIJcO3X3PrODE7are3AvTcww+C4eACUZYqMV9UBY+4gT//KC9iea9
 LZpf/ck9H2AtSi73c8Yr2DbBeLvlJrPOU9aTzaYlWqL6UD9XpB1mIdvNyuDHhFmNoyrf9X
 L7XNl0pBcXa55Cn7zFcTXRK3nFhEScc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448--0aTaGLjMhWaVtMP8IQECQ-1; Wed, 20 Jan 2021 08:43:43 -0500
X-MC-Unique: -0aTaGLjMhWaVtMP8IQECQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08B5ACE648;
 Wed, 20 Jan 2021 13:43:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEA145D74A;
 Wed, 20 Jan 2021 13:43:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D9978180062C; Wed, 20 Jan 2021 14:43:39 +0100 (CET)
Date: Wed, 20 Jan 2021 14:43:39 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Yan Vugenfirer <yvugenfi@redhat.com>
Subject: Re: [PATCH 2/4] hw/misc/pvpanic: add PCI interface support
Message-ID: <20210120134339.h42o3j7utjveeiey@sirius.home.kraxel.org>
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
 <1610735646-13313-3-git-send-email-mihai.carabas@oracle.com>
 <FC7156A5-361B-4009-983A-91118F29995A@redhat.com>
MIME-Version: 1.0
In-Reply-To: <FC7156A5-361B-4009-983A-91118F29995A@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Mihai Carabas <mihai.carabas@oracle.com>, peter.maydell@linaro.org,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > +    pc->realize = pvpanic_pci_realizefn;
> > +    pc->vendor_id = PCI_VENDOR_ID_REDHAT;
> > +    pc->device_id = PCI_DEVICE_ID_REDHAT_PVPANIC;
> 
> Please fill out subsystem and subsystem vendor IDs as well:
> pc->subsystem_vendor_id
> pc->subsystem_id 

Not needed, when left blank they are set to the default
qemu subsystem id (1af4:1100) by the pci core.

take care,
  Gerd


