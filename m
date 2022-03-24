Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6092C4E62D5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 12:57:53 +0100 (CET)
Received: from localhost ([::1]:43888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXM6C-000732-Gl
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 07:57:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nXM1o-0002DS-Vg
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:53:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nXM1n-0006vz-GI
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:53:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648122798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3fiIDHNcMFn8LKIMte6x/6zGhMvbGYWUWws0CvU5Ts=;
 b=LHy0QRlnIc1QYoVqmI9Icyhm8RgVGQroysnJ8hqCa7WeHR3PETs0a+r1zffSYNI3lryDAK
 0q8X96LUx/jq2Da2BhZ8sPaGsWZEsTuH8wldZZp+PsxDzNtLJs/RpxE6wPbB1bkj1vooCw
 3ibu1qK+N9b37b/3epXVqWLJxSnq78I=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-yjIKkhTqNKCnVG56F8YpOg-1; Thu, 24 Mar 2022 07:53:17 -0400
X-MC-Unique: yjIKkhTqNKCnVG56F8YpOg-1
Received: by mail-qk1-f198.google.com with SMTP id
 i2-20020a05620a248200b0067b51fa1269so2852868qkn.19
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 04:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G3fiIDHNcMFn8LKIMte6x/6zGhMvbGYWUWws0CvU5Ts=;
 b=gAh/mJKocKhtx1t4WUd16WkiumbUKAb5ZcpE2Z3A08rBs+Vqm0KNhXPjPTnpGCzc8m
 oZrh/q41h4m0NsOpjGoEB0txeO5GQk/Kf7/CQRQXye8I932Shosyn5HUXt1l4x1XQexW
 ESHg+4vBdZIT1CriTkCVd7nUJrM0MTPzUDFZsZuqpFOB0Ejf88ZQ1jqBc/u2f/BPyKxs
 lDx7wKloiYPlWgLcQtId8oGzAReW18Cwd6tXSFIczBRO7d+ORqmReU094j1jxJLL+tnN
 OTsynNt0i/LLJ5ktwgJR2DSBy+eMN69xU0HarEEpFXoVTVh3zADxwyf77ScU8ZAqYCyi
 dNWg==
X-Gm-Message-State: AOAM530LmPuInRosml32SPwCvLEOepz/1oE3FgNBOEa8pvbiu1X3TzyC
 YRrYbE7QUKnVExweJxecrVcR0Adog6OsikR5A+YFt1jMNqrNY9fs0Ty+0Jo7EdVYb2+beAlX3YJ
 RkFh8MMLP1tZL+lc=
X-Received: by 2002:a05:622a:1389:b0:2e1:cd3f:a0ff with SMTP id
 o9-20020a05622a138900b002e1cd3fa0ffmr3999191qtk.218.1648122796926; 
 Thu, 24 Mar 2022 04:53:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw55gc9AijXuIri1KQOkPsXdazD83APGiqMQUNivv4snnpnkQFNfsodSaonHIR+KpHcJq1WAQ==
X-Received: by 2002:a05:622a:1389:b0:2e1:cd3f:a0ff with SMTP id
 o9-20020a05622a138900b002e1cd3fa0ffmr3999176qtk.218.1648122796664; 
 Thu, 24 Mar 2022 04:53:16 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.12.150])
 by smtp.gmail.com with ESMTPSA id
 b202-20020ae9ebd3000000b0067b11d53365sm1428933qkg.47.2022.03.24.04.53.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 04:53:16 -0700 (PDT)
Message-ID: <6ca237e2-0ab8-242c-69b3-e628ba698f68@redhat.com>
Date: Thu, 24 Mar 2022 12:53:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: hang in virtio-failover-test (s390 host)
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA9PDWf+NDajMMTE5svM9mUTOOrWXj+O2wn7Sd8=RZDgaw@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <CAFEAcA9PDWf+NDajMMTE5svM9mUTOOrWXj+O2wn7Sd8=RZDgaw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/03/2022 12:11, Peter Maydell wrote:
> This is a backtrace from virtio-failover-test, which had hung
> on the s390 gitlab CI runner. Both processes were using CPU,
> so this is some kind of livelock, not a deadlock.
> 
> Looking more closely at the virtio-net-failover process, in the function
> test_migrate_off_abort() we have executed 'migrate_cancel' and then go
> into a loop waiting for 'status' to be "cancelled", with aborts if
> it is either "failed" or "active". But the status the QEMU process
> returns is "completed", so we loop forever waiting for a status change
> that will never come (I assume).
>

It means the migration has been completed before we tried to cancel it.
The test doesn't fail but is not valid.

Could you try this:

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index 80292eecf65f..80cda4ca28ce 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -1425,6 +1425,11 @@ static void test_migrate_off_abort(gconstpointer opaque)
          ret = migrate_status(qts);

          status = qdict_get_str(ret, "status");
+        if (strcmp(status, "completed") == 0) {
+            g_test_skip("Failed to cancel the migration");
+            qobject_unref(ret);
+            goto out;
+        }
          if (strcmp(status, "cancelled") == 0) {
              qobject_unref(ret);
              break;
@@ -1437,6 +1442,7 @@ static void test_migrate_off_abort(gconstpointer opaque)
      check_one_card(qts, true, "standby0", MAC_STANDBY0);
      check_one_card(qts, true, "primary0", MAC_PRIMARY0);

+out:
      qos_object_destroy((QOSGraphObject *)vdev);
      machine_stop(qts);
  }

Thanks,
Laurent


