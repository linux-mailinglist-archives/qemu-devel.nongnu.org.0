Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799C3257ADF
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 15:52:14 +0200 (CEST)
Received: from localhost ([::1]:38040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCkEH-0005cm-1l
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 09:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kCkDH-0004mP-En
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 09:51:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kCkDF-00040I-Br
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 09:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598881868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a6UsJDv1PQv3Kz+oxhGojZmPvksscu9SFifd8T+iwoU=;
 b=HnSBEUDAPvGtGIZLbbnCdNCYPTidi3Fd3F991Q2twCqXHxvPPes2N9HP2IPaGFws/uS8um
 63Ke28bAEvEY7de4NK2/nk6cJyzo36nX+v2S9/P8vgY2u+2Rc7RYjAlHiDFI5zWcKPsKLi
 4nlE4qsI86MvL1Adtnb/1LJuRa1MWSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-WAR11pYCOxieyXuEjg6kWA-1; Mon, 31 Aug 2020 09:51:04 -0400
X-MC-Unique: WAR11pYCOxieyXuEjg6kWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F30D801ADA;
 Mon, 31 Aug 2020 13:51:03 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-174.ams2.redhat.com [10.36.112.174])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54BC618514;
 Mon, 31 Aug 2020 13:51:02 +0000 (UTC)
Subject: Re: [PATCH] build: fix recurse-all target
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200831125645.29331-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <773706ec-ff1c-73f6-0141-75734d136109@redhat.com>
Date: Mon, 31 Aug 2020 15:51:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200831125645.29331-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 03:43:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.13, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/08/2020 14.56, Paolo Bonzini wrote:
> The missing "/all" suffix prevents the pc-bios/ parts of the build
> from running.
> 
> In the meanwhile, -Wall has moved from QEMU_CFLAGS to CFLAGS.  Simplify
> everything by not passing down CFLAGS, and add -Wall in the recursive
> Makefiles.
> 
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Fixes: 5e6d1573b4 ("remove Makefile.target", 2020-08-21)
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  Makefile                   | 4 ++--
>  pc-bios/optionrom/Makefile | 8 ++------
>  pc-bios/s390-ccw/Makefile  | 3 ++-
>  3 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 27bf8156ec..7230f0f1f3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -186,10 +186,10 @@ ROM_DIRS_RULES=$(foreach t, all clean, $(addsuffix /$(t), $(ROM_DIRS)))
>  # Only keep -O and -g cflags
>  .PHONY: $(ROM_DIRS_RULES)
>  $(ROM_DIRS_RULES):
> -	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) -C $(dir $@) V="$(V)" TARGET_DIR="$(dir $@)" CFLAGS="$(filter -O% -g%,$(CFLAGS))" $(notdir $@),)
> +	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) -C $(dir $@) V="$(V)" TARGET_DIR="$(dir $@)" $(notdir $@),)
>  
>  .PHONY: recurse-all recurse-clean
> -recurse-all: $(ROM_DIRS)
> +recurse-all: $(addsuffix /all, $(ROM_DIRS))
>  recurse-clean: $(addsuffix /clean, $(ROM_DIRS))
>  
>  ######################################################################
> diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
> index 51cb6ca9d8..6495802d9f 100644
> --- a/pc-bios/optionrom/Makefile
> +++ b/pc-bios/optionrom/Makefile
> @@ -8,15 +8,12 @@ all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin
>  	@true
>  
>  include ../../config-host.mak
> +CFLAGS = -O2 -g
>  
>  quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
>  cc-option = $(if $(shell $(CC) $1 -S -o /dev/null -xc /dev/null >/dev/null 2>&1 && echo OK), $1, $2)
>  
> -# Compiling with no optimization creates ROMs that are too large
> -ifeq ($(lastword $(filter -O%, -O0 $(CFLAGS))),-O0)
> -override CFLAGS += -O2
> -endif
> -override CFLAGS += -march=i486
> +override CFLAGS += -march=i486 -Wall
>  
>  # Flags for dependency generation
>  override CPPFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
> @@ -42,7 +39,6 @@ Wa = -Wa,
>  override ASFLAGS += -32
>  override CFLAGS += $(call cc-option, $(Wa)-32)
>  
> -
>  LD_I386_EMULATION ?= elf_i386
>  override LDFLAGS = -m $(LD_I386_EMULATION) -T $(SRC_DIR)/flat.lds
>  override LDFLAGS += $(LDFLAGS_NOPIE)
> diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
> index cc0f77baa6..3eb785048a 100644
> --- a/pc-bios/s390-ccw/Makefile
> +++ b/pc-bios/s390-ccw/Makefile
> @@ -3,6 +3,7 @@ all: build-all
>  	@true
>  
>  include ../../config-host.mak
> +CFLAGS = -O2 -g
>  
>  quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
>  cc-option = $(if $(shell $(CC) $1 -S -o /dev/null -xc /dev/null > /dev/null \
> @@ -28,7 +29,7 @@ QEMU_DGFLAGS = -MMD -MP -MT $@ -MF $(@D)/$(*F).d
>  OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o menu.o \
>  	  virtio.o virtio-scsi.o virtio-blkdev.o libc.o cio.o dasd-ipl.o
>  
> -QEMU_CFLAGS := $(filter -W%, $(QEMU_CFLAGS))
> +QEMU_CFLAGS := -Wall $(filter -W%, $(QEMU_CFLAGS))
>  QEMU_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks -msoft-float
>  QEMU_CFLAGS += -march=z900 -fPIE -fno-strict-aliasing
>  QEMU_CFLAGS += -fno-asynchronous-unwind-tables
> 

Thanks, this fixes the build of the s390-ccw bios on s390x, too!

Tested-by: Thomas Huth <thuth@redhat.com>


