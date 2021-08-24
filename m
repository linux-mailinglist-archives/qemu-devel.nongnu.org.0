Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193413F5787
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 07:14:18 +0200 (CEST)
Received: from localhost ([::1]:43154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIOlM-0005KC-92
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 01:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIOkM-0004YD-4A
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 01:13:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIOkI-0006o9-QT
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 01:13:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629781989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7ywK5N+AbQcaquiY5MV4j2inJorhiCrpYhF3D/VxE1Q=;
 b=R4E/m8oBHS5C9sKrLK5Knd94QNpMJf0FjvPvBtaxqto0mbBiz/aLaUKQx0VMa67YFIFNvv
 KDbdfYdeDIZVPLuV6123qiSXVqwKmdzj2RDjlaeHqBCPRqsgLNP6tFEF/WPGrInWtxNtNb
 H2Hazp878nAeTatj4osfnigcfNX+KCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-feql8XHkO9S2TgEOnzd3rw-1; Tue, 24 Aug 2021 01:13:06 -0400
X-MC-Unique: feql8XHkO9S2TgEOnzd3rw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4F99108292F;
 Tue, 24 Aug 2021 05:13:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7500C18AD4;
 Tue, 24 Aug 2021 05:13:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EDE7611380A9; Tue, 24 Aug 2021 07:12:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] vga: don't abort when adding a duplicate isa-vga device
References: <20210813233619.32178-1-jziviani@suse.de>
 <9dd25d6d-b9ba-0000-96a0-451fd1b28c56@redhat.com>
Date: Tue, 24 Aug 2021 07:12:59 +0200
In-Reply-To: <9dd25d6d-b9ba-0000-96a0-451fd1b28c56@redhat.com> (Thomas Huth's
 message of "Sat, 14 Aug 2021 08:52:00 +0200")
Message-ID: <87sfyzpgro.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kraxel@redhat.com, qemu-devel@nongnu.org,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 14/08/2021 01.36, Jose R. Ziviani wrote:
>> If users try to add an isa-vga device that was already registered,
>> still in command line, qemu will crash:
>> $ qemu-system-mips64el -M pica61 -device isa-vga
>> RAMBlock "vga.vram" already registered, abort!
>> Aborted (core dumped)
>> That particular board registers such device automaticaly, so it's
>> not obvious that a VGA device already exists. This patch changes
>> this behavior by displaying a message and ignoring that device,
>> starting qemu normally.
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
>> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
>> ---
>>   hw/display/vga-isa.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
>> index 90851e730b..69db502dde 100644
>> --- a/hw/display/vga-isa.c
>> +++ b/hw/display/vga-isa.c
>> @@ -61,6 +61,15 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
>>       MemoryRegion *vga_io_memory;
>>       const MemoryRegionPortio *vga_ports, *vbe_ports;
>> +    /*
>> +     * some machines register VGA by default, so instead of aborting
>> +     * it, show a message and ignore this device.
>> +     */
>> +    if (qemu_ram_block_by_name("vga.vram")) {
>> +        error_report("vga.vram is already registered, ignoring this device");
>> +        return;
>> +    }
>
> I think we should not ignore the error, but rather turn this into a
> proper error (instead of aborting).
>
> So if you replace error_report(...) with error_setg(errp, ...), the
> patch should be fine.

Agreed.

error_report() in a function with an Error **errp parameter is almost
always wrong.


