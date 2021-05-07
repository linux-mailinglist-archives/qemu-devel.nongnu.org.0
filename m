Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC53437691E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:55:49 +0200 (CEST)
Received: from localhost ([::1]:44590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3lV-0004tQ-0d
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3cY-0008Qs-O6
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:46:34 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3cV-0006oP-RT
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:46:34 -0400
Received: by mail-pg1-x529.google.com with SMTP id s22so7544554pgk.6
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 09:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rB9LiT1V6LVkX2DLXGAkBmQOUBYFTn5tLQOk3fENW84=;
 b=bftVdJmpYniwRd+iJfYWvwjelxkoR+jrEoYiccWAEq6OEdJebVVali9psHBD+1XBEx
 5gtE/ey2Qgat4DKwuc1061XCWQuRuAlsIP9sjUB1stqoZRUtV4FACSItNT8QKpUFZ1DO
 ZXUBbqQXL6Z7DSR+hyaQG5lVY0chqLZ9YlCmQtogPfy5cwYxKCPnzx/wez9p4CCJunJv
 NpbHhav+AZ2zet+v0mU7YmYOQid4BWMmXb8wKM3ZXvidtra83o15W1vn0+4egbhGgDnq
 53qUNJm4xNEwa6asDlm3lUWk+N+/NEQVCu836bqgVArUBSuTqhij+ZJ6/HiIe7EdLVns
 0TQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rB9LiT1V6LVkX2DLXGAkBmQOUBYFTn5tLQOk3fENW84=;
 b=lLsw/SqZ9pjsz3x9s3CA0JE8VrahJV6lh3W2j/hhs6Px6X1NVtR2Kel+f6uk7hs+Uh
 Gy7wWztwykIGjzPcQ2JOf5IrpyIYMfEvFTLV8Ysr6XfK1/4eGqk9Y99ZnnlElVZtn/Fa
 rPneUEFDRT/oM9lxqBl2jdDedIaU34KleOjReoFL5o+/0IkOPY93OkPpORdgCmkTdgpn
 DUlJlOHavb8rvG0OqiiwjFNVa29jyNJNRpwz6jMMSpor26z3byCE5Wa8dOCKekJSAAAm
 ngqrVQD3GF7MgtUXp48Z6PM8HenukYHyRT0DZ8MFsc4COYzrNmQF8xhnNBQvUFhrWY8O
 PtpQ==
X-Gm-Message-State: AOAM53098+5YUbdTyH14li3d0A+iy37IZXY2w8NN9qGylq/9IKAoAeOg
 WQdD9rmXx1qJBzAKk36bhB6FDA==
X-Google-Smtp-Source: ABdhPJwbMr8nrMUWksqTGu3ccp3OdG2kFW6jOe1c5eMVlsUxzCFt987Nu1npLrBUKcAvSDfyiWDJtQ==
X-Received: by 2002:a05:6a00:882:b029:24b:afda:acfa with SMTP id
 q2-20020a056a000882b029024bafdaacfamr11104005pfj.72.1620405989327; 
 Fri, 07 May 2021 09:46:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h9sm4737946pgl.67.2021.05.07.09.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 09:46:29 -0700 (PDT)
Subject: Re: [PATCH 18/23] ui/vnc-enc-hextile: Use definitions to avoid
 dynamic stack allocation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-19-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b8384d80-3ad5-4dab-2fd1-aa70b2929884@linaro.org>
Date: Fri, 7 May 2021 09:46:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505211047.1496765-19-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 2:10 PM, Philippe Mathieu-Daudé wrote:
> We know 'pf.bytes_per_pixel' will be at most 'VNC_SERVER_FB_BYTES'
> (which is actually 4 bytes for 32bpp). Instead of having the compiler
> use variable-length array, use this 'small' maximum length and
> autofree to allocate the buffer on the heap.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   ui/vnc-enc-hextile-template.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Wait, you know the value is small (max 4), and you don't want to allocate a 
constant 1k on the stack?


r~

