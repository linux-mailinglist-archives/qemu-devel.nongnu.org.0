Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AE52ECEE9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 12:43:27 +0100 (CET)
Received: from localhost ([::1]:59834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxThO-0007Gj-BI
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 06:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxTfr-00067g-P7
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:41:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxTfn-0002BD-Qb
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610019705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=48hpIDVerofnhg+lSqBUDUJGdJTIiNhb3tqr7VG8u/k=;
 b=TEUggVZH+PaZVIAeGCYQtUKc1XbqTanfCn1GJntIWlOGPVx2IZV2AlN53Bu1y4jhpgyUnH
 BL2DjK4+3PCKBYeGyUYFVnAezoaI2QqKJ8t/HwuJFIgK4DUe6EMsCBcox2poPHoBVdT1Bv
 hI2Ehr2Cnff9nAJZs/3PN+NGC3i6Bus=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-Qde_S73sM_23C6FFuyxlAg-1; Thu, 07 Jan 2021 06:41:43 -0500
X-MC-Unique: Qde_S73sM_23C6FFuyxlAg-1
Received: by mail-ed1-f69.google.com with SMTP id u18so3252071edy.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 03:41:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=48hpIDVerofnhg+lSqBUDUJGdJTIiNhb3tqr7VG8u/k=;
 b=dK7qo0cvo9LG2Y59ncwcujST22nWWBLsDJYRnb4QoqY5T4kkaSc/sfjjzqdDK24LkC
 Bi0CbQ2Jl4IaRjQE8rn6sCJGPK7kjz4RmHDy1K8q0cQDWuOmU7F+/UiI4G8sptTTcyIL
 oxfpKl/UeMPbFJ3dPNlr8Jqh4cYTMgkXHSTmaZJx9N8XQqWIAZKf5siQ9iYlhFeTqZMF
 syd//bBzl6s9SfkziZ/xkIJFtybPm6aJIlCEzTjIe43M9VLadE4hkDdKlJUXjteCPGkv
 yQAKj+kelJno9j69WwXFJdT7X/8IkUytj533iO7I9svSrJ7EnhY+O/mCsaJuPwUhAw+m
 63Ng==
X-Gm-Message-State: AOAM531dQTusa//ZUPsSt4wojLF4bmX/SIHYiGJCYbV0Y+ufuMdKlimW
 4FCWRdWncjimB903YsvwCe+XFU1tMnpX/PPCftt5eJnGnmrT/pej3cLk7OrteIEBws13YSnLDCe
 xMAyKw7TiBvLoB8Q=
X-Received: by 2002:aa7:c444:: with SMTP id n4mr1373154edr.226.1610019702553; 
 Thu, 07 Jan 2021 03:41:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwsyHwssc9/2Whqptz294xDnFe/yQetl+EpOn6EGwXg3Ur9mQ3hgTfl6GtLFwHN5GBkeoeQA==
X-Received: by 2002:aa7:c444:: with SMTP id n4mr1373132edr.226.1610019702292; 
 Thu, 07 Jan 2021 03:41:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a2sm2348342ejt.46.2021.01.07.03.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 03:41:41 -0800 (PST)
Subject: Re: [PATCH] meson: Propagate gnutls dependency
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
 <ea49da2a-47f9-8ffe-8dbc-1974f34cb6f1@redhat.com>
 <X/NPRqMkdM0/IxTh@SPB-NB-133.local>
 <af0194cd-cdcc-44a3-f023-80d73d96c9e8@redhat.com>
 <X/R5xtvMn4PcSkTf@SPB-NB-133.local>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <690581da-9258-41e5-14cb-bb1b162e8993@redhat.com>
Date: Thu, 7 Jan 2021 12:41:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <X/R5xtvMn4PcSkTf@SPB-NB-133.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/21 15:37, Roman Bolshakov wrote:
> Does it work if you do:
> 
> crypto_ss.add(authz, qom)
> libcrypto = static_library('crypto', crypto_ss.sources() + genh,
>                             dependencies: crypto_ss.dependencies(),
>                             ...)
> crypto = declare_dependency(link_whole: libcrypto,
>                              dependencies: crypto_ss.dependencies())

Ok, so the final attempt is a mix of the three :)  Keep the link_whole 
dependencies in the declare_dependency, and add the sourceset 
dependencies there too.

diff --git a/meson.build b/meson.build
index e9bf290966..774df4db8e 100644
--- a/meson.build
+++ b/meson.build
@@ -1904,7 +1904,8 @@ libqom = static_library('qom', qom_ss.sources() + 
genh,
                          dependencies: [qom_ss.dependencies()],
                          name_suffix: 'fa')

-qom = declare_dependency(link_whole: libqom)
+qom = declare_dependency(link_whole: libqom,
+                         dependencies: [qom_ss.dependencies()])

  authz_ss = authz_ss.apply(config_host, strict: false)
  libauthz = static_library('authz', authz_ss.sources() + genh,
@@ -1913,7 +1914,7 @@ libauthz = static_library('authz', 
authz_ss.sources() + genh,
                            build_by_default: false)

  authz = declare_dependency(link_whole: libauthz,
-                           dependencies: qom)
+                          dependencies: [authz_ss.dependencies(), qom])

  crypto_ss = crypto_ss.apply(config_host, strict: false)
  libcrypto = static_library('crypto', crypto_ss.sources() + genh,
@@ -1922,7 +1923,7 @@ libcrypto = static_library('crypto', 
crypto_ss.sources() + genh,
                             build_by_default: false)

  crypto = declare_dependency(link_whole: libcrypto,
-                            dependencies: [authz, qom])
+                            dependencies: [crypto_ss.dependencies(), 
authz, qom])

  io_ss = io_ss.apply(config_host, strict: false)
  libio = static_library('io', io_ss.sources() + genh,
@@ -1931,13 +1932,14 @@ libio = static_library('io', io_ss.sources() + genh,
                         name_suffix: 'fa',
                         build_by_default: false)

-io = declare_dependency(link_whole: libio, dependencies: [crypto, qom])
+io = declare_dependency(link_whole: libio,
+                        dependencies: [io_ss.dependencies(), crypto, qom])

  libmigration = static_library('migration', sources: migration_files + 
genh,
                                name_suffix: 'fa',
                                build_by_default: false)
  migration = declare_dependency(link_with: libmigration,
-                               dependencies: [zlib, qom, io])
+                               dependencies: [qom, io])
  softmmu_ss.add(migration)

  block_ss = block_ss.apply(config_host, strict: false)
@@ -1949,7 +1951,7 @@ libblock = static_library('block', 
block_ss.sources() + genh,

  block = declare_dependency(link_whole: [libblock],
                             link_args: '@block.syms',
-                           dependencies: [crypto, io])
+                           dependencies: [block_ss.dependencies(), 
crypto, io])

  blockdev_ss = blockdev_ss.apply(config_host, strict: false)
  libblockdev = static_library('blockdev', blockdev_ss.sources() + genh,
@@ -1958,7 +1960,7 @@ libblockdev = static_library('blockdev', 
blockdev_ss.sources() + genh,
                               build_by_default: false)

  blockdev = declare_dependency(link_whole: [libblockdev],
-                              dependencies: [block])
+                              dependencies: 
[blockdev_ss.dependencies(), block])

  qmp_ss = qmp_ss.apply(config_host, strict: false)
  libqmp = static_library('qmp', qmp_ss.sources() + genh,
@@ -1966,7 +1968,8 @@ libqmp = static_library('qmp', qmp_ss.sources() + 
genh,
                          name_suffix: 'fa',
                          build_by_default: false)

-qmp = declare_dependency(link_whole: [libqmp])
+qmp = declare_dependency(link_whole: [libqmp],
+                         dependencies: qmp_ss.dependencies())

  libchardev = static_library('chardev', chardev_ss.sources() + genh,
                              name_suffix: 'fa',
diff --git a/migration/meson.build b/migration/meson.build
index 9645f44005..e1f237b5db 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -9,6 +9,7 @@ migration_files = files(
  )
  softmmu_ss.add(migration_files)

+softmmu_ss.add(zlib)
  softmmu_ss.add(files(
    'block-dirty-bitmap.c',
    'channel.c',


