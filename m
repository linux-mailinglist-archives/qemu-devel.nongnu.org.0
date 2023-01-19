Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 858D46736BA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 12:25:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIT2N-00025V-6A; Thu, 19 Jan 2023 06:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIT2F-00025G-LJ
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:24:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIT2E-0002uR-3V
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:24:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674127484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VbtSK2KFspvDuVYWNxSXyHBfyDbXnwCYgu4bPkSZ/v0=;
 b=adFytE7tLX86RjOtZ4jBW8teBFi+8b3kP29ayJUo3N/+qo/5sulNcP/GgjLgNis/AMT277
 OYSdCcysr0F3+TtvUKs+ibIlbhms1sOq+RUVoU3k16EvT0bbnjE17bChJqQ/mS9h1V/Ql9
 oFc2SdNY/9IEfk8wK0kuz0dU0njVGFc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-107-k1CITG_kNc6oKwgkWbRdJQ-1; Thu, 19 Jan 2023 06:24:43 -0500
X-MC-Unique: k1CITG_kNc6oKwgkWbRdJQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 a13-20020ac8610d000000b003a8151cadebso778552qtm.10
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 03:24:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VbtSK2KFspvDuVYWNxSXyHBfyDbXnwCYgu4bPkSZ/v0=;
 b=ddZwdmI59kTe7dAPJD58SRMHGcWe8eqF7hwPtC60T1vnhXCCr/nIA1iNRiRAbBb7/H
 mQDPOmOPCuoimKAQyMAf2Q+lzn/GCu5+/poz06m3w1QjXLsU6ZetLAkxHDaBlLTKpqMY
 RWn11vC9Ce68OXIs3dMy8AIQHqrcRJDZ63EwjwRbVoOuUVF/Uu0K1G1uMV7/L4H9ddci
 XqcX/kDTFn2Ze9onPE5rTmUZ1GqPzwmrRH7P5/8DNJcCFB0nALqbcHVIrnubMi0rbvHx
 YxSH8+O4bPM8H3RQslNP91hn4ObwAEQyp5G2WJKiSpdJ7Bg95j2/fxqmXNERvUqv6uK1
 HG5w==
X-Gm-Message-State: AFqh2kp1vd/WwkM5ePsFMB4PBPToOPFF2OUd3Ah8zeIvjbQPesTboSHt
 NYj23iE6cF3/nEHD8J2Bs5ftgSaradYB4Vzgc78i6vkHbGyULGDcXZCIQwWWZ9ZiQRWIRC4djEc
 ogOLSg39bP1exYuY=
X-Received: by 2002:ac8:5457:0:b0:3b6:36f8:141f with SMTP id
 d23-20020ac85457000000b003b636f8141fmr13076584qtq.48.1674127482376; 
 Thu, 19 Jan 2023 03:24:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtAfaJnjyoCnl47Atmt1RWffeEl+r323RpORzl3xXmitUlq0JSFkQ+ktEHql8Ra88etrWFFlg==
X-Received: by 2002:ac8:5457:0:b0:3b6:36f8:141f with SMTP id
 d23-20020ac85457000000b003b636f8141fmr13076570qtq.48.1674127482129; 
 Thu, 19 Jan 2023 03:24:42 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-207.web.vodafone.de.
 [109.43.178.207]) by smtp.gmail.com with ESMTPSA id
 l14-20020a05620a28ce00b007062139ecb3sm12258763qkp.95.2023.01.19.03.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 03:24:41 -0800 (PST)
Message-ID: <fc7802c3-afd7-2cd0-438e-7b75f4789879@redhat.com>
Date: Thu, 19 Jan 2023 12:24:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org
References: <20230119100537.5114-1-philmd@linaro.org>
 <20230119100537.5114-7-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH 6/8] tests/qtest/libqtest: Allow checking for HVF
 accelerator
In-Reply-To: <20230119100537.5114-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 19/01/2023 11.05, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> RFC: CONFIG_HVF is poisoned.
> 
> We could pass host config definitions to qtest using:
> 
>    diff --git a/meson.build b/meson.build
>    @@ -2547,6 +2547,7 @@ foreach target : target_dirs
> 
>       accel_kconfig = []
>       foreach sym: accelerators
>    +    config_host_data.set(sym + '_QTEST', '')
>         if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym, [])
>           config_target += { sym: 'y' }
>           config_all += { sym: 'y' }
> 
> Then test for CONFIG_HVF_QTEST ...

I don't think that would really work well. The qtests are build once for all 
targets, and HVF is only available in the target that matches the host 
architecture. It's poisoned on purpose.

The TCG accelerator is special, since we have it in either none or in all 
targets, that's why we can use CONFIG_TCG there.

The kvm part is also rather a hack... we should maybe rather additionally 
use the "query-kvm" QAPI command to check whether it is really available...?

To fix this properly for HVF, I think you'd need a way to query the 
available accelerators via QMP, too... Hmmm, weren't there some patches for 
something like that in the past ... can't remember right now ...

  Thomas


