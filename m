Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7796946F46E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 20:57:16 +0100 (CET)
Received: from localhost ([::1]:60038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvPXX-0002X7-3M
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 14:57:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mvPVr-0001lf-9C
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 14:55:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mvPVo-0002Ma-N0
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 14:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639079728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uk7uMAHDKmdaGMKUi02uUz6JmVOrH66Prv2QJ9LyOAM=;
 b=Hv1wnwFEId02h8NVF+0KzJy+jqNL7PpVirpqVFAT/+WNwsvsFAz0QyMUrfxFuJhovJd+s5
 Qh+hYxlb3rhqxvMvMSJJYQ+R/yF59sk7wwU/GhkhAu76VXL3bbs0TU0++ucFYpF7RCC25/
 skHlZNb3ks5J+GNmqSImYy5R3oOgHfI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-GG74anJnNC2hlseM1u45NQ-1; Thu, 09 Dec 2021 14:55:26 -0500
X-MC-Unique: GG74anJnNC2hlseM1u45NQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j71-20020a1c234a000000b00342f418ae7cso5389440wmj.1
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 11:55:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Uk7uMAHDKmdaGMKUi02uUz6JmVOrH66Prv2QJ9LyOAM=;
 b=R8/HIS/LfcXq0E2XIt0mMerR1jaKn6M4cA70SHmtZjG6pl1YQbaf4NUL9rBK5SMNwK
 T0ErKc+Du28BloZZumom+WWeozKxBMR3pux9fyjiFAaWQ4Z0tjNDsBciOiiJppq3kSLl
 ZJysFvAvs+DoKVy4QVb+AdBxXXteVF+oJFGbmWflTNqSnCpYZgCorbpG4J9nsQs4ZCT6
 K5Ibd7YJ2Ena6AwCxSdUzSNGeOeFByIJYFIOgjm5MXQEdpJi2y5hPRt+/3cBbrpqs1PA
 hgEMP0PMDC90iHRC8JwxraZnoLyONh4TiXxS7+AB20lhYQWXypnDxiaVCGvJj5AGKBVL
 WYxg==
X-Gm-Message-State: AOAM53385ZPTCkgJ0EZZpag9ysr8Z+DnXkTya3/rlsrgWasgYaebji9z
 LI6AAtdL/jURftSH998Uep4/nw3tWvPt6b58uzHfJ3wpYuKUyg/Z+0/9fITzvmKRbOKWaHR4hD5
 ICXjR0j8Pvd/tJIg=
X-Received: by 2002:a05:600c:4113:: with SMTP id
 j19mr10250033wmi.48.1639079725819; 
 Thu, 09 Dec 2021 11:55:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsRoZ0BwanbYln9fQVbwCxfAeyQlHnNP92A4rtl7SDF6hsfTQED2lm1ayb2KQDGkYQca3FkA==
X-Received: by 2002:a05:600c:4113:: with SMTP id
 j19mr10250004wmi.48.1639079725582; 
 Thu, 09 Dec 2021 11:55:25 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id b6sm10218067wmq.45.2021.12.09.11.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 11:55:25 -0800 (PST)
Message-ID: <87feaefc-b102-6be6-f3ac-dde4c8cdb0e5@redhat.com>
Date: Thu, 9 Dec 2021 20:55:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 for-7.0] scripts: Explain the difference between
 linux-headers and standard-headers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20211209194532.1502920-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211209194532.1502920-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.803, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/12/2021 20.45, Peter Maydell wrote:
> If you don't know it, it's hard to figure out the difference between
> the linux-headers folder and the include/standard-headers folder.
> So let's add a short explanation to clarify the difference.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1 of this was from Thomas; I suggested some expanded wording
> and since that made the patch pretty much entirely my text
> Thomas suggested I send this under my name.
> ---
>   scripts/update-linux-headers.sh | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
> index fea4d6eb655..d23851e1d3b 100755
> --- a/scripts/update-linux-headers.sh
> +++ b/scripts/update-linux-headers.sh
> @@ -9,6 +9,22 @@
>   #
>   # This work is licensed under the terms of the GNU GPL version 2.
>   # See the COPYING file in the top-level directory.
> +#
> +# The script will copy the headers into two target folders:
> +#
> +# - linux-headers/ for files that are required for compiling on a
> +#   Linux host.  Generally we have these so we can use kernel structs
> +#   and defines that are more recent than the headers that might be
> +#   in /usr/include/linux on the host system.  Usually this script
> +#   can do simple file copies for these headers.
> +#
> +# - include/standard-headers/ for files that are used for guest
> +#   device emulation and are required on all hosts.  For instance, we
> +#   get our definitions of the virtio structures from the Linux
> +#   kernel headers, but we need those definitions regardless of which
> +#   host OS we are building on.  This script has to be careful to
> +#   sanitize the headers to remove any use of Linux-specifics such as
> +#   types like "__u64".  This work is done in the cp_portable function.

Thanks!

Reviewed-by: Thomas Huth <thuth@redhat.com>


