Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617562DFE16
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 17:33:44 +0100 (CET)
Received: from localhost ([::1]:45358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krO7y-0000UG-Tw
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 11:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1krO4Q-00081c-LU
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 11:30:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1krO4I-00011o-GI
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 11:30:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608568193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8KiiU7OOgwISv/5DhwUrLIeJABVIO7Q2Dfb7M+iRtwA=;
 b=HxU7VAdTsET8Iz5dvLlkh86y4JsUmIqXISkmYhLfKcDVkKhrf12hWsluYsUGTmbPrwWWZf
 709zFjPHiVI8TLOaPBsuwfZqKzCCfeylMAvhl059SzIORMRr1Y9XI8BNBSJ6xsMKvmQqdM
 MEbq59SjShUs1hXKFhkE4aP/kLfJoSQ=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-k-uqk5ztPyKnZ1j5HFPoMw-1; Mon, 21 Dec 2020 11:29:51 -0500
X-MC-Unique: k-uqk5ztPyKnZ1j5HFPoMw-1
Received: by mail-vk1-f199.google.com with SMTP id h15so4641744vka.10
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 08:29:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8KiiU7OOgwISv/5DhwUrLIeJABVIO7Q2Dfb7M+iRtwA=;
 b=BsKoTjFErd0ZpYJuSHxiTMNNQPGxnpBEAqWi3kQeUoxrxcLx4mx3NUXYz4lS8EazVj
 4kQ2eV7S847naxnHzeYrtKyxlIg4FGjwKOmxxTWLVTpHzIcNdlnc3BWGlSowLJDH9+tX
 Wa2Mqwv2UuuLRfI/aeG//xmTzgPB3CM293slegaCgu6kuROebS1myMRBOhc9B2ls1xFl
 jIfmzSB/9gNExOkEWgVEzEXtmzYly9nnSVlCaSXANqEcHMIWngb+KI7RiUU3ElDLnNVT
 xlSY6gBIiPrCLQ8jivPuPOeJSQBSeveD29IkH25rdmUH+XbnricVy2quu8pmzD/JyF+R
 1LFQ==
X-Gm-Message-State: AOAM532BC95v0nGvYF8LP3PfsJypCrznHnlUdEBT/b8zeXBEVfym4dyW
 Yqml3MqYrugxzXvpMWA4UbpaBIHvHWodKCjfztPYDf5GDTuYhYaE+bjltOR8vA4c5r9RGWZ8jE4
 tPGINSNGn3mlQyMmzy2fg6AYgVpo9pKA=
X-Received: by 2002:a1f:4ec7:: with SMTP id c190mr5765351vkb.11.1608568191036; 
 Mon, 21 Dec 2020 08:29:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzd8XoAifFScr7wRcbLsXu0ZCiPgD2MFTB/v8EHeNoXMnOGm4kn2SiplgPLy0mmjGE8k9qEUlf5FJEXsyMBD0=
X-Received: by 2002:a1f:4ec7:: with SMTP id c190mr5765331vkb.11.1608568190750; 
 Mon, 21 Dec 2020 08:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20201221143423.23607-1-thuth@redhat.com>
In-Reply-To: <20201221143423.23607-1-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 21 Dec 2020 13:29:40 -0300
Message-ID: <CAKJDGDYK=woNn6VxdpdO7xt68tSkK5pGgQJyD-ak78g7JX4BNw@mail.gmail.com>
Subject: Re: [PATCH v4] tests/acceptance: Add a test with the Fedora 31 kernel
 and initrd
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 21, 2020 at 11:34 AM Thomas Huth <thuth@redhat.com> wrote:
>
> This initrd contains a virtio-net and a virtio-gpu kernel module,
> so we can check that we can set a MAC address for the network device
> and whether we can hot-plug and -unplug a virtio-crypto device.
> But the most interesting part is maybe that we can also successfully
> write some stuff into the emulated framebuffer of the virtio-gpu
> device and make sure that we can read back that data from a screenshot.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v4:
>  - Run lscss twice, just to be sure
>
>  tests/acceptance/machine_s390_ccw_virtio.py | 110 ++++++++++++++++++++
>  1 file changed, 110 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Willian Rampazzo <willianr@redhat.com>

  AVOCADO tests/acceptance
Fetching asset from
tests/acceptance/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_devices
Fetching asset from
tests/acceptance/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_devices
Fetching asset from
tests/acceptance/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora
Fetching asset from
tests/acceptance/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora
JOB ID     : 211012b25fa008d0ab1be9edef0dfaa79856ba1f
JOB LOG    : /home/linux1/src/qemu.dev/build/tests/results/job-2020-12-21T11.27-211012b/job.log
 (1/2) tests/acceptance/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_devices:
PASS (7.46 s)
 (2/2) tests/acceptance/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora:
PASS (22.80 s)
RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
| CANCEL 0
JOB TIME   : 31.89 s


