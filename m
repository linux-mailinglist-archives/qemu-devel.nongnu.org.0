Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52B3320B7E
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 16:40:31 +0100 (CET)
Received: from localhost ([::1]:53862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqqU-0002Gz-M0
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 10:40:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lDqpB-0001bp-Qe
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 10:39:09 -0500
Received: from relay64.bu.edu ([128.197.228.104]:50024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lDqp9-0004MR-TW
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 10:39:09 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 11LFbkA7027226
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 21 Feb 2021 10:37:49 -0500
Date: Sun, 21 Feb 2021 10:37:46 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Li Qiang <liq3ea@163.com>
Subject: Re: [PATCH] configure: force enable-sanitizers together with
 enable-fuzzing
Message-ID: <20210221153746.2spv2b5fw6w5ztq5@mozz.bu.edu>
References: <20210221125900.425495-1-liq3ea@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210221125900.425495-1-liq3ea@163.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, thuth@redhat.com, liq3ea@gmail.com, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210221 0459, Li Qiang wrote:
> If we execute configure with --enable-fuzzing but without
> --enable-sanitizers, we will have a lot of 'undefined reference'
> build error such as following:
> 
> clang-10  -o subprojects/libvhost-user/link-test subprojects/libvhost-user/link-test.p/link-test.c.o -Wl,--as-needed -Wl,--no-undefined -pie -Wl,--whole-archive -Wl,--start-group subprojects/libvhost-user/libvhost-user.a -Wl,--end-group -Wl,--no-whole-archive -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -m64 -fstack-protector-strong -pthread
> /usr/bin/ld: subprojects/libvhost-user/link-test.p/link-test.c.o: in function `main':
> /home/test/qemu/build/../subprojects/libvhost-user/link-test.c:34: undefined reference to `__sancov_lowest_stack'
> /usr/bin/ld: /home/test/qemu/build/../subprojects/libvhost-user/link-test.c:(.text.main[main]+0x55): undefined reference to `__sancov_lowest_stack'
> /usr/bin/ld: /home/test/qemu/build/../subprojects/libvhost-user/link-test.c:41: undefined reference to `__sanitizer_cov_trace_const_cmp4'
> /usr/bin/ld: subprojects/libvhost-user/link-test.p/link-test.c.o: in function `sancov.module_ctor_8bit_counters':
> link-test.c:(.text.sancov.module_ctor_8bit_counters[sancov.module_ctor_8bit_counters]+0x16): undefined reference to `__sanitizer_cov_8bit_counters_init'
> /usr/bin/ld: link-test.c:(.text.sancov.module_ctor_8bit_counters[sancov.module_ctor_8bit_counters]+0x2f): undefined reference to `__sanitizer_cov_pcs_init'
> /usr/bin/ld: subprojects/libvhost-user/libvhost-user.a(libvhost-user.c.o): in function `vu_gpa_to_va':
> /home/test/qemu/build/../subprojects/libvhost-user/libvhost-user.c:182: undefined reference to `__sanitizer_cov_trace_const_cmp8'
> /usr/bin/ld: /home/test/qemu/build/../subprojects/libvhost-user/libvhost-user.c:187: undefined reference to `__sanitizer_cov_trace_cmp4'
> /usr/bin/ld: /home/test/qemu/build/../subprojects/libvhost-user/libvhost-user.c:190: undefined reference to `__sanitizer_cov_trace_cmp8'
> /usr/bin/ld: /home/test/qemu/build/../subprojects/libvhost-user/libvhost-user.c:190: undefined reference to `__sanitizer_cov_trace_cmp8'
> /usr/bin/ld: /home/test/qemu/build/../subprojects/libvhost-user/libvhost-user.c:191: undefined reference to `__sanitizer_cov_trace_cmp8'
> 
> Let's avoid this error by enforcing fuzzing and sanitizers together.
> 
> Signed-off-by: Li Qiang <liq3ea@163.com>

I usually build using something like "ninja qemu-fuzz-i386", so I missed
this failure. CI missed it because we only build-test --enable-fuzzing
--enable-sanitizers.

I'll send an alternate patch, which should hopefully fix the failure,
without requiring enable-sanitizers. ASAN can add 5-10x overhead to
fuzzing, so it is often useful to fuzz without ASAN for a while, before
switching it on.

