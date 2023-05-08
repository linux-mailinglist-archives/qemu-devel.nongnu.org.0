Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7616FB2D2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 16:29:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw1q0-00034m-Mk; Mon, 08 May 2023 10:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw1po-00030Y-Sy
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:27:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw1pb-0004MX-Kk
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683556034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=It9rsfOU8u50YONqSComi05ZejjnawOiDL0kVdJb9/Y=;
 b=TjReOsY6GCjE3E6710TpDNmXYGPzdbaAsUP8Hp4tROej2RMZ+2pXcmZTV9B+RkgmbbI6sW
 +KqLJ7N8EPlUi+eJsGz8NaSWzlWD81Nemj3MqjztUyy8//38n2BO87UIRZh3G/WXXkZit3
 wf66V+chguiBEXyuFtfrP30IS3kmdhs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-4yKj_Vh9NOOyRCbBBZXu2Q-1; Mon, 08 May 2023 10:27:12 -0400
X-MC-Unique: 4yKj_Vh9NOOyRCbBBZXu2Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-306489b7585so1552432f8f.3
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 07:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683556032; x=1686148032;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=It9rsfOU8u50YONqSComi05ZejjnawOiDL0kVdJb9/Y=;
 b=AV0Q+8xZKYykplPuvevqb9+zZdw3c3Tkl9zzc/9TPUsl5E48+ATBlUNvKDKq8924K/
 FzbScbgfMO6vBu2oI/923WECKOe+EXZeDGmL+OzHkXZ4VEGA5HTI1NMeQoJTcTTtOsRV
 yx72Yna2e6VxpICdYaMhLvGGtPlp3YPQVWKRgYJ+Ew/lYFyCtUnW6xoDs62Y6eYBf6Qu
 KcdDJHrMqBlKEaE8oDXPXZVCJDt54OvSyRf5stF27TADvdQY/cyobXqu2P2AfKUioOGL
 u0qpxNYrlkjc4dm3OR5UF813WteR72BZ5pI62zAmwyxTS+p3+/ybC3kVpy00jFFWMYkv
 KZ9w==
X-Gm-Message-State: AC+VfDyIjlVVisgPc5XP/x97Zg90gxxfXTH1J1y091uju+754gFZBRpl
 V3djvJa1kj/ZYzmSL0WWjoxEQSa8va2vmlVOcLAuOKDCONJtuuZM64u7kNUea4fG2sL3VbCTO/9
 RtdiLp7fqtJnDOsI=
X-Received: by 2002:adf:ec41:0:b0:307:8ad1:4932 with SMTP id
 w1-20020adfec41000000b003078ad14932mr5039754wrn.11.1683556031871; 
 Mon, 08 May 2023 07:27:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5G9HYU4SUYOkBUxIj3T8WJ54QTlybZ6efzcFN8PTLEFMl0JI1ZFVGl5eoO5+9rh/VYQ05uhg==
X-Received: by 2002:adf:ec41:0:b0:307:8ad1:4932 with SMTP id
 w1-20020adfec41000000b003078ad14932mr5039739wrn.11.1683556031611; 
 Mon, 08 May 2023 07:27:11 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-212.web.vodafone.de.
 [109.43.179.212]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm11511830wrq.82.2023.05.08.07.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 07:27:11 -0700 (PDT)
Message-ID: <c0e49af2-21dd-03db-0604-194a298d7a58@redhat.com>
Date: Mon, 8 May 2023 16:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 83/84] exec/poison: Do not poison CONFIG_SOFTMMU
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-84-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503072331.1747057-84-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 03/05/2023 09.23, Richard Henderson wrote:
> If CONFIG_USER_ONLY is ok generically, so is CONFIG_SOFTMMU,
> because they are exactly opposite.

I thought there was a difference ... at least in the past?
But looking at meson.build they seem to be handled quite equally now:

common_ss.add_all(when: 'CONFIG_SOFTMMU', if_true: [softmmu_ss])
common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)

Paolo, do you remember whether there was a difference in the past?

Anyway, as far as I can see, it should be fine now, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>


> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/poison.h         | 1 -
>   scripts/make-config-poison.sh | 5 +++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/exec/poison.h b/include/exec/poison.h
> index 256736e11a..e94ee8dfef 100644
> --- a/include/exec/poison.h
> +++ b/include/exec/poison.h
> @@ -85,7 +85,6 @@
>   #pragma GCC poison CONFIG_HVF
>   #pragma GCC poison CONFIG_LINUX_USER
>   #pragma GCC poison CONFIG_KVM
> -#pragma GCC poison CONFIG_SOFTMMU
>   #pragma GCC poison CONFIG_WHPX
>   #pragma GCC poison CONFIG_XEN
>   
> diff --git a/scripts/make-config-poison.sh b/scripts/make-config-poison.sh
> index 1892854261..2b36907e23 100755
> --- a/scripts/make-config-poison.sh
> +++ b/scripts/make-config-poison.sh
> @@ -4,11 +4,12 @@ if test $# = 0; then
>     exit 0
>   fi
>   
> -# Create list of config switches that should be poisoned in common code...
> -# but filter out CONFIG_TCG and CONFIG_USER_ONLY which are special.
> +# Create list of config switches that should be poisoned in common code,
> +# but filter out several which are handled manually.
>   exec sed -n \
>     -e' /CONFIG_TCG/d' \
>     -e '/CONFIG_USER_ONLY/d' \
> +  -e '/CONFIG_SOFTMMU/d' \
>     -e '/^#define / {' \
>     -e    's///' \
>     -e    's/ .*//' \


