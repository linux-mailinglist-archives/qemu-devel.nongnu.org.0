Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9FC4EADD9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 14:52:11 +0200 (CEST)
Received: from localhost ([::1]:34454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZBKU-0000IN-Ne
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 08:52:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZBGI-00057w-Td
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:47:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZBGH-0005fx-5N
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:47:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648558068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3RjCal6qrJnWMNtTuMZmTMIroU1XKTsMTeIqHfyeywk=;
 b=bMKtfrQi0fQ8ZbPiD2zkarZmt+iscY1MXtZP7HqH2MuDBXwUQYjTOuOjj+ix4ySAK1k6PV
 sdqiLuxhuzgbojfcqfCDs+H0F2VgIaF2uNfx5RvmcFpizKuOlw1ahloyLpINTo3MhFQQuy
 sZt450tVqCmOOs/KPs9ps8jSgKOBadA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-VNP5xgCePnSVsxzNcV2L7g-1; Tue, 29 Mar 2022 08:47:45 -0400
X-MC-Unique: VNP5xgCePnSVsxzNcV2L7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A44E028EA6E1;
 Tue, 29 Mar 2022 12:47:44 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF9811400B1C;
 Tue, 29 Mar 2022 12:47:43 +0000 (UTC)
Message-ID: <f329f744-e807-fc0c-69f6-52cc3d10ab9e@redhat.com>
Date: Tue, 29 Mar 2022 14:47:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] tests/qtest: failover: fix infinite loop
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20220329124259.355995-1-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220329124259.355995-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/03/2022 14.42, Laurent Vivier wrote:
> If the migration is over before we cancel it, we are
> waiting in a loop a state that never comes because the state
> is already "completed".
> 
> To avoid an infinite loop, skip the test if the migration
> is "completed" before we were able to cancel it.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   tests/qtest/virtio-net-failover.c | 29 +++++++++++++++++++++++++----
>   1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
> index 80292eecf65f..78811f1c9216 100644
> --- a/tests/qtest/virtio-net-failover.c
> +++ b/tests/qtest/virtio-net-failover.c
> @@ -1141,6 +1141,11 @@ static void test_migrate_guest_off_abort(gconstpointer opaque)
>           ret = migrate_status(qts);
>   
>           status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "completed") == 0) {
> +            g_test_skip("Failed to cancel the migration");
> +            qobject_unref(ret);
> +            goto out;
> +        }
>           if (strcmp(status, "active") == 0) {
>               qobject_unref(ret);
>               break;
> @@ -1155,8 +1160,12 @@ static void test_migrate_guest_off_abort(gconstpointer opaque)
>   
>       while (true) {
>           ret = migrate_status(qts);
> -
>           status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "completed") == 0) {
> +            g_test_skip("Failed to cancel the migration");
> +            qobject_unref(ret);
> +            goto out;
> +        }
>           if (strcmp(status, "cancelled") == 0) {
>               qobject_unref(ret);
>               break;
> @@ -1169,6 +1178,7 @@ static void test_migrate_guest_off_abort(gconstpointer opaque)
>       check_one_card(qts, true, "standby0", MAC_STANDBY0);
>       check_one_card(qts, false, "primary0", MAC_PRIMARY0);
>   
> +out:
>       qos_object_destroy((QOSGraphObject *)vdev);
>       machine_stop(qts);
>   }
> @@ -1251,8 +1261,7 @@ static void test_migrate_abort_wait_unplug(gconstpointer opaque)
>               qobject_unref(ret);
>               break;
>           }
> -        g_assert_cmpstr(status, !=, "failed");
> -        g_assert_cmpstr(status, !=, "active");
> +        g_assert_cmpstr(status, ==, "cancelling");
>           qobject_unref(ret);
>       }
>   
> @@ -1324,11 +1333,11 @@ static void test_migrate_abort_active(gconstpointer opaque)
>           ret = migrate_status(qts);
>   
>           status = qdict_get_str(ret, "status");
> +        g_assert_cmpstr(status, !=, "failed");
>           if (strcmp(status, "wait-unplug") != 0) {
>               qobject_unref(ret);
>               break;
>           }
> -        g_assert_cmpstr(status, !=, "failed");
>           qobject_unref(ret);
>       }
>   
> @@ -1340,6 +1349,11 @@ static void test_migrate_abort_active(gconstpointer opaque)
>           ret = migrate_status(qts);
>   
>           status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "completed") == 0) {
> +            g_test_skip("Failed to cancel the migration");
> +            qobject_unref(ret);
> +            goto out;
> +        }
>           if (strcmp(status, "cancelled") == 0) {
>               qobject_unref(ret);
>               break;
> @@ -1352,6 +1366,7 @@ static void test_migrate_abort_active(gconstpointer opaque)
>       check_one_card(qts, true, "standby0", MAC_STANDBY0);
>       check_one_card(qts, true, "primary0", MAC_PRIMARY0);
>   
> +out:
>       qos_object_destroy((QOSGraphObject *)vdev);
>       machine_stop(qts);
>   }
> @@ -1425,6 +1440,11 @@ static void test_migrate_off_abort(gconstpointer opaque)
>           ret = migrate_status(qts);
>   
>           status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "completed") == 0) {
> +            g_test_skip("Failed to cancel the migration");
> +            qobject_unref(ret);
> +            goto out;
> +        }
>           if (strcmp(status, "cancelled") == 0) {
>               qobject_unref(ret);
>               break;
> @@ -1437,6 +1457,7 @@ static void test_migrate_off_abort(gconstpointer opaque)
>       check_one_card(qts, true, "standby0", MAC_STANDBY0);
>       check_one_card(qts, true, "primary0", MAC_PRIMARY0);
>   
> +out:
>       qos_object_destroy((QOSGraphObject *)vdev);
>       machine_stop(qts);
>   }

Acked-by: Thomas Huth <thuth@redhat.com>

Is this still urgent for 7.0, or can it wait for the 7.1 cycle?

  Thomas


