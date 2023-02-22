Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F9269F6C4
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:39:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqGI-0004LT-QP; Wed, 22 Feb 2023 09:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqG4-0004Iq-At
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqG2-0001Fi-U4
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677076689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4T1EZdwlkFU19mhmamoCuqBhLorkYo5RbcMXE4vqj9I=;
 b=BhIZxhDGg9uw+kvbKfSxsYYZSIHMcVBlVxkxOxymbPbaU6Wn8al1es/iI9CntvAaxjhL0u
 D8ujqhWXDJcgTHu7UO4qgW3m3STseDFguNMZ/8KSn3KREVEjwSTI+9HUQFj/5wIV7IBxFo
 pQAjs7+TRdcFH3GZLp8/bzzyDIGu5+w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-170--_hCR5LdMkSAyKTcefdlMA-1; Wed, 22 Feb 2023 09:38:07 -0500
X-MC-Unique: -_hCR5LdMkSAyKTcefdlMA-1
Received: by mail-ed1-f71.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso10941726edb.4
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 06:38:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4T1EZdwlkFU19mhmamoCuqBhLorkYo5RbcMXE4vqj9I=;
 b=VolQiUExM8J7W0B9sNX7TtSGbaulS4L57qRZ2uzETnRAQ4NHiBEkvOmHVTnpAqCguu
 Qc/b0n0FpqyCGrl0XhTY5dcOSJqTVts+ZVNFjsPk5G7ECLn1gJfBG/FjHFxhm26NOf8R
 zmyS2e6ELCWFwyZ2YBFsEOefbi0Kxt9IHwBtUfs8Q9xqD9izjzobB49xwe8g3dMn71TE
 bP8KXjZqqg/OQasVluTjO+2VFjKcxoR53qLQuwvM6wNOmPx2v7Zd1cV5/FtK4DWrwzrm
 FD9zlVbylwL2oB5LgR0l9/vXZBUwy6yOHWPKMajHwdt8h6NtwOHZt/ldZn9mKUkSKa7z
 TzIQ==
X-Gm-Message-State: AO0yUKX9M7GOXd5/Il4p5S9zcPOWZH7urrpsZlMh18mYTLcJU+eQbFXs
 0Y/Muw+HeI/3FBhooHcNU7B54fdQPCXKLA9wUPJu9qDU+qyYapYoWR/rp1D4v0eIr8luv9xggjC
 5ilRFG/kVystGZemnFQMX1176b6NxuivwSRutlpplyeosaR6jRBKFZ7lSGgFkNXhbmOOGAu3t
X-Received: by 2002:a17:906:8419:b0:88a:1ea9:a5ea with SMTP id
 n25-20020a170906841900b0088a1ea9a5eamr13274212ejx.65.1677076685530; 
 Wed, 22 Feb 2023 06:38:05 -0800 (PST)
X-Google-Smtp-Source: AK7set/XFO1M2+MCEe6nlVrrHq8EjJlEqN9onBOwsFttLGkT6KhopgoPkELuesn/aUvNyYQZQNvkqw==
X-Received: by 2002:a17:906:8419:b0:88a:1ea9:a5ea with SMTP id
 n25-20020a170906841900b0088a1ea9a5eamr13274190ejx.65.1677076685188; 
 Wed, 22 Feb 2023 06:38:05 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 br4-20020a170906d14400b008de729c8a03sm2279969ejb.38.2023.02.22.06.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 06:38:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com, berrange@redhat.com
Subject: [PATCH 03/10] meson: prefer 'sphinx-build' to 'sphinx-build-3'
Date: Wed, 22 Feb 2023 15:37:45 +0100
Message-Id: <20230222143752.466090-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230222143752.466090-1-pbonzini@redhat.com>
References: <20230222143752.466090-1-pbonzini@redhat.com>
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

From: John Snow <jsnow@redhat.com>

Once upon a time, "sphinx-build" on certain RPM platforms invoked
specifically a Python 2.x version, while "sphinx-build-3" was a distro
shim for the Python 3.x version.

These days, none of our supported platforms utilize a 2.x version, so it
should be safe to search for 'sphinx-build' prior to 'sphinx-build-3',
which will prefer pip/venv installed versions of sphinx if they're
available.

This adds an extremely convenient ability to test document building
ability in QEMU across multiple versions of Sphinx for the purposes of
compatibility testing.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20230221012456.2607692-6-jsnow@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/meson.build b/docs/meson.build
index 9136fed3b730..906034f9a87f 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -1,5 +1,5 @@
 if get_option('sphinx_build') == ''
-  sphinx_build = find_program(['sphinx-build-3', 'sphinx-build'],
+  sphinx_build = find_program(['sphinx-build', 'sphinx-build-3'],
                               required: get_option('docs'))
 else
   sphinx_build = find_program(get_option('sphinx_build'),
-- 
2.39.1


