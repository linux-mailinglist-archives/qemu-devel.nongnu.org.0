Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070EE3D027D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:05:00 +0200 (CEST)
Received: from localhost ([::1]:38562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5vz8-0005v5-Vh
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5vwn-0003BT-Ea
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:02:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5vwh-0004hk-HY
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:02:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626811345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D9epQQuJdcppEcjedvfY1qkWjWCjFkF5Qrndo26n8xs=;
 b=RWk9Su2A36ebvFOGBlM3tf5ge5EqqWg0DGz6D1Y7941pYxG20DNj4OTML+ZCJvZAd6PSwe
 8uIoiIiVtnaXdqhiXHg27C7oYMJUpNylHboUlvZ6Hf9kWV+o16Z9f2qQaWZvJ6977GLgW+
 QPKi0o6PmwBYxVdQUivLbFt9N/re2Bw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-_Rahtb3_MneQf8Vz2wjhCQ-1; Tue, 20 Jul 2021 16:02:23 -0400
X-MC-Unique: _Rahtb3_MneQf8Vz2wjhCQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 r18-20020adff1120000b029013e2b4ee624so10788458wro.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 13:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D9epQQuJdcppEcjedvfY1qkWjWCjFkF5Qrndo26n8xs=;
 b=GZCb65+N4U6eW6imdjbssNkWn9WJNM8mUR4RIUWCpTj9aFPnQoMjQjfQbi+qBumSNb
 ACkEoKAP+EOtXEdjnip1UHdgOXOFQtaWLum2GBjYvnLrgPNHUhUcnxjduec9KLedlJDr
 P76Jr7qmkf5Z9l5AOEAln9jjgBAV1MYAJJZvQeYyuXa/xtGWqlv7O2e0fV2mkVcoF9gf
 O4Ch0RxdNDBRdoOyT7jycUxKp+yjRh9sTqLS2WWpFX5AJn9sRwt4/uYNUQsrSvj2yTjI
 qeCu68rRnwfvZ9EH6RkvicGoQZKXXG/QFwbW/xqinkw24WvZq/sudG/B6x3N/Ul74yed
 1DFA==
X-Gm-Message-State: AOAM533ss5br3INwHI1PaT8Q6ciYoten5vxfD5MAWUp+HfUyykZZRU8J
 LpCEY8aIMRAWYFmCDaAnoER16pAxcQ/+ABTiVb8lyCNjss1z0ofaGcAi32gjt5tKowAsixKa3yW
 r8zRiURTL8lAny8E=
X-Received: by 2002:adf:e3c4:: with SMTP id k4mr37776956wrm.35.1626811342452; 
 Tue, 20 Jul 2021 13:02:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwJ3c4WnVwEkiwXLygP3uCKQYPNDbaRROGY7xxjMYZ/yl0am/mxJQQIdvwpr+bH2Cn1E9hDg==
X-Received: by 2002:adf:e3c4:: with SMTP id k4mr37776928wrm.35.1626811342196; 
 Tue, 20 Jul 2021 13:02:22 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id t9sm23788183wrq.92.2021.07.20.13.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 13:02:21 -0700 (PDT)
Subject: Re: [PATCH-for-6.1?] plugins: Fix physical address calculation for IO
 regions
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210720195735.3934473-1-aaron@os.amperecomputing.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <58b4ab55-6145-78de-e7ae-19e26014e777@redhat.com>
Date: Tue, 20 Jul 2021 22:02:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720195735.3934473-1-aaron@os.amperecomputing.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, cota@braap.org,
 richard.henderson@linaro.org, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 9:57 PM, Aaron Lindsay wrote:
> The address calculation for IO regions introduced by
> 
> commit 787148bf928a54b5cc86f5b434f9399e9737679c
> Author: Aaron Lindsay <aaron@os.amperecomputing.com>
>     plugins: Expose physical addresses instead of device offsets
> 
> is not always accurate.

Indeed unlikely accurate in case of aliases (at least).

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Use the more correct
> MemoryRegionSection.offset_within_address_space.
> ---
>  plugins/api.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/plugins/api.c b/plugins/api.c
> index 5c1a413928..ba14e6f2b2 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -319,7 +319,7 @@ uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
>              return block->offset + offset + block->mr->addr;
>          } else {
>              MemoryRegionSection *mrs = haddr->v.io.section;
> -            return haddr->v.io.offset + mrs->mr->addr;
> +            return mrs->offset_within_address_space + haddr->v.io.offset;
>          }
>      }
>  #endif
> 


