Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B864D2DAED9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:24:53 +0100 (CET)
Received: from localhost ([::1]:49484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBG0-0008M4-Nu
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4W-0001Vr-JL
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:00 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4I-00076N-2v
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:12:56 -0500
Received: by mail-wm1-x336.google.com with SMTP id y23so18654455wmi.1
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lv9BxTsnVMI28ncB29ZUXQqJSkKOizde5SVuW6MLg8M=;
 b=CQnacXQtLN6dcn0iTm11ShOWW4AOpLpv8mQdqnf4vMtH7cOx59IlTVvg+lpnlgf1aO
 utMUn/8tWlHn2d/AmIoDBtPSVjGzhy+nKzWdvgj5SJhwMHIFcP71rme9JiM5CqKYbhOv
 Y4v/25X6WA88Hsjx0NaNihRsmPAOn6v+0ZBWQ6KpS5rSHpBVisMFLdmaKdu5pglEyKuw
 Y79mJBc144VDvDr83o/dRgR+ZcG4groNkVYE0OU5Mck/wibDUT7/+fGLV8w1iGMCmSrU
 Qo51Csdq7GYeiOLeKhGb7OHxGiQ130DtDpL+y73XllvVRQ+R9yB7c0O1QyvEs4TQ+ZP2
 LT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lv9BxTsnVMI28ncB29ZUXQqJSkKOizde5SVuW6MLg8M=;
 b=l8ydmX9IsrhuASbQyxGSa0roybpNVNLcJOhaptVv6f9U7h+liGaYnDZIWh8Yp8W7GZ
 s2++Q1qhZQHEw1zUsjrPfsCVpKTqszV54ZlEGt0MZWluU9y7Yx3EN9xOv3PtVVrHafkh
 b2bLfEJJXo8H7ylHsusYPe6fZQen9wYI4KdycIyr6/uf0TLxck0U5DjYNRrGkwfTMGnM
 /5Z92UpqWb7pdCSjwAdPtcT58UIvRrfoSoqqSeWEvjrC0uWwImpSESeE61QCdety0kk5
 aqTPHPSEq+yu2i/q8MDEu8jK0BPvE6zrhcZ9UvAcBypqcVoSoNc/a4LGuojAgsPWxVYR
 nWXQ==
X-Gm-Message-State: AOAM5306E5FBa+dz/5bA6+P5ntoYEsy9R5cqgqJkC5W52MEHTDjzzj04
 arLRfkFmxYZ9xeLp8HMGVTPMXpKN8zpxig==
X-Google-Smtp-Source: ABdhPJxeDcU/223Xj4nN+PFLHYQB8Tx662qNvJoYN1UoI1EjRopRvhR+WzH4dzqrPoI/3uHouxArxA==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr32064064wmi.20.1608041561181; 
 Tue, 15 Dec 2020 06:12:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.12.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:12:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/20] gdbstub: Correct misparsing of vCont C/S requests
Date: Tue, 15 Dec 2020 14:12:18 +0000
Message-Id: <20201215141237.17868-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the vCont packet, two of the command actions (C and S) take an
argument specifying the signal to be sent to the process/thread, which is
sent as an ASCII string of two hex digits which immediately follow the
'C' or 'S' character.

Our code for parsing this packet accidentally skipped the first of the
two bytes of the signal value, because it started parsing the hex string
at 'p + 1' when the preceding code had already moved past the 'C' or
'S' with "cur_action = *p++".

This meant that we would only do the right thing for signals below
10, and would misinterpret the rest.  For instance, when the debugger
wants to send the process a SIGPROF (27 on x86-64) we mangle this into
a SIGSEGV (11).

Remove the accidental double increment.

Fixes: https://bugs.launchpad.net/qemu/+bug/1773743
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20201121210342.10089-1-peter.maydell@linaro.org
---
 gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index f19f98ab1ab..d99bc0bf2ea 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1243,7 +1243,7 @@ static int gdb_handle_vcont(const char *p)
         cur_action = *p++;
         if (cur_action == 'C' || cur_action == 'S') {
             cur_action = qemu_tolower(cur_action);
-            res = qemu_strtoul(p + 1, &p, 16, &tmp);
+            res = qemu_strtoul(p, &p, 16, &tmp);
             if (res) {
                 goto out;
             }
-- 
2.20.1


