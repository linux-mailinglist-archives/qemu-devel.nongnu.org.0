Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117E26B1EB2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:51:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBzW-0007pm-AW; Thu, 09 Mar 2023 03:51:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1paBzU-0007ou-Bi
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:51:12 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1paBzR-00024B-Js
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:51:12 -0500
Received: by mail-pl1-x62a.google.com with SMTP id n6so1262939plf.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678351867;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YtzXHGHMS64VogkrKd3Ei8P73aUrg9lW5cX1ATCVQYo=;
 b=eFOuzm8nD7a5HidSqF7eFTA1nvdUol1ji6xW6YQNmLzmVO7oLym7uEt/O8FALVrsrj
 FzGlJjpPSszYsxPfAC8PXdystVBhFyStdRVTiCArCS3CggGUweI2tlTOyMSQBYSRkcbw
 +UaYc1kRN5AU+H4rRcqssppbBmAOojcXwUJK1m7XOCCn2gW5xHw/gDnmt++tkFC1J7jg
 GKzpm1mPVnLWFhiknRcHxUlu3OUW1UPkZbfCAPQ+jQnUaW7AGcWGZ5399JShxvbT0AEf
 dvU+zvi5rRSvbOIkxyV+9cGwEskJG8HmsyNDAxavhak1+JB/Oq2eNJMI9On6emuN25mK
 fc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351867;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YtzXHGHMS64VogkrKd3Ei8P73aUrg9lW5cX1ATCVQYo=;
 b=v1zr87yIOnWf18wPl1scW6vPhMzc/ZZroWc0DDerCuJuJJuBOPkLpoMKw4MWhTIFyh
 q+c3FEhZ/giVMSUQTmshsdsH/guOy7tW3R2nHLgWKkN7tHyYInB4d4LfPNDELJ7ANYom
 i8D19UGie9rjoqVhj13z7qpvBxgIZtNsTsskkO/I7YKYmkJV6uJO7ssyxKOxClX1SimS
 COMFAvaxvqMS/26NHeGGN2CwN85zskwXwhzBcLz4ceE4wIBj/dBiaSkgoIHFgENcHAZh
 8x79iLWPpds3lHw73hnk3Hz92G3B2M2XdH9q1FglKryMrQWLXRgEIhzOKVTDl1rTXtTy
 u4XA==
X-Gm-Message-State: AO0yUKWMV3/7m3ouYkOUXB+hYZ2hjN5Rbz6T4jQ9Ir9jNqGZZo8QWfY2
 LwWE2tIBktjyrvIm60Ko2eK6nss/hArJp60dAKU=
X-Google-Smtp-Source: AK7set82c8nTI8LDr+yjMnggASdbq6ivX+wK6RPkhvCxpvT+V+TAj3Gj4shp7wy6TtmXW50qCtK/Eg==
X-Received: by 2002:a17:90b:4a4c:b0:237:9cc7:28a4 with SMTP id
 lb12-20020a17090b4a4c00b002379cc728a4mr22372080pjb.14.1678351867185; 
 Thu, 09 Mar 2023 00:51:07 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 nu14-20020a17090b1b0e00b002339195a47bsm1067154pjb.53.2023.03.09.00.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:51:06 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH V3 0/2] qemu: vhost-user: Support Xen memory mapping quirks
Date: Thu,  9 Mar 2023 14:20:59 +0530
Message-Id: <cover.1678351495.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hello,

This patchset tries to update the vhost-user protocol to make it support special
memory mapping required in case of Xen hypervisor.

The first patch is mostly cleanup and second one introduces a new xen specific
feature.

V2->V3:
- Remove the extra message and instead update the memory regions to carry
  additional data.

- Drop the one region one mmap relationship and allow back-end to map only parts
  of a region at once, required for Xen grant mappings.

- Additional cleanup patch 1/2.

V1->V2:
- Make the custom mmap feature Xen specific, instead of being generic.
- Clearly define which memory regions are impacted by this change.
- Allow VHOST_USER_SET_XEN_MMAP to be called multiple times.
- Additional Bit(2) property in flags.

Viresh Kumar (2):
  docs: vhost-user: Define memory region separately
  docs: vhost-user: Add Xen specific memory mapping support

 docs/interop/vhost-user.rst | 60 ++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 21 deletions(-)

-- 
2.31.1.272.g89b43f80a514


