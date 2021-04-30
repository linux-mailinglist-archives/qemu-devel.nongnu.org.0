Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A52936FD66
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 17:12:07 +0200 (CEST)
Received: from localhost ([::1]:49652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcUoI-0005HB-JL
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 11:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sguelton@redhat.com>)
 id 1lcUkT-0002i8-9n
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:08:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sguelton@redhat.com>)
 id 1lcUkK-0003Vx-Nq
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619795278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+VSUJXhr7+FMvVxsYo48gJ8kkG68R3As+c+JifbZNfU=;
 b=AsSchExe9KqA3D2aBg6NxLoA3lcpU8mwTcwdeaGonaDwOIOJpkYoiWMD1fWjLM+b+PILK2
 qXDe7fwXKFmJG6rnrwGELytcj0TK320a/sV4BJwrMlvOYJps1zvWsXdQ5XCU3Il2GI7H5D
 F2W0Z0KwqxlVWT/XnN+1XWOUWR8SiZw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-NPKrxAksOimxTm401BSjPQ-1; Fri, 30 Apr 2021 11:07:49 -0400
X-MC-Unique: NPKrxAksOimxTm401BSjPQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 a12-20020a5d6cac0000b0290109c3c8d66fso9632240wra.15
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding:user-agent;
 bh=+VSUJXhr7+FMvVxsYo48gJ8kkG68R3As+c+JifbZNfU=;
 b=IcpeJm4zAqql5Pv/mBbrKPk4L0eav2OpVslNX9+4kKzldhu0knojixHzPkxVEZtX4i
 nIjt/CNihS8ED1kzq3TDmOYGPSWbce39P5PcoiFZYEyWCr3jn+bSL3jAwgH7goLKFBVq
 hmxRV2zrjbWRA9z6DZhzq54wiQ99FTnh8uYPswZsD6gNCl08Eyxb9dYpMK/EU80LVVhY
 Dpj1MRYMoNdCtQUKzw5R+/TM7ALh11oPBy5loXNcS7pFJZaiihdKBQlp/l0TrRd30pVL
 hE2AudBJNtov/qSPFI0dk7o+IerdiQ3XUBoGk1fDNtAJ5rdXNSj/YxpJ2TvDcz+VWoGA
 QnkQ==
X-Gm-Message-State: AOAM530Yy9qwwBUYmVf11H5Rw0ch6px7S+b1sB8j9Iu/gWRlVQuiKWtT
 JmyHjgeNq6nw/9zF97QbReU7t12DLcD+8mwMPY/1qg06BTt39Ni218krzcMNEejGRkKemXFiQWa
 wkVUSx0Hw5ZLiQL/HcP39SkgbLXWtJPeYR81ZW+x4uPJgSzTILlTbq9h8fk/TSs1Da5E=
X-Received: by 2002:a7b:c4cf:: with SMTP id g15mr6624625wmk.163.1619795267987; 
 Fri, 30 Apr 2021 08:07:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN0/CCHx9+vgeFLUWjmiN+cBWpkMGGNEtodHoq0Pi1xpihqyE39gdna0ZzIuCkdNYBkhJmmw==
X-Received: by 2002:a7b:c4cf:: with SMTP id g15mr6624585wmk.163.1619795267657; 
 Fri, 30 Apr 2021 08:07:47 -0700 (PDT)
Received: from localhost ([2a01:e0a:923:3150:6f60:5f78:f08b:c504])
 by smtp.gmail.com with ESMTPSA id n3sm3282350wmi.7.2021.04.30.08.07.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Apr 2021 08:07:47 -0700 (PDT)
Date: Fri, 30 Apr 2021 17:07:45 +0200
From: Serge Guelton <sguelton@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] Fix typo in CFI build documentation
Message-ID: <20210430150745.GA1401713@sguelton.remote.csb>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sguelton@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sguelton@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, philmd@redhat.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Serge Guelton <sguelton@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/control-flow-integrity.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/control-flow-integrity.rst b/docs/devel/control-flow-integrity.rst
index d89d707..e6b73a4 100644
--- a/docs/devel/control-flow-integrity.rst
+++ b/docs/devel/control-flow-integrity.rst
@@ -39,7 +39,7 @@ later).
 Given the use of LTO, a version of AR that supports LLVM IR is required.
 The easies way of doing this is by selecting the AR provided by LLVM::
 
- AR=llvm-ar-9 CC=clang-9 CXX=lang++-9 /path/to/configure --enable-cfi
+ AR=llvm-ar-9 CC=clang-9 CXX=clang++-9 /path/to/configure --enable-cfi
 
 CFI is enabled on every binary produced.
 
@@ -131,7 +131,7 @@ lld with version 11+.
 In other words, to compile with fuzzing and CFI, clang 11+ is required, and
 lld needs to be used as a linker::
 
- AR=llvm-ar-11 CC=clang-11 CXX=lang++-11 /path/to/configure --enable-cfi \
+ AR=llvm-ar-11 CC=clang-11 CXX=clang++-11 /path/to/configure --enable-cfi \
                            -enable-fuzzing --extra-ldflags="-fuse-ld=lld"
 
 and then, compile the fuzzers as usual.
-- 
1.8.3.1


