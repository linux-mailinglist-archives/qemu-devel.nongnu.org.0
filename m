Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6B86AE2EB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:42:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYWO-0003oU-Tt; Tue, 07 Mar 2023 09:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZYWM-0003lw-DA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:42:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZYWL-0001O8-0g
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:42:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678200146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NABdQQJ/xuKdY+s1bn326aYeX4tBG+lYfpCSZKaeLLs=;
 b=Qpx8hlaWPcHo3PQbd6ul+3U/DFd6KYLQ9grz5YTjsJ6WHoN5tu5reX6a2JI9m5kjilFZQ7
 Or3sytOVf8Pbg1oqEOnxeET9/mlvH6xoVNYZH4l7dMi46WqEvlebh44H31JA5J/QTN2VdT
 tB9ICw00ZPmq+ft5uJqvOcXwg4btul8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-H7B126PoOPW2fXRD0PyzVg-1; Tue, 07 Mar 2023 09:42:25 -0500
X-MC-Unique: H7B126PoOPW2fXRD0PyzVg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k20-20020a05600c1c9400b003e2249bd2b4so4869627wms.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:42:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678200144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NABdQQJ/xuKdY+s1bn326aYeX4tBG+lYfpCSZKaeLLs=;
 b=BDTwijtd7Va7XrQd9U2DXxP+tefF7QGzYgpTK9rN1GTfN+245Stm64xDHci40j+gus
 V4mXl1zmtFoULag4G8xGQ6JMPFS/LUPS+NMsBooJYImy0hTwdAAtg82C+zQVGeVNLDBe
 RZR2clN8ivEmET1FSAMuzoBXZGPWSaqYRgNWFroUnWjdRJliUsXUveRdzVFqsCWpWKCU
 jDaJZqLqOSih9oI7GxprroYbSyHvuYMATrpyLL6Z4+C8xiVEWMzKwTC9GvylkG1Z4kbo
 wUtAXAL5Y4zCxezi7rQxcQIT12/5liGCWDwCXOhAd71cfQ6k928X8D7AgK6Xouzt8gdH
 tjrw==
X-Gm-Message-State: AO0yUKXbQvHNszbm0xy3MjPyELfj6TI8fIn3PPl1TsDtczbJf+SOQRp/
 9UuklKKZAujxLF17o6cW7oE1pI3YPpUOHtH20z13CKi4LvbHI6XviQJ4cP1fvy+XobDCF9WivQL
 HLuhdh58sop33YuE=
X-Received: by 2002:a05:600c:1c95:b0:3ea:f873:13aa with SMTP id
 k21-20020a05600c1c9500b003eaf87313aamr13789893wms.40.1678200144389; 
 Tue, 07 Mar 2023 06:42:24 -0800 (PST)
X-Google-Smtp-Source: AK7set/n8JsdmqG60Unt4GqhRVyL3zaW1dj0juuSMQWEUPqbvBQqh8h85kYfATUbGJoLVGaMvcOCRg==
X-Received: by 2002:a05:600c:1c95:b0:3ea:f873:13aa with SMTP id
 k21-20020a05600c1c9500b003eaf87313aamr13789883wms.40.1678200144111; 
 Tue, 07 Mar 2023 06:42:24 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-96.web.vodafone.de.
 [109.43.177.96]) by smtp.gmail.com with ESMTPSA id
 g11-20020adffc8b000000b002c7b229b1basm12850836wrr.15.2023.03.07.06.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:42:23 -0800 (PST)
Message-ID: <87c3eff4-9b15-69fe-3fa2-42dde26b5a91@redhat.com>
Date: Tue, 7 Mar 2023 15:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/5] scripts/ci: add libslirp-devel to build-environment
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
References: <20230307143819.510186-1-alex.bennee@linaro.org>
 <20230307143819.510186-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230307143819.510186-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 07/03/2023 15.38, Alex Bennée wrote:
> Without libslip enabled we won't have user networking which means the
> KVM tests won't run.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   scripts/ci/org.centos/stream/8/build-environment.yml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/ci/org.centos/stream/8/build-environment.yml b/scripts/ci/org.centos/stream/8/build-environment.yml
> index 0d094d70c3..1ead77e2cb 100644
> --- a/scripts/ci/org.centos/stream/8/build-environment.yml
> +++ b/scripts/ci/org.centos/stream/8/build-environment.yml
> @@ -55,6 +55,7 @@
>             - librados-devel
>             - librbd-devel
>             - libseccomp-devel
> +          - libslirp-devel
>             - libssh-devel
>             - libxkbcommon-devel
>             - lzo-devel

Reviewed-by: Thomas Huth <thuth@redhat.com>


