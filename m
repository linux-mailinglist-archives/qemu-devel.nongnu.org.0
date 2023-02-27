Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5096A48B1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:56:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhj7-0003aw-BT; Mon, 27 Feb 2023 12:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhj5-0003ZH-9e
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhj3-0004O2-BW
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677520548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SipqoaACuP7UKZmQKI2ZjcrjqP6v8h7Ktdgvp06LeSg=;
 b=fauh0+Qzc8dgFYgszLHMY62UG5j8YG6pymoVbqYr/yW0g8EUFDUVjLNBXOa+3cY1rEf3mX
 rTwSR+99dW7bpVoD8qvUYJk/LaeqEIapmJCdC4dd1g5ZCMoZsH8JhLzd+nzY44TAaRs6zg
 vPBOu10p486awrjdjqneYxFcnqzo0m0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-672-BdmZi0kSOE-Xy_kL1BEkGg-1; Mon, 27 Feb 2023 12:55:47 -0500
X-MC-Unique: BdmZi0kSOE-Xy_kL1BEkGg-1
Received: by mail-ed1-f71.google.com with SMTP id
 cz22-20020a0564021cb600b004a245f58006so9866061edb.12
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 09:55:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SipqoaACuP7UKZmQKI2ZjcrjqP6v8h7Ktdgvp06LeSg=;
 b=CR6nlBPVgok9v5SynvGHcNSdReHybB8qwyy4Mjssip8Gbl/IVFqxwHepBNRt6GqVeB
 QQi8nqMdDqfcub4h0aS7VC1MK09HuR29NcuxrZy0dn1K3zRuFkJrQJViJE6AjRbZGWhU
 PbRtO8gGOEpQ2tSff0J9uQYIaC26AkEGXLtWxB5jwe62rE+VcXEHvorqJzZOPCs1E2vp
 h4jzcLGGecabfMrVJd6CU394xLd3Y0ena/+lYsisjAOlMNPTIaDvoqdA0i+z+8sN3txZ
 tL5NW0h44c6WProPH02u5/g4Thx/ocfML+GiMNPsG1X1CVv718yb12LR+hvO6y7VYQP8
 kB8g==
X-Gm-Message-State: AO0yUKWxnpx9oV3vNYJ2z4iEC5m+qTxOOpvyNxwCJLCe8oxQfuI2M3OF
 xiyEppi9EyeCc18MVyaWMQio/nZE9YDqzHjs76Lg9YSs6biiYeSOpf+jMByplrVY3JQmoMJq7uS
 m9xqOdhKlDxP9MPURFIw+3+PJICgJgkWXo/eWPFUmA/+ZtnI80Sb29BM24FK+Q0TWCAFcK9As
X-Received: by 2002:aa7:d1c6:0:b0:4ab:4676:f92f with SMTP id
 g6-20020aa7d1c6000000b004ab4676f92fmr279345edp.37.1677520545978; 
 Mon, 27 Feb 2023 09:55:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+KQwoGL1kYC6U+uiaJCXzWNGPQ05Q0+lmp6pjfc8uMspO1cILKht7Mk24qGy5u+jbEQ3Zzsw==
X-Received: by 2002:aa7:d1c6:0:b0:4ab:4676:f92f with SMTP id
 g6-20020aa7d1c6000000b004ab4676f92fmr279329edp.37.1677520545666; 
 Mon, 27 Feb 2023 09:55:45 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170906824300b008b17eb06282sm3467424ejx.213.2023.02.27.09.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:55:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 07/13] docs/devel: update and clarify lcitool instructions
Date: Mon, 27 Feb 2023 18:55:18 +0100
Message-Id: <20230227175524.710880-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227175524.710880-1-pbonzini@redhat.com>
References: <20230227175524.710880-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Shorten a bit the description of what libvirt-ci does, the name of the
data files is not relevant at that point.  However, the procedures to add
new build prerequisites are lacking some information, particularly with
respect to regenerating the output test files for lcitool's unit tests.
While at it, also update the paths in the libvirt-ci repository.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/testing.rst | 70 +++++++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 31 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index e10c47b5a7ca..11c651ca0878 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -429,49 +429,55 @@ using the ``lcitool`` program provided by the ``libvirt-ci`` project:
 
   https://gitlab.com/libvirt/libvirt-ci
 
-In that project, there is a ``mappings.yml`` file defining the distro native
-package names for a wide variety of third party projects. This is processed
-in combination with a project defined list of build pre-requisites to determine
-the list of native packages to install on each distribution. This can be used
-to generate dockerfiles, VM package lists and Cirrus CI variables needed to
-setup build environments across OS distributions with a consistent set of
-packages present.
-
-When preparing a patch series that adds a new build pre-requisite to QEMU,
-updates to various lcitool data files may be required.
+``libvirt-ci`` contains an ``lcitool`` program as well as a list of
+mappings to distribution package names for a wide variety of third
+party projects.  ``lcitool`` applies the mappings to a list of build
+pre-requisites in ``tests/lcitool/projects/qemu.yml``, determines the
+list of native packages to install on each distribution, and uses them
+to generate build environments (dockerfiles and Cirrus CI variable files)
+that are consistent across OS distribution.
 
 
 Adding new build pre-requisites
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
+When preparing a patch series that adds a new build
+pre-requisite to QEMU, the prerequisites should to be added to
+``tests/lcitool/projects/qemu.yml`` in order to make the dependency
+available in the CI build environments.
+
 In the simple case where the pre-requisite is already known to ``libvirt-ci``
-the following steps are needed
+the following steps are needed:
 
  * Edit ``tests/lcitool/projects/qemu.yml`` and add the pre-requisite
 
  * Run ``make lcitool-refresh`` to re-generate all relevant build environment
    manifests
 
-In some cases ``libvirt-ci`` will not know about the build pre-requisite and
-thus some extra preparation steps will be required first
+It may be that ``libvirt-ci`` does not know about the new pre-requisite.
+If that is the case, some extra preparation steps will be required
+first to contribute the mapping to the ``libvirt-ci`` project:
 
  * Fork the ``libvirt-ci`` project on gitlab
 
- * Edit the ``mappings.yml`` change to add an entry for the new build
-   prerequisite, listing its native package name on as many OS distros
-   as practical.
+ * Add an entry for the new build prerequisite to
+   ``lcitool/facts/mappings.yml``, listing its native package name on as
+   many OS distros as practical.  Run ``python -m pytest --regenerate-output``
+   and check that the changes are correct.
 
- * Commit the ``mappings.yml`` change and submit a merge request to
-   the ``libvirt-ci`` project, noting in the description that this
-   is a new build pre-requisite desired for use with QEMU
+ * Commit the ``mappings.yml`` change together with the regenerated test
+   files, and submit a merge request to the ``libvirt-ci`` project.
+   Please note in the description that this is a new build pre-requisite
+   desired for use with QEMU.
 
  * CI pipeline will run to validate that the changes to ``mappings.yml``
    are correct, by attempting to install the newly listed package on
    all OS distributions supported by ``libvirt-ci``.
 
  * Once the merge request is accepted, go back to QEMU and update
-   the ``libvirt-ci`` submodule to point to a commit that contains
-   the ``mappings.yml`` update.
+   the ``tests/lcitool/libvirt-ci`` submodule to point to a commit that
+   contains the ``mappings.yml`` update.  Then add the prerequisite and
+   run ``make lcitool-refresh``.
 
 
 Adding new OS distros
@@ -498,18 +504,20 @@ Assuming there is agreement to add a new OS distro then
 
  * Fork the ``libvirt-ci`` project on gitlab
 
- * Add metadata under ``guests/lcitool/lcitool/ansible/group_vars/``
-   for the new OS distro. There might be code changes required if
-   the OS distro uses a package format not currently known. The
-   ``libvirt-ci`` maintainers can advise on this when the issue
-   is file.
+ * Add metadata under ``lcitool/facts/targets/`` for the new OS
+   distro. There might be code changes required if the OS distro
+   uses a package format not currently known. The ``libvirt-ci``
+   maintainers can advise on this when the issue is filed.
 
- * Edit the ``mappings.yml`` change to update all the existing package
-   entries, providing details of the new OS distro
+ * Edit the ``lcitool/facts/mappings.yml`` change to add entries for
+   the new OS, listing the native package names for as many packages
+   as practical.  Run ``python -m pytest --regenerate-output`` and
+   check that the changes are correct.
 
- * Commit the ``mappings.yml`` change and submit a merge request to
-   the ``libvirt-ci`` project, noting in the description that this
-   is a new build pre-requisite desired for use with QEMU
+ * Commit the changes to ``lcitool/facts`` and the regenerated test
+   files, and submit a merge request to the ``libvirt-ci`` project.
+   Please note in the description that this is a new build pre-requisite
+   desired for use with QEMU
 
  * CI pipeline will run to validate that the changes to ``mappings.yml``
    are correct, by attempting to install the newly listed package on
-- 
2.39.1


