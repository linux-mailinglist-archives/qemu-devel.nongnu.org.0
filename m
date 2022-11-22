Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604CC633A02
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 11:25:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQRc-0008LT-RS; Tue, 22 Nov 2022 05:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQRW-0008Kt-4j
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQRQ-0004na-RK
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669112627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tCyN486kILbT5B/0SUpD9hz0Zu83tKUQ17jpDn0HiAY=;
 b=Ul8MRDvbqRnS265wWOUHOObCuk6PcmHPmddOTpH1qDajVJVTV7KKr6kDSNCRKBKdP1G1ON
 WVlYeUffzgaA+aPbJ3HPkY2AKFjygD3Bv5hqfc/kO73ejXUdXpFMGjnyOzTZjTZnKqVNGQ
 hDnmJcrHsLUQuiGA51Z66IOjmIe9gUw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-V2Ay1hCHP5K-V0Ahf4EUKQ-1; Tue, 22 Nov 2022 05:23:46 -0500
X-MC-Unique: V2Ay1hCHP5K-V0Ahf4EUKQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 x8-20020adfbb48000000b00241c6e4f72eso2597528wrg.2
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 02:23:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tCyN486kILbT5B/0SUpD9hz0Zu83tKUQ17jpDn0HiAY=;
 b=opg4y0jfoPPpaM19A34I98MrQqMTs/mG8Uzdova6ra9RvlBgYOCyLWFuRc/C/kEalg
 6qSyz3HyTZ1BDgWSoRCveCNNFTWDUWW9K1roS+Z/LiCULcz0rdwYTXee1eOeAlvFA2D9
 RZakJogBnZyflZsMXynnQFupxDanq6/ECfBFie9HyGSkJ7DnUnzrfMYkMkvVNgegRjYs
 QpjfHLos1KRbgfg91WTQsf6rmtTaBP19qvrKf9W8UPi4dUrb2COYvVluMIt3+vlSNtmP
 5YqbPsAtTKa25WOmUXcr3Wu2OhKpwQBh4JkLXcPkt2Ta5PjtAP5+7YpskEmYZiEcJvPe
 8hUA==
X-Gm-Message-State: ANoB5pm6180h0UlIzQMoRAfoaDuex7drqziJXcyasks7wGsIysqV4f5+
 zaeDR3m/1T2VuuaY4+Qhc2567bM6klvhl4HTsNkuSOH4wTXcxcgFtRF0ItFhuxQtVQTBZhdRY2y
 K3ha17Jtv5YmINkW5D6LfVS3OByS10kxoB+d0Cn2mDcKdX20FmR6PBPbSiSua
X-Received: by 2002:a5d:430e:0:b0:241:bfb6:c6da with SMTP id
 h14-20020a5d430e000000b00241bfb6c6damr3007678wrq.204.1669112625295; 
 Tue, 22 Nov 2022 02:23:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6/xomgXpokGScLs+6dt0ZTnBsDoKUJJOmpvCxiHoMHDPR4LbdGHYM7tYKHT/yAd2urfbLpQw==
X-Received: by 2002:a5d:430e:0:b0:241:bfb6:c6da with SMTP id
 h14-20020a5d430e000000b00241bfb6c6damr3007659wrq.204.1669112625018; 
 Tue, 22 Nov 2022 02:23:45 -0800 (PST)
Received: from redhat.com ([2.52.21.254]) by smtp.gmail.com with ESMTPSA id
 w19-20020adfbad3000000b00241c6729c2bsm10527579wrg.26.2022.11.22.02.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 02:23:44 -0800 (PST)
Date: Tue, 22 Nov 2022 05:23:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 7/8] acpi/tests/avocado/bits: keep the work directory when
 BITS_DEBUG is set in env
Message-ID: <20221122102227.6603-8-mst@redhat.com>
References: <20221122102227.6603-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221122102227.6603-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Ani Sinha <ani@anisinha.ca>

Debugging bits issue often involves running the QEMU command line manually
outside of the avocado environment with the generated ISO. Hence, its
inconvenient if the iso gets cleaned up after the test has finished. This change
makes sure that the work directory is kept after the test finishes if the test
is run with BITS_DEBUG=1 in the environment so that the iso is available for use
with the QEMU command line.

CC: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20221117113630.543495-1-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/avocado/acpi-bits.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
index ac13e22dc9..4be663968c 100644
--- a/tests/avocado/acpi-bits.py
+++ b/tests/avocado/acpi-bits.py
@@ -260,7 +260,7 @@ def generate_bits_iso(self):
         self.logger.info('using grub-mkrescue for generating biosbits iso ...')
 
         try:
-            if os.getenv('V'):
+            if os.getenv('V') or os.getenv('BITS_DEBUG'):
                 subprocess.check_call([mkrescue_script, '-o', iso_file,
                                        bits_dir], stderr=subprocess.STDOUT)
             else:
@@ -344,7 +344,7 @@ def parse_log(self):
                 self._print_log(log)
                 raise e
             else:
-                if os.getenv('V'):
+                if os.getenv('V') or os.getenv('BITS_DEBUG'):
                     self._print_log(log)
 
     def tearDown(self):
@@ -353,8 +353,13 @@ def tearDown(self):
         """
         if self._vm:
             self.assertFalse(not self._vm.is_running)
-        self.logger.info('removing the work directory %s', self._workDir)
-        shutil.rmtree(self._workDir)
+        if not os.getenv('BITS_DEBUG'):
+            self.logger.info('removing the work directory %s', self._workDir)
+            shutil.rmtree(self._workDir)
+        else:
+            self.logger.info('not removing the work directory %s ' \
+                             'as BITS_DEBUG is ' \
+                             'passed in the environment', self._workDir)
         super().tearDown()
 
     def test_acpi_smbios_bits(self):
-- 
MST


