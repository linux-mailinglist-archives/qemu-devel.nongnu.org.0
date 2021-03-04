Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1BB32D4BA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 14:58:49 +0100 (CET)
Received: from localhost ([::1]:49478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHoV6-0004jZ-Gq
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 08:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHoTI-00045R-Hk
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 08:56:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHoTE-0000rY-4H
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 08:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614866207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MpHX/a7yCBReDRTGDYwwyxBKDLq55HbfjE9ITkwtBBE=;
 b=gzCsrWqSVBsJ0KZrmgOpfTApoFKqOs+7yMsbQVv4PW/SSWLtqnKKomeDtaENltp1w8+CCs
 Iclf5oZw3UbgotSQ3uSAbeiJM7XAgEuWURbfgo8iyb3hFZzBDveSUVFKTRP69SbVqYKQfa
 7k8IN/bEi3qqwWJgf+AmbDb0FvZSUeA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-rPLNkA1rOVupy0TyKKY34w-1; Thu, 04 Mar 2021 08:56:46 -0500
X-MC-Unique: rPLNkA1rOVupy0TyKKY34w-1
Received: by mail-wm1-f69.google.com with SMTP id n17so2569795wmi.2
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 05:56:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MpHX/a7yCBReDRTGDYwwyxBKDLq55HbfjE9ITkwtBBE=;
 b=LoeP4PXoDcpszX/6FwgX6xfFOQUAu70v+/qrCrSjy+MRWM2OjXP3rK+eu6WOgnROoV
 GmT66PyJNMQzI/ix6SC+/AB5NYWZq15YylYgArKaRPn3rt+qhOUBEOsyn5Qu69gDUmYx
 RA0cI8uJKE3xkn7YFlGjGhfaz2oFaPboZVUL4ElURdDveuJ7F5Vkz+ojnQ/clk+kbAAa
 vFXHZ7J0U1uInrWAVascVkebua0mhhDELTS4mAAVQKl5wVQ0rcW2b/wF+HsM7x+JOUdh
 dOouKz2f3zDFQmuKqyzzCjf1SKainJEu8+9unKKwKH80xa5pIITkSxg1VAbT94/qNptP
 mp1Q==
X-Gm-Message-State: AOAM533xJj+b7StmddJ99MXc0efTsEJXvHsGP/jsYN0W/EuJuMTNtty7
 BjgCfxxCROzU8F3idkb9bxANUJ/TR2b6LLEz5FdIFrNNxiG6kBrSVEhO3/3EhqsMvGfqV9qi0Yk
 8/Sy1XRdefmyYYdM=
X-Received: by 2002:a7b:c041:: with SMTP id u1mr4049880wmc.161.1614866204899; 
 Thu, 04 Mar 2021 05:56:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYGR8bnjcT7LzAXU8tRW/khqIFgYtcWtTCkFEJV0OxsrH10KzYftCakpHiJpw9Zqs1Dxhs7Q==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr4049856wmc.161.1614866204738; 
 Thu, 04 Mar 2021 05:56:44 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h20sm9649878wmp.38.2021.03.04.05.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 05:56:44 -0800 (PST)
Subject: Re: [RFC PATCH 00/19] accel: Introduce AccelvCPUState opaque structure
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210303182219.1631042-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a84ce2e5-2c4c-9fce-d140-33e4c55c5055@redhat.com>
Date: Thu, 4 Mar 2021 14:56:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/21 19:22, Philippe Mathieu-Daudé wrote:
> Series is organized as:
> - preliminary trivial cleanups
> - introduce AccelvCPUState
> - move WHPX fields (build-tested)
> - move HAX fields (not tested)
> - move KVM fields (build-tested)
> - move HVF fields (not tested)

This approach prevents adding a TCG state.  Have you thought of using a 
union instead, or even a void pointer?

Paolo


