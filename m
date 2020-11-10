Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1615D2ADB6F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:18:41 +0100 (CET)
Received: from localhost ([::1]:55458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWLw-0007Qj-4y
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW7E-0000gm-T4
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:03:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6z-0003p2-TI
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSEA911pFqughuXwSFMV3cA9o56N7U4FvX3DSTDYzS4=;
 b=BMmV1b+Xi1IGccBur5jktbX9qMlDTqnSMPvAf/qGCn69MB7g1Ugnh0+f9GVIYIwxBuzwO6
 cOVYnjfMWvfCP+v+wJ19SHe1e09SDjc6qrIkWQw16c111ohBcVHpQORrCkfP7gRXud197c
 b5xkcT49WRy+1poCbY62sHssmZQAZc4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-jRx8HAlmNKaLPO9S1yCEkA-1; Tue, 10 Nov 2020 11:03:09 -0500
X-MC-Unique: jRx8HAlmNKaLPO9S1yCEkA-1
Received: by mail-wr1-f70.google.com with SMTP id b6so5837761wrn.17
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:03:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WSEA911pFqughuXwSFMV3cA9o56N7U4FvX3DSTDYzS4=;
 b=box4oSxptamHEkggSSI0Ol/7LOpRaymFzxlYOR0XgAKgOLhrtIuinI7ekYwJ4L0cyB
 4iRe+kKpHG+wzHmSfF/8JSe28m90HS1E7XZlLcZe++hutktGZ3wEKMNUzEP0UrBwh7nZ
 wsDELYrYvItHG13gOpQYZUspRaud0FZ+CqwHcdazkTLEXc7xnUglqEmNnLeboyqlSsoc
 TpaFlHQ+mdQYELAcO5J60d32ovF0Em35UrM+SWbE8lv/HW91pXP+aj9uW6nJoe2RP6qi
 vc4UAAfqJLmh3e8BmBQU6s9a20PlJ7eWgXdLwEFpBzEpThzMCH4IE9x+KDE8tSLYOhjK
 yLvw==
X-Gm-Message-State: AOAM531kAnEIO8n5rFXdh83ApvGzuHAyxtzwD/VAZg3S6kDxYANk/C4I
 RhK2a7g1Azt0TOSKdsZ2ogiRzacX0KNxAAiEptM0bjRy+Cv4aT5ieVYBFriLfDA8r3bdINqqKGh
 2Hx6QHzZlBV0BUVZmvyCGJbUEg5Kvy90aiiIRUhYZP3PsfKb+7LWi/ld7ixfNcMRO
X-Received: by 2002:a5d:4f0f:: with SMTP id c15mr9957231wru.287.1605024187456; 
 Tue, 10 Nov 2020 08:03:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCfhGrL2ZB27l/RxLuhGluNRLySCIoD9cPmEfmkOIneFFhHTTqrTLFoXV3zCmck7mu3kvvVw==
X-Received: by 2002:a5d:4f0f:: with SMTP id c15mr9957200wru.287.1605024187287; 
 Tue, 10 Nov 2020 08:03:07 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id b14sm17547019wrq.47.2020.11.10.08.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:03:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 16/16] gitlab-ci: Do not automatically run integration
 tests for push events
Date: Tue, 10 Nov 2020 17:01:40 +0100
Message-Id: <20201110160140.2859904-17-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110160140.2859904-1-philmd@redhat.com>
References: <20201110160140.2859904-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Bin Meng <bin.meng@windriver.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 virt-ci-maint-team@redhat.com, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tests run by 'make check-acceptance' are sometime flaky,
making maintainers reluctant to use GitLab. Disable them for
now. We might re-enable some gradually, or let each maintainer
enable a set of interest.

Keep automatically running the integration tests for the various
GitLab events, except when we push to a repository.

Per the $CI_PIPELINE_SOURCE entry in [*] the possible events are:

 - push
 - web
 - schedule
 - api
 - external
 - chat
 - webide
 - merge_request_event
 - external_pull_request_event
 - parent_pipeline
 - trigger
 - cross_project_pipeline

[*] https://docs.gitlab.com/ee/ci/variables/predefined_variables.html

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6cf4c19c604..c57e0fa1ab9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -80,6 +80,10 @@ include:
     - cd build
     - python3 -c 'import json; r = json.load(open("tests/results/latest/results.json")); [print(t["logfile"]) for t in r["tests"] if t["status"] not in ("PASS", "SKIP", "CANCEL")]' | xargs cat
     - du -chs ${CI_PROJECT_DIR}/avocado-cache
+  rules: # Do not automatically run integration tests for push events
+  - if: '$CI_PIPELINE_SOURCE == "push"'
+    when: manual
+    allow_failure: true
 
 build-system-ubuntu:
   extends: .native_build_job
-- 
2.26.2


