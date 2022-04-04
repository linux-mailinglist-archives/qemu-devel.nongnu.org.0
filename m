Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55C34F199E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 19:51:29 +0200 (CEST)
Received: from localhost ([::1]:37962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbQrP-0003w1-Gn
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 13:51:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nbQoj-00038b-5q
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 13:48:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nbQoe-0002EY-Vl
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 13:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649094515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CJkP6v2nkOseAmpVaXvm2Hm9qotwEbliUU9DcCqRGLs=;
 b=MjGtR+4jrcJv9VpsHPVQ/C9wwqWbfyh+h98YMCp6XO1MfCWUlySiu0FEHGWk5aDFGYd3Ox
 yKap5FTaLHKQ6VAEbUpaeh6z0I6fb3EcCvZbL9qIlQTrg4A2jYxrmTL+2XjKKf/zJsJy8r
 0cglxZqwp9NFBc9rJAsRCsO3wRTSQVI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-cwE56bsmOoSOD-MuboONTg-1; Mon, 04 Apr 2022 13:48:34 -0400
X-MC-Unique: cwE56bsmOoSOD-MuboONTg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r6-20020a05600c35c600b0038e6db5da9cso974229wmq.9
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 10:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CJkP6v2nkOseAmpVaXvm2Hm9qotwEbliUU9DcCqRGLs=;
 b=k9CjK7jN+i5K2HSWUY+rdqwPjsfudin8HhypW5cM+S7fWk/pEeQ1okc6w4/QrPl5JA
 mtEapkaJdKbV+x1xZd97uZ7/BLLFZVSIG0ycMx86IqLgIymYuEHHqHcxYNkkdRXU6peE
 TEJSKGy3bJWLuLPVKqc7QWP0qzhfU7z/Sg+cD7+MWMaxChmTdrTEcBfnu41JYhAgFXrb
 kM5W4D0wywoqV4lmOE5arcaussys29jQ6JJaWHpt0lzgBQj4SLL1/zpC5u7GIC3o0oMB
 kdya0ZQ6J70LPy4FgraVRQAUUsj8cyW2h4NmBdfUTM5ICNZPdQ2zweW1z/1HyWLP0d10
 eU9w==
X-Gm-Message-State: AOAM531Cygqs0MTHo2CLsiJIoL837ql8qDMYkJrTFopWSjESfwG+AXjP
 BZ1bS5X4n10xVIq4F3tcSXONMT1nOabN+zn6juufEJAgzpc9CDDBzcaaA7HtcHjuNqQa7RFnNxf
 pw3H74KqKWUs6imY=
X-Received: by 2002:a05:6000:188b:b0:204:109a:fbed with SMTP id
 a11-20020a056000188b00b00204109afbedmr671553wri.569.1649094513238; 
 Mon, 04 Apr 2022 10:48:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqJW2APpqdFps2bEd+q4IjlRs4LM/qUITzSMoQ4DODYsUZx4XALpjjCZSvplgEJdNWnOJtow==
X-Received: by 2002:a05:6000:188b:b0:204:109a:fbed with SMTP id
 a11-20020a056000188b00b00204109afbedmr671527wri.569.1649094512927; 
 Mon, 04 Apr 2022 10:48:32 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c358f00b0038cc046cb2esm219615wmq.32.2022.04.04.10.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 10:48:32 -0700 (PDT)
Date: Mon, 4 Apr 2022 18:48:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] tests/qtest: failover: fix infinite loop
Message-ID: <Yksvbk/X0f/EQd9q@work-vm>
References: <20220329124259.355995-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220329124259.355995-1-lvivier@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Laurent Vivier (lvivier@redhat.com) wrote:
> If the migration is over before we cancel it, we are
> waiting in a loop a state that never comes because the state
> is already "completed".
> 
> To avoid an infinite loop, skip the test if the migration
> is "completed" before we were able to cancel it.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

If you're finding it's skipping to often, you might try setting the
migration bandwidth really low right at the start (a few bytes/second)
to ensure it doesn't complete under your feet.

Dave

> ---
>  tests/qtest/virtio-net-failover.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
> index 80292eecf65f..78811f1c9216 100644
> --- a/tests/qtest/virtio-net-failover.c
> +++ b/tests/qtest/virtio-net-failover.c
> @@ -1141,6 +1141,11 @@ static void test_migrate_guest_off_abort(gconstpointer opaque)
>          ret = migrate_status(qts);
>  
>          status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "completed") == 0) {
> +            g_test_skip("Failed to cancel the migration");
> +            qobject_unref(ret);
> +            goto out;
> +        }
>          if (strcmp(status, "active") == 0) {
>              qobject_unref(ret);
>              break;
> @@ -1155,8 +1160,12 @@ static void test_migrate_guest_off_abort(gconstpointer opaque)
>  
>      while (true) {
>          ret = migrate_status(qts);
> -
>          status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "completed") == 0) {
> +            g_test_skip("Failed to cancel the migration");
> +            qobject_unref(ret);
> +            goto out;
> +        }
>          if (strcmp(status, "cancelled") == 0) {
>              qobject_unref(ret);
>              break;
> @@ -1169,6 +1178,7 @@ static void test_migrate_guest_off_abort(gconstpointer opaque)
>      check_one_card(qts, true, "standby0", MAC_STANDBY0);
>      check_one_card(qts, false, "primary0", MAC_PRIMARY0);
>  
> +out:
>      qos_object_destroy((QOSGraphObject *)vdev);
>      machine_stop(qts);
>  }
> @@ -1251,8 +1261,7 @@ static void test_migrate_abort_wait_unplug(gconstpointer opaque)
>              qobject_unref(ret);
>              break;
>          }
> -        g_assert_cmpstr(status, !=, "failed");
> -        g_assert_cmpstr(status, !=, "active");
> +        g_assert_cmpstr(status, ==, "cancelling");
>          qobject_unref(ret);
>      }
>  
> @@ -1324,11 +1333,11 @@ static void test_migrate_abort_active(gconstpointer opaque)
>          ret = migrate_status(qts);
>  
>          status = qdict_get_str(ret, "status");
> +        g_assert_cmpstr(status, !=, "failed");
>          if (strcmp(status, "wait-unplug") != 0) {
>              qobject_unref(ret);
>              break;
>          }
> -        g_assert_cmpstr(status, !=, "failed");
>          qobject_unref(ret);
>      }
>  
> @@ -1340,6 +1349,11 @@ static void test_migrate_abort_active(gconstpointer opaque)
>          ret = migrate_status(qts);
>  
>          status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "completed") == 0) {
> +            g_test_skip("Failed to cancel the migration");
> +            qobject_unref(ret);
> +            goto out;
> +        }
>          if (strcmp(status, "cancelled") == 0) {
>              qobject_unref(ret);
>              break;
> @@ -1352,6 +1366,7 @@ static void test_migrate_abort_active(gconstpointer opaque)
>      check_one_card(qts, true, "standby0", MAC_STANDBY0);
>      check_one_card(qts, true, "primary0", MAC_PRIMARY0);
>  
> +out:
>      qos_object_destroy((QOSGraphObject *)vdev);
>      machine_stop(qts);
>  }
> @@ -1425,6 +1440,11 @@ static void test_migrate_off_abort(gconstpointer opaque)
>          ret = migrate_status(qts);
>  
>          status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "completed") == 0) {
> +            g_test_skip("Failed to cancel the migration");
> +            qobject_unref(ret);
> +            goto out;
> +        }
>          if (strcmp(status, "cancelled") == 0) {
>              qobject_unref(ret);
>              break;
> @@ -1437,6 +1457,7 @@ static void test_migrate_off_abort(gconstpointer opaque)
>      check_one_card(qts, true, "standby0", MAC_STANDBY0);
>      check_one_card(qts, true, "primary0", MAC_PRIMARY0);
>  
> +out:
>      qos_object_destroy((QOSGraphObject *)vdev);
>      machine_stop(qts);
>  }
> -- 
> 2.35.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


