Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2CB4875EA
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 11:53:14 +0100 (CET)
Received: from localhost ([::1]:36810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5mrw-0008Kq-Pv
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 05:53:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5mpp-0006or-Ue
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:51:01 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:52947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5mpo-0007ql-5E
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:51:01 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MJEIl-1mms080APL-00KimF; Fri, 07
 Jan 2022 11:50:51 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] q800: fix segfault with invalid MacROM
Date: Fri,  7 Jan 2022 11:50:49 +0100
Message-Id: <20220107105049.961489-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QA6R4rufzx2RmRtizuCJurUyRbmGrPnaYntT+TujmSe98eFqoV4
 MeaBE878o2LUBa0GWLKJDkYaWu6VH5I/td6P/DWMp4ZbFWwzWfcTPIcXsKu5vfwudz4QZqj
 KUH33msifpibk5SiW0LGnt+R+6i6KkAmrWGiYLuTtDF6cuUoPLDnrpczobNlnlQ3CZ2GChR
 8eIXyr8PA+K1XdUj+JzIQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ENjFE17EqNc=:JAcnBdCpkCW2LI+2Q8jLW2
 bPyrjIVBQnA9I3dnzxRd3LcDywDdkj0ZtLwGoFTlfo7uITjw5K1xBX+IE4oASWVQBt/gpwTta
 56BaWXONSiCm9/r1lt/Ga36dvc0dAUtZj13MM9akBMvH8IJNLp3wKPU/xj7/NU0cmp9bNpRya
 00y9caJnLrC8/Hxlk98DBu+4ZPxRpdxW+KtSA/y1c15SVtWuJjlhXJ8aU7MABguREQ3Wlg+Lw
 P2cxltBYwrB1CaANjr43x7SBS6SDMFwaYkh7Xo9ig0/PRMpCiO9CETrT3JNvhjb9tJWmWxqg3
 +9cXgZKs2HG0hanhujG2cvc9einkatMYNsc543UK0dTTkI4rjEFYQXqK6MfcGNN9bWJma8P42
 4CtObvnAXa20yCPwN3zpY9iTBxBlegyDSb+1DgFakISV7QpJ37fEqoqVoFDDcJSaygp7juBJ6
 gpzhRrzfB0PYS75N6DUVl0SzAgYYgL6u3aJ5Qg5XaOt8GTTADGV0E0pZQmznoOcom48WScEtf
 msFlq2YRWw1oa9J4dWZxStyRjPMkj/9UugRhmAG4xhY4gKj4kPSXN679HfP44vA9R3AxhIEEK
 p8TpmtV8W6XwCYRQklswSuiUHi37D5cdk6bQVRf2KSEjocpdlGMpmGdvzSXY0vz/YXwv6F6yR
 fMAuxvX+FdJlbCbfAkDgBLc3tyyyoFYd9c6hxtWAGijqo/QVAp/CoAW/Y90vL7F3UGL8=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"qemu-system-m68k -M q800 -bios /dev/null" crashes with a segfault
in q800_init().
This happens because the code doesn't check that rom_ptr() returned
a non-NULL pointer .

To avoid NULL pointer, don't allow 0 sized file and use bios_size with
rom_ptr().

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/756
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index e4c7c9b88ad0..55dfe5036f40 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -672,12 +672,13 @@ static void q800_init(MachineState *machine)
 
         /* Remove qtest_enabled() check once firmware files are in the tree */
         if (!qtest_enabled()) {
-            if (bios_size < 0 || bios_size > MACROM_SIZE) {
+            if (bios_size <= 0 || bios_size > MACROM_SIZE) {
                 error_report("could not load MacROM '%s'", bios_name);
                 exit(1);
             }
 
-            ptr = rom_ptr(MACROM_ADDR, MACROM_SIZE);
+            ptr = rom_ptr(MACROM_ADDR, bios_size);
+            assert(ptr != NULL);
             stl_phys(cs->as, 0, ldl_p(ptr));    /* reset initial SP */
             stl_phys(cs->as, 4,
                      MACROM_ADDR + ldl_p(ptr + 4)); /* reset initial PC */
-- 
2.33.1


