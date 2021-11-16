Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505C6453594
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 16:18:26 +0100 (CET)
Received: from localhost ([::1]:59764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn0E5-0006xg-C0
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 10:18:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn09Q-0001fg-7b
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:13:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn09N-0001tX-Ur
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:13:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637075613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ms3B9QbG5Lq6X9ovVT6jCZ1RA1SZmRfiYx9TmX6F1t4=;
 b=W9XP767C8RintxATASpPtVIAQUFQjtMFIyANvLt4Tz8HqrzE8zUl/XBG6GYMn0tNDbaYp5
 BtpIPL+8illJPN/oWgzX55y4aDWE8Ra29SyS4MUcmtmEYrGE6Gc7WmVtD0ZpNJlwDESLHQ
 kkPjuWC1Hnqi+e+SXjRgF7UeZ60SUpE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-72-Yi_hDwKLM-u-98qdauji_A-1; Tue, 16 Nov 2021 10:13:32 -0500
X-MC-Unique: Yi_hDwKLM-u-98qdauji_A-1
Received: by mail-wm1-f72.google.com with SMTP id
 b133-20020a1c808b000000b0032cdd691994so1348871wmd.1
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 07:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ms3B9QbG5Lq6X9ovVT6jCZ1RA1SZmRfiYx9TmX6F1t4=;
 b=ukjvrLSUfRDcXqAsB+t5MLD5gkqZyWTScRetN0yRhx+9PHQDNIP+5cafjRkQMYj/6h
 hfkxlJ1QmFPgQU7ifWAP+PKAJ8eNTUKjuH/xLPKh7nTSA57gjuc5/H1LYoKR1RVFAlUJ
 48SEgG8cH0irRCKt8Md304qdXLYb/diW3JaUoBO8wxGKzda7s6M1Z+kGplWNs7SEG9ML
 la4ONOteU1ikkjqHge33OrJBWeo4xlhccNaSYAI7FAS6cDuwmHs/l1YwZK/O4IyQNqso
 gQQNYzeHjfvZsJFpxPXP6hF4sI3nXf9SUAgYAnIU7HjAmw/YryAHYy1Pn2h0ZoVbVA21
 rG5Q==
X-Gm-Message-State: AOAM530zaR2TqxiJXX3OTiP4muaRlU5Wh9KmLHF4e5uXOsgJcieuCIlR
 oHSfp++hNFM5coxOel/BLbtFjeRFJ5ZddvHCvkiEz2P8zYh3detUlPMd8SB5okPzRyPwdcWFusV
 WI9FVltV2fyWGEnhKlsKR+dZYKDJolG0dVhJlUSN9DG0HK5RvS3JEutXBRC/eSOTk
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr10255453wrs.26.1637075609548; 
 Tue, 16 Nov 2021 07:13:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKrIz4ZXrYywbmjqVM+jHNv8Gv2kN8EykBs2fpvd6a/Pt52hzN1viz2/PIyiFpw2ui9yGJBg==
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr10255376wrs.26.1637075609047; 
 Tue, 16 Nov 2021 07:13:29 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 o4sm3141465wmq.31.2021.11.16.07.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:13:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? 2/3] docs/devel/style: Improve Error** functions rST
 rendering
Date: Tue, 16 Nov 2021 16:13:16 +0100
Message-Id: <20211116151317.2691125-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116151317.2691125-1-philmd@redhat.com>
References: <20211116151317.2691125-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/style.rst | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 415a6b9d700..21f0f213193 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -602,16 +602,16 @@ Error handling and reporting
 Reporting errors to the human user
 ----------------------------------
 
-Do not use printf(), fprintf() or monitor_printf().  Instead, use
-error_report() or error_vreport() from error-report.h.  This ensures the
-error is reported in the right place (current monitor or stderr), and in
-a uniform format.
+Do not use ``printf()``, ``fprintf()`` or ``monitor_printf()``.  Instead, use
+``error_report()`` or ``error_vreport()`` from error-report.h.  This ensures
+the error is reported in the right place (current monitor or ``stderr``), and
+in a uniform format.
 
-Use error_printf() & friends to print additional information.
+Use ``error_printf()`` & friends to print additional information.
 
-error_report() prints the current location.  In certain common cases
+``error_report()`` prints the current location.  In certain common cases
 like command line parsing, the current location is tracked
-automatically.  To manipulate it manually, use the loc_``*``() from
+automatically.  To manipulate it manually, use the ``loc_*()`` from
 error-report.h.
 
 Propagating errors
@@ -621,7 +621,7 @@ An error can't always be reported to the user right where it's detected,
 but often needs to be propagated up the call chain to a place that can
 handle it.  This can be done in various ways.
 
-The most flexible one is Error objects.  See error.h for usage
+The most flexible one is ``Error`` objects.  See error.h for usage
 information.
 
 Use the simplest suitable method to communicate success / failure to
@@ -631,10 +631,10 @@ error, non-negative / -errno, non-null / null, or Error objects.
 Example: when a function returns a non-null pointer on success, and it
 can fail only in one way (as far as the caller is concerned), returning
 null on failure is just fine, and certainly simpler and a lot easier on
-the eyes than propagating an Error object through an Error ``*````*`` parameter.
+the eyes than propagating an Error object through an ``Error **`` parameter.
 
 Example: when a function's callers need to report details on failure
-only the function really knows, use Error ``*````*``, and set suitable errors.
+only the function really knows, use ``Error **``, and set suitable errors.
 
 Do not report an error to the user when you're also returning an error
 for somebody else to handle.  Leave the reporting to the place that
@@ -643,17 +643,17 @@ consumes the error returned.
 Handling errors
 ---------------
 
-Calling exit() is fine when handling configuration errors during
+Calling ``exit()`` is fine when handling configuration errors during
 startup.  It's problematic during normal operation.  In particular,
-monitor commands should never exit().
+monitor commands should never ``exit()``.
 
-Do not call exit() or abort() to handle an error that can be triggered
+Do not call ``exit()`` or ``abort()`` to handle an error that can be triggered
 by the guest (e.g., some unimplemented corner case in guest code
 translation or device emulation).  Guests should not be able to
 terminate QEMU.
 
-Note that &error_fatal is just another way to exit(1), and &error_abort
-is just another way to abort().
+Note that ``&error_fatal`` is just another way to ``exit(1)``, and
+``&error_abort`` is just another way to ``abort()``.
 
 
 trace-events style
-- 
2.31.1


