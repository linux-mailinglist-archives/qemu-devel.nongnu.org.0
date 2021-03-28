Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991FB34BD62
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 18:57:30 +0200 (CEST)
Received: from localhost ([::1]:54524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQYjB-0003gR-MT
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 12:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYiF-0003FX-3n
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:56:31 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:42957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYiD-00043q-5r
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:56:30 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so10032502ota.9
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 09:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PoRVupONyaXsPjw4N9TBnUTVCiy2lXzh6mNoiqgMbT8=;
 b=lILDGqb8CbhiTms5oEgd4ZXiC+ek53aOPbjLgYFJPlD91V/J3UTwiZ9rQStN5XlK+P
 dD3qiQQQnIaZZpeE3PFgvqvzSaTb23uH5VGI3opcXuaMPzTIXXnnpk5qn45X956O4t7j
 dvOYU66ZVwxFSO/BGNGETlZzv69GA0KLfmCYdmgt447jydPLu9uw+6x5GCo5yKCagVQi
 gZQ3ZnSNUaZaCJE8vqfPHavYRNawA4DU0E2f+W/7QynULswcuExz3ObPoNem31U6YvfN
 5Mib+qDzcRoOl44nLWAPadKk7lKJsvwOIrvDTu8Cv56MVqnua3P3Qg8PTY1g+30XkIcm
 ZCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PoRVupONyaXsPjw4N9TBnUTVCiy2lXzh6mNoiqgMbT8=;
 b=Rj0UWRrLwIgG1uOecJTmXiMMO0Xroqv9nU2u7CXs99zAbHjrjug6rh+bk7Eqa11ovV
 Cyx6o+mQGkdtFmxg28qwh6QKohdeym/hEZMRC/udOkNVHtgNg6e7cyc6rhW6BCvykqEr
 Xc4W0mO4AXpIrMnkI2mI5wkjASQXBhS+vBUqblNNcWyV5shlAT/v5MK4fk7HZxo9Xo0H
 nruIaEA3ny2TPPWFt5mqObCDYde3WyJjKkQKb1ufVZYAQHubMe7eLkbllCDDNf+N9vQS
 0Krb0JrnmjNtesd3x8f9Az09IzlmysWKtLt+PvuPnrxfx6M5NbrW+PnclYjkx0xFBAlK
 CnZQ==
X-Gm-Message-State: AOAM531UZLJhsnRBuHw7kxkwp7BY/KOQDmQdEQVCDkGkKlulkQKctiQZ
 VTe1AXvHDicHmgweNChCpwkX0A==
X-Google-Smtp-Source: ABdhPJye9FxlMbivFfJu3J9JEjoeVOlcRKxZEHCal1L5ygoJ2CS/zEfkc+BUcRMVUOi81r26cQOV0Q==
X-Received: by 2002:a05:6830:619:: with SMTP id
 w25mr19722275oti.371.1616950587691; 
 Sun, 28 Mar 2021 09:56:27 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id d21sm2977095oic.54.2021.03.28.09.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 09:56:27 -0700 (PDT)
Subject: Re: [RFC v12 36/65] target/arm: move kvm-const.h, kvm.c, kvm64.c,
 kvm_arm.h to kvm/
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-37-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f0688bc9-5ce9-8e5b-e506-e5c264d24225@linaro.org>
Date: Sun, 28 Mar 2021 10:56:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-37-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> +++ b/MAINTAINERS
> @@ -398,7 +398,7 @@ ARM KVM CPUs
>   M: Peter Maydell<peter.maydell@linaro.org>
>   L:qemu-arm@nongnu.org
>   S: Maintained
> -F: target/arm/kvm.c
> +F: target/arm/kvm/kvm.c

Reminder for a different patch: this line should probably become

F: target/arm/kvm/


r~

