Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D3F2DFA7B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 10:53:44 +0100 (CET)
Received: from localhost ([::1]:33268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krHst-0003iR-9Y
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 04:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1krHre-0003GR-Jz
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 04:52:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1krHrb-0005iI-5M
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 04:52:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608544341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oq08dX7oXD3jOvz4gyEA8GxkY6wn73WXFhCKyNqiDtE=;
 b=TrQJ1Dp62OhpJnDxVMuCgF4PmTAq8gD0mPTQqM75oQnV67BbOCm88CzmOQAVmpXzKzzJRg
 /UMWBXK5EJyRNY1ZGdvkpO/9fwf7FPlFhREiKUpOLPw40IiLcEvAgZ8X86L7hlti2HzETr
 wUpZjEj3x2H0jtuEMyLShVYxDVYElhM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-NSVmgOO5Mnatmq22fc_JTg-1; Mon, 21 Dec 2020 04:52:16 -0500
X-MC-Unique: NSVmgOO5Mnatmq22fc_JTg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AFE81005513;
 Mon, 21 Dec 2020 09:52:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78F1160C67;
 Mon, 21 Dec 2020 09:52:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8505A16E16; Mon, 21 Dec 2020 10:52:08 +0100 (CET)
Date: Mon, 21 Dec 2020 10:52:08 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v2 0/8] hm/mips/fuloong2e fixes
Message-ID: <20201221095208.rmv3pvdy76vj7f7f@sirius.home.kraxel.org>
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <516bc88e-d49-94f9-b4a2-a9d31e9026@eik.bme.hu>
 <5cb09aab-f425-4faa-969d-9df324768af2@www.fastmail.com>
 <b3e15e5d-2ecf-9364-1963-3d6dae5b7b7@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <b3e15e5d-2ecf-9364-1963-3d6dae5b7b7@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: chenhuacai@kernel.org, qemu-devel@nongnu.org, wainersm@redhat.com,
 f4bug@amsat.org, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > To be more specified, our x86emu in PMON can handle i386 real mode,
> > however vgabios-ati uses INT15h when INT10h ax=0x4f01 (Get VESA Mode)
> > is called. And x86emu won't process INT15h properly.
> > 
> > My workround[1] is to allow 0x4f01 to be failed in PMON, as ax=0x4f02
> > (Set VESA Mode) do work, it won't be a actual problem.
> 
> Adding Gerd who is the vgabios maintainer and added the VESA mode support so
> he knows about this even if no fix is needed but maybe he knows a simple way
> to work around it anyway.

Hmm, memcpy_high() uses int15.  memcpy_high() is used to access the
framebuffer, and there isn't a way around it.  From a quick scan of the
source code I can't see why "get mode" uses that though.  "set mode" will
call it to clear the screen (unless the noclearmem flag is set).

take care,
  Gerd


