Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C836EAB05
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 14:55:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqHc-0005J1-Qv; Fri, 21 Apr 2023 08:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppqHa-0005Is-W6
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:54:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppqHL-0005Z4-Lh
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682081658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s9p8YU7Kb0dKkjwB9yPgXAdgFCJwdJ0YZMZKhagYr3s=;
 b=b97ZKKEtoiIEct8SWNbvcSM+0TIjw/dAY7scS3TJSl0aD0YbEAowsJHmebi5lgn0ltyByx
 Mo7hR3bQVPc24xu8XuW2iF9z+jSUw+qB9AiCZ0eTBWJcdi3o9TNErylk25c9apj263Pd87
 SF6TeW81l534/3ITilgZNnOtjyYd9rA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-HL1Pb6BTMUSBb4E_WbwY6g-1; Fri, 21 Apr 2023 08:54:16 -0400
X-MC-Unique: HL1Pb6BTMUSBb4E_WbwY6g-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f171d201afso10517635e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 05:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682081656; x=1684673656;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s9p8YU7Kb0dKkjwB9yPgXAdgFCJwdJ0YZMZKhagYr3s=;
 b=TldzK1E/VIioN834h61BBKaf86y9okxITmNLCPzKLVi29FVjupVguepITixZlC+EKm
 W0/5mti1sB1kK+rWQa6GkpeCiloZ9M43Hl5bK8pZ+jUUiZTw/kmTj6PyfnRtXcf1+gA7
 GtScm3y/pKb06EMYCvnV26ku7JY6lWFUckpshLZNL8T+2pAp+46iAWdlY3+YOaYseiA1
 RsM5MoxxL1fnLhBVO+WdjatqCbV27ItBpQpwooqRcl8lUM24MTdNG8bONck3y2O9YPL8
 3TCmJ2Po2xlJxIb6XoO1sNwatXVTrosBMdcqKcnLPPg0fRZUfDx51BpoODdVo5WJyi89
 wPQw==
X-Gm-Message-State: AAQBX9cfawpP5lnPRu3YEHULplU1JsQDzqhLxk0Dt1towbN7NqRXSbH8
 zKqkfHDw8U6/s0//UUoCdgESJugwWwleqlPfJhsysEOGWBvhQBT03k0N6a8bmMBvGixYunqhZNC
 MdP03dmr9sfXHUJQ=
X-Received: by 2002:a1c:7c13:0:b0:3dc:4fd7:31e9 with SMTP id
 x19-20020a1c7c13000000b003dc4fd731e9mr1836891wmc.7.1682081655871; 
 Fri, 21 Apr 2023 05:54:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350aYkC/fXNdiw0TKlS7IsaIv3oCWXvbVP7tlnvlvQ3tYcHKsACA5UCbxwxXYGG9iJcRmn/AQYw==
X-Received: by 2002:a1c:7c13:0:b0:3dc:4fd7:31e9 with SMTP id
 x19-20020a1c7c13000000b003dc4fd731e9mr1836872wmc.7.1682081655571; 
 Fri, 21 Apr 2023 05:54:15 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-20.web.vodafone.de.
 [109.43.178.20]) by smtp.gmail.com with ESMTPSA id
 q10-20020a05600c46ca00b003f1957ace1fsm765624wmo.13.2023.04.21.05.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 05:54:14 -0700 (PDT)
Message-ID: <40bff0e4-3801-7292-0445-1518bae22574@redhat.com>
Date: Fri, 21 Apr 2023 14:54:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Eduardo Lima <elima@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230421124142.2640825-1-berrange@redhat.com>
 <20230421124142.2640825-3-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/2] gitlab: run all jobs with QOM debugging enabled
In-Reply-To: <20230421124142.2640825-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.297, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 21/04/2023 14.41, Daniel P. Berrangé wrote:
> The QMO cast debugging is designed to catch developer mistakes
> and as such should always be enabled during CI runs.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index a6cfe9be97..9151dece6f 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -12,6 +12,7 @@
>       - mkdir build
>       - cd build
>       - ../configure --enable-werror --disable-docs --enable-fdt=system
> +          --enable-qom-cast-debug
>             ${LD_JOBS:+--meson=git} ${TARGETS:+--target-list="$TARGETS"}
>             $CONFIGURE_ARGS ||
>         { cat config.log meson-logs/meson-log.txt && exit 1; }

No, it's better to always enable it again, since it was just switched off by 
accident in the past:

https://lore.kernel.org/qemu-devel/20230417130037.236747-3-thuth@redhat.com/

  Thomas


