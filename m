Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED1828D294
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 18:49:15 +0200 (CEST)
Received: from localhost ([::1]:57484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSNUA-00031v-LB
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 12:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kSNSk-0002aO-PJ
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 12:47:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:56832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kSNSj-0005RN-8C
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 12:47:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 15AE3B028;
 Tue, 13 Oct 2020 16:47:44 +0000 (UTC)
Subject: Re: [PATCH v3 0/3] unbreak non-tcg builds
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201013143806.14321-1-cfontana@suse.de>
 <cd8e9295-dcd0-18c4-e7a2-86bed74f967c@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ed8d664d-9af7-f4c6-1b2d-e0569eb27ab7@suse.de>
Date: Tue, 13 Oct 2020 18:47:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cd8e9295-dcd0-18c4-e7a2-86bed74f967c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 01:21:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Pavel Dovgalyuk <dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/20 4:55 PM, Philippe Mathieu-Daudé wrote:
> On 10/13/20 4:38 PM, Claudio Fontana wrote:
>> This series now unbreaks current non-tcg builds
>> (!CONFIG_TCG).
>>
>> tests Makefiles need to avoid relying on all non-native
>> archs binaries to be present,
>>
>> bios-tables-test needs to skip tests that are tcg-only,
>>
>> and notably the replay framework needs to consider that
>> it might not be functional (or its code present at all)
>> without TCG.
>>
>> Tested ok target x86_64-softmmu on x86_64 host with:
>>
>> ./configure --enable-tcg --disable-kvm
>> ./configure --enable-kvm --disable-tcg
>> ./configure --enable-tcg --enable-kvm
> 
> If you want to avoid these configurations to bitrot,
> consider covering them by adding Gitlab jobs :)))
> 
> 

That would be, providing a patch to  .travis.yml right?

I guess -j parameter for make is automatically provided depending on infra resources?

Something like the following?

Ciao,

C

diff --git a/.travis.yml b/.travis.yml
index 1054ec5d29..49ec615ed8 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -320,6 +320,19 @@ jobs:
         - TEST_CMD="make check-tcg"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
 
+    # Check modular accelerator builds.
+    - name: "modular accelerator builds (x86_64-softmmu, tcg only)"
+      env:
+        - CONFIG="--disable-kvm --enable-tcg --target-list=x86_64-softmmu"
+        - TEST_BUILD_CMD="make"
+        - TEST_CMD="make check"
+
+    - name: "modular accelerator builds (x86_64-softmmu, kvm only)"
+      env:
+        - CONFIG="--enable-kvm --disable-tcg --target-list=x86_64-softmmu"
+        - TEST_BUILD_CMD="make"
+        - TEST_CMD="make check"
+
     - name: "[aarch64] GCC check-tcg"
       arch: arm64
       dist: focal

