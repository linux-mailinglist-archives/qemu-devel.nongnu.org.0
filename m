Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E66A2ECED7
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 12:38:11 +0100 (CET)
Received: from localhost ([::1]:51656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxTcI-00032i-JE
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 06:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxTan-0001Yr-CK
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:36:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxTal-0007ng-O5
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610019395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U8pBOA7300rbnX06Pw/WnUUZXYB0fbS4PYDGFY0etfc=;
 b=F9yM/aVvOnRJGX59ladgmPq8YhoR7OP4FcEZ74wkc/K28ImJPRcJdhEGkYi7Gk0OVxAuxX
 mP/e3RIcU7qIW2/Ritff8HWA9IXuOfAPOLs1mq2s3mluO5uoX6qS3v2qJR6GrGa0VKPeXJ
 eBR0+uN62P2ivp9KxPbbUveJNsrrk8U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-vJmAkP7UPAOXqMphyQpiuQ-1; Thu, 07 Jan 2021 06:36:33 -0500
X-MC-Unique: vJmAkP7UPAOXqMphyQpiuQ-1
Received: by mail-wm1-f69.google.com with SMTP id r5so2180060wma.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 03:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U8pBOA7300rbnX06Pw/WnUUZXYB0fbS4PYDGFY0etfc=;
 b=TJyLJ10UcoVSCw2lYVOR2gGOpxTnEJrwRNYMGJv6Fbn1r5EYLD0yozR6t6sdZcrz22
 /iSDCIrp+ZHDraNeX0EX8PA+C+pjFZHEe26jvbGA6m1V9/dInpzgwc/eN9SgniLITfgK
 3NaF0WaC032ORzlGJJ9ZJ3VJjPkn86QeHcan60T++L50D238LlG8eZSf12rf0bwYFRLN
 P+g0+hpU85yMc9yJ28ognbUh4Hy0SPkTDop/XKKNs96QiWqB1f7eNgiyK1frPBEB8//4
 o3+nZj3UYh+Mkps8NHOGGb2puNbqCqB4TZsV1iulotQlAnI1VhoFQmfAC+4HL5qbAR+r
 h8GQ==
X-Gm-Message-State: AOAM533bmVBSvF58gG3RHUlAswLgeYDDjqTEPq4fgUSgB6WCmvM3b+eI
 t8L+m6m+Qtx9/UljQCv7m+XzJ7amXkNNrxn21EtL6nEMXA4aS3XsTS5F0XtgdmvsruV+SLuQAc/
 h7X+uwDuJynSD4Ls=
X-Received: by 2002:a7b:cbcc:: with SMTP id n12mr7584916wmi.23.1610019392368; 
 Thu, 07 Jan 2021 03:36:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMqIHyMtGm+D0tb1m6vZ7DgwSK9HdzL+qlh8h21QGVj3UPNmUiVhJ9EHfnf/FthsUHvOysuA==
X-Received: by 2002:a7b:cbcc:: with SMTP id n12mr7584889wmi.23.1610019392096; 
 Thu, 07 Jan 2021 03:36:32 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id l16sm7838908wrx.5.2021.01.07.03.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 03:36:31 -0800 (PST)
Subject: Re: [PATCH v2] meson: fix Cocoa option in summary
To: Chris Hofstaedtler <chris@hofstaedtler.name>, qemu-devel@nongnu.org
References: <20201230221623.60423-1-chris@hofstaedtler.name>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <13aacba5-b1b1-f2bf-22db-3eb88be26447@redhat.com>
Date: Thu, 7 Jan 2021 12:36:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201230221623.60423-1-chris@hofstaedtler.name>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/12/20 23:16, Chris Hofstaedtler wrote:
> Cocoa support was always shown as "no", even it if was enabled.
> 
> Fixes: b4e312e953b ("configure: move cocoa option to Meson")
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Chris Hofstaedtler <chris@hofstaedtler.name>
> ---
>   meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 372576f82c..1112ca8fc2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2082,7 +2082,7 @@ summary_info += {'strip binaries':    get_option('strip')}
>   summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
>   summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
>   if targetos == 'darwin'
> -  summary_info += {'Cocoa support': config_host.has_key('CONFIG_COCOA')}
> +  summary_info += {'Cocoa support': config_host_data.get('CONFIG_COCOA', false)}
>   endif
>   # TODO: add back version
>   summary_info += {'SDL support':       sdl.found()}
> 

Queued, thanks.

Paolo


