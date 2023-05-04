Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0356F7183
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:50:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucpV-0001Ld-9W; Thu, 04 May 2023 13:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pucgI-00045X-2Z
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:23:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pucgG-0006pS-NV
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683221027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FxKfAgGfMXo0LtkuVOmr4LIWgw9+j6T3MGQ6WUyQ2b4=;
 b=KJP9Uf4JQou1KsEwYHLWb+amiQc+AI7IR3Ok0UyjtoLgEBT1KDe1ZB65VBgTUn4tr8QpQq
 o6TlBzhA2OY0V7yA4zVbEwBf02xz5nOexDhebdOhv2+7mTZvWwRDeMD2GbkkEJvoO1DgsV
 xBIV1tv2JFJU98QbHij4/BzC3R19amY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-_wABuYLLN72xQrIVSkC7DA-1; Thu, 04 May 2023 13:23:46 -0400
X-MC-Unique: _wABuYLLN72xQrIVSkC7DA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f3157128b4so45837605e9.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 10:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683221025; x=1685813025;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FxKfAgGfMXo0LtkuVOmr4LIWgw9+j6T3MGQ6WUyQ2b4=;
 b=cdOxCfis2OpHYYfiiMxYy5h+dsDTkEv24D80PtN5E2zfT3pXenf2zlfvbfUIarX0e4
 UefVEq2a8Ou0JUAMXYpx68bmMmOg0ZvWkh91Pu2vgPNETKvbPQOdPAIcMNEiEPeVRSt4
 WUeDYnBG1y1sJSKXXVOvMthbN2VUOuhanNcw0I/E+iaMJZY0/KX2AKU2H8V6LCcjV3Mg
 cxwtEZ8ZDe6+blZjuD1OClS2wqsiZ0dGEg1LCfMjOCDlb7qVbTRb7PLeVOvZctlpcGkB
 Mp2mvAyJR6xW5Y5D6+mtpE4XDnKnTZz4aIkWDWqaxwvypy4mVcWz3Eehyold5XoZ01m2
 anvQ==
X-Gm-Message-State: AC+VfDzibDIuBuwuNbRjMl57D08hm+BjBOxK6wABq2Ow9rgDR4vPdtXC
 8jwrXPLBbNvx/ebVThKwRN0RZ6FEFAed8Xxci3O2iwz9GL77bhqczbQ2EQZ7aK2gkxzLV2oend6
 Yjkn2D0aKk6xnMWE=
X-Received: by 2002:a05:600c:4e4f:b0:3f1:88b:bd40 with SMTP id
 e15-20020a05600c4e4f00b003f1088bbd40mr239650wmq.14.1683221025231; 
 Thu, 04 May 2023 10:23:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7rtT2mdqQuKC33mTz3HvCOlGnTypNZyE/qaorzR9R351w0uHhj0yEOz7psMMVsOqU/ROrhTg==
X-Received: by 2002:a05:600c:4e4f:b0:3f1:88b:bd40 with SMTP id
 e15-20020a05600c4e4f00b003f1088bbd40mr239644wmq.14.1683221024923; 
 Thu, 04 May 2023 10:23:44 -0700 (PDT)
Received: from [192.168.8.102] (tmo-098-139.customers.d1-online.com.
 [80.187.98.139]) by smtp.gmail.com with ESMTPSA id
 18-20020a05600c229200b003f17a00c214sm5434617wmf.16.2023.05.04.10.23.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 10:23:44 -0700 (PDT)
Message-ID: <f59bc1fe-2af1-704e-5cab-02c72544620c@redhat.com>
Date: Thu, 4 May 2023 19:23:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/2] tests/lcitool: Add mtools and xorriso and remove
 genisoimage as dependencies
Content-Language: en-US
To: Ani Sinha <anisinha@redhat.com>, qemu-devel@nongnu.org,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: mst@redhat.com, berrange@redhat.com, qemu-block@nongnu.org
References: <20230504154611.85854-1-anisinha@redhat.com>
 <20230504154611.85854-3-anisinha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230504154611.85854-3-anisinha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04/05/2023 17.46, Ani Sinha wrote:
> Bios bits avocado tests need mformat (provided by the mtools package) and
> xorriso tools in order to run within gitlab CI containers. Add those
> dependencies within the Dockerfiles so that containers can be built with
> those tools present and bios bits avocado tests can be run there.
> 
> xorriso package conflicts with genisoimage package on some distributions.
> Therefore, it is not possible to have both the packages at the same time
> in the container image uniformly for all distribution flavors. Further,
> on some distributions like RHEL, both xorriso and genisoimage
> packages provide /usr/bin/genisoimage and on some other distributions like
> Fedora, only genisoimage package provides the same utility.
> Therefore, this change removes the dependency on geninsoimage for building
> container images altogether keeping only xorriso package. At the same time,
> cdrom-test.c is updated to use and check for existence of only xorrisofs.
> 
> CC: mst@redhat.com
> CC: berrange@redhat.com
> Signed-off-by: Ani Sinha <anisinha@redhat.com>
> ---


Reviewed-by: Thomas Huth <thuth@redhat.com>


