Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE124463CDB
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 18:32:03 +0100 (CET)
Received: from localhost ([::1]:56434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms6z4-0004B1-Iv
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 12:32:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmiller@gmail.com>)
 id 1ms6xR-0002eM-7Z; Tue, 30 Nov 2021 12:30:21 -0500
Received: from [2607:f8b0:4864:20::f2b] (port=43970
 helo=mail-qv1-xf2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <emmiller@gmail.com>)
 id 1ms6xM-0005mO-RA; Tue, 30 Nov 2021 12:30:20 -0500
Received: by mail-qv1-xf2b.google.com with SMTP id j9so18666136qvm.10;
 Tue, 30 Nov 2021 09:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=6k52PxujPTpHvPAFY2ubvJVVQOKd3T3Fqw+xS3zU6b4=;
 b=n0ijgJe0BZ+CE+dVFoX0ep302tOG3zjuuaivMAnWPu/IP6/RbPQvRY6HiIVndB+N+c
 f4MvCYPYLnY9m8f2PB24i1zTwS4pTZxKhTC9kvv+H1aCRWfnu3kFXecHwCNHmQCP764R
 rLkCE34iDwLI9PhogFtCkvZ0B38lvPIMcMV4LuLk5FPBWoLpkqnOhdKCK+U1AbNlBWmG
 2YrVMcAK2jixf1gyoBVVXywqoZkTfLH4LzuLPYWqliAaU9UGehqFugSHtc3SZczQ3F/V
 Y56SaFO8MXTzBNKLOpCsv3QtRgbxTDatyUhjF3O/lq+MH7UbrHEUduo1vkWcDIzCTQmh
 4+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=6k52PxujPTpHvPAFY2ubvJVVQOKd3T3Fqw+xS3zU6b4=;
 b=xN3CfNZ18vbTZODAUnTC2ssZECUVwXhedXEyg9oVwzN8PFyyugPrmyA8HPugQa9PE1
 rEkZXL91rpRVq83Nsm/18XtWQhHKOvMdM/r2kWRpH9VoyxUyGFc1pvF8FOmsFBAwZR+6
 xLrM1gegr8PiAQDJDff/QoaWYTI6h4DegU8Qkja/AJwk5fdqPn3XeCgNh+pr2677AHSk
 3aEhB/q1UCq6TyDLZwUfKm6gi2NSteGI9H4vvhfQ4uB341On61/L6EKuTYme9ypcgfzP
 U+AGVjwASYZpOFKz/GwxohRPpWs6otvtf7KlFB+mmnUJoHCERYf4TPz6SQV2d0LK1VuK
 ANVw==
X-Gm-Message-State: AOAM530cjSaw3WAgUpRTMYhx4UHkNiOmkEOv9UWz/f7j+4+9SQ+X0XGK
 ZMwzbnrlmezpr3tsvjhVw4PEvDcZuCQ=
X-Google-Smtp-Source: ABdhPJz7bE7uSZNi8AmOqI6PrieX/nEYeSbPkwWaW27eXe2QwiTwkWmX08duFB1LJtXrE/oUt3aUlQ==
X-Received: by 2002:a05:6214:19e5:: with SMTP id
 q5mr818971qvc.74.1638293413968; 
 Tue, 30 Nov 2021 09:30:13 -0800 (PST)
Received: from smtpclient.apple (host-66-85-236-20.MIDOLT3.epbfi.com.
 [66.85.236.20])
 by smtp.gmail.com with ESMTPSA id v4sm10674397qkp.118.2021.11.30.09.30.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Nov 2021 09:30:13 -0800 (PST)
From: Evan Miller <emmiller@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: [PATCH] scripts/entitlement.sh: Use backward-compatible cp flags
Message-Id: <40635C6E-059A-4146-B1E2-F6376700EE85@gmail.com>
Date: Tue, 30 Nov 2021 12:30:12 -0500
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=emmiller@gmail.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Older versions of Mac OS X do not support cp -a. The cp man page =
indicates that -a is equivalent to -pPR.

Signed-off-by: Evan Miller <emmiller@gmail.com>

--- scripts/entitlement.sh.orig
+++ scripts/entitlement.sh
@@ -15,7 +15,7 @@

 if $in_place; then
   trap 'rm "$DST.tmp"' exit
-  cp -af "$SRC" "$DST.tmp"
+  cp -pPRf "$SRC" "$DST.tmp"
   SRC=3D"$DST.tmp"
 else
   cd "$MESON_INSTALL_DESTDIR_PREFIX"=

