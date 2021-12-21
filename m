Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EA347C9AF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 00:27:37 +0100 (CET)
Received: from localhost ([::1]:39946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzoXg-0007tG-Kt
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 18:27:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoVi-0006TI-4L
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:25:34 -0500
Received: from [2607:f8b0:4864:20::102a] (port=55929
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoVg-0008AS-Nl
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:25:33 -0500
Received: by mail-pj1-x102a.google.com with SMTP id iy13so604199pjb.5
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 15:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=UI+dLO69O3AcEUSE0Wj3Ks/LpBJiaciz2mz+SRp0bb8=;
 b=KkP2XPPvdO8mMXCiOL7bdCK3dvvR8UV59nZ/7v4ddKO6nTRCVehDpxo2bPC1zN3T1I
 KeQu40ZKWLdZ2FchfqGFS8fa+iO6pzNw53zRTlHPjjITutZfpmBpGbvn5zJlIvj1m3As
 OY2MoHcWELQcwDyU8Pgp4mSz3uTfsa7OOew2e3V86rHRRkygLBN3xMpCjW+QM4WKXDbP
 y+0YWfRcAbzofBUmtwYdr6Y5NtBaBsGl4nebnZo5vjWt2/4sTsB2497G/SeMgA8FAYH3
 GInBepp0rUR7L1XNxB+oe8fO6lok2XzHRyxByLg1iCpP3vmArm4fGMGLrxTnABUpAv6o
 uaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UI+dLO69O3AcEUSE0Wj3Ks/LpBJiaciz2mz+SRp0bb8=;
 b=UKSp8hoWqyJvD2ChmXUfnjyUs+VG4jnaMaPTlOsJlrxOLtlc/5Jnjaz2dJs41+QY58
 2hZAb6Ciky3wfiWjBUv8fql6Hsaeln+3vDxUc5YLH/ftnA04FyLA93TqG/AfOvSOPRuq
 aHwvFDHpc2hjFsrnRUU4OOe3fLYJhr9/Hpi793Zg9JzPZJ46+kNGT8QDI/yW8VvrwZIP
 Fak4/r6u6r0bHQfqM330zP3UPgGgqTD7xnvfiBxE9bs5U5vDZjahJmVY4xRj+PBV8d1S
 f7LwazXMPBa45b/8Wm/HIMX2If+QR5XuYNxnNkJU+xaI11Ji6Xg3hH6OWwEFp9PbBuVT
 9OpA==
X-Gm-Message-State: AOAM531mLJyeI5R7YImSRdgs41wCt11iZHvrROXrzaD6kaV8z8hYR4yM
 ySbLOnMI3uIp23oX8PpebtbrIiSJn9QWFg==
X-Google-Smtp-Source: ABdhPJyHEpfi393y5OZZCShMrxyJaOW8mHqpcymjWBosQb7suq7+zqGyw4dbP8YalGY6ovrUsMhAZQ==
X-Received: by 2002:a17:902:76c6:b0:142:644e:e9a with SMTP id
 j6-20020a17090276c600b00142644e0e9amr465061plt.6.1640129131421; 
 Tue, 21 Dec 2021 15:25:31 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id p10sm162938pfw.87.2021.12.21.15.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 15:25:31 -0800 (PST)
Subject: Re: [PATCH 3/3] linux-user: netlink: update IFLA_BRPORT entries
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211219154514.2165728-1-laurent@vivier.eu>
 <20211219154514.2165728-3-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cfaa7495-5f70-1233-1b26-060518401588@linaro.org>
Date: Tue, 21 Dec 2021 15:25:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211219154514.2165728-3-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
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

On 12/19/21 7:45 AM, Laurent Vivier wrote:
> add IFLA_BRPORT_MCAST_EHT_HOSTS_LIMIT and IFLA_BRPORT_MCAST_EHT_HOSTS_CNT
> 
>    # QEMU_LOG=unimp ip a
>    Unknown QEMU_IFLA_BRPORT type 37
>    Unknown QEMU_IFLA_BRPORT type 38
> 
> Signed-off-by: Laurent Vivier<laurent@vivier.eu>
> ---
>   linux-user/fd-trans.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

