Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B09A6AFC00
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:16:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiM7-0003hK-Kj; Tue, 07 Mar 2023 20:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLz-0003NU-TD
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLy-0001ep-41
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v1CYajCO17Y5cS/tLpZ/xk1GD8VgUXYqeWSjKJLY76c=;
 b=MZorPD+JMJ3ODHIDXFhC3gREKp2EATPhMR8XqlI5pdS2gzMfD+1MDGY68LaR1k8mLqteeD
 xGJItJ65krCEd4ECfoVoqQLYdZlq9hYHp48jSQflPDmOH5qDg5afy1EM4RSG5fF1J5AKBK
 Bss7Z87EFoPZ3peDZJsojV8ETQESYOg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-J8xjDbqMNlGdhf1tYBUVPg-1; Tue, 07 Mar 2023 20:12:24 -0500
X-MC-Unique: J8xjDbqMNlGdhf1tYBUVPg-1
Received: by mail-ed1-f69.google.com with SMTP id
 da22-20020a056402177600b004c60694083eso21251622edb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237943;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1CYajCO17Y5cS/tLpZ/xk1GD8VgUXYqeWSjKJLY76c=;
 b=gXh3bmSWKozA8SdHLxlL+CCrx2Hf03w87RcdB1ovlS4wrBJpL9r0IOq5+Box6LrN3o
 U/x7xcumCRWTbTFmijMRJ675Lqt0dcMxD0HE1Ya1vjzyK7dhv5jS1m6w9CTEHmCMzT5Z
 5lQW5d9i7MUN972jxgBPF16rDt+SCSczqS0Ilf63kt+e9lGEzmL1SBhf7D9f3aFDmh0y
 +R4h5tUxr+JaP4VoJcexGwymE6zR/Fh9gWBU0ci2e413hVW/2wHI2PB+xuwAyDNPFxUj
 rxQM5IqVwITgQaRsWe4xnHuCrgOM28sEQmxxL3mqZsGohER/TJGxZN4R1UGW/7CLI1gy
 uGVw==
X-Gm-Message-State: AO0yUKWJGJCdGmsuFt4sAGnun/SgZ1Lyyn2QH8sARDkk6L4zZyQlhdIM
 Zc9PMGSVsyMiQdwKgprQ0d2jSVhoOjOqMyFxapjfy0BuMKu77AhZzkfwLr0scOLxWObeXkAwqs6
 gdvKjjb9QHvvQQBPbNloXgBoXWOSugzSNB7PBQTZPbtqW55+hc9NjVWJfcKvsl8JUsdJk
X-Received: by 2002:a05:6402:792:b0:49e:4786:a0e2 with SMTP id
 d18-20020a056402079200b0049e4786a0e2mr15209923edy.14.1678237942864; 
 Tue, 07 Mar 2023 17:12:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+4WBSl4FVWRWIaeN12X8dAOBfrCLRj+iApUQf7rt2eYBU4aAyIdCIksRdzxlMDEhKpZAeobQ==
X-Received: by 2002:a05:6402:792:b0:49e:4786:a0e2 with SMTP id
 d18-20020a056402079200b0049e4786a0e2mr15209906edy.14.1678237942538; 
 Tue, 07 Mar 2023 17:12:22 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 v8-20020a50c408000000b004c09f0ba24dsm7499730edf.48.2023.03.07.17.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:22 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 30/73] tests: acpi: update expected blobs
Message-ID: <6bf2d446d470dfbd8ba45da27d10ade4616586b1.1678237635.git.mst@redhat.com>
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

expected changes:
Basically adds devices present on root bus in form:
  Device (SXX)
  {
     Name (_ADR, 0xYYYYYYYY)  // _ADR: Address
  }

On top of that For q35.noacpihp, all ACPI PCI hotplug
AML is removed and _OSC get native hotplug enabled:

                       CreateDWordField (Arg3, 0x04, CDW2)
                       CreateDWordField (Arg3, 0x08, CDW3)
                       Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
  -                    Local0 &= 0x1E
  +                    Local0 &= 0x1F
                       If ((Arg1 != One))
                       {
                           CDW1 |= 0x08
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-5-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3081 -> 3115 bytes
 tests/data/acpi/q35/DSDT.noacpihp           | Bin 8252 -> 7932 bytes
 3 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index b2c5312871..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT.hpbrroot",
-"tests/data/acpi/q35/DSDT.noacpihp",
diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index a71ed4fbaa14be655c28a5e03e50157b4476e480..d77752960285a5afa6d0c0a04e400842f6acd2ed 100644
GIT binary patch
delta 100
zcmeB_SS`Wj66_M9&BMUJ_;DlGJx(rXm6-Tor+5Kx<;|Zse=<548N_qMJGuk`Rj@Eb
YH}MA>S-=HY!2-qz6>JazgbH>B01xpO00000

delta 66
zcmZ22(J8^@66_Mf$-}_Fcyc4xJx(r1rI`3&r+5KR#m%2Me=^D$TEuh2JGuk`RWLI|
NH}MA>8NdZt7ywGL58eO(

diff --git a/tests/data/acpi/q35/DSDT.noacpihp b/tests/data/acpi/q35/DSDT.noacpihp
index d68c472b460e4609a64ea67de3c4cebfca76164d..f35338db30a44638cc3a55d2870e0e377af4246f 100644
GIT binary patch
delta 160
zcmdnv@W+<RCD<k8j~oL7<AsS_R~Y3d-Y?y}kV#F7$x(3gNf~~|$trT`TwV$>@xe~<
z0!|8(r^?wU^9LJR#B;<ux&-ksFfcPjH}MA>8NdZtAOZ*#tY86SgbFr@073;jSil6K
Lf@AYVxj04uw-F~b

delta 485
zcmexkyT^gcCD<jzMuCBWaq2{_D~xgz@0ZpK_=xDm2Rp?FIC~mIHv~8bhcI#<;Njwk
zZWI7<oPpw@3P8d|A-W;h)hnKn`veacOLQYQh~w;J;OYgGaPspFV&uL6(FWo;JNbqB
zDg=1CL?}cvI{7$zGl-}LIJ<f=MJt1N|Nj?cfK(Jz)-z@@fDDON2Z=9X5Ycu7YQj(k
zR0T4u07N7})h38IaR#^q`|>VuVVj)AP$0<6$dFLLkhnl<(&P+5VJ?9S<|m&9n^yTw
z6o2I_dDz)^Nx}m5shM0%OA-n|mNa+dFfjN7Nk)bwpq|>vNeq*dc>V(cLv12sVr^n2
zBNsbEVnJd@0s{k3uj=G1F7^T;Rwf2spgnLCAO;j9K~!xHVN{c1@)g}&BhAm~72V{;
z65tUK#1Ze|>B1Y}7hvFMV8*}^9}40*dn$P3mlWibrYjVs7U!21C8rhx<$^;Txwtvv
zor8h}dAYdU84vIr;9-=Q+$odE<suaWiYfsg$;p3Y>^Cozjb`K(;E8t+a1~*TcQr6%
F000aMj?@4E

-- 
MST


