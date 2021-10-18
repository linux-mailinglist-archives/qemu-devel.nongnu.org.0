Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A004B4326F0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 20:55:43 +0200 (CEST)
Received: from localhost ([::1]:40206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcXnP-0002SQ-AU
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 14:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcXlr-0001lX-Bn
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:54:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcXlo-0004TF-Lu
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:54:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634583239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aoP1fv0vKQTo1Qs+2mr8KlhpAlGQUJ5X0GRLfMFaDp8=;
 b=QhHseZ8njUcvaDHOuzBXEAIF1O3dW+VDakp3laHAuBug6G84QLSS1SVXepPqIwAbXRFfSN
 p0AmiVbgtSTmFwa5YD/T1kmqF8NbHpjtvfRXVl9Q/dsU0Yagoju9nz+K81/1AUlSrH/3Em
 2IOyEFraGg3jhJFET5XDUkRxDBSFk6U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447--yehs_rfMkqwRlWYbwhRcw-1; Mon, 18 Oct 2021 14:53:55 -0400
X-MC-Unique: -yehs_rfMkqwRlWYbwhRcw-1
Received: by mail-wm1-f71.google.com with SMTP id
 c69-20020a1c9a48000000b0030d95485d90so55547wme.2
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 11:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aoP1fv0vKQTo1Qs+2mr8KlhpAlGQUJ5X0GRLfMFaDp8=;
 b=GKD523otJQPDgiiv/xob01YSS4iCUD0WD9dXcodHVP4q6J/xOgdflc0qGQw8jGftDy
 XsRKkdh4O2i/qgW99JoDZdO8UQWCnUFilU+ie80VLuunC+y8E3tBn8WA/FEmgdeP3kkf
 7u4eNo3FtUkFe2SoYrN4OekR3HyMOUXVTKxDZW69E8qLxE0Gp3FpJjgrAlQzTPvAhOgv
 PvpBqY1LONoaDHa/IT2rUOoG7M/r+DbLYS70AAI0onLcFWJ9asoBRlq9Mn5GkunnRPE0
 2T99YcPSmj11EmAECZ+NyRJ3Nm2ibwSorLsgItW5F5Aqi9HtufLGLGBgkSgem5Lma4lD
 +MaQ==
X-Gm-Message-State: AOAM532Na/5oEyIjV/34L/XjeTxqduXReN2ovoyUdjsKdDbnXExxHIAH
 I4WL4X3IZtj6W9q+OtEed3j/OaqJhJbEGXAdvDng37rD1DNIbnIcgztgNK2ncvx8wwDjNu7pVtv
 TxHnriBKj931qreY=
X-Received: by 2002:a1c:4455:: with SMTP id r82mr734409wma.100.1634583232836; 
 Mon, 18 Oct 2021 11:53:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIdNg/oiROFeTMwxtkLg9JcseyGb5Kw4hfmb1ENH5ZPIjcnFyO9X7neT8DuGzLcpw+9hn5+A==
X-Received: by 2002:a1c:4455:: with SMTP id r82mr734379wma.100.1634583232603; 
 Mon, 18 Oct 2021 11:53:52 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id z2sm12897574wrh.44.2021.10.18.11.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 11:53:52 -0700 (PDT)
Message-ID: <0a381361-56b5-3fdf-e405-702f5d90aaf3@redhat.com>
Date: Mon, 18 Oct 2021 20:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 0/2] roms/edk2: Avoid cloning unused cmocka submodule
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211018105816.2663195-1-philmd@redhat.com>
 <5c870452-03d2-6d1e-a49c-ca2201d04972@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <5c870452-03d2-6d1e-a49c-ca2201d04972@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 20:10, Richard Henderson wrote:
> On 10/18/21 3:58 AM, Philippe Mathieu-Daudé wrote:
>> cmocka website SSL certificate expired, making CI pipelines
>> fail [*]. However EDK2 images built to test QEMU don't need
>> cmocka, nor oniguruma. Avoid cloning them.
>>
>> Note: scripts/make-release is neither covered in MAINTAINERS
>>        nor in our CI.
>>
>> [*] https://gitlab.com/rth7680/qemu/-/jobs/1685387520
>> fatal: unable to access
>> 'https://git.cryptomilk.org/projects/cmocka.git/': server certificate
>> verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt
>> CRLfile: none
>> fatal: clone of 'https://git.cryptomilk.org/projects/cmocka.git' into
>> submodule path 'UnitTestFrameworkPkg/Library/CmockaLib/cmocka' failed
>>
>> Since v1:
>> - Fixed typo (thuth)
>> - Added missing '--' shell separator
>>
>> Philippe Mathieu-Daudé (2):
>>    roms/edk2: Only init brotli submodule to build BaseTools
>>    roms/edk2: Only initialize required submodules
> 
> Thanks a lot.
> 
> Tested-by: Richard Henderson <richard.henderson@linaro.org>
> 
> I'll queue this to target-arm.next.

If you don't have anything in your queue I can send a pullreq
tomorrow, otherwise thanks for taking care of it.


