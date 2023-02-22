Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D4B69F6C7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:40:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqGO-0004hj-El; Wed, 22 Feb 2023 09:38:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqGF-0004NN-PT
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqGD-0001Ha-TT
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677076701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GdgRe/0ubTalQGk7MlsIYFdtsI9zXNirHCIKNY7pxIo=;
 b=Kncx7m/n62Ze7WLnxWG/tj09AHyruU/vR3sWBiFSx+VzBLjtqw3MO4E5rT/3Hgqb7dt94d
 dGFc46a7fUC8KHT5xuO1WhLbRiQqXgvYOcoc1Q3KOKhqCQKub+mo7InVR4yRdEAuH5P9uk
 HTaWsv6rRoDf1grz3hLM/az56VehKRw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-261-79FjzuyoOwmVIhBiI9a1qA-1; Wed, 22 Feb 2023 09:38:20 -0500
X-MC-Unique: 79FjzuyoOwmVIhBiI9a1qA-1
Received: by mail-ed1-f70.google.com with SMTP id
 dm14-20020a05640222ce00b0046790cd9082so11477856edb.21
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 06:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GdgRe/0ubTalQGk7MlsIYFdtsI9zXNirHCIKNY7pxIo=;
 b=EPhasTbJ7dx2lXho1ogORtqAvxU4iG3bm4M/Ek9WXNqPJbT0i2jp+CXev+4ogRO3bX
 55v4feBCEqtKxtQcPK4I07AreuO4CWlB7kEDsa2uebYpY0s3Egpe8opgRS6RgV1/OwPy
 Yoa1aZEUMOY9bTm6w8V3RjLdiC3s/wcc5ElPmYFsowDdOxIT6twMxMEoozZzFx6DQe+k
 tgaBmXW1DFjrpoziD2HJK+O2V4BfopjXTQr0vWMo+NlB7mgpt6VxJX3x2kG4xYWknVkl
 p/1xheYoDg4IBaKssaTQYm9AIYY1mZAHYAGQK2Dqu6FZV8ISA7ugfDdkTr1V13aNuPWR
 dSwQ==
X-Gm-Message-State: AO0yUKXkvr+LtALiOmJdlYPvSFodq8nRbXDyp/InweyKfci/ah22lBWp
 XNl1DroNwsX4a4OK+/qGpEN9I6SEPzTUkCuhY0N++2e9XjuNwnhAJQztjwOIX9xron6kB/jlyDG
 TrftwBj2aC+YcToP8ucq4WV1BFnm6ilAwD8Ab4qyVEwH9kibY/SQqhBOYqmGFa9P4+IrBEKwc
X-Received: by 2002:a05:6402:4d4:b0:4ac:c9ea:17b4 with SMTP id
 n20-20020a05640204d400b004acc9ea17b4mr7474533edw.41.1677076698195; 
 Wed, 22 Feb 2023 06:38:18 -0800 (PST)
X-Google-Smtp-Source: AK7set83bX57S86nMWAAAYGQ9+sw3mHEUPAxqdOx/VjFdxPt5xqLM/YdIgsb8yqSTcTMd2B+818GNA==
X-Received: by 2002:a05:6402:4d4:b0:4ac:c9ea:17b4 with SMTP id
 n20-20020a05640204d400b004acc9ea17b4mr7474509edw.41.1677076697895; 
 Wed, 22 Feb 2023 06:38:17 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 c23-20020a50f617000000b004acde0a1ae5sm3592407edn.89.2023.02.22.06.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 06:38:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com, berrange@redhat.com
Subject: [PATCH 07/10] docs/devel: update and clarify lcitool instructions
Date: Wed, 22 Feb 2023 15:37:49 +0100
Message-Id: <20230222143752.466090-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230222143752.466090-1-pbonzini@redhat.com>
References: <20230222143752.466090-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/testing.rst | 72 ++++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 31 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index e10c47b5a7ca..648b7aa09137 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -429,49 +429,57 @@ using the ``lcitool`` program provided by the ``libvirt-ci`` project:
 
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
+In some cases ``libvirt-ci`` will not know about the build
+pre-requisite and thus some extra preparation steps will be required
+first.  Even though you can add the mappings for testing purposes to
+``tests/lcitool/mappings.yml`` in the QEMU repository, please contribute
+the mapping to the ``libvirt-ci`` project as well:
 
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
+   desired for use with QEMU
 
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
@@ -498,18 +506,20 @@ Assuming there is agreement to add a new OS distro then
 
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


