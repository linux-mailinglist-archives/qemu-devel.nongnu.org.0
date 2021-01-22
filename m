Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D8D300443
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:35:11 +0100 (CET)
Received: from localhost ([::1]:42870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wak-0005FY-PA
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:35:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2wWG-00027N-VV
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:30:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2wWC-0004pd-W9
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:30:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611322225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SC9toH6zd85Yt0/fqqNGyw/NDQltVKupxFW46xt/En4=;
 b=REIMCQ/h5V+Cht0r8HrBV20C8jlAj+djP+ivLi+t+T4SrFYjHg39V9UiZym9RyBuvo8+tQ
 Ndkomroje6HCYvoxM+jxwdWptw1LCtM5tsAvb8aGCeI0AemvhHvnDEwC67dvlT7v8W0ulO
 k86FlaPgNHQQoMbrTOnzmlsEmBNuzYM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-4RHTkXnOOny2TmQOtpwmWQ-1; Fri, 22 Jan 2021 08:30:24 -0500
X-MC-Unique: 4RHTkXnOOny2TmQOtpwmWQ-1
Received: by mail-ej1-f70.google.com with SMTP id n18so2180887ejc.11
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 05:30:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SC9toH6zd85Yt0/fqqNGyw/NDQltVKupxFW46xt/En4=;
 b=VV55LMkHwY9ny7tBTh5pohRMhBw0qNNQBUqiHmUnzR7LoqgrazNsWO7TQQ9p1EE3Ba
 It9kbiFyoUPSclPM56rkToySie8YLupSPDZ0JEXXiVK5a4/wKEarJ2vCmWNO0ziaEC1A
 0o/maFYi/8oQclDC/+u0VREBl/6rArcoaDuOvFGp43xEz2nI1dUGOUN5+G3nEpAHkRKy
 yn1kWfEJQPTn31XwNCqYsyEgf31inIcOMAfsYNm7RhhRcp6fk+cEzebgRoXxgl82Tzx3
 T6mkiLHzmp+TEYdKPjUGZ9I1AoqzkJgwCuWn2DjzhECvcbX0CaDBPeoE52NvKTeNm7q0
 9LOA==
X-Gm-Message-State: AOAM533XdhehRZrjbyeo+6xSXe/pqU9KcxbCeTMSvqLOMyzxl2C6fRv4
 pBNroejmdMLJb/r3TtzjYv0IN/cXcKu+qzWwBEmtsbCwdtcEU9IHAnHYeLBjshT/4eO46wvQIyq
 4kjqfAJBTdcjLYeUP1gUi7YWHrRvWOeDzQyBsCjmX1FE/00aPMcYPBvlmMM6n3hND
X-Received: by 2002:a05:6402:18f:: with SMTP id
 r15mr3155259edv.189.1611322222964; 
 Fri, 22 Jan 2021 05:30:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzztiGKu/Yz4F20eM1ZObBDm/xvfQL+kgj20IqgEvBwILnfpDkZYzkxoXHJrrUP9ZXrXE8a9A==
X-Received: by 2002:a05:6402:18f:: with SMTP id
 r15mr3155240edv.189.1611322222802; 
 Fri, 22 Jan 2021 05:30:22 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id cx6sm5656035edb.53.2021.01.22.05.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 05:30:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] configure: Improve TCI feature description
Date: Fri, 22 Jan 2021 14:30:03 +0100
Message-Id: <20210122133004.1913923-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122133004.1913923-1-philmd@redhat.com>
References: <20210122133004.1913923-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Users might want to enable all features, without realizing some
features have negative effect. Mention the TCI feature is slow
and experimental, hoping it will be selected knowingly.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 9f016b06b54..48bd6f48d7a 100755
--- a/configure
+++ b/configure
@@ -1753,7 +1753,7 @@ Advanced options (experts only):
   --with-trace-file=NAME   Full PATH,NAME of file to store traces
                            Default:trace-<pid>
   --disable-slirp          disable SLIRP userspace network connectivity
-  --enable-tcg-interpreter enable TCG with bytecode interpreter (TCI)
+  --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter, experimental and slow)
   --enable-malloc-trim     enable libc malloc_trim() for memory optimization
   --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
-- 
2.26.2


