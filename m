Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E006EBEAE
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 12:50:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqXHE-00039J-1L; Sun, 23 Apr 2023 06:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqXHB-00030u-01
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:49:01 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqXH9-0000mW-8N
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:49:00 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f19323259dso22559175e9.3
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 03:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682246937; x=1684838937;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YIwxGyoLTrDeLMLk7+DKwRmeTNXNiokhIl+azqB5Qk0=;
 b=eMyNKXOLsyIeIRKkRY/0cT+gdN6S9QREu5Fcj/WWcltcm7WSATZ5f72TMBK0iQO7Ze
 cjzYXsZAYQKE/G/YuYNAf5YOCnR9WMthExngpSvxb8d0PeLFQO/uUz/PIA9iwqIYT6gy
 fZ1rciUTZMs0sMZWaqriY4Nz4HY6JfIBz2LdXVI5nJX6q45hnX6hlvJ9WxEwpIN0soKw
 U70jQn638UXiOvPwlrn9NcdbuKXWnyEw3ZQh7BuN8xQZp8AZ7asdg+Qw6rlFzzUA02tJ
 xBPi1u+t+kMzBUvTKCR1R+OOnsK9lB6WuVonRMuoOxDhFa3y1zFCzYpv66lgNQarStow
 /7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682246937; x=1684838937;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YIwxGyoLTrDeLMLk7+DKwRmeTNXNiokhIl+azqB5Qk0=;
 b=M09dqgf5hjjKB//HmWGyxAhK0fyMzl6WnvXvRor1n7Nj1IxtOfs+W4aIu6O4yPq4da
 x2mqigSBZOu2pTcEwT/Gk+gOi96Zt6KXuEwu2iHosSwj3jvFmtjKeDKGNQvWMiAMCUIj
 A0d4+eIxviMLnvpihW21GaB30FYcVK3KQk/fC2Vqhmuny50ti230E1rDPtIYFo10OL3A
 rpeFN4KBZowPrfKYGJdLwLsSIzYIQ27oXtwHoSUe6fnb8qsNtD5ZGfR3wgT7iGO9uHqx
 r6vjbDL+56j8h1FA+c69AUs1AzT4H9nUl0nmOr9xdcvSj+pSOa3QuXIDen6LeUZklFmh
 GXog==
X-Gm-Message-State: AAQBX9dl98xyJtUCigDhl1SovxKJvi1nQgplSaGSE5/3TGPEgtxuwFVG
 LfzHfBZiCrNd6rbCPA8wtXcJmg==
X-Google-Smtp-Source: AKy350Y3/a8UssFO8Aui3O0cgpDzzRDNpZss7cAkwqwqvPXcLYmWk+2cbUqPQc19g8+GLHIZnpUZ9g==
X-Received: by 2002:adf:ec86:0:b0:2f6:fb98:fa62 with SMTP id
 z6-20020adfec86000000b002f6fb98fa62mr7644023wrn.40.1682246937406; 
 Sun, 23 Apr 2023 03:48:57 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 f11-20020adffccb000000b002f90a75b843sm8395312wrs.117.2023.04.23.03.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 03:48:57 -0700 (PDT)
Message-ID: <84b45be9-cfd8-7602-5277-ddbb3722e0a4@linaro.org>
Date: Sun, 23 Apr 2023 11:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 02/11] target/arm: Remove dead code from
 cpu_max_set_sve_max_vq
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-3-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230412121829.14452-3-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
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

On 4/12/23 13:18, Fabiano Rosas wrote:
> The sve-max-vq property has been removed from the -cpu max used with
> KVM, so code under kvm_enabled in cpu_max_set_sve_max_vq is not
> reachable.
> 
> Fixes: 0baa21be49 ("target/arm: Make KVM -cpu max exactly like -cpu host")
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/cpu64.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

