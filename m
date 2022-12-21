Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DBB652AED
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 02:22:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7nnJ-0002bH-EM; Tue, 20 Dec 2022 20:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nnC-0002WJ-Dz
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:21:10 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nn9-000742-GY
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:21:09 -0500
Received: by mail-pg1-x529.google.com with SMTP id 7so4427623pga.1
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 17:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ofFQRv43hsfLPOcqEkWUMEYLyP4Ozl5EKkvjhfXuhpY=;
 b=QKIsMTXx+CrpJMWuePRn8S/YH6YzIW7oFNsShRdYBv86PWpgHLDQ6uiToOAVYzuTc/
 qF6+Cd67gfWVzbzFdI4+7dMbcEUTo8z9NvFrf6nZX+WhW24akI4IOW+kLbXhI+AEeFp6
 TU1Fx1qS7+BJ3OiT4ZGB+EQVgf8l39Q3S4oG76BDPNQjcGTNCXF+yqrnFjSDdsGudxHr
 WtP5HV/AdoJksXTGtXFeQIqg0E8kAtdV5NtcUVBGB2OwRx5mZnl6j6maIWVhPLli7vT6
 /yEC4D5GH+1BUyHAp23raZ7rFDNrUlPyZI9LRNRmuoSGXlnFu0N6JcofDDQf13BE9Msy
 6KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ofFQRv43hsfLPOcqEkWUMEYLyP4Ozl5EKkvjhfXuhpY=;
 b=uHQUfwpjVRVOwa4CXSIKbS3xQTQgQcKVJAIAQoLmdLcaR/pcYza09flCApfwaFfVoy
 M0Ld6yhLTqXu84dKeqy+EhF9LelkN4XYRe2P0jkuTdjVTr8rfwR7Cm88M3BoAwP0zR0h
 Gku1XWsdGT3bbjx4ml3Z0oT1IKCi6dALpf276jfdHEgCStpS928CjnMQv/1R9JLYwAJ0
 cJ3W1d/9XVcroiXcwxOk6OPQMe58861RPVICw2O3DDRhY1eeoVCYW0/4g/M+4FhOxucY
 OPoLrzwXKXJWp+s+CePM6MWarRlF4VlO4qVqyzdNnZZfBS8L9EMLLbSj3o4LUphb/m7D
 SIjw==
X-Gm-Message-State: AFqh2korqBhJa8wciM4cP7G1IJRhF/QffW/3JYmtOvjKeVmv99wV4xke
 9qsuqegp+TqbrlQ901aIlBo0TA==
X-Google-Smtp-Source: AMrXdXubx/jtLcyoQ9X8iGbDIpA8q30re5eRWz+WC9Gl5YD6Vuo9fuVYZ/dYEh+/7rY/UdsrLS35BA==
X-Received: by 2002:a62:8305:0:b0:577:13f9:576 with SMTP id
 h5-20020a628305000000b0057713f90576mr400267pfe.24.1671585666033; 
 Tue, 20 Dec 2022 17:21:06 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3efa:624c:5fb:32c0?
 ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 d15-20020aa797af000000b00577c70f00eesm9280327pfq.22.2022.12.20.17.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 17:21:05 -0800 (PST)
Message-ID: <a43b92a3-1f13-e509-fbc3-6471e33d98bc@linaro.org>
Date: Tue, 20 Dec 2022 17:21:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/5] target/arm: Move PC alignment check
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20221220220426.8827-1-farosas@suse.de>
 <20221220220426.8827-5-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221220220426.8827-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/20/22 14:04, Fabiano Rosas wrote:
> Move this earlier to make the next patch diff cleaner. While here
> update the comment slightly to not give the impression that the
> misalignment affects only TCG.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/machine.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

