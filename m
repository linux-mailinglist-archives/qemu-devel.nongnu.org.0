Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21556BBB46
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 18:48:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcVAi-0002je-V9; Wed, 15 Mar 2023 13:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAU-0002Ur-Vu
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:44:08 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAD-0000bf-GO
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:44:06 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 k25-20020a7bc419000000b003ed23114fa7so1571002wmi.4
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 10:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sQqjfUQatIxdKkk1mS9vZHLNSiIHLiR1rCd25SjEL8w=;
 b=rtTxkMEUHcUjGsJWxc6rUc1ZV4KlgUvIGX4lAPc+INgQ1sAHs0E/76jb/iR5ROIf3i
 oezfa+aaq8mN/eYensGgDwSVA8OsAybcQu9NEdc1x0P7KC6cBg+f2ctAognicS41SsB+
 /5M1v0lScshfUCZ+03WYdCaYZ7ZNLkDTo+7qLKc9+btpS+nLsn1F+2/fHzrE7rBA4gT2
 DUUYeu3kMnyrTrMgui/9iJfkyYdnuOJ+ST+Yd6kA1G9+gZJpK0RZ2RtiFkeEZQRILVns
 q5Uz1sedz3wP2NM0iTTId6xIsvU4g+qb83J/zFWY7LdJkpaCYrnS7n9SCOlbj7Out1QB
 vpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sQqjfUQatIxdKkk1mS9vZHLNSiIHLiR1rCd25SjEL8w=;
 b=U0gNNKL5TULhH1J8Sf2dw6Nzm32DPypJGODOAmFsQr3SQQO2Z8tMo3SiKRT7Xpw6rH
 ccNabPu10zB2b7EcPmn5GSziJt2uMTyiVFMhrH3KrDDmDaZvTOaiApvWgZeL9oKXJk8g
 ZXJ6rUCYNp4B5EB7bg3O5E3wy/ehh6tpwDunHxPO0TJ33Kl6VS90jOK5LWxpsjcfL4Pt
 7xQ4TUg/iI8Dw5wVh6JZAZ1J504HStZ5/PLzY25BO/0qydFhAxI6m+0cAOkAl6Hy94f2
 G6rOkD6e4OY1bMZDmrd89xcwURdeGMaZJWMIDxQ8+Y1a+dxhP38GhRSheBiINGLO4pAa
 764Q==
X-Gm-Message-State: AO0yUKXcT5R2d+z4LeOiArjsFj18d48rKedm1fwEqUEO2sti8NZnZSRx
 npIPRPyDN5jYwHAmWr8tS5x/XQ==
X-Google-Smtp-Source: AK7set8HLwYqdb5QVGNCKtc1BGLLs5RIBqmppY2f38wiqYNFfn/T0dLkOnucHAUjUgSjIMrleHRBhA==
X-Received: by 2002:a05:600c:4ed4:b0:3ed:26c1:8e5a with SMTP id
 g20-20020a05600c4ed400b003ed26c18e5amr9382085wmq.10.1678902228489; 
 Wed, 15 Mar 2023 10:43:48 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003ed341d2d68sm2297850wmq.16.2023.03.15.10.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:43:47 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 62DC01FFCF;
 Wed, 15 Mar 2023 17:43:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Cleber Rosa <crosa@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Alexandre Iooss <erdnaxe@crans.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Vijai Kumar K <vijai@behindbytes.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Gibson <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, David Woodhouse <dwmw2@infradead.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Tyrone Ting <kfting@nuvoton.com>, Kevin Wolf <kwolf@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant <paul@xen.org>,
 Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 24/32] iotests: register each I/O test separately with meson
Date: Wed, 15 Mar 2023 17:43:23 +0000
Message-Id: <20230315174331.2959-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Daniel P. Berrangé <berrange@redhat.com>

Currently meson registers a single test that invokes an entire group of
I/O tests, hiding the test granularity from meson. There are various
downsides of doing this

 * You cannot ask 'meson test' to invoke a single I/O test
 * The meson test timeout can't be applied to the individual
   tests
 * Meson only gets a pass/fail for the overall I/O test group
   not individual tests
 * If a CI job gets killed by the GitLab timeout, we don't
   get visibility into how far through the I/O tests
   execution got.

This switches meson to perform test discovery by invoking 'check' in
dry-run mode. It then registers one meson test case for each I/O
test. Parallel execution remains disabled since the I/O tests do not
use self contained execution environments and thus conflict with
each other.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Hanna Czenczek <hreitz@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230303160727.3977246-8-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qemu-iotests/meson.build | 35 ++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index 323a4acb6a..a162f683ef 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -32,16 +32,39 @@ foreach k, v : emulators
   endif
 endforeach
 
+qemu_iotests_check_cmd = files('check')
+
 foreach format, speed: qemu_iotests_formats
   if speed == 'quick'
     suites = 'block'
   else
     suites = ['block-' + speed, speed]
   endif
-  test('qemu-iotests ' + format, sh, args: [files('../check-block.sh'), format],
-       depends: qemu_iotests_binaries, env: qemu_iotests_env,
-       protocol: 'tap',
-       suite: suites,
-       timeout: 0,
-       is_parallel: false)
+
+  args = ['-tap', '-' + format]
+  if speed == 'quick'
+      args += ['-g', 'auto']
+  endif
+
+  rc = run_command(
+      [qemu_iotests_check_cmd] + args + ['-n'],
+      check: true,
+  )
+
+  foreach item: rc.stdout().strip().split()
+      args = ['-tap', '-' + format, item,
+              '--source-dir', meson.current_source_dir(),
+              '--build-dir', meson.current_build_dir()]
+      # Some individual tests take as long as 45 seconds
+      # Bump the timeout to 3 minutes for some headroom
+      # on slow machines to minimize spurious failures
+      test('io-' + format + '-' + item,
+           qemu_iotests_check_cmd,
+           args: args,
+           depends: qemu_iotests_binaries,
+           env: qemu_iotests_env,
+           protocol: 'tap',
+           timeout: 180,
+           suite: suites)
+  endforeach
 endforeach
-- 
2.39.2


