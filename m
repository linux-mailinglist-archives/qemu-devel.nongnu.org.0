Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E87C488C61
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 22:00:04 +0100 (CET)
Received: from localhost ([::1]:56642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6fIJ-0007cx-J5
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 16:00:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n6fGH-0004xa-VE
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 15:58:03 -0500
Received: from [2a00:1450:4864:20::129] (port=41747
 helo=mail-lf1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n6fGF-0004MF-8i
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 15:57:56 -0500
Received: by mail-lf1-x129.google.com with SMTP id x7so37392244lfu.8
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 12:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I/sIwKo4ZoCICzz9LmlojMKy+Zj7qObGKmjZwg+cuTI=;
 b=ERfbKRC4HnXsXHEqe9GRxml+O2VpLKuoif/gKrvlolBCaMxhBZrFCp7elm+At0VrvA
 GUqJR3C1b/DPeKhHHE4oabpnUpPS33sOjD7IvteXwD+8aRVmYEQmgsA10oNbU7qwRx/q
 mHbRDVip1+cvo2YPCU9emzGSw79raxWrzE4R9yhB3tgPlP4AZC+z0oBGtHhiM0+UAr5L
 UDDOut2s+ki/KxGubTII1lhnbIdUo1VIMNxhs4FYQRQfxKytGcNtpii805Pvr/6m3rRu
 5Ya2WXPZwFG4FpdHymVmQ5Bliff06jo0KIvrZo4JWR0r08PuqhY4Ac+xfepuu5n4ar1p
 /heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I/sIwKo4ZoCICzz9LmlojMKy+Zj7qObGKmjZwg+cuTI=;
 b=cN/dvhGEP2mnNVFGJpfHT5kUytIFcoX5KHq2PEtxyTM9/tMOhWPU1JSPuenPketxg+
 hawJndjnF3R52n7VAcgEnrM5wRyCt0VXoW01hxYaEHajI4BVZd5npCPKoQjjmPJzxWY6
 nfp/rxYsVok+XM4l+IDuLxRck2ONunFJXHRRDEbEK3sp2zWTYdf8TYKRV5VDXClEcT0O
 eGeRpb8dgjW1ghkv4Mc1ci4Ra+OP2lXlqQoSaiNGg7u2x11WgVduK8dkBpOoAv/19UPz
 zRiBumUN3KeIbfocB1X09qSfbmykPjllyyymKbSUwsu7smwU6HAEuwXNeuUncKSrMNPi
 URlQ==
X-Gm-Message-State: AOAM531aM4aSTuT0P05sgWlJvnI+UNVPOCHU0AJM/a8+URFWV9UfvoC6
 6uKa6Aj4gGu9graRV8LdpsJo8aQIayB53Ff8
X-Google-Smtp-Source: ABdhPJwLiPOWaQI/Kp6gyG+QSNkYJXDXVwwAvIRc6AzBP6cFZfufOYP4DLX0uGXA9zoVvpNTp3MFuw==
X-Received: by 2002:a05:6512:472:: with SMTP id
 x18mr60266061lfd.566.1641761871269; 
 Sun, 09 Jan 2022 12:57:51 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id s10sm763544lfr.45.2022.01.09.12.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 12:57:50 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] net/dump.c: Suppress spurious compiler warning
Date: Sun,  9 Jan 2022 21:57:48 +0100
Message-Id: <20220109205748.4127032-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::129
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x129.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compiling with gcc version 11.2.0 (Ubuntu 11.2.0-13ubuntu1) results in
a (spurious) warning:

  In function ‘dump_receive_iov’,
      inlined from ‘filter_dump_receive_iov’ at ../net/dump.c:157:5:
  ../net/dump.c:89:9: error: ‘writev’ specified size 18446744073709551600 exceeds maximum object size 9223372036854775807 [-Werror=stringop-overflow=]
     89 |     if (writev(s->fd, dumpiov, cnt + 1) != sizeof(hdr) + caplen) {
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  In file included from /home/ptomsich/qemu/include/qemu/osdep.h:108,
                   from ../net/dump.c:25:
  ../net/dump.c: In function ‘filter_dump_receive_iov’:
  /usr/include/x86_64-linux-gnu/sys/uio.h:52:16: note: in a call to function ‘writev’ declared with attribute ‘read_only (2, 3)’
     52 | extern ssize_t writev (int __fd, const struct iovec *__iovec, int __count)
        |                ^~~~~~
  cc1: all warnings being treated as errors

This change helps that version of GCC to understand what is going on
and suppresses this warning.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

---

 net/dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/dump.c b/net/dump.c
index a07ba62401..c32d3bf4e6 100644
--- a/net/dump.c
+++ b/net/dump.c
@@ -86,7 +86,7 @@ static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt)
     dumpiov[0].iov_len = sizeof(hdr);
     cnt = iov_copy(&dumpiov[1], cnt, iov, cnt, 0, caplen);
 
-    if (writev(s->fd, dumpiov, cnt + 1) != sizeof(hdr) + caplen) {
+    if (writev(s->fd, &dumpiov[0], cnt + 1) != sizeof(hdr) + caplen) {
         error_report("network dump write error - stopping dump");
         close(s->fd);
         s->fd = -1;
-- 
2.33.1


