Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A52EE342EB0
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 18:53:32 +0100 (CET)
Received: from localhost ([::1]:58902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNfn1-0000mT-9z
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 13:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNfli-0008Tm-J5
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 13:52:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNflf-0000a0-E4
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 13:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616262725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+jZAd9HhlZg4BnTjX6jXLJJEr/uXVf9dPfUKNRs07Nc=;
 b=bxY6W/j62A7KmJyD+kKksM8FTcUobn7wAkMDzUK+2aqYNtJECJO+b6hZvGYyTnT9sggP7+
 zvWFFrCVvK5jbuY52GnIsvPcwQEOmu0JN3drwXot+zfCyyTaeZtHoY2wkTejDSktKCFIl2
 2EZUs71j92ioDTrAZ8N0uiraPFj8gE0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-w2US_pLUOUC3qLXWhyfKag-1; Sat, 20 Mar 2021 13:52:03 -0400
X-MC-Unique: w2US_pLUOUC3qLXWhyfKag-1
Received: by mail-ed1-f72.google.com with SMTP id o24so24709425edt.15
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 10:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+jZAd9HhlZg4BnTjX6jXLJJEr/uXVf9dPfUKNRs07Nc=;
 b=lgl0csUZP3Krq744iXXDtBgb0UHjQEGJHQ0qkF+f9Xu7f+OIqXMzyUN1wAqNFKmWXd
 VFCWigH24v7AbcNtKXM9Mrn0so7nlomSCQzR0MspFclqkSCZJ4axlErxbxfCnRDW/VzV
 ZRofV7rbd4vxmUyKQ96q+JIFl5PRF+Y0NlLNQyDZ60lBp5Mt0v7wXFfFXJqq45wXF5U1
 K5VE5h7XCI/qZm/0l5icPN8aSb1d94s3U+FjkfzKwnwqBOgYEdQ3VprydMXJpJXnltmL
 749SmxCzElTA/5LG9GQUX08qyTwjGo0yUcgmquCouxEb3jNVeNXil1g6iTN1tN3319ZT
 zCbg==
X-Gm-Message-State: AOAM5319u4wJAf0JQ3is6HYfsgtm0uuExdLBzCndGOJVQkj/q7vpZ10H
 iUvJBF1QnLNi32YJF8TYkgpwu56MIazehwyP514Z3kbfpyKlaGRFko6AS4oOn08Ncxd+MpxW3S/
 iS6LvCXjTsDfND/A=
X-Received: by 2002:a17:906:688:: with SMTP id
 u8mr10532204ejb.38.1616262722443; 
 Sat, 20 Mar 2021 10:52:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5S8kMIL/kAPRDlQWbkggLy3yaOQdK9bQKjqd3DYXOZkS8rGk2OqEmS10T/KMS5d4l1254Vw==
X-Received: by 2002:a17:906:688:: with SMTP id
 u8mr10532188ejb.38.1616262722265; 
 Sat, 20 Mar 2021 10:52:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm6572102edm.89.2021.03.20.10.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 10:52:01 -0700 (PDT)
To: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org
References: <20210320042753.69297-1-gshan@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] configure: Improve alias attribute check
Message-ID: <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
Date: Sat, 20 Mar 2021 18:52:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210320042753.69297-1-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: thuth@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/03/21 05:27, Gavin Shan wrote:
> It's still possible that the wrong value is returned from the alias
> of variable even if the program can be compiled without issue. This
> improves the check by executing the binary to check the result.
> 
> If alias attribute can't be working properly, the @target_page in
> exec-vary.c will always return zeroes when we have the following gcc
> version.
> 
>   # gcc --version
>   gcc (GCC) 11.0.0 20210210 (Red Hat 11.0.0-0)
> 
> This abstracts the code from exec-vary.c and use it as indicator to
> enable gcc alias attribute or not.
> 
> +void write_x(int val);
> +
> +void write_x(int val)
> +{
> +    x = val;
> +}
> +
> +int main(void)
> +{
> +    return read_y();
> +}

I think this should be "read_y() == 1 ? 0 : 1".

I can reproduce it with -flto -O2 but not without -flto, do you agree?

Perhaps we can obtain the same optimization by wrapping reads of the 
page size in an inline __attribute__((const)) function.  Richard, what 
do you think?

Paolo


