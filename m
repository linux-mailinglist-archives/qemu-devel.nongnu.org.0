Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FB46F24B6
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:34:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjld-00041q-DZ; Sat, 29 Apr 2023 08:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjlZ-000418-2D
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:33:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjlW-00087H-MF
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:33:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682771605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LBHGvAj4TRTOmHr4KPEyjcnJhPWBeukowU+V2sswzqY=;
 b=IDItJTn1wBiWO2AHHnVrwCjJqw8UMYg0/sib7cIvFOF5tL79MgGNSO+9eS+/TLDO7HybfH
 WHCGT5JCdhQahRu3FzMZCCY1Nu34szZg9FVFEFkwIitJKC42EZs/VkXeGttR5v9/yWYAvG
 gCVSXQGQ6o79z7rTZ1xuKsi9ArNFDGg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-A17S2hWeOTKUT0tMf-M-5g-1; Sat, 29 Apr 2023 08:33:21 -0400
X-MC-Unique: A17S2hWeOTKUT0tMf-M-5g-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-509e422cfb3so852013a12.3
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682771599; x=1685363599;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LBHGvAj4TRTOmHr4KPEyjcnJhPWBeukowU+V2sswzqY=;
 b=Y/sPTqNhq2cUIEzaXCTh8w5E1eJ5o/yrtp8ov14veeI9I3OOnCRL7C2JkkDLYzy5RB
 rNSdJDgb/qG+OoH0Eg0bTN4mrd69IIyUsnLlAkP/mOe8vfc35z0uv4ZQ72DWq6O2DzxJ
 /WsnErDX6EKvvDgReXUHr+zqLgRO7AL+IyCRPepPv5ATnsG/xGNBcCymZPvphIk1tDPM
 YBCBV1HGkYoMH7S2XN6AVJM7iky+V15qlVAR0jjeM69R3GauS0tLtG+C3l71riRkDn0l
 I64EoukHeJfYzH8ohZFF3BeebHuNLU5IRUAbphIYh9YFnLMWyKChf0wUaZt9x+fRZj/L
 W2UQ==
X-Gm-Message-State: AC+VfDwJnQPGTg30Bvyy/2sN6J0UOBIEioqXnxXMDxmBoqqS0VoIeoj+
 7VPNrjL5PHT9cbdLNnuZbho53mDpp2u/6Z0I7ZMHItOocZTuyF7nWPqfiSfkEowkN2MRali7DDx
 Lv1Dm5psD9lDKcBnckvGybGM=
X-Received: by 2002:a05:6402:114c:b0:508:4808:b62b with SMTP id
 g12-20020a056402114c00b005084808b62bmr1424604edw.22.1682771599814; 
 Sat, 29 Apr 2023 05:33:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6flPy231SvlbtZ8MwAhE6xJAgQlBPuAnTftkkL2iio2Lf2ElHPNp7dTYhwHphL4DLZ+jYCwQ==
X-Received: by 2002:a05:6402:114c:b0:508:4808:b62b with SMTP id
 g12-20020a056402114c00b005084808b62bmr1424593edw.22.1682771599548; 
 Sat, 29 Apr 2023 05:33:19 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 z15-20020aa7cf8f000000b005067d6b06efsm10062652edx.17.2023.04.29.05.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 05:33:19 -0700 (PDT)
Message-ID: <12c1fa01-9c1d-9af7-71eb-e9103346d0af@redhat.com>
Date: Sat, 29 Apr 2023 14:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3] meson: Pass -j option to sphinx
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230428150102.13114-1-farosas@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230428150102.13114-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 4/28/23 17:01, Fabiano Rosas wrote:
> Also make sure our plugins support parallelism and report it properly
> to sphinx. Particularly, implement the merge_domaindata method in
> DBusDomain that is used to merge in data from other subprocesses.
> 
> before:
>    $ time make man html
>    ...
>    [1/2] Generating docs/QEMU manual with a custom command
>    [2/2] Generating docs/QEMU man pages with a custom command
> 
>    real    0m43.157s
>    user    0m42.642s
>    sys     0m0.576s
> 
> after:
>    $ time make man html
>    ...
>    [1/2] Generating docs/QEMU manual with a custom command
>    [2/2] Generating docs/QEMU man pages with a custom command
> 
>    real    0m25.014s
>    user    0m51.288s
>    sys     0m2.085s

The 'nproc' fallback will potentially cause twice #CPUs processes to be 
active, since sphinx will run in parallel with everything else.

Is this result with "-j auto", and if so with which computer?  If the 
speedup is only 2x as it seems to be from the "time" above, I'd rather 
have "-j 2" only so that sphinx doesn't risk killing the machine...

Paolo


