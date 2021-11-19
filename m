Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF65456C48
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:24:41 +0100 (CET)
Received: from localhost ([::1]:46540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo08O-0007m2-Oh
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:24:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo01L-00067X-NL
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:17:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo01I-0002jO-Mf
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637313440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gRoflLF2rC1zBazllCjukemH1mBXXWiz/W1zufMnXs0=;
 b=G3xoJD7D9Rqmmvr3YDI/h9nD07En2vAsU4dN7QGKYX1dD3fO6Tn8vfCNHHD7Vv6ohc+yLG
 uZeDn6uWGFZJx1WAKue70jlSjt7GnJ75wxjcMD88/rKRXoIwrRMAYN8xZsQza0R6MU9IDN
 emAPamImyNDdqfBuq2m/mdGfvXDEuAk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-nCDSeQrFOWuWNRBgKK686w-1; Fri, 19 Nov 2021 04:17:19 -0500
X-MC-Unique: nCDSeQrFOWuWNRBgKK686w-1
Received: by mail-wm1-f71.google.com with SMTP id
 r6-20020a1c4406000000b0033119c22fdbso3779277wma.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 01:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gRoflLF2rC1zBazllCjukemH1mBXXWiz/W1zufMnXs0=;
 b=Ucx0EXRa3TmtOvYg+QmxmdKTnI20FMLqBXI17pSruWNgZHO/bOy2J139ZfhF89Uq9K
 y6gjMcY0Mj9pu1UAEDyqfMs/yOojHCIUA9+JsNDqDiZHJw9frSNr7nkeQGiPWCQb+zMr
 kvYSkyc6kULJi9kSkm3Imtg55l+Efzj256zNCHXkpgi4S4ZBUHON9Fn5SkZaDAlg0G7/
 U+aEaE2lezbVM44JxXgZDs3zeoCzs4TrIwpANYOKxIITEO7CPd9kQvlTvyceYa5CBvqf
 nvWAF0nLLn1Eqt8n7JNqoN5CkKtAZUfuNncaonjIQdHtSsAn/LHyXD57RaUwSo7BpRcY
 949w==
X-Gm-Message-State: AOAM530exQEGjrEaR+HBzGvPsWqzCm79DwXBdIU20NhIXCBsVAMLSolL
 T2NKvo8u/PdUS3HTYqE4NxLtlK0FBrDsB7eEJj2Gjwrwap86ejIE9Z4wqNq34Lu4eXsbGOLjTRH
 U+vzfj6zdNvSZiN3EnyZPt4fw4bHx0zuWnUPyN1b9QHHItlykab1qdr41ugNYeNy+
X-Received: by 2002:adf:f40b:: with SMTP id g11mr5714987wro.296.1637313437498; 
 Fri, 19 Nov 2021 01:17:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjtIV1auJ1KnpG4qWnuDniPJZ9WC7iv91EjYI8edvo1a8UkKpFC/6mc24Mh9Gkk00xmpLlIA==
X-Received: by 2002:adf:f40b:: with SMTP id g11mr5714945wro.296.1637313437328; 
 Fri, 19 Nov 2021 01:17:17 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 j8sm2305880wrh.16.2021.11.19.01.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 01:17:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? v2 3/3] qga: Spell QEMU all caps
Date: Fri, 19 Nov 2021 10:17:01 +0100
Message-Id: <20211119091701.277973-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119091701.277973-1-philmd@redhat.com>
References: <20211119091701.277973-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, kvm@vger.kernel.org,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU should be written all caps.

Normally checkpatch.pl warns when it is not (see commit
9964d8f9422: "checkpatch: Add QEMU specific rule").

Replace Qemu -> QEMU, update the error message to use the
more descriptive "Guest Agent" name instead of "GA".

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qga/installer/qemu-ga.wxs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index 0950e8c6bec..c02e47fc036 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -40,14 +40,14 @@
   <?endif?>
 
   <Product
-    Name="QEMU guest agent"
+    Name="QEMU Guest Agent"
     Id="*"
     UpgradeCode="{EB6B8302-C06E-4BEC-ADAC-932C68A3A98D}"
     Manufacturer="$(env.QEMU_GA_MANUFACTURER)"
     Version="$(env.QEMU_GA_VERSION)"
     Language="1033">
     <?if $(var.Arch) = 32 ?>
-    <Condition Message="Error: 32-bit version of Qemu GA can not be installed on 64-bit Windows.">NOT VersionNT64</Condition>
+    <Condition Message="Error: 32-bit version of QEMU Guest Agent can not be installed on 64-bit Windows.">NOT VersionNT64</Condition>
     <?endif?>
     <Package
       Manufacturer="$(env.QEMU_GA_MANUFACTURER)"
@@ -64,7 +64,7 @@
 
     <Directory Id="TARGETDIR" Name="SourceDir">
       <Directory Id="$(var.GaProgramFilesFolder)" Name="QEMU Guest Agent">
-        <Directory Id="qemu_ga_directory" Name="Qemu-ga">
+        <Directory Id="qemu_ga_directory" Name="QEMU-GA">
           <Component Id="qemu_ga" Guid="{908B7199-DE2A-4DC6-A8D0-27A5AE444FEA}">
             <File Id="qemu_ga.exe" Name="qemu-ga.exe" Source="$(env.BUILD_DIR)/qga/qemu-ga.exe" KeyPath="yes" DiskId="1"/>
             <ServiceInstall
-- 
2.31.1


