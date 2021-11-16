Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3532A453595
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 16:19:21 +0100 (CET)
Received: from localhost ([::1]:36336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn0Ey-0001i9-8l
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 10:19:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn09g-00028q-Dk
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:13:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn09S-0001tw-PA
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:13:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637075618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vzyuU0brrhhvWPox+fPOqudlzzVJ1atjfhhAL4J13rY=;
 b=iEYlz/fBK3nxwkjIdFeo1oMDNQbVdJE3Rc6iZ8dEqvS8BzA2BxOzikAuWBX6M0zegjSS8+
 INGGy6Hd4HAcNeacnm/ymw779PQWsMau1d4EOFWoHwi3quoMfpg4pSUyhJUCBazB4+btyJ
 vRt/TLAqYcGdtRuqYUa3CQ4xivPP2fY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-X7xgHtqhO9ibCT7UCZ3rrg-1; Tue, 16 Nov 2021 10:13:37 -0500
X-MC-Unique: X7xgHtqhO9ibCT7UCZ3rrg-1
Received: by mail-wm1-f71.google.com with SMTP id
 g11-20020a1c200b000000b003320d092d08so7475042wmg.9
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 07:13:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vzyuU0brrhhvWPox+fPOqudlzzVJ1atjfhhAL4J13rY=;
 b=Le+nouwRd/2V48RWVZBxJ+AGjETeYXhvw9B5Nxexbc8q9vX6tXKhQz9wSWQ5Xl6Ytk
 baS6cNm9kqs8sLG8LSH51URVSw/rA279DpDM31mgI08kLHWr0dRSDozzVbS0YUoYIjgu
 5iwYlcjujuuClxNwXjEZclGpd/tCwG35mrYaLDnNa25HJ0yaBqaP9FCn50GX+ZFDz5jv
 GmVlup1tQyW3kxYci0hhOZtPHhxlkQTu38J3GKKSssdGust7dqa9ct5Yx8LktUAmo8kh
 1CpZHERGviOQTUgVmnszsmMbszqwfZHTLW/YJRu+Ok+TMlF4maFHwljgspMF6Z09k9wv
 Fkkw==
X-Gm-Message-State: AOAM5301Bv56FJ7iLZ1PO8lZeATdoyiPAetfunu0GRWnE8NhEQYhF0FT
 pheALd1amthjMKnsCjdYroBEA1reaH+Ji/tEZuJeM39qHXf0MAgoERJAucZyoUeTUb91krzuPZ/
 DT/sUVM0gxBQdNCk6zgx5J68NfE365oeQvMWYHeQEggcYDRmHZsyfWPe871FUT5eG
X-Received: by 2002:a5d:66cb:: with SMTP id k11mr10006219wrw.253.1637075615190; 
 Tue, 16 Nov 2021 07:13:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjtZ6DBQ6n07vT9BTp5kNy1gB0VdY5NYd+l3B80Slda9jokh/Oepy5lccikqFHruKHvkSIiQ==
X-Received: by 2002:a5d:66cb:: with SMTP id k11mr10006133wrw.253.1637075614661; 
 Tue, 16 Nov 2021 07:13:34 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 y12sm17483212wrn.73.2021.11.16.07.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:13:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? 3/3] docs/devel/style: Improve types/qualifiers rST
 rendering
Date: Tue, 16 Nov 2021 16:13:17 +0100
Message-Id: <20211116151317.2691125-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116151317.2691125-1-philmd@redhat.com>
References: <20211116151317.2691125-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/style.rst | 111 ++++++++++++++++++++++---------------------
 1 file changed, 56 insertions(+), 55 deletions(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 21f0f213193..f9f063ed8cb 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -111,7 +111,7 @@ Variables are lower_case_with_underscores; easy to type and read.  Structured
 type names are in CamelCase; harder to type but standing out.  Enum type
 names and function type names should also be in CamelCase.  Scalar type
 names are lower_case_with_underscores_ending_with_a_t, like the POSIX
-uint64_t and family.  Note that this last convention contradicts POSIX
+``uint64_t`` and family.  Note that this last convention contradicts POSIX
 and is therefore likely to be changed.
 
 Variable Naming Conventions
@@ -195,9 +195,9 @@ blocks) are generally not allowed; declarations should be at the beginning
 of blocks.
 
 Every now and then, an exception is made for declarations inside a
-#ifdef or #ifndef block: if the code looks nicer, such declarations can
+``#ifdef`` or ``#ifndef`` block: if the code looks nicer, such declarations can
 be placed at the top of the block even if there are statements above.
-On the other hand, however, it's often best to move that #ifdef/#ifndef
+On the other hand, however, it's often best to move that ``#ifdef/#ifndef``
 block to a separate function altogether.
 
 Conditional statements
@@ -220,13 +220,13 @@ even when the constant is on the right.
 Comment style
 =============
 
-We use traditional C-style /``*`` ``*``/ comments and avoid // comments.
+We use traditional C-style ``/*`` ``*/`` comments and avoid ``//`` comments.
 
-Rationale: The // form is valid in C99, so this is purely a matter of
+Rationale: The ``//`` form is valid in C99, so this is purely a matter of
 consistency of style. The checkpatch script will warn you about this.
 
 Multiline comment blocks should have a row of stars on the left,
-and the initial /``*`` and terminating ``*``/ both on their own lines:
+and the initial ``/*`` and terminating ``*/`` both on their own lines:
 
 .. code-block:: c
 
@@ -290,57 +290,57 @@ a few useful guidelines here.
 Scalars
 -------
 
-If you're using "int" or "long", odds are good that there's a better type.
-If a variable is counting something, it should be declared with an
-unsigned type.
+If you're using '``int``' or '``long``', odds are good that there's a better
+type.  If a variable is counting something, it should be declared with an
+*unsigned* type.
 
-If it's host memory-size related, size_t should be a good choice (use
-ssize_t only if required). Guest RAM memory offsets must use ram_addr_t,
+If it's host memory-size related, ``size_t`` should be a good choice (use
+``ssize_t`` only if required). Guest RAM memory offsets must use ``ram_addr_t``,
 but only for RAM, it may not cover whole guest address space.
 
-If it's file-size related, use off_t.
-If it's file-offset related (i.e., signed), use off_t.
-If it's just counting small numbers use "unsigned int";
+If it's file-size related, use ``off_t``.
+If it's file-offset related (i.e., signed), use ``off_t``.
+If it's just counting small numbers use '``unsigned int``';
 (on all but oddball embedded systems, you can assume that that
 type is at least four bytes wide).
 
 In the event that you require a specific width, use a standard type
-like int32_t, uint32_t, uint64_t, etc.  The specific types are
+like ``int32_t``, ``uint32_t``, ``uint64_t``, etc.  The specific types are
 mandatory for VMState fields.
 
-Don't use Linux kernel internal types like u32, __u32 or __le32.
+Don't use Linux kernel internal types like ``u32``, ``__u32`` or ``__le32``.
 
-Use hwaddr for guest physical addresses except pcibus_t
-for PCI addresses.  In addition, ram_addr_t is a QEMU internal address
+Use ``hwaddr`` for guest physical addresses except ``pcibus_t``
+for PCI addresses.  In addition, ``ram_addr_t`` is a QEMU internal address
 space that maps guest RAM physical addresses into an intermediate
 address space that can map to host virtual address spaces.  Generally
-speaking, the size of guest memory can always fit into ram_addr_t but
+speaking, the size of guest memory can always fit into ``ram_addr_t`` but
 it would not be correct to store an actual guest physical address in a
-ram_addr_t.
+``ram_addr_t``.
 
 For CPU virtual addresses there are several possible types.
-vaddr is the best type to use to hold a CPU virtual address in
+``vaddr`` is the best type to use to hold a CPU virtual address in
 target-independent code. It is guaranteed to be large enough to hold a
 virtual address for any target, and it does not change size from target
 to target. It is always unsigned.
-target_ulong is a type the size of a virtual address on the CPU; this means
+``target_ulong`` is a type the size of a virtual address on the CPU; this means
 it may be 32 or 64 bits depending on which target is being built. It should
 therefore be used only in target-specific code, and in some
 performance-critical built-per-target core code such as the TLB code.
-There is also a signed version, target_long.
-abi_ulong is for the ``*``-user targets, and represents a type the size of
-'void ``*``' in that target's ABI. (This may not be the same as the size of a
+There is also a signed version, ``target_long``.
+``abi_ulong`` is for the ``*-user`` targets, and represents a type the size of
+'``void *``' in that target's ABI. (This may not be the same as the size of a
 full CPU virtual address in the case of target ABIs which use 32 bit pointers
-on 64 bit CPUs, like sparc32plus.) Definitions of structures that must match
+on 64 bit CPUs, like *sparc32plus*.) Definitions of structures that must match
 the target's ABI must use this type for anything that on the target is defined
-to be an 'unsigned long' or a pointer type.
-There is also a signed version, abi_long.
+to be an '``unsigned long``' or a pointer type.
+There is also a signed version, ``abi_long``.
 
 Of course, take all of the above with a grain of salt.  If you're about
-to use some system interface that requires a type like size_t, pid_t or
-off_t, use matching types for any corresponding variables.
+to use some system interface that requires a type like ``size_t``, ``pid_t`` or
+``off_t``, use matching types for any corresponding variables.
 
-Also, if you try to use e.g., "unsigned int" as a type, and that
+Also, if you try to use e.g., '``unsigned int``' as a type, and that
 conflicts with the signedness of a related variable, sometimes
 it's best just to use the *wrong* type, if "pulling the thread"
 and fixing all related variables would be too invasive.
@@ -352,9 +352,9 @@ casts, then reconsider or ask for help.
 Pointers
 --------
 
-Ensure that all of your pointers are "const-correct".
+Ensure that all of your pointers are "``const``-correct".
 Unless a pointer is used to modify the pointed-to storage,
-give it the "const" attribute.  That way, the reader knows
+give it the '``const``' attribute.  That way, the reader knows
 up-front that this is a read-only pointer.  Perhaps more
 importantly, if we're diligent about this, when you see a non-const
 pointer, you're guaranteed that it is used to modify the storage
@@ -363,7 +363,7 @@ it points to, or it is aliased to another pointer that is.
 Typedefs
 --------
 
-Typedefs are used to eliminate the redundant 'struct' keyword, since type
+Typedefs are used to eliminate the redundant '``struct``' keyword, since type
 names have a different style than other identifiers ("CamelCase" versus
 "snake_case").  Each named struct type should have a CamelCase name and a
 corresponding typedef.
@@ -462,8 +462,8 @@ QEMU provides other useful string functions:
     int stristart(const char *str, const char *val, const char **ptr)
     int qemu_strnlen(const char *s, int max_len)
 
-There are also replacement character processing macros for isxyz and toxyz,
-so instead of e.g. isalnum you should use qemu_isalnum.
+There are also replacement character processing macros for ``isxyz`` and
+``toxyz``, so instead of e.g. ``isalnum`` you should use ``qemu_isalnum``.
 
 Because of the memory management rules, you must use ``g_strdup/g_strndup``
 instead of plain ``strdup/strndup``.
@@ -472,10 +472,10 @@ Printf-style functions
 ======================
 
 Whenever you add a new printf-style function, i.e., one with a format
-string argument and following "..." in its prototype, be sure to use
+string argument and following '``...``' in its prototype, be sure to use
 gcc's printf attribute directive in the prototype.
 
-This makes it so gcc's -Wformat and -Wformat-security options can do
+This makes it so gcc's ``-Wformat`` and ``-Wformat-security`` options can do
 their jobs and cross-check format strings with the number and types
 of arguments.
 
@@ -503,7 +503,7 @@ painful. These are:
   the sign bit (ie it is an arithmetic shift, not a logical shift)
 
 In addition, QEMU assumes that the compiler does not use the latitude
-given in C99 and C11 to treat aspects of signed '<<' as undefined, as
+given in C99 and C11 to treat aspects of signed '``<<``' as undefined, as
 documented in the GNU Compiler Collection manual starting at version 4.0.
 
 .. _autofree-ref:
@@ -659,10 +659,10 @@ Note that ``&error_fatal`` is just another way to ``exit(1)``, and
 trace-events style
 ==================
 
-0x prefix
----------
+``0x`` prefix
+-------------
 
-In trace-events files, use a '0x' prefix to specify hex numbers, as in:
+In trace-events files, use a '``0x``' prefix to specify hex numbers, as in:
 
 .. code-block:: c
 
@@ -676,27 +676,28 @@ PCI bus id):
 
     another_trace(int cssid, int ssid, int dev_num) "bus id: %x.%x.%04x"
 
-However, you can use '0x' for such groups if you want. Anyway, be sure that
+However, you can use '``0x``' for such groups if you want. Anyway, be sure that
 it is obvious that numbers are in hex, ex.:
 
 .. code-block:: c
 
     data_dump(uint8_t c1, uint8_t c2, uint8_t c3) "bytes (in hex): %02x %02x %02x"
 
-Rationale: hex numbers are hard to read in logs when there is no 0x prefix,
-especially when (occasionally) the representation doesn't contain any letters
-and especially in one line with other decimal numbers. Number groups are allowed
-to not use '0x' because for some things notations like %x.%x.%x are used not
-only in Qemu. Also dumping raw data bytes with '0x' is less readable.
+Rationale: hex numbers are hard to read in logs when there is no '``0x``'
+prefix, especially when (occasionally) the representation doesn't contain any
+letters and especially in one line with other decimal numbers. Number groups
+are allowed to not use '``0x``' because for some things notations like
+'``%x.%x.%x``' are used not only in QEMU. Also dumping raw data bytes with
+'``0x``' is less readable.
 
-'#' printf flag
----------------
+'``#``' printf flag
+-------------------
 
-Do not use printf flag '#', like '%#x'.
+Do not use printf flag '``#``', like '``%#x``'.
 
-Rationale: there are two ways to add a '0x' prefix to printed number: '0x%...'
-and '%#...'. For consistency the only one way should be used. Arguments for
-'0x%' are:
+Rationale: there are two ways to add a '``0x``' prefix to printed number:
+'``0x%...``' and '``%#...``'. For consistency the only one way should be used.
+Arguments for '``0x%``' are:
 
 * it is more popular
-* '%#' omits the 0x for the value 0 which makes output inconsistent
+* '``%#``' omits the ``0x`` for the value ``0`` which makes output inconsistent
-- 
2.31.1


