Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB66E37D407
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:56:02 +0200 (CEST)
Received: from localhost ([::1]:35238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguxd-0000bI-RB
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lguw5-0007WR-ME
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:54:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lguw1-0001cf-HW
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620849259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2SCKv2MeuXbJaC62cYE1CUtLuR+2GSSfMwxHBHNbZ0Q=;
 b=em/MrjYg4kh3pVjH0RRJwjyYTXA86UyWCtKGsrtMc4GF2Yb6PMw9z1BFTdsl/GxqHNnP3S
 tJh8nAE3bsmInJiwIdekS7kccWJY8QVdAy2SaClI0Vg9DaOsuGpoZ2uv02MMz3SE6N1U7Q
 1EoSrBnWx6iahRrWhUPsNV9ey8DegaA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-Zgn-bg2AN32z4_RDf1GE-Q-1; Wed, 12 May 2021 15:54:16 -0400
X-MC-Unique: Zgn-bg2AN32z4_RDf1GE-Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 b16-20020a7bc2500000b029014587f5376dso1099274wmj.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 12:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2SCKv2MeuXbJaC62cYE1CUtLuR+2GSSfMwxHBHNbZ0Q=;
 b=TysoNlCdP/LEvmjiv/QfyAWI9YDaCOI1pUkfPA8EfWBZjR5Eok9a13CfffhfroVxHo
 EO2nqGZSAfJIYaI1RJ289z9BSftqGuEnNovEp/sqCEciIIqyncjPda0C714crfrywAbJ
 ODgKghDsJ4vvu+UL1n4cDPbeW4ZZ621RCd53iopHvGGPib39/yKdKdNV5RSdP5DaLHfa
 pL99r86RhV3SClUjj09XhWDeThUK391bLWZRFRp8ckIo/Y07Dmlozw/oQaCvEVNDhZkD
 GwLi2FE6Vv25SKhIjALMjiSRpkMQ1nlE2OuCAQlpbXtSzaj8nuSBoRLHZQNi4JS9nGgp
 xeUw==
X-Gm-Message-State: AOAM532AJMhxykOnJdzXfQchlEXLrNMQc74NYg4vvwXuv0Q5ACAUluC0
 wIMdj2ZqMs77YeMcLH6OljIX5UhkJnBa+73tQ/XaqrpkJCsgztPx2jiNpfBfkrm199Q86841a9b
 uoaI9p0ZUwogRGym+jKeIDDbV6zkgywk3o3rcPPNMcjE8yXXk2ZN3U+ebQxodLolu
X-Received: by 2002:a05:600c:4103:: with SMTP id
 j3mr39904452wmi.128.1620849254942; 
 Wed, 12 May 2021 12:54:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1I/79W9TCkcYk1YLtVocvyV14XSxNkhYYXVUH2a8TCx2KB6K1JtruQazXz3VtpNfhIi2vug==
X-Received: by 2002:a05:600c:4103:: with SMTP id
 j3mr39904429wmi.128.1620849254716; 
 Wed, 12 May 2021 12:54:14 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id l18sm595273wrt.97.2021.05.12.12.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 12:54:14 -0700 (PDT)
Subject: Re: [PATCH 3/3] pc-bios/s390-ccw: Add a proper prototype for main()
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210512171550.476130-1-thuth@redhat.com>
 <20210512171550.476130-4-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1539bd87-8ba2-9015-ecfe-753af61847f2@redhat.com>
Date: Wed, 12 May 2021 21:54:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512171550.476130-4-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 7:15 PM, Thomas Huth wrote:
> Older versions of Clang complain if there is no prototype for main().
> Add one, and while we're at it, make sure that we use the same type
> for main.c and netmain.c - since the return value does not matter,
> declare the return type of main() as "void".
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/main.c     | 3 +--
>  pc-bios/s390-ccw/s390-ccw.h | 1 +
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/main.c b/pc-bios/s390-ccw/main.c
> index 5d2b7ba94d..835341457d 100644
> --- a/pc-bios/s390-ccw/main.c
> +++ b/pc-bios/s390-ccw/main.c
> @@ -281,7 +281,7 @@ static void probe_boot_device(void)
>      sclp_print("Could not find a suitable boot device (none specified)\n");
>  }
>  
> -int main(void)
> +void main(void)
>  {
>      sclp_setup();
>      css_setup();
> @@ -294,5 +294,4 @@ int main(void)
>      }
>  
>      panic("Failed to load OS from hard disk\n");
> -    return 0; /* make compiler happy */
>  }
> diff --git a/pc-bios/s390-ccw/s390-ccw.h b/pc-bios/s390-ccw/s390-ccw.h
> index 79db69ff54..b88e0550ab 100644
> --- a/pc-bios/s390-ccw/s390-ccw.h
> +++ b/pc-bios/s390-ccw/s390-ccw.h
> @@ -57,6 +57,7 @@ void write_subsystem_identification(void);
>  void write_iplb_location(void);
>  extern char stack[PAGE_SIZE * 8] __attribute__((__aligned__(PAGE_SIZE)));
>  unsigned int get_loadparm_index(void);
> +void main(void);

Can we keep the forward declaration in the source?


