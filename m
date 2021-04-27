Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DEF36CAE3
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 20:08:18 +0200 (CEST)
Received: from localhost ([::1]:57702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbS89-0001OR-JH
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 14:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbS66-0000Qw-8S
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 14:06:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbS63-00045V-Sy
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 14:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619546766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GgQzYaHWBcSYVbRXqjzQ2M86ue1OI6Ann1d/qa+eQu4=;
 b=GfidAtAFpNUc4yV4bjyndwAiab0n6IsNzPKL0ZYMT8GvTjWJqYWFYewxL7oymxtjQf3eB/
 ByO96y4v3lTgUPUUPhjR+imiv0BSORCIvTTnUCLQTii26LzBJQ/aXeqzAUEXiTFutS0qEI
 Lv9SQ1OeV+c15aEJoPBVILpKc0yMibc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-Vpb8kRDNMCON_08wypeBmw-1; Tue, 27 Apr 2021 14:06:04 -0400
X-MC-Unique: Vpb8kRDNMCON_08wypeBmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E5B78042A9;
 Tue, 27 Apr 2021 18:06:03 +0000 (UTC)
Received: from [10.10.112.236] (ovpn-112-236.rdu2.redhat.com [10.10.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7019C19718;
 Tue, 27 Apr 2021 18:06:02 +0000 (UTC)
Subject: Re: [PATCH] hw/ide: Fix crash when plugging a piix3-ide device into
 the x-remote machine
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210416125256.2039734-1-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <1afff3dc-2be8-29f2-9007-8be485947e16@redhat.com>
Date: Tue, 27 Apr 2021 14:06:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416125256.2039734-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 8:52 AM, Thomas Huth wrote:
> QEMU currently crashes when the user tries to do something like:
> 
>   qemu-system-x86_64 -M x-remote -device piix3-ide
> 
> This happens because the "isabus" variable is not initialized with
> the x-remote machine yet. Add a proper check for this condition
> and propagate the error to the caller, so we can fail there gracefully.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Seems OK to me for now. I will trust that this won't get in the way of 
any deeper refactors Phil has planned, since this just adds error 
pathways to avoid something already broken, and doesn't change anything 
else.

I'm OK with that.

Reviewed-by: John Snow <jsnow@redhat.com>

Tentatively staged, pending further discussion.

> ---
>   hw/ide/ioport.c           | 16 ++++++++++------
>   hw/ide/piix.c             | 22 +++++++++++++++++-----
>   hw/isa/isa-bus.c          | 14 ++++++++++----
>   include/hw/ide/internal.h |  2 +-
>   include/hw/isa/isa.h      | 13 ++++++++-----
>   5 files changed, 46 insertions(+), 21 deletions(-)
> 


> diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
> index b613ff3bba..e6caa537fa 100644
> --- a/hw/ide/ioport.c
> +++ b/hw/ide/ioport.c
> @@ -50,15 +50,19 @@ static const MemoryRegionPortio ide_portio2_list[] = {
>       PORTIO_END_OF_LIST(),
>   };
>   
> -void ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
> +int ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
>   {
> +    int ret;
> +
>       /* ??? Assume only ISA and PCI configurations, and that the PCI-ISA
>          bridge has been setup properly to always register with ISA.  */
> -    isa_register_portio_list(dev, &bus->portio_list,
> -                             iobase, ide_portio_list, bus, "ide");
> +    ret = isa_register_portio_list(dev, &bus->portio_list,
> +                                   iobase, ide_portio_list, bus, "ide");
>   
> -    if (iobase2) {
> -        isa_register_portio_list(dev, &bus->portio2_list,
> -                                 iobase2, ide_portio2_list, bus, "ide");
> +    if (ret == 0 && iobase2) {
> +        ret = isa_register_portio_list(dev, &bus->portio2_list,
> +                                       iobase2, ide_portio2_list, bus, "ide");
>       }
> +
> +    return ret;
>   }


Little funky instead of just checking and returning after the first 
portio list registration, you could leave a little more git blame intact 
by not doing this, but...

...Then again, I just acked a ton of stuff Phil moved around, so, 
whatever O:-)


