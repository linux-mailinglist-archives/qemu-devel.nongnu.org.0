Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6C5662A9B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 16:57:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEuVs-0004zP-Fj; Mon, 09 Jan 2023 10:56:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pEuVp-0004ye-JT
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 10:56:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pEuVk-0004gQ-5o
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 10:56:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673279789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PnT7BPGpKx4CXFPh0sQkwkxOICmbO+wBQS/21+/GroI=;
 b=gSn/pXRzSqj71Drwvhf8QjIysLNvFjc7YmyXjluMKMHaerpjww9bx8oLBdqH9m875R/n+7
 F5f5YZ7Zj0xPFI/iXpLAM4JPGTSv2IMFr66WYfWeuXtO5E+LTqCIo8MYdxMoxekZbLI7Es
 Fpdk6GLfU8O3QpOl3qkMCfP7n2L7O7Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-274-6pOxOeeLPzWfVCicp5tw9A-1; Mon, 09 Jan 2023 10:56:28 -0500
X-MC-Unique: 6pOxOeeLPzWfVCicp5tw9A-1
Received: by mail-wm1-f69.google.com with SMTP id
 fm25-20020a05600c0c1900b003d9702a11e5so4989690wmb.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 07:56:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PnT7BPGpKx4CXFPh0sQkwkxOICmbO+wBQS/21+/GroI=;
 b=J+zvzLGP79XQD3ofygZlHBxPjUUs44XJajY3l8IIt8Lct2ftktYNBOFiA/iUbrx6WM
 Cd5yiHZ8bWL1tK1OL09lo52fjfgRrFfnondi6iePNeP0Tosp5oJKNKx0nfVV74EB8T3a
 1pVcqBFLQ5qJ6bJDWap+ZiAaTU9RAgcuoz/l0qhzLrgB/MU2DAneMPxOismjWEqQACFb
 mCtxyF17dNpoeN7h5j8p8tm0QK4vGi6CyGqKOAdwabHuKsKIEOvwNErN9BoPxr2fzwg8
 aiEr8a0L5IxfrM/T6TJEYHn4PlqF+EsO4Zvud0M6FQBoRz65cWe6k3zDELckegLzR1Ng
 10/g==
X-Gm-Message-State: AFqh2kqXUphijvRDy/U0mcj5ZMAIeYlFh1oE+Nx4lRzs3k2rntoFTdsP
 dn+lC56n119gNyjiQwi3gVA1hMqw8V9UvlQymhHQr3c1pHze9WeYH+i2Kx0uNUIRHN1Gu1U5hKO
 OboHBo05yT8FI6hI=
X-Received: by 2002:a05:600c:4f96:b0:3d9:ed3b:5b3e with SMTP id
 n22-20020a05600c4f9600b003d9ed3b5b3emr3971354wmq.19.1673279786961; 
 Mon, 09 Jan 2023 07:56:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsdSUVIKhK0/O8BC0JSCTEzOfdJeRHeFJGMfOoYi2VJfWYGmdZcTFtXGHlV47/RKp/+6+aXPQ==
X-Received: by 2002:a05:600c:4f96:b0:3d9:ed3b:5b3e with SMTP id
 n22-20020a05600c4f9600b003d9ed3b5b3emr3971341wmq.19.1673279786718; 
 Mon, 09 Jan 2023 07:56:26 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 j6-20020a05600c42c600b003b492753826sm11213442wme.43.2023.01.09.07.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 07:56:26 -0800 (PST)
Message-ID: <39362914-0c20-69b9-e213-8fdfb295fb9d@redhat.com>
Date: Mon, 9 Jan 2023 16:56:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] build-sys: fix crlf-ending C code
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 kraxel@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>
References: <20230109112110.128967-1-marcandre.lureau@redhat.com>
 <20230109112110.128967-2-marcandre.lureau@redhat.com>
 <0b04303a-20a6-d4fe-d9bc-0940e475d24b@redhat.com>
 <CAMxuvazQMf==JGTMMSEMZP30DNTTpZ3bVYB8EiKf1mSaJaM_vA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAMxuvazQMf==JGTMMSEMZP30DNTTpZ3bVYB8EiKf1mSaJaM_vA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/9/23 12:47, Marc-André Lureau wrote:
> Let's try that. A quick check reveals that configure already still has 
> perl usage. I will take a look.

There's already a patch planned to remove it ("configure: remove 
backwards-compatibility code").

Paolo


