Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDB0559E9E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 18:35:37 +0200 (CEST)
Received: from localhost ([::1]:58310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4mHP-0007b0-Nv
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 12:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4mF8-0005t5-Te
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 12:33:14 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:46705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4mF7-0000X0-5R
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 12:33:14 -0400
Received: by mail-pf1-x430.google.com with SMTP id a15so2977934pfv.13
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 09:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6OeQwIuQFStdBs4LyhqmlT+aG9IgcNnH4jcFaNVZzRo=;
 b=mnoUVXRl7SIGVRWHjbk0g++RLgDNwvLEfINHLM8itqDlFfypzPsP4z6A1VYvGZUifL
 ncKPauua9jU7ynFX0ZlIIA5fbz1U7AhsT7Ww7ELD0d5NkdXjFuW1K0BPjH8k6MOKFyZv
 gAI0LBIqCUEooc7eyJz7D5xDJMcavzNuMYv0juCoWZ0i+CGnQv4xhH9JpIohPWZdj5Av
 +/zhs+8RtiUl+Yoo3wb2NuwRNnZiceqJzAJuCVVJ1SbdxrznnF3ytY23pCO6RN/+H66G
 uaBl2tXrFThFBbRFpG5ksyWQgLz+uCqHAnRu9D56a72q3SpdTodoJl9WRBkUsHk+UFrE
 /Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6OeQwIuQFStdBs4LyhqmlT+aG9IgcNnH4jcFaNVZzRo=;
 b=FZ9LfZN2QDyVxVb2Y/c0dlHdO29ZNj+peT5347RSBESPTYpRLiHRpGqbrhOPbRoj/Q
 HPnZvY/+LZwKrgL5Fuj+1BkpgjEdvU3eZIOdV+A8xicI2d/20xESwgCdt7vjAI/9gNdX
 e3OE5RqyEyx0WQBGm2wPOj2SyYBBmRu8zNLSoJP7M60baEXUsAVFV/r5jZ9JrBwWBAwy
 UMfoGBNd/utfYqzMtqieQlfyjW8RZCd8C2K3KGKNemKUePTlL661DqW35Dh829Ho1JWL
 R1WR7BgEKlnW4OKSOBsSy/RkDgT5Fyh+9n8vYY9s1APYo4Xu2qe0oAH+MwYevF7gxIoa
 1X8w==
X-Gm-Message-State: AJIora9SET430VYh9qbJpao+lZy6rQ3TXx+OuPWcC46J9wVHPHSGEBCE
 HSbxNeUyYX5QgFQBoI8T6f0=
X-Google-Smtp-Source: AGRyM1vxvGBPeSmQxVqBDmzzmolicBQpuzrrBMO9sxPkM+Vp1+PsBCnT3RKYsg8fAkoFpaCQrx37OQ==
X-Received: by 2002:a05:6a00:21c2:b0:4fa:914c:2c2b with SMTP id
 t2-20020a056a0021c200b004fa914c2c2bmr43612098pfj.56.1656088386665; 
 Fri, 24 Jun 2022 09:33:06 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a17090a764f00b001df4b919937sm4130884pjl.16.2022.06.24.09.33.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 09:33:05 -0700 (PDT)
Message-ID: <975da3ae-0d92-7422-88cd-7eb7c4b60488@gmail.com>
Date: Sat, 25 Jun 2022 01:33:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 0/7] cutils: Introduce bundle mechanism
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20220615155634.578-1-akihiko.odaki@gmail.com>
 <6edab96b-9585-5a37-d992-68d717be2c63@redhat.com>
 <00e86718-b1b9-1622-79aa-a6f44623df09@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <00e86718-b1b9-1622-79aa-a6f44623df09@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2022/06/16 18:18, Paolo Bonzini wrote:
> +def destdir_join(d1: str, d2: str) -> str:
> +    if not d1:
> +        return d2
> +    if not os.path.isabs(d2):
> +        return os.path.join(d1, d2)
> +
> +    # c:\destdir + c:\prefix must produce c:\destdir\prefix
> +    if len(d2) > 1 and d2[1] == ':':
> +        return d1 + d2[2:]
> +    return d1 + d2

This is from Meson but buggy so I fixed it and opened a pull request for 
Meson:
https://github.com/mesonbuild/meson/pull/10531

The script included in v8 has the fixed version of destdir_join.

Regards,
Akihiko Odaki

