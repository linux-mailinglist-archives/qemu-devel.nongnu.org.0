Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA64D1263FB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 14:50:37 +0100 (CET)
Received: from localhost ([::1]:41840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihwCK-00075R-Hh
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 08:50:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45724)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ihw4M-0004Qa-Ic
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 08:42:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ihw4K-0007Om-1x
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 08:42:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26242
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ihw4J-0007Ic-QP
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 08:42:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576762938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mlF+ruUrfIzeWXyr2bW4B8+XSuSxJurnJTbcrMLPShg=;
 b=UP33kVx+YSGyecE05ooIAB3DyvNwJUJ8aKaESaIhRSAOyzDAQhACUV/JdQEFMq9XqxOJxl
 FImD8dmYDBQeHs2RXeWpikR5lNOWjxc7TWiPR9DZnlgyfhlKS+zrCk5wtHTQ5QoDAUOZF1
 ksM8GMFMBx1UzmYWDRZvK5BWn5Z/fD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-TdnHyEPMM2SDAQQBjcfxMw-1; Thu, 19 Dec 2019 08:42:15 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 948AD18552AA;
 Thu, 19 Dec 2019 13:42:14 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CEDB60C87;
 Thu, 19 Dec 2019 13:42:10 +0000 (UTC)
Date: Thu, 19 Dec 2019 14:42:09 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/2] numa: stop abusing numa_mem_supported
Message-ID: <20191219144209.3c80dd69@redhat.com>
In-Reply-To: <20191219083024-mutt-send-email-mst@kernel.org>
References: <1576154936-178362-1-git-send-email-imammedo@redhat.com>
 <20191219142851.42cd33ff@redhat.com>
 <20191219083024-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: TdnHyEPMM2SDAQQBjcfxMw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: pbonzini@redhat.com, Tao Xu <tao3.xu@intel.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Dec 2019 08:30:34 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Dec 19, 2019 at 02:28:51PM +0100, Igor Mammedov wrote:
> > On Thu, 12 Dec 2019 13:48:54 +0100
> > Igor Mammedov <imammedo@redhat.com> wrote:
> >   
> > > A fix  and cleanup for a mistakes that slipped by me in
> > >   aa57020774 (numa: move numa global variable nb_numa_nodes into MachineState)  
> > 
> > ping,
> > 
> > could someone pick it up please?  
> 
> Looks more like Eduardo's thing.

Yep if he is still available,
but I wasn't sure with coming winter break.

In addition, this patch will be prerequisite for disabling
deprecated '-numa node,mem'
hence broadcast ping to make sure it won't get lost.

> 
> > > 
> > > 
> > > CC: Eduardo Habkost <ehabkost@redhat.com>
> > > CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > > CC: Tao Xu <tao3.xu@intel.com>
> > > 
> > > Igor Mammedov (2):
> > >   numa: remove not needed check
> > >   numa: properly check if numa is supported
> > > 
> > >  hw/arm/sbsa-ref.c | 1 -
> > >  hw/core/machine.c | 4 ++--
> > >  hw/core/numa.c    | 7 +------
> > >  3 files changed, 3 insertions(+), 9 deletions(-)
> > >   
> 


