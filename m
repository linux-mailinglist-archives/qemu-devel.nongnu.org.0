Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6403BDFEF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 01:56:29 +0200 (CEST)
Received: from localhost ([::1]:58098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0uvU-0006wx-VZ
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 19:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up0-000130-V5
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:46 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uox-0006d5-2H
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:46 -0400
Received: by mail-pl1-x633.google.com with SMTP id f11so78625plg.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=as6QYixij3GVNX+QNmzUQ2z0584ShJs8rodcwnIeWNE=;
 b=G3JF8P7xmgZxKH/kAVaPMzN1XUGYIkiSKpLirgqSktNynYqCs4ANolSfmoWpVGd17w
 ZK6Ox3Hmzqv79a2DkfgSptgKRNONTBm9WdBVbEajSHZ4P3J6h4nPc6SDzcFNQEBS00T1
 5ayWAuZA23tAwQrlRgDfZi4u1X2g2mEuF7gQINt26eC+flo4/BySn74IoKnshxsGzZj1
 9z5bWtInq6JEYUhFoTHZ577tje6gA7MOkF6xLIDUWN6WUA+jtP03VEO8mfWIXneKf9Ta
 LzchHaZtWqlGK4ktxsoqbfqCWo7OK0td9qyDHxsHfSXW8b79fZikliEOvnTlS+3Wx6S4
 31DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=as6QYixij3GVNX+QNmzUQ2z0584ShJs8rodcwnIeWNE=;
 b=AOFxI+MtL3LJuYhzNz2FgTyZMKonE1VsJetA8IiqlSxa/F35ppHB/BGe3LIpl9uj4+
 Iev8cssAZIenlhHDTPsRNC6huxQBlOHgeGQN397jbsouianNdCmxAQqIUAEaMB9nNZ8W
 ifwdQjQ9p4N2ID1TrterVzIMGC0+e4gHatF/vDYVRofhjTpYTB3Bym7qF6N6Bk3XkJI3
 B/7pDhq85MVys4gj+vgbLX+EqGZoGxC7J6MQY6JE/nO7mzr60obe5++MOktonI+NYIp/
 fUqyoz9LXivx/fqRFwPzBiUVMDy4mKES0bI+1IZroZWsWspwhWy6sKnQym8QB031qMTD
 IS5g==
X-Gm-Message-State: AOAM530w6XySCMerot2OLmBqBGVoqCv6VwWE+YgWXxLjhfrA1FtjyDW9
 rsEEvwI8Ki3NMtiYhgGLMZP4FFkOAOw3Bw==
X-Google-Smtp-Source: ABdhPJxxW1zMB7VyuBhq8IKidqg9pCQAZ/sd/2PSRTUeFVQLf9VoX1q/PKKW1iE8Dwe6Xz7qbMJ5YQ==
X-Received: by 2002:a17:902:f682:b029:128:e54c:f58a with SMTP id
 l2-20020a170902f682b0290128e54cf58amr18861749plg.13.1625615381694; 
 Tue, 06 Jul 2021 16:49:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/36] linux-user/aarch64: Add vdso and use it for
 rt_sigreturn
Date: Tue,  6 Jul 2021 16:49:08 -0700
Message-Id: <20210706234932.356913-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Building of the vdsos are not actually wired up to anything, since
we require a cross-compiler.  Just check in the files for now.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c      |  17 ++-----
 linux-user/elfload.c             |   4 ++
 linux-user/aarch64/Makefile.vdso |  11 +++++
 linux-user/aarch64/meson.build   |  11 +++++
 linux-user/aarch64/vdso-be.so    | Bin 0 -> 6000 bytes
 linux-user/aarch64/vdso-le.so    | Bin 0 -> 6000 bytes
 linux-user/aarch64/vdso.S        |  77 +++++++++++++++++++++++++++++++
 linux-user/aarch64/vdso.ld       |  74 +++++++++++++++++++++++++++++
 linux-user/meson.build           |   1 +
 9 files changed, 182 insertions(+), 13 deletions(-)
 create mode 100644 linux-user/aarch64/Makefile.vdso
 create mode 100644 linux-user/aarch64/meson.build
 create mode 100755 linux-user/aarch64/vdso-be.so
 create mode 100755 linux-user/aarch64/vdso-le.so
 create mode 100644 linux-user/aarch64/vdso.S
 create mode 100644 linux-user/aarch64/vdso.ld

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 662bcd1c4e..f4fd2cfd62 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -108,7 +108,6 @@ struct target_rt_sigframe {
 struct target_rt_frame_record {
     uint64_t fp;
     uint64_t lr;
-    uint32_t tramp[2];
 };
 
 static void target_setup_general_frame(struct target_rt_sigframe *sf,
@@ -460,9 +459,9 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
     layout.total_size = MAX(layout.total_size,
                             sizeof(struct target_rt_sigframe));
 
-    /* Reserve space for the return code.  On a real system this would
-     * be within the VDSO.  So, despite the name this is not a "real"
-     * record within the frame.
+    /*
+     * Reserve space for the standard frame unwind pair: fp, lr.
+     * Despite the name this is not a "real" record within the frame.
      */
     fr_ofs = layout.total_size;
     layout.total_size += sizeof(struct target_rt_frame_record);
@@ -495,15 +494,7 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         return_addr = ka->sa_restorer;
     } else {
-        /*
-         * mov x8,#__NR_rt_sigreturn; svc #0
-         * Since these are instructions they need to be put as little-endian
-         * regardless of target default or current CPU endianness.
-         */
-        __put_user_e(0xd2801168, &fr->tramp[0], le);
-        __put_user_e(0xd4000001, &fr->tramp[1], le);
-        return_addr = frame_addr + fr_ofs
-            + offsetof(struct target_rt_frame_record, tramp);
+        return_addr = default_rt_sigreturn;
     }
     env->xregs[0] = usig;
     env->xregs[29] = frame_addr + fr_ofs;
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f76281fe40..8088828f5f 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -525,10 +525,14 @@ static const char *get_elf_platform(void)
 #define ELF_CLASS       ELFCLASS64
 #ifdef TARGET_WORDS_BIGENDIAN
 # define ELF_PLATFORM    "aarch64_be"
+# include "vdso-be.c.inc"
 #else
 # define ELF_PLATFORM    "aarch64"
+# include "vdso-le.c.inc"
 #endif
 
+#define vdso_image_info()    &vdso_image_info
+
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
 {
diff --git a/linux-user/aarch64/Makefile.vdso b/linux-user/aarch64/Makefile.vdso
new file mode 100644
index 0000000000..97ede674e5
--- /dev/null
+++ b/linux-user/aarch64/Makefile.vdso
@@ -0,0 +1,11 @@
+CROSS_CC ?= aarch64-linux-gnu-gcc
+LDFLAGS := -nostdlib -shared -Wl,-T,vdso.ld \
+	   -Wl,-h,linux-vdso.so.1 -Wl,--hash-style=sysv -Wl,--build-id=sha1
+
+all: vdso-le.so vdso-be.so
+
+vdso-le.so: vdso.S vdso.ld Makefile.vdso
+	$(CROSS_CC)  $(LDFLAGS) -mlittle-endian vdso.S -o $@
+
+vdso-be.so: vdso.S vdso.ld Makefile.vdso
+	$(CROSS_CC)  $(LDFLAGS) -mbig-endian vdso.S -o $@
diff --git a/linux-user/aarch64/meson.build b/linux-user/aarch64/meson.build
new file mode 100644
index 0000000000..0b1b3a5560
--- /dev/null
+++ b/linux-user/aarch64/meson.build
@@ -0,0 +1,11 @@
+# ??? There does not seem to be a way to do
+#   when: ['TARGET_AARCH64', !'TARGET_WORDS_BIGENDIAN']
+# so we'd need to add TARGET_WORDS_LITTLEENDIAN.
+# In the meantime, build both files for aarch64 and aarch64_be.
+
+gen = [
+  gen_vdso.process('vdso-be.so', extra_args: ['-r', '__kernel_rt_sigreturn']),
+  gen_vdso.process('vdso-le.so', extra_args: ['-r', '__kernel_rt_sigreturn'])
+]
+
+linux_user_ss.add(when: 'TARGET_AARCH64', if_true: gen)
diff --git a/linux-user/aarch64/vdso-be.so b/linux-user/aarch64/vdso-be.so
new file mode 100755
index 0000000000000000000000000000000000000000..b0f4a83e32f300dd41110740a78f3172efbe9d1d
GIT binary patch
literal 6000
zcmeHLJ!~9B6n=ZVBmpPk9D{;nL=NNvA+ip!fbb)<Hol83E{^5=C`mKA+--ap-%qr+
z4(A973sHceNJ&e9L<b#IK$V6DAxwuvLyJOBWZs*3Z*FdLjueoncAVL7-uK>{pLa8(
zym`M|trQ9#*y6)C*k+<AbYvP+Uu%ru6zqct9*4sy@534xJ#waG&|5XMARIuM#vtDZ
zl;B&VWHhs)?<0nn`DHOP593!rAD*Yj{bmvFntm-FXrzD8+}SUPj6RDn!+wHfFBO~K
zZKKcPo_<fDy?=V;0=)jk!ky>7dv&h9-2TnG_s*S9+B=h`Fa4$XQ@LV5=ILKznd9Vt
z$TG*f@FmNSF}}+<!T1zmZ+G`^BM0<*k$lg{K(Qp5<K?p*YyV%kJ_);jjTv(B2mr6A
zc!KpsM9<;Hjn;S6;mM8);c<sA5s5|gM!N5-_mz*d>~Ck!T4RbK*#w}}Mx1oxwn|df
zZ>=YBx|wu`?0TH0txnv#)~Ia_*?PNI-%zX@Lnm<`+O6*9;P}l(zZc@am!P`5a^aFX
z8NL$Ey{6|;z+ck*d3YZ2@6ey$e~ud3e@|mI`-)~?0B^tg@nhB@z;*g~)BYO>wC`~(
z6F(uoiTFF>D&k$l239IMX5Ote2nNr1(+7_UhkI?}Q_(ZNh}=gRE<%p>vF-;kFL?y=
z2;>pSBalZRk3b%QJOX(H@(4U+1e%lEKjVMze>qn2cc`ivf9Lrp4flhue%12fQF+Oc
zA2b{$1e7^ok-XPP$m{$OdCtQvPx%lQo1bb4$v`*2KV^_5`wn39U9so9%jUhp?`O}E
zd=>lG`7I8^X#0QEv?SlRJm<|p(=e8oeAA`9V0?Z`dHgtg%Dtrj_uP*5=;x?s`yYvC
z34O=Se{N{+V~%Fa@*a8gMJN9~!Pb<6wH;nMq4<5^@RF+$e&+Bcb|}JZ+PN`XuMaj}
zE_W}7J(wB5Oas*7<(2s}%Wq>|i?1N6yre2?^JmIxX>kqI>FU{q`KmfwshlgHSLf#!
zs%15r+S-KLCdrfyTlU|l*%0=(I%(}HVwxCiN~_yTV+b2t-CCzr*A28qtfe&wo3(z^
zaA^YJdUrFt87KW#uR9{B283}_T}x`6ST!4HDH4QfJV-fe{|%<mozH<ihqq0a_MB2a
z?-o9PntB$$@~*+>RrZ~rem@f%a*}gJ```tv^3KHffSh+hp!twL-yhbW-la}DJdZE;
zf*_R8#w{{FA>ASTE+*@j`$G`${XxIYNFU-)ad^wo@%-hU5d?Wp6MtC;$rXGz+hv9L
z^L=FB(GH@X*QPDmPS5vT_8o3`Z`u2c)=2RaKbb#ub``74hxI{33hXD+VBT}MslomI
zZy=NPZyIBJAFjI2*mlRi<@nPavCy`lA_$QdhaamzipG|84J~x57#X5KcnIqhRw^<+
k?H{@m-Pn?z%aLtvd?gH{td~T(xA*X$nq~WKMgi;p4~13}umAu6

literal 0
HcmV?d00001

diff --git a/linux-user/aarch64/vdso-le.so b/linux-user/aarch64/vdso-le.so
new file mode 100755
index 0000000000000000000000000000000000000000..975d203e6b999e01221a40fb4d2d1a5dc83d3294
GIT binary patch
literal 6000
zcmeHLL1+|L82&etniw@2TTzJA74}f1PTB~v#Uc}%T@%>EC2G+kJl5SYyEVHjvlE+$
zU=R-#6uh<c)?07&rg+hNdk|62dg!f4dbh;?pLyRn^D-)0=xP2q^S$@||Nq{bf8Gv$
z?@Fms?#tx}X3-rAdfP(A(T>|6BZA1GB5mONRvKm`>gUVRZWF6|XyBlZ6IycLWOrpy
zHXwzo3hp0?L$A+7M|^BfaF<)SfIe=?kazWZOk9;vHXznn{mX9z&!^Yp7+46?2&mn`
zT++U!=Q9!Uz<Ay#oM-WMboM08+&uWxnH_(>m^$>}&wI~*xieq9dRe9%mK)o5Aq4YD
z^OPjA1vO&4ru(S%Z&C=hp%CZ?jhi&?()e<1tt-tzy|90EU#HWm?!VOI>$LwJzULW7
z=$|!n;z=g9(<b^t?-Ohnc^$%I-{3v()ciIhe!u4P2G4Y=VP8pEP;;3R?*mCvM~Ml_
ztJHbd>$nTb^Hr}k@45b>*P)1=cYVLrcDv^qwdL1reW6=Fue2|P_S_yVv^tAR`!6<n
zU7P=XNtNl@lc&_Ueb7Gem8_&M`pfa}ME-ug|6+^mzukOcZ^`=m*mwO8H6T7Qsk>Ni
z)H+mPlxKO!W&N7*8Do`km9fDn7S;dK9Q7}Knj77`C*Wki-FW>v0`7C>el$3Txoa_w
zyP0Jb$SROkAge%Dfvf^q1+ofc704>^o)u`0tUTiX-#^}yx1PwQ3f7a)c7)smOFa$x
z!^!?stpB#@EY=Lrz417U)dX}>lD7!@G|Bf<F-2!utg4`QlkpoO-J9eGC{3?gG#KgJ
zWc)^g-cRyF)C`1MoD~hUUZ99}>QB+9BSGr=_)uRB(dCr!)5a0qn&a`!dgg=i*RTJ8
zj;|W^oMt{vM}NzFnvP!3JcJ!|^i|E9I{IhL=S>|w=C?15)$6@-w>Um&cd4*Mg$Aj~
z)3XyZ)8DYJ<x>z<no{MtiJ6j`nw%qbv~ujoL`5AdmyefDs1p-MDkYVawvlv>M6#&i
zi2ZPxO?Gd&?bpsS`d)}lv^rhiCA+cQskK}6puw?>HNQr7v({^dobQo6-&wRTx?Zo<
z?Ib#?LAKje=e%0mRm}!RqDQvxF8N%<|7fF}Kfo8xaq#;Dik6R?xefQSQ_eN8eX#F<
zt2!BHAJ`Yr|NGd_yFQv9zjxrRSibyrkdJezapr`_{P->a^X!Wo@_|Km%2^DaAKwq4
zoIQwPeB_}HhqVv+I9~(eJS`Z6Z?e|7mASLVXJ^RA_XxOI2V;K30gtm^&f?I=`5aK5
zPfY4BF<8HFVrTi1H6b70H{iS8{{<r--$7uN{c$trzr;?NANvE}51<oI<~H^X==j>f
w2|7B^(GRwTIXSY%{MbJmnL};48QIGAu=#t$gbnlk$#**~e@vf`ue>Aw6>MP?*#H0l

literal 0
HcmV?d00001

diff --git a/linux-user/aarch64/vdso.S b/linux-user/aarch64/vdso.S
new file mode 100644
index 0000000000..41cda7eb24
--- /dev/null
+++ b/linux-user/aarch64/vdso.S
@@ -0,0 +1,77 @@
+/*
+ * aarch64 linux replacement vdso.
+ *
+ * Copyright 2021 Linaro, Ltd.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <asm/unistd.h>
+
+/* ??? These are in include/elf.h, which is not ready for inclusion in asm. */
+#define NT_GNU_PROPERTY_TYPE_0  5
+#define GNU_PROPERTY_AARCH64_FEATURE_1_AND      0xc0000000
+#define GNU_PROPERTY_AARCH64_FEATURE_1_BTI      (1U << 0)
+#define GNU_PROPERTY_AARCH64_FEATURE_1_PAC      (1U << 1)
+
+#define GNU_PROPERTY_AARCH64_FEATURE_1_DEFAULT \
+    (GNU_PROPERTY_AARCH64_FEATURE_1_BTI | GNU_PROPERTY_AARCH64_FEATURE_1_PAC)
+
+	.text
+
+/*
+ * TODO: The kernel makes a big deal of turning off the .cfi directives,
+ * because they cause libgcc to crash, but that's because they're wrong.
+ *
+ * For now, elide the unwind info for __kernel_rt_sigreturn and rely on
+ * the libgcc fallback routine as we have always done.  This requires
+ * that the code sequence used be exact.
+ */
+	.align	4
+__kernel_rt_sigreturn:
+	/* No BTI C insn here -- we arrive via RET. */
+	mov	x8, #__NR_rt_sigreturn
+	svc	#0
+
+	.globl	__kernel_rt_sigreturn
+	.type	__kernel_rt_sigreturn, %function
+	.size	__kernel_rt_sigreturn, . - __kernel_rt_sigreturn
+
+	.align	4
+__kernel_gettimeofday:
+	.cfi_startproc
+	bti	c
+	mov	x8, #__NR_gettimeofday
+	svc	#0
+	ret
+	.cfi_endproc
+
+	.globl	__kernel_gettimeofday
+	.type	__kernel_gettimeofday, %function
+	.size	__kernel_gettimeofday, . - __kernel_gettimeofday
+
+	.align	4
+__kernel_clock_gettime:
+	.cfi_startproc
+	bti	c
+	mov	x8, #__NR_clock_gettime
+	svc	#0
+	ret
+	.cfi_endproc
+
+	.globl	__kernel_clock_gettime
+	.type	__kernel_clock_gettime, %function
+	.size	__kernel_clock_gettime, . - __kernel_clock_gettime
+
+	.align	4
+__kernel_clock_getres:
+	.cfi_startproc
+	bti	c
+	mov	x8, #__NR_clock_getres
+	svc	#0
+	ret
+	.cfi_endproc
+
+	.globl	__kernel_clock_getres
+	.type	__kernel_clock_getres, %function
+	.size	__kernel_clock_getres, . - __kernel_clock_getres
diff --git a/linux-user/aarch64/vdso.ld b/linux-user/aarch64/vdso.ld
new file mode 100644
index 0000000000..579d27638f
--- /dev/null
+++ b/linux-user/aarch64/vdso.ld
@@ -0,0 +1,74 @@
+/*
+ * Linker script for linux aarch64 replacement vdso.
+ *
+ * Copyright 2021 Linaro, Ltd.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+VERSION {
+        LINUX_2.6.39 {
+        global:
+                __kernel_rt_sigreturn;
+                __kernel_gettimeofday;
+                __kernel_clock_gettime;
+                __kernel_clock_getres;
+
+        local: *;
+        };
+}
+
+
+PHDRS {
+        phdr            PT_PHDR         FLAGS(4) PHDRS;
+        data            PT_LOAD         FLAGS(6) FILEHDR PHDRS;
+        text            PT_LOAD         FLAGS(5);
+        dynamic         PT_DYNAMIC      FLAGS(4);
+        eh_frame_hdr    PT_GNU_EH_FRAME;
+        note            PT_NOTE         FLAGS(4);
+}
+
+SECTIONS {
+        /*
+         * We can't prelink to any address without knowing something about
+         * the virtual memory space of the host, since that leaks over into
+         * the available memory space of the guest.
+         */
+        . = SIZEOF_HEADERS;
+
+        /*
+         * The following, including the FILEHDRS and PHDRS, are modified
+         * when we relocate the binary.  We want them to be initially
+         * writable for the relocation; we'll force them read-only after.
+         */
+        .note           : { *(.note*) }         :data :note
+        .dynamic        : { *(.dynamic) }       :data :dynamic
+        .dynsym         : { *(.dynsym) }        :data
+        /*
+         * There ought not be any real read-write data.
+         * But since we manipulated the segment layout,
+         * we have to put these sections somewhere.
+         */
+        .data           : {
+                *(.data*)
+                *(.sdata*)
+                *(.got.plt) *(.got)
+                *(.gnu.linkonce.d.*)
+                *(.bss*)
+                *(.dynbss*)
+                *(.gnu.linkonce.b.*)
+        }
+
+        .rodata         : { *(.rodata*) }
+        .hash           : { *(.hash) }
+        .gnu.hash       : { *(.gnu.hash) }
+        .dynstr         : { *(.dynstr) }
+        .gnu.version    : { *(.gnu.version) }
+        .gnu.version_d  : { *(.gnu.version_d) }
+        .gnu.version_r  : { *(.gnu.version_r) }
+        .eh_frame_hdr   : { *(.eh_frame_hdr) }  :data :eh_frame_hdr
+        .eh_frame       : { *(.eh_frame) }      :data
+
+        . = ALIGN(4096);
+        .text           : { *(.text*) }         :text   =0xd503201f
+}
diff --git a/linux-user/meson.build b/linux-user/meson.build
index 94556f9198..8021044053 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -25,6 +25,7 @@ gen_vdso_exe = executable('gen-vdso', 'gen-vdso.c',
 gen_vdso = generator(gen_vdso_exe, output: '@BASENAME@.c.inc',
                      arguments: ['-o', '@OUTPUT@', '@EXTRA_ARGS@', '@INPUT@'])
 
+subdir('aarch64')
 subdir('alpha')
 subdir('arm')
 subdir('hppa')
-- 
2.25.1


