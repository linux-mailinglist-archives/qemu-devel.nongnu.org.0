Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47093673DC2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:43:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIX37-0008Or-2f; Thu, 19 Jan 2023 10:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pIX34-0008Np-Kl
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:41:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pIX32-0005qb-C2
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:41:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674142911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=coiTVVTMCmH8A2bwpq1WF29ZCNEk5+/YZV9DkexX4yw=;
 b=Ra0QTyOdwPaBImtZXJIwHaIfIdSz6lISZKRGl75cbXQHj/JG2CWsKX8T21BvxNt8FwlmUS
 qVD/pF9JjsnhfhY/YpEpK/uQRYJWuVm1hNWrbJgpPfVht38GHV12dNBtp3cQlCty1pWns7
 gINcx6wbdQsABgVINbcoehTAeb/chF0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-7d4Go1pnNOiAdIEH-fi9Qw-1; Thu, 19 Jan 2023 10:41:49 -0500
X-MC-Unique: 7d4Go1pnNOiAdIEH-fi9Qw-1
Received: by mail-ed1-f69.google.com with SMTP id
 y21-20020a056402359500b0049e171c4ad0so1868599edc.6
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 07:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=coiTVVTMCmH8A2bwpq1WF29ZCNEk5+/YZV9DkexX4yw=;
 b=XOcqRNNWtWoA6E66TfsZ21sUmEpdk5FpMTbt1ARpvA8LgofTRmXi+8BnOE2Jzln/+5
 fF7gW1PNF/wzNqscFhpa2GFoB3XEhWe3kDkjFI1PTU00UUS9zBmmsOKCXQw54VVmHFQq
 lMD4zb4kXt9fOsX9eQSpt7a/Iuh1R4nxTk3AojpooV48+/SvmEps9WIjLOPuO1c5kVHJ
 hc1xnH9L+5lTSbRomCx+LICiTyO8gb1I6WpgzvcmbWnMWvHNo7hf/vADFI1xHHGnDoLJ
 fKATrUa61CHwY618uruTNEHZVU22mvWy2hgYP7c8PkDM6unvtuRZO9lbpwxCgyxX01ON
 7O3Q==
X-Gm-Message-State: AFqh2krIdYDy1wpJOqLnjb+Gs9MnwInoPlbW2XMDkSVk1QQ3wAXK4bzW
 Y2DLNKamNMuu3ZqtQ64I2aRTF/5w+qFbXuXYcXa0Qb7ThResSaVBbltgTqE0uJMxoFdNkofKq55
 vGPGOOiAWXAlGTetaAPBcuRjldzpyBU3cGDy13bDE8FciNqJTFZhyoDU3DoUyGSMyTMk=
X-Received: by 2002:a17:906:608d:b0:872:a2ee:271d with SMTP id
 t13-20020a170906608d00b00872a2ee271dmr10427896ejj.53.1674142908182; 
 Thu, 19 Jan 2023 07:41:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXunPjMH+KJID2/L4wXCArEcOxTUdW+RzVgfaYJ3maUFr0xa9mxY39Q+bwwsjhxB5w4Me9qVEA==
X-Received: by 2002:a17:906:608d:b0:872:a2ee:271d with SMTP id
 t13-20020a170906608d00b00872a2ee271dmr10427874ejj.53.1674142907907; 
 Thu, 19 Jan 2023 07:41:47 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a170906869500b0084d36fd208esm15581572ejx.18.2023.01.19.07.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 07:41:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: crosa@redhat.com
Subject: [PATCH 0/5] scripts/ci: update build environment playbooks
Date: Thu, 19 Jan 2023 16:41:40 +0100
Message-Id: <20230119154145.471156-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This series cleans up and updates the Ansible playbooks in scripts/ci,
with the aim of enabling Python 3.8 in the custom CentOS runner.
This is the first step towards bumping the minimum required version
of Python past 3.6, because the custom runner has to be updated manually
by Cleber unlike the containers in tests/docker/dockerfiles.

The patches comprise other changes than just updating Python 3.8:
- small cleanups (patch 1)
- support CentOS Stream 8 (patch 2)
- make the playbook actually work (patch 3)
- do not force me to test two different sets of packages :) (patch 4)

Paolo Bonzini (5):
  scripts/ci: remove unnecessary checks from CentOS playbook
  scripts/ci: support CentOS Stream 8 in build-environment.yaml
  scripts/ci: add capstone development packages
  scripts/ci: unify package lists for CentOS in build-environment files
  scripts/ci: bump CentOS Python to 3.8

 .../org.centos/stream/8/build-environment.yml | 38 ++++++++++--
 .../ci/org.centos/stream/8/x86_64/configure   |  1 +
 scripts/ci/setup/build-environment.yml        | 59 +++++++++++++++++--
 3 files changed, 90 insertions(+), 8 deletions(-)

-- 
2.38.1


