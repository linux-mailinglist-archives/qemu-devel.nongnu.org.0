Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EE93B8E53
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 09:44:23 +0200 (CEST)
Received: from localhost ([::1]:39566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyrN0-00086p-Bf
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 03:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lyrLh-0007Pp-0v
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 03:43:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lyrLc-0000IC-6C
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 03:42:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625125374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29MmYCrWBXI80/H+lX//5jrPNdqvQ46A/GfLl6JQyrw=;
 b=OVpbOFyhqMu+zq9LnH/kkHJFUYW67DOXByeBBwsXxE+OMZ6grKujyelPhuebK2nGQKEBbW
 JsMlRNemy6pi6kMMRMcsyP4DlD98UeQG3NlDy05pBVKRxU50MGHntVEEdiVj86/fPwaElo
 n3UWynH94Y2D6Pj2mhVNMlOlO/XPMW0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-OsQOYVkKNSuKLBal8R1XZw-1; Thu, 01 Jul 2021 03:42:53 -0400
X-MC-Unique: OsQOYVkKNSuKLBal8R1XZw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m40-20020a05600c3b28b02901f42375a73fso1607763wms.5
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 00:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=29MmYCrWBXI80/H+lX//5jrPNdqvQ46A/GfLl6JQyrw=;
 b=ts8QopJZJnLfRZJRmnUDURpMT9jbVT0EREQJvOE8h//xByPF32kLvyLBbi1hPWIR49
 +wcP3x8GONtpDBVyFEszPn2KS9adPbz0O/2hVv5CzFMHoZ4wJRQhZqgsnVhesG6iN2+T
 57oLslIrWG5myAlvSu//u4a2PYyrvBmcpCCVhSxr6A1xpS1Zx71SaUdUvmgnIJDDCAz8
 2oscIrb/5niNVVW14lNzS1F1Rbnv0PeMgrYVe4P9JbgJRTvbQDO6hbD3Rs18UBVPptq8
 JNt646IxQMHhDenkBYlMB1xDDP5tqXJKFhaOlYxrRZSOgLMgMPWBhjzEczKD5fIJ7QdW
 v1kQ==
X-Gm-Message-State: AOAM530bGSpclXmdmSXeqC6/dvyhkMOulxRcKJUHGaKIlv2KJ5us/9KC
 bgqlenFvsMt7TszUCidUGAr8sKf0ksv/CNE3sSHjbAv+YrSdtjfyNzy2qWPbBV8jFgIS46NwxoP
 Ugbt10hQSSvmzL8tIcbKrnO+TCat9HDHVPfPktUI4NepFZ5TMRqq/Y1Oh+cJVl7o=
X-Received: by 2002:a1c:4e10:: with SMTP id g16mr8854355wmh.145.1625125371964; 
 Thu, 01 Jul 2021 00:42:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPxc0Q5EsSZNjxxrtdcxMCzN8bMpZSE0znF4P2zPT+JXWTtcb/+h4WE/Tm3FexPrzgIsC64w==
X-Received: by 2002:a1c:4e10:: with SMTP id g16mr8854333wmh.145.1625125371707; 
 Thu, 01 Jul 2021 00:42:51 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23bca.dip0.t-ipconnect.de. [79.242.59.202])
 by smtp.gmail.com with ESMTPSA id e8sm23763297wrq.10.2021.07.01.00.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 00:42:51 -0700 (PDT)
Subject: Re: [PATCH v2 22/28] target/s390x: Use translator_use_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-23-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <9f22c84a-2354-a3be-c4b6-b3a26345da03@redhat.com>
Date: Thu, 1 Jul 2021 09:42:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630183226.3290849-23-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.06.21 20:32, Richard Henderson wrote:
> Cc: David Hildenbrand <david@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/translate.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/target/s390x/translate.c b/target/s390x/translate.c
> index 03dab9f350..117a890ecd 100644
> --- a/target/s390x/translate.c
> +++ b/target/s390x/translate.c
> @@ -697,12 +697,7 @@ static bool use_goto_tb(DisasContext *s, uint64_t dest)
>       if (unlikely(use_exit_tb(s))) {
>           return false;
>       }
> -#ifndef CONFIG_USER_ONLY
> -    return (dest & TARGET_PAGE_MASK) == (s->base.tb->pc & TARGET_PAGE_MASK) ||
> -           (dest & TARGET_PAGE_MASK) == (s->base.pc_next & TARGET_PAGE_MASK);
> -#else
> -    return true;
> -#endif
> +    return translator_use_goto_tb(&s->base, dest);
>   }
>   
>   static void account_noninline_branch(DisasContext *s, int cc_op)
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


