Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C066147BC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 11:33:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opoZ9-0001z8-Kx; Tue, 01 Nov 2022 06:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opoZ7-0001yj-Kv
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 06:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opoZ3-00071m-Ea
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 06:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667298732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvD53j2Oo2O3XkwQKFMlDnMuDhMN0Zj7EYHDyTePSTw=;
 b=frcvFntozdC1IATJ+qCsd4bFdFAJQBgn4UIErLS1xNCuAYnzywvXBi2HZ3B5n9QgdaPrrc
 3a2O2Jxx7O9DeVtP5c2QK6BPyNKqCXkqzT00YkliQpyNvBssZzJYte3R05dkGy2y+RGgOx
 FlLhqpmfhhHtYrKktSKyUjqHwvEHGLI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-ppPytV-xMNSW-XL2BVQkrw-1; Tue, 01 Nov 2022 06:32:10 -0400
X-MC-Unique: ppPytV-xMNSW-XL2BVQkrw-1
Received: by mail-wr1-f72.google.com with SMTP id
 j20-20020adfb314000000b002366d9f67aaso3644551wrd.3
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 03:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XvD53j2Oo2O3XkwQKFMlDnMuDhMN0Zj7EYHDyTePSTw=;
 b=sZv3sjGPZwWAwgzQd+2aMMYWHfXUCw3NuKe8e2dMl/1ax3gWsm2yDU1lwSahoSlzxl
 TLFtW/zfWxg2eziyY5bOl2tN7oNgidRPKn/Xry2R3A/ThjpWdDLK4MTe3reyvPfl/i1h
 zanwobl7eb09U9PBeRt5HTKYmmCr6Rz+G8VLPux+a89CepV18gHPOL8VPYU8rU4MMXUu
 HuCad8EQyz8wfwRUe5Dn/dIY9ZGNJKkZP+TaBRFiM6jQTv4AshqDkuvU89lJH73bvH2o
 ShF5RyKiPtmXrpM6XIJxFbik/JJ4O7A5t81/Z6NSpq+e4Yy0DKfLkbOvk7jMrXvLJsqo
 Y55A==
X-Gm-Message-State: ACrzQf1OhJ/AZKGEd2UIVNK14SRE4q7pWjebu5akLLfcHwfGjYZFB2vY
 SFCtk28yTUYqK6jwd/kqKsx7V677BRBzn03pSVIycQrGRoKpYk/WCHXjMAhtq3oDXRGamcv9mC4
 gktvAKjYyAAtJorQ=
X-Received: by 2002:a5d:6250:0:b0:236:dc52:adae with SMTP id
 m16-20020a5d6250000000b00236dc52adaemr3754508wrv.111.1667298729514; 
 Tue, 01 Nov 2022 03:32:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5weJQA1ix2JdGfGYfItwZpo72svkqDqu8wWnL3JY3cJC1YRhEkOgH4WijdZvEWCt+x9phhmA==
X-Received: by 2002:a5d:6250:0:b0:236:dc52:adae with SMTP id
 m16-20020a5d6250000000b00236dc52adaemr3754495wrv.111.1667298729305; 
 Tue, 01 Nov 2022 03:32:09 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600c2ccd00b003a2f2bb72d5sm11165670wmc.45.2022.11.01.03.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 03:32:08 -0700 (PDT)
Date: Tue, 1 Nov 2022 06:32:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Hesham Almatary <hesham.almatary@huawei.com>, jonathan.cameron@huawei.com
Subject: HMAT patches failure (was Re: [PULL 00/86] pci,pc,virtio: features,
 tests, fixes, cleanups)
Message-ID: <20221101063027-mutt-send-email-mst@kernel.org>
References: <20221031124928.128475-1-mst@redhat.com>
 <CAJSP0QXz+7Yvde1-N4OjQQ+Vo95UsQoOONmRXQsBg8wEJFaC3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJSP0QXz+7Yvde1-N4OjQQ+Vo95UsQoOONmRXQsBg8wEJFaC3g@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 04:06:03PM -0400, Stefan Hajnoczi wrote:
> Here is another CI failure:
> 
> qemu-system-i386: current -smp configuration requires kernel irqchip
> and X2APIC API support.
> Broken pipe
> ../tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU
> process but encountered exit status 1 (expected 0)
> TAP parsing error: Too few tests run (expected 49, got 22)
> (test program exited with status code -6)
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> 6/202 qemu:qtest+qtest-i386 / qtest-i386/test-hmp OK 7.46s 9 subtests passed
> ▶ 7/202 ERROR:../tests/qtest/bios-tables-test.c:533:test_acpi_asl:
> assertion failed: (all_tables_match) ERROR
> 7/202 qemu:qtest+qtest-aarch64 / qtest-aarch64/bios-tables-test ERROR
> 108.34s killed by signal 6 SIGABRT
> >>> G_TEST_DBUS_DAEMON=/builds/qemu-project/qemu/tests/dbus-vmstate-daemon.sh QTEST_QEMU_BINARY=./qemu-system-aarch64 MALLOC_PERTURB_=89 /builds/qemu-project/qemu/build/tests/qtest/bios-tables-test --tap -k
> ――――――――――――――――――――――――――――――――――――― ✀ ―――――――――――――――――――――――――――――――――――――
> stderr:
> acpi-test: Warning! APIC binary file mismatch. Actual
> [aml:/tmp/aml-UKB6U1], Expected
> [aml:tests/data/acpi/virt/APIC.acpihmatvirt].
> See source file tests/qtest/bios-tables-test.c for instructions on how
> to update expected files.
> to see ASL diff between mismatched files install IASL, rebuild QEMU
> from scratch and re-run tests with V=1 environment variable set**
> ERROR:../tests/qtest/bios-tables-test.c:533:test_acpi_asl: assertion
> failed: (all_tables_match)
> (test program exited with status code -6)
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3253817453


Hesham Jonathan pls take a look, if you post a fixup today
or early tomorrow I can squash it
and then this patchset can still be included in the release.

Thanks!

-- 
MST


