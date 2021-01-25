Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB17302474
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 12:50:12 +0100 (CET)
Received: from localhost ([::1]:60848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l40Nn-00043G-G3
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 06:50:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l40Lz-00029s-6r
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:48:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l40Lw-0000O7-BT
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:48:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611575294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BJIbowhKR7lz6lwfHQY4NSf/SHEig29IprnWeIgktAY=;
 b=R5eqVu6b3JxWMMZvRH8pc3DEOIf8nXA4gKpe4TmIl6R0XoUf7FX3+ktUwdnBCPCDv8eYje
 Svvipn8l5zDBUonlkaUickTpHQx/Tune00OJ02h1WVUKmsR9rz//I50WUlOP5F09AtE8Xx
 Q90xo+lGccteFJKovSWjpfwoqlLMpGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-iNVeLRO_OhmKvxZrYz9Q-w-1; Mon, 25 Jan 2021 06:48:12 -0500
X-MC-Unique: iNVeLRO_OhmKvxZrYz9Q-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0B6880047B
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 11:48:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1D396A90F;
 Mon, 25 Jan 2021 11:48:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 342C5113865F; Mon, 25 Jan 2021 12:48:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 15/25] vl: plumb keyval-based options into -set and
 -readconfig
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-16-pbonzini@redhat.com>
Date: Mon, 25 Jan 2021 12:48:00 +0100
In-Reply-To: <20210118163113.780171-16-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 18 Jan 2021 11:31:03 -0500")
Message-ID: <87blddnspb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Add generic machinery to support parsing command line options with
> keyval in -set and -readconfig, choosing between QDict and
> QemuOpts as the underlying data structure.
>
> The keyval_merge function is slightly heavyweight as a way to
> do qemu_set_option for QDict-based options, but it will be put
> to further use later to merge entire -readconfig sections together
> with their command-line equivalents.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Watch this:

    $ cat test.cfg
    [machine]
      accel = "kvm"
      usb = "on"
    $ qemu-system-x86_64 -S -display none -readconfig test.cfg
    Aborted (core dumped)

Backtrace:

    #0  0x00007ffff52f19e5 in raise () at /lib64/libc.so.6
    #1  0x00007ffff52da895 in abort () at /lib64/libc.so.6
    #2  0x0000555555c44a77 in qemu_record_config_group
        (group=0x7fffffffd1b0 "machine", dict=0x5555565fb740, errp=0x5555564ffca0 <error_fatal>) at ../softmmu/vl.c:2103
    #3  0x0000555555c44bd8 in qemu_parse_config_group
        (group=0x7fffffffd1b0 "machine", qdict=0x5555565f9640, opaque=0x5555564ff9e0 <vm_config_groups>, errp=0x5555564ffca0 <error_fatal>) at ../softmmu/vl.c:2135
    #4  0x0000555555eda3e6 in qemu_config_foreach
        (fp=0x5555565f3e00, cb=0x555555c44af5 <qemu_parse_config_group>, opaque=0x5555564ff9e0 <vm_config_groups>, fname=0x7fffffffe0dd "test.cfg", errp=0x5555564ffca0 <error_fatal>) at ../util/qemu-config.c:378
    #5  0x0000555555eda5d5 in qemu_read_config_file
        (filename=0x7fffffffe0dd "test.cfg", cb=0x555555c44af5 <qemu_parse_config_group>, errp=0x5555564ffca0 <error_fatal>) at ../util/qemu-config.c:421
    #6  0x0000555555c47d3f in qemu_init
        (argc=6, argv=0x7fffffffdcc8, envp=0x7fffffffdd00) at ../softmmu/vl.c:3405
    #7  0x00005555558234e1 in main
        (argc=6, argv=0x7fffffffdcc8, envp=0x7fffffffdd00) at ../softmmu/main.c:49

Similar result for

    [memory]
      size = "1024"

and

    [chardev "mon0"]
      backend = "stdio"

I didn't look for more.


