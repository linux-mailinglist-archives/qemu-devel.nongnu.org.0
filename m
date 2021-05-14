Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29E43809D5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:46:35 +0200 (CEST)
Received: from localhost ([::1]:51902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhXD9-0006kn-1m
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhWmH-0004ZI-9e
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:18:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhWmB-0006QE-IA
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620994721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q7cXMKEdJZFbDVFprwV9+XsHnkyz2f8IxOho+xf2q+8=;
 b=gJxn84JcmLSeyAyyF9JMwHyYtqBWVDxDiFVBqkoqHt5FYvdKsgrBiFWMF3LIrcJm1mlbbK
 vC8HbULlAIXgIHcfVWp/5WL72GgOcDXRaLi1mWUzcDp/Oq+zHK6p/f4QFBuSqiIQkO3mAa
 A8EfJM81Qfgqc5nxXGUDBPVjq5VaCFE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-Sy4p6XMcMxuKmr9m4moNSw-1; Fri, 14 May 2021 08:18:39 -0400
X-MC-Unique: Sy4p6XMcMxuKmr9m4moNSw-1
Received: by mail-wr1-f69.google.com with SMTP id
 93-20020adf80e60000b0290106fab45006so12676242wrl.20
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 05:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=q7cXMKEdJZFbDVFprwV9+XsHnkyz2f8IxOho+xf2q+8=;
 b=CKSx/xJWmKPFqAg0at0wl3aZqh9nATdPul8OJZ1j3OS0tn36OYKSDCJrKZJwEY7bCc
 h9DJc+NkRYQiCTccwQJjB8xNiGqVd1oGIVGjDmSideaq/iOeqMN3nAXIzkI048jp+Dpe
 a3fu7VV8xZoUZAxQYXA3WRTlhhIoHKIlSrkP56hnfZVRo44PmeWCEO7A7DgDaXUEHlUG
 nVwVPv57+QYF84IDR+SiMXvMWfq/2LERsQVIFk8foAPyoJNN1kRL6gtxBW0Shx5YCTTb
 Mn4Ciky545RdDL7nOPrrtLD75jAMpUdUdXpkLxc8XjYhA1wBHfug0vU1vCpAat1JFsr5
 oFhQ==
X-Gm-Message-State: AOAM532+JR0QxfYgPMP3GUEwRTJW3/sk/E0axm42sRoAlMVMfZ30TBGa
 4EC7SuTDqk/XeO2uvnwYoj9vB0fYiZx98vTT0L6VzXSVSY6prZX4eg9wPb3oBBr3x5kAn1/6WQJ
 HpZu6lB5B7gTUeJg=
X-Received: by 2002:a1c:2743:: with SMTP id n64mr9080499wmn.76.1620994717544; 
 Fri, 14 May 2021 05:18:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvtIEFnM8uOhZzvufFUed79Hqu7Q47uEVqMKyn2R8Z7DnWpvwerAvFcZFRHhx6uUfoSBQ6FA==
X-Received: by 2002:a1c:2743:: with SMTP id n64mr9080475wmn.76.1620994717348; 
 Fri, 14 May 2021 05:18:37 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id r5sm5927223wmh.23.2021.05.14.05.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 05:18:36 -0700 (PDT)
Date: Fri, 14 May 2021 08:18:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v6 00/12] qtests: Check accelerator available at runtime
 via QMP 'query-accels'
Message-ID: <20210514081728-mutt-send-email-mst@kernel.org>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 03, 2021 at 11:10:08PM +0200, Philippe Mathieu-Daudé wrote:
> Missing review: 10-12 (bios-tables-test)


So the main functional changes is ARM stuff I think?
Pls use that tree to merge.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>



> Hi,
> 
> This series aims at having accelerator-independent qtests
> by querying a QEMU instance at runtime to check the list
> of built-in accelerators.
> 
> First we add the 'query-accels' QMP command,
> then we add the qtest_has_accel() method to libqtest,
> finally we use this new method to allow running
> bios-tables-test on KVM-only builds.
> 
> Since v5:
> - Rename bios-tables tests (Igor)
> - Do not restrict bios-tables tests to TCG (Igor)
> - Reset bios-tables-test R-b tags
> 
> Since v4:
> - Removed patch 10 (Markus, patch justification not clear)
>   'qtest/qmp-cmd-test: Make test build-independent from accelerator'
> - Removed patch 12 (Alex, icount / record/replay issue)
>   'tests/meson: Only build softfloat objects if TCG is selected (again)'
> - Sorted @Accelerator QAPI enum (Eric)
> - Added R-b/T-b
> 
> Since v3:
> - Added Markus review comments
> - Added R-b/A-b tags
> 
> Since v2:
> - Addressed Markus & Drew review comments
> - Added qtest/migration-test patch
> 
> Since v1:
> - Addressed Eric & Paolo review comments
> 
> Since v0:
> - kept over-engineered union (I don't how to do simple enum)
> - dropped arm-cpu-features patches for now
> - fixed typos (Eric)
> - rename qtest_has_accel (Thomas)
> - probe accel with machine none previous qtest (Paolo)
> - iterate over QAPI enum (Markus)
> 
> Eric's suggestion of conditional QAPI didn't worked out,
> as accelerator definitions are poisoned.
> 
> Phil.
> 
> Philippe Mathieu-Daudé (12):
>   MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG CPUs section
>   accel: Introduce 'query-accels' QMP command
>   qtest: Add qtest_has_accel() method
>   qtest/arm-cpu-features: Use generic qtest_has_accel() to check for KVM
>   qtest/arm-cpu-features: Restrict sve_tests_sve_off_kvm test to KVM
>   qtest/arm-cpu-features: Remove TCG fallback to KVM specific tests
>   qtest/arm-cpu-features: Use generic qtest_has_accel() to check for TCG
>   qtest/migration-test: Skip tests if KVM not builtin on s390x/ppc64
>   qtest/bios-tables-test: Rename tests not TCG specific
>   qtest/bios-tables-test: Rename TCG specific tests
>   qtest/bios-tables-test: Make test build-independent from accelerator
>   qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore
> 
>  qapi/machine.json              |  47 ++++++++++
>  tests/qtest/libqos/libqtest.h  |   8 ++
>  accel/accel-qmp.c              |  49 +++++++++++
>  tests/qtest/arm-cpu-features.c |  55 ++++--------
>  tests/qtest/bios-tables-test.c | 156 ++++++++++++++++-----------------
>  tests/qtest/libqtest.c         |  29 ++++++
>  tests/qtest/migration-test.c   |   4 +-
>  MAINTAINERS                    |   1 +
>  accel/meson.build              |   2 +-
>  tests/qtest/meson.build        |   3 +-
>  10 files changed, 232 insertions(+), 122 deletions(-)
>  create mode 100644 accel/accel-qmp.c
> 
> -- 
> 2.26.3
> 


