Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B4C2DCF65
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 11:19:12 +0100 (CET)
Received: from localhost ([::1]:36216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpqNM-0003Bl-0z
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 05:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kpqLz-0002kc-LF
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:17:47 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:43984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kpqLx-0003cG-PS
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:17:47 -0500
Received: by mail-ed1-x533.google.com with SMTP id q16so28037533edv.10
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 02:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=2BDOuHExCcml/7BkRvzRAco99XEK3VduBgJzvE4dqyU=;
 b=J/7jdy8bk7aZbXjg+M2ty2NlhdLMjICP6OkD+4PtkiaGnxYRTfFoj0QGZPZoHIu7tS
 sE4LqDKaqdcit1lXsyBoAYIV/abeMLX0apv20aYZumcZPh2Pcj38nsfroSU8fwoVroOc
 lIALvX5CdNgAZpQA7jpxvIGtoz77nPiEAVRWMKrEHT6SrY4C2uQp5byuLoNbPq9c+TYW
 YX1lDEugIFHLioR23rRTO9epKj5YDB7veeHEww0tpRR7q4fUK842FNpFo0gfs4AYLduY
 FJitA0h20oPjUc0YIbbbNPB0MGYM1IjuutPN6ptWmj/uW6WANetiGWlGX/V0SggRq2JB
 hs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=2BDOuHExCcml/7BkRvzRAco99XEK3VduBgJzvE4dqyU=;
 b=IAaWusIg8VHwSjJq3jw7xLlA/+R9PRWKsccAypQkApIWk93UUpKXJjXbAgL7CYj3iY
 l5q2/GK+GuTtHb3HjSScThd3oQmZJJ4JG19ONGhjig318v6MuSV/++Yoq2PT8lQgnPXM
 rCbTPBJklR6sqLCvYjvQKCjP7DAf/jOO781a5p8jvUwz7jpxJnO+BPHwghzIV1iHrHxD
 H+r+nTvPj0IU/NZUo58mqaWZ23xTOOY/pZOi7mwr75LgEajjDJhJV6AWg88MuQZygbfV
 fJO83kP9z+d1eslKMt90MfKAj3+8xRZE13nnsRZlZaqP5vTD6q1PvQOqGkXGLHFU/nL3
 WOWw==
X-Gm-Message-State: AOAM532aCbQV0l4e//6UPVazmGFs+AwHcDy7U/gsSWqH11vCD5fukr1X
 i/qglM5ntckq0+WnSbzW2tg=
X-Google-Smtp-Source: ABdhPJxqg/o20K3IXcQtGenaujngc7IrG0VODxkJn7v/AJDA9qKqeF4lnaA20d9bDYGJaUjLBPyYJQ==
X-Received: by 2002:a50:eb96:: with SMTP id y22mr38188780edr.91.1608200262198; 
 Thu, 17 Dec 2020 02:17:42 -0800 (PST)
Received: from [192.168.1.103] ([151.33.227.77])
 by smtp.gmail.com with ESMTPSA id a10sm3467957ejk.92.2020.12.17.02.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 02:17:41 -0800 (PST)
To: QEMU Developers <qemu-devel@nongnu.org>
From: Giuseppe Musacchio <thatlemon@gmail.com>
Subject: [PATCH] linux-user: Fix loading of BSS segments
Message-ID: <c9106487-dc4d-120a-bd48-665b3c617287@gmail.com>
Date: Thu, 17 Dec 2020 11:17:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=thatlemon@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some ELF binaries encode the .bss section as an extension of the data
ones by setting the segment p_memsz > p_filesz. Some other binaries take
a different route and encode it as a stand-alone PT_LOAD segment with
p_filesz = 0 and p_memsz > 0.

Both the encodings are actually correct per ELF specification but the
ELF loader had some troubles in handling the former: with the old logic
it was very likely to get Qemu to crash in zero_bss when trying to
access unmapped memory.

zero_bss isn't meant to allocate whole zero-filled segments but to
"complete" a previously mapped segment with the needed zero bits.

The fix is pretty simple, if the segment is completely zero-filled we
simply allocate one or more pages (according to p_memsz) and avoid
calling zero_bss altogether.

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
---
 linux-user/elfload.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0b02a92602..a16c240e0f 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2776,14 +2776,16 @@ static void load_elf_image(const char *image_name, int image_fd,
             vaddr = load_bias + eppnt->p_vaddr;
             vaddr_po = TARGET_ELF_PAGEOFFSET(vaddr);
             vaddr_ps = TARGET_ELF_PAGESTART(vaddr);
-            vaddr_len = TARGET_ELF_PAGELENGTH(eppnt->p_filesz + vaddr_po);
+
+            vaddr_ef = vaddr + eppnt->p_filesz;
+            vaddr_em = vaddr + eppnt->p_memsz;
 
             /*
-             * Some segments may be completely empty without any backing file
-             * segment, in that case just let zero_bss allocate an empty buffer
-             * for it.
+             * Some segments may be completely empty, with a non-zero p_memsz
+             * but no backing file segment.
              */
             if (eppnt->p_filesz != 0) {
+                vaddr_len = TARGET_ELF_PAGELENGTH(eppnt->p_filesz + vaddr_po);
                 error = target_mmap(vaddr_ps, vaddr_len, elf_prot,
                                     MAP_PRIVATE | MAP_FIXED,
                                     image_fd, eppnt->p_offset - vaddr_po);
@@ -2791,14 +2793,22 @@ static void load_elf_image(const char *image_name, int image_fd,
                 if (error == -1) {
                     goto exit_mmap;
                 }
-            }
 
-            vaddr_ef = vaddr + eppnt->p_filesz;
-            vaddr_em = vaddr + eppnt->p_memsz;
+                /*
+                 * If the load segment requests extra zeros (e.g. bss), map it.
+                 */
+                if (eppnt->p_filesz < eppnt->p_memsz) {
+                    zero_bss(vaddr_ef, vaddr_em, elf_prot);
+                }
+            } else if (eppnt->p_memsz != 0) {
+                vaddr_len = TARGET_ELF_PAGELENGTH(eppnt->p_memsz + vaddr_po);
+                error = target_mmap(vaddr_ps, vaddr_len, elf_prot,
+                                    MAP_PRIVATE | MAP_FIXED | MAP_ANONYMOUS,
+                                    -1, 0);
 
-            /* If the load segment requests extra zeros (e.g. bss), map it.  */
-            if (vaddr_ef < vaddr_em) {
-                zero_bss(vaddr_ef, vaddr_em, elf_prot);
+                if (error == -1) {
+                    goto exit_mmap;
+                }
             }
 
             /* Find the full program boundaries.  */
-- 
2.29.2


