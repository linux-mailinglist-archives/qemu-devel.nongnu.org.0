Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984C532B80B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 14:34:02 +0100 (CET)
Received: from localhost ([::1]:51148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHRdZ-0005LA-L1
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 08:34:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHRax-0003CY-G5
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:31:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHRav-0003kx-V7
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:31:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614778276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OsiM6RECw6fCHMOqi+udaNQVjNRaqfuH5bcahhvTeaA=;
 b=FBmzc9ez2KOBleJ5wl9ghz2wPOnDcxu3UkzjgxgKE9SOfFlQA1VjilA8W+dL2/+JlYoOlj
 Y2bZaz673Q4Vbt7AoMW9ORk1/H4esHVngFI7hWIuC0ahdxDN30XiuyaqY9gaKXtYuGwBds
 FIQhsszqA5pl7xwQBHiWZpJK7X8Prs4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-2RYSO-1KOuO05LcGr8mmXA-1; Wed, 03 Mar 2021 08:31:12 -0500
X-MC-Unique: 2RYSO-1KOuO05LcGr8mmXA-1
Received: by mail-wm1-f70.google.com with SMTP id 73so2932618wma.3
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 05:31:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OsiM6RECw6fCHMOqi+udaNQVjNRaqfuH5bcahhvTeaA=;
 b=InKWW8IEYWaya9JUo0weOCQ7muD9dG2ym6TWARCLghnQkEiWxqRFuMQycg5nge8da9
 jzivVZnBVoseyFnD9h0+6EDC2UJ3YRNMDw5MLQjivEzsYvnJkSxriAztwSVeTmZNc/Cg
 KaLEhV0/Mns3s5QcaOkp8NzzB8fEfrE6TR9sK6dolTU8dqn6GA+Sd0QLARhYu8VJv3jk
 HYYDWf48J3wlgeo51v1MLNe8vx/fypMe7Ap9Ofe5ZTqGu9P258Pafy2RAcz9mn8RmAzA
 TY1BbVgCh+7jQtyXnhxidxnrpU3XkmjXrUwv3Q4VXpVLs/rmP5LPHaE2KqMSYNOTP7/b
 BTuw==
X-Gm-Message-State: AOAM5336lWB/e8ScvBkiw1kLm31dcg3Qx+yc64HCTLPrINDnySQB7H8v
 SzXYXMPIdLkxsnJcCuyKBLF+MHRgU71CO7BJgt5bjS+udEc6yL2Qd+znT3oltZckVWDIngxK7Vi
 OwI00B4FtEa28Oow+rU87IsiCZI6DUHowXjQi1Wk8HB/d/jdZXLmy/I+3CnotGaZxAwM=
X-Received: by 2002:a1c:4986:: with SMTP id w128mr9106214wma.37.1614778271151; 
 Wed, 03 Mar 2021 05:31:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxWta/SV7h5OP1oHV4mqbAB5hVrHpdr4/zdIVg4+prikkzSO3HpnhA4ju2jl9Oj7W/wLyYmQ==
X-Received: by 2002:a1c:4986:: with SMTP id w128mr9106188wma.37.1614778270734; 
 Wed, 03 Mar 2021 05:31:10 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p11sm19576460wrs.80.2021.03.03.05.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 05:31:10 -0800 (PST)
Subject: Re: [PATCH v2] chardev: add nodelay option
To: Markus Armbruster <armbru@redhat.com>
References: <20210303123235.63171-1-pbonzini@redhat.com>
 <87mtvkjrpe.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f8514ec5-76e0-e602-4dee-8a28d29a0aa3@redhat.com>
Date: Wed, 3 Mar 2021 14:31:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87mtvkjrpe.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/21 14:24, Markus Armbruster wrote:
> $ qemu-system-x86_64 -chardev socket,id=chr0,path=sock,nodelay=on
> qemu-system-x86_64: -chardev socket,id=chr0,path=sock,nodelay=on: Invalid parameter 'nodelay'
> 
> You forgot to update qemu_chardev_opts:
> 
>     diff --git a/chardev/char.c b/chardev/char.c
>     index 288efebd12..e6128c046f 100644
>     --- a/chardev/char.c
>     +++ b/chardev/char.c
>     @@ -864,6 +864,9 @@ QemuOptsList qemu_chardev_opts = {
>              },{
>                  .name = "server",
>                  .type = QEMU_OPT_BOOL,
>     +        },{
>     +            .name = "nodelay",
>     +            .type = QEMU_OPT_BOOL,
>              },{
>                  .name = "delay",
>                  .type = QEMU_OPT_BOOL,

Well, I forgot to commit it.  But the outcome is the same.  Thanks. :(

Paolo


