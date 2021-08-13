Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F5F3EB590
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 14:31:24 +0200 (CEST)
Received: from localhost ([::1]:48382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEWLL-0004Eg-PH
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 08:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mEWJB-0002tf-F8
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 08:29:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mEWJ8-0000TY-CD
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 08:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628857744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L4P+Gl9/zlz0S399GeY7IbVz31asn1/6du/0scalYGE=;
 b=VCjfH9LTLWaXdbNA9ulRka15iUYLWUArVGgumZ+d6poG9AIC53/TcuLaKKX5MWQ0xv86Ee
 4r6ujgF9ImpRsZ85nUSKWL8YvcJMh7KNFj9Ciq4OrlcLr8EZtMjrUK81bEWSwECHnfLlHP
 4JjQ+fH5dsyNOV74JcpgLeQ3EZGcty4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-u9HQ3NMDNs-fAFpWoJ5hog-1; Fri, 13 Aug 2021 08:29:03 -0400
X-MC-Unique: u9HQ3NMDNs-fAFpWoJ5hog-1
Received: by mail-wm1-f69.google.com with SMTP id
 b196-20020a1c80cd0000b02902e677003785so4665546wmd.7
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 05:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L4P+Gl9/zlz0S399GeY7IbVz31asn1/6du/0scalYGE=;
 b=VyfBD9Ma4XgUgLXhIF0D/xVkMle9B6ygswEfx/maw2dBKyMnCpYOm7cqLos8g8gEhn
 4T1A7RwpF4/CMfxvwcpV8fNc9xyJALGq3AJfFD8itjKGE2jMMkIjUYLG3N3TzVyznqep
 uDNY2U8nMWxXaWLTCs2oU9aSzA8K/a3rswxpKl7TGrySlOfLlfLWw0GKQxEkZ3rmMakn
 JvcVCauviFzS+/wrvNr4zKdriPPk1vhx+p1xtj7i5Q9tlMuDE5AYVvuF1FWI7dz+YZSO
 xlS9AjZ+WhAVWTes2niilDMo/xiJH/+8UxdJ7J/4Cgb3rPa00Q2gX2g1G2I0ctQGfIEK
 Gtsg==
X-Gm-Message-State: AOAM5322HSNPMxZq8rCPZI8i1KXil0ZUx0oQTb0FrcBA2yuYQtfSDmWX
 6ILCeV9JvFBnzTJUjYTw/BcSxm4H8e2E35oQh7HwFucGiCnDZl/RayTgqPR0ZE1t5cKMGwkaY8Y
 hodEar0k7hzFuHrY=
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr2515886wmp.165.1628857742225; 
 Fri, 13 Aug 2021 05:29:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8K8QS4bulUPXdT0RqpNVUibPDhy71EopDNi38U0JDOQilj8PiXMWRgZpbH9ei/xzfxm44ZA==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr2515872wmp.165.1628857742011; 
 Fri, 13 Aug 2021 05:29:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o28sm1271574wms.14.2021.08.13.05.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 05:29:01 -0700 (PDT)
Subject: Re: [PATCH] softmmu/physmem.c: Check return value from realpath()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210812151525.31456-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f9232061-b9d3-c94e-81fa-d59330be4400@redhat.com>
Date: Fri, 13 Aug 2021 14:29:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812151525.31456-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Jingqi Liu <jingqi.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/08/21 17:15, Peter Maydell wrote:
> The realpath() function can return NULL on error, so we need to check
> for it to avoid crashing when we try to strstr() into it.
> This can happen if we run out of memory, or if /sys/ is not mounted,
> among other situations.
> 
> Fixes: Coverity 1459913, 1460474
> Fixes: ce317be98db0 ("exec: fetch the alignment of Linux devdax pmem character device nodes")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   softmmu/physmem.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index c47cb6da2e4..eb0595d57c4 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1451,6 +1451,9 @@ static int64_t get_file_align(int fd)
>           path = g_strdup_printf("/sys/dev/char/%d:%d",
>                       major(st.st_rdev), minor(st.st_rdev));
>           rpath = realpath(path, NULL);
> +        if (!rpath) {
> +            return -errno;
> +        }
>   
>           rc = daxctl_new(&ctx);
>           if (rc) {
> 

Queued, thanks.

Paolo


