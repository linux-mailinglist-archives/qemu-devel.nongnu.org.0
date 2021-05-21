Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF5038C8D4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:59:00 +0200 (CEST)
Received: from localhost ([::1]:53494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk5g4-00006c-2E
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lk5eh-0007ha-ES
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:57:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lk5eb-0000Xj-EN
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:57:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621605446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OYpnDCEBejyU7JS8BXVJdgiIQViVEWtJDk7Bcmk1A24=;
 b=jFeHE0tEYXcyb5r8Gx0+7YLxMqs9XOJPc51km7mBTkJcblPPceFbNEIs+M7t88RRg79moE
 o5B4nW9sCiG9yj5Hls4GXtSWOfzzpxI2Oi4Kt2ILuJwsEifIAMvt0tA1u/oO+T+lXqMOzr
 EA+taIyFd/fIERdjvZsyW4mJSttDow0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-YRkMGiRJOUmALS-ArnanNw-1; Fri, 21 May 2021 09:57:24 -0400
X-MC-Unique: YRkMGiRJOUmALS-ArnanNw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76DF88042B7
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 13:57:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B91855D9CA;
 Fri, 21 May 2021 13:57:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 322791800386; Fri, 21 May 2021 15:57:12 +0200 (CEST)
Date: Fri, 21 May 2021 15:57:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>
Subject: Re: [PULL 12/25] virtio-gpu: move virgl realize + properties
Message-ID: <20210521135712.lqkdn4xhqhhqaxw4@sirius.home.kraxel.org>
References: <20210510132051.2208563-1-kraxel@redhat.com>
 <20210510132051.2208563-13-kraxel@redhat.com>
 <a86e2a07-a803-cd00-849e-96a30e8839d3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a86e2a07-a803-cd00-849e-96a30e8839d3@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Sorry for catching this a bit late, but libvirt is looking for "virgl"
> property when guest XML has 3D acceleration enabled:

Yes, libvirt must be adapted to this.

https://gitlab.com/libvirt/libvirt/-/issues/167

As far I know libvirt checks whenever the virgl property exists to
figure whenever virgl support is available (as you can compile qemu
without virgl support).  So without changes libvirt will simply
think there is no 3d support and configurations without virgl enables
should continue to work fine.

Configurations with virgl enabled will break though, and unfortunaly
there is no easy way to avoid that.

> The commit message suggests that virtio-gpu-gl-device should be used
> instead. Fair enough, so IIUC the cmd line should be changed to:
> 
>   -device virtio-gpu-gl-device,id=video0,max_outputs=1,bus=pci.0,addr=0x2

virtio-gpu-gl-device is the mmio variant, for pci you need
virtio-gpu-gl-pci.  But otherwise yes, this is what libvirt should use
in case it figures qemu supports the virtio-gpu-gl-pci device (again,
when compiling with virgl disabled the device will not be there).

take care,
  Gerd


