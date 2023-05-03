Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5BE6F5A7E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 16:57:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puDtj-0006c3-TF; Wed, 03 May 2023 10:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puDth-0006bX-Io
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:56:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puDtg-0003IP-7S
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683125758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nVazCsHbl+fX4YcUePVc417MftlCXmYBv3ljHtr7lSk=;
 b=dLS04lS6O0rQYpkT1BgLfCD6cRoBGxM/KoBdvw8OK0ylFqrtXBDWQEgjeR1FZy4dcJZ7PE
 F7aU1iXFiG235iNF8Uoe/xxnoorfHN+ARy83MWVHcG7s56vGF1kwv7UIE18vsGCAeUZzcL
 NCKayaU+UP1sFUItHvZj/3+NrgjPtsU=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-ybCyeQmwPnWIYSjiGQZdfA-1; Wed, 03 May 2023 10:55:57 -0400
X-MC-Unique: ybCyeQmwPnWIYSjiGQZdfA-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-63b5a2099a6so2935310b3a.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 07:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683125756; x=1685717756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nVazCsHbl+fX4YcUePVc417MftlCXmYBv3ljHtr7lSk=;
 b=PsjjXiIVQtrp052SpS2TpNVxxB+G3AJCPu+K/R/Bf9BcGeqQ/tHoy9xGlptAsWiYT5
 bYQaETWco3HOh3lIBqzK2JMXhDPin8UC7SYqyEBx0c6FzdAfnCf+Uw9GylTNShdMfIte
 zapvfK4c+PNZK8I/scQFkMHhYPg7OhA5r7jKmZehJ9A9gdrOb4SokAHF8haPaLoX0TDw
 A+4SVDnkvu7dKbfciPcZL/YmxpHjSDh62bbk6iuPKBUIzTAGJh3OQVYRVCtq3YveKyCL
 /uikLUrXBb1du2O6P0OnsFCNRdJkypDDUiJr5c/CWZjp0YNCn7ljxY8VCjB3BtOTsxZw
 qPzQ==
X-Gm-Message-State: AC+VfDzI+/KAGeQANiXtWVcmJKXtjzqPKjh4WIyZ86wx8I82Am9iXZO2
 bP6dt0A8EogW0tC5pIUo966+qWg+/Frvl1mk2QpYuKVMCf/eTavma6xpYrs47i3A+hfKsUTMYuV
 1V02iodNH3F88700=
X-Received: by 2002:a05:6a00:c8a:b0:63b:7fc0:a4af with SMTP id
 a10-20020a056a000c8a00b0063b7fc0a4afmr30044679pfv.26.1683125756326; 
 Wed, 03 May 2023 07:55:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ejUnw3eKVu+P8WyjLl/r2Ovh3PNncNGZTkKTkFdWM9WQlex1wkwEWaJMxLz4+7JzgSmRGHQ==
X-Received: by 2002:a05:6a00:c8a:b0:63b:7fc0:a4af with SMTP id
 a10-20020a056a000c8a00b0063b7fc0a4afmr30044656pfv.26.1683125756083; 
 Wed, 03 May 2023 07:55:56 -0700 (PDT)
Received: from localhost.localdomain ([115.96.153.99])
 by smtp.googlemail.com with ESMTPSA id
 p14-20020a62ab0e000000b0063a5837d9e8sm23584061pff.156.2023.05.03.07.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 07:55:55 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: alex.bennee@linaro.org, philmd@linaro.org, thuth@redhat.com,
 wainersm@redhat.com, bleal@redhat.com
Cc: qemu-devel@nongnu.org, Ani Sinha <anisinha@redhat.com>, mst@redhat.com,
 berrange@redhat.com
Subject: [PATCH 0/2] Add mformat and xorriso dependencies in containers
Date: Wed,  3 May 2023 20:25:45 +0530
Message-Id: <20230503145547.202251-1-anisinha@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

mformat and xorriso tools are needed by biosbits avocado tests. This patchset
adds those two tools in the docker container images.
Patch 1 pulls in the latest changes in lcitool in order to add mappings
for these packages in various distros.
Patch 2 updates all Dockerfiles in QEMU repository to add these two
tools.

CC: mst@redhat.com
CC: berrange@redhat.com

Ani Sinha (2):
  tests: libvirt-ci: Update to commit 'c8971e90ac' to pull in mformat
    and xorriso
  tests/lcitool: Add mtools and xorriso as dependency for bios bits
    avocado tests

 .gitlab-ci.d/cirrus/freebsd-13.vars                   | 2 +-
 .gitlab-ci.d/cirrus/macos-12.vars                     | 2 +-
 tests/docker/dockerfiles/alpine.docker                | 2 ++
 tests/docker/dockerfiles/centos8.docker               | 2 ++
 tests/docker/dockerfiles/debian-amd64-cross.docker    | 2 ++
 tests/docker/dockerfiles/debian-amd64.docker          | 2 ++
 tests/docker/dockerfiles/debian-arm64-cross.docker    | 2 ++
 tests/docker/dockerfiles/debian-armel-cross.docker    | 2 ++
 tests/docker/dockerfiles/debian-armhf-cross.docker    | 2 ++
 tests/docker/dockerfiles/debian-mips64el-cross.docker | 2 ++
 tests/docker/dockerfiles/debian-mipsel-cross.docker   | 2 ++
 tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 2 ++
 tests/docker/dockerfiles/debian-s390x-cross.docker    | 2 ++
 tests/docker/dockerfiles/fedora-win32-cross.docker    | 2 ++
 tests/docker/dockerfiles/fedora-win64-cross.docker    | 2 ++
 tests/docker/dockerfiles/fedora.docker                | 2 ++
 tests/docker/dockerfiles/opensuse-leap.docker         | 2 ++
 tests/docker/dockerfiles/ubuntu2004.docker            | 2 ++
 tests/docker/dockerfiles/ubuntu2204.docker            | 2 ++
 tests/lcitool/libvirt-ci                              | 2 +-
 tests/lcitool/projects/qemu.yml                       | 2 ++
 21 files changed, 39 insertions(+), 3 deletions(-)

-- 
2.31.1


