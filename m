Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C1C5E7A35
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 14:10:01 +0200 (CEST)
Received: from localhost ([::1]:50798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obhVE-0005kR-H1
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 08:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obhKE-0000cY-6V
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 07:58:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obhKB-0008CT-2p
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 07:58:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663934310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FY08GbOntiT59LWHNoz2raQ4i8jDhOCyECIkJEH7T88=;
 b=OcgvkMbMCdVSARqK7MTmfNmiDmLNsNf3X/uu6zzKn3sNE6e/ot1gAr82TIkZYqtgXJOEyv
 x0jazLMvQgaD6nWK8puhy7n9l9SpjP3J3IhnAEXKZAENd0VcKz/Mp17ra23OOkE8KxGmVR
 Q8MrSPtowPz8KJs5zHm40c1fapwWj04=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-JyZSUVIhPpqzDNRP0CpfZQ-1; Fri, 23 Sep 2022 07:58:29 -0400
X-MC-Unique: JyZSUVIhPpqzDNRP0CpfZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB1DB3C00088
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 11:58:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C36DE2027061;
 Fri, 23 Sep 2022 11:58:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8D08918000A3; Fri, 23 Sep 2022 13:58:27 +0200 (CEST)
Date: Fri, 23 Sep 2022 13:58:27 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH for-7.2] hw/usb/hcd-xhci: Check whether DMA accesses fail
Message-ID: <20220923115827.hho7ko775mxeal2j@sirius.home.kraxel.org>
References: <20220817160016.49752-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817160016.49752-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 17, 2022 at 06:00:16PM +0200, Thomas Huth wrote:
> If a guest sets up bad descriptors, it could force QEMU to access
> non-existing memory regions. Thus we should check the return value
> of dma_memory_read/write() to make sure that these errors don't go
> unnoticed.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Patch added to queue.

thanks,
  Gerd


