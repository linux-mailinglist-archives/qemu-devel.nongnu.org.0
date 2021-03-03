Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696A332B9D1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:24:39 +0100 (CET)
Received: from localhost ([::1]:53848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWAo-0006p8-FF
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHW8f-0004Jd-Kr
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:22:25 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:43199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHW8a-0000IZ-4r
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:22:21 -0500
Received: by mail-pg1-x52c.google.com with SMTP id n10so16976678pgl.10
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vYOD2GZ8Of5avJDFVcI4uN28XvK1zSZ0VnYQ72Hy/xQ=;
 b=On7cM47R8tKy8rMp9NlB5HdkqZkRs3Fe5QX6yjHiLPdZTNBhEt2d862KCC++gbn9qS
 CafL55mMXZM/ALKeMcSg+Bhdz76yFOUtlJlSA/bTIKG66wBehfzuorEhzhK9iL5fMc8V
 Pmrn58P87ZnQgQTSffLSgdLgHai92lhDQGRXssrzV5LgIro/T2to8qIowMOtyPYlZU8/
 CStVHAQ07vXNoGSMjUTLP53/6w73VPW0D7sjNwpRB/u8lfSbhjz1fJVN7SdwtyqbBrlC
 p+0+f2UJYM6c3voGB8lfAVP3nVZXKDhFCiVYyteVUHkxfSdt6W71JH2gKU31+xQpoXjO
 1rvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vYOD2GZ8Of5avJDFVcI4uN28XvK1zSZ0VnYQ72Hy/xQ=;
 b=WWSabnrnJrxU3qJ7nApGN7Bv4UhiP9afCcS3SDCXDSFZrWeIsJXFkQFInJ9mIgw7EO
 BHYxcY2dVwjhcfLt0AozTbY0fybTSadhmKElJ7jU+3zhr0prST0077lNjdncV+7xrF2Q
 arYiS6BduLRUzXiYEQ+6NHy95WIDfq++fxZR16JqP+rs/D2QtVHaXf3mues0zp+Gc0hn
 8o71+qvgHWFRPoLKC2DWVjFuKCXDMPnanJosesnBQGvChCt4I1lbYLjojLzMcq/v+ZVc
 5xYbG/0Zh5mdc1LVITPDN2e5JtGT6qXqWFjaPPZHoZqQWRpZb3t3IIoGEoGDoRm026Y/
 y3BQ==
X-Gm-Message-State: AOAM531Yrt+37CkiJqY8Tf9ZFzD/P0Y6rGwAT/Fw2oo9bBc6VxmViJ4E
 Vd3XDWNb8OvrSJfAA2fQGUlXiA==
X-Google-Smtp-Source: ABdhPJzGkOuDZzegnAl6hCU4f6P/Y4MWRKBiJbKLdHQoft5wRRGb+LuFTsgFVLlXQsFyW0cfjdqAzg==
X-Received: by 2002:a62:804a:0:b029:1e7:d747:de3 with SMTP id
 j71-20020a62804a0000b02901e7d7470de3mr112117pfd.38.1614795738393; 
 Wed, 03 Mar 2021 10:22:18 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id f3sm24667783pfe.25.2021.03.03.10.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 10:22:17 -0800 (PST)
Subject: Re: [PATCH v4] target/s390x: Implement the MVPG condition-code-option
 bit
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
References: <20210303132850.459687-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8f1a438a-9876-95fa-5825-3d2fa5121aeb@linaro.org>
Date: Wed, 3 Mar 2021 10:22:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210303132850.459687-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 5:28 AM, Thomas Huth wrote:
> From: Richard Henderson<richard.henderson@linaro.org>
> 
> If the CCO bit is set, MVPG should not generate an exception but
> report page translation faults via a CC code.
> 
> Create a new helper, access_prepare_nf, which can use probe_access_flags
> in non-faulting mode, and then handle watchpoints.
> 
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
> [thuth: Added logic to still inject protection exceptions]
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   v4: Add logic to inject protection exceptions if necessary

Works for me.  I was considering adding yet another cputlb interface to help 
with this, but this is sufficiently clean that I don't think it's required.


r~

