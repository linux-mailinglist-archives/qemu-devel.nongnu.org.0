Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DB03BC1FF
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 19:03:14 +0200 (CEST)
Received: from localhost ([::1]:43482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0S00-0006yH-V0
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 13:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0RvK-0003j4-I9
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:58:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0RvJ-0006Sb-2B
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:58:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625504300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OzllJdtYEDgqsY6YQcbUuX8i6ZTlaiE8x2Kjlr2aXq4=;
 b=Ll93Oz229wmz55jaCuxMB4wKm1bJzXln81hwZmZRyjjgnaq7GIVwygUXqoA4eAoxjAvFZi
 MUqz++U7dT2OiEXaXRN7VOzZo7Km7jeQ3+PcoqKfKCH+SL3UD7qPYE9DkHLaN4KXh1LtgG
 5JjpuKZk/krTjpZsI8M4efVwI3yNd84=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-gYZtoVkUPw67hbqmBgyKRA-1; Mon, 05 Jul 2021 12:58:19 -0400
X-MC-Unique: gYZtoVkUPw67hbqmBgyKRA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m6-20020a05600c4f46b0290205f5e73b37so152517wmq.3
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OzllJdtYEDgqsY6YQcbUuX8i6ZTlaiE8x2Kjlr2aXq4=;
 b=XJyWyZfV6jxmRL5HZsit/sKEdJ5x+igZNxybQuQKYJN1VxAFtgbpRv0fftGYHwOIH8
 /lJlf/9FiiJj3ylapQkpDR7+1690ANDMaI5yCEvM+Ar5JFwoY/+whP84z2mFLp95rS3A
 q3FavvGUajgk2kS/cyHt2Sjbq1r0CpvUvCE6yjc8Xa/6GVb0hDTYQ6IQ85yBetrfAMe2
 NM+blB0fMlKXj1h+eC0CW02RFMiPNlPO/Mlfx4KEYyfkexxY5UKL/FyTN31HLXKgUrPe
 97BZ3l/hVRp5U1YAf6M9Ih3SpMeOfRZlEMPFdFARdyxbcgkBxfpMtTfngr5NhWq42RE0
 8TFg==
X-Gm-Message-State: AOAM532I8UiokuhH3CSR7q6P3bvxHP77ukLHkDwlENkvhx3H/tZYWirh
 wq813IJoYo6WADYN624yLELmeh6m8w2AIT6E/Bwe78bwDpvZLi5uVCAMoIQB80ZblHvnrdtIC4U
 TdGyEJTrUmpvW6dY=
X-Received: by 2002:a05:600c:b59:: with SMTP id
 k25mr56078wmr.117.1625504298156; 
 Mon, 05 Jul 2021 09:58:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/fAAkdpmvYGDYLLwqgGkSsWMANrKoUdkbUlxyWZFrGaRqA+cqYLDpIYh+CPwiZX7Ld5ZXpA==
X-Received: by 2002:a05:600c:b59:: with SMTP id
 k25mr56064wmr.117.1625504297986; 
 Mon, 05 Jul 2021 09:58:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r15sm68683wmq.15.2021.07.05.09.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 09:58:17 -0700 (PDT)
Subject: Re: [PATCH] Makefile: Remove /usr/bin/env wrapper from the SHELL
 variable
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210705082542.936856-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bd20ba33-796c-e541-8c9b-2fc6e45b2cfe@redhat.com>
Date: Mon, 5 Jul 2021 18:58:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705082542.936856-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: qemu-trivial@nongnu.org, Richard Zak <richard.j.zak@gmail.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/21 10:25, Thomas Huth wrote:
> The wrapper should not be needed here (it's not the shebang line of
> a shell script), and it is causing trouble on Haiku where "env"
> resides in a different directory.
> 
> Reported-by: Richard Zak <richard.j.zak@gmail.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 30f19d33bb..6c36330eef 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -14,7 +14,7 @@ SRC_PATH=.
>   # we have explicit rules for everything
>   MAKEFLAGS += -rR
>   
> -SHELL = /usr/bin/env bash -o pipefail
> +SHELL = bash -o pipefail
>   
>   # Usage: $(call quiet-command,command and args,"NAME","args to print")
>   # This will run "command and args", and either:
> 

Queued, thanks.

Paolo


