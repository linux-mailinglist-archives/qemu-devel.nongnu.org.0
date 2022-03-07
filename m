Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07DD4D0B5D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:47:07 +0100 (CET)
Received: from localhost ([::1]:50292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRM8B-00087E-1s
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:47:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM61-0005BF-G2
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:44:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM5z-00059o-Ut
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:44:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1o/co5SzJ3afQc19M+6XwM/OcyfK5XPAzn/pSwX2qvQ=;
 b=dJk4N9cfHx8iC/f/gW6XfwUp1mU09ndBS5B7XunZz+SAJfonWPI+dYf1nNQDWdeaH+CK9L
 A06vWohta9OTjD/Ru0ZVPBDKodx4ed0+4ukng0d50NaqaowycC+WkfnAG7jnjJvcnVoisJ
 Hv+Hpd8uajeR2nmOYvZbHaQdNs2sCP4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-_bGtdt5YOcW2FrWRwlXBrg-1; Mon, 07 Mar 2022 17:44:50 -0500
X-MC-Unique: _bGtdt5YOcW2FrWRwlXBrg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k41-20020a05600c1ca900b00389a2b983efso1522349wms.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1o/co5SzJ3afQc19M+6XwM/OcyfK5XPAzn/pSwX2qvQ=;
 b=MyzvcjufwFKiTg/fC1HuGlwxIB3rEN3/F6L59Nb7lj7UFu1uaKuOPy4EqWPav4BjyC
 QuuSYkkjS6KRbtF/L5bwf/qorGF0tWfClyB10RO6hzEYQBprg/vJ6QuE7yBjzFrJNNjW
 1FYBrx8+pXOamNM03sgjjE1jGmuhurMIBxRkBldJ380aJ65u0dGphMblFqTBDNRGF09i
 gUbrZeDtyKzc4v5iPmPLpHr43GikkrU9nLvWAgkANZdsx+xiAiA0dJND9WcQVKgPyFDs
 FuE66cQZJfNO/aoWX6fODAWsHrpaY4zlnfco00f9FloS+OzQNXBHmcuTjAXEAOH0i1R8
 ijWg==
X-Gm-Message-State: AOAM531iVCdhUvxkH2XJeaxb2CjXgSjwnfD/TDia40sEae8mWEzypMYb
 +QIMZRqqNf5S7OPXFKGHT/33nxspnJuMlH0GkH3yn7oXbKT2IcuBY0xUQprh369wMWOs6PGNwy9
 XphsC9SrNUhhcQrKxVgZSSeNpWRF2fbPTpWKCslzl0kiYfMpTnK/M786F51j9
X-Received: by 2002:adf:fd87:0:b0:1ed:e0c3:a2d4 with SMTP id
 d7-20020adffd87000000b001ede0c3a2d4mr9793226wrr.374.1646693088991; 
 Mon, 07 Mar 2022 14:44:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXjZMkZBEl3acmUYbbTCGqNDvce3SIqqoITJH0nA4i8M5V2jv/60u0wK/RHWjWVxuNDiMkzg==
X-Received: by 2002:adf:fd87:0:b0:1ed:e0c3:a2d4 with SMTP id
 d7-20020adffd87000000b001ede0c3a2d4mr9793212wrr.374.1646693088693; 
 Mon, 07 Mar 2022 14:44:48 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 l1-20020a05600c4f0100b00387369f380bsm559485wmq.41.2022.03.07.14.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:44:48 -0800 (PST)
Date: Mon, 7 Mar 2022 17:44:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 05/47] hw/acpi/erst: clean up unused IS_UEFI_CPER_RECORD
 macro
Message-ID: <20220307224357.682101-6-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Eric DeVolder <eric.devolder@oracle.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

This change is cosmetic. IS_UEFI_CPER_RECORD macro definition that was added
as a part of the ERST implementation seems to be unused. Remove it.

CC: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20220223143322.927136-5-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/erst.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index c0a23cf467..de509c2b48 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -80,11 +80,6 @@
 #define UEFI_CPER_RECORD_MIN_SIZE 128U
 #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
 #define UEFI_CPER_RECORD_ID_OFFSET 96U
-#define IS_UEFI_CPER_RECORD(ptr) \
-    (((ptr)[0] == 'C') && \
-     ((ptr)[1] == 'P') && \
-     ((ptr)[2] == 'E') && \
-     ((ptr)[3] == 'R'))
 
 /*
  * NOTE that when accessing CPER fields within a record, memcpy()
-- 
MST


