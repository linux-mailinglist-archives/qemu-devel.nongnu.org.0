Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFC9351655
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 17:49:55 +0200 (CEST)
Received: from localhost ([::1]:57738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRzZy-0003ny-IY
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 11:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lRzYm-0003M6-Ii
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:48:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lRzYk-0005b3-MB
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617292117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yfJ/Tc+aJ8IX5oHVPz5jXtiDBo0RBx6ZToHxObfvtf0=;
 b=XvoGexK8kpzAaYrXJPKrvx2uVNVPaWwzzymx8vxlyuXBsQF9TjdWVOad9ZtE3S0nI+HDnG
 suKxQQKeSYGKlRryjWM8mJR24fXUi0jHs5JvbQuDnfptKgb0EXvR7XubNiT5tLVedA9yno
 O9iFMPzk2BBYAJF63BhnUiiO8dmFNRk=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-QJ1N5YmnM9qUr3P2lVOEIA-1; Thu, 01 Apr 2021 11:48:36 -0400
X-MC-Unique: QJ1N5YmnM9qUr3P2lVOEIA-1
Received: by mail-ot1-f70.google.com with SMTP id q20so2695826otn.12
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 08:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yfJ/Tc+aJ8IX5oHVPz5jXtiDBo0RBx6ZToHxObfvtf0=;
 b=Ol90fipP8cwSUUlw574NFgtrOMaYyXxKNm6fRe6mjZ2UUYE1/ki5wYgxG/CT8OvHMB
 w3OMrxcwGUjd+VxDZRx9Prb45pS9wIRn+jhulDdMtsdqrmbiR74hJ+I+wKCvYIW/BoBa
 Z2mF9W5LcoaQbBw+GirSYEePZnr+GmYwOBhd1nWcyEJgIF5CQbQ/lqtTmpLElWOWGtL/
 aYzzeWpG6EmCeduq22SMr/dsggkszO960A+7yfizY3QCWUUfXofjIHXQlUWVw+ackvzR
 7e2uNQLBj9xEzzeBW7EfLPRb0eEkA79dUsAW+K64CucG0f/Mlwy093c5S2St0xRgkaMf
 Kxhw==
X-Gm-Message-State: AOAM5308XQSxokgYnipYSJxYlubSJ3ZXJ9uN+BwNH2wP7XLfclfKJ7Lx
 JVQd5tRiWftkX0WoxyyCC7yUJIFXGdZN0j0NDqQyzxIWU/4vBWMF0Ae4GX0BQT37itLbeNMcSIQ
 FH0rkVtwwKd+l6zU=
X-Received: by 2002:aca:d503:: with SMTP id m3mr6358982oig.50.1617292115548;
 Thu, 01 Apr 2021 08:48:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqOCzJ40wj85Wwntlka7N+Hfxmjj4wCDorysuTsIKjR1IuK+cr0bDmVLhHsVTQPyUgfAhcwA==
X-Received: by 2002:aca:d503:: with SMTP id m3mr6358969oig.50.1617292115399;
 Thu, 01 Apr 2021 08:48:35 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 s4sm1112978oic.3.2021.04.01.08.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 08:48:34 -0700 (PDT)
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Fix security.capability comparison
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 virtio-fs@redhat.com
References: <20210401145845.78445-1-dgilbert@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <041f5453-cd97-e31f-2855-7083ba6614fc@redhat.com>
Date: Thu, 1 Apr 2021 10:48:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401145845.78445-1-dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 4/1/21 9:58 AM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> My security fix for the security.capability remap has a silly early
> segfault in a simple case where there is an xattrmapping but it doesn't
> remap the securty.capability.

s/securty/security

> 
> Fixes: e586edcb41054 ("virtiofs: drop remapped security.capability xattr as needed")
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>

> ---
>   tools/virtiofsd/passthrough_ll.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index b144320e48..1553d2ef45 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -2636,7 +2636,8 @@ static void parse_xattrmap(struct lo_data *lo)
>                   strerror(ret));
>           exit(1);
>       }
> -    if (!strcmp(lo->xattr_security_capability, "security.capability")) {
> +    if (!lo->xattr_security_capability ||
> +        !strcmp(lo->xattr_security_capability, "security.capability")) {
>           /* 1-1 mapping, don't need to do anything */
>           free(lo->xattr_security_capability);
>           lo->xattr_security_capability = NULL;
> 


