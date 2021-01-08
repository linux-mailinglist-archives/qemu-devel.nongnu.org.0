Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0DE2EF6C5
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 18:48:21 +0100 (CET)
Received: from localhost ([::1]:34002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxvs4-0002lb-Bh
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 12:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1kxvqs-0002L2-P1
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:47:06 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1kxvqo-0002Ej-Al
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:47:06 -0500
Received: by mail-wr1-x436.google.com with SMTP id c5so9782302wrp.6
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 09:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=GPnhufm1gkN558OqkqWvAPYufvUP6yYE4W7hNXWoHAc=;
 b=FZasHKVpLXY3VHYtTVlf/hu0V93J8sOvKC2ej4a3BcAPqfIZXwexetI1VwwIgJ9ATT
 5dxK8q4CfYFLz8+o4v0y6S5ZXhOOP4b2xg/EsjBAZ0TmwT1VWwGyjTRdub6Izq5uUni4
 WlKsWFF2qmLhotwTfakcq4Y2XCxA/Ox0mMmsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=GPnhufm1gkN558OqkqWvAPYufvUP6yYE4W7hNXWoHAc=;
 b=CBfQZ8yO436Fn2gSwBU6isaupAR4bAQBIQMS+iXufIXMwya2nMg6ClS6p6Hny/kq6K
 qtuzMSAulKvMHNNDJAGncEfWbUSdUqm8+FcuSByIaNhjhTl8yH0eQ1NHRgrl3uNqnBNO
 L7GuxdJFtITRxw4lUnghIA6+ZQ40loCS+d0adgFJ6ew4idSyQf/k/a7HhfRivxCreipu
 KN5z8kGnO5JKTPIgE6ofteMu+qly+idtsbpLdbtwlAdGpyo4hQYzEUbHKU+hL8zMLbhP
 aAC6pDQHAIAoODyfI7hKk6/RTAH4/gfpvZEx4O0Gj97jrTD1we7J0CeSdWhm0IoOTcIu
 FF5A==
X-Gm-Message-State: AOAM533LShxlGYiJteHAgAy18j7QrqGNM3E/Qx4IdfXqnPuxpneyBd2c
 M2KlmOZEXxV4HgPLCV6n6uSCB4X8VsfeFQ==
X-Google-Smtp-Source: ABdhPJzqV39zBHUt4cQ9ioydZg8RYSkfm4HM4CaijZi1oGLolKqgZLuZNNG9GYZlB76zWePKDoRj6w==
X-Received: by 2002:adf:9525:: with SMTP id 34mr4836780wrs.389.1610128020627; 
 Fri, 08 Jan 2021 09:47:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8262:2156:a38b:824c?
 ([2001:8b0:aba:5f3c:8262:2156:a38b:824c])
 by smtp.gmail.com with ESMTPSA id o23sm15082903wro.57.2021.01.08.09.47.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 09:47:00 -0800 (PST)
Message-ID: <b71cbfb68c227ae999e8caa5e247d5bb93ddad43.camel@linuxfoundation.org>
Subject: [RFC PATCH] linux-user/mmap: Return EFAULT for invalid addresses
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Date: Fri, 08 Jan 2021 17:46:59 +0000
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.purdie@linuxfoundation.org;
 helo=mail-wr1-x436.google.com
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

When using qemu-i386 to run gobject introspection parts of a webkitgtk 
build using musl as libc on a 64 bit host, it sits in an infinite loop 
of mremap calls of ever decreasing/increasing addresses.

I suspect something in the musl memory allocation code loops indefinitely
if it only sees ENOMEM and only exits when it hits EFAULT.

According to the docs, trying to mremap outside the address space
can/should return EFAULT and changing this allows the build to succeed.

There was previous discussion of this as it used to work before qemu 2.11
and we've carried hacks to work around it since, this appears to be a
better fix of the real issue?

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org

Index: qemu-5.2.0/linux-user/mmap.c
===================================================================
--- qemu-5.2.0.orig/linux-user/mmap.c
+++ qemu-5.2.0/linux-user/mmap.c
@@ -727,7 +727,7 @@ abi_long target_mremap(abi_ulong old_add
          !guest_range_valid(new_addr, new_size)) ||
         ((flags & MREMAP_MAYMOVE) == 0 &&
          !guest_range_valid(old_addr, new_size))) {
-        errno = ENOMEM;
+        errno = EFAULT;
         return -1;
     }
 


