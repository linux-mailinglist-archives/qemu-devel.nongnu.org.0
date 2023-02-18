Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B8C69B7FB
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 05:10:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTEYH-00057E-OZ; Fri, 17 Feb 2023 23:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTEYD-00056w-9b
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 23:10:17 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTEYB-0005BT-LV
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 23:10:17 -0500
Received: by mail-pl1-x632.google.com with SMTP id jk12so227434plb.5
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 20:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7KwD74Vm0bAcpTRrg13yCtPbFdrKuth2pM1n8Sv0j4M=;
 b=YMv4WnO6A0Ta1Q8ORxUhKfVaflAZypj80uXD+VRf2VqXHQdGPg6p4HY/XIXHXGi6R5
 vwtbRxAd8s5oD61cbwLOjO/5IRGoXshVE+JjYkVtYe7Bonx79mgpwKhNj1Onxe8P4mUb
 RKsccR1ZoMB90spGU8OHnk2wqFc2Tdlumts/ny+d5WFk8JvCzXM3JiMprh7hg9GJ9K1g
 XTiMA3knSUf67TgPcymeHPiyAEoBEPhNK+833S83HA984jfWpWy86w5ZVOL2nCU9rrsE
 qsqCFF2goeCrL2ZhHdCfNh67xjWIavzyzd7NeP8xihXu+tUkucCx+Z7j8dicI6tYkVTC
 lACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7KwD74Vm0bAcpTRrg13yCtPbFdrKuth2pM1n8Sv0j4M=;
 b=dQCC2rOYnDLYhRW/jY2MiHHNzDim77WbzEPZSceUWg42uYHMpcZWdF2pcxxMEUQq1F
 LULANmrVHnCtBL7MxJfGbsP6Xp5e6YuHqSgVIRc8dT6fPG5FV1roYf4AqEsV12WmfTex
 ugb0OE55KPTm93P9fPtkuINV/RKqHBPpVRDqDN8/rruHVeH0YSCMhG/N1eWZyhEoJLhy
 njGf03aIXZjq+Asxkzlqs3GTz0mNFR+MN53z0wgT+Wbg40+mraV68AbM7tjT0rs1qq6b
 C6EqFlRWIomlExf2gFNY3ktImreOHAesfCoMcStEyUwbLG4XouEQTZhPF6kkLyp4iBku
 YzkQ==
X-Gm-Message-State: AO0yUKU43uqI7wKcVb+OstaSAoX46d2vIiT+Qy1msEUr2rKxrMKpoXDI
 eG4+UIjc62QKFrjrZnWb0NpKIgDaNbOo6JTUQCM=
X-Google-Smtp-Source: AK7set/ZzINWOafUS18Rnvpq648FdMoxMjQoCIl7IetkPmzaYcpccRoclOZ2ptzGjsHW6iHrP0WM6Q==
X-Received: by 2002:a17:902:e5cf:b0:19a:a80e:a6d5 with SMTP id
 u15-20020a170902e5cf00b0019aa80ea6d5mr2760460plf.23.1676693414019; 
 Fri, 17 Feb 2023 20:10:14 -0800 (PST)
Received: from [172.20.100.240] (rrcs-173-198-77-219.west.biz.rr.com.
 [173.198.77.219]) by smtp.gmail.com with ESMTPSA id
 b16-20020a170902b61000b0019a97f180fcsm3814578pls.37.2023.02.17.20.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 20:10:13 -0800 (PST)
Message-ID: <24485c5a-fbbe-a406-7392-f5753bd7b6ff@linaro.org>
Date: Fri, 17 Feb 2023 18:10:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 07/29] target/arm: Wrap TCG-only code in debug_helper.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230217201150.22032-1-farosas@suse.de>
 <20230217201150.22032-8-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230217201150.22032-8-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
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

On 2/17/23 10:11, Fabiano Rosas wrote:
> The next few patches will move helpers under CONFIG_TCG. We'd prefer
> to keep the debug helpers and debug registers close together, so
> rearrange the file a bit to be able to wrap the helpers with a TCG
> ifdef.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/debug_helper.c | 476 +++++++++++++++++++-------------------
>   1 file changed, 239 insertions(+), 237 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

