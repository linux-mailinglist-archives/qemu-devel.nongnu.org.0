Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80E43D014C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:11:11 +0200 (CEST)
Received: from localhost ([::1]:56012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5uD1-00038P-0T
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5uAl-0000L3-5S
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:08:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5uAj-0003PC-J4
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626804528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TkfCzoJ6LrwGWX+kUL8OdxOCOOFX/dKrvyvr8NU8+8A=;
 b=MmsM3+qc00Yt0HcoHENZMNb5BLHb0/xVQr2QqYM8XAj/bTUebCjGnKwyvURWeM5ESo4R9g
 jNG0ZblJwZVPs2qaRsGQ/dX85OPuvslTwcIwF3wjvtPb7Fgp2xgJxcEnTZSwbSHJxn9A08
 5pZW8/Whpto2RbqTTqL/O1Z47mJ2kyI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-gPBxCGEkP66dA7_mK20LCQ-1; Tue, 20 Jul 2021 14:08:47 -0400
X-MC-Unique: gPBxCGEkP66dA7_mK20LCQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 y15-20020a5d614f0000b029013cd60e9baaso10592568wrt.7
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 11:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TkfCzoJ6LrwGWX+kUL8OdxOCOOFX/dKrvyvr8NU8+8A=;
 b=jbAfJkBF4RbECq2kd9z4yh06Hm5ikgW7oMdBHzFGYe0ydZAjDd6DnSGyXnrB4oTSkd
 QqFVq021p11H9gNezUtpMrNCTd3ILPLdqq8EmKaquOsYQVQM27EVywlATnflxjaO7fO8
 zVJMX5De0/hIenIZqn9/1bqNw+MJ358MKygWxDOBUBgG79gaCHUtNm3eCg9GE8dROHQD
 vHk5dDQ8/OWYeJXGmTkhJF7hAMin8VuBfuXRfMnqXxQ5NW1y25lt3LRQoYf8Cj74uFqq
 oVAesqwy7R7DMIUGkfp+KzaxkhcW8AGHOCzNn8cBliLSlWdi0utFWin6tA4TWXaWC1Kb
 Vz6g==
X-Gm-Message-State: AOAM532imeQPqTr8sy3eTT/u3moH9FArn21r0d2UbForyl+8XXivdgBA
 xGchCJG47+nmfpC2MRoqcrniZlIUSCpJN3T8L6EV3dZbr2OoYmkAahzi1XwzNUJi9IpSYMkNmeN
 ulB/U7nE9pBXxnhg=
X-Received: by 2002:a7b:c202:: with SMTP id x2mr38505967wmi.57.1626804526540; 
 Tue, 20 Jul 2021 11:08:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnrFZJqAxiSvPiaamHKGD0xZ8A/D/Za1TAUeyvlqePOu+R0EiEjSAKP+oBqP4CbNY5IyEMXg==
X-Received: by 2002:a7b:c202:: with SMTP id x2mr38505946wmi.57.1626804526355; 
 Tue, 20 Jul 2021 11:08:46 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id q19sm2915373wmq.38.2021.07.20.11.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 11:08:46 -0700 (PDT)
Subject: Re: [PATCH-for-6.1? 16/16] vl: Don't continue after -smp help.
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-17-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7a7a7882-e5b8-50a8-4d00-baff99f070de@redhat.com>
Date: Tue, 20 Jul 2021 20:08:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-17-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 2:54 PM, Markus Armbruster wrote:
> We continue after -smp help:
> 
>     $ qemu-system-x86_64 -smp help -display none -monitor stdio
>     smp-opts options:
>       cores=<num>
>       cpus=<num>
>       dies=<num>
>       maxcpus=<num>
>       sockets=<num>
>       threads=<num>
>     QEMU 6.0.50 monitor - type 'help' for more information
>     (qemu)
> 
> Other options, such as -object help and -device help, don't.
> 
> Adjust -smp not to continue either.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  softmmu/vl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index ce0ecc736b..8f9d97635a 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1543,7 +1543,7 @@ machine_parse_property_opt(QemuOptsList *opts_list, const char *propname,
>      prop = keyval_parse(arg, opts_list->implied_opt_name, &help, &error_fatal);
>      if (help) {
>          qemu_opts_print_help(opts_list, true);
> -        return;
> +        exit(0);
>      }
>      opts = qdict_new();
>      qdict_put(opts, propname, prop);
> 

Easy one for 6.1.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


