Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF48479677
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 22:44:45 +0100 (CET)
Received: from localhost ([::1]:42568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myL1v-0004Sr-W0
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 16:44:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myL0l-0003mo-7i
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 16:43:31 -0500
Received: from [2607:f8b0:4864:20::532] (port=41924
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myL0i-0001rF-75
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 16:43:30 -0500
Received: by mail-pg1-x532.google.com with SMTP id k4so3344069pgb.8
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 13:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=4fLdFSZD8ZA98+tR+1oVtJtD3RoUlpwTr1xVCgJCuSM=;
 b=eFXLNPV+k2th+YJOSPDIRydyoe1iymnI4C+iIRQyTcejn6JB9t0YNu8QetrGQMtS8N
 oEKDifm3D/sXJjeeeE6BgcLI96CVxL0zWsrknmFYVl3aGELKiqUJ3iRP/6u/Klt67Erx
 TR519tnte3rnqWGnny0az6bEWlmN+6BaBGv87H4OqB3JkovpEZ+H9N2COEcwcIWJvMKY
 lZh+Ues5O8Csu8KD9QXDTUkde4jCuskxLCNLxy5taDi5iXfS5RTCRCR4g3aR0Db/3sJA
 ReamHd94Mdd4YV6oYvOcQBq2cXlPqY7DPFk3AZjzLCu2WLvTGkuPAu3aqnRXcTONaLuv
 ZnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4fLdFSZD8ZA98+tR+1oVtJtD3RoUlpwTr1xVCgJCuSM=;
 b=eQvVJLp/E/ZJbB7wKBsTH3Kt7CHp3omh6dP59u42vxGoA1I/6GNOjEFUeOkTEClsGY
 TtOQ+irlMClFu5kvXoCc8WKwaYTNKi7T1S/mMDdN8wD2k3zWzK4syP0YtFBGonHagO0N
 LVuWp7kWcl7VvNXaoymopK85hNTw4xP3HFfQXII1L69zerXC5Dk8wZYu9VjmgIGrSsQw
 3dRWgbzeZ9qIVzRbzBrL42nuZ3Ia2cOpLACId6P6pCzQ4P5s2tzGrCp9LdOp5VkLegCs
 Udy05G3HM+pqLQy6GcAv6ZMcJQjwrwBmxBbOzTSvj8hEGzzDsdN9eOSGTSIy2/Ic5YNO
 dEbQ==
X-Gm-Message-State: AOAM531wfJQiinxLxLgA6GVzyHNVQ5U2efF7DvYPe+gMoqSK8Hgl5FNv
 xYIvqoOoIr4PwZ8nY8qxCr4A6FXT7X93zA==
X-Google-Smtp-Source: ABdhPJzwJOm2bXvbJ5BU7hZxiz5j2T0zyefYhEJ2X5V9ai/AihrQr8xjAHLaspvLQKCENAkjGQx+QQ==
X-Received: by 2002:a63:470a:: with SMTP id u10mr4589821pga.346.1639777405516; 
 Fri, 17 Dec 2021 13:43:25 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k28sm8846946pgl.69.2021.12.17.13.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 13:43:25 -0800 (PST)
Subject: Re: [PATCH 06/10] configure: unify ppc64 and ppc64le
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211216085139.99682-1-pbonzini@redhat.com>
 <20211216085139.99682-7-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b1410e36-9e9d-1631-ab79-036e94f0f406@linaro.org>
Date: Fri, 17 Dec 2021 13:43:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216085139.99682-7-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 12:51 AM, Paolo Bonzini wrote:
> The only difference between the two, as far as either configure or
> Meson are concerned, is the default endianness of the compiler.
> 
> For tests/tcg, specify the endianness explicitly on the command line;
> for configure, do the same so that it is possible to have --cpu=ppc64le
> on a bigendian system or vice versa.  Apart from this, cpu=ppc64le can
> be normalized to ppc64 also in configure and not just in the meson
> cross file.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure              | 10 ++++------
>   tests/tcg/configure.sh |  4 +++-
>   2 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

