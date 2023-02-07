Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B1168DA72
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:20:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOpU-0003x6-PS; Tue, 07 Feb 2023 09:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPOpQ-0003pr-Rl
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:20:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPOpO-0004rQ-Ft
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:20:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675779609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFBue2Kmxmj2jLstOZFwQB8khqI5CaUr6HbSgRF/Nio=;
 b=NV/E4wZLY2aLWMFXGZzpjz8wdV7BKi3M7BuAGVtnRWGbRCjbPjsKbcfaY8XxIvL0ijOaR7
 g3vefzHRZuFn85oQcox3j5HWFZ73faOTD0erryz4gRyf5ZsWJUvGfPnJvV/lmV+tibqx3U
 8oiL1sPvDELfqhnRpYwWNLm6BpwN4b8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-117-8pskworGMMC_4CYIHKKTUw-1; Tue, 07 Feb 2023 09:20:07 -0500
X-MC-Unique: 8pskworGMMC_4CYIHKKTUw-1
Received: by mail-qv1-f71.google.com with SMTP id
 kd28-20020a056214401c00b0053cd4737a42so7790409qvb.22
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:20:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LFBue2Kmxmj2jLstOZFwQB8khqI5CaUr6HbSgRF/Nio=;
 b=JtzMJAf8wVBjXO2t8to859yk6w/NbYfl4D8ojyUFbwZ1FYkpKwDma4leZqoNeG5Oh+
 1F2WKWOo3/DG2mZ9elsSnqFg3ZzebukKjWzVb6VHzh8PMiRMe1Khs9zFT0DngODZUW6E
 ElBvoxZ7ZWZ/S1eXBtEXshdRs7k5120yR9jMJ1rj9EzEdco9mHl//XXX9WRtv2qocu/Y
 2n/0tzQPbKsT53qi8f1qnLT4PhLyIXZ4dGXwPAr8Od3PZENPjUEkRbHxM2Iy2lXMUhUA
 PaQgJUN/1/naTcb3mu1ee5Wuby/9yB52q2WZSz5acc+t20lp6BgIvo3k24BrjGGFPNhe
 bDiA==
X-Gm-Message-State: AO0yUKXEa6n29R+d55oExmU5reeQym81rIxLghf7TkFjbuspk/MgddCD
 gE9Sf/QP+8rXsuLX8KpZtBpW4oxzJpXYkcXB0mLlZFbFNB/hCxAU2BevB0Zv5DlXgyCHA810pkn
 fms7SfxmoCyGY1oE=
X-Received: by 2002:a05:622a:8b:b0:3b8:1f0b:5a4 with SMTP id
 o11-20020a05622a008b00b003b81f0b05a4mr5682432qtw.19.1675779607422; 
 Tue, 07 Feb 2023 06:20:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9cSukqgtWaBlyC6G4bxkCuYPGhWI3Xf8uXHpOfEE5oOyjCNhr/rQlqDJsxPAfn/DjVTfyeWQ==
X-Received: by 2002:a05:622a:8b:b0:3b8:1f0b:5a4 with SMTP id
 o11-20020a05622a008b00b003b81f0b05a4mr5682394qtw.19.1675779607146; 
 Tue, 07 Feb 2023 06:20:07 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 o5-20020ac80245000000b003ab7aee56a0sm9340498qtg.39.2023.02.07.06.20.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 06:20:06 -0800 (PST)
Message-ID: <2d31e4e9-b5b5-fe98-417d-73920ef2b9e7@redhat.com>
Date: Tue, 7 Feb 2023 15:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 07/12] tests/qtest: drive_del-test: Skip tests that
 require missing devices
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-8-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206150416.4604-8-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 06/02/2023 16.04, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/drive_del-test.c | 70 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 
> diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
> index 9a750395a9..6fa96fa94a 100644
> --- a/tests/qtest/drive_del-test.c
> +++ b/tests/qtest/drive_del-test.c
> @@ -16,6 +16,21 @@
>   #include "qapi/qmp/qdict.h"
>   #include "qapi/qmp/qlist.h"
>   
> +static const char *qvirtio_get_dev_type(void);
> +
> +/*
> + * This covers the possible absence of a device due to QEMU build
> + * options.
> + */
> +static bool look_for_device_builtin(const char *prefix, const char *suffix)
> +{
> +    gchar *device = g_strdup_printf("%s-%s", prefix, suffix);
> +    bool rc = qtest_has_device(device);
> +
> +    g_free(device);
> +    return rc;
> +}

I think I'd rather merge the above code into the has_device_builtin() 
function below ... or is there a reason for keeping this separate?

>   static bool look_for_drive0(QTestState *qts, const char *command, const char *key)
>   {
>       QDict *response;
> @@ -40,6 +55,11 @@ static bool look_for_drive0(QTestState *qts, const char *command, const char *ke
>       return found;
>   }
>   
> +static bool has_device_builtin(const char *dev)
> +{
> +    return look_for_device_builtin(dev, qvirtio_get_dev_type());
> +}
> +
>   static bool has_drive(QTestState *qts)
>   {
>       return look_for_drive0(qts, "query-block", "device");
> @@ -208,6 +228,11 @@ static void test_drive_del_device_del(void)
>   {
>       QTestState *qts;
>   
> +    if (!has_device_builtin("virtio-scsi")) {
> +        g_test_skip(NULL);

Having a short message for the skip would be nice.

> +        return;
> +    }

  Thomas


