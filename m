Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085EF69353D
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 00:14:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQz4D-0002zH-MB; Sat, 11 Feb 2023 18:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQz47-0002y5-OT
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:13:55 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQz46-0001fU-1n
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:13:55 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 w20-20020a17090a8a1400b00233d7314c1cso1039325pjn.5
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 15:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zwx8hYRnPUnpVHkZAcLyHNAdcAQbI3Xkb22hLfEtkQU=;
 b=W5EygCr8LaIDtYLEM2NMc2IpGtRrqi2v9Db2gJUB4VIpPcb8DhFMtnHcN61Dln7n/u
 WepN2urEZHaQwajkCixH9g/zE+FE2lQva7sWM2k4nyOaJnfFRV8SG/9W1FrEk5UQjoiH
 2pDCHyytRS/cSsGBGoaSJEKIpXJoa3WcriThqdwG8aHxM3qj+Cbx8kXqa60TpOH0FLlA
 +yGX+Zg5lt51RRE+o6SGNqSCNGoXPX/ZKW5Qjl9N09rxPyDb6y8iugsEhyCAMplXF8Fy
 I9rlWeQ+14O4POwtY6tyV9qsiL21gxx97eonoPrh1ZP7hTzKc54tARddrOZfJAiAx34Z
 htBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zwx8hYRnPUnpVHkZAcLyHNAdcAQbI3Xkb22hLfEtkQU=;
 b=7QK1wJ5So05L9luPrxd2EH31aIZkI7etusluFB1tPFFd37UmWl3n3s6EszNPDaWH7o
 aohXcIsfLbgb9y04K6U+IJtAou29H/ar7UFQoYYkaQQkakGCCjy7jOEfyGc1Ct3nA5qt
 cuKovqgNFaizvnLtZ3hKgWOYkyW+pAQGIv+qD0smaxlavrMzGTox59xoh655z4rCyY0y
 Pgd2WF7lHMauQeuNXf+U5Z6l9GugRhtuQof7kg2mlyRLJBD6OBEgNs0xzKgtJJiXRamH
 CISNG12yVw/xaN4IQDNFvDgA0bjXBlo9akfvciWChdxmCW0KK8eLHPS5TXYaSyz54HPz
 whig==
X-Gm-Message-State: AO0yUKX1tDcOa2sjol+MGnFZy/aNxeQ4PR/xybbAmQKlSlRKip2SQZ3U
 +voXdYDI9347Ita513hCxyvIYQ==
X-Google-Smtp-Source: AK7set8WZl/+w40Us6bwu+KgvtGlDrkKf4O6bmRK08tJKhd9GGL0wu1EhORlXrjYnoHRfSSwTkTEqQ==
X-Received: by 2002:a05:6a20:12c7:b0:bd:6106:423f with SMTP id
 v7-20020a056a2012c700b000bd6106423fmr12011845pzg.9.1676157231505; 
 Sat, 11 Feb 2023 15:13:51 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 x24-20020a63db58000000b004df4fbb9823sm4778966pgi.68.2023.02.11.15.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 15:13:50 -0800 (PST)
Message-ID: <16b47168-39fe-ac65-741d-5786663a7a9d@linaro.org>
Date: Sat, 11 Feb 2023 13:13:46 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 8/9] bsd-user: implement sysctlbyname(2)
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-9-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210231829.39476-9-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/10/23 13:18, Warner Losh wrote:
> From: Kyle Evans <kevans@FreeBSD.org>
> 
> do_freebsd_sysctlbyname needs to translate the 'name' back down to a OID
> so we can intercept the special ones. Do that and call the common wrapper
> do_freebsd_sysctl_oid.
> 
> Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-sys.c     | 58 +++++++++++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c |  4 +++
>   2 files changed, 62 insertions(+)
> 
> diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
> index 13736936e5f..62c729dfe47 100644
> --- a/bsd-user/freebsd/os-sys.c
> +++ b/bsd-user/freebsd/os-sys.c
> @@ -345,6 +345,64 @@ out:
>       return ret;
>   }
>   
> +/*
> + * This syscall was created to make sysctlbyname(3) more efficient.
> + * Unfortunately, because we have to fake some sysctls, we can't do that.

Can't do what?  Directly use sysctlbyname?

> +    if (oldlenp) {
> +        if (get_user_ual(oldlen, oldlenp)) {
> +            return -TARGET_EFAULT;
> +        }

Same comment about verifying write early.

> +    unlock_user(holdp, oldp, holdlen);

And writeback vs error.


r~

