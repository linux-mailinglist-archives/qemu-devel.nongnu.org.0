Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A92C6AFBFB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:16:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiNG-0001Ey-QI; Tue, 07 Mar 2023 20:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNA-0000qq-4q
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiN8-0001vH-Hx
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gVzALV9eo73qgbhHi47U1gGIQnYGFFh3jdTc10kfp0c=;
 b=Yl+tqoCM8B0wzs3yzJmkyLZmv5J9XIrHEOlupBSmDWiflTucV1yeX2lH08BSjH9F0FHYf/
 Fi8qjygUzULAIne2F1rNyFNIFSbQBrLAEWB1N+bgGIf01wxilrU2ib7zt15ceVRUwlHPA6
 4WraIBP9cw9gDRFaMAt4N6NdAlrgVSE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-nYsx62B-OIeydbRDAYHBDA-1; Tue, 07 Mar 2023 20:13:35 -0500
X-MC-Unique: nYsx62B-OIeydbRDAYHBDA-1
Received: by mail-ed1-f69.google.com with SMTP id
 d35-20020a056402402300b004e37aed9832so11984919eda.18
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:13:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238014;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gVzALV9eo73qgbhHi47U1gGIQnYGFFh3jdTc10kfp0c=;
 b=hglj8/c2H/Q+rchmZs7G1UB0DTp6z7gAuSEiHcKa7WCeR0wT462oT9KIwYtmW5NgWZ
 Luv80vR8/veIBPUpNf9fPPvAj6Wndzptd74lzNRYXgffiNYgkMSdsANx8ijTXCE8mFIR
 Xqg25aM4YOB4yAaMJ71eHOLoc05dXO5Wm5gixhL9NaJqpOUbHzoAZeILeZG2uXjmuJfY
 1bJ48+Uw6QruHgtJydMHMRKzEqpjncmxBByyQYPEsW8PSSiKdJtQK3hWG0jKn+62CXKJ
 SUbz5eFoFZ8VEu3oe0gBjJo5qFURblnFQBbNsA0EjFCoz8qUf8zBQh3KNF56IFxdiehT
 cjlQ==
X-Gm-Message-State: AO0yUKVY/iBoZPzGzX2KbPm/dxyZQbI+OUuGaz8F7lBzjbgFyA+V6i8L
 1Lx+TKyIefq/GyZ0xKeDGcv4EDoRb1yX9sB9LZ92y/tfII2M93Aj4jSxPxkJzQ0/anLRzA/3BhW
 eayrHHd3dBx9mQ0ip3EVfVkMwLrtVNp1+vC0Bxs6A4b80WDJBetUDxRuo7ksbn4dkkTv+
X-Received: by 2002:a17:907:2050:b0:8ae:6b88:e52d with SMTP id
 pg16-20020a170907205000b008ae6b88e52dmr20572116ejb.7.1678238014275; 
 Tue, 07 Mar 2023 17:13:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+ugYhQPq6Uwp3CNuhdajdX7H4uES8UiWbe/X7DRuvDD2gnZUqSRTotND3P36jnkDz+AnlTnw==
X-Received: by 2002:a17:907:2050:b0:8ae:6b88:e52d with SMTP id
 pg16-20020a170907205000b008ae6b88e52dmr20572100ejb.7.1678238014014; 
 Tue, 07 Mar 2023 17:13:34 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 e5-20020a17090681c500b008d269233bd4sm6752406ejx.204.2023.03.07.17.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:13:33 -0800 (PST)
Date: Tue, 7 Mar 2023 20:13:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 54/73] tests: acpi: update expected blobs
Message-ID: <0a7044eb643d035e6c235ca94760a1e61d165cd6.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
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

From: Igor Mammedov <imammedo@redhat.com>

an extra devices at non-zero function address with static
_DSM method get exposed, ex:

  +            Device (S15)
  +            {
  +                Name (_ADR, 0x00020005)  // _ADR: Address
  +                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
  +                {
  +                    Local0 = Package (0x01)
  +                        {
  +                            0x66
  +                        }
  +                    Return (EDSM (Arg0, Arg1, Arg2, Arg3, Local0))
  +                }
  +            }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-29-imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 12729 -> 12770 bytes
 tests/data/acpi/q35/DSDT.noacpihp           | Bin 8205 -> 8248 bytes
 3 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index ad2b429de8..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.multi-bridge",
-"tests/data/acpi/q35/DSDT.noacpihp",
diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index 4e4b5229502000550f169948393ba8cbc7a793d5..9ae8ee0b41738bd8951b9449abcfc67c293fdce1 100644
GIT binary patch
delta 81
zcmdm){3w~rCD<k8ks$*E<D89LcjdU-1sG%EgPr09`uI10l5=5FR}VHcjpvAWbP3{N
kWnf|u5s!BX_T?!MVqxS;OIYFx<YZ)KWhZPlQEU|e0OA}M0RR91

delta 41
xcmaEqyfc~0CD<iory&Ca<K2y1cjdVIco}2jgPr09T6s5rl5=6&9Ix0c001!W4d4I(

diff --git a/tests/data/acpi/q35/DSDT.noacpihp b/tests/data/acpi/q35/DSDT.noacpihp
index 1c17aa30f7f0155a81988aa43c56e2f71530b4e4..6ab1f0e52543fcb7f84a7fd1327fe5aa42010565 100644
GIT binary patch
delta 99
zcmeBm*x|tC66_LUp}@ev=(Ul{MV8A;FD5?NDPF)yZ*zpK6r+^~Yp{tyJV(5vOArqO
v0|!HNlSZ(KAyj}7C?Fyc?-K0GQy|33$Q{X)u*4O}%gD^iPT1Ti*TV<^dqx+F

delta 56
zcmdnt(CfhE66_MftH8j(IA<f5i!7JFc1(P*Q@nt?_T~s#DMo(XU=xFQj(A6xARYz=
L4u;KZ<a!tZl4uQ!

-- 
MST


