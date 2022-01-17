Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49154902F8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 08:37:00 +0100 (CET)
Received: from localhost ([::1]:54530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9MZX-0004FM-EX
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 02:36:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n9MHK-0006So-ME
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 02:18:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n9MHH-0000dv-VM
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 02:18:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642403887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wzg7EiE08Fy1Mo30ja8l3Mjp7L3pLukYJ+nmMHWv8l0=;
 b=IUg4cRi0GB+yCEmgz0GLJRgNQ1WVkQYSWvnzD/IlLkBHaRxIxdjq08/aTFMqaPxOEz6Jf+
 zOKrPc33THa0qwG36Lc9aVSONS99J0kvYdm5zXiewrlNDks8Y0MBWJ0/aYj9peDY8Hwxiu
 mfwnHZFx48Ls96QjJF2MQMBM7QoaluM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-7pPVTfnpPPGNxtRYH70ZXA-1; Mon, 17 Jan 2022 02:18:03 -0500
X-MC-Unique: 7pPVTfnpPPGNxtRYH70ZXA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B251D1898291;
 Mon, 17 Jan 2022 07:18:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C16578B0C;
 Mon, 17 Jan 2022 07:17:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6624018003BF; Mon, 17 Jan 2022 08:17:53 +0100 (CET)
Date: Mon, 17 Jan 2022 08:17:53 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Ruien Zhang <zhangruien@bytedance.com>
Subject: Re: [PATCH 0/2] Introduce printer subsystem and USB printer device
Message-ID: <20220117071753.hzmond3pbfmpfvam@sirius.home.kraxel.org>
References: <20220113115659.72788-1-zhangruien@bytedance.com>
 <20220114093216.aqrh6h3ukzavtasq@sirius.home.kraxel.org>
 <f336f49a-4053-537f-0601-9cb3d0d59cfc@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <f336f49a-4053-537f-0601-9cb3d0d59cfc@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> If I want to expose some Virtual Device Interfaces (VDI) on USB-IPP printer
> device to remote desktop service like spice-server, is it rational to
> register these interfaces to the printer subsystem which will play as a
> middle layer?

I'd suggest to implement the usb printer in the spice client then and
connect it to the virtual machine using the usb redirection protocol,
similar to the existing usb storage emulation for cdrom redirection.

take care,
  Gerd


