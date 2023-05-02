Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A7D6F48EF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 19:12:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pttWy-0007M7-NX; Tue, 02 May 2023 13:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pttWw-0007LW-43; Tue, 02 May 2023 13:11:10 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pttWt-0000Ic-Az; Tue, 02 May 2023 13:11:09 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 58FBF22019;
 Tue,  2 May 2023 17:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683047465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2x9Jn+7IZfHX2l5lIXRjchg57G90iMBytZFuAJ2o+E=;
 b=hAwIHVGTly/kMN6hQifVA0IRTM+UfIrrwH143GEx85fQlApeeJtSE22xtzPIctmUlogLcK
 63GCulHxK1YegxYJftx81tt1Yl1vL7S5QZuRhVsdhUv6M852t8mB6bhd1ocM9iqAr0Lobg
 sFLOdH5Sj16/2SowCCMupZAs7m3dFJo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683047465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2x9Jn+7IZfHX2l5lIXRjchg57G90iMBytZFuAJ2o+E=;
 b=NQ2HkeF0arRc305F3t8XAFhuTiipF5XD1OigU1n7QydX1Sx8COebHp3VNfJzBoCYi4fz8s
 2nq1KqtzZcTMerCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D85F1139C3;
 Tue,  2 May 2023 17:11:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C5fjJyhEUWSkVgAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 02 May 2023 17:11:04 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v11 00/13] target/arm: Allow CONFIG_TCG=n builds
In-Reply-To: <87o7n2itxm.fsf@suse.de>
References: <20230426180013.14814-1-farosas@suse.de>
 <CAFEAcA_ZVpZzuvZ71NzgweRC5Uti0T_fqG00paqDDe18QP-veQ@mail.gmail.com>
 <CAFEAcA-s6P2Y5nNQMyACeK3+4cuSrFfqqEdFW-BDToy_YXj64g@mail.gmail.com>
 <CAFEAcA-7ci6PRYCOcrPZcGq8x+Wxtx6wwSk1C18cOO=dXOq8Dw@mail.gmail.com>
 <87o7n2itxm.fsf@suse.de>
Date: Tue, 02 May 2023 14:11:02 -0300
Message-ID: <87lei6irq1.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Fabiano Rosas <farosas@suse.de> writes:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On Tue, 2 May 2023 at 15:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> On Tue, 2 May 2023 at 10:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> >
>>> > On Wed, 26 Apr 2023 at 19:00, Fabiano Rosas <farosas@suse.de> wrote:
>>> > >
>>> > > Hi,
>>> > >
>>> > > Some minor changes:
>>> > >
>>> > > - new patch to move a test under CONFIG_TCG (broken on master);
>>> > > - new patch to document the unsupported CPU test (Philippe);
>>> > > - changed the test skip message when no KVM or TCG are present (Igor).
>>> >
>>> > Applied to target-arm.next; thanks for your persistence in
>>> > working through the many versions of this patchset.
>>>
>>> Update: I had to drop "gitlab-ci: Check building KVM-only aarch64 target"
>>> because it enables a CI job that fails on our aarch64 runner
>>> (because it wants to run tests using KVM but that machine
>>> isn't configured to allow the runner to use KVM).
>>
>> We fixed the runner config, but the CI still fails on that notcg
>> job because it is trying to run tests that explicitly use
>> '-accel tcg':
>> https://gitlab.com/qemu-project/qemu/-/jobs/4212850809#L3595
>>
>> Something is weird here, because we built without TCG support
>> on an aarch64 host but we still got qemu-system-i386
>> and qemu-system-x86_64 binaries, which then don't work
>> and cause the tests to fail...
>>
>
> Hmm, that's potentially due to Xen. Looks like we need more (!tcg &&
> !kvm) checks. Let me try to reproduce it.

Ah right, the test is skipped on my aarch64 host because I don't have
genisomage available. So what we need is this:

-- >8 --
From: Fabiano Rosas <farosas@suse.de>
Date: Tue, 2 May 2023 13:42:14 -0300
Subject: [PATCH] fixup! tests/qtest: Fix tests when no KVM or TCG are present

---
 tests/qtest/cdrom-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index 26a2400181..09655e6ff0 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -205,6 +205,11 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
 
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No KVM or TCG accelerator available");
+        return 0;
+    }
+
     if (exec_genisoimg(genisocheck)) {
         /* genisoimage not available - so can't run tests */
         return g_test_run();
-- 
2.35.3

