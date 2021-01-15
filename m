Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C842F7D7E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:02:10 +0100 (CET)
Received: from localhost ([::1]:35824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Pg1-0001EV-Jl
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:02:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3V-0007Ag-Td
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3B-0003Kc-NI
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZLIFVueT1RPqG4+onnpnYr9Ai41uR4lMWlYwgPMOHM=;
 b=Fq1wDBorynhsTVLhhHmz8ScNvyAoR+WLbxbcscwMNAwjNfsUtmr6ZUghtrj7YEVgvjoj8j
 qeHQ8JKuwBwMj2H2M4wjST0c/j72nW7pgwouB8t3QQHfjYk0O3WOy75QnaP8PnjroTA1pi
 kokJQLmezyY9a+XQ3eFSA/uLhTZHV2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-1ei_b5xROL-8ajO-U72oOQ-1; Fri, 15 Jan 2021 08:21:59 -0500
X-MC-Unique: 1ei_b5xROL-8ajO-U72oOQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7E71180A09B;
 Fri, 15 Jan 2021 13:21:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 752E86F991;
 Fri, 15 Jan 2021 13:21:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 66F731800D57; Fri, 15 Jan 2021 14:21:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/30] audio: Fix lines over 90 characters
Date: Fri, 15 Jan 2021 14:21:43 +0100
Message-Id: <20210115132146.1443592-28-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Zhang Han <zhanghan64@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Han <zhanghan64@huawei.com>

Fix the line width of code.

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
Message-id: 20210115012431.79533-1-zhanghan64@huawei.com
Message-Id: <20210115012431.79533-5-zhanghan64@huawei.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/dsoundaudio.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index 21c2891772de..3b4afb949631 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -89,7 +89,9 @@ static void dsound_log_hresult (HRESULT hr)
 #endif
 #ifdef DSERR_ALLOCATED
     case DSERR_ALLOCATED:
-        str = "The request failed because resources, such as a priority level, were already in use by another caller";
+        str = "The request failed because resources, "
+              "such as a priority level, were already in use "
+              "by another caller";
         break;
 #endif
 #ifdef DSERR_ALREADYINITIALIZED
@@ -104,7 +106,8 @@ static void dsound_log_hresult (HRESULT hr)
 #endif
 #ifdef DSERR_BADSENDBUFFERGUID
     case DSERR_BADSENDBUFFERGUID:
-        str = "The GUID specified in an audiopath file does not match a valid mix-in buffer";
+        str = "The GUID specified in an audiopath file "
+              "does not match a valid mix-in buffer";
         break;
 #endif
 #ifdef DSERR_BUFFERLOST
@@ -114,22 +117,31 @@ static void dsound_log_hresult (HRESULT hr)
 #endif
 #ifdef DSERR_BUFFERTOOSMALL
     case DSERR_BUFFERTOOSMALL:
-        str = "The buffer size is not great enough to enable effects processing";
+        str = "The buffer size is not great enough to "
+              "enable effects processing";
         break;
 #endif
 #ifdef DSERR_CONTROLUNAVAIL
     case DSERR_CONTROLUNAVAIL:
-        str = "The buffer control (volume, pan, and so on) requested by the caller is not available. Controls must be specified when the buffer is created, using the dwFlags member of DSBUFFERDESC";
+        str = "The buffer control (volume, pan, and so on) "
+              "requested by the caller is not available. "
+              "Controls must be specified when the buffer is created, "
+              "using the dwFlags member of DSBUFFERDESC";
         break;
 #endif
 #ifdef DSERR_DS8_REQUIRED
     case DSERR_DS8_REQUIRED:
-        str = "A DirectSound object of class CLSID_DirectSound8 or later is required for the requested functionality. For more information, see IDirectSound8 Interface";
+        str = "A DirectSound object of class CLSID_DirectSound8 or later "
+              "is required for the requested functionality. "
+              "For more information, see IDirectSound8 Interface";
         break;
 #endif
 #ifdef DSERR_FXUNAVAILABLE
     case DSERR_FXUNAVAILABLE:
-        str = "The effects requested could not be found on the system, or they are in the wrong order or in the wrong location; for example, an effect expected in hardware was found in software";
+        str = "The effects requested could not be found on the system, "
+              "or they are in the wrong order or in the wrong location; "
+              "for example, an effect expected in hardware "
+              "was found in software";
         break;
 #endif
 #ifdef DSERR_GENERIC
@@ -154,7 +166,8 @@ static void dsound_log_hresult (HRESULT hr)
 #endif
 #ifdef DSERR_NODRIVER
     case DSERR_NODRIVER:
-        str = "No sound driver is available for use, or the given GUID is not a valid DirectSound device ID";
+        str = "No sound driver is available for use, "
+              "or the given GUID is not a valid DirectSound device ID";
         break;
 #endif
 #ifdef DSERR_NOINTERFACE
@@ -169,12 +182,14 @@ static void dsound_log_hresult (HRESULT hr)
 #endif
 #ifdef DSERR_OTHERAPPHASPRIO
     case DSERR_OTHERAPPHASPRIO:
-        str = "Another application has a higher priority level, preventing this call from succeeding";
+        str = "Another application has a higher priority level, "
+              "preventing this call from succeeding";
         break;
 #endif
 #ifdef DSERR_OUTOFMEMORY
     case DSERR_OUTOFMEMORY:
-        str = "The DirectSound subsystem could not allocate sufficient memory to complete the caller's request";
+        str = "The DirectSound subsystem could not allocate "
+               "sufficient memory to complete the caller's request";
         break;
 #endif
 #ifdef DSERR_PRIOLEVELNEEDED
@@ -189,7 +204,9 @@ static void dsound_log_hresult (HRESULT hr)
 #endif
 #ifdef DSERR_UNINITIALIZED
     case DSERR_UNINITIALIZED:
-        str = "The Initialize method has not been called or has not been called successfully before other methods were called";
+        str = "The Initialize method has not been called "
+              "or has not been called successfully "
+              "before other methods were called";
         break;
 #endif
 #ifdef DSERR_UNSUPPORTED
-- 
2.29.2


