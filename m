Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4D14B9B94
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:59:06 +0100 (CET)
Received: from localhost ([::1]:51184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKccy-0002hm-P1
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:59:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKbzd-0003DI-NX
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:18:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKbzZ-0000Vs-Gy
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645085900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uFKXxzR52pJlXQIEFltaiLLytrODT7HEGZafNk7Uga0=;
 b=Wbq+ICYqhQzTQGpmtZhPKIRmJFwjPxvqchlWIrOVy5lXBnuueQ+oqYJSuaUFnFuZUqf3SW
 FOhGMD5xwVKlSFi0TptxbPuq6FsP5Au6qbjz8WPJ+uJBkQefQ4uNEucJd6ZzqFDypxSs7D
 h7zuBC0xx6lj6K8Six5D4mJ+ci8HOlg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-uzb8fyqUPvCDK9s5_pjVVA-1; Thu, 17 Feb 2022 03:18:19 -0500
X-MC-Unique: uzb8fyqUPvCDK9s5_pjVVA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c7-20020a1c3507000000b0034a0dfc86aaso3889929wma.6
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 00:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uFKXxzR52pJlXQIEFltaiLLytrODT7HEGZafNk7Uga0=;
 b=Z4MKsXOJ26B5sDE6X95tVFI1sqvy4+bgZLTZNibolDeXsX4IbULP9krclBSoNbetoU
 dU8IyXM2fP0dSr5o0VfJJszdCdxFw0s9VzGkiFPUmYu0yv2x5ggaPEBTPkbcrLGOx/SZ
 HlMT/cmfV2VBGbcQlfVRaS4h84UI71AqLnvdf1+BYdqNGGMka64RGJGH8J5EZLFuZEuu
 kynCAMJ8mt2F5srD0zHqfmF2pOvNXe15542pNAtP3EqOtsqockJr6jE5iBnQLMMxrqXX
 JdYyj1XJWgDumxhpn92gmoeqNNY+W5sN7iLrk8RelSymle9ZD5padLWfXS39a3JNdYLt
 3m7Q==
X-Gm-Message-State: AOAM532vj5vNop5BIpSu0Xdqo+Hl5RHozsmRC2aEpPanxblCWl8eJPS0
 4BYbUjSAo5fka/DkIKfo2T41c5smeZcYe9HAjglsQ+6YC/bMsTILx/pH4REqsuRhjDf1G+oGPAO
 Ax2zsXSX//pmLiRg=
X-Received: by 2002:a7b:c8c2:0:b0:37b:b742:a9de with SMTP id
 f2-20020a7bc8c2000000b0037bb742a9demr1584094wml.37.1645085898442; 
 Thu, 17 Feb 2022 00:18:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzf3jvnVNQr2cX5zlozPGixEnMTgANMaHG22vjYq815Q2oiebRLupLDqLEtLva6negojT9qaA==
X-Received: by 2002:a7b:c8c2:0:b0:37b:b742:a9de with SMTP id
 f2-20020a7bc8c2000000b0037bb742a9demr1584077wml.37.1645085898213; 
 Thu, 17 Feb 2022 00:18:18 -0800 (PST)
Received: from redhat.com ([2.55.139.83])
 by smtp.gmail.com with ESMTPSA id j6sm25902021wrt.70.2022.02.17.00.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 00:18:17 -0800 (PST)
Date: Thu, 17 Feb 2022 03:18:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 2/3] tests/x86: Use 'pc' machine type for hotplug tests
Message-ID: <20220217031743-mutt-send-email-mst@kernel.org>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-3-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220215162537.605030-3-dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: eduardo@habkost.net, thuth@redhat.com, berrange@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 04:25:32PM +0000, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Hotplug tests need a bridge setting up on q35, for now
> keep them on 'pc'.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

I'd really much rather we actually tested q35.

> ---
>  tests/qtest/device-plug-test.c | 20 +++++++++++++++++--
>  tests/qtest/drive_del-test.c   | 35 +++++++++++++++++++++++++++++-----
>  tests/qtest/hd-geo-test.c      |  4 ++--
>  tests/qtest/ivshmem-test.c     |  7 ++++++-
>  4 files changed, 56 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
> index ad79bd4c14..404a92e132 100644
> --- a/tests/qtest/device-plug-test.c
> +++ b/tests/qtest/device-plug-test.c
> @@ -63,7 +63,15 @@ static void wait_device_deleted_event(QTestState *qtest, const char *id)
>  
>  static void test_pci_unplug_request(void)
>  {
> -    QTestState *qtest = qtest_initf("-device virtio-mouse-pci,id=dev0");
> +    const char *arch = qtest_get_arch();
> +    const char *machine_addition = "";
> +
> +    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> +        machine_addition = "-machine pc";
> +    }
> +
> +    QTestState *qtest = qtest_initf("%s -device virtio-mouse-pci,id=dev0",
> +                                    machine_addition);
>  
>      /*
>       * Request device removal. As the guest is not running, the request won't
> @@ -79,8 +87,16 @@ static void test_pci_unplug_request(void)
>  
>  static void test_pci_unplug_json_request(void)
>  {
> +    const char *arch = qtest_get_arch();
> +    const char *machine_addition = "";
> +
> +    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> +        machine_addition = "-machine pc";
> +    }
> +
>      QTestState *qtest = qtest_initf(
> -        "-device '{\"driver\": \"virtio-mouse-pci\", \"id\": \"dev0\"}'");
> +        "%s -device '{\"driver\": \"virtio-mouse-pci\", \"id\": \"dev0\"}'",
> +        machine_addition);
>  
>      /*
>       * Request device removal. As the guest is not running, the request won't
> diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
> index 8d08ee9995..0cc18dfa4a 100644
> --- a/tests/qtest/drive_del-test.c
> +++ b/tests/qtest/drive_del-test.c
> @@ -235,14 +235,21 @@ static void test_drive_del_device_del(void)
>  static void test_cli_device_del(void)
>  {
>      QTestState *qts;
> +    const char *arch = qtest_get_arch();
> +    const char *machine_addition = "";
> +
> +    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> +        machine_addition = "-machine pc";
> +    }
>  
>      /*
>       * -drive/-device and device_del.  Start with a drive used by a
>       * device that unplugs after reset.
>       */
> -    qts = qtest_initf("-drive if=none,id=drive0,file=null-co://,"
> +    qts = qtest_initf("%s -drive if=none,id=drive0,file=null-co://,"
>                        "file.read-zeroes=on,format=raw"
>                        " -device virtio-blk-%s,drive=drive0,id=dev0",
> +                      machine_addition,
>                        qvirtio_get_dev_type());
>  
>      device_del(qts, true);
> @@ -266,13 +273,19 @@ static void test_empty_device_del(void)
>  static void test_device_add_and_del(void)
>  {
>      QTestState *qts;
> +    const char *arch = qtest_get_arch();
> +    const char *machine_addition = "";
> +
> +    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> +        machine_addition = "-machine pc";
> +    }
>  
>      /*
>       * -drive/device_add and device_del.  Start with a drive used by a
>       * device that unplugs after reset.
>       */
> -    qts = qtest_init("-drive if=none,id=drive0,file=null-co://,"
> -                     "file.read-zeroes=on,format=raw");
> +    qts = qtest_initf("%s -drive if=none,id=drive0,file=null-co://,"
> +                     "file.read-zeroes=on,format=raw", machine_addition);
>  
>      device_add(qts);
>      device_del(qts, true);
> @@ -284,8 +297,14 @@ static void test_device_add_and_del(void)
>  static void test_drive_add_device_add_and_del(void)
>  {
>      QTestState *qts;
> +    const char *arch = qtest_get_arch();
> +    const char *machine_addition = "";
> +
> +    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> +        machine_addition = "-machine pc";
> +    }
>  
> -    qts = qtest_init("");
> +    qts = qtest_init(machine_addition);
>  
>      /*
>       * drive_add/device_add and device_del.  The drive is used by a
> @@ -302,8 +321,14 @@ static void test_drive_add_device_add_and_del(void)
>  static void test_blockdev_add_device_add_and_del(void)
>  {
>      QTestState *qts;
> +    const char *arch = qtest_get_arch();
> +    const char *machine_addition = "";
> +
> +    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> +        machine_addition = "-machine pc";
> +    }
>  
> -    qts = qtest_init("");
> +    qts = qtest_init(machine_addition);
>  
>      /*
>       * blockdev_add/device_add and device_del.  The it drive is used by a
> diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
> index 3554b5d500..64023c0574 100644
> --- a/tests/qtest/hd-geo-test.c
> +++ b/tests/qtest/hd-geo-test.c
> @@ -839,7 +839,7 @@ static void test_override_scsi_hot_unplug(void)
>  
>      joined_args = g_strjoinv(" ", args->argv);
>  
> -    qts = qtest_init(joined_args);
> +    qts = qtest_initf("-machine pc %s", joined_args);
>      fw_cfg = pc_fw_cfg_init(qts);
>  
>      read_bootdevices(fw_cfg, expected);
> @@ -899,7 +899,7 @@ static void test_override_virtio_hot_unplug(void)
>  
>      joined_args = g_strjoinv(" ", args->argv);
>  
> -    qts = qtest_init(joined_args);
> +    qts = qtest_initf("-machine pc %s", joined_args);
>      fw_cfg = pc_fw_cfg_init(qts);
>  
>      read_bootdevices(fw_cfg, expected);
> diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
> index fe94dd3b96..4e8af42a9d 100644
> --- a/tests/qtest/ivshmem-test.c
> +++ b/tests/qtest/ivshmem-test.c
> @@ -385,7 +385,12 @@ static void test_ivshmem_hotplug(void)
>      QTestState *qts;
>      const char *arch = qtest_get_arch();
>  
> -    qts = qtest_init("-object memory-backend-ram,size=1M,id=mb1");
> +    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> +        qts = qtest_init("-object memory-backend-ram,size=1M,id=mb1"
> +                         " -machine pc");
> +    } else {
> +        qts = qtest_init("-object memory-backend-ram,size=1M,id=mb1");
> +    }
>  
>      qtest_qmp_device_add(qts, "ivshmem-plain", "iv1",
>                           "{'addr': %s, 'memdev': 'mb1'}",
> -- 
> 2.35.1


