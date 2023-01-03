Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4A765BFB0
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 13:13:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCg8n-0001FY-Au; Tue, 03 Jan 2023 07:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCg8O-00014B-7h
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:11:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCg8K-00085a-V5
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672747868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6MlcNMagkqKTumgj4yXnaV/ZnGeNh7qZIvG4dtHPE0I=;
 b=XcWMe+ZvvR/LOnrws1Xp4P8dWzaXcUsZY4mGlQei3ClEfYk5+BaREGf//5KSgN9Gd5xqim
 9VA3kb5bWs6CTVjStezcNyNXaJIkQRn6KXeKvRuznWqkQZvkjkkkgpc5AZ/IFLTpOjxwTT
 G67aY/5sWhPRyuzDADRvom2DXSVcxS0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-78-Alb9D2SaOFaAKV9XZvJ5JQ-1; Tue, 03 Jan 2023 07:11:06 -0500
X-MC-Unique: Alb9D2SaOFaAKV9XZvJ5JQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m8-20020a05600c3b0800b003d96bdce12fso14682079wms.9
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 04:11:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6MlcNMagkqKTumgj4yXnaV/ZnGeNh7qZIvG4dtHPE0I=;
 b=N94YSUVQhUIlDSqyyN5uxQQfSmrgUkQ0KGBU8cUBS3iNfzVlzU9dkV00MoPEZEg2+b
 Ts/ByKQbe2hBwnoZYypZQa9T8gl7cDAVVV+ewwamzfTqHJTt2dx95aPQ84wHysAO9cVC
 eVxF3ZlMbV4EixrjJh9ODwLrNLBNOXctHJhymUTSFs1Cyjd3x4kY1G50vUdxhQc2nPod
 VjuytYMFUNZrL/W/DWyg2YmVxb6ExeUnPDfeShLub8UXpgoda57zEt7FULlDRLcwFi70
 1eEszeX0ISPyOjyEKeWFARPmotFNObq+jiFdDXvZuO4N3hJUZVbzAwBWfsDoVW2kqhlx
 LGpg==
X-Gm-Message-State: AFqh2kroIuniSIPzZQi3ntEvfvyIXcg2y+klP450i+lLfWZ8Z99VN00P
 DYj6bDgKTs6fD9qth+a45ig6VGDJAlwmTUO8tCmC/hHF2T/FxDsdfloDEADxCtQ7EAyw3qjcwak
 77d8kWo6HTcaYj90=
X-Received: by 2002:a05:600c:540c:b0:3d9:922b:b148 with SMTP id
 he12-20020a05600c540c00b003d9922bb148mr17778361wmb.27.1672747865711; 
 Tue, 03 Jan 2023 04:11:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXstf37YOsiT1wAVsQskcucgxP9jIXutiX20Mgf8NxmDQEkzn/UbD5wUmRszNXQQTq926u7m5g==
X-Received: by 2002:a05:600c:540c:b0:3d9:922b:b148 with SMTP id
 he12-20020a05600c540c00b003d9922bb148mr17778339wmb.27.1672747865540; 
 Tue, 03 Jan 2023 04:11:05 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003d04e4ed873sm31355028wmo.22.2023.01.03.04.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 04:11:04 -0800 (PST)
Message-ID: <4ca22b73-7549-0013-0f22-90fbce5f27e8@redhat.com>
Date: Tue, 3 Jan 2023 13:11:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 10/10] qtest: enable vnc-display test on win32
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
 <20230103110814.3726795-11-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230103110814.3726795-11-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.103, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 03/01/2023 12.08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Now that qtest_qmp_add_client() works on win32, we can enable the VNC
> test.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/qtest/vnc-display-test.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/tests/qtest/vnc-display-test.c b/tests/qtest/vnc-display-test.c
> index e2a9d682bb..2997edc6ec 100644
> --- a/tests/qtest/vnc-display-test.c
> +++ b/tests/qtest/vnc-display-test.c
> @@ -34,10 +34,6 @@ static void on_vnc_auth_failure(VncConnection *self,
>   static bool
>   test_setup(Test *test)
>   {
> -#ifdef WIN32
> -    g_test_skip("Not supported on Windows yet");
> -    return false;
> -#else
>       int pair[2];
>   
>       test->qts = qtest_init("-vnc none -name vnc-test");
> @@ -56,7 +52,6 @@ test_setup(Test *test)
>   
>       test->loop = g_main_loop_new(NULL, FALSE);
>       return true;
> -#endif
>   }
>   
>   static void

Acked-by: Thomas Huth <thuth@redhat.com>


