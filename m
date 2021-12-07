Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3F546B640
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 09:40:52 +0100 (CET)
Received: from localhost ([::1]:42494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muW1r-0000M8-In
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 03:40:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muW0o-00086g-9J
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 03:39:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muW0l-0006OG-Cb
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 03:39:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638866381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y+0IsPg0IvWYsvrBVTfTtZCK+iWBEUYsNDLD252eiGM=;
 b=QIuWGOGdaS6cFoQEfoMFmP5r3EPyMH466SGlRVh8+Xlxb0wk2JsIXgv9/5IYwTMBX0MbHa
 sPYlFMOiYZeJUm6gMJaLkKrBK7R+ixrENnujLV3fYuik/BAP/Suy0jlTEwuhRh6OmEQkTV
 T8u6HcUhtqaMfwgmcWrnUtcRCdCffWM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-337-owAE2eghO3-HoehAxpYwFw-1; Tue, 07 Dec 2021 03:39:40 -0500
X-MC-Unique: owAE2eghO3-HoehAxpYwFw-1
Received: by mail-wm1-f71.google.com with SMTP id
 n16-20020a05600c3b9000b003331973fdbbso1074199wms.0
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 00:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y+0IsPg0IvWYsvrBVTfTtZCK+iWBEUYsNDLD252eiGM=;
 b=VoWqfAvWjOLoB2ejj3Nq1CcupsYBV62DoMGnXFH48gKX1ihEmx1savV7vg2c3oAhco
 /1NyHErUW5rtqt7lan6zMEC20Gf0AEbswotvJkRnHXSHRVputsIUUMII9rZf+Vjpn0zO
 sFTht8RCzZhCi0UeOJp0ZESzBqIn1SMwOxorVcA2aTHEn41sczVpbkXmtMTDwHJVBc1K
 GnBc34MrtG3bpEsSddBnFT0HFd1sckr8jbUYn/HxjDYj9KgYuA5+u58FRTmHDIggYxt7
 F1M9nWhkSkywI0sLxZgE2xrEEGBwAwZTNmr+zkhoP7EiQo2z70WZ76XjS1Pc+LF8gHyV
 AAGA==
X-Gm-Message-State: AOAM533qTmyviylxRnKraOQPGrlTvp+nDHXyWwIz/t+ChpR/+0fIx/Yn
 kpqT0KF9aU4IeceCN67+/UZVXPyhj/bNRYE1x3c/Y4RATUCYCtuIuCrG8gbhkSWxi6ECK0ZkFd9
 hKAEa+WGBGzofCwA=
X-Received: by 2002:adf:e3c3:: with SMTP id k3mr47860122wrm.599.1638866379176; 
 Tue, 07 Dec 2021 00:39:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZdtMzlOtSKYuWjVyrjn0Z3htv0EHMRnztnf2xBlHli8/GzW74E3qoqwyKkH2VzazneYuLtg==
X-Received: by 2002:adf:e3c3:: with SMTP id k3mr47860101wrm.599.1638866378916; 
 Tue, 07 Dec 2021 00:39:38 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id b188sm1923184wmd.45.2021.12.07.00.39.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 00:39:38 -0800 (PST)
Message-ID: <951b5eb6-2d4a-1347-0b33-b56f94d628a6@redhat.com>
Date: Tue, 7 Dec 2021 09:39:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 6/6] tests/libqtest: add a migration test with two
 couples of failover devices
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211206222040.3872253-1-lvivier@redhat.com>
 <20211206222040.3872253-7-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211206222040.3872253-7-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/12/2021 23.20, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   tests/qtest/virtio-net-failover.c | 279 ++++++++++++++++++++++++++++++
>   1 file changed, 279 insertions(+)
> 
> diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
> index 57abb99e7f6e..ace9001894af 100644
> --- a/tests/qtest/virtio-net-failover.c
> +++ b/tests/qtest/virtio-net-failover.c
> @@ -11,6 +11,7 @@
>   
>   #define ACPI_PCIHP_ADDR_ICH9    0x0cc0
>   #define PCI_EJ_BASE             0x0008
> +#define PCI_SEL_BASE            0x0010
>   
>   #define BASE_MACHINE "-M q35 -nodefaults " \
>       "-device pcie-root-port,id=root0,addr=0x1,bus=pcie.0,chassis=1 " \
> @@ -18,6 +19,8 @@
>   
>   #define MAC_PRIMARY0 "52:54:00:11:11:11"
>   #define MAC_STANDBY0 "52:54:00:22:22:22"
> +#define MAC_PRIMARY1 "52:54:00:33:33:33"
> +#define MAC_STANDBY1 "52:54:00:44:44:44"
>   
>   static QGuestAllocator guest_malloc;
>   static QPCIBus *pcibus;
> @@ -965,6 +968,278 @@ static void test_migrate_abort_timeout(gconstpointer opaque)
>       machine_stop(qts);
>   }
>   
> +static void test_multi_out(gconstpointer opaque)
> +{
> +    QTestState *qts;
> +    QDict *resp, *args, *data, *ret;
> +    g_autofree gchar *uri = g_strdup_printf("exec: cat > %s", (gchar *)opaque);
> +    const gchar *status, *expected;
> +
> +    qts = machine_start(BASE_MACHINE
> +                "-device pcie-root-port,id=root2,addr=0x3,bus=pcie.0,chassis=3 "
> +                "-device pcie-root-port,id=root3,addr=0x4,bus=pcie.0,chassis=4 "
> +                "-netdev user,id=hs0 "
> +                "-netdev user,id=hs1 "
> +                "-netdev user,id=hs2 "
> +                "-netdev user,id=hs3 ",
> +                4);
> +
> +    check_one_card(qts, false, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +    check_one_card(qts, false, "standby1", MAC_STANDBY1);
> +    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "standby0",
> +                         "{'bus': 'root0',"
> +                         "'failover': 'on',"
> +                         "'netdev': 'hs0',"
> +                         "'mac': '"MAC_STANDBY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +    check_one_card(qts, false, "standby1", MAC_STANDBY1);
> +    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "primary0",
> +                         "{'bus': 'root1',"
> +                         "'failover_pair_id': 'standby0',"
> +                         "'netdev': 'hs1',"
> +                         "'rombar': 0,"
> +                         "'romfile': '',"
> +                         "'mac': '"MAC_PRIMARY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +    check_one_card(qts, false, "standby1", MAC_STANDBY1);
> +    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
> +
> +    start_virtio_net(qts, 1, 0, "standby0");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +    check_one_card(qts, false, "standby1", MAC_STANDBY1);
> +    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "standby1",
> +                         "{'bus': 'root2',"
> +                         "'failover': 'on',"
> +                         "'netdev': 'hs2',"
> +                         "'mac': '"MAC_STANDBY1"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +    check_one_card(qts, true, "standby1", MAC_STANDBY1);
> +    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "primary1",
> +                         "{'bus': 'root3',"
> +                         "'failover_pair_id': 'standby1',"
> +                         "'netdev': 'hs3',"
> +                         "'rombar': 0,"
> +                         "'romfile': '',"
> +                         "'mac': '"MAC_PRIMARY1"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +    check_one_card(qts, true, "standby1", MAC_STANDBY1);
> +    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
> +
> +    start_virtio_net(qts, 3, 0, "standby1");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +    check_one_card(qts, true, "standby1", MAC_STANDBY1);
> +    check_one_card(qts, true, "primary1", MAC_PRIMARY1);
> +
> +    args = qdict_from_jsonf_nofail("{}");
> +    g_assert_nonnull(args);
> +    qdict_put_str(args, "uri", uri);
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'migrate', 'arguments': %p}", args);
> +    g_assert(qdict_haskey(resp, "return"));
> +    qobject_unref(resp);
> +
> +    /* the event is sent whan QEMU asks the OS to unplug the card */
> +    resp = qtest_qmp_eventwait_ref(qts, "UNPLUG_PRIMARY");
> +    g_assert(qdict_haskey(resp, "data"));
> +
> +    data = qdict_get_qdict(resp, "data");
> +    g_assert(qdict_haskey(data, "device-id"));
> +    if (strcmp(qdict_get_str(data, "device-id"), "primary0") == 0) {
> +        expected = "primary1";
> +    } else if (strcmp(qdict_get_str(data, "device-id"), "primary1") == 0) {
> +        expected = "primary0";
> +    } else {
> +        g_assert_not_reached();
> +    }
> +    qobject_unref(resp);
> +
> +    resp = qtest_qmp_eventwait_ref(qts, "UNPLUG_PRIMARY");
> +    g_assert(qdict_haskey(resp, "data"));
> +
> +    data = qdict_get_qdict(resp, "data");
> +    g_assert(qdict_haskey(data, "device-id"));
> +    g_assert_cmpstr(qdict_get_str(data, "device-id"), ==, expected);
> +    qobject_unref(resp);
> +
> +    /* wait the end of the migration setup phase */
> +    while (true) {
> +        ret = migrate_status(qts);
> +
> +        status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "wait-unplug") == 0) {
> +            break;
> +        }
> +
> +        /* The migration must not start if the card is not ejected */
> +        g_assert_cmpstr(status, !=, "active");
> +        g_assert_cmpstr(status, !=, "completed");
> +        g_assert_cmpstr(status, !=, "failed");
> +        g_assert_cmpstr(status, !=, "cancelling");
> +        g_assert_cmpstr(status, !=, "cancelled");
> +
> +        qobject_unref(ret);
> +    }
> +    qobject_unref(ret);
> +
> +    /* OS unplugs primary1, but we must wait the second */
> +    qtest_outl(qts, ACPI_PCIHP_ADDR_ICH9 + PCI_EJ_BASE, 1);
> +
> +    ret = migrate_status(qts);
> +    status = qdict_get_str(ret, "status");
> +    g_assert_cmpstr(status, ==, "wait-unplug");
> +    qobject_unref(ret);
> +
> +    if (g_test_slow()) {
> +        /* check we stay in wait-unplug while the card is not ejected */
> +        int i;
> +
> +        for (i = 0; i < 10; i++) {

We're using gnu11 mode these days, so you could also write
  "for (int i = 0; ...)".
Maybe also consider to limit the test to 5 seconds.

> +            sleep(1);
> +            ret = migrate_status(qts);
> +            status = qdict_get_str(ret, "status");
> +            g_assert_cmpstr(status, ==, "wait-unplug");
> +            qobject_unref(ret);
> +        }
> +    }
> +
> +    /* OS unplugs primary0, QEMU can move from wait-unplug state */
> +    qtest_outl(qts, ACPI_PCIHP_ADDR_ICH9 + PCI_SEL_BASE, 2);
> +    qtest_outl(qts, ACPI_PCIHP_ADDR_ICH9 + PCI_EJ_BASE, 1);
> +
> +    while (true) {
> +        ret = migrate_status(qts);
> +
> +        status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "completed") == 0) {
> +            break;
> +        }
> +        g_assert_cmpstr(status, !=, "failed");
> +        g_assert_cmpstr(status, !=, "cancelling");
> +        g_assert_cmpstr(status, !=, "cancelled");
> +    }
> +
> +    qtest_qmp_eventwait(qts, "STOP");
> +
> +    machine_stop(qts);
> +}
> +
> +static void test_multi_in(gconstpointer opaque)
> +{
> +    QTestState *qts;
> +    QDict *resp, *args, *ret;
> +    g_autofree gchar *uri = g_strdup_printf("exec: cat %s", (gchar *)opaque);
> +
> +    qts = machine_start(BASE_MACHINE
> +                "-device pcie-root-port,id=root2,addr=0x3,bus=pcie.0,chassis=3 "
> +                "-device pcie-root-port,id=root3,addr=0x4,bus=pcie.0,chassis=4 "
> +                "-netdev user,id=hs0 "
> +                "-netdev user,id=hs1 "
> +                "-netdev user,id=hs2 "
> +                "-netdev user,id=hs3 "
> +                "-incoming defer ",
> +                4);
> +
> +    check_one_card(qts, false, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +    check_one_card(qts, false, "standby1", MAC_STANDBY1);
> +    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "standby0",
> +                         "{'bus': 'root0',"
> +                         "'failover': 'on',"
> +                         "'netdev': 'hs0',"
> +                         "'mac': '"MAC_STANDBY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +    check_one_card(qts, false, "standby1", MAC_STANDBY1);
> +    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "primary0",
> +                         "{'bus': 'root1',"
> +                         "'failover_pair_id': 'standby0',"
> +                         "'netdev': 'hs1',"
> +                         "'rombar': 0,"
> +                         "'romfile': '',"
> +                         "'mac': '"MAC_PRIMARY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +    check_one_card(qts, false, "standby1", MAC_STANDBY1);
> +    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "standby1",
> +                         "{'bus': 'root2',"
> +                         "'failover': 'on',"
> +                         "'netdev': 'hs2',"
> +                         "'mac': '"MAC_STANDBY1"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +    check_one_card(qts, true, "standby1", MAC_STANDBY1);
> +    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "primary1",
> +                         "{'bus': 'root3',"
> +                         "'failover_pair_id': 'standby1',"
> +                         "'netdev': 'hs3',"
> +                         "'rombar': 0,"
> +                         "'romfile': '',"
> +                         "'mac': '"MAC_PRIMARY1"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +    check_one_card(qts, true, "standby1", MAC_STANDBY1);
> +    check_one_card(qts, false, "primary1", MAC_PRIMARY1);
> +
> +    args = qdict_from_jsonf_nofail("{}");
> +    g_assert_nonnull(args);
> +    qdict_put_str(args, "uri", uri);
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'migrate-incoming', 'arguments': %p}",
> +                     args);
> +    g_assert(qdict_haskey(resp, "return"));
> +    qobject_unref(resp);
> +
> +    qtest_qmp_eventwait(qts, "MIGRATION");
> +    qtest_qmp_eventwait(qts, "FAILOVER_NEGOTIATED");
> +    qtest_qmp_eventwait(qts, "FAILOVER_NEGOTIATED");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +    check_one_card(qts, true, "standby1", MAC_STANDBY1);
> +    check_one_card(qts, true, "primary1", MAC_PRIMARY1);
> +
> +    qtest_qmp_eventwait(qts, "RESUME");
> +
> +    ret = migrate_status(qts);
> +    g_assert_cmpstr(qdict_get_str(ret, "status"), ==, "completed");
> +    qobject_unref(ret);
> +
> +    machine_stop(qts);
> +}
> +
>   int main(int argc, char **argv)
>   {
>       gchar *tmpfile = g_strdup_printf("/tmp/failover_test_migrate-%u-%u",
> @@ -1005,6 +1280,10 @@ int main(int argc, char **argv)
>           qtest_add_data_func("failover-virtio-net/migrate/abort/timeout",
>                               tmpfile, test_migrate_abort_timeout);
>       }
> +    qtest_add_data_func("failover-virtio-net/multi/out",
> +                        tmpfile, test_multi_out);
> +    qtest_add_data_func("failover-virtio-net/multi/in",
> +                   tmpfile, test_multi_in);
>   
>       ret = g_test_run();
>   
> 

Acked-by: Thomas Huth <thuth@redhat.com>


