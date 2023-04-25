Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A516EE1A8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:10:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prHVD-0002cL-E4; Tue, 25 Apr 2023 08:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1prHVB-0002bg-IW
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:10:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1prHV9-00029K-7U
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:10:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682424630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yYEj+qWSfwOhLKlNho0gU8eP4IEBpXy1c24rYLGjV70=;
 b=IjU20lXcV3Le2QvNwD+gZUAp6h9axLNtnEFBd5T0NN/+Rki62lugewuNf66nknE4Ll9AK0
 iiPc/75YglHxmcIsUCEwmY8q7ezT6EZS5zGb8z9LpP/pHYPEZBR9vuBidFMLaYk6Y2UWkb
 NJfdcbFtMlQBHxb7ePxeEwEg4Ftrb+Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-u5QWjBxOOfm-Qk_RhuRoPQ-1; Tue, 25 Apr 2023 08:10:26 -0400
X-MC-Unique: u5QWjBxOOfm-Qk_RhuRoPQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63A74857FB5;
 Tue, 25 Apr 2023 12:10:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.246])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A167492B03;
 Tue, 25 Apr 2023 12:10:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BBE49180099C; Tue, 25 Apr 2023 14:10:24 +0200 (CEST)
Date: Tue, 25 Apr 2023 14:10:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
 qemu-devel@nongnu.org, philmd@linaro.org, david@redhat.com, peterx@redhat.com, 
 pbonzini@redhat.com, marcel.apfelbaum@gmail.com, den-plotnikov@yandex-team.ru, 
 Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH] pci: make ROM memory resizable
Message-ID: <kwqw7gyagjlykfvdyiwlfr3tuepofr5o7e2mtute6dmltbzkg6@jy3ea7jlvllc>
References: <20230424203647.94614-1-vsementsov@yandex-team.ru>
 <20230425031348-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425031348-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 25, 2023 at 03:26:50AM -0400, Michael S. Tsirkin wrote:
> On Mon, Apr 24, 2023 at 11:36:47PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > On migration, on target we load local ROM file. But actual ROM content
> > migrates through migration channel. Original ROM content from local
> > file doesn't matter. But when size mismatch - we have an error like
> > 
> >  Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument

Oh, a 512k rom.  Where does that come from?

The ones shipped by qemu are all between 128k and 256k in size,
which gets rounded up to 256k (0x40000).  Has not changed since
we added efi boot rom support ...

If you supply your own versions for some reason you must make sure
they have identical size on all host machines.

take care,
  Gerd


