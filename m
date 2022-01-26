Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6587949C5A0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 09:57:30 +0100 (CET)
Received: from localhost ([::1]:47770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCe7N-0004ER-9h
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 03:57:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nCe40-0002o9-II
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 03:54:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nCe3y-0004cM-9F
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 03:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643187233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lGT9xdUApTRCxCpPr/6YVmonCdmEbYcsRjoEcoj8zx8=;
 b=gn5Ma7fm7SWJs+wMGqcupFssugPePPHpqXTawccQ8OUL7hYSI1MscLahzoEn7WaKV8Wdvf
 xbSDxP44c8etRUsqyGbqc7NOdPWyXtriUDyZjtgggS460MV7iEGpix84/RwGwOcvhLXfV+
 mF1tCkgd5x5/wZzKlqS9CjhRWmtJ9lY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-zp_-HfFoPhuCgDOE_-hdtA-1; Wed, 26 Jan 2022 03:53:52 -0500
X-MC-Unique: zp_-HfFoPhuCgDOE_-hdtA-1
Received: by mail-wr1-f72.google.com with SMTP id
 a11-20020adffb8b000000b001a0b0f4afe9so3998619wrr.13
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 00:53:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lGT9xdUApTRCxCpPr/6YVmonCdmEbYcsRjoEcoj8zx8=;
 b=Nl6zrbEIMKqXXMhY8kLscx4H2Az74m5zWF7JRU8UGn7WnEuA73jeoCsqhwI/cWekhw
 GxCrun5ZyU7dIwF4F8gwJrWQ+cj1M/103TMFvKpBNwCF4LW0ZOnwJbzFrscQ54m1E63B
 yJ6lo/Mq/7xqmUIHqe3ovXfd8UpIUDWaWFcGz+gXJ581gc1hyuGz3DKzPVlRmZzKx+rX
 FK1ELqZgSfRPReUvYQNBHZGVXkbL1CQAdmvtsGGzh9M3W60OixPVWpIuoAskaInDDdu7
 ZVV2PNExP3+aQvevf5kBLhCAsd6arJmzdYlaTF0knAKEM65vboerVMmKHB89PMHjKamv
 2gqA==
X-Gm-Message-State: AOAM532+3t7Twi+qUD+B6LlK4Y+i2oayGGE3LW5J3uJiTeBLIybVNw5G
 XSUB5VUlsj57zw1/0Y93gKdYGlvv5IEU0NL5/FFXR72LIkbqKECeIOZtxBSMdnrAxNNFCn5/MHi
 Q6uWLwvGYN+PajGU=
X-Received: by 2002:a5d:6ac9:: with SMTP id u9mr19023925wrw.213.1643187231494; 
 Wed, 26 Jan 2022 00:53:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYMvv7Y5NAbZx5x3Ryg+R29v+Vk5kTHOPD/j6Mev01aWKgn5qwvxxVORjnqqe6OPwsgpvyCg==
X-Received: by 2002:a5d:6ac9:: with SMTP id u9mr19023910wrw.213.1643187231322; 
 Wed, 26 Jan 2022 00:53:51 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id l40sm3016387wms.0.2022.01.26.00.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 00:53:50 -0800 (PST)
Message-ID: <87c5cb4f-edbe-6dbc-c6b6-1f34d26a3649@redhat.com>
Date: Wed, 26 Jan 2022 09:53:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] gitlab: fall back to commit hash in qemu-setup filename
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220125173454.10381-1-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220125173454.10381-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Beraldo Leal <bleal@redhat.com>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/2022 18.34, Stefan Hajnoczi wrote:
> Personal repos may not have release tags (v6.0.0, v6.1.0, etc) and this
> causes cross_system_build_job to fail when pretty-printing a unique
> qemu-setup-*.exe name:
> 
>    version="$(git describe --match v[0-9]*)";
>               ^^^^^^^^^^ fails ^^^^^^^^^^^
>    mv -v qemu-setup*.exe qemu-setup-${version}.exe;
> 
> Fall back to the short commit hash if necessary. This fixes CI failures
> that Greg Kurz and I experienced in our personal repos.
> 
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   .gitlab-ci.d/crossbuild-template.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
> index 10d22dcf6c..29c3c2b826 100644
> --- a/.gitlab-ci.d/crossbuild-template.yml
> +++ b/.gitlab-ci.d/crossbuild-template.yml
> @@ -14,7 +14,7 @@
>       - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>       - if grep -q "EXESUF=.exe" config-host.mak;
>         then make installer;
> -      version="$(git describe --match v[0-9]*)";
> +      version="$(git describe --match v[0-9]* 2>/dev/null || git rev-parse --short HEAD)";
>         mv -v qemu-setup*.exe qemu-setup-${version}.exe;
>         fi

Reviewed-by: Thomas Huth <thuth@redhat.com>


