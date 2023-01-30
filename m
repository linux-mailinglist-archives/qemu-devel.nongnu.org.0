Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A930A681B86
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:30:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMaiI-0002Gj-A8; Mon, 30 Jan 2023 15:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaet-0007JS-Ls
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeb-0007Qm-6e
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+WOQTvUvwnuDA+vCiYCQ4r8ADzfYlps2xicZCwzdeL4=;
 b=M7OG489KvJT3cYtqUyPilI/q3PJnalb5edG0hk0FdhEE9mW4jS2jlOquvd/jwI7lkE3dmM
 p91VKc1aFQ/nO0Ur7NZAdbqHpZDwstxaheZeACxQC/8ocdgSS2jGYx+vlYr09pkmtHBfqB
 FiLVeIZJL+qC91pAQu+5qpzfGdUaHuI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-363-ApHZghqBNjK-d3Rb3xi9_w-1; Mon, 30 Jan 2023 15:21:23 -0500
X-MC-Unique: ApHZghqBNjK-d3Rb3xi9_w-1
Received: by mail-ed1-f72.google.com with SMTP id
 c12-20020a05640227cc00b0049e2c079aabso8877463ede.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:21:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+WOQTvUvwnuDA+vCiYCQ4r8ADzfYlps2xicZCwzdeL4=;
 b=IqjuY7cTkPGd57+ocFhGAlbxFxG2qyP76NZko5Ice1/l+9qdKMLfXp7eG80z3aLwi5
 WApu4AlN8a7Djx+J9tcZj6JRiyDsVNuENoLslAVf77CUwjmvUXGwQhyZ11R7FlVAWltQ
 OmCBvNZsCoORHjkDfTw+DZHKwHIr1oFHd7uKs1sAfWqbu6JIKxqlgey6MgASxduiGAJv
 m71Gwqn7/jrSzee83k0gxG4U3UIr1lagDoM2CLRbckVJfVDTzcy/UdD/JqXG5hbbEW1w
 rVYj8QcTfsBHRgbaJE2cfOEFF3xFUv9IL3nmIaizEaBnkMvRs/cyl7shjVAYl0ysI311
 +03A==
X-Gm-Message-State: AO0yUKXO33aXXwSUxGYorsPGuJ5I4O8FDFeaBJdTg9pmopogkJNGzwQ7
 N5bLxfl7y/GZm91v29Z4OKR6GKWThPGM7aCe0Ja0+46YLeV4iBl7A34V1jOXeN3fGbPyhsgLljh
 WJ+FTrOLjElpNA2FSE5Onh92Go/FX1oQH7GNuXR6p7OIZXU1p/Lh1SJ3OVh18
X-Received: by 2002:a17:906:6791:b0:887:ebaa:7adb with SMTP id
 q17-20020a170906679100b00887ebaa7adbmr5573365ejp.12.1675110081531; 
 Mon, 30 Jan 2023 12:21:21 -0800 (PST)
X-Google-Smtp-Source: AK7set/fZgAZ0MgaVQxwU9unglPvsB2U7RtmofkQNQ/cFazubMmObC9Y/SCtl7n0XjCJ2W2G97qngg==
X-Received: by 2002:a17:906:6791:b0:887:ebaa:7adb with SMTP id
 q17-20020a170906679100b00887ebaa7adbmr5573349ejp.12.1675110081292; 
 Mon, 30 Jan 2023 12:21:21 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 17-20020a170906059100b0085fc3dec567sm7378859ejn.175.2023.01.30.12.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:21:20 -0800 (PST)
Date: Mon, 30 Jan 2023 15:21:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 47/56] tests: acpi: update expected blobs
Message-ID: <20230130201810.11518-48-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

expected change is removal of dynamic _DSM bits from slots populated
by coldplugged bridges (something like):

    -            Scope (S18)
    -            {
    -                Name (ASUN, 0x03)
    -                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
    -                {
    -                    Local0 = Package (0x02)
    -                        {
    -                            BSEL,
    -                            ASUN
    -                        }
    -                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
    -                }
    -            }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-38-imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 tests/data/acpi/pc/DSDT.bridge              | Bin 12699 -> 12614 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 6459 -> 6416 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 9787 -> 9745 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 12423 -> 12337 bytes
 5 files changed, 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index a83322cb08..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.roothp",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/q35/DSDT.multi-bridge",
diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 4c2d77b8051de2ed21fe43c8283003d8083747f7..d65d9f053910d4ef8a77fe7f9015768dd48a53f8 100644
GIT binary patch
delta 65
zcmbQ8d@PB}CD<jz&5(hC@y153a&GQ6f2NrDV5fM2Ucb#f+&>tZT5319@y_I7a%Gt;
VsHQpj0zcd4Dyf6qo72=xxdF4y6yg8?

delta 64
zcmV-G0KfmnVw+<ML{mgmn=t?Y0qn5~cMA)PR03RIQ$k-5f>g7N3-|#7j(@X;4Ves+
Wyd^5L9~$xt0V<Pc8Y#07CN>MlAQdeD

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index ce2e1430a38b467b212573a896b94c306caa12fb..c8b388a85c8d7472a5370c9657fa2b4e1a897e38 100644
GIT binary patch
delta 40
wcmdmOG{K0=CD<iIK$3xh@$p8ka&9i?OEK}mPVoZX7dLlv&t=*i%=dx|0Qu4l8vp<R

delta 57
zcmbPWwA+ZwCD<jzT9Sc*F?l0bIX9Qzm6-Tor+5LkE1SEy=Q8nV1sht#b2tWv`f)K&
NW)za!tj_n63jo>=5C;GN

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index 578de7540f6f09c05ad81f62abd142be8cb288ee..657c8263f0c649abc806a67576fd74cb32af60c3 100644
GIT binary patch
delta 58
zcmdn(Gtr03CD<iIP>q3sF=HcFIX8FrT*jFAV5fM2rn#GYxPLG*wbyKJ<1OWxtRTd?
OIg+o6bMq4A=}Z6+RuYx~

delta 66
zcmbQ}v)hNuCD<jzT8)8$@y|xCa&GR{1&lHA!A|i4J@YsBaQ|RrYOLSf##_q6BcK^<
WU=h#Z7#!-yIC&$#+~(hsVmtuEyA;^~

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index 502ae9e745a3899378ea770725836da347d1f804..66b39be294a261a6bd991c6bcbd8e2a04a03403f 100644
GIT binary patch
delta 81
zcmZoq+?c@S66_LUXu!b0*uIggQI5;|e@uL^Q@nul|IO3o44Finjs_cA#&g6wx&-ks
lGB7hlH#r^Nd`Cf(hfjpfCCo2`iNh(_)rX6DbGohqGXU$L7Q6re

delta 96
zcmdm((4NTU66_MvZot66sJD@;QI4mPl`$qh*ePD1gN1SPR5?Q?5w}yphL-Uh@s2J*
wJd6y?4AD(KM>pS6(Bxqf(41VLpdlc_<`U)?!o=Ye?CQhC3=!NcsH?yX0Mzgp3IG5A

-- 
MST


