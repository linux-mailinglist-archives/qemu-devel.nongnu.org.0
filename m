Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FA1542086
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 02:45:52 +0200 (CEST)
Received: from localhost ([::1]:35926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyjpW-0004ny-Pu
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 20:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@stgolabs.net>) id 1nyhp4-0006dL-32
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 18:37:14 -0400
Received: from insect.birch.relay.mailchannels.net ([23.83.209.93]:52488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@stgolabs.net>) id 1nyhp1-0000sF-Pu
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 18:37:13 -0400
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 1ED2C5A2004;
 Tue,  7 Jun 2022 22:37:08 +0000 (UTC)
Received: from pdx1-sub0-mail-a312.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 16EE25A1AF5;
 Tue,  7 Jun 2022 22:37:07 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1654641427; a=rsa-sha256;
 cv=none;
 b=lONLYd0StgE/iYJ5pnG9Ab+j9R0q+m5rsUHrBIh/IfrpXGdt9mkTgOOEVElvlEEmtfR43+
 18c/iO9ZZjetzqzsSK+ZmEDvxokGDfCbjxthcSaLiPhBHmrmj4oySP0BXR8NSCO3avvN1G
 jUnvjV1wsEKXMRqw+ii7qa7XtrEFT9pfHNg4gX1+NdXqJcIVn895dClJRLvuiM6KNXym9I
 /8kaOANUPQbjsr3maeMs15aWQ6ke/K8QDyfGPts3IBnbk8radJQpCPZd3y+gCvbA2D88qX
 GhvqjNUdlwhxLxO/+h18NkrXtLTuh6LS/UkB5CP9bHTBH7cUTxT4TEBp/dZ+9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1654641427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=LXR2eEloRFAvntPDQLNHttzah9bZfuod1gXWFD1jMgw=;
 b=sZlMCeAyxFUGnnoNX+VQptKZ0HcAmnbCsV/fME+Esj8+gQfsDDwA0s2Wiy756kjbpLJ/cd
 Gfaz9lLuJlBIffXGYP08htDItn3RBPnxCjOmYAegwZ8wgraSZ1oOLvFwfwrqMxMx7+6kh/
 uu873Jk9oar3Uyie2kUwWDFq98O+2dteBrlC1csPnurcoSVpZuWoaBnFU7ubltPG25V0nQ
 5MOl51NyVLnlXbHwX4Qdql4n0j3g4XiueQ+hQnmMuIhyrhtxiTjboanS9H0lgGO3GStX5p
 LqCXCJAwpdHQohmr2XpW67q75DV6LVRV4qMuIJx10NDzst5LnOBbGiexipB9UQ==
ARC-Authentication-Results: i=1; rspamd-848669fb87-2fbzt;
 auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Occur-Eight: 1715e8b966d04826_1654641427843_1511666637
X-MC-Loop-Signature: 1654641427843:3666851013
X-MC-Ingress-Time: 1654641427843
Received: from pdx1-sub0-mail-a312.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.116.106.98 (trex/6.7.1); Tue, 07 Jun 2022 22:37:07 +0000
Received: from offworld (unknown [104.36.31.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dave@stgolabs.net)
 by pdx1-sub0-mail-a312.dreamhost.com (Postfix) with ESMTPSA id 4LHlbP5cL8zLK; 
 Tue,  7 Jun 2022 15:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
 s=dreamhost; t=1654641426;
 bh=LXR2eEloRFAvntPDQLNHttzah9bZfuod1gXWFD1jMgw=;
 h=Date:From:To:Cc:Subject:Content-Type;
 b=TMsV061F/hj4rCCqiTe8NsjhLaQjArSDWmeLA7nuSheOkRFexWWEN0mGo4hZfSsMU
 8YE5ufEAvEv8saPMzb8AqH1hdD3ZD9gCYo0JKJmxbSNj8Yx4JsrDF62XvDeLGhqnJH
 69CLKAVaEqS97PFV1o2Jj3U+oVMIa3kMLFCy5U2RqDieRU+FQgatMYIXGjLWsvcDg9
 YBU7mMZMtBCwe2oFWz5lfVHbc/HUzFi1gFQL68S60spqZxr9lQbq3pf6nDypnNVGit
 N9kurT64Ko5sc1HiuQPrpnjdRx09bsIsgZR/+HjFt4goNs5z/nUxSzfP3mAwqKjbqC
 J0ODhaUWo4LIg==
Date: Tue, 7 Jun 2022 15:37:02 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, alex.bennee@linaro.org,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Adam Manzanares <a.manzanares@samsung.com>,
 Tong Zhang <ztong0001@gmail.com>, Ben Widawsky <ben.widawsky@intel.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 1/8] hw/cxl: Make the CXL fixed memory window setup a
 machine parameter.
Message-ID: <20220607223702.lpq34pq6wqnvr7ej@offworld>
References: <20220601164235.2117-1-Jonathan.Cameron@huawei.com>
 <20220601164235.2117-2-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220601164235.2117-2-Jonathan.Cameron@huawei.com>
User-Agent: NeoMutt/20220429
Received-SPF: pass client-ip=23.83.209.93; envelope-from=dave@stgolabs.net;
 helo=insect.birch.relay.mailchannels.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 07 Jun 2022 20:43:59 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 01 Jun 2022, Jonathan Cameron wrote:

>Paolo Bonzini requested this change to simplify the ongoing
>effort to allow machine setup entirely via RPC.
>
>Includes shortening the command line form cxl-fixed-memory-window
>to cxl-fmw as the command lines are extremely long even with this
>change.
>
>The json change is needed to ensure that there is
>a CXLFixedMemoryWindowOptionsList even though the actual
>element in the json is never used. Similar to existing
>SgxEpcProperties.
>
>Update cxl-test and bios-tables-test to reflect new parameters.
>
>Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>

One thing missing however is updating qemu-options.hx - maybe fold
in the below?

Thanks!

----8<-------

diff --git a/qemu-options.hx b/qemu-options.hx
index 60cf188da429..3bcf1247b88a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -127,10 +127,43 @@ SRST
  ERST
  
  DEF("M", HAS_ARG, QEMU_OPTION_M,
+    "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n"
      "                sgx-epc.0.memdev=memid,sgx-epc.0.node=numaid\n",
      QEMU_ARCH_ALL)
  
  SRST
+``cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]``
+    Define a CXL Fixed Memory Window (CFMW).
+
+    Described in the CXL 2.0 ECN: CEDT CFMWS & QTG _DSM.
+
+    They are regions of Host Physical Addresses (HPA) on a system which
+    may be interleaved across one or more CXL host bridges.  The system
+    software will assign particular devices into these windows and
+    configure the downstream Host-managed Device Memory (HDM) decoders
+    in root ports, switch ports and devices appropriately to meet the
+    interleave requirements before enabling the memory devices.
+
+    ``targets.X=firsttarget`` provides the mapping to CXL host bridges
+    which may be identified by the id provied in the -device entry.
+    Multiple entries are needed to specify all the targets when
+    the fixed memory window represents interleaved memory. X is the
+    target index from 0.
+
+    ``size=size`` sets the size of the CFMW. This must be a multiple of
+    256MiB. The region will be aligned to 256MiB but the location is
+    platform and configuration dependent.
+
+    ``interleave-granularity=granularity`` sets the granularity of
+    interleave. Default 256KiB. Only 256KiB, 512KiB, 1024KiB, 2048KiB
+    4096KiB, 8192KiB and 16384KiB granularities supported.
+
+    Example:
+
+    ::
+
+	-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512k
+
  ``sgx-epc.0.memdev=@var{memid},sgx-epc.0.node=@var{numaid}``
      Define an SGX EPC section.
  ERST
@@ -467,44 +500,6 @@ SRST
          -numa hmat-cache,node-id=1,size=10K,level=1,associativity=direct,policy=write-back,line=8
  ERST
  
-DEF("cxl-fixed-memory-window", HAS_ARG, QEMU_OPTION_cxl_fixed_memory_window,
-    "-cxl-fixed-memory-window targets.0=firsttarget,targets.1=secondtarget,size=size[,interleave-granularity=granularity]\n",
-    QEMU_ARCH_ALL)
-SRST
-``-cxl-fixed-memory-window targets.0=firsttarget,targets.1=secondtarget,size=size[,interleave-granularity=granularity]``
-    Define a CXL Fixed Memory Window (CFMW).
-
-    Described in the CXL 2.0 ECN: CEDT CFMWS & QTG _DSM.
-
-    They are regions of Host Physical Addresses (HPA) on a system which
-    may be interleaved across one or more CXL host bridges.  The system
-    software will assign particular devices into these windows and
-    configure the downstream Host-managed Device Memory (HDM) decoders
-    in root ports, switch ports and devices appropriately to meet the
-    interleave requirements before enabling the memory devices.
-
-    ``targets.X=firsttarget`` provides the mapping to CXL host bridges
-    which may be identified by the id provied in the -device entry.
-    Multiple entries are needed to specify all the targets when
-    the fixed memory window represents interleaved memory. X is the
-    target index from 0.
-
-    ``size=size`` sets the size of the CFMW. This must be a multiple of
-    256MiB. The region will be aligned to 256MiB but the location is
-    platform and configuration dependent.
-
-    ``interleave-granularity=granularity`` sets the granularity of
-    interleave. Default 256KiB. Only 256KiB, 512KiB, 1024KiB, 2048KiB
-    4096KiB, 8192KiB and 16384KiB granularities supported.
-
-    Example:
-
-    ::
-
-        -cxl-fixed-memory-window targets.0=cxl.0,targets.1=cxl.1,size=128G,interleave-granularity=512k
-
-ERST
-
  DEF("add-fd", HAS_ARG, QEMU_OPTION_add_fd,
      "-add-fd fd=fd,set=set[,opaque=opaque]\n"
      "                Add 'fd' to fd 'set'\n", QEMU_ARCH_ALL)

