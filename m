Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE32C522EEC
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 11:06:07 +0200 (CEST)
Received: from localhost ([::1]:48030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noiII-0005oT-Co
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 05:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noi1b-0006OP-2w
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noi1Z-0002pG-3j
 for qemu-devel@nongnu.org; Wed, 11 May 2022 04:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652258927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yngQJ6YW2ZpeDS7/G5P3falW5zEMeu8HygEhVAxBIJk=;
 b=gdNo9osmsnMoK+79BKmaes+QzOm1HNAyl4BLuhFwXSogc8WxBvSsQYhxoIlsET4nkXr2tN
 FLPtRFHd+zWY1j+MPqmmUfrFpbiA2WAu45US37pcl75q+OFcYcokLPsgLjUWSZe5VEdRXE
 ba1k3tjq6pF6X7z4pI6ivLgWwAMgNas=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-yFFIpGXGOCSlPcqUbZytDQ-1; Wed, 11 May 2022 04:48:39 -0400
X-MC-Unique: yFFIpGXGOCSlPcqUbZytDQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 bj22-20020a0560001e1600b0020cccc6b25aso581524wrb.1
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 01:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yngQJ6YW2ZpeDS7/G5P3falW5zEMeu8HygEhVAxBIJk=;
 b=Mds7pKPaosyxmwLOzthLurlQEZftXk+FNQ0cJv72q9BuDCBf/+gGZ5uhuJ0L2TKC3A
 wVnjvsTX+/igiX5+GRzZRUK0s0Zlm19uMsX+9plUAYLiSFGjBW6P3SAiSmKdvZ6eHGbV
 R3U0rAPVwwkatbrO5I5J+jRRvb6eNtH09zip+2QOJGta5WJivRd/WukoLsEE+5a6yer/
 BBcueuS4Xqe1s9uH0UJ3WHL+veVTV1Zqun7Ebzebjxoxu0IpSebeTc7ogawYgipkot/t
 k5drSyp8C8IozWl/vi6lkdpaMNjS/5OroV3KJitSoMgNGoGQbxIcvlAagnRcntptQEoD
 edhQ==
X-Gm-Message-State: AOAM5324p5TFHSUKi/RjsKDtxJLSCJ11JMK+9cshWBtbOtzhBpJnYl9P
 dPJYVdIgZASopxl4etEwYETqQzjygWBlthm9uxILcYbCv/OTnmzQj0XY6kQNBmUj+r8Ii+wNriG
 5J8RjOZBgNb/UL+yzyWXyM3QiVKjvX8C3Vjl0xO6c5W/eQm5ogHxZj4IfbAEtVQ7Bx4g=
X-Received: by 2002:a5d:4ed1:0:b0:20a:e375:35f0 with SMTP id
 s17-20020a5d4ed1000000b0020ae37535f0mr21514395wrv.94.1652258917248; 
 Wed, 11 May 2022 01:48:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzo9yYLO+MeqRw2tFC8RG331ShSIFy+Q6X8+97XeR/VQB14Lx/qvaIFDu4sq0PksUCrx9nG9A==
X-Received: by 2002:a5d:4ed1:0:b0:20a:e375:35f0 with SMTP id
 s17-20020a5d4ed1000000b0020ae37535f0mr21514366wrv.94.1652258916734; 
 Wed, 11 May 2022 01:48:36 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a056000114200b0020c6a524fe0sm1043795wrx.98.2022.05.11.01.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:48:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	dgilbert@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 0/8] qmp, hmp: statistics subsystem and KVM suport.
Date: Wed, 11 May 2022 10:48:25 +0200
Message-Id: <20220511084833.195963-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds QEMU support for querying fd-based KVM statistics.
This allows the user to analyze the behavior of the VM without access
to debugfs.

However, instead of adding an ad hoc command, the new QMP entry point
can be extended in the future to more statistics provider than KVM
(for example TCG, tap, or the block layer) and to more objects than
the VM and vCPUS (for example network interfaces or block devices).

Because the statistics exposed by KVM are not known at compile time,
the kernel interface also comes with an introspectable schema.  This
schema is exposed by the query-stats-schemas QMP command.

Patches 1 and 2 add the basic support, respectively the QMP command
and the KVM producer.

Patches 3 and 4 add a basic HMP implementation.  The first of the two
adds a basic filtering mechanism to the QMP command, which is then used
by HMP (which only shows vCPU statistics for the currently selected
guest CPU; this is consistent with other HMP commands and does not
flood the user with an overwhelming amount of output).

The remaining patches add more filtering, respectively by provider
and by the name of a statistic.

v1->v2:

- changed linear-hist and log-hist to linear-histogram and log2-histogram

- improved documentation (see diff below in this cover letter)

- fixed bisectability of monitor/hmp-cmds.c changes

Mark Kanda (3):
  qmp: Support for querying stats
  kvm: Support for querying fd-based stats
  hmp: add basic "info stats" implementation

Paolo Bonzini (5):
  qmp: add filtering of statistics by target vCPU
  qmp: add filtering of statistics by provider
  hmp: add filtering of statistics by provider
  qmp: add filtering of statistics by name
  hmp: add filtering of statistics by name

 accel/kvm/kvm-all.c     | 414 ++++++++++++++++++++++++++++++++++++++++
 hmp-commands-info.hx    |  14 ++
 include/monitor/hmp.h   |   1 +
 include/monitor/stats.h |  42 ++++
 monitor/hmp-cmds.c      | 229 ++++++++++++++++++++++
 monitor/qmp-cmds.c      | 132 +++++++++++++
 qapi/meson.build        |   1 +
 qapi/qapi-schema.json   |   1 +
 qapi/stats.json         | 232 ++++++++++++++++++++++
 9 files changed, 1066 insertions(+)
 create mode 100644 include/monitor/stats.h
 create mode 100644 qapi/stats.json

-- 
2.36.0

diff --git a/qapi/stats.json b/qapi/stats.json
index 234fbcb7ca..fc763b4aea 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -20,13 +20,14 @@
 # @cumulative: stat is cumulative; value can only increase.
 # @instant: stat is instantaneous; value can increase or decrease.
 # @peak: stat is the peak value; value can only increase.
-# @linear-hist: stat is a linear histogram.
-# @log-hist: stat is a logarithmic histogram.
+# @linear-histogram: stat is a linear histogram.
+# @log2-histogram: stat is a logarithmic histogram, with one bucket
+#                  for each power of two.
 #
 # Since: 7.1
 ##
 { 'enum' : 'StatsType',
-  'data' : [ 'cumulative', 'instant', 'peak', 'linear-hist', 'log-hist' ] }
+  'data' : [ 'cumulative', 'instant', 'peak', 'linear-histogram', 'log2-histogram' ] }
 
 ##
 # @StatsUnit:
@@ -57,8 +58,10 @@
 #
 # The kinds of objects on which one can request statistics.
 #
-# @vm: the entire virtual machine.
-# @vcpu: a virtual CPU.
+# @vm: statistics that apply to the entire virtual machine or
+#      the entire QEMU process.
+#
+# @vcpu: statistics that apply to a single virtual CPU.
 #
 # Since: 7.1
 ##
@@ -68,10 +71,11 @@
 ##
 # @StatsRequest:
 #
-# Indicates a set of statistics that are required from a statistics provider.
+# Indicates a set of statistics that should be returned by query-stats.
 #
-# @provider: stat provider for which to limit the returned stats.
-# @names: list of stat names.
+# @provider: provider for which to return statistics.
+
+# @names: statistics to be returned (all if omitted).
 #
 # Since: 7.1
 ##
@@ -93,7 +97,11 @@
 # @StatsFilter:
 #
 # The arguments to the query-stats command; specifies a target for which to
-# request statistics, and which statistics are requested from each provider.
+# request statistics and optionally the required subset of information for
+# that target:
+# - which vCPUs to request statistics for
+# - which provider to request statistics from
+# - which values to return within each provider
 #
 # Since: 7.1
 ##
@@ -105,8 +113,8 @@
 ##
 # @StatsValue:
 #
-# @scalar: single uint64.
-# @list: list of uint64.
+# @scalar: single unsigned 64-bit integers.
+# @list: list of unsigned 64-bit integers (used for histograms).
 #
 # Since: 7.1
 ##
@@ -164,19 +172,25 @@
 #
 # Schema for a single statistic.
 #
-# @name: stat name.
+# @name: name of the statistic; each element of the schema is uniquely
+#        identified by a target, a provider (both available in @StatsSchema)
+#        and the name.
 #
-# @type: kind of statistic, a @StatType.
+# @type: kind of statistic.
 #
-# @unit: base unit of measurement for the statistics @StatUnit.
+# @unit: basic unit of measure for the statistic; if missing, the statistic
+#        is a simple number or counter.
 #
-# @base: base for the multiple of @unit that the statistic uses, either 2 or 10.
-#        Only present if @exponent is non-zero.
+# @base: base for the multiple of @unit in which the statistic is measured.
+#        Only present if @exponent is non-zero; @base and @exponent together
+#        form a SI prefix (e.g., _nano-_ for ``base=10`` and ``exponent=-9``)
+#        or IEC binary prefix (e.g. _kibi-_ for ``base=2`` and ``exponent=10``)
 #
-# @exponent: exponent for the multiple of @unit that the statistic uses
+# @exponent: exponent for the multiple of @unit in which the statistic is
+#            expressed, or 0 for the basic unit
 #
-# @bucket-size: Used with linear-hist to report the width of each bucket
-#               of the histogram.
+# @bucket-size: Used with the @linear-histogram @StatsType, contains the width
+#               of each bucket of the histogram.
 #
 # Since: 7.1
 ##
@@ -195,7 +209,7 @@
 #
 # @provider: provider for this set of statistics.
 #
-# @target: kind of object that can be queried through this provider.
+# @target: the kind of object that can be queried through the provider.
 #
 # @stats: list of statistics.
 #


