Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC1B674146
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:51:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZzz-0006pd-JP; Thu, 19 Jan 2023 13:50:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIZzx-0006n0-3K
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:50:53 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIZzv-00054V-LI
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:50:52 -0500
Received: by mail-pj1-x1031.google.com with SMTP id o13so3311954pjg.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GdyIqDBORKeBIB2nqzTteC62DEqWIRgpw3MYBaoO79k=;
 b=o0QBdw2FW1W0XFLhImcQC8ks//Xpte1wwEstxPreCiU2aPYvY8L9mpthS/ybGnv20Z
 x7fsrVscCD2FORWmV1alL7cEeGBX4A4sFJmTDyaMoCZxuyrhPLmDJXd0drFkyJW7D/6s
 Pf1jE8ZADB+FsKA3qOHvFidv4aI8IfF19XFZNlzY7RZ4EF99xr89saJkPcP4urwjKyKb
 6LZjv6Sio/eaSnozgYfYRLmhOgf5j/2y1OHg7p/2QW6n3ljXdQ1My8eNMNfWsp+BIuj1
 MB9CPQ0pR71GyXeKimXZ68Cla+KtOa+9kzRghLz2BPZefQ6B6V1hyBeIF3/hSZ1pLtG9
 auLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GdyIqDBORKeBIB2nqzTteC62DEqWIRgpw3MYBaoO79k=;
 b=jZA8HSeaV+HCA2w0BSgBvP7tNqUNGcX1Z1ldq3iKQRh5nY+3ta8sNF+CQQHdHb+oUI
 zoeYy9isPZnHwHCR4W+j2a7Q16x6EnGY2oy+aQ6uEm/peCO3Nvg/OpW4Z2+rTOsjzT9L
 szGvvSsx04cO43eAqopEcNAHLBlpo78H6bWHAeYTdoT65LMCvsygsX2XDdxRr83DnXbF
 /+PiobXDHEIEMSdt5K54qkqYB5ctUtKzFtnuMfh33FdZz1hmdVxtLvexTvrkWMWHGnkA
 TlYjLSrAVoISxk1D1U++6lUsUqK0aeYG0BcTbgdvowrmXataKI+VwqIrNSpaCuqMR/c4
 OTMw==
X-Gm-Message-State: AFqh2koOR+f2RIhK9gDiwWxWmOD9fQV8oAZHbGjeoisxIYqvRa0IEUZf
 jKNU0G/3ZjyqABV+FQRTuqGvHA==
X-Google-Smtp-Source: AMrXdXtyBA1xw4TzTDqX8pIhH+F79cS6awa9UalcOABaKUzLnLkp7UhbXhxMDHqOkOANGzLNCEjdAA==
X-Received: by 2002:a17:90a:6a42:b0:229:4dd1:359b with SMTP id
 d2-20020a17090a6a4200b002294dd1359bmr11952790pjm.22.1674154250072; 
 Thu, 19 Jan 2023 10:50:50 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 z15-20020a17090a66cf00b002293b1aa2b6sm3366176pjl.30.2023.01.19.10.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 10:50:49 -0800 (PST)
Message-ID: <d700c608-f886-8b6f-1ecf-bc48cf671153@linaro.org>
Date: Thu, 19 Jan 2023 08:50:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 15/15] arm/Kconfig: Do not build TCG-only boards on
 a KVM-only build
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-16-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-16-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/19/23 03:54, Fabiano Rosas wrote:
> Move all the CONFIG_FOO=y from default.mak into "default y if TCG"
> statements in Kconfig. That way they won't be selected when
> CONFIG_TCG=n.
> 
> I'm leaving CONFIG_ARM_VIRT in default.mak because it allows us to
> keep the two default.mak files not empty and keep aarch64-default.mak
> including arm-default.mak. That way we don't surprise anyone that's
> used to altering these files.
> 
> With this change we can start building with --disable-tcg.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> sbsa-ref has an explicit check to avoid running with KVM
> xlnx-versal-virt has avocado tests tagged with tcg
> ---
>   configs/devices/aarch64-softmmu/default.mak |  4 --
>   configs/devices/arm-softmmu/default.mak     | 37 ------------------
>   hw/arm/Kconfig                              | 42 ++++++++++++++++++++-
>   3 files changed, 41 insertions(+), 42 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

