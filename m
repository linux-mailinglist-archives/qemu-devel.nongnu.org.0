Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916BA47B53F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:32:34 +0100 (CET)
Received: from localhost ([::1]:45520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQGl-0002Kp-HT
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:32:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <louiswpf@gmail.com>)
 id 1mzMjf-0007Yc-6T
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 12:46:07 -0500
Received: from [2607:f8b0:4864:20::435] (port=39594
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <louiswpf@gmail.com>)
 id 1mzMja-00064w-NU
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 12:46:06 -0500
Received: by mail-pf1-x435.google.com with SMTP id i12so9371430pfd.6
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 09:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4gRME8Jl7CzvvsvqWe9fDu9AC8WszzbHuvuLjR6vlSs=;
 b=Jb0ct8sUN4Wv6nAH2yKml1KD9kK5PNqXFhe4q+Er1dieUXaa55120XVA8G1ALRF9XA
 BVXhZtDPcvSgryijEX+a0sL1AwhqxK/cMdWT2+KXzKYQ/DGzH0mNXTxc2ub975s65miS
 m6P4LSmbWPtB7WjVAirBSLXfyhT33T/+2RcuI+24eKaz4QLUYDCtZY5gATcWzsLrTASv
 lMEzEsZvWS8Ysng2mWsavpP6aPiA1oA6x57Cmseha34r6hhBsQA1hkFTg4e3JAs3JeuU
 6SrIP4kcwmOl72WZR6KHzSzVGCTsPS9b3ql1mkYHrDAi6a0A7qkKPla2Gapk5fk2pzwa
 tFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4gRME8Jl7CzvvsvqWe9fDu9AC8WszzbHuvuLjR6vlSs=;
 b=Wa8/q4JggZxtaLz1rzIYqH/rSnb9f37IZYGj82EdRKPsbLSgFhBxXYv/e55j6518Fb
 cgdJCoqeLO7xwvES28UqEIFBycAZUtfsyYQh17u//SGS7SPK1EygHFXQbT8/KIkXc+Qg
 CKtzd43QvZF61BXp0tCXQ+0DcJKhW65ba0BKiAqdwGV3hhQzSTPui+BvnSOo50tWm7/d
 fwmNrgXapENSaoyIgCguocmNO9uyrDQEbNYOSrz4W1itgP0WgiJ6eN1kQp6IzH0iQb9W
 GSKHJKgVJTTA4uiZCharVybEwMttcOmBdNwJq/jGFXte0mj7Wcskl+JE0bWoYGXdBSvd
 2scA==
X-Gm-Message-State: AOAM531/JDQe0mqmlmXrGml4UKfVWfEs7ywKtKsl6/7x0TSv723NESeg
 IjYC3OGQPKuup3T1NfMXNk3nP+B71nTuH3+M
X-Google-Smtp-Source: ABdhPJxL3buvQSy7urJLIVG5Av7GZMVxqVbgZYvZy31ulnPGfvTCyw/iJUWGj/80N3evEdsdEja8Rg==
X-Received: by 2002:a63:b307:: with SMTP id i7mr15972520pgf.445.1640022360481; 
 Mon, 20 Dec 2021 09:46:00 -0800 (PST)
Received: from GA-H97-D3H.. (36-227-10-24.dynamic-ip.hinet.net. [36.227.10.24])
 by smtp.gmail.com with ESMTPSA id p12sm20877406pfo.125.2021.12.20.09.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 09:46:00 -0800 (PST)
From: Wang Bing-hua <louiswpf@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] python/qom: Fix qom-set failure
Date: Tue, 21 Dec 2021 01:44:18 +0800
Message-Id: <20211220174418.84977-1-louiswpf@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=louiswpf@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Dec 2021 16:21:32 -0500
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
Cc: Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Wang Bing-hua <louiswpf@gmail.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the following failure by interpreting 'value' argument as 'int'.

$ scripts/qmp/qom-set -s /tmp/qmp-socket /machine/unattached/device[6].temperature 0
QMPResponseError: Invalid parameter type for 'temperature', expected: integer

Fixes: c750c02891a8 ("python/qmp: Add qom script rewrites")
Signed-off-by: Wang Bing-hua <louiswpf@gmail.com>
---
 python/qemu/qmp/qom.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/python/qemu/qmp/qom.py b/python/qemu/qmp/qom.py
index 8ff28a8343..0b77dc6aa3 100644
--- a/python/qemu/qmp/qom.py
+++ b/python/qemu/qmp/qom.py
@@ -72,6 +72,7 @@ def configure_parser(cls, parser: argparse.ArgumentParser) -> None:
         cls.add_path_prop_arg(parser)
         parser.add_argument(
             'value',
+            type=int,
             metavar='<value>',
             action='store',
             help='new QOM property value'
-- 
2.34.1


