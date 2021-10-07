Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B4142599C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:37:39 +0200 (CEST)
Received: from localhost ([::1]:40024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXKs-0004cF-9J
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mYXFz-0003om-4m
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:32:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mYXFu-000327-Ek
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633627948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=11xzt5wUQomY+/TgZv1nuPItbnvvV/2s+Kj9iJj/pio=;
 b=Vu6VWV45+qIUPhP2rfiA3g0GcK6Y0IrhAZ0Qp3nBcrLkaET6uhKcGaRudtLbCRj8CmF6m+
 AAoP/QRtCUdnkPuTIp+Xhun3gRvCpCBYjGQBzApv0XxRWDCboq8aHddtBoK+m+B8mqbzJe
 tUQHsJhrXOo8mwkGFsB0gNjf5yQde/g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-1hjSHqqiNP6Y9CURXGgGzA-1; Thu, 07 Oct 2021 13:32:27 -0400
X-MC-Unique: 1hjSHqqiNP6Y9CURXGgGzA-1
Received: by mail-wr1-f69.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so5298540wrh.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=11xzt5wUQomY+/TgZv1nuPItbnvvV/2s+Kj9iJj/pio=;
 b=vEdKWDKJ6jQAaFtkMcKhwzgez6VjnttACY2NnehRc8sv/BtsTmMFx8O1u/QeQ3T56A
 ezGFTehISOE0p0zjMQ2LVNPZ9sZoI2XaYEoOnhFUF5PN8XxUY3/aA+oSwHlb86P6pv2c
 pSgcxQ0v7poEYwEIeO49BkUAsJ52ofGSvJE9xjBHGG7bPezAit4+H21z5wTdoYbcgEPu
 Q3zxlLrEanA9JxvssP1cOdD6jGWA2SFrVQdumG5L3jfgz3KGxmv7IYfv96+RTze/d3XX
 Y6l79QVDGGmjODKumPWSq6D75ZS6/KbHjn3diAkTesP+OFhVQ/99XUK8Q3flsyuSYTFM
 SoUA==
X-Gm-Message-State: AOAM530dgsrekj7kPELlAhT5ABuPAJXgA6qTCQODH2ij+SLfJ6Y6uJG1
 eqGDZg3Kfs3OG5XiAmtzKT5GinFtxHI675p4EXcSaa43gX5RcTeXpuBWnwPg6dP/Si1u5PiOt4I
 qbidjy552fjxQt4A=
X-Received: by 2002:a05:600c:a05:: with SMTP id
 z5mr5987516wmp.73.1633627946606; 
 Thu, 07 Oct 2021 10:32:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfGbxGnoxPCZmlgkneUZv0QPxc6BkMX9FpBYvS9MHUDGycFdXmSRlTz8w06COy9NZmHCpMAw==
X-Received: by 2002:a05:600c:a05:: with SMTP id
 z5mr5987494wmp.73.1633627946378; 
 Thu, 07 Oct 2021 10:32:26 -0700 (PDT)
Received: from thuth.remote.csb (p549bb2bd.dip0.t-ipconnect.de.
 [84.155.178.189])
 by smtp.gmail.com with ESMTPSA id e8sm8823925wme.46.2021.10.07.10.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 10:32:25 -0700 (PDT)
Subject: Re: [PATCH 01/24] configure: remove --oss-lib
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130630.632028-2-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <41e2074c-2af2-2388-e7ba-23735a96a777@redhat.com>
Date: Thu, 7 Oct 2021 19:32:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007130630.632028-2-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/10/2021 15.06, Paolo Bonzini wrote:
> OSS is a kernel API, so the option should not be needed.  The library
> is used on NetBSD, where OSS is emulated, so keep the variable.
> 
> Cc: Gerd Hoffman <kraxel@redhat.com>
> Cc: Volker Rümelin <vr_qemu@t-online.de>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/configure b/configure
> index 877bf3d76a..ab6bc0c994 100755
> --- a/configure
> +++ b/configure
> @@ -1007,8 +1007,6 @@ for opt do
>     ;;
>     --enable-gettext) gettext="enabled"
>     ;;
> -  --oss-lib=*) oss_lib="$optarg"
> -  ;;
>     --audio-drv-list=*) audio_drv_list="$optarg"
>     ;;
>     --block-drv-rw-whitelist=*|--block-drv-whitelist=*) block_drv_rw_whitelist=$(echo "$optarg" | sed -e 's/,/ /g')
> @@ -1815,7 +1813,6 @@ Advanced options (experts only):
>     --disable-slirp          disable SLIRP userspace network connectivity
>     --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter, experimental and slow)
>     --enable-malloc-trim     enable libc malloc_trim() for memory optimization
> -  --oss-lib                path to OSS library
>     --cpu=CPU                Build for host CPU [$cpu]
>     --with-coroutine=BACKEND coroutine backend. Supported options:
>                              ucontext, sigaltstack, windows
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


