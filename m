Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D551E4B9AD1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:24:42 +0100 (CET)
Received: from localhost ([::1]:38666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKc5h-00071y-Lm
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:24:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKbqf-0004J2-UP
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:09:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKbqc-0007T7-BA
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645085345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DE007fs4ljswiGr6u1mToiG5dvAPuY24ux1umBvaCIc=;
 b=fU/n/LCJh74shHHod5foAbU7sFWOFjdsFGGNgx8Z0loheYzrhWidF7J6pMwhmOXiu0rJGP
 wgVYJO9LvhOxBUYsYHAYgMRq4TJXh224EoFUgZjodh//JGF8Vi1uyZ7UG8g1ASRf5pr/vX
 7kY98ypzDanUIeudGsqKpxxuWxwb5KI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-7hAqsfrfONya43IuICCSCQ-1; Thu, 17 Feb 2022 03:09:04 -0500
X-MC-Unique: 7hAqsfrfONya43IuICCSCQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so1949378wrg.19
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 00:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DE007fs4ljswiGr6u1mToiG5dvAPuY24ux1umBvaCIc=;
 b=dPcqepKnTZZ4Ld1xb5qp28DRqUMnAO5C7fdhSTpUUSVPWMFf3BxNEp0ls75CH7qADe
 BKo06Y5kWffXVJksiqSnmGyFQCzVjf6id8ugHf7yEIC6EhFeKLglzjlbDMgEq97Jfo8j
 9TdT9bqeii6q/5UxczWgAhe4HMyMoLLA3OJy2juF2t3reyD7Uh9PZNeB0sdA4Mu22gKA
 7/3kX/VN/eKYbaitxEcrXhJ7J7bFclSE5c+pc+qWaTE3Ta439y4lTwqn+Oe+7s9FUiWv
 cpkWRnqW0WYsJV9MNY7oj2cMiuXMlImLRdDR7X87xmuGJ5Y53CCCSpY8hUEHjU94Dbon
 HjXw==
X-Gm-Message-State: AOAM531TkhUgGBdfY7XYcGKGvfArdBba0C2tHCU7HZaq/c65mpC3ZqtR
 zpwjaN9Hb4PB6MQQojb7mzdAf2SX4eeaPFZ5pQ2t7Iv3vInJg1yqiUW8IX+bsP/MoU63gv4+3D/
 nWWCLk2W3bTDcrBk=
X-Received: by 2002:a5d:58f1:0:b0:1e6:809b:e984 with SMTP id
 f17-20020a5d58f1000000b001e6809be984mr1313468wrd.465.1645085343472; 
 Thu, 17 Feb 2022 00:09:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWG1aWMyQxV/7tZ70NYzb2tIQZ9ZQXZ2KJArSJiTe2psXu/jY6tVnAfvbb+7MqT6TcLh9fzg==
X-Received: by 2002:a5d:58f1:0:b0:1e6:809b:e984 with SMTP id
 f17-20020a5d58f1000000b001e6809be984mr1313451wrd.465.1645085343236; 
 Thu, 17 Feb 2022 00:09:03 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id ay34sm418214wmb.29.2022.02.17.00.09.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 00:09:02 -0800 (PST)
Message-ID: <170acbb3-e328-d453-aee9-bbb2ffaaca2b@redhat.com>
Date: Thu, 17 Feb 2022 09:09:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] tests/x86: Use 'pc' machine type for hotplug tests
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 mst@redhat.com, berrange@redhat.com, quintela@redhat.com
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-3-dgilbert@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220215162537.605030-3-dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/02/2022 17.25, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Hotplug tests need a bridge setting up on q35, for now
> keep them on 'pc'.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   tests/qtest/device-plug-test.c | 20 +++++++++++++++++--
>   tests/qtest/drive_del-test.c   | 35 +++++++++++++++++++++++++++++-----
>   tests/qtest/hd-geo-test.c      |  4 ++--
>   tests/qtest/ivshmem-test.c     |  7 ++++++-
>   4 files changed, 56 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
> index ad79bd4c14..404a92e132 100644
> --- a/tests/qtest/device-plug-test.c
> +++ b/tests/qtest/device-plug-test.c
> @@ -63,7 +63,15 @@ static void wait_device_deleted_event(QTestState *qtest, const char *id)
>   
>   static void test_pci_unplug_request(void)
>   {
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
>       /*
>        * Request device removal. As the guest is not running, the request won't
> @@ -79,8 +87,16 @@ static void test_pci_unplug_request(void)
>   
>   static void test_pci_unplug_json_request(void)
>   {
> +    const char *arch = qtest_get_arch();
> +    const char *machine_addition = "";
> +
> +    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> +        machine_addition = "-machine pc";
> +    }
> +
>       QTestState *qtest = qtest_initf(
> -        "-device '{\"driver\": \"virtio-mouse-pci\", \"id\": \"dev0\"}'");
> +        "%s -device '{\"driver\": \"virtio-mouse-pci\", \"id\": \"dev0\"}'",
> +        machine_addition);
>   
>       /*
>        * Request device removal. As the guest is not running, the request won't
> diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
> index 8d08ee9995..0cc18dfa4a 100644
> --- a/tests/qtest/drive_del-test.c
> +++ b/tests/qtest/drive_del-test.c
> @@ -235,14 +235,21 @@ static void test_drive_del_device_del(void)
>   static void test_cli_device_del(void)
>   {
>       QTestState *qts;
> +    const char *arch = qtest_get_arch();
> +    const char *machine_addition = "";
> +
> +    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> +        machine_addition = "-machine pc";
> +    }
>   
>       /*
>        * -drive/-device and device_del.  Start with a drive used by a
>        * device that unplugs after reset.
>        */
> -    qts = qtest_initf("-drive if=none,id=drive0,file=null-co://,"
> +    qts = qtest_initf("%s -drive if=none,id=drive0,file=null-co://,"
>                         "file.read-zeroes=on,format=raw"
>                         " -device virtio-blk-%s,drive=drive0,id=dev0",
> +                      machine_addition,
>                         qvirtio_get_dev_type());
>   
>       device_del(qts, true);
> @@ -266,13 +273,19 @@ static void test_empty_device_del(void)
>   static void test_device_add_and_del(void)
>   {
>       QTestState *qts;
> +    const char *arch = qtest_get_arch();
> +    const char *machine_addition = "";
> +
> +    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> +        machine_addition = "-machine pc";
> +    }
>   
>       /*
>        * -drive/device_add and device_del.  Start with a drive used by a
>        * device that unplugs after reset.
>        */
> -    qts = qtest_init("-drive if=none,id=drive0,file=null-co://,"
> -                     "file.read-zeroes=on,format=raw");
> +    qts = qtest_initf("%s -drive if=none,id=drive0,file=null-co://,"
> +                     "file.read-zeroes=on,format=raw", machine_addition);
>   
>       device_add(qts);
>       device_del(qts, true);
> @@ -284,8 +297,14 @@ static void test_device_add_and_del(void)
>   static void test_drive_add_device_add_and_del(void)
>   {
>       QTestState *qts;
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
>       /*
>        * drive_add/device_add and device_del.  The drive is used by a
> @@ -302,8 +321,14 @@ static void test_drive_add_device_add_and_del(void)
>   static void test_blockdev_add_device_add_and_del(void)
>   {
>       QTestState *qts;
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
>       /*
>        * blockdev_add/device_add and device_del.  The it drive is used by a
> diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
> index 3554b5d500..64023c0574 100644
> --- a/tests/qtest/hd-geo-test.c
> +++ b/tests/qtest/hd-geo-test.c
> @@ -839,7 +839,7 @@ static void test_override_scsi_hot_unplug(void)
>   
>       joined_args = g_strjoinv(" ", args->argv);
>   
> -    qts = qtest_init(joined_args);
> +    qts = qtest_initf("-machine pc %s", joined_args);
>       fw_cfg = pc_fw_cfg_init(qts);
>   
>       read_bootdevices(fw_cfg, expected);
> @@ -899,7 +899,7 @@ static void test_override_virtio_hot_unplug(void)
>   
>       joined_args = g_strjoinv(" ", args->argv);
>   
> -    qts = qtest_init(joined_args);
> +    qts = qtest_initf("-machine pc %s", joined_args);
>       fw_cfg = pc_fw_cfg_init(qts);
>   
>       read_bootdevices(fw_cfg, expected);
> diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
> index fe94dd3b96..4e8af42a9d 100644
> --- a/tests/qtest/ivshmem-test.c
> +++ b/tests/qtest/ivshmem-test.c
> @@ -385,7 +385,12 @@ static void test_ivshmem_hotplug(void)
>       QTestState *qts;
>       const char *arch = qtest_get_arch();
>   
> -    qts = qtest_init("-object memory-backend-ram,size=1M,id=mb1");
> +    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> +        qts = qtest_init("-object memory-backend-ram,size=1M,id=mb1"
> +                         " -machine pc");
> +    } else {
> +        qts = qtest_init("-object memory-backend-ram,size=1M,id=mb1");
> +    }
>   
>       qtest_qmp_device_add(qts, "ivshmem-plain", "iv1",
>                            "{'addr': %s, 'memdev': 'mb1'}",

Reviewed-by: Thomas Huth <thuth@redhat.com>


