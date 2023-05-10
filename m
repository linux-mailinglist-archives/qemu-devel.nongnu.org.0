Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2259F6FD860
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 09:38:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pweOC-0004Kk-4T; Wed, 10 May 2023 03:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pweO1-0004K2-Ct
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:37:24 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pweNz-0007DG-Sz
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:37:21 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3078cc99232so3836615f8f.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 00:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683704238; x=1686296238;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lJS64U1dT0oLSd/OzLThptxzaXLtX7Aip/H0VPSPlEQ=;
 b=XKJSdLKT2FIraG01FCSHCBcKVIA2eNuFOt8A2UIIfG9sSCYLHvwHeh9rMi5XlDMi97
 /fbYQ5S+lviWc5EoUuQm1hc/8LjQZukXDT8rwexsDjgFaMKf9YrNh6GP0FKeJnvIxwOg
 awYMDLSgxikMuFxfzRj9Rs9Ad78g1Bc5OwKVnaUVhozdOCahHeGPidL5NKuYZV0bLNQP
 t6rfxA/TNyub9oHqABvw4whVM1dAVBrdAKDT41mTDJneSQwJfAVft8zTH9ExBLDyMIPC
 y86SYY/wkJJlBrfz3CHBMnuGLwfSCp8mxR7UOaGS0xjqZjFEPuSdZ0/31ybZfbMdvfjy
 f2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683704238; x=1686296238;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lJS64U1dT0oLSd/OzLThptxzaXLtX7Aip/H0VPSPlEQ=;
 b=JmbhQ4AHZMKIJJGQEunJ84sMyONz3LwZpF7sFUUUswPAsAV2TaNhmbkkncR5zz9t22
 L1VgG9jICQjmC6NjlWzX852XENhLYP8HUmD2OuXcux5hJs8KGTIEr4J8J3dclecuzfuj
 4LK0LxqRnbnuxMk0DqeT3MPLQ3uPZryEOKC7BcMHvXbnxmgJp1ExlcKrE75pz5L+UCFg
 8GwW0aOdT+DTasB3lB90kZOXGa/YpkOeQ6+LUrV8Ry0N6PKJ/c472qhCt1EuGe3b+Y2Q
 W7wej0VjrFWJCAXC6kbPbPXdDFQAGQ0Nr/LFMIrDe3I0NSr32XU0gXJAhd5gClWykMO/
 +mMA==
X-Gm-Message-State: AC+VfDwgoQdSj75dBXEe0CdpCCex6I/OEGolx5PRWHtBtENLMHRSrbHQ
 sNux17EZ9+Q9QtJ0a+zAwoVNpg==
X-Google-Smtp-Source: ACHHUZ7gSRilirUkVCzW6cRIN9a3rPtDqIE7L8oHZlc/2t3BWU4VvnN+UGuvcEjd/+nAxYxrLMLf3w==
X-Received: by 2002:adf:fb0b:0:b0:2cd:bc79:5444 with SMTP id
 c11-20020adffb0b000000b002cdbc795444mr11985168wrr.2.1683704237940; 
 Wed, 10 May 2023 00:37:17 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.62])
 by smtp.gmail.com with ESMTPSA id
 q9-20020adff789000000b002c71b4d476asm16616199wrp.106.2023.05.10.00.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 00:37:17 -0700 (PDT)
Message-ID: <941f81dd-6ad1-8bb9-f29d-30021be07e8a@linaro.org>
Date: Wed, 10 May 2023 09:37:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 06/12] audio/pw: trace during init before calling pipewire
 API
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, dbassey@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
 <20230506163735.3481387-7-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230506163735.3481387-7-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/5/23 18:37, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/pwaudio.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


