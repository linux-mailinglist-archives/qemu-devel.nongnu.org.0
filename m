Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FDD53117B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:07:39 +0200 (CEST)
Received: from localhost ([::1]:35012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9ej-00050f-Rw
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nt9cY-00046m-Jp
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:05:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nt9cU-0008K9-WF
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653318317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F94WVMcVA687IFyPqefx+vrPFuTSjfQuyqDxwX9/BGM=;
 b=T8Y6GEJDUG/MMiTh8TX0EdvxBcu2e1quN9ZTVzpSMpF8bdNP783zwQt07aQgfHH5y5Cs0P
 V/jZ7dyoBMimb/NkAUCkvsOAulc+ciSb/xqy5qX1REAgsTZWtHRXRoBJR8ewTDn8e6Yxmu
 Cug8dSRPjug12jTsCi4Y3Pa48WHh4zg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-mRHYH3e4MeOSzReKRMVxdA-1; Mon, 23 May 2022 11:05:15 -0400
X-MC-Unique: mRHYH3e4MeOSzReKRMVxdA-1
Received: by mail-ej1-f71.google.com with SMTP id
 p7-20020a170906614700b006f87f866117so6154981ejl.21
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 08:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F94WVMcVA687IFyPqefx+vrPFuTSjfQuyqDxwX9/BGM=;
 b=spanXR7McHCS578Agu1+lNa7r+LhJl4S/d8ShmNFnWz56Enj+8l+Yx+h6sUzileBLG
 vvcNBqk6o5EJU0OS48uMDjIfPIYKW4RFmLdhPFKbDJITf2FSeqp8+tsf6kN9aaMDJaV7
 2Q5mkGQmOcn2gESdLuHX/iXiSvy7nt7O0Iw2X0yAATaqP5tIyaDD+4IURlUvcL3Lm5PZ
 y8MPqEVtN/I+/rUI7Pm5Z6y0YUK4VpRudfw7MroFia5TUou5Wa1MSjkJrYR8OF8BG1L9
 W6xix6RN+Y9gRDrxWwaF0p5ksVTBnmZCHjmQc2VU5/lI6YSuF3JVlaXoey2JYofsv4ZO
 wJLQ==
X-Gm-Message-State: AOAM530wZW+1HkEZTF9h60CzQE3pj50tjIhnrCqOiP8rBzyx6xfzUOgt
 Nv2F0GJARSkXtirJwDSzP+rx+PpTDQYF3WkYnAFAoFyICw8/WvmDMrUCOeqCtVIj9PwAwkpM/gh
 8YE5RKjDWJqU3sjYpXxsECsYsxPCpaeuiaCc2bbi2tifUBsMdlkfgdRi8HUU0P69Nl0Q=
X-Received: by 2002:a17:906:412:b0:6fe:a4f4:9605 with SMTP id
 d18-20020a170906041200b006fea4f49605mr15056828eja.661.1653318313559; 
 Mon, 23 May 2022 08:05:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd+05mSYA5vHtHzxSdQSmGvePYJs7TMb1NF8EUSrWK1kLEIL8CtxBxlcbOZRCcERMkEpxj9Q==
X-Received: by 2002:a17:906:412:b0:6fe:a4f4:9605 with SMTP id
 d18-20020a170906041200b006fea4f49605mr15056798eja.661.1653318313206; 
 Mon, 23 May 2022 08:05:13 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 gj22-20020a170907741600b006feded0fa96sm1377793ejc.199.2022.05.23.08.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 08:05:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com
Subject: [PATCH v4 0/8] qmp, hmp: statistics subsystem and KVM suport.
Date: Mon, 23 May 2022 17:05:01 +0200
Message-Id: <20220523150509.349412-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Paolo

v3->v4:
- correctly handle errors from the callbacks (patch 1)
- renamed str_in_list to apply_str_list_filter (patch 3)
- handle empty filter early by avoiding the query altogether (patch 3, 7)

(patches 2/4/6/8 are identical to v3; patch 5 only has context changes)

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
 include/monitor/stats.h |  45 +++++
 monitor/hmp-cmds.c      | 229 ++++++++++++++++++++++
 monitor/qmp-cmds.c      | 149 +++++++++++++++
 qapi/meson.build        |   1 +
 qapi/qapi-schema.json   |   1 +
 qapi/stats.json         | 246 ++++++++++++++++++++++++
 9 files changed, 1100 insertions(+)
 create mode 100644 include/monitor/stats.h
 create mode 100644 qapi/stats.json

-- 
2.36.0


