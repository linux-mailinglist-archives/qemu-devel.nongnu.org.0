Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C77EC3965
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 17:46:37 +0200 (CEST)
Received: from localhost ([::1]:43624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFKMF-0007C1-Gf
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 11:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46653)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iFK54-0008M2-0B
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iFK53-0003ZY-30
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:28:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33934)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iFK52-0003Wv-TW
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:28:49 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 69DC4C010C13
 for <qemu-devel@nongnu.org>; Tue,  1 Oct 2019 15:28:47 +0000 (UTC)
Received: from [10.3.116.201] (ovpn-116-201.phx2.redhat.com [10.3.116.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34B0D1001B13;
 Tue,  1 Oct 2019 15:28:47 +0000 (UTC)
Subject: Re: [PATCH 1/8] ide: fix leak from qemu_allocate_irqs
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1569936988-635-1-git-send-email-pbonzini@redhat.com>
 <1569936988-635-2-git-send-email-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <4eb1b986-b232-9250-d666-1315bd7647c5@redhat.com>
Date: Tue, 1 Oct 2019 10:28:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <1569936988-635-2-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 01 Oct 2019 15:28:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/19 8:36 AM, Paolo Bonzini wrote:
> The array returned by qemu_allocate_irqs is malloced, free it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/ide/cmd646.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
> index f3ccd11..19984d2 100644
> --- a/hw/ide/cmd646.c
> +++ b/hw/ide/cmd646.c
> @@ -300,6 +300,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
>           d->bmdma[i].bus = &d->bus[i];
>           ide_register_restart_cb(&d->bus[i]);
>       }
> +    g_free(irq);

How many of these patches could be fixed by using g_autofree or similar 
instead?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

