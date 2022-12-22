Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961F3653CD9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 09:17:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8Gks-0005Wc-2a; Thu, 22 Dec 2022 03:16:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8Gkm-0005W3-MS
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:16:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8Gkl-0006r8-05
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671696994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5nnn8a2ryahylQYbsxeQGFRtd9mD5dCQYBv3cjQ6hcc=;
 b=IRYl2S781yuO4UpQ3nWOlgzVU3bLq049Mndj6LiRio49fMs5zWQVwLzJTA26eS9WkyaxH4
 0ZMWEpP0yB5gij4OZJIbau5tHy8Bddzs9lJOppEKflHMdQUO1SVszsfTdayTSXBe+K+aPG
 fuBF4+7ZnaOcd7Avtdv0oGqr12yQcl0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-235-bxlFo9GqOI6nUXubW50oeQ-1; Thu, 22 Dec 2022 03:16:32 -0500
X-MC-Unique: bxlFo9GqOI6nUXubW50oeQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 hq42-20020a1709073f2a00b007c100387d64so958979ejc.3
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 00:16:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5nnn8a2ryahylQYbsxeQGFRtd9mD5dCQYBv3cjQ6hcc=;
 b=tZT1JV/L73j+LtxEwYDwx8w+VEImYMRXGeA+WAb50ZMg4Fb3tzg4oXGpLiY+ATTYxg
 cSC+ml7SB3zB088OkWxrEstuubCztW04PNJwPeQHJzTFTnaRjs5LQHRDZ+Jm1NlWpkdW
 2oD4PTnNvI2K7mwPT6/Uo69pJ5/q6uuBoNrQhwljGd/It/ti++IY3S3uVIcSsfwhQG3z
 2rY/rsjSOYbLbkq2mLXV60eJn8oMB5xQsLO6RzVYjIR5rJQ+Ux6smKLTiaAWsqQKmzFJ
 auxq1KK8hCV3wNcp6pxw5rxlJks3rvST6MJJvdgaVpXz2OjFK4F3KYUwoRhjavkFy+Zt
 PSCA==
X-Gm-Message-State: AFqh2kr7jzLojMTA7zUV6aprx6z2v6I8zWLlMjCtk+TfHmqI4otS+9sH
 e5F+LY9gYBiveZXKfp4dtr9OeCou3Rg5UkYF6DHu6ZjSSXUKIzG4D3gbCBf6/TT1wuKefbFRVqB
 Yg/p4dvw3dZlQW4s=
X-Received: by 2002:a17:907:3e26:b0:7ad:c8d7:4fd9 with SMTP id
 hp38-20020a1709073e2600b007adc8d74fd9mr5430232ejc.36.1671696991422; 
 Thu, 22 Dec 2022 00:16:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtRkxC4N+xhLGRLQAsAEsVqfZnoEsCbQ10HqrG5H2ATZ91OqLjKF/ZctByL68uEo4Vzal3KCQ==
X-Received: by 2002:a17:907:3e26:b0:7ad:c8d7:4fd9 with SMTP id
 hp38-20020a1709073e2600b007adc8d74fd9mr5430214ejc.36.1671696991171; 
 Thu, 22 Dec 2022 00:16:31 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 j9-20020a1709066dc900b007ad84cf1346sm8027309ejt.110.2022.12.22.00.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 00:16:30 -0800 (PST)
Message-ID: <2196cf80-5f59-37a5-1efe-7e4ff9767109@redhat.com>
Date: Thu, 22 Dec 2022 09:16:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 02/10] libvhost-user: Replace typeof with __typeof__
Content-Language: en-US
To: Marcel Holtmann <marcel@holtmann.org>, qemu-devel@nongnu.org,
 mst@redhat.com, xieyongji@bytedance.com
References: <cover.1671628158.git.marcel@holtmann.org>
 <79297841f1aad83d85297afef99369004d9d19a4.1671628158.git.marcel@holtmann.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <79297841f1aad83d85297afef99369004d9d19a4.1671628158.git.marcel@holtmann.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/21/22 14:10, Marcel Holtmann wrote:
> Strictly speaking only -std=gnu99 support the usage of typeof and for
> easier inclusion in external projects, it is better to use __typeof__.
> 
>    CC       libvhost-user.o
> libvhost-user.c: In function ‘vu_log_queue_fill’:
> libvhost-user.c:86:13: error: implicit declaration of function ‘typeof’ [-Werror=implicit-function-declaration]
>     86 |             typeof(x) _min1 = (x);              \
>        |             ^~~~~~
> 
> Changing these two users of typeof makes the compiler happy and no extra
> flags or pragmas need to be provided.
> 
> Signed-off-by: Marcel Holtmann<marcel@holtmann.org>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@linaro.org>

The build system uses "c_std=gnu99".  If you are extracting 
libvhost-user and not using its build files, you need to add --std=gnu99 
yourself when compiling.

If you really don't want to do that, as long as it's just a couple 
underscores that's fine I guess, but mixed declarations and code are 
going to reappear sooner or later.  Please add a patch like this:

diff --git a/subprojects/libvhost-user/meson.build 
b/subprojects/libvhost-user/meson.build
index 39825d9404ae..5deecbfe377d 100644
--- a/subprojects/libvhost-user/meson.build
+++ b/subprojects/libvhost-user/meson.build
@@ -1,6 +1,13 @@
  project('libvhost-user', 'c',
          license: 'GPL-2.0-or-later',
-        default_options: ['c_std=gnu99'])
+        default_options: ['warning_level=1', 'c_std=gnu99'])
+
+cc = meson.get_compiler('c')
+add_project_arguments(cc.get_supported_arguments(
+  '-Wsign-compare',
+  '-Wdeclaration-after-statement',
+  '-Wstrict-aliasing'),
+  native: false, language: 'c')

  threads = dependency('threads')
  glib = dependency('glib-2.0')


to avoid regressions, and likewise for libvduse.

Paolo


