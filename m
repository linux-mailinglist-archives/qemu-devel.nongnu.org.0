Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E762EF833
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:35:47 +0100 (CET)
Received: from localhost ([::1]:49258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxxY1-0000lA-Pq
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxxVv-00005h-Fv
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:33:37 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:34725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxxVt-0006ec-7q
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:33:35 -0500
Received: by mail-io1-xd35.google.com with SMTP id i18so10893095ioa.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 11:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KXBl4gh2jUeVrorwwe/XL0xIAaboG1sUzAjyOpvrWPY=;
 b=FtOHzYsAiglWtndrFUr4i0TBsYbMGvbLbpBmYXJw9e3i3/Yxx0JKAmAWLLJ3WgscEX
 MPUTmYwf+2SpXgJ+HM3YDOGxYiqILTc0ZgKsLlg0kE7E5UOxawC25ORhWcilTa28x6cU
 yX6zIWzWesyihzgdd4mhvOei/07efbKcdDCTTknZbS+yFusG94Mi2SeBvJMn2fs4uBuW
 zXt0cniwW71qw6xOrHqiqV1yQk8MBKforARa53f0ohMzz1fgoXdO4KEUlF21Cd26ctJi
 Fr7Tu09eZgRpLukuARie0qmqXhLFb7pxqFELzcstthdd8Sdc87BONs5WdYfKp6Ta5rTR
 1pBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KXBl4gh2jUeVrorwwe/XL0xIAaboG1sUzAjyOpvrWPY=;
 b=DSAvvxn9yELsBBp+EEcteGJym/agJXXjHg6NegXZ9V5Gqk7MzSFAIeNii1dkrwkNHg
 LU7KCkw2RhNXyCWojcZVvJkkKM7DaegNihLhu048st0ivsUWWsKtI6Rb4jeP6dDfmJki
 mbNzKrtgJZ/Y3Ncpm229fFoYghW7uHduInZRIm94nEsGn16mfZBr5ip9ge6bnWMWdoK6
 qWy1x9B7aGtmAZNvZHjgkQmCRrj2MhQy+qaAGHIAYGc96vJDDYg30wMW7/7tOY0BMCYN
 G/6Q69Tks/4skFmF1vsuotY8nXyqKH0RiAGFr/1fXBc2yiGSbEHcN/ED/ph9MP5Jf6WT
 Bd/Q==
X-Gm-Message-State: AOAM533DDxxd8euTbFx9AJQkgOLUALIP1diMlV4u3CRSdAHj6RqNz0Ab
 9B7LQIK5ygEXkRSFuPDZXCIw8A==
X-Google-Smtp-Source: ABdhPJy7WtvI+Em1w3ScQOCFtefnAeh49ET+5LGjP4hs3frGiMGnTMPn+2hmLCbVH+bGLdr0uzSmjA==
X-Received: by 2002:a5e:de08:: with SMTP id e8mr6429819iok.203.1610134411384; 
 Fri, 08 Jan 2021 11:33:31 -0800 (PST)
Received: from ?IPv6:2607:fb90:58e:547c:94a4:bdef:7aa2:3a7c?
 ([2607:fb90:58e:547c:94a4:bdef:7aa2:3a7c])
 by smtp.gmail.com with ESMTPSA id l78sm7867985ild.30.2021.01.08.11.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 11:33:30 -0800 (PST)
Subject: Re: [PATCH v2 1/4] s390x/tcg: Fix ALGSI
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210108132049.8501-1-david@redhat.com>
 <20210108132049.8501-2-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa8193e4-bf56-3ed6-fb6e-524ff1b7bd2d@linaro.org>
Date: Fri, 8 Jan 2021 09:33:26 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108132049.8501-2-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd35.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.241,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 3:20 AM, David Hildenbrand wrote:
> Looks like something went wrong whiel touching that line. Instead of "r1"
> we need a new temporary. Also, we have to pass MO_TEQ, to indicate that
> we are working with 64-bit values. Let's revert these changes.
> 
> Fixes: ff26d287bddc ("target/s390x: Improve cc computation for ADD LOGICAL")
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/insn-data.def | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Oops.  Sorry about that.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

