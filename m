Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077AB3388DE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:44:25 +0100 (CET)
Received: from localhost ([::1]:47228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeLI-0008Uc-3Q
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKeKO-0007xf-E3
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:43:28 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKeKL-0008Df-Ps
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:43:27 -0500
Received: by mail-wr1-x436.google.com with SMTP id j2so4411145wrx.9
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 01:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8h8glkBqqtpkvy2AhsPWRlpRcgV8pFFmUg18MhJYKk0=;
 b=E58VM+sHTbocjWMCupuMUATvWSYmDs1bXTrkHLdYe7BRoXlqf6NRbW0NkEsInDugQf
 0i2G/RliYrZT+K3sDZ2G3/6k9exPYsqJNb0ZpzYT0+wZS9R+YgALoD8tuVWfWrpb2y01
 opCcf1mVXzWDfXQ86kRr92LaWWrwWaQGPZxax79reuXj7uELXCQQICstuCYdr5EyTMqZ
 hR3Rg9+NFStqFezf6HZAsY9Q5/s5lOEb/K7mHEflbNusH0sh9WwdzRr3+3sf3lfcRRGd
 a0OkMWYYlhaZNluIppkUCUMJVRoS32yRqEbSG7EwbvN274rKpC9nVeqwB7wbJQ7VNw3k
 9jTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8h8glkBqqtpkvy2AhsPWRlpRcgV8pFFmUg18MhJYKk0=;
 b=Jy6L7myiGpRj5Gvsp3ehbBG9l4MPoFmXNvQsGDLc/g26st16aittYPevlIkAdhlwwM
 MbSch69fbxpkL3p0Lg6zZx4TfGKlJmH8ah0reOn+mASvkJysByaeh7ZVeTYOez8BW2qH
 CPDfSFeyb7hROkz5WBvDhKtfT2ctf3mZKmYuULcXZXzNkfO2IzoYeeAyMtD1FX9OrbV0
 pyQTYL+/oncRgZtL2kSBtBo9Yjt1rdUmWFxo2Im/IU5Z4+ZoMygtvgTxYgZh25mcrFgq
 MfxPyOCoR5EFFKMJj9WulFxj7j337gKHlFlamR3wJnONTnjrrG54g0Z548DNSgj0es/d
 iBcg==
X-Gm-Message-State: AOAM530SNwveqpAnZ+j9k7a/2OvIRrrgDeOVhVvEkZqc3ZtKmmQHk4bG
 adwqBtPqGUlR498ShfcX3xk=
X-Google-Smtp-Source: ABdhPJy3mo+qwWuc4FeGTvkAPy/8MSn0eNk+n9Yk4XiGMlX0g0BFbHQ31PE8+OCxYGIPwyM/xWuLHQ==
X-Received: by 2002:a5d:5047:: with SMTP id h7mr13548271wrt.111.1615542203282; 
 Fri, 12 Mar 2021 01:43:23 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u20sm7793901wru.6.2021.03.12.01.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 01:43:22 -0800 (PST)
Subject: Re: [PATCH] target/mips: Deprecate Trap-and-Emul KVM support
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20210312010303.17027-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6169a38a-884c-ed4c-141e-4d3974b6554b@amsat.org>
Date: Fri, 12 Mar 2021 10:43:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312010303.17027-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Paolo/Thomas/KVM

On 3/12/21 2:03 AM, Jiaxun Yang wrote:
> Upstream kernel had removed both host[1] and guest[2] support.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=45c7e8af4a5e3f0bea4ac209eea34118dd57ac64
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=a1515ec7204edca770c07929df8538fcdb03ad46
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  docs/system/deprecated.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index cfabe69846..a409c65485 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -496,3 +496,11 @@ nanoMIPS ISA
>  
>  The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
>  As it is hard to generate binaries for it, declare it deprecated.
> +
> +KVM features
> +-------------------

"------------" else Sphinx complains.

> +
> +MIPS Trap-and-Emul KVM support

Missing "since which release" information.

> +
> +The MIPS ``Trap-and-Emul`` KVM host and guest support has been removed
> +from upstream kernel, declare it deprecated.
> 

What about adding an accelerator section and add this as a sub-section?

-- >8 --
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index a4515d8acd3..9c702a4ea7b 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -292,6 +292,15 @@ The ``acl_show``, ``acl_reset``, ``acl_policy``,
``acl_add``, and
 ``acl_remove`` commands are deprecated with no replacement. Authorization
 for VNC should be performed using the pluggable QAuthZ objects.

+System accelerators
+-------------------
+
+MIPS ``Trap-and-Emul`` KVM support (since 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''
+
+The MIPS ``Trap-and-Emul`` KVM host and guest support has been removed
+from upstream kernel, declare it deprecated.
+
 System emulator CPUS
 --------------------

---

