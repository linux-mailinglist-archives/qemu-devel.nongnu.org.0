Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DED6F039D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 11:46:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pryCg-0002SY-9u; Thu, 27 Apr 2023 05:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pryCf-0002SH-11
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:46:17 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pryCd-0007Vt-Em
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:46:16 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-94a342f7c4cso1529458566b.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 02:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682588774; x=1685180774;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4cNKaioV6sPY3+Y/S6Tv89VR5Ryndy/ckEzzk+PhmEs=;
 b=cmxSyksuRNTtLMWpx9Me/ins9oOCyhWRBhWoBPmnNr3mH79yyqFZZQZcRJ3WCGSn41
 hkZfdxKlF0NYnvwDA++DPqgZopl8h9XsO6l7JM/kHZXWHXNK+27HSIceG0ZqHQxE1UmF
 kr6dCXTPQKXRKlWXSauT6G+ptqcGwIFK8O2ByhJFcyItbCxpWkaAfRvT9ELUVgvbjHC4
 wv1biTAMgv665WUo/Ff3MlPjn1WlpH+gzZlWyyirPRNLZm5JggnFcmsub2+TxZEruc5s
 Aer8lb7kL0/Vx/McpOD48SH8DkBybJW+oDpBA5+6p/XOXm6hHd1TG/7ct7pzXXMD8Zlc
 qy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682588774; x=1685180774;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4cNKaioV6sPY3+Y/S6Tv89VR5Ryndy/ckEzzk+PhmEs=;
 b=S1C3nxf2SOAcDG4FoHuhP/FnWi7xXcHizwNW72fdvlpO6WMT972JIITD3ezvxLkDwi
 S+jnNgTBeRX4+5zUtBPmh2oZFPV508tOqy/Kk+XFRISbBkIFbBlYuBRvwEdZLUDwuTzi
 jnIo0k1QV038q9vPzHSgs7sI2iRvm8NaxhtJhTS9Vk28+2m6wZrtDbG+lxSnKKVeuaAN
 wcPNwc0XQTOdwwe1eNRiBPtaLReDXPpPnhqjW+YYit+XGzGHPEYQ1L2fYnTakBIl+49A
 v+YjdeK2FmaWaEf5T98RZ3D+LQKdXOrZK4yv56bULLKC/trwOCCNrBUdJ0fOSBl1UA6f
 8DgA==
X-Gm-Message-State: AC+VfDwmqm+3gW9gzRFaTkGFzSjc0mZ4S6VkhFbX+h0Wo3nFPkPwNMXX
 B5SA8D2FGdutNk4YQ+JNL+Zl/g==
X-Google-Smtp-Source: ACHHUZ6gj/wBE3+F5NhgsDLAlpKZQ6Fh7/2Hcy28iSJ+Fth0uMEdfNnHi3I0Cnq77IEK2+fcuBaCbQ==
X-Received: by 2002:a17:907:3f9e:b0:94e:c142:df98 with SMTP id
 hr30-20020a1709073f9e00b0094ec142df98mr960070ejc.60.1682588773801; 
 Thu, 27 Apr 2023 02:46:13 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 h26-20020a1709070b1a00b00960681949cbsm143252ejl.134.2023.04.27.02.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 02:46:13 -0700 (PDT)
Message-ID: <2ff8a8b8-c36a-3dc3-9602-1b947da95c5e@linaro.org>
Date: Thu, 27 Apr 2023 10:46:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 13/13] gitlab-ci: Check building KVM-only aarch64
 target
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-14-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426180013.14814-14-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 4/26/23 19:00, Fabiano Rosas wrote:
> From: Philippe Mathieu-Daudé<philmd@linaro.org>
> 
> Add a manual new job to cross-build the aarch64 target with
> only the KVM accelerator enabled (in particular, no TCG).
> 
> Re-enable running the similar job on the project Aarch64
> custom runner.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> ---
>   .gitlab-ci.d/crossbuilds.yml                         | 11 +++++++++++
>   .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml |  4 ----
>   2 files changed, 11 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

