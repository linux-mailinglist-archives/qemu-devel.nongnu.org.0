Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0C8127F17
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 16:12:22 +0100 (CET)
Received: from localhost ([::1]:57820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiJwz-0006vQ-Sg
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 10:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58443)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iiJvv-00065K-6M
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 10:11:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iiJvu-0006P1-3a
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 10:11:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43492
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iiJvt-0006OE-VP
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 10:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576854673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/wJ35DxM2xmeO1Wa+ZN1owhD9BNtgECXYe/PT51g94=;
 b=Fe/JrVT7LKG9CUDwpQuL9HSD7X5x3bKVQqdzvzTLbuU187cOWXKhwvlzskQhXEL1yZSPaa
 EKXcxRyh/s44L2L8ykIBGz4w3qnBquLMnmf+Ez3kaTND7vaijN2dpVutRmOdEBWdf4T/mD
 nKzjX6x0+GIKA/I0e1y6GrPP5xB+Y00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-Vj5xFYlhMLGQ1vUIbB_a1w-1; Fri, 20 Dec 2019 10:11:09 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05B8B100550E;
 Fri, 20 Dec 2019 15:11:08 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52E3F5D72A;
 Fri, 20 Dec 2019 15:11:04 +0000 (UTC)
Date: Fri, 20 Dec 2019 16:11:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/2] numa: stop abusing numa_mem_supported
Message-ID: <20191220161102.5a3e7748@redhat.com>
In-Reply-To: <465595b7-eadd-7fb7-deba-fee7b0ae1440@redhat.com>
References: <1576154936-178362-1-git-send-email-imammedo@redhat.com>
 <20191219142851.42cd33ff@redhat.com>
 <20191219083024-mutt-send-email-mst@kernel.org>
 <20191219144209.3c80dd69@redhat.com>
 <465595b7-eadd-7fb7-deba-fee7b0ae1440@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Vj5xFYlhMLGQ1vUIbB_a1w-1
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
Cc: Tao Xu <tao3.xu@intel.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Dec 2019 14:14:58 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 19/12/19 14:42, Igor Mammedov wrote:
> > On Thu, 19 Dec 2019 08:30:34 -0500
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> >> On Thu, Dec 19, 2019 at 02:28:51PM +0100, Igor Mammedov wrote:  
> >>> On Thu, 12 Dec 2019 13:48:54 +0100
> >>> Igor Mammedov <imammedo@redhat.com> wrote:
> >>>     
> >>>> A fix  and cleanup for a mistakes that slipped by me in
> >>>>   aa57020774 (numa: move numa global variable nb_numa_nodes into MachineState)    
> >>>
> >>> ping,
> >>>
> >>> could someone pick it up please?    
> >>
> >> Looks more like Eduardo's thing.  
> > 
> > Yep if he is still available,
> > but I wasn't sure with coming winter break.
> > 
> > In addition, this patch will be prerequisite for disabling
> > deprecated '-numa node,mem'
> > hence broadcast ping to make sure it won't get lost.  
> 
> I'll take care of it (after new year).

It' looks like Eduardo already picked it up.
(meanwhile I'm preparing to post mem-path patch bomb with these included)


Though it would be nice is you could take a look at another series
  [PATCH for-5.0 v2 0/9] q35: CPU hotplug with secure boot, part 1+2
especially 2/9 patch

> 
> Paolo
> 
> 


