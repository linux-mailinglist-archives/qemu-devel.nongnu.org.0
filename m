Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EA2220FC1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jul 2020 16:46:40 +0200 (CEST)
Received: from localhost ([::1]:52790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvigB-0007jb-1C
	for lists+qemu-devel@lfdr.de; Wed, 15 Jul 2020 10:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jviem-000762-1y
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 10:45:12 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:35786
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jviek-0007p2-0F
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 10:45:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594824309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sygBqOEhTqAmzTNn8tKWn/9AfKbHTjy+5lfPTTbS5w8=;
 b=N5dw9xq9vJgeELnI9aSjbxLWyTJXQ7Ixq63Cyl9yRGgDwTMEKXSTVb/YzxaXEhaqBkDsH0
 c/RdJadBPD1Z4XD1XsZMHhKLteqaAP/2jHbX0QJ32w6H7mCaWXxEjn+A3jeAiOHKEOFJvI
 7CgEa0wBG+s0nSolCMANQ+GT4OdWiN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-tm9RQr2nO8i6fNSrgMRRJQ-1; Wed, 15 Jul 2020 10:45:05 -0400
X-MC-Unique: tm9RQr2nO8i6fNSrgMRRJQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC6F61030C25;
 Wed, 15 Jul 2020 14:45:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E7CA610AF;
 Wed, 15 Jul 2020 14:45:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3B63611386A6; Wed, 15 Jul 2020 16:45:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-5.1 2/2] hw: Mark nd_table[] misuse in realize methods
 FIXME
References: <20200715140440.3540942-1-armbru@redhat.com>
 <20200715140440.3540942-3-armbru@redhat.com>
 <5865965e-7075-0a6d-1e75-3ce174df68b6@redhat.com>
Date: Wed, 15 Jul 2020 16:45:01 +0200
In-Reply-To: <5865965e-7075-0a6d-1e75-3ce174df68b6@redhat.com> (Thomas Huth's
 message of "Wed, 15 Jul 2020 16:27:57 +0200")
Message-ID: <87sgdsu9aq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 02:01:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, alistair@alistair23.me,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, sundeep.lkml@gmail.com,
 b.galvani@gmail.com, nieklinnenbank@gmail.com, qemu-arm@nongnu.org,
 palmer@dabbelt.com, edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 15/07/2020 16.04, Markus Armbruster wrote:
>> nd_table[] contains NIC configuration for boards to pick up.  Device
>> code has no business looking there.  Several devices do it anyway.
>> Two of them already have a suitable FIXME comment: "allwinner-a10" and
>> "msf2-soc".  Copy it to the others: "allwinner-h3", "xlnx-versal",
>> "xlnx,zynqmp", "sparc32-ledma", "riscv.sifive.u.soc".
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/arm/allwinner-h3.c | 1 +
>>  hw/arm/xlnx-versal.c  | 1 +
>>  hw/arm/xlnx-zynqmp.c  | 1 +
>>  hw/dma/sparc32_dma.c  | 1 +
>>  hw/riscv/sifive_u.c   | 1 +
>>  5 files changed, 5 insertions(+)
>
> Maybe we should add an entry to
> https://wiki.qemu.org/Contribute/BiteSizedTasks for this?

I'd prefer to leave that to someone who knows how this should be done
properly, and thus has a better idea on how big the bite actually is.
Figuring this out myself might be more work than fixing it.

> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks!


