Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A83668E398
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 23:50:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPWlu-0003fr-Bd; Tue, 07 Feb 2023 17:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org>)
 id 1pPWlr-0003eQ-H3
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 17:49:03 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org>)
 id 1pPWlp-00027O-Eo
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 17:49:03 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5282BB81B35;
 Tue,  7 Feb 2023 22:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09CCC433D2;
 Tue,  7 Feb 2023 22:48:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="exhQ40++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675810134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=59T1NxpAU0fGp9x6vnEHbXMFsy+O4CPa9Ha6kO051jA=;
 b=exhQ40++k1935ThkmhP8qpx2H1k0vEjA2CUe2kTVa7w/hM4eK8p/r5fSkTT40ZAEs9kb0r
 TPP9AoxU4JswzuDbGUf0Op6795RW8iVj/x3E2z/dVAstIaLkZTH+wQVbJmBwltdAr/+CzE
 m7cVUTHJCFLe4bb2k9CchRpMWvdrnzY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 75357841
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 7 Feb 2023 22:48:54 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 0/2] x86: fix fallout from switching setup_data from kernel
 image to cmdline
Date: Tue,  7 Feb 2023 19:48:45 -0300
Message-Id: <20230207224847.94429-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

With eac7a7791bb6 ("x86: don't let decompressed kernel image clobber
setup_data"), the rng seed setup_data is now appended to the cmdline
file rather than the kernel image file. In the process of doing that,
two things were left out: the check for sev_enabled(), and resetting the
RNG seed when selecting the cmdline. This short series fixes those up.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>

Dov Murik (1):
  x86: don't append setup_data to cmdline for SEV guests

Jason A. Donenfeld (1):
  x86: reset rng seed when reading cmdline, not kernel image

 hw/i386/x86.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.39.1


