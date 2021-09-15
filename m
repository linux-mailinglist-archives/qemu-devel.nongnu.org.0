Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C7E40CEFB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 23:47:09 +0200 (CEST)
Received: from localhost ([::1]:35130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQckG-0004iU-TY
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 17:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQcaE-0006t9-Mt
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:36:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQca8-0006v4-79
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631741797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BORSjSfbNvpvUxtyAsGETSrImGVciqjJRsiTFdVXq4U=;
 b=Yh2sP59e1jp7PvaZP5mIZ0owSNpEKSsi+V+bE/RnCHNhR6jxGNhC/I8vRtPgzNSr+4Fqvt
 X4Ve8l3qoG059e/0Yv32p8j+nASaFY72OYXvXgthA0ASJ/uaWrWaxYFDOwYemwQrSry47i
 WP8dk+3plkb67AARZ7MJ8Mb3DlwQt9Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-wog27YL_OSenzy0arkde_A-1; Wed, 15 Sep 2021 17:36:34 -0400
X-MC-Unique: wog27YL_OSenzy0arkde_A-1
Received: by mail-wm1-f69.google.com with SMTP id
 x10-20020a7bc76a000000b002f8cba3fd65so2111030wmk.2
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 14:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BORSjSfbNvpvUxtyAsGETSrImGVciqjJRsiTFdVXq4U=;
 b=E7B/K6KIKL22s3JqFoieXmed0PePSZvBGCO9EYJTv34wSuApFDDIPqXeyaoNJNO0b3
 x7VaK23fDHLaL8fpHfg23RhXYHvlDNWlQQkhxKvGOqIJU1d0NKo8jCMU6KA2E9ODyun0
 KMt1BA5uLXy9albtArMBBDNisbZYjm9pt45FXiOOonLVPDphl14Dc1UQj4CIY8YEPp4Y
 TG64mZL06I4k5wh2NVmneS0QLHqe5rX8EOOGjNt0/PIQXl0OT8T++DS8kLIx1VX87+hy
 5+Tw+RTUHrEyK7e2V7YjfEP6lfqk1NSqoswoAw62WMajgA196e8ZyqYoJJuZb5QC6K2V
 Srdw==
X-Gm-Message-State: AOAM530A44DPQ4+dqqIoDYRJppVqABwT6kjp4SjA7VuqB4kxm1jgYPUn
 zF2v0KfnZwLTfRxuNnWj6jHzMpyFP6NedcH68VciZQPITYu4KzT0GDTUcfBtuPaHz824EqbGY45
 WM54l4iiJRMfzxfE=
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr2305877wrq.359.1631741793361; 
 Wed, 15 Sep 2021 14:36:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxktvJZZqy79tCPyxImX6dmvisXSUjrTVxhyVYSeuFnmKZRFGm7NS6chSO2Saq4ZE5/RdUFvQ==
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr2305856wrq.359.1631741793081; 
 Wed, 15 Sep 2021 14:36:33 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id m4sm5569417wml.28.2021.09.15.14.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 14:36:32 -0700 (PDT)
Subject: Re: [PATCH] qemu-storage-daemon: Only display FUSE help when FUSE is
 built-in
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210816180442.2000642-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <152eb50e-621f-cbac-4748-dc689aa08635@redhat.com>
Date: Wed, 15 Sep 2021 23:36:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816180442.2000642-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qing Wang <qinwang@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping & Cc'ing qemu-trivial@ (reviewed twice) ...

On 8/16/21 8:04 PM, Philippe Mathieu-Daudé wrote:
> When configuring QEMU with --disable-fuse, the qemu-storage-daemon
> still reports FUSE command line options in its help:
> 
>   $ qemu-storage-daemon -h
>   Usage: qemu-storage-daemon [options]
>   QEMU storage daemon
> 
>     --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>
>              [,growable=on|off][,writable=on|off]
>                            export the specified block node over FUSE
> 
> Remove this help message when FUSE is disabled, to avoid:
> 
>   $ qemu-storage-daemon --export fuse
>   qemu-storage-daemon: --export fuse: Invalid parameter 'fuse'
> 
> Reported-by: Qing Wang <qinwang@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  storage-daemon/qemu-storage-daemon.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
> index fc8b1506297..10a1a33761d 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -98,10 +98,12 @@ static void help(void)
>  "                         export the specified block node over NBD\n"
>  "                         (requires --nbd-server)\n"
>  "\n"
> +#ifdef CONFIG_FUSE
>  "  --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>\n"
>  "           [,growable=on|off][,writable=on|off]\n"
>  "                         export the specified block node over FUSE\n"
>  "\n"
> +#endif /* CONFIG_FUSE */
>  "  --monitor [chardev=]name[,mode=control][,pretty[=on|off]]\n"
>  "                         configure a QMP monitor\n"
>  "\n"
> 


