Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7172B8B78
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 07:17:53 +0100 (CET)
Received: from localhost ([::1]:53148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfdGS-0006MA-4g
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 01:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfdFA-0005ol-4B
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 01:16:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfdF7-0000Kh-RB
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 01:16:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605766589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbHyCtp+i1fvPbHkSGWSGE/0YuWHbPHq6tdTqbkZr/U=;
 b=GT5A5H5dnpFAxm4Gn21xDpl2WS/ZZ3raEtyb1I3V7YAveEZzzPlJnOBPSazJpEaHL23RHQ
 CtWqharkpQFtTRMDZ7lC/L13Ryxg87IIw3V2zcdtI6uKuMoLRJgaqivKCLqsBOH5CWG9iW
 ng7buN5jyumrjdwcGYVQC4QXcEnOzec=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-mocz2jKJPYSu7RDvSKayCQ-1; Thu, 19 Nov 2020 01:16:25 -0500
X-MC-Unique: mocz2jKJPYSu7RDvSKayCQ-1
Received: by mail-wr1-f71.google.com with SMTP id v5so1674337wrr.0
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 22:16:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wbHyCtp+i1fvPbHkSGWSGE/0YuWHbPHq6tdTqbkZr/U=;
 b=jENr33+vuF5ybm7+gEksy9UuGIYxZHmjnLeVUds2Pc6WxMI8G8eREBtNjfiPWzuwl7
 zKd85n+aJ2go+ainQ0PetNoMMxiZP3TOtCn6XtUPu+YvqgXEZUm81JC34VtMvBDveGbj
 Wm4vf34hJ0c8ezFMwT6bh32vNp3a7ZeSVwxnKJEFom1WvVb7YMx8lNUfHNF+nBnSHF9n
 LxzN8mDLA6SQcdZVbnrOTwe32CZWSaGFJWizim9i9QOlrxYsz2QTLXD/fkFF1QpKZ+Jr
 VMwM8WwgcBGiadYyUydwxo2uQgMKazuN5iqK29voN1Qcz5Jc4wYEy/srlAwkuMziU+My
 ocSQ==
X-Gm-Message-State: AOAM5300keQ/A8zKfj/nnp1HBa82DjwNioNOUWr2+Q/0WN3vf/2PJyz2
 fh2cBqCWjy/4x7Glu4Vd5Q5ZKi0fLbU8k3mXmv4To4gXBOV6fgVjUyzkvUcIjs5YvCrRjXHDE1s
 qLeLL3tiQAhcCtk0=
X-Received: by 2002:a1c:2645:: with SMTP id m66mr780399wmm.66.1605766584072;
 Wed, 18 Nov 2020 22:16:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0QAO69GDyg2Y/Hcee9YCbfzyknyVRUInBC5/2y5G9lpVvZ4lFavl3286KscAguUyev5urew==
X-Received: by 2002:a1c:2645:: with SMTP id m66mr780376wmm.66.1605766583886;
 Wed, 18 Nov 2020 22:16:23 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id k16sm38008476wrl.65.2020.11.18.22.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 22:16:23 -0800 (PST)
Subject: Re: [PATCH] display/vmware_vga: Fix bad printf format specifiers
To: Alex Chen <alex.chen@huawei.com>, quintela@redhat.com, pbonzini@redhat.com
References: <20201119030151.87393-1-alex.chen@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7eca99aa-54c9-de70-cb72-25cd6f805128@redhat.com>
Date: Thu, 19 Nov 2020 07:16:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201119030151.87393-1-alex.chen@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 01:09:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 11/19/20 4:01 AM, Alex Chen wrote:
> We should use printf format specifier "%u" instead of "%d" for
> argument of type "unsigned int".
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  hw/display/vmware_vga.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
> index bef0d7d69a..f93bbe15c2 100644
> --- a/hw/display/vmware_vga.c
> +++ b/hw/display/vmware_vga.c
> @@ -534,7 +534,7 @@ static inline void vmsvga_cursor_define(struct vmsvga_state_s *s,
>  #endif
>          break;
>      default:
> -        fprintf(stderr, "%s: unhandled bpp %d, using fallback cursor\n",
> +        fprintf(stderr, "%s: unhandled bpp %u, using fallback cursor\n",
>                  __func__, c->bpp);

The format fix is correct, but since you change that line,
"fprintf(stderr)" is old code, nowadays we prefer get rid of it
by using warn_report() in place (see "qemu/error-report.h").

Preferably using warn_report():
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>          cursor_put(qc);
>          qc = cursor_builtin_left_ptr();
> 


