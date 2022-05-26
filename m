Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2026D534EAC
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 13:57:14 +0200 (CEST)
Received: from localhost ([::1]:57700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuC77-0000mr-5H
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 07:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuBKi-0007op-Qh
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:07:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuBKg-0003LX-Vp
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653563230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GTEXt67HrlP5FoMRAfoK2qvwsuOoXy4l8O61XksrrDk=;
 b=Op19yERhmqsIkqn3EJGUxMw9y7TC+OSy5GWfGhl7CobqJ3HVe/XCPuQrVOS/fm+ZLTJNCP
 MC6+I2WYpfuQ3CLWqfsc34DI+97D7NPudLcBSBlK0xvKXtrA6uR/XgbkKMZu9gkd9K6Mmc
 C3q3RL1UV6x2FjVsN0NmSdg6IJvODnQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-4qY5cm05NF6KaGHaPqXVjQ-1; Thu, 26 May 2022 07:07:06 -0400
X-MC-Unique: 4qY5cm05NF6KaGHaPqXVjQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AC421C068CF;
 Thu, 26 May 2022 11:07:06 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50A631731B;
 Thu, 26 May 2022 11:07:06 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/5] gitlab: restrict running jobs in forks and upstream master
Date: Thu, 26 May 2022 07:07:00 -0400
Message-Id: <20220526110705.59952-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

Currently on upstream most jobs will run in both staging
and master. This is quite wasteful of CI credits. The only
need to run in master is for the jobs related to publishing
the website

In forks we run jobs on every push. With restricted CI
allowance this is quickly going to cause  problems.

With this series jobs will no longer run on forks at all,
without an opt-in with QEMU_CI=1 (pipeline with manual
jobs) or QEMU_CI=2 (pipeline with immediate jobs)

This is a rewrite of a previous proposal:

https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg02104.html

where I've kept it simpler and also split up the patches
into more understandable chunks

Daniel P. Berrangé (5):
  gitlab: introduce a common base job template
  gitlab: convert Cirrus jobs to .base_job_template
  gitlab: convert static checks to .base_job_template
  gitlab: convert build/container jobs to .base_job_template
  gitlab: don't run CI jobs in forks by default

 .gitlab-ci.d/base.yml                | 72 +++++++++++++++++++++++
 .gitlab-ci.d/buildtest-template.yml  | 16 ++---
 .gitlab-ci.d/buildtest.yml           | 28 ++++-----
 .gitlab-ci.d/cirrus.yml              | 16 ++---
 .gitlab-ci.d/container-cross.yml     |  6 +-
 .gitlab-ci.d/container-template.yml  |  1 +
 .gitlab-ci.d/crossbuild-template.yml |  3 +
 .gitlab-ci.d/qemu-project.yml        |  1 +
 .gitlab-ci.d/static_checks.yml       | 19 +++---
 .gitlab-ci.d/windows.yml             |  1 +
 docs/devel/ci-jobs.rst.inc           | 88 +++++++++++++++++++++++++++-
 11 files changed, 199 insertions(+), 52 deletions(-)
 create mode 100644 .gitlab-ci.d/base.yml

-- 
2.36.1


