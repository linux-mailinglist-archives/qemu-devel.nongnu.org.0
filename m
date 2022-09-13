Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEBE5B6AF3
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 11:40:52 +0200 (CEST)
Received: from localhost ([::1]:52626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY2PT-000880-B7
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 05:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1oY2KI-0004IE-LL
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 05:35:42 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:55412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1oY2KG-0005hk-GN
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 05:35:30 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 6286C5BD72
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 09:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663061721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=306vX5vd+mwrFrlRgtFBoCjzer6x5Jrm8Xci717lVsU=;
 b=DVoK3S8brEZrLJqltB2lGBI1LZu+ba7kESOsZMW4RmZTW7vsy113a4PocP+99NLISIpo1E
 xDQSCYOaTNwbUuithLoSKX0K55wS5SEFJ3WjYUv/kQBSnjTA1ar3iTeam7wOzbWFdU9iEp
 t0DAslfWgiqd+143Ig0oC7WnraGNME4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663061721;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=306vX5vd+mwrFrlRgtFBoCjzer6x5Jrm8Xci717lVsU=;
 b=zoF+Iiz9EPxi/EZjVPFP5t9TK9NoKVozRfmr+epy9mfuD/6r4JURlNkKh/Tol25+eVplbd
 GwEzjYlpVnNFrdBg==
Received: from hawking.suse.de (unknown [10.168.4.11])
 by relay2.suse.de (Postfix) with ESMTP id 5DD552C141
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 09:35:21 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
 id C467A440AF7; Tue, 13 Sep 2022 11:35:20 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: qemu-devel@nongnu.org
Subject: qemu-x86_64 runs out of memory
X-Yow: I am NOT a nut....
Date: Tue, 13 Sep 2022 11:35:20 +0200
Message-ID: <mvmczbzty5j.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=schwab@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

$ cat mmap.c
#include <stdio.h>
#include <sys/mman.h>

int
main (void)
{
  void *A;
  size_t L = 0, U, Max = 0;
  for (U = 1; ; U *= 2)
    {
      A = mmap (0, U, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1, 0);
      if (A == (void *) -1)
	break;
      else
	munmap (A, U);
    }
  while (L + 1 < U)
    {
      size_t M = L + (U - L) / 2;
      A = mmap (0, M, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1, 0);
      if (A == (void *) -1)
	U = M;
      else
	{
	  Max = M;
	  munmap(A, M);
	  L = M;
	}
    }
  printf ("%zx\n", Max);
}
$ cc -O2 -g -Wall -std=gnu11 -g     mmap.c   -o mmap
$ ./mmap 
7f672e5ff000
$ qemu-x86_64 ./mmap
Killed

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

