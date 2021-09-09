Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAFB405AFE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 18:37:24 +0200 (CEST)
Received: from localhost ([::1]:36878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mON3D-0005O8-Fr
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 12:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mON1R-0003uV-11
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:35:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mON1O-0006kt-2M
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631205328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSdHSwlq/hiQknXBfdHgJFdmEs47HWJqRt1JbqXLWZg=;
 b=ZUFDgNyLwlQul6bje6CW7Wzn7CqL/MiV4kmRdynWIukcVzYAYxlJMymjsX7JZrA6rZhhkK
 n6B/ZbLdMl9yk0NVmG7sa+cAgfssKV/26Nv+gXgtHTbUsSW2ZMJgrKA+g9ZSGcK4BY4yQo
 xDiJDN/EZUARq82SzJtGt5uqeB4RVK0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-igPf9UjOMOKplhaT_qwNfg-1; Thu, 09 Sep 2021 12:35:26 -0400
X-MC-Unique: igPf9UjOMOKplhaT_qwNfg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso1092799wma.9
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 09:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uSdHSwlq/hiQknXBfdHgJFdmEs47HWJqRt1JbqXLWZg=;
 b=SrTHZ2DY+wr1JXO60aw3IsxGX46uj9m9fwRLrwf96ehGZXMquDOulD9/GECcxklVuJ
 h88znGAZhK4zcLlSw0GwFoaYrwpuvTJKEq171H186YKS0mlXluIKN/g0xaAyrQxJUgFE
 ZIsBozHBRGZKKRwW/dg8+AVVrIH+QNiJh6fkxPkyqDRi1iiH8MQU5NnhAn0/XUU56Mqy
 XmeP4qyXdKjEdDN1kGcj0amfZ9XkcmTSZ5KjLhIAY9+4UdZh6nJWchwQqGm+/KcxeX50
 WdR1OT6bAwvlJVCXU+wGZwFJXUkZNrwOvo04Jhf0+7gXUf/m3/F/hlEInxNNLXvM+Sqv
 HKRA==
X-Gm-Message-State: AOAM530UD5RzqJCQsat7Kh8QHGRgPTr5luHbbw1FGHskrpscwmtkuJQR
 xgzWJ07YDIJiMMwyiliyXAqf2GB8KpfWiIx9Ktxc51DkoglPS8myOpoWht4zlphRYRTkBllN+AF
 l90qXfFZJ5h5Kr8o=
X-Received: by 2002:a1c:4384:: with SMTP id q126mr3895646wma.155.1631205325676; 
 Thu, 09 Sep 2021 09:35:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmsW/NKb67jhLGrZ0QU25FFFXlGfXsIG5z0NRxAplxgCGWnhNQGI+jyNXtS/J8+c7nL9L10w==
X-Received: by 2002:a1c:4384:: with SMTP id q126mr3895627wma.155.1631205325498; 
 Thu, 09 Sep 2021 09:35:25 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id h18sm2229988wrb.33.2021.09.09.09.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 09:35:24 -0700 (PDT)
Subject: Re: [PATCH] memory: remove incorrect RCU comment for
 address_space_read()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210909141031.958393-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9929fa7f-d361-f563-7f2b-709444da70cd@redhat.com>
Date: Thu, 9 Sep 2021 18:35:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210909141031.958393-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.975, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/9/21 4:10 PM, Stefan Hajnoczi wrote:
> Although the doc comment says "Called within RCU critical section" the
> address_space_read() function takes the RCU read lock itself. There is
> no need for the caller to hold an RCU read lock.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Fixes: b2a44fcad74f1cc7a6786d38eba7db12ab2352ba ("address_space_read: address_space_to_flatview needs RCU lock")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/exec/memory.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


