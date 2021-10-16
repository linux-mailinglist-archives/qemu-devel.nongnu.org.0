Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515D54300DA
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 09:29:34 +0200 (CEST)
Received: from localhost ([::1]:53914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbe8K-0006gE-TJ
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 03:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbe75-0005zP-S2
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 03:28:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbe71-0007mL-H8
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 03:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634369289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cT7bkybZEThXsTMPXpS/Zj+498395jk0gJZk0Wu+qGI=;
 b=cG67i7L89tULBEF5Lc+drp0+Ik0mTUBi7xtWB4yBhL/CdlX3LQhIZFi+DgezN6yKfFz7rC
 t9jA57ScSHD2q5BERGueAR6kS0Cy3XnbcBYWQWzIuAX0h4xGEdeAKvgzg7KlEjQrL3bBQI
 7u6vBfVYFrdTjX1ppdCAyVzG97Hto8c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-h7YGZ7lvMu2whplCxgp8HQ-1; Sat, 16 Oct 2021 03:28:06 -0400
X-MC-Unique: h7YGZ7lvMu2whplCxgp8HQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 v9-20020a50d849000000b003db459aa3f5so10121216edj.15
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 00:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cT7bkybZEThXsTMPXpS/Zj+498395jk0gJZk0Wu+qGI=;
 b=dvGgodxFkmaS6q5828kwb6pHSYAkV72u2PyQItSMf4jGmEdmvfF3odp7+UVkjvgq0m
 a0+8wrDhrPQwLK4frVegknEtKCb1kfdQL3oigazHtvk5lbmSGQQwVfJMJ9kBGKZD5g34
 W2TFSJiZD/w++E63vDY2rW0qQGyDKdl8FbFM4PdGUBtGFQLX5SKcVSBG1xwQoEeP4OYm
 zBhVUCvBp1TnY5isznFEs6KvPnbYgOg64F4+qEOzlJWhejh8tpUUk7jth/1OSqvCQ9Xh
 hKLkF9hWglaO0erNPdX5IHIzLfY54Kyw46MAL40oLgQ9/X1/5kiW47y8+IQWMbyDO9b5
 5aBg==
X-Gm-Message-State: AOAM530UTrTAjaHDj+RV3QnF7zFOsA6EA6LreAfLi4/ekOsZWjsDSP8r
 RjrFZVx5yiYD/+FQ33P97kjIDP9dn0VhDC/leBpauBOZApIdFQJe4zmT2jPSXzmv7W5gYYO1+4I
 Wc1c9LXDfLG7QvlI=
X-Received: by 2002:a17:906:bceb:: with SMTP id
 op11mr12960709ejb.449.1634369284848; 
 Sat, 16 Oct 2021 00:28:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/5aDhh8jKeB8GwrANSJRiu6FQxT6xf67PQwhTUUINVEOkc5L0or79HR67ZsKbtZoCGY/kWw==
X-Received: by 2002:a17:906:bceb:: with SMTP id
 op11mr12960687ejb.449.1634369284649; 
 Sat, 16 Oct 2021 00:28:04 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id z16sm7428893edb.16.2021.10.16.00.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Oct 2021 00:28:04 -0700 (PDT)
Message-ID: <16cc6428-9a4c-87d0-f092-b7a21f64b0b8@redhat.com>
Date: Sat, 16 Oct 2021 09:27:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: gitlab build-edk2 failures
To: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
References: <95c44864-c316-4396-5863-09e46dfa4671@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <95c44864-c316-4396-5863-09e46dfa4671@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/10/21 04:04, Richard Henderson wrote:
> I've seen a lot of failures on this job recently, and they're all 
> timeouts cloning the git submodules.  Would it be better to mirror these 
> to gitlab?
> 

They're not timeouts, they're issues with edk2's _own_ submodules.

fatal: unable to access 
'https://git.cryptomilk.org/projects/cmocka.git/': server certificate 
verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: 
none
fatal: clone of 'https://git.cryptomilk.org/projects/cmocka.git' into 
submodule path 'UnitTestFrameworkPkg/Library/CmockaLib/cmocka' failed

roms/edk2 is already mirrored to gitlab, so we'd have to add mirrors for 
all of these and make edk2.yml configure the mirrors in .git/config.  I 
think the edk2 project should do the mirroring instead...

Paolo


