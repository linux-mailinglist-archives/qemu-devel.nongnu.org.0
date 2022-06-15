Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9DF54CD4C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:43:04 +0200 (CEST)
Received: from localhost ([::1]:47526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1VAd-0006ZY-JS
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o1UyT-0000oa-5b
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:30:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o1UyG-0004u9-Q8
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:30:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655307013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AoEAACLyLOTXtEE7MKl1/X34mm8nOwaaDU+dMLw7vXc=;
 b=QwbCewKK3B+jWaDzB8PJkue+lGjrGGWjHvcZoP3hmUY6WAO6Wb4Tr5smdXunUzukIWTrwe
 gJdmhU+nHLcJTPcPUG1H58n9C5RCk/Y4zd4dVV0exG6UOjIdatnQJJhTimv6pOgWVyTGy+
 NiwxAdpruux8YlCVZ9iVO5apCQ0Ea4E=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-VSlhusuwOEu4p0CsVTo3kA-1; Wed, 15 Jun 2022 11:30:11 -0400
X-MC-Unique: VSlhusuwOEu4p0CsVTo3kA-1
Received: by mail-ua1-f71.google.com with SMTP id
 x24-20020ab07818000000b00378d73df633so5574594uaq.10
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 08:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AoEAACLyLOTXtEE7MKl1/X34mm8nOwaaDU+dMLw7vXc=;
 b=2g+zXzGdBsx7KpSlpkOXXUNmxGzysB8gg8g/CvoXRnz40PNKlYJdklQzfeWM7bneEz
 XbDHTyf/LOUIXJOUM6qQpkJCItnwc5Js9cjY9EttoFxI7905x8okw+Eiq+auCXuYRhEJ
 pyQePzQjFYKGhqO4oTBL6cRhI9kvpA/YuIsdsiLpTyYi2LVPHkrz+C6rDdulKOY5HIl+
 vAWSjUgQHhKOGpxkkG6SNN5MI4XQhDeYffJpOmp17qjh/EvRYpnDSIadlrGV06w1auo1
 XezHDfVk9aW+RtI8C2/Y1BWQWxAToZjc5iAF1SVFbPgzWeM2VQhCgGj3podUE8v9DVAV
 q2sw==
X-Gm-Message-State: AJIora9tnFbAMJnWR+vulFHj+u2vSptDwy8wrkAmQa7fOQgVMnEQ9RxA
 olrsbJg0RwNBrfUzli5wom943QeuePUxJdPZwpOi5RDeJ+NC4P9o7pLmUvLqv47nN7fflY6X8zj
 K/e4ethi5xhPPZyvqB0+hNPdBHKc93tY=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr326946vsa.38.1655307010222; 
 Wed, 15 Jun 2022 08:30:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sgT7wrO7uxSg2q1KjZTlFh1ie1nAJ2jA7xzVD14hmOBMolmcoTgsal5hyd6yf9Hmrd8FNdm/wG2KgMfxQDEWA=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr326933vsa.38.1655307009949; Wed, 15 Jun
 2022 08:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220614165126.1776413-1-pbonzini@redhat.com>
In-Reply-To: <20220614165126.1776413-1-pbonzini@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 15 Jun 2022 11:29:59 -0400
Message-ID: <CAFn=p-bNV4vJG0UojUjigvMyA+7TOw12ZHhPTUMeG-zRDNY42Q@mail.gmail.com>
Subject: Re: [PATCH] tests/vm: allow running tests in an unconfigured source
 tree
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 14, 2022 at 12:51 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> tests/vm/Makefile.include used to assume that it could run in an unconfigured
> source tree, and Cirrus CI relies on that.  It was however broken by commit
> f4c66f1705 ("tests: use tests/venv to run basevm.py-based scripts", 2022-06-06),
> which co-opted the virtual environment being used by avocado tests
> to also run the basevm.py tests.
>
> For now, reintroduce the usage of qemu.qmp from the source directory, but
> without the sys.path() hacks.  The CI configuration can be changed to
> install the package via pip when qemu.qmp is removed from the source tree.

Seems kinda fragile. If dependencies change etc they're not going to
get processed here unless someone notices and keeps it up to date
manually.
Can we change the Cirrus CI config to just create the venv and bypass
configure? (Like, just run mkvenv directly?)

Or ... actually, uh. what's the problem with running check-venv,
actually? I guess because of build system magic that requires a call
to configure and we can't do that for the Cirrus CI?

>
> Cc: John Snow <jsnow@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/vm/Makefile.include | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
> index 588bc999cc..5f5b1fbfe6 100644
> --- a/tests/vm/Makefile.include
> +++ b/tests/vm/Makefile.include
> @@ -1,8 +1,17 @@
>  # Makefile for VM tests
>
> -.PHONY: vm-build-all vm-clean-all
> +# Hack to allow running in an unconfigured build tree
> +ifeq ($(wildcard $(SRC_PATH)/config-host.mak),)
> +VM_PYTHON = PYTHONPATH=$(SRC_PATH)/python /usr/bin/env python3
> +VM_VENV =
> +HOST_ARCH := $(shell uname -m)
> +else
> +VM_PYTHON = $(TESTS_PYTHON)
> +VM_VENV = check-venv
> +HOST_ARCH = $(ARCH)
> +endif
>
> -HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
> +.PHONY: vm-build-all vm-clean-all
>
>  EFI_AARCH64 = $(wildcard $(BUILD_DIR)/pc-bios/edk2-aarch64-code.fd)
>
> @@ -85,10 +94,10 @@ vm-clean-all:
>  $(IMAGES_DIR)/%.img:   $(SRC_PATH)/tests/vm/% \
>                         $(SRC_PATH)/tests/vm/basevm.py \
>                         $(SRC_PATH)/tests/vm/Makefile.include \
> -                       check-venv
> +                       $(VM_VENV)
>         @mkdir -p $(IMAGES_DIR)
>         $(call quiet-command, \
> -               $(TESTS_PYTHON) $< \
> +               $(VM_PYTHON) $< \
>                 $(if $(V)$(DEBUG), --debug) \
>                 $(if $(GENISOIMAGE),--genisoimage $(GENISOIMAGE)) \
>                 $(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
> @@ -100,11 +109,10 @@ $(IMAGES_DIR)/%.img:      $(SRC_PATH)/tests/vm/% \
>                 --build-image $@, \
>                 "  VM-IMAGE $*")
>
> -
>  # Build in VM $(IMAGE)
> -vm-build-%: $(IMAGES_DIR)/%.img check-venv
> +vm-build-%: $(IMAGES_DIR)/%.img $(VM_VENV)
>         $(call quiet-command, \
> -               $(TESTS_PYTHON) $(SRC_PATH)/tests/vm/$* \
> +               $(VM_PYTHON) $(SRC_PATH)/tests/vm/$* \
>                 $(if $(V)$(DEBUG), --debug) \
>                 $(if $(DEBUG), --interactive) \
>                 $(if $(J),--jobs $(J)) \
> @@ -128,9 +136,9 @@ vm-boot-serial-%: $(IMAGES_DIR)/%.img
>                 -device virtio-net-pci,netdev=vnet \
>         || true
>
> -vm-boot-ssh-%: $(IMAGES_DIR)/%.img check-venv
> +vm-boot-ssh-%: $(IMAGES_DIR)/%.img $(VM_VENV)
>         $(call quiet-command, \
> -               $(TESTS_PYTHON) $(SRC_PATH)/tests/vm/$* \
> +               $(VM_PYTHON) $(SRC_PATH)/tests/vm/$* \
>                 $(if $(J),--jobs $(J)) \
>                 $(if $(V)$(DEBUG), --debug) \
>                 $(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
> --
> 2.36.1
>

as for this hack -- trusting your judgment on it for now, but I am not
sure I agree with your proposed long term fix just yet. I'll add it to
the list of criteria for the next series.

Acked-By: John Snow <jsnow@redhat.com>


