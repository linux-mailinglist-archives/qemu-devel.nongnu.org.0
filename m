Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180B92F800A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:53:47 +0100 (CET)
Received: from localhost ([::1]:50876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0RQ2-0004oH-6P
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0ROt-0004Kh-5x
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:52:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0ROq-0002CE-Bo
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610725951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a6Y51kHPA2F2PHwCSrSUPu48z6u29dabIEg0kSXul4A=;
 b=MA+fl2AMi6ZJdCSLdMWhoW8QupObRyPRjJurCNA+t6EFqcr9UvvFhugDVFh8Im8H36Y9n6
 9dCaseJ8u7w/Rj/4215MzgJk2pZqkYS2da2dkp9dYF6+TI+OFusdnpBTtzvAZK8SDjifY5
 qG+k7VnvpKlUsBj0mhMASX1USGkmwHg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-zmgs9zMYMci85FuK5s-MhA-1; Fri, 15 Jan 2021 10:52:27 -0500
X-MC-Unique: zmgs9zMYMci85FuK5s-MhA-1
Received: by mail-ej1-f69.google.com with SMTP id s22so3718898eju.21
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 07:52:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a6Y51kHPA2F2PHwCSrSUPu48z6u29dabIEg0kSXul4A=;
 b=HcZdL4wJwzuh0gnCaD432dGYljUOKVS5nwDH1Ax+9Mka0GF7hngDjwfWv/PZ9u8gDX
 ekcXvCbI4x4M/ArRGYsm/ya4J7WubuDE7o9R263Y74NjnS8PETZX1LJx4lT77HEI9yS9
 oZ1f5IDjZ+vIN0hqDUfpYmRTr0o+8Hg0fF4xLOXB5MQS0jxu39ynbF/QgHuLayBTgQfy
 HemPb0vu2LYZMipyRHeAbDYlMlQ1YfP9C0M83rwbIGgF0EgMAO0Y0sC3FB9DkNo2nGF7
 +8Pmfk/rE/sGL9QJISkMejA5hb6HNvy6/I+ttWfN8EisA3eLBVpovERonHAvDO9S44lI
 6N4A==
X-Gm-Message-State: AOAM5316tLDyijIbFT8myJizdjHtHo+uKhWkBQ//X+2nf/n5VHSsJqYs
 gXHQNLedwZxtmEemTwqZioaOko1lODaA0fYCsj/tMOrHc8VZgfEgO6kzccv2RemDNBP8JKZBDbE
 s99/YzWLQAbwJFGA=
X-Received: by 2002:a17:906:6b91:: with SMTP id
 l17mr8562758ejr.171.1610725946313; 
 Fri, 15 Jan 2021 07:52:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJ8cNDqpqacwkP30MjrAwdJBCj+eGU3IVG7a5c1BWr0Z8mdSxiWMOD9LYs/gucar0f6p0VOg==
X-Received: by 2002:a17:906:6b91:: with SMTP id
 l17mr8562746ejr.171.1610725946159; 
 Fri, 15 Jan 2021 07:52:26 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m5sm3719102eja.11.2021.01.15.07.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 07:52:25 -0800 (PST)
Subject: Re: [PATCH 1/4] tests/qtest: Remove TPM tests
To: qemu-devel@nongnu.org
References: <20210115150936.3333282-1-philmd@redhat.com>
 <20210115150936.3333282-2-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <647c3b2d-a68d-43a1-052f-1f5c08b6f3cc@redhat.com>
Date: Fri, 15 Jan 2021 16:52:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115150936.3333282-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Subject is incorrect, this is not a removal of the tests, but
removal of their execution. The tests are still in the repository.
This is more of a disablement.

On 1/15/21 4:09 PM, Philippe Mathieu-Daudé wrote:
> The TPM tests are failing, and no further tests are run,
> making the rest of the testsuite pointless:
> 
>   $ make check-qtest
>   =================================================================
>   ==3330026==ERROR: LeakSanitizer: detected memory leaks
...
>   SUMMARY: AddressSanitizer: 449172 byte(s) leaked in 324 allocation(s).
>   make: *** [Makefile.mtest:1025: run-test-126] Error 1
> 
> Remove these tests to be able to run the rest.
> 
> Cc: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qtest/meson.build | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 16d04625b8b..bcbb04d2bb4 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -41,10 +41,6 @@
>    (config_all_devices.has_key('CONFIG_USB_UHCI') and                                        \
>     config_all_devices.has_key('CONFIG_USB_EHCI') ? ['usb-hcd-ehci-test'] : []) +            \
>    (config_all_devices.has_key('CONFIG_USB_XHCI_NEC') ? ['usb-hcd-xhci-test'] : []) +        \
> -  (config_all_devices.has_key('CONFIG_TPM_CRB') ? ['tpm-crb-test'] : []) +                  \
> -  (config_all_devices.has_key('CONFIG_TPM_CRB') ? ['tpm-crb-swtpm-test'] : []) +            \
> -  (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-test'] : []) +              \
> -  (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-test'] : []) +        \
>    (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
>    qtests_pci +                                                                              \
>    ['fdc-test',
> 


