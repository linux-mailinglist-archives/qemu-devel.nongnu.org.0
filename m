Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BA16FEF62
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:53:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2xC-0000wB-05; Thu, 11 May 2023 05:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2x5-0000t6-EH
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2x3-0006lc-UY
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ze93V+atfsJyibtt/ZVXjr2Ea7wndCQr1+Ns6zh7xvQ=;
 b=MHirg+JmmItR0HrOEk48FXVfiC10TP53HFJbRB3LjMH7XkORdjfY8OlJIVLzD6ND6LMpTH
 FTmdHezFJWAzeRTU62uTqKLIWIds6H9k4wRUzyxTka0uJsEtLPoB3Kk79o2LwNX44d+eGj
 yEQxP+DVS6Y4yM2JCJqp0WMser4T7dM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-vRpkCiFlMha19KbuIzJpjw-1; Thu, 11 May 2023 05:51:06 -0400
X-MC-Unique: vRpkCiFlMha19KbuIzJpjw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50d89279d95so2376597a12.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798665; x=1686390665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ze93V+atfsJyibtt/ZVXjr2Ea7wndCQr1+Ns6zh7xvQ=;
 b=Eo2h2x9WD7nitliS1rLB4zrp4tOvyNZOlyqaiXRdGVfxb3S60R9/wdczde8ZfBhkrt
 yj1EqgwwVXNpq0/DsexDlc9opey3cVXzoN3iSwxArGsYqkNzQhwzrhlah57TLRkEIBza
 9G2WS7gtwu8rUf12nqV0N1UC/eQ7HGeEy0q5Mt1ho+nHO7Rs2Id3f8o+sUmN0Tg/3Dqi
 MCU1H5ylpXiyxlImdYffd6uL9nm672FEfyRusFVxFNXTGtu/rcSObakqYH+2yTUgGds/
 DEVjlqmwcUEBmVMR+aAb//91qepojtvcOdKfrB0zkAj3PIGg6eJ7sieukd5ZytcrcY+i
 X7tw==
X-Gm-Message-State: AC+VfDxO9Vyyu/tdyKDF4FIV8Vlhvl/k/VCYCErbV4XDRlhZeOZ9lwNQ
 3l7O0JhLNi/NR2ti1LxJQRyOXUQkqqu2aBUjGID6E+s83z+lcP659W7yq9O1DBxNgntwpyr1vKZ
 zfbnJ8BdvKqROoUjCz7Ii1RbyE8Xraf61IslUSKRy3wLQF61O9XdGIYZ1OO+qeNVk4dvrKtlSCt
 c=
X-Received: by 2002:a17:907:2d0e:b0:967:13a3:d82c with SMTP id
 gs14-20020a1709072d0e00b0096713a3d82cmr12598374ejc.26.1683798665466; 
 Thu, 11 May 2023 02:51:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6yyrMAvBA9n502KskAgNtGXyrwvJQCHsR1Ne2k/7EbiaTbcOEhqbxW8RpljPWGmUlMF1GyMA==
X-Received: by 2002:a17:907:2d0e:b0:967:13a3:d82c with SMTP id
 gs14-20020a1709072d0e00b0096713a3d82cmr12598357ejc.26.1683798665117; 
 Thu, 11 May 2023 02:51:05 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 hu7-20020a170907a08700b00969fa8a3533sm2975577ejc.165.2023.05.11.02.51.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:51:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/24] configure: remove compiler sanity check
Date: Thu, 11 May 2023 11:50:16 +0200
Message-Id: <20230511095021.1397802-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511095021.1397802-1-pbonzini@redhat.com>
References: <20230511095021.1397802-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The comment is not correct anymore, in that the usability test for
the compiler and linker are done after probing $cpu, and Meson will
redo them anyway.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/configure b/configure
index 6e5e91908a4b..85f82a626964 100755
--- a/configure
+++ b/configure
@@ -1090,20 +1090,6 @@ if test -z "$ninja"; then
     fi
 fi
 
-# Check that the C compiler works. Doing this here before testing
-# the host CPU ensures that we had a valid CC to autodetect the
-# $cpu var (and we should bail right here if that's not the case).
-# It also allows the help message to be printed without a CC.
-write_c_skeleton;
-if compile_object ; then
-  : C compiler works ok
-else
-    error_exit "\"$cc\" either does not exist or does not work"
-fi
-if ! compile_prog ; then
-    error_exit "\"$cc\" cannot build an executable (is your linker broken?)"
-fi
-
 # Consult white-list to determine whether to enable werror
 # by default.  Only enable by default for git builds
 if test -z "$werror" ; then
-- 
2.40.1


