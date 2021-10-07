Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6C6425002
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 11:25:01 +0200 (CEST)
Received: from localhost ([::1]:36832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYPe7-0002wW-UK
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 05:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mYPZh-0000Rr-W3
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:20:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mYPZf-0004bF-In
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633598421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpoSAzsk/ZIe+WgHmuQVj9nQLrk5d/zN6GhZNJAPDpI=;
 b=SacRPn7AqE9A7fA6rJ9yWvGQy08+iG/nGY+jKQ+F0OFZZjZQm3Cyqi+jro+tS4qYCDXGjm
 Ief0Ugucubn7CPO2KfhtQ/WDTKPei6Co2uVh+nkNv29Uc5u9cW0HCPj2N0LU2wbAWSr/oc
 UqILkoNCIsDVFdxWf1GnF5V1/Exfz9g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-Kyyg9eruMZiXgIp6_zbESg-1; Thu, 07 Oct 2021 05:20:20 -0400
X-MC-Unique: Kyyg9eruMZiXgIp6_zbESg-1
Received: by mail-wr1-f72.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so4189159wrh.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 02:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VpoSAzsk/ZIe+WgHmuQVj9nQLrk5d/zN6GhZNJAPDpI=;
 b=2ZPj3fIXXmVoAe9Vx/dEIt8Ai+MJ8wdt7lx80ToE7d1nXuMAu1p/3Pv0J2ad9f4L9j
 gnkrzE5PZIV6b0WosO0IjY/EL5TXxPsRDZgIf06usMQxYokXBMedWO6llrXqja7MdYEH
 IZAhA28QfD4eYlz7M+LUKIBfHpik9FFd5fQOZyV5+a800wYQex/Svave5BO3HcK9KSSI
 O1srjjgHmdUsBIuCuxrjN661Ge9tNpDvkTTYLVPWJE+n35qlS8XP5BF7KzqJKJ59OFWU
 bLL6n/HimTPuaqwdurpBWMTj1b2LVXORiKi50DNbwK4sHsv6IbrRKMFuNmYQPE8drwy7
 fg7A==
X-Gm-Message-State: AOAM531+TUr+h5F8gCZG5jJ1dczT6F5oQsCzE6DcLeTyWBr/NepaAo6y
 I5Dds71GTdo7xGtmbgVOWTYN0gWF/AxMRrX10LUr4jRnO81ty5An08aWd5RAgZxK9q8robXv/n0
 /vgsTPf87Hkwcf8E=
X-Received: by 2002:adf:aa96:: with SMTP id h22mr3968869wrc.405.1633598419851; 
 Thu, 07 Oct 2021 02:20:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyu1+iTPqzWrm/+3Q4adjrDSmxvHPdu1iSzCrizlPPL6yMu8lRyHMtVPYReMV8O7+NTdzFM9g==
X-Received: by 2002:adf:aa96:: with SMTP id h22mr3968847wrc.405.1633598419657; 
 Thu, 07 Oct 2021 02:20:19 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6886.dip0.t-ipconnect.de. [91.12.104.134])
 by smtp.gmail.com with ESMTPSA id d24sm7549339wmb.35.2021.10.07.02.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 02:20:19 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Add myself as reviewer of the 'Memory API'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211007091949.319404-1-philmd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <ffd067bc-ffa5-9339-8e66-f107a26ec720@redhat.com>
Date: Thu, 7 Oct 2021 11:20:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211007091949.319404-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.10.21 11:19, Philippe Mathieu-Daudé wrote:
> Having developed interest with the Memory API,
> volunteer to review the patches.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 50435b8d2f5..32b668e92fc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2502,6 +2502,7 @@ Memory API
>   M: Paolo Bonzini <pbonzini@redhat.com>
>   M: Peter Xu <peterx@redhat.com>
>   M: David Hildenbrand <david@redhat.com>
> +R: Philippe Mathieu-Daudé <philmd@redhat.com>
>   S: Supported
>   F: include/exec/ioport.h
>   F: include/exec/memop.h
> 

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


