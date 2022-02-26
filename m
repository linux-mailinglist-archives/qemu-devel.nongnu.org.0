Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0824C551D
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 11:20:06 +0100 (CET)
Received: from localhost ([::1]:38472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNuBJ-0002Wx-MB
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 05:20:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNuA6-0001hS-Im
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 05:18:50 -0500
Received: from [2607:f8b0:4864:20::102d] (port=35514
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNuA3-00058k-9S
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 05:18:49 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 v5-20020a17090ac90500b001bc40b548f9so10578855pjt.0
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 02:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2OD2WjfyJElRTdVOgXfrO89z7GTWOr6UR/qATmv5BMM=;
 b=RBDLdCY51K+5GTC0t7UNsvqJ3O2HJ9TKcvt9bEjsvvsiiyEb0PDWZPktsTJVKlJCez
 oY2L68ZWAHCpTR6Fak4OzvwtAdu6YIZGbsMz8uXUwZnaaxMujgr9HRq21q3Pbj3fAOJg
 uSKyX3wFGkALtzF8WsXbnsrnX3KXcr3HeqVmdrXvMehlpI2fNBKzCwtfhwB5/g9TargW
 q/NTm4IOfuKnxxZIvy5dS8pse6AzzKOzOAFH/ytZSM9L5qMwQ5KBtG103kfwOXU1q689
 OrfGwaJny6qlHX59esQcBzyLSUJ8OCfEDVR5lqG9El6YhFWeTp0e9pmSMai5L9AQ+0Gz
 3Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2OD2WjfyJElRTdVOgXfrO89z7GTWOr6UR/qATmv5BMM=;
 b=4JMENy8Ttzpqb+nUuGMcAbybGktZF35ropybMUT2VnD7dIkbsaxLCqRzQ03yXnRBGu
 7oSAhUQQKX5GCfKzVhfGxlKaTcTBu38msRgIJewY9tMvpVgjxrHFiOwtqPcP41KngpL4
 0k+sI5AhlnALTy7DOqXOjsk6z1UXI8qeN2AY1OlTJsxYdF7P+wE/8HH2Fortw4GuBiVO
 Zfv7MZ9baHtlrtmC8fyQLIKB1bzHE+GZYrsr4O0Yy6TAxtk1cEzwbikvrOco/Ai/v6SF
 vfrsfIaNaRPdQzDsUf0PzuOuNSRFLr7YhJuj3+Ne4idsv1ZATh79TViu9aokzJ+SV4YP
 xScQ==
X-Gm-Message-State: AOAM5317HYvGEUj1COIx+/sKl1x7kB0LlxJAODWzEOlWsxvx8yJl3y+O
 ytxMk2KWBsv2IwK6z9blGwg=
X-Google-Smtp-Source: ABdhPJzYaph9vNM10D2uUaJs2R2BbtLmNLIJuENU1MTCWl4SMV9gFk16YhnN9mTPWXGeEPwMExpuZg==
X-Received: by 2002:a17:903:1107:b0:14d:80cb:da8 with SMTP id
 n7-20020a170903110700b0014d80cb0da8mr11259719plh.62.1645870726100; 
 Sat, 26 Feb 2022 02:18:46 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a056a000ad200b004f0f9696578sm6869964pfl.141.2022.02.26.02.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 02:18:45 -0800 (PST)
Message-ID: <f1198af9-1d43-5155-229d-3663c65aec3d@gmail.com>
Date: Sat, 26 Feb 2022 19:18:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] coreaudio: Notify error in coreaudio_init_out
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <20220226100248.26847-1-akihiko.odaki@gmail.com>
 <4536903.fTDxs23YJo@silver>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <4536903.fTDxs23YJo@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/02/26 19:16, Christian Schoenebeck wrote:
> On Samstag, 26. Februar 2022 11:02:48 CET Akihiko Odaki wrote:
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>> ---
>>   audio/coreaudio.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
>> index d8a21d3e507..d7cfdcc4fc4 100644
>> --- a/audio/coreaudio.c
>> +++ b/audio/coreaudio.c
>> @@ -604,6 +604,8 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct
>> audsettings *as, coreaudio_playback_logerr(status,
>>                                         "Could not remove voice property
>> change listener\n"); }
>> +
>> +        return -1;
>>       }
>>
>>       return 0;
> 
> Is this a pure theoretical fix, or does it actually fix an actually
> encountered misbehaviour? I don't see any explanation in the commit log. I
> mean the branch here is about removing a listener only.
> 
> Best regards,
> Christian Schoenebeck
> 
> 

I saw branching to this block results in abort as core->hw.samples is 
not set.

Regards,
Akihiko Odaki

