Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C8B326F22
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Feb 2021 23:24:08 +0100 (CET)
Received: from localhost ([::1]:58442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lG80N-0007AE-Am
	for lists+qemu-devel@lfdr.de; Sat, 27 Feb 2021 17:24:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lG7zT-0006jn-AS
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 17:23:11 -0500
Received: from mx2.suse.de ([195.135.220.15]:47516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lG7zR-0000oQ-QS
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 17:23:11 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ECB8EAE3C;
 Sat, 27 Feb 2021 22:23:07 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
From: Claudio Fontana <cfontana@suse.de>
Subject: issue with meson and recursion: negation missing in add?
Message-ID: <db7f5fca-be04-b36a-33ac-efd0fa79011b@suse.de>
Date: Sat, 27 Feb 2021 23:23:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Hi Paolo,

I don't know how to handle an issue in the current way we are using meson with recursion, ie always recursing,
and testing multiple options inside the recursed directory.

In the case of ARM, we have:

target/arm/tcg/meson.build,

where I need to check all the time for TCG, given our current standard of always recursing.

Besides being error-prone to always remember to check for CONFIG_TCG,

how do I add some object conditionally on whether CONFIG_TCG is true, but TARGET_AARCH64 is false?

I'd need something like:

arm_ss.add(when: [!TARGET_AARCH64,'CONFIG_TCG'], if_true: files(
  'tcg-cpu-models.c',
))

but the negation !TARGET_AARCH64 is a syntax error... is there any way to negate the condition?

Also as we nest directories more and more, it seems to me that this becomes more and more confusing.

How about dropping the idea to recurse always unconditionally?

Thanks!

Claudio


-- 
Claudio Fontana
Engineering Manager Virtualization, SUSE Labs Core

SUSE Software Solutions Italy Srl

