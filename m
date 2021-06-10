Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE433A2CA0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:14:18 +0200 (CEST)
Received: from localhost ([::1]:57144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKVl-0004LB-6T
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lrKTq-0002fq-M1
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:12:18 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:52074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lrKTn-0006wR-Lz
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:12:18 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E678E2195F;
 Thu, 10 Jun 2021 13:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623330733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PR+qUkbx6G2diRaTC2C+dH8XILI75kTMEEcLPBpcFJc=;
 b=PA9MHwQAqLS/VSIhq/jIRbUeVkLziEqnRG91DZM98HntSlcxqUgTvzyyyF89HX80F3/y9S
 V5mZS+zub5+Bgt6tQRtUP5/o2+XH/6HcXHsVFr0iTasxUMi1RsFNU9JyK/4CsikRuBV9gM
 AM71Qwn7O1nurXToPWQ/v2tvqXyVjuQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623330733;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PR+qUkbx6G2diRaTC2C+dH8XILI75kTMEEcLPBpcFJc=;
 b=LFLwdSUvVtMRMbm8ODKVTPmlRjkB2vkrG14p0GyaJBa4TjOUOP8P9A7gDe7i3LqOuKocHC
 HwO1meD8pHx04AAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id A2ADB118DD;
 Thu, 10 Jun 2021 13:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623330733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PR+qUkbx6G2diRaTC2C+dH8XILI75kTMEEcLPBpcFJc=;
 b=PA9MHwQAqLS/VSIhq/jIRbUeVkLziEqnRG91DZM98HntSlcxqUgTvzyyyF89HX80F3/y9S
 V5mZS+zub5+Bgt6tQRtUP5/o2+XH/6HcXHsVFr0iTasxUMi1RsFNU9JyK/4CsikRuBV9gM
 AM71Qwn7O1nurXToPWQ/v2tvqXyVjuQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623330733;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PR+qUkbx6G2diRaTC2C+dH8XILI75kTMEEcLPBpcFJc=;
 b=LFLwdSUvVtMRMbm8ODKVTPmlRjkB2vkrG14p0GyaJBa4TjOUOP8P9A7gDe7i3LqOuKocHC
 HwO1meD8pHx04AAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 1a82Jq0PwmD2NwAALh3uQQ
 (envelope-from <cfontana@suse.de>); Thu, 10 Jun 2021 13:12:13 +0000
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210610101553.943689-1-kraxel@redhat.com>
 <4a1a23af-461f-92c4-d9f0-1f8133d611db@suse.de>
 <20210610122305.zxdaqsft5evcrli6@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b2fb96b8-415b-b2d4-168c-d43dc20ef7b6@suse.de>
Date: Thu, 10 Jun 2021 15:12:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210610122305.zxdaqsft5evcrli6@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, jose.ziviani@suse.com, pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 2:23 PM, Gerd Hoffmann wrote:
> On Thu, Jun 10, 2021 at 12:34:14PM +0200, Claudio Fontana wrote:
>> On 6/10/21 12:15 PM, Gerd Hoffmann wrote:
>>> Based on the "modules: add metadata database" patch series sent
>>> earlier today.  Adds support for target-specific modules to the
>>> module code and build infrastructure.  Builds one simple module
>>> (virtio-9p-device) for testing purposes.  Well, one module per
>>> target to be exact ;)
>>>
>>> Gerd Hoffmann (4):
>>>   modules: factor out arch check
>>>   modules: check arch on qom lookup
>>>   modules: target-specific module build infrastructure
>>>   modules: build virtio-9p modular
>>>
>>>  hw/9pfs/virtio-9p-device.c |  2 ++
>>>  util/module.c              | 30 ++++++++++++++++++++++++------
>>>  hw/9pfs/meson.build        | 11 ++++++++++-
>>>  meson.build                | 26 ++++++++++++++++++++++++++
>>>  4 files changed, 62 insertions(+), 7 deletions(-)
>>>
>>
>> Very interesting, Cc:ing also Philippe on this.
> 
> Build qtest modular on top of that was easy, patch below.
> 
> I'm not convinced though that the approach will work for other
> accelerators too given that they have dependencies to directories
> outside accel/ ...


The difficulty is that accelerator code is going to be split across a large number of directories.
This was the biggest problem with the previous Makefile based module support.

Whatever the solution we cook, we need to consider this, it is not going to be just a single file or a bunch of files in a directory.

See this obsolete draft patch of mine just for illustrative purposes (does not apply, should not be applied).


From: Claudio Fontana <cfontana@suse.de>
Date: Sun, 10 May 2020 13:31:11 +0200
Subject: [PATCH 2/2] Makefile.target: add per-target tcg module

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 Makefile.target                            | 22 ++++++++++++++++------
 accel/Makefile.objs                        |  2 +-
 accel/tcg/Makefile.objs                    | 16 +++++++---------
 configure                                  |  2 +-
 disas/{tci.c => accel-tcg-tci.c}           |  0
 fpu/{softfloat.c => accel-tcg-softfloat.c} |  0
 rules.mak                                  | 14 ++++++++++----
 target/i386/Makefile.objs                  | 12 +++++++-----
 tcg/Makefile.objs                          |  4 ++++
 9 files changed, 46 insertions(+), 26 deletions(-)
 rename disas/{tci.c => accel-tcg-tci.c} (100%)
 rename fpu/{softfloat.c => accel-tcg-softfloat.c} (100%)
 create mode 100644 tcg/Makefile.objs

diff --git a/Makefile.target b/Makefile.target
index 4cf4af504b..c0e8f298fc 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -109,12 +109,22 @@ obj-y += trace/
 # cpu emulator library
 obj-y += exec.o exec-vary.o
 obj-y += accel/
-obj-$(CONFIG_TCG) += tcg/tcg.o tcg/tcg-op.o tcg/tcg-op-vec.o tcg/tcg-op-gvec.o
-obj-$(CONFIG_TCG) += tcg/tcg-common.o tcg/optimize.o
-obj-$(CONFIG_TCG_INTERPRETER) += tcg/tci.o
-obj-$(CONFIG_TCG_INTERPRETER) += disas/tci.o
-obj-$(CONFIG_TCG) += fpu/softfloat.o
 obj-y += target/$(TARGET_BASE_ARCH)/
+
+accel-obj-$(CONFIG_TCG) += accel/
+accel-obj-$(CONFIG_TCG) += tcg/
+accel-obj-$(CONFIG_TCG) += fpu/accel-tcg-softfloat.o
+accel-obj-$(CONFIG_TCG) += target/$(TARGET_BASE_ARCH)/
+accel-obj-$(CONFIG_TCG) += $(if $(CONFIG_TCI_INTERPRETER),disas/accel-tcg-tci.o)
+
+ifeq ($(CONFIG_MODULES)$(CONFIG_TCG),ym)
+accel-tcg-modules := accel/tcg/accel-tcg.mo tcg/accel-tcg-lib.mo fpu/accel-tcg-softfloat.mo
+accel-tcg-modules += target/$(TARGET_BASE_ARCH)/accel-tcg-target.mo
+accel-tcg-modules += $(if $(CONFIG_TCI_INTERPRETER),disas/accel-tcg-tci.mo)
+accel-tcg$(DSOSUF): $(accel-tcg-modules)
+	$(call LINKDEP "$^")
+endif
+
 obj-y += disas.o
 obj-$(call notempty,$(TARGET_XML_FILES)) += gdbstub-xml.o
 LIBS := $(libs_cpu) $(LIBS)
@@ -208,7 +218,7 @@ endif
 COMMON_LDADDS = ../libqemuutil.a
 
 # build either PROG or PROGW
-$(QEMU_PROG_BUILD): $(all-obj-y) $(COMMON_LDADDS) $(softmmu-main-y)
+$(QEMU_PROG_BUILD): $(all-obj-y) $(COMMON_LDADDS) $(softmmu-main-y) $(if $(and $(CONFIG_MODULES),$(findstring m,$(CONFIG_TCG))),accel-tcg$(DSOSUF))
 	$(call LINK, $(filter-out %.mak, $^))
 ifdef CONFIG_DARWIN
 	$(call quiet-command,Rez -append $(SRC_PATH)/pc-bios/qemu.rsrc -o $@,"REZ","$(TARGET_DIR)$@")
diff --git a/accel/Makefile.objs b/accel/Makefile.objs
index 17e5ac6061..f4c696d4a5 100644
--- a/accel/Makefile.objs
+++ b/accel/Makefile.objs
@@ -1,5 +1,5 @@
 common-obj-$(CONFIG_SOFTMMU) += accel.o
 obj-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_POSIX)) += qtest.o
 obj-$(CONFIG_KVM) += kvm/
-obj-$(CONFIG_TCG) += tcg/
+accel-obj-$(CONFIG_TCG) += tcg/
 obj-y += stubs/
diff --git a/accel/tcg/Makefile.objs b/accel/tcg/Makefile.objs
index a92f2c454b..be52189613 100644
--- a/accel/tcg/Makefile.objs
+++ b/accel/tcg/Makefile.objs
@@ -1,9 +1,7 @@
-obj-$(CONFIG_SOFTMMU) += tcg-all.o
-obj-$(CONFIG_SOFTMMU) += cputlb.o
-obj-y += tcg-runtime.o tcg-runtime-gvec.o
-obj-y += cpu-exec.o cpu-exec-common.o translate-all.o
-obj-y += translator.o
-
-obj-$(CONFIG_USER_ONLY) += user-exec.o
-obj-$(call lnot,$(CONFIG_SOFTMMU)) += user-exec-stub.o
-obj-$(CONFIG_PLUGIN) += plugin-gen.o
+accel-obj-$(CONFIG_TCG) += accel-tcg.mo
+accel-tcg.mo-objs += $(if $(CONFIG_SOFTMMU),tcg-all.o cputlb.o,user-exec-stub.o)
+accel-tcg.mo-objs += $(if $(CONFIG_USER_ONLY),user-exec.o,)
+accel-tcg.mo-objs += $(if $(CONFIG_PLUGIN),plugin-gen.o,)
+accel-tcg.mo-objs += tcg-runtime.o tcg-runtime-gvec.o
+accel-tcg.mo-objs += cpu-exec.o cpu-exec-common.o translate-all.o
+accel-tcg.mo-objs += translator.o
diff --git a/configure b/configure
index 0d69c360c0..42d1b5c30c 100755
--- a/configure
+++ b/configure
@@ -7207,7 +7207,7 @@ if test "$optreset" = "yes" ; then
   echo "HAVE_OPTRESET=y" >> $config_host_mak
 fi
 if test "$tcg" = "yes"; then
-  echo "CONFIG_TCG=y" >> $config_host_mak
+  echo "CONFIG_TCG=m" >> $config_host_mak
   if test "$tcg_interpreter" = "yes" ; then
     echo "CONFIG_TCG_INTERPRETER=y" >> $config_host_mak
   fi
diff --git a/disas/tci.c b/disas/accel-tcg-tci.c
similarity index 100%
rename from disas/tci.c
rename to disas/accel-tcg-tci.c
diff --git a/fpu/softfloat.c b/fpu/accel-tcg-softfloat.c
similarity index 100%
rename from fpu/softfloat.c
rename to fpu/accel-tcg-softfloat.c
diff --git a/rules.mak b/rules.mak
index 694865b63e..e93faa6e47 100644
--- a/rules.mak
+++ b/rules.mak
@@ -80,6 +80,11 @@ LINK = $(call quiet-command, $(LINKPROG) $(CFLAGS) $(QEMU_LDFLAGS) -o $@ \
        $(call process-archive-undefs, $1) \
        $(version-obj-y) $(call extract-libs,$1) $(LIBS),"LINK","$(TARGET_DIR)$@")
 
+# simple link using the passed deps instead of LIBS used to build a DSO
+# from multiple .mo files
+LINKDEP = $(call quiet-command, $(LINKPROG) $(CFLAGS) $(QEMU_LDFLAGS) -o $@ \
+       $(version-obj-y) $^,"LINK","$(TARGET_DIR)$@")
+
 %.o: %.S
 	$(call quiet-command,$(CCAS) $(QEMU_LOCAL_INCLUDES) $(QEMU_INCLUDES) \
 	       $(QEMU_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) \
@@ -106,11 +111,12 @@ LINK = $(call quiet-command, $(LINKPROG) $(CFLAGS) $(QEMU_LDFLAGS) -o $@ \
 DSO_OBJ_CFLAGS := -fPIC -DBUILD_DSO
 module-common.o: CFLAGS += $(DSO_OBJ_CFLAGS)
 %$(DSOSUF): QEMU_LDFLAGS += $(LDFLAGS_SHARED)
-%$(DSOSUF): %.mo
+../%$(DSOSUF): DEST=$(subst /,-,$(subst ../,,$@))
+../%$(DSOSUF): ../%.mo
+	@# Link non-accelerator, non-target-specific modules
 	$(call LINK,$^)
 	@# Copy to build root so modules can be loaded when program started without install
-	$(if $(findstring /,$@),$(call quiet-command,cp $@ $(subst /,-,$@),"CP","$(subst /,-,$@)"))
-
+	$(call quiet-command,cp $@ ../$(DEST),"CP","$(DEST)")
 
 LD_REL := $(CC) -nostdlib $(LD_REL_FLAGS)
 
@@ -364,7 +370,7 @@ define unnest-vars
                    $(eval $($o-objs): CFLAGS += $(DSO_OBJ_CFLAGS))
                    $(eval $o: $($o-objs)))
              $(eval $(patsubst %-m,%-y,$v) += $($v))
-             $(eval modules: $($v:%.mo=%$(DSOSUF))),
+             $(if $(findstring accel-,$(v)),,$(eval modules: $($v:%.mo=%$(DSOSUF)))),
              $(eval $(patsubst %-m,%-y,$v) += $(call expand-objs, $($v)))))
 
     # Post-process all the unnested vars
diff --git a/target/i386/Makefile.objs b/target/i386/Makefile.objs
index 186c6091ce..5f3e83c66d 100644
--- a/target/i386/Makefile.objs
+++ b/target/i386/Makefile.objs
@@ -1,9 +1,11 @@
 obj-y += helper.o cpu.o gdbstub.o xsave_helper.o cpu-dump.o xcc-hw.o
-obj-$(CONFIG_TCG) += translate.o
-obj-$(CONFIG_TCG) += bpt_helper.o cc_helper.o excp_helper.o fpu_helper.o
-obj-$(CONFIG_TCG) += int_helper.o mem_helper.o misc_helper.o mpx_helper.o
-obj-$(CONFIG_TCG) += seg_helper.o smm_helper.o svm_helper.o
-obj-$(CONFIG_TCG) += helper-tcg.o xcc-tcg.o






> 
> full branch:
>   https://git.kraxel.org/cgit/qemu/log/?h=sirius/modinfo-playground
> 
> take care,
>   Gerd
> 
> ------------------------- cut here ----------------------
> From baa7ca6bc334b043d25acd659c8d44697a2fc197 Mon Sep 17 00:00:00 2001
> From: Gerd Hoffmann <kraxel@redhat.com>
> Date: Thu, 10 Jun 2021 13:59:25 +0200
> Subject: [PATCH] modules: build qtest accel modular
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  accel/accel-common.c    | 2 +-
>  accel/qtest/qtest.c     | 3 +++
>  accel/meson.build       | 4 ++++
>  accel/qtest/meson.build | 7 +++----
>  4 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/accel/accel-common.c b/accel/accel-common.c
> index cf07f78421d6..7b8ec7e0f72a 100644
> --- a/accel/accel-common.c
> +++ b/accel/accel-common.c
> @@ -44,7 +44,7 @@ static const TypeInfo accel_type = {
>  AccelClass *accel_find(const char *opt_name)
>  {
>      char *class_name = g_strdup_printf(ACCEL_CLASS_NAME("%s"), opt_name);
> -    AccelClass *ac = ACCEL_CLASS(object_class_by_name(class_name));
> +    AccelClass *ac = ACCEL_CLASS(module_object_class_by_name(class_name));
>      g_free(class_name);
>      return ac;
>  }
> diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
> index edb29f6fa4c0..d2bca1c02151 100644
> --- a/accel/qtest/qtest.c
> +++ b/accel/qtest/qtest.c
> @@ -45,6 +45,7 @@ static const TypeInfo qtest_accel_type = {
>      .parent = TYPE_ACCEL,
>      .class_init = qtest_accel_class_init,
>  };
> +module_obj("qtest-accel"); // FIXME: use TYPE_QTEST_ACCEL
>  
>  static void qtest_accel_ops_class_init(ObjectClass *oc, void *data)
>  {
> @@ -61,6 +62,7 @@ static const TypeInfo qtest_accel_ops_type = {
>      .class_init = qtest_accel_ops_class_init,
>      .abstract = true,
>  };
> +module_obj("qtest-accel-ops"); // FIXME: use ACCEL_OPS_NAME
>  
>  static void qtest_type_init(void)
>  {
> @@ -69,3 +71,4 @@ static void qtest_type_init(void)
>  }
>  
>  type_init(qtest_type_init);
> +module_arch(TARGET_NAME);
> diff --git a/accel/meson.build b/accel/meson.build
> index dfd808d2c8e5..0e824c9a3a72 100644
> --- a/accel/meson.build
> +++ b/accel/meson.build
> @@ -1,3 +1,5 @@
> +accel_modules = {}
> +
>  specific_ss.add(files('accel-common.c'))
>  softmmu_ss.add(files('accel-softmmu.c'))
>  user_ss.add(files('accel-user.c'))
> @@ -16,3 +18,5 @@ dummy_ss.add(files(
>  
>  specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: dummy_ss)
>  specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
> +
> +target_modules += { 'accel' : accel_modules }
> diff --git a/accel/qtest/meson.build b/accel/qtest/meson.build
> index a2f327645980..d106bb33c36a 100644
> --- a/accel/qtest/meson.build
> +++ b/accel/qtest/meson.build
> @@ -1,6 +1,5 @@
>  qtest_ss = ss.source_set()
> -qtest_ss.add(files(
> -  'qtest.c',
> -))
> +qtest_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'],
> +             if_true: files('qtest.c'))
>  
> -specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: qtest_ss)
> +accel_modules += {'qtest': qtest_ss }
> 


