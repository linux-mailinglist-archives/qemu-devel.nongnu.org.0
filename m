Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C257382117
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 23:09:20 +0200 (CEST)
Received: from localhost ([::1]:53152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liO0k-0003rx-Uh
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 17:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1liNze-00033z-Ml
 for qemu-devel@nongnu.org; Sun, 16 May 2021 17:08:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1liNzb-0003sO-LU
 for qemu-devel@nongnu.org; Sun, 16 May 2021 17:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621199286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bfqAaHupwWMOVTaDdFCjfY/DJ2j/4ZhF0rhT1MGWYlI=;
 b=eFOxHFR5Kv69DJ3UxP+a97ObBCgo+sj/lO6tYT27f1FP7wyT0Cvi6pmLbriFew4pCB5KGw
 d/+23jOAIfBMZ/t88ohybbatCTqOKapQOm/MxCibTLofial6ckYW4OIU0/iD8jstrs04fE
 aMcHbISNByhDnjbWkbwzEyKO64JgjJU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-6qW_dQwKMA-x9qrIqjMuIg-1; Sun, 16 May 2021 17:08:03 -0400
X-MC-Unique: 6qW_dQwKMA-x9qrIqjMuIg-1
Received: by mail-wr1-f70.google.com with SMTP id
 7-20020adf95070000b02901104ad3ef04so2829746wrs.16
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 14:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bfqAaHupwWMOVTaDdFCjfY/DJ2j/4ZhF0rhT1MGWYlI=;
 b=CJnydEtWgqLC4W6VKDkoc29XTpVjuys1Zg06+g9kgwY1brgl80yFfss6jfeZzeyxz7
 wWTPcp/Pyks+MayAiRxzNmZm6Do01zG5mheekxQRcWjUDmJcldF2DRvN911m5xlroJI/
 TmaZjTt1IdGK8i12c2xb+q8pzbuOwb2vpSRzukQ0ofckwZ+6WM6toXBNQznOZebP/4RD
 rFgmVQCL4htbxJGYe6Y9Z40rfoYrQ5n5qRk0v+5dCUfW4iVtJeeSdP2oUYbnyRqUYITi
 ELmaNMGpig5XYebofyLT8dJefNTb62NEiAIcaCiT7xSIVwxNvXIPU7L1LMXsDBgcIk1a
 7CVw==
X-Gm-Message-State: AOAM5305KBk2skGjfb1ZANsPTvAmD8NAkVNnQfm82SrAEZCllrzqUZl6
 Vbt5DTebN2RgqMKf73S9eem8Femg5LJgkj4o6UUK2/mPGiDyNU4e6WxZqIas5fXG54sdJu6LRR6
 8yuMF9xcfcfU6ldQ=
X-Received: by 2002:a05:600c:4f90:: with SMTP id
 n16mr20193166wmq.98.1621199282080; 
 Sun, 16 May 2021 14:08:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFgK+a3DKMHrBC2Ze6nfKSr6DBUC4fpQ+PWaSPZmMSyCmZ1gHehZapspOCWBo0Mv9iQNIU1Q==
X-Received: by 2002:a05:600c:4f90:: with SMTP id
 n16mr20193146wmq.98.1621199281779; 
 Sun, 16 May 2021 14:08:01 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id n7sm14072669wri.14.2021.05.16.14.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 May 2021 14:08:01 -0700 (PDT)
Subject: Re: [PULL 06/14] test: new qTest case to test the
 vhost-user-blk-server
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210514163124.251741-1-kwolf@redhat.com>
 <20210514163124.251741-7-kwolf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f9917bdd-fcf5-1c2c-f16b-d335a07489be@redhat.com>
Date: Sun, 16 May 2021 23:08:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514163124.251741-7-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 Coiby Xu <coiby.xu@gmail.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 6:31 PM, Kevin Wolf wrote:
> From: Coiby Xu <coiby.xu@gmail.com>
> 
> This test case has the same tests as tests/virtio-blk-test.c except for
> tests have block_resize. Since the vhost-user-blk export only serves one
> client one time, two exports are started by qemu-storage-daemon for the
> hotplug test.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Message-Id: <20210309094106.196911-3-stefanha@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Message-Id: <20210322092327.150720-2-stefanha@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/qtest/libqos/vhost-user-blk.h |  48 ++
>  tests/qtest/libqos/vhost-user-blk.c | 130 +++++
>  tests/qtest/vhost-user-blk-test.c   | 794 ++++++++++++++++++++++++++++
>  MAINTAINERS                         |   2 +
>  tests/qtest/libqos/meson.build      |   1 +
>  tests/qtest/meson.build             |   4 +
>  6 files changed, 979 insertions(+)
>  create mode 100644 tests/qtest/libqos/vhost-user-blk.h
>  create mode 100644 tests/qtest/libqos/vhost-user-blk.c
>  create mode 100644 tests/qtest/vhost-user-blk-test.c

> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 49de74ff59..7ecb7fea51 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -231,6 +231,9 @@ if have_virtfs
>    qos_test_ss.add(files('virtio-9p-test.c'))
>  endif
>  qos_test_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user-test.c'))
> +if have_vhost_user_blk_server

When building with --disable-tools I get:

sh: 1: exec: ./storage-daemon/qemu-storage-daemon: not found

Maybe:

if have_tools and have_vhost_user_blk_server

?

> +  qos_test_ss.add(files('vhost-user-blk-test.c'))
> +endif
>  
>  tpmemu_files = ['tpm-emu.c', 'tpm-util.c', 'tpm-tests.c']
>  
> @@ -269,6 +272,7 @@ foreach dir : target_dirs
>    endif
>    qtest_env.set('G_TEST_DBUS_DAEMON', meson.source_root() / 'tests/dbus-vmstate-daemon.sh')
>    qtest_env.set('QTEST_QEMU_BINARY', './qemu-system-' + target_base)
> +  qtest_env.set('QTEST_QEMU_STORAGE_DAEMON_BINARY', './storage-daemon/qemu-storage-daemon')
>    
>    foreach test : target_qtests
>      # Executables are shared across targets, declare them only the first time we
> 


