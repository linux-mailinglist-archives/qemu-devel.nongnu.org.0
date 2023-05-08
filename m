Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893EE6FA84A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 12:39:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvyFd-0005NO-IC; Mon, 08 May 2023 06:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pvyFT-0005Mj-4x
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:37:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pvyFR-0005dd-Ii
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:37:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683542260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HaQy9fJQzBpLmqDD9N1u58teUu+qZNPnimfoMdI90eg=;
 b=WyH54UgtbG+q5rdp0H/V1aQUjZDXQyWM28x99SxfXQxN+zOGpexO5zX+SXg8yHHD9lQjBY
 V5SD2+HmP/f08Txw/FG3ND8wAUVL0lcbFS9EIc8P/LfYAspY5+lj8VnMV6Nn3rUC2dmgq9
 vSZDo/D7B0lYoUXYdavmU+fu8xAPgGg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-52sfzWL7NXS_7kAT4vtLCg-1; Mon, 08 May 2023 06:37:38 -0400
X-MC-Unique: 52sfzWL7NXS_7kAT4vtLCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 006032999B2A;
 Mon,  8 May 2023 10:37:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D17682026D16;
 Mon,  8 May 2023 10:37:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 58D6B21E6924; Mon,  8 May 2023 12:37:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>,  QEMU Developers
 <qemu-devel@nongnu.org>,  Marcel Apfelbaum <marcel.a@redhat.com>
Subject: Re: missing boot rom: is it really a fatal error?
References: <d6f3e06c-ee84-5101-c583-220aa90c0c12@msgid.tls.msk.ru>
 <20230508062407-mutt-send-email-mst@kernel.org>
Date: Mon, 08 May 2023 12:37:36 +0200
In-Reply-To: <20230508062407-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Mon, 8 May 2023 06:28:15 -0400")
Message-ID: <87sfc7jehb.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Sun, May 07, 2023 at 08:56:23PM +0300, Michael Tokarev wrote:
>> Hi!
>> 
>> In old good world ;), there was qemu which didn't require boot roms to be present
>> for all devices for which bootrom file is defined, missing rom was just a warning.
>> But this changed in 2014, 9 years ago, with this commit:
>> 
>> commit 178e785fb4507ec3462dc772bbe08303416ece47
>> From: Marcel Apfelbaum <marcel.a@redhat.com>
>> Date: Mon, 27 Oct 2014 19:34:41 +0200
>> Subject: [PATCH] hw/pci: fixed error flow in pci_qdev_init
>> 
>>   Verify return code for pci_add_option_rom.
>> 
>> where inability to load rom file started being treated as an error.
>> Up until now I didn't even know about this change, until today when someone bugged
>> me about non-working qemu on debian, due to missing network boot roms (this a
>> packaging issue due to me being unaware of the above change).
>> 
>> What is the reason to require boot roms to be present and throw an error if not?
>> 
>> I'm about to revert that old change on debian, to make it just a warning instead
>> of an error (the code is different now, but the same principle applies), - because
>> I dislike dependencies which are useless 99.9% of the time and are trivial to
>> install when actually needed.
>> 
>> Thanks,
>> 
>> /mjt
>> 
>
> I advise against it.
> If you boot guest on a system with boot rom not installed you will not
> be able to migrate to a system with boot rom installed.
> why not? because we don't know how big to make the rom BAR.

For what it's worth: we know when property "romsize" is set.

> And users will not discover until much much later after they have
> painted themselves into a corner.


