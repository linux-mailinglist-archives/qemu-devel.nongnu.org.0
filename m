Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB236ABE51
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 12:37:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ98t-000569-6e; Mon, 06 Mar 2023 06:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZ98q-00055q-69
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:36:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZ98o-0000YR-Po
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:36:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678102590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gN0nnKxdoi5gombq+jQAskL9Fp8uecFbYf1nH/ilZ5Y=;
 b=Fz77Hir2V4yUafKjio+Vm4NQsM6D6IQDE5nNc4cfdSObJkHjb54MeINHMvzcxxrFIi8GtA
 7VycZoKC4KRqwoOpZOgKLKdtxu55IpykkwvZeF/y/PowtzQeZk0rwX7vADc6TC2TTn0yCY
 nPMgt0G4qxPfzTzPuQS0uzHW3ekJyDI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-BdSrHxrgPq2SdQlydevnfg-1; Mon, 06 Mar 2023 06:36:28 -0500
X-MC-Unique: BdSrHxrgPq2SdQlydevnfg-1
Received: by mail-ed1-f71.google.com with SMTP id
 m8-20020a056402430800b004cdaaa4f428so10594380edc.20
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 03:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678102588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gN0nnKxdoi5gombq+jQAskL9Fp8uecFbYf1nH/ilZ5Y=;
 b=3WN97QMZqf+tLbUQuCxR2yt5IqW4qt9EQIO5+tKWvzBHmze6GGwTiAb7onIW9xINbF
 GM56S5VjU3k0vbEzz/c4cjK+qmdqh+IiRBZokVGkYDR0JpC9tncjZ/m4cGR06+7QnZZ/
 WmEy1kVfUAROVULOjg/h/dB+x2mxaCMHJxShzLmoUsJtVbm7nHF8jB8A+nFkaC99bft5
 4WMSMSSpEQjhDKfCiO4JPNnay5TFMBNZFuIa+lstH7Pa1ER8Choj/UFqS2zij6hPn1vh
 MZMxiYazV5iMLZbuxCi4oXmoieUhHvXgBNPIe+Aw5r34Hukb+ZZ1lMgKh8Q1iwYdsOOg
 j3aw==
X-Gm-Message-State: AO0yUKWigWwZRMiLkf9znRPYm7EqHZYAcXLktLsWBeJOtGrUNBX3ovl8
 nPsdHBMn9thjC0K6bfF/yT1wF8K+yKFiSgQo7XwLjwboUvdpjW1jy5lUv4I1+aeTHhKX/7Qz655
 wrjMTIAzh4yFgqyU=
X-Received: by 2002:a17:907:2bde:b0:906:2b5c:7390 with SMTP id
 gv30-20020a1709072bde00b009062b5c7390mr9865048ejc.16.1678102587843; 
 Mon, 06 Mar 2023 03:36:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9Auq7cmBk6+7HY5t2YRXj5fBij6zQKEsQBx9muB+fGW8g/HnvVBAUuZooxuoJfV/Wn9dWpyA==
X-Received: by 2002:a17:907:2bde:b0:906:2b5c:7390 with SMTP id
 gv30-20020a1709072bde00b009062b5c7390mr9865030ejc.16.1678102587520; 
 Mon, 06 Mar 2023 03:36:27 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 uo17-20020a170907cc1100b008b17ed98d05sm4435152ejc.120.2023.03.06.03.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 03:36:26 -0800 (PST)
Message-ID: <de1a7397-210e-1c63-e5bc-7b241e6a07e5@redhat.com>
Date: Mon, 6 Mar 2023 12:36:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/4] Add meson wrap fallback for slirp & dtc
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20230302131848.1527460-1-marcandre.lureau@redhat.com>
 <ZAW7DcpRDcGF2VQx@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <ZAW7DcpRDcGF2VQx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

On 3/6/23 11:06, Daniel P. Berrangé wrote:
>> This offers developpers a simpler way to build QEMU with missing system
>> dependencies (ex, libslirp in my case), but also simplify the fallback build
>> definition of dtc/libfdt.
> Do we actually need this facility though ? We've already determined
> that every platform we need has libslirp now, and IIUC Thomas determined
> recently that dtc is also available everywhere we need it to be.

libvfio-user can use Meson subprojects instead of submodules, too; and 
with Pip support probably coming in 8.1, we can remove the meson 
submodule.  Then, the only mostly-mandatory submodule would be 
keycodemapdb; SLOF requires a cross-compiler and the pre-built is binary 
is shipped binary, while softfloat/testfloat are test only and maybe 
could even be embedded.  So there is a path towards getting rid of 
submodules at least for the main QEMU build process.

Also, Windows installer builds could benefit from having wrapdb support 
for the mandatory dependencies in Windows (pixman, zlib, glib, possibly 
SDL).

Since they are unintrusive and easy to revert, I think we could include 
patches 1-3 as experimental in 8.0, though I'm happy to oblige if people 
disagree (and only include patch 1).

Paolo


