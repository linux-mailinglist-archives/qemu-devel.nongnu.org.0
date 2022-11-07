Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A261F345
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 13:30:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os1Gd-0004Tc-VW; Mon, 07 Nov 2022 07:30:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os1Ga-0004SP-Vp
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:30:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os1GZ-00016w-4d
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667824214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xTIsYdGtDAptHSfM4Gjghz9lC9/BxRtFUtYtMr+QhSg=;
 b=FNGshQM0k9hIbtinsHzFbMKT6b+ghDfQBf5NK+m5DhRvA0Io5q7wjhZ0bIeXRBJLqpLla9
 lqu7Ejexzwlqos1VXWtCC7ninPH+heS4qAMWCfAb1hbXgJBP3qJFsGdFfuiwA+mzJgSfE3
 bSna6R1nw5xV15+KzN6ibCd717RkKfE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-413-YascyCjHPBiPyiZ6vQ6vvw-1; Mon, 07 Nov 2022 07:30:09 -0500
X-MC-Unique: YascyCjHPBiPyiZ6vQ6vvw-1
Received: by mail-wr1-f72.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso2692818wra.1
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 04:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xTIsYdGtDAptHSfM4Gjghz9lC9/BxRtFUtYtMr+QhSg=;
 b=6nMzJwMgFdfU+0LtFxqtsH4VM/QRjWVlNo9zSAE56cYZWzOCSLZ2jJWMRLOdQ6kc0a
 3KRum2enjtwe9z3+6qG/yvcxy7QHMv7J3tQ7x8Z+O6z2tz5BAdDNpHDDnPTlUJpj6zM8
 CDdEyKvL0+y+QhQt2ORyLSl6GcRDzUJRbFLEZanL0AO74tu09gkMKjBG1FKXh7j9S742
 X3NJfPHoMtEOlSr5ReyEQtXDNVNbB5V5YZ1JXAh/MC4nKjpwPTRab8qFEVj62YZ6282H
 Junkb1DlF+gAfkXRWq8lHcqo4XAK0A5/sqVNRV5VlM32zCfbu2BJYzlMvnAZJuXHnzgE
 R6qg==
X-Gm-Message-State: ACrzQf3GXzrzNrA/lSBoON024lwsHOtWgt03xhiUh60HR7KTBhsOJgkS
 Mx1ItTKhgcyzt6e18V997SacXxaVq+gW60254SB1XUgBD/5beJsYeNvJ4XMOkZNJ+HneE4C+Sbf
 LN4Hqqd721MM+EM0=
X-Received: by 2002:a7b:c3d8:0:b0:3cf:9b7b:b96c with SMTP id
 t24-20020a7bc3d8000000b003cf9b7bb96cmr10817758wmj.113.1667824208124; 
 Mon, 07 Nov 2022 04:30:08 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5Qt/RQ4pUw+GgCiObLHOC6X7NL3WATc7Rd75Mvc+drbyM34Dt67nTBlRxNkUywAMkFFI0vPg==
X-Received: by 2002:a7b:c3d8:0:b0:3cf:9b7b:b96c with SMTP id
 t24-20020a7bc3d8000000b003cf9b7bb96cmr10817742wmj.113.1667824207882; 
 Mon, 07 Nov 2022 04:30:07 -0800 (PST)
Received: from redhat.com ([169.150.226.212]) by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c190700b003b477532e66sm29867430wmq.2.2022.11.07.04.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 04:30:07 -0800 (PST)
Date: Mon, 7 Nov 2022 07:30:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v3 00/81] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <20221107072411-mutt-send-email-mst@kernel.org>
References: <20221105171116.432921-1-mst@redhat.com>
 <CAJSP0QW8cYteo8aeDkg0ZZs=6oebdtfGGVnN74pW+gaK10=HSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJSP0QW8cYteo8aeDkg0ZZs=6oebdtfGGVnN74pW+gaK10=HSQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Nov 07, 2022 at 05:43:44AM -0500, Stefan Hajnoczi wrote:
> Hi Michael and Igor,
> Looks like the ACPI commits broken the virtio-vga module:
> 
> >>> QTEST_QEMU_IMG=./qemu-img MALLOC_PERTURB_=60 G_TEST_DBUS_DAEMON=/builds/qemu-project/qemu/tests/dbus-vmstate-daemon.sh QTEST_QEMU_BINARY=./qemu-system-or1k QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon /builds/qemu-project/qemu/build/tests/qtest/device-introspect-test --tap -k
> ――――――――――――――――――――――――――――――――――――― ✀ ―――――――――――――――――――――――――――――――――――――
> stderr:
> failed to open module:
> /builds/qemu-project/qemu/build/qemu-bundle/usr/local/lib64/qemu/hw-display-virtio-vga.so:
> undefined symbol: aml_return
> qemu-system-or1k: ../util/error.c:59: error_setv: Assertion `*errp ==
> NULL' failed.
> Broken pipe
> ../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from
> signal 6 (Aborted) (core dumped)
> TAP parsing error: Too few tests run (expected 6, got 0)
> (test program exited with status code -6)
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> 154/274 qemu:qtest+qtest-or1k / qtest-or1k/machine-none-test OK 0.05s
> 1 subtests passed
> 155/274 qemu:qtest+qtest-or1k / qtest-or1k/qmp-test OK 0.19s 4 subtests passed
> 156/274 qemu:qtest+qtest-or1k / qtest-or1k/qmp-cmd-test ERROR 1.72s
> killed by signal 6 SIGABRT
> >>> QTEST_QEMU_IMG=./qemu-img G_TEST_DBUS_DAEMON=/builds/qemu-project/qemu/tests/dbus-vmstate-daemon.sh QTEST_QEMU_BINARY=./qemu-system-or1k QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon MALLOC_PERTURB_=53 /builds/qemu-project/qemu/build/tests/qtest/qmp-cmd-test --tap -k
> ――――――――――――――――――――――――――――――――――――― ✀ ―――――――――――――――――――――――――――――――――――――
> stderr:
> failed to open module:
> /builds/qemu-project/qemu/build/qemu-bundle/usr/local/lib64/qemu/hw-display-virtio-vga.so:
> undefined symbol: aml_return
> qemu-system-or1k: ../util/error.c:59: error_setv: Assertion `*errp ==
> NULL' failed.
> Broken pipe
> ../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from
> signal 6 (Aborted) (core dumped)
> TAP parsing error: Too few tests run (expected 62, got 31)
> (test program exited with status code -6)
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3281425457
> 
> Stefan


Hmm it passed for me:

https://gitlab.com/mstredhat/qemu/-/jobs/3279401710

Igor you did make a change around VGA:

commit 03d525c27ab0b268cf375d8823f05e91509222b8
Author: Igor Mammedov <imammedo@redhat.com>
Date:   Mon Oct 17 12:21:36 2022 +0200

    acpi: pc: vga: use AcpiDevAmlIf interface to build VGA device descriptors
    
    Signed-off-by: Igor Mammedov <imammedo@redhat.com>
    Message-Id: <20221017102146.2254096-2-imammedo@redhat.com>
    Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
    NB: we do not expect any functional change in
    any ACPI tables with this change. It's only a refactoring.
    
    Reviewed-by: Ani Sinha <ani@anisinha.ca>


can you take a look pls?
How bad is it if I drop that patch?


-- 
MST
How is ths different


