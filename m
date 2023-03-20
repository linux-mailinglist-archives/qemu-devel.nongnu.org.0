Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5446C1B0B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:15:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peI9B-00034K-Mb; Mon, 20 Mar 2023 12:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peI99-0002za-JP
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:14:07 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peI98-0004e3-17
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:14:07 -0400
Received: by mail-pl1-x62b.google.com with SMTP id o2so5569079plg.4
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 09:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679328844;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oMjBggqgWC8bKsq6vLzgPZ4t5qiQ6AUts7ZYbj2PXyU=;
 b=LhWF0LgiM4TaOCRJ6yHQx/JYcdCvFaAs1/7w6YqaavI/2rHQt4y1Z+wQScTnedqZs+
 YkwDTkThm593uti5iJtq39qvBJ+RSk5ckjrQisjHBznwpOmfOfw2ta/r5sUUtRLHxwH6
 t1wUBmXZ/HoGqi2TJmB0etkKf3wq5ZjefOmLWrZR0DBuY6IniXI0Hw9ypsOK4ugsHOGU
 8MHE0UdvKkJBIjL7N9ckGQ5S/URbqFkrvFAdJqKMMRkZ4C+WsAdmQjbOi8QXQMQw4lIE
 KAZ6H/5cl5KennK6O1WazL5QuA6XZ5jgSxTeMLV3R77WfFZD3VQ+lJvbwOczjdmtviST
 iXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679328844;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oMjBggqgWC8bKsq6vLzgPZ4t5qiQ6AUts7ZYbj2PXyU=;
 b=6urdmZbBrPpyqPyBlolYibvDJR0rLX2C8cP2hRgADOypgxeecJ1hyWWDUWaxiv/Wln
 BUoZF++CGct2gGOU3RclTvipqfRdasuOpg0Lr9+MPt/7cO2Z3hMMe4nHkgpSpHN+4+Kw
 9xG266ikFk87KxXm6S7Tlm7m+JE4/8N17rICzEBrV2UiMOyqfNx2hdXcng9zBRpEpQMh
 G2BT4QhILfh15xwt7vPhg1TM9XHPRudXvbMVuN/4RzkrnvbqKlSUcLlvDecZxgEbz6Pk
 YxKLVVoIBNEOumf8lUa68dgfnPOF/+drRWWCjjb3acksnUovG+3ko7dsHivGcnctwEgI
 GgVQ==
X-Gm-Message-State: AO0yUKW+S7oE3vtll/EFb/a6k8JKDf2L3OFNEsAEHBVTiN91q3bnYzYm
 QcE8rlu1Raab6DJircMWmtCYPA==
X-Google-Smtp-Source: AK7set+sTI1PJoxDkSzutUmDYIgFZiNVRzG2fCKJnw99C6PKGwO7ofwLmGOmD+YMffKwAum/Pl/l6w==
X-Received: by 2002:a17:90b:3908:b0:23d:21c9:193 with SMTP id
 ob8-20020a17090b390800b0023d21c90193mr19230435pjb.2.1679328843802; 
 Mon, 20 Mar 2023 09:14:03 -0700 (PDT)
Received: from [192.168.4.112] (096-041-163-098.res.spectrum.com.
 [96.41.163.98]) by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019edc1b9eb2sm6918666pls.238.2023.03.20.09.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 09:14:03 -0700 (PDT)
Message-ID: <350f05bf-00bc-381a-fb54-c6851076941c@linaro.org>
Date: Mon, 20 Mar 2023 09:14:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 02/10] accel/tcg: move cpu_reloading_memory_map into
 cpu-exec-softmmu
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Cc: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Fabiano Rosas <fabiano.rosas@suse.com>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-3-alex.bennee@linaro.org>
 <c6e1bf23-618f-410d-a53b-6f4cbd007e7b@suse.de> <87355z8ry2.fsf@linaro.org>
 <34fc1e42-a0f7-c0fe-300f-3ad78deb8e6c@suse.de> <87y1nr7apw.fsf@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87y1nr7apw.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/20/23 07:33, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> On 3/20/23 14:32, Alex Bennée wrote:
>>>
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> How is this conditional on CONFIG_TCG? To me it looks like this breaks !CONFIG_TCG.
>>>> Careful, the meson.build in accel/tcg/meson.build is always recursed.
>>>
>>> Surely it shouldn't be in accel/tcg then?
>>
>>
>> Hi Alex,
>>
>> maybe we did not understand each other.
>>
>> What I mean is that accel/tcg/meson.build is not conditionally read, it is _always_ read.
>>
>> Therefore TCG-specific code needs to be conditionally included using
>> the CONFIG_TCG.
> 
> Ahh I see now, right I can fix that up next revision if there is
> interest in this approach.

Yes, that seems fine.  With either when: or subdir_done(),

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


