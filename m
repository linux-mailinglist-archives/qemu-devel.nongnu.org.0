Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6419C3ACA66
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 13:49:26 +0200 (CEST)
Received: from localhost ([::1]:54188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luD01-0007Wj-FY
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 07:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1luCxe-0004nX-Tu
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 07:46:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1luCxc-000383-Ao
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 07:46:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624016815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ri+5GZ1EEHP0KoBqExCI899+5IekF6o26NkS5bZh/+0=;
 b=ixjf/orX8xnrTIM8sGtiwEARQfGbb7P3PR9aUjRbBVq6T4gSgFVL/kSrlabSLKDHGPsizU
 EMMATqBItd/cZ+nTudlttlNMv6NqlMPiQu3UgBOouYBjy1LpTtDaAJ/70W0ddHovXr168w
 gWeggYiB9okm3u7OYUbjzJgQgRS6L2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-0Kfczt1IMe6dGKNcLNZq2Q-1; Fri, 18 Jun 2021 07:46:53 -0400
X-MC-Unique: 0Kfczt1IMe6dGKNcLNZq2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 957B88030AF;
 Fri, 18 Jun 2021 11:46:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A75D5D9C0;
 Fri, 18 Jun 2021 11:46:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BB68518007AE; Fri, 18 Jun 2021 13:46:50 +0200 (CEST)
Date: Fri, 18 Jun 2021 13:46:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: Too slow edk2 bios boot?
Message-ID: <20210618114650.mge72lslmr7cakxw@sirius.home.kraxel.org>
References: <CAEUhbmWMzo7ZhZLjk_ScBv=AskOY670L62ujqm76tgC5Zjbq4A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWMzo7ZhZLjk_ScBv=AskOY670L62ujqm76tgC5Zjbq4A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Laszlo Ersek <lersek@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 18, 2021 at 06:46:57PM +0800, Bin Meng wrote:
> Hi Laszlo,
> 
> Using the QEMU shipped edk2 bios, for i386, it boots very quickly to
> the EFI shell.
> 
> $ qemu-system-i386 -nographic -pflash edk2-i386-code.fd
> 
> However with x86_64, it takes a very long time to boot to the EFI
> shell. It seems it got stuck in the PXE boot. Any ideas?

One year ago ia32 efi netboot support was dropped (and you are the first
who noticed 😎 ).

commit 9ed02fbb847277bef88dbe6a677cf3e5f39e5a38
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Wed Jul 22 12:24:35 2020 +0200

    ipxe: drop ia32 efi roms
    
    UEFI on ia32 never really took off.  Basically the BIOS -> UEFI shift
    came too late, x64 was widespread already, so vendors went from BIOS
    straight to UEFI on x64.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>


> I checked the boot manager, and it seems only 64-bit edk2 bios has
> built-in PXE boot while 32-bit does not.

It isn't edk2 but the nic boot roms, but yes, lack of pxe support on
ia32 is the root cause.

> Any idea to speed up this whole PXE boot thing?

qemu -nic none ?

take care,
  Gerd


