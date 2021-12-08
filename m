Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F3646CE7E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 08:47:19 +0100 (CET)
Received: from localhost ([::1]:42646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1murfa-0004FF-0q
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 02:47:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1murcs-0002gg-7J
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:44:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1murco-0006QY-KG
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638949464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UAsnne2B39UNUVL0cFK0pkfKW9FfPphHr4PbIsK8CnY=;
 b=CQMQpAmJU7dgA+Or4iiRscXiu4h0n0x6VNY+Z5NQJc/JSmfo7MP/4L/BkMuLsrUeEUx+zT
 PfWDu1380Wrsk14pTSwzyrw4xl/qqDPTm/zIVhzhfHTEtpsQo7vi4SinjT1uQQ3RbVCfLd
 XiU1ElJNlCzMqldHVw61yRRi7uPS1OM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-cFny4ngFP26uXay19-nwxw-1; Wed, 08 Dec 2021 02:44:23 -0500
X-MC-Unique: cFny4ngFP26uXay19-nwxw-1
Received: by mail-ed1-f71.google.com with SMTP id
 30-20020a508e5e000000b003f02e458b17so1370822edx.17
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 23:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UAsnne2B39UNUVL0cFK0pkfKW9FfPphHr4PbIsK8CnY=;
 b=tN8sqEczax4ExuGVBQSmSEQ+UlnQzMZg/Ak4pfrJ+ncBg8ZNiKYQqyiO9eazNoFYWz
 CSUXL+RXW3AM3K4ZN8NjlmKAdRHbbSAscSvEBA7e0U9z0hgwwK8UqQSIMsLxSsVfJyyC
 6IeXlSFa+vYa6ICIq7rBeGFw70a2j3nNkk5uTWtypbUXofouFhH4h9VfTqaKj6vnA9Sp
 OYH5WsRdeozjKw+tZvQTGo0zMU1xUo6vn2bz0hPps+pd5sk91owgU2YXRsaEo11+0RFA
 GfagMmBVu7NxZWMBxZGtnCVhh1/wey/Ez9G4Y7jg09UBhZ/keqauMLrKizF38B6q6Daf
 yJnA==
X-Gm-Message-State: AOAM532K2Ec4EPRBBFTbWXTpCiM83MIHvMvECzHQDmKoFkeb82Uwtq9v
 BwZisdvmQJc60TWItqNBxqi2Cns/rXVvzcSU+ootQRgVeoZ2oWJIl3leLQWIY9HmPWfNVBxHR23
 oR+feoHVA+K6ATY8=
X-Received: by 2002:a17:907:6e8e:: with SMTP id
 sh14mr5393497ejc.536.1638949461711; 
 Tue, 07 Dec 2021 23:44:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJze3jlMYuxzdSACyUJ2iud7KEUQwZC4ype5EmlIP1xw51KmgaFLc5CrJduDcxu3yXZ1vu0ZSA==
X-Received: by 2002:a17:907:6e8e:: with SMTP id
 sh14mr5393465ejc.536.1638949461393; 
 Tue, 07 Dec 2021 23:44:21 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107e:ebdb:5cc6:c351:b05:514f])
 by smtp.gmail.com with ESMTPSA id ar2sm998011ejc.20.2021.12.07.23.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 23:44:20 -0800 (PST)
Date: Wed, 8 Dec 2021 02:44:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v6 5/6] test/libqtest: add some virtio-net failover
 migration cancelling tests
Message-ID: <20211208024325-mutt-send-email-mst@kernel.org>
References: <20211206222040.3872253-1-lvivier@redhat.com>
 <20211206222040.3872253-6-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211206222040.3872253-6-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 06, 2021 at 11:20:39PM +0100, Laurent Vivier wrote:
> Add some tests to check the state of the machine if the migration
> is cancelled while we are using virtio-net failover.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

So this one I think is needed for the release. Thomas, are you
merging it there or should I?

> ---
>  tests/qtest/virtio-net-failover.c | 291 ++++++++++++++++++++++++++++++
>  1 file changed, 291 insertions(+)
> 
> diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
> index c88f8ddec39a..57abb99e7f6e 100644
> --- a/tests/qtest/virtio-net-failover.c
> +++ b/tests/qtest/virtio-net-failover.c
> @@ -682,6 +682,289 @@ static void test_migrate_in(gconstpointer opaque)
>      machine_stop(qts);
>  }
>  
> +static void test_migrate_abort_wait_unplug(gconstpointer opaque)
> +{
> +    QTestState *qts;
> +    QDict *resp, *args, *data, *ret;
> +    g_autofree gchar *uri = g_strdup_printf("exec: cat > %s", (gchar *)opaque);
> +    const gchar *status;
> +
> +    qts = machine_start(BASE_MACHINE
> +                     "-netdev user,id=hs0 "
> +                     "-netdev user,id=hs1 ",
> +                     2);
> +
> +    check_one_card(qts, false, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "standby0",
> +                         "{'bus': 'root0',"
> +                         "'failover': 'on',"
> +                         "'netdev': 'hs0',"
> +                         "'mac': '"MAC_STANDBY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    start_virtio_net(qts, 1, 0, "standby0");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
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
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
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
> +    g_assert_cmpstr(qdict_get_str(data, "device-id"), ==, "primary0");
> +
> +    qobject_unref(resp);
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'migrate_cancel' }");
> +    g_assert(qdict_haskey(resp, "return"));
> +    qobject_unref(resp);
> +
> +    /* migration has been cancelled while the unplug was in progress */
> +
> +    /* while the card is not ejected, we must be in "cancelling" state */
> +    ret = migrate_status(qts);
> +
> +    status = qdict_get_str(ret, "status");
> +    g_assert_cmpstr(status, ==, "cancelling");
> +    qobject_unref(ret);
> +
> +    /* OS unplugs the cards, QEMU can move from wait-unplug state */
> +    qtest_outl(qts, ACPI_PCIHP_ADDR_ICH9 + PCI_EJ_BASE, 1);
> +
> +    while (true) {
> +        ret = migrate_status(qts);
> +
> +        status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "cancelled") == 0) {
> +            break;
> +        }
> +        g_assert_cmpstr(status, !=, "failed");
> +        g_assert_cmpstr(status, !=, "active");
> +        qobject_unref(ret);
> +    }
> +    qobject_unref(ret);
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    machine_stop(qts);
> +}
> +
> +static void test_migrate_abort_active(gconstpointer opaque)
> +{
> +    QTestState *qts;
> +    QDict *resp, *args, *data, *ret;
> +    g_autofree gchar *uri = g_strdup_printf("exec: cat > %s", (gchar *)opaque);
> +    const gchar *status;
> +
> +    qts = machine_start(BASE_MACHINE
> +                     "-netdev user,id=hs0 "
> +                     "-netdev user,id=hs1 ",
> +                     2);
> +
> +    check_one_card(qts, false, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "standby0",
> +                         "{'bus': 'root0',"
> +                         "'failover': 'on',"
> +                         "'netdev': 'hs0',"
> +                         "'mac': '"MAC_STANDBY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    start_virtio_net(qts, 1, 0, "standby0");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
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
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
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
> +    g_assert_cmpstr(qdict_get_str(data, "device-id"), ==, "primary0");
> +
> +    qobject_unref(resp);
> +
> +    /* OS unplugs the cards, QEMU can move from wait-unplug state */
> +    qtest_outl(qts, ACPI_PCIHP_ADDR_ICH9 + PCI_EJ_BASE, 1);
> +
> +    while (true) {
> +        ret = migrate_status(qts);
> +
> +        status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "wait-unplug") != 0) {
> +            break;
> +        }
> +        g_assert_cmpstr(status, !=, "failed");
> +        qobject_unref(ret);
> +    }
> +    qobject_unref(resp);
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'migrate_cancel' }");
> +    g_assert(qdict_haskey(resp, "return"));
> +    qobject_unref(resp);
> +
> +    while (true) {
> +        ret = migrate_status(qts);
> +
> +        status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "cancelled") == 0) {
> +            break;
> +        }
> +        g_assert_cmpstr(status, !=, "failed");
> +        g_assert_cmpstr(status, !=, "active");
> +        qobject_unref(ret);
> +    }
> +    qobject_unref(ret);
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    machine_stop(qts);
> +}
> +
> +static void test_migrate_abort_timeout(gconstpointer opaque)
> +{
> +    QTestState *qts;
> +    QDict *resp, *args, *data, *ret;
> +    g_autofree gchar *uri = g_strdup_printf("exec: cat > %s", (gchar *)opaque);
> +    const gchar *status;
> +    int total;
> +
> +    qts = machine_start(BASE_MACHINE
> +                     "-netdev user,id=hs0 "
> +                     "-netdev user,id=hs1 ",
> +                     2);
> +
> +    check_one_card(qts, false, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "standby0",
> +                         "{'bus': 'root0',"
> +                         "'failover': 'on',"
> +                         "'netdev': 'hs0',"
> +                         "'mac': '"MAC_STANDBY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    start_virtio_net(qts, 1, 0, "standby0");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
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
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
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
> +    g_assert_cmpstr(qdict_get_str(data, "device-id"), ==, "primary0");
> +
> +    qobject_unref(resp);
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'migrate_cancel' }");
> +    g_assert(qdict_haskey(resp, "return"));
> +    qobject_unref(resp);
> +
> +    /* migration has been cancelled while the unplug was in progress */
> +
> +    /* while the card is not ejected, we must be in "cancelling" state */
> +
> +    total = 0;
> +    while (true) {
> +        ret = migrate_status(qts);
> +
> +        status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "cancelled") == 0) {
> +            break;
> +        }
> +        g_assert_cmpstr(status, ==, "cancelling");
> +        g_assert(qdict_haskey(ret, "total-time"));
> +        total = qdict_get_int(ret, "total-time");
> +        qobject_unref(ret);
> +    }
> +    qobject_unref(ret);
> +
> +    /*
> +     * migration timeout in this case is 30 seconds
> +     * check we exit on the timeout (ms)
> +     */
> +    g_assert_cmpint(total, >, 30000);
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    machine_stop(qts);
> +}
> +
>  int main(int argc, char **argv)
>  {
>      gchar *tmpfile = g_strdup_printf("/tmp/failover_test_migrate-%u-%u",
> @@ -714,6 +997,14 @@ int main(int argc, char **argv)
>                          test_migrate_out);
>      qtest_add_data_func("failover-virtio-net/migrate/in", tmpfile,
>                          test_migrate_in);
> +    qtest_add_data_func("failover-virtio-net/migrate/abort/wait-unplug",
> +                        tmpfile, test_migrate_abort_wait_unplug);
> +    qtest_add_data_func("failover-virtio-net/migrate/abort/active", tmpfile,
> +                        test_migrate_abort_active);
> +    if (g_test_slow()) {
> +        qtest_add_data_func("failover-virtio-net/migrate/abort/timeout",
> +                            tmpfile, test_migrate_abort_timeout);
> +    }
>  
>      ret = g_test_run();
>  
> -- 
> 2.33.1
> 
> 
> 


