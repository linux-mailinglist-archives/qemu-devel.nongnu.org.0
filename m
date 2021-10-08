Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9E042730B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 23:26:31 +0200 (CEST)
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYxNt-0005lV-Ie
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 17:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLY-00038j-AP
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:04 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:34655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLV-0007ap-SG
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:04 -0400
Received: by mail-il1-x133.google.com with SMTP id g2so10220986ild.1
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 14:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DYsMf0EeCXXiCSqpezkSLSAAHmDyz9LOCTsaNzpN77s=;
 b=5l7zjltjobeeyHiiopg8s9+sIR3fdGAY5GWBqt+MNNz8+GyuvVWklt1O1+4iiexZM4
 DuiIjXN4GtpgMNTBtiLuqifmav6OL0FORDh08WOdfp30XlB2KLp07SwMXJWQDogt2F/K
 hhkZaVvCJMvb3my93aSs+7NUc8STAgSMVQJNb5BLES3Gf/fJdgXjXBQdlJxxpNXfCJKA
 1m7e1I5nLRbNkIEC+mdQNaXaC8pKp3aLD8TXeD5/Ykp6Sk+/IMb1kLFAYKBGjn1y4POW
 if1DXLonLWElSbQQzcduXmRTOwTRyTi/lYitcH+Og+hsDKJ3crVRh0FQ0ACpLgqzmolA
 uCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DYsMf0EeCXXiCSqpezkSLSAAHmDyz9LOCTsaNzpN77s=;
 b=xIzWoGs8Wk9MzTx4rvAscnHveN7DuZQcRNchGR36jNASXHw/Q9E4Hw+jhQTF8+52DG
 5rSqrBODhjpoSl+2XRZgyu1Uho8zjlyAS9ouPlnDdZrtOF8FB4+35J7YhbEXRqRsqRXM
 YrlBJ5ZpR/79LD4oLSp+AKoWAX2UoOU6w5n6eYX+i6QK5lOimMi2TilDJMGCPBlCBg17
 /f4epl+qnv7UeSQWyGZo/SNIhp9RLsvxsTF6QICD1bomCcGD9glhGqktxmrTboAx6JXH
 zwlMOA0jj7tat63lL7rOKC67K/xRsBnytHbJQRL2fU03CQ5BkPCzPXNkzyy/fTSivF3d
 CDfg==
X-Gm-Message-State: AOAM531ndUAOcVZ9Eyyj5JpZy40PIT7z5xx4weAl9lk6opTujIFEyVkk
 vzanaOhxnXXYwS6LsUfM5FcpH4ACMttAcQ==
X-Google-Smtp-Source: ABdhPJwUBZQefd6zUr+Bfn+HUWZA6deBle5KhqIRMER1j4935j8BoF4booKAmnN04N+A97+BBncwWg==
X-Received: by 2002:a05:6e02:1564:: with SMTP id
 k4mr9835224ilu.269.1633728239783; 
 Fri, 08 Oct 2021 14:23:59 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm186620ild.52.2021.10.08.14.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 14:23:59 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/9] bsd-user mmap fixes
Date: Fri,  8 Oct 2021 15:23:35 -0600
Message-Id: <20211008212344.95537-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, richard.henderson@linaro.org, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series synchronizes mmap.c with the bsd-user fork. This is a mix of old bug
fixes pulled in from linux-user, as well as some newer fixes to adress bugs
found in check-tcg and recent FreeBSD developments. There are also a couple of
style commits. Updated to migrate debugging to qemu_log.

v3: reimplement the logging with qemu_log
    redo MAP_EXCL based on review feedback
    update fd == -1 MAP_ANON fix with description of what's going on

v2: do the cherry-picks from linux-user in qemu-style.

Guy Yur (1):
  bsd-user/mmap.c: Don't mmap fd == -1 independently from MAP_ANON flag

Kyle Evans (1):
  bsd-user/mmap.c: Implement MAP_EXCL, required by jemalloc in head

Mikaël Urankar (2):
  bsd-user/mmap.c: Always zero MAP_ANONYMOUS memory in mmap_frag()
  bsd-user/mmap.c: check pread's return value to fix warnings with
    _FORTIFY_SOURCE

Warner Losh (5):
  bsd-user/mmap.c: MAP_ symbols are defined, so no need for ifdefs
  bsd-user/mmap.c: mmap return ENOMEM on overflow
  bsd-user/mmap.c: mmap prefer MAP_ANON for BSD
  bsd-user/mmap.c: Convert to qemu_log logging for mmap debugging
  bsd-user/mmap.c: assert that target_mprotect cannot fail

 bsd-user/mmap.c | 146 ++++++++++++++++++++++++++----------------------
 1 file changed, 79 insertions(+), 67 deletions(-)

-- 
2.32.0


