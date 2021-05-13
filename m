Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287F837FCD5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:51:06 +0200 (CEST)
Received: from localhost ([::1]:32894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhFUH-000131-51
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lhFLM-0001yh-0M
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:41:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lhFLK-0003Ag-5T
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620927706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gubYvitJOx/h8k9fXo7+/YZarbHJfHz0lZJZRqyJLM4=;
 b=FU6d2pyD2vdfIQnz+MtEfzEfuz8UdRxL8vDKSWGOlY7oLFM1UG0vCioAgYQbGSZdBRdn/X
 DNfxitG3Tyd6fDtKuAzR4V9GALbnqzI6pI3JdCgrOx3FO0FxcjSTZCsFhuJEPG67UjuiBW
 MCM7BQ6gt2a+8N26E5NAgZ9L0vnrIYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-Ky2dweZuP3CadoJ-Vl3w-w-1; Thu, 13 May 2021 13:41:42 -0400
X-MC-Unique: Ky2dweZuP3CadoJ-Vl3w-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E4AD1966325;
 Thu, 13 May 2021 17:41:41 +0000 (UTC)
Received: from work-vm (ovpn-113-200.ams2.redhat.com [10.36.113.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B3C25D9CC;
 Thu, 13 May 2021 17:41:33 +0000 (UTC)
Date: Thu, 13 May 2021 18:41:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/17] migration queue
Message-ID: <YJ1kyhqp+DenGr2G@work-vm>
References: <20210511150842.207155-1-dgilbert@redhat.com>
 <CAFEAcA-caAPn5Lzt=t2u7V5zWkdhbADdSQWd74v+OMOcRqD-ow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-caAPn5Lzt=t2u7V5zWkdhbADdSQWd74v+OMOcRqD-ow@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: David Hildenbrand <david@redhat.com>, Kunkun Jiang <jiangkunkun@huawei.com>,
 huangy81@chinatelecom.cn, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Tue, 11 May 2021 at 16:08, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > The following changes since commit e4f3ede95ce813d5705c65e1c0e1c80c70739ebb:
> >
> >   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210505-pull-request' into staging (2021-05-10 19:55:06 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://github.com/dagrh/qemu.git tags/pull-migration-20210511a
> >
> > for you to fetch changes up to 872df23afc70985af5a458e0c4bd2b984559015c:
> >
> >   tests/migration: introduce multifd into guestperf (2021-05-11 11:26:19 +0100)
> >
> > ----------------------------------------------------------------
> > Migration pull 2021-05-11
> >
> > The largest change in this set is David's changes for ram block size
> > changing; then there's a pile of other cleanups and fixes.
> >
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >
> 
> Fails to build on the gitlab cross build job:
> https://gitlab.com/qemu-project/qemu/-/jobs/1258047823
> 
> ../migration/ram.c: In function 'host_page_from_ram_block_offset':
> ../migration/ram.c:3092:12: error: cast to pointer from integer of
> different size [-Werror=int-to-pointer-cast]
> return (void *)QEMU_ALIGN_DOWN((uintptr_t)block->host + offset,
> ^

OK, resent with a pair of brackets around the (block->host + offset),
so that the result ends up as the uintptr_t.  Seems to work for me in
the docker test that otherwise failed.

Dave

> 
> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


