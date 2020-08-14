Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D74244C78
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 18:09:08 +0200 (CEST)
Received: from localhost ([::1]:46592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6cGR-0005aV-35
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 12:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6cFh-0005Bc-K3
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 12:08:21 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:55241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6cFf-00070a-QO
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 12:08:21 -0400
Received: by mail-pj1-x1042.google.com with SMTP id mt12so4615249pjb.4
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QphRXOd78W6JEY6h7IGK51aIh4djJr2vbdw3VZTcAXg=;
 b=xfBQEksniJANG1DEbUCD4CdIlI2VauOWP2capwq7zOwK3dP44n3CB9ugy3Jm7xyu9G
 dKbFvWaPzFiGtqJAEs2YXiiNCwUG2sud2vPZWwIG8K6K18nSD+hgxCO05wyjyYXkufiZ
 xqOMJhyZ5ss+27Rdl4wI1clQdwnE/gi4xztRBofMPCFml21twXKZQtASng8uuQQD39bk
 eoNn+pdlbhPyC0uzAqwhu4Yn2jr0qnvLbjSwc1JgB6lr1Gr1lvzBDPlKlK4a3Q0AqeHF
 Mu5hOVKgN8R0RLSaLVE4EYJwYFNpP3DD+pvlDGncwPPmcXMLgkqGcAqk+DQMTtJixipj
 Bm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QphRXOd78W6JEY6h7IGK51aIh4djJr2vbdw3VZTcAXg=;
 b=itwW02RBO55vpkj8O3P38t9EUEWkDO5bWfPB96Eygt8lwqEGWli+OyAQzs7wmJDHB3
 zFiNkFC76I4EjHYvNSdYuRAn+3SHAzCILi0ROp8Xc2wZ73/9ggFcrLpnrhMsoHdpfmlv
 Hibs2lArAj+RAbUwQg6WGJYqeYh8003SyNgQ/A5Ye99IVWNJwi44zWflecfEesFgzyQu
 7GUH7e8xARx+C6ch3vsguvS/FkgkkAnOgSs5R1WNJgjF1BwF/TZz78olfkLhKhL+MJ+/
 3PVpCj/fJ/RWJfJc+OVI4kqkwSbSrX6DAv8fn7saS7CJ1GYwWCDepxbeTpQeN8wDvhQX
 OdJA==
X-Gm-Message-State: AOAM532gNvtzbQ9fFGJ/TfDW05TvSJAvXJENmZOJi6lEbghYvqpDJRWS
 /v5uMZKub+tEoZHDpG5h6cnV9w==
X-Google-Smtp-Source: ABdhPJyW9JZ8n43rijQh1WdP4CvmypgCU3a4I9eJJvTNh4zNYYNWYGQEjE7s2tnTMLDPHOwvkEnlMQ==
X-Received: by 2002:a17:902:b683:: with SMTP id
 c3mr2567725pls.248.1597421297339; 
 Fri, 14 Aug 2020 09:08:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 7sm9712871pff.78.2020.08.14.09.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 09:08:16 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] target/arm: Implement an IMPDEF pauth algorithm
To: Andrew Jones <drjones@redhat.com>
References: <20200813200243.3036772-1-richard.henderson@linaro.org>
 <20200813200243.3036772-3-richard.henderson@linaro.org>
 <20200814092626.g63wbmvt5yvadeeb@kamzik.brq.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f03443e2-df9d-cb19-f964-48ba821a28ef@linaro.org>
Date: Fri, 14 Aug 2020 09:08:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814092626.g63wbmvt5yvadeeb@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: mark.rutland@arm.com, peter.maydell@linaro.org, alex.bennee@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/14/20 2:26 AM, Andrew Jones wrote:
>> +static uint64_t __attribute__((noinline))
>> +pauth_computepac_impdef(uint64_t data, uint64_t modifier, ARMPACKey key)
> 
> Out of curiosity, why do we need to make these computepac functions
> noinline?

Oh, heh.  Left over from profiling.  Will remove.

> I think this patch should come before the last one. As it stands, when
> bisecting between the last one and this one a user could attempt to
> enable pauth-imdef, but it wouldn't do anything, or it would potentially
> break things. However, this patch shouldn't change anything if it comes
> first.

The current patch ordering would enable impdef but implement that with the
architected algorithm.  Which is ok.

But you're right that the other ordering makes more sense.


r~

