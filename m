Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151026DD53F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 10:24:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm9HI-0003yL-OT; Tue, 11 Apr 2023 04:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pm9HG-0003wQ-Rs
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 04:22:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pm9HF-0004uf-7V
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 04:22:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681201376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HG/M8TJ4fBlV2diEhWAzx10PRJEBipKI4CbRHAyaraI=;
 b=hwyd+VRMmAYHJwFa6jl2no9iqoNSXS++eJC+WhovK1Rq+lbSvQXBApmWQe3IYOXCmTz0vM
 lHkZq8FQdJjeY12XFcsYaCmn7CxknyFC8s39l68JK8MINRUXXxL3LypKaj0/RdIKSm3Qh7
 7rXplH2/JFj7IrHT5psdIecro3gyUhU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-KJITnAGNPG2UukT-b4vh0Q-1; Tue, 11 Apr 2023 04:22:54 -0400
X-MC-Unique: KJITnAGNPG2UukT-b4vh0Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 n36-20020a05600c502400b003ee93fac4a9so4753265wmr.2
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 01:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681201373;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HG/M8TJ4fBlV2diEhWAzx10PRJEBipKI4CbRHAyaraI=;
 b=d9HH11eaCOaWh7CgkPhMGPy4El95T0Khdz8jtaal+R/DEZ9dBd1rp7E1clYOulZgTi
 1YzUzODD8XcYERbknfvpVJPAg2cVZSjWpRY0EgUg6MXjnq4RvDkcotawXsh821ePJvDY
 y7aQfWW3pPwaB2VJ/yLw2SpxKiGZK505A9YHmoxgjE89bqx9cb4ThgN28c6jlcZc8A2U
 ttGTOVVHqS2eIWm71rAU28MyQ+wMl2yhitoD3+N4yykgqD8qftshtKoNgFDIg4/jIbSv
 dY4mpTQVBcs4gOkrkTvAt9fR/xOceZhxcXkke3hJFP6UQ45YJkBZzMPzcg3INXJWPaFq
 Potw==
X-Gm-Message-State: AAQBX9euVvcYlGVjd3DMO0wzFsgrBjPe0Zh11HLvjVS+6QK9z9ynbfvX
 jscLge/wkSPcrfbB08Ib8opLDUYJ+Qnd4vTowC6znkVd0wjskMKo/QmCr0B6xqIb3BhCqs3NH2W
 bDZPXg0dv/QCYc0I=
X-Received: by 2002:a1c:7917:0:b0:3f0:3a43:aa70 with SMTP id
 l23-20020a1c7917000000b003f03a43aa70mr6280899wme.24.1681201373496; 
 Tue, 11 Apr 2023 01:22:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZDa9TdwthKBO24PRrNiBVxM7FJqPw2NSIaQ4Assjx0pfxYMY5HX4mMH8V5FKGv4/+1qGoszg==
X-Received: by 2002:a1c:7917:0:b0:3f0:3a43:aa70 with SMTP id
 l23-20020a1c7917000000b003f03a43aa70mr6280894wme.24.1681201373220; 
 Tue, 11 Apr 2023 01:22:53 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-153.web.vodafone.de.
 [109.43.179.153]) by smtp.gmail.com with ESMTPSA id
 jb10-20020a05600c54ea00b003ede2c4701dsm19789262wmb.14.2023.04.11.01.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 01:22:52 -0700 (PDT)
Message-ID: <9bc1b9c3-a54c-8a59-5b68-af8d63037142@redhat.com>
Date: Tue, 11 Apr 2023 10:22:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/2] Raise crash-test-debian timeout to 90 minutes
Content-Language: en-US
To: Camilla Conte <cconte@redhat.com>, qemu-devel@nongnu.org
References: <20230407145252.32955-1-cconte@redhat.com>
 <20230407145252.32955-2-cconte@redhat.com>
Cc: Eldon Stegall <eldon-qemu@eldondev.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230407145252.32955-2-cconte@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.246, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07/04/2023 16.52, Camilla Conte wrote:
> When running on the Kubernetes runner, this CI job is timing out.
> Raise the limit to give the job enough time to run.
> 
> Signed-off-by: Camilla Conte <cconte@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index ba6f551752..893f8c69b4 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -98,6 +98,7 @@ crash-test-debian:
>     needs:
>       - job: build-system-debian
>         artifacts: true
> +  timeout: 90m
>     variables:
>       IMAGE: debian-amd64
>     script:

Eldon recently discovered that the crash-test-debian jobs takes longer on 
his runner since it has KVM enabled and the job tests the devices twice - 
once with TCG and once with KVM. I assume this is the case for the 
Kubernetes runner, too? ... we should likely add a switch to the 
device-crash-test script to provide a way to enforce running with one 
accelerator only, so we can keep the run time in a sane limit.

Anyway, for the time being, this patch is of course a fair work-around, thus:

Reviewed-by: Thomas Huth <thuth@redhat.com>


