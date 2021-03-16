Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F8B33D4ED
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 14:35:26 +0100 (CET)
Received: from localhost ([::1]:34320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM9r3-0004WW-Tk
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 09:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM9oL-0003WL-BL
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:32:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM9oI-0004ul-UM
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:32:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615901554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CMAGhXNU63z76UyJ6LzWJbdBgoW68qvFfQq61HOLqds=;
 b=Gcg67qM93mtkj5mYXkCSatkBSZHeqNm2wVcJFfFmOwV9pThT0r+pJzB23sq7gYsHbzIbnt
 4Q64j1zvwMnd0Dkdv48squ5QwZ3G2h9NrTDZEx0IT2k3mXz4ngp+bOcHIpSQobzx4JGc4S
 JdIa5Z7XZ3fCwz26V+pcPmDtI6pdFtQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-tm3swrDPP56cEjzXhZulIA-1; Tue, 16 Mar 2021 09:32:32 -0400
X-MC-Unique: tm3swrDPP56cEjzXhZulIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4912A800C78;
 Tue, 16 Mar 2021 13:32:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 092335D705;
 Tue, 16 Mar 2021 13:32:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 517131800606; Tue, 16 Mar 2021 14:32:28 +0100 (CET)
Date: Tue, 16 Mar 2021 14:32:28 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Konstantin Nazarov <mail@knazarov.com>
Subject: Re: [PATCH v3 1/3] edid: move timing generation into a separate
 function
Message-ID: <20210316133228.ew4j6f5yoxds4iyy@sirius.home.kraxel.org>
References: <20210315114639.91953-1-mail@knazarov.com>
MIME-Version: 1.0
In-Reply-To: <20210315114639.91953-1-mail@knazarov.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 02:46:37PM +0300, Konstantin Nazarov wrote:
> The timing generation is currently performed inside the function that
> fills in the DTD. The DisplayID generation needs it as well, so moving
> it out to a separate function.
> 
> Based-on: <20210303152948.59943-2-akihiko.odaki@gmail.com>
> Signed-off-by: Konstantin Nazarov <mail@knazarov.com>

Doesn't apply cleanly.  Do you have a git tree somewhere?

take care,
  Gerd


