Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDDB6B4B4D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 16:38:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paeoH-0002b2-JR; Fri, 10 Mar 2023 10:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1paeoE-0002aY-UD; Fri, 10 Mar 2023 10:37:30 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1paeoD-0006f0-9S; Fri, 10 Mar 2023 10:37:30 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 092221FD7C;
 Fri, 10 Mar 2023 15:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678462647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o1T0P574/azf2sOaHLEPXGLVbh9LW5dl78gDeUUIh6w=;
 b=i8r9BdTcpVaH4HNQRvCsHHLyxzFGUuRbIM8WqaDKRzHBMUQ+v9avRlxXSotcM2aey5BY1N
 sQwIHZSqzlr9kzJqQX62ZoNl7o52QQ49k5QZCSAIyhlt4nQ1t2Sl06b9Scvhj1LP0OQV2H
 dak+BPaZ1gR5TPsebXSOwpZ2gC2vSGM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678462647;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o1T0P574/azf2sOaHLEPXGLVbh9LW5dl78gDeUUIh6w=;
 b=b/cwbdPaTI8a9brBuI8/J681s0DxvSjaGXPU1aAqzufWMrUiI7epFwYpq0cqFZ8tjCuDdR
 oB0tvN+k9Et879CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B1C2134F7;
 Fri, 10 Mar 2023 15:37:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wD5eCrZOC2RNCQAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 10 Mar 2023 15:37:26 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>, Juan
 Quintela <quintela@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Laurent Vivier <lvivier@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 08/11] tests/qtest: Fix tests when no KVM or TCG are
 present
In-Reply-To: <0a2fcaf6-169e-a947-c03f-3aadba10da73@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-9-farosas@suse.de>
 <20230310050550-mutt-send-email-mst@kernel.org> <87h6useoxy.fsf@suse.de>
 <0a2fcaf6-169e-a947-c03f-3aadba10da73@redhat.com>
Date: Fri, 10 Mar 2023 12:37:23 -0300
Message-ID: <877cvoehxo.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Thomas Huth <thuth@redhat.com> writes:

> On 10/03/2023 14.06, Fabiano Rosas wrote:
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>> 
>>> On Thu, Mar 09, 2023 at 05:14:31PM -0300, Fabiano Rosas wrote:
>>>> It is possible to have a build with both TCG and KVM disabled due to
>>>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>>>> host.
>>>>
>>>> If we build with --disable-tcg on the aarch64 host, we will end-up
>>>> with a QEMU binary (x86) that does not support TCG nor KVM.
>>>>
>>>> Fix tests that crash or hang in the above scenario. Do not include any
>>>> test cases if TCG and KVM are missing.
>>>>
>>>> Make sure that calls to qtest_has_accel are placed after g_test_init
>>>> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
>>>> printed before other messages") to avoid TAP parsing errors.
>>>>
>>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>>
>>> I don't like it that we are hard-coding the list of accelerators
>>> like this. Make a wrapper?
>>>
>> 
>> Are you thinking of some sort of "has_any_accel" wrapper?
>
> I think in the long run, we want something like what I described here:
>
> https://lore.kernel.org/qemu-devel/ee0cad00-a6f3-f0c1-adf0-ba32329354f3@redhat.com/
>

Wont't that function be too generic? The choice of accelerator is quite
specific to each individual test, some might not work with TCG, some
might not work with HVF and so on. There is no link between build-time
configuration and runtime test execution after all. We could always have
a build without an accelerator and then try to run a test that uses that
accelerator. And also have an accelerator present that the test does not
support at all.


For this particularly bizarre case of not having TCG nor KVM in the
build I'm inclined to go with Michael's suggestion of checking it at
build time and skipping all the hassle. This is what I'm preparing:

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 29a4efb4c2..e698cdcb60 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -27,6 +27,12 @@ if config_host.has_key('CONFIG_MODULES')
   qtests_generic += [ 'modules-test' ]
 endif
 
+# For x86_64, i386 and aarch64 it is possible to have only Xen as an
+# accelerator. Some tests require either TCG or KVM, so make sure they
+# are present before building those tests.
+tcg_or_kvm_available = (config_all.has_key('CONFIG_TCG') or
+                        config_all.has_key('CONFIG_KVM'))
+
 qtests_pci = \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +                  \
   (config_all_devices.has_key('CONFIG_IVSHMEM_DEVICE') ? ['ivshmem-test'] : [])
@@ -40,11 +46,12 @@ qtests_filter = \
   (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : [])
 
 qtests_i386 = \
-  (slirp.found() ? ['pxe-test'] : []) + \
+  (slirp.found() and tcg_or_kvm_available ? ['pxe-test'] : []) +                            \
---

What do you think?


