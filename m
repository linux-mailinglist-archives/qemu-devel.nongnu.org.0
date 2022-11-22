Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67141633A03
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 11:25:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQRX-0008L3-Nd; Tue, 22 Nov 2022 05:23:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQRP-0008JZ-NF
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQRO-0004nG-8b
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669112625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tp9jFYJgk+YLg5fcJWtG3ksiVNxD2+OIeFCJl1agFd8=;
 b=O4UFMgqzWK8yPMC3WJ/qAcRRTbeoSdUwmMTIk7vlILpsM8B5dLKnDnHSoiqn/YXQrr903L
 0+cZZx8mWmJ438OdqhHzS+/b8BqPe96g8n1T18HBbg6hv+eB6hZRwXux51mnWqoL7mSAQp
 yPFDAPvd63+w9xbaO8lLFkIwCj12W3A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-lLWNJcw6N0OFAJXxiH7HdQ-1; Tue, 22 Nov 2022 05:23:43 -0500
X-MC-Unique: lLWNJcw6N0OFAJXxiH7HdQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 v14-20020adf8b4e000000b0024174021277so4117409wra.13
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 02:23:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tp9jFYJgk+YLg5fcJWtG3ksiVNxD2+OIeFCJl1agFd8=;
 b=zSVtO/SQbFGqnM4s6Wkcb41N6iLzjRSFV9PI8+1KO0BZeurxkTk1+sjfPMRhFpQDDv
 0J/QrJko5JQvb1G9KE180fEravD6C4Jn9ze5wSGpRDfss4RwcwlNa+8aFHjWhrz1U/9H
 4AW8zs0yDhxX34WnXHdPS5D3K7zde8RjYG4YlA2zX+nwMIzlP3SGO6lL8IRbD7itt7Hq
 DW+rjxkASEHY7kqIW3G+6H8pIE0M9nCfqgDMl2SqLP2SS6TDsxwO4E1IMZW26nw9yY4O
 kClBqCYxQJT50K/NNZSDsIGWo/y/xdygXsiS9HY0v2DsCtHZqyTZ8annGArbp/FrI4aa
 YerA==
X-Gm-Message-State: ANoB5pkQ+OaM8tl3XhRKneH/47tzkkt0jDVqp7HLpAOyDRPMFflvYAdj
 H1ZEoAfqjGy+UMFzlJUP0tEAnGxzA/yZ760QrPmUS0f15WIFICaQAKdog1mvqrMKr0nkPVDIUjd
 BipFPqBEc7ab7rh4MSOHEgXEyBmfAWn8TS8kCzDvJS+9fDy8z3xJvtxO3S6+2
X-Received: by 2002:a7b:ca45:0:b0:3c4:bda1:7c57 with SMTP id
 m5-20020a7bca45000000b003c4bda17c57mr19510766wml.6.1669112622115; 
 Tue, 22 Nov 2022 02:23:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6NljfZ/Ujv+wKTAUFZfEgS4n9BAKTt3u/k147Mk1DA7g/d9tYHM1cZErqZnz+YLXEKPeIj/g==
X-Received: by 2002:a7b:ca45:0:b0:3c4:bda1:7c57 with SMTP id
 m5-20020a7bca45000000b003c4bda17c57mr19510741wml.6.1669112621813; 
 Tue, 22 Nov 2022 02:23:41 -0800 (PST)
Received: from redhat.com ([2.52.21.254]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c3b8900b003c6bbe910fdsm28615388wms.9.2022.11.22.02.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 02:23:41 -0800 (PST)
Date: Tue, 22 Nov 2022 05:23:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 6/8] tests/avocado: configure acpi-bits to use avocado timeout
Message-ID: <20221122102227.6603-7-mst@redhat.com>
References: <20221122102227.6603-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

From: John Snow <jsnow@redhat.com>

Instead of using a hardcoded timeout, just rely on Avocado's built-in
test case timeout. This helps avoid timeout issues on machines where 60
seconds is not sufficient.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20221115212759.3095751-1-jsnow@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 tests/avocado/acpi-bits.py | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
index 8745a58a76..ac13e22dc9 100644
--- a/tests/avocado/acpi-bits.py
+++ b/tests/avocado/acpi-bits.py
@@ -385,12 +385,6 @@ def test_acpi_smbios_bits(self):
         self._vm.launch()
         # biosbits has been configured to run all the specified test suites
         # in batch mode and then automatically initiate a vm shutdown.
-        # sleep for maximum of one minute
-        max_sleep_time = time.monotonic() + 60
-        while self._vm.is_running() and time.monotonic() < max_sleep_time:
-            time.sleep(1)
-
-        self.assertFalse(time.monotonic() > max_sleep_time,
-                         'The VM seems to have failed to shutdown in time')
-
+        # Rely on avocado's unit test timeout.
+        self._vm.wait(timeout=None)
         self.parse_log()
-- 
MST


