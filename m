Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424A664B8BC
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 16:41:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p57P7-0002B0-7c; Tue, 13 Dec 2022 10:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p57P4-0002AH-4S
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:41:10 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p57P1-0003zj-4t
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:41:09 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 q18-20020a056830441200b006704633f258so103223otv.0
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 07:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Acg3Fdqwu0nHqtLhve8YrtqJHosmbovKLziTCkwR6EA=;
 b=KNFrEp1FtpNUgXhKB2QsSdPjtuzzAKve1nfW+8nop1HiGsB7zGMSfFPxqfSWNC+D5L
 zGRfNDFxXtV5z3qncjJQ4uuJ3yWOhmaRtoyPv/KsJMsE/mL5FNtBiCaGz/fOIICuJu5W
 gPVJwCTouvgSmvHOG2yuNklCa25uBT/ozrjYwkEsyauICJ14u1fpXf14FH0zLZrwCxkJ
 HVQBoKSHiaHvkQMdvFY0kSwXF7kK5ct/DWNVCt0fJsVULWI9pnD2HW1vJjmmoF5VsFhm
 t1UnjQD8XEjgA4juY7dbBt89LzaCKIYUkfe6IxYTB4Ktn3pfL7U75y80dulkmVU2Cdh+
 Fiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Acg3Fdqwu0nHqtLhve8YrtqJHosmbovKLziTCkwR6EA=;
 b=exqWLuO8/Xw6CMKlPacUfByQ5KoniIyNpXqkCTcd9o7UU2rkAAmalooynCj1obkyCW
 cde/JQGsu0wo+m0RVLteobf4nla7mK9Dg7MwEZKiXPeTrU0q2sEB28YTk9mh8dhTzDkb
 x4aIUOjeVaoAmXlIrpVjXVWygutzrFtx6He1TSnx8YCNqIX9O3XP35h3xZ+99VQPBcqD
 CW5xLwV/8FlKavB4clB+eFsWsziibH96eSrEnDnFe6y/YgYjPXYyyiT7fRoejLoR4ELF
 pfF5gIslBsNK8flNELX9374lIxcj2GokuS3JD3STHg6h+RhqVJXVMmuckuaKM7kzyVF9
 22uQ==
X-Gm-Message-State: ANoB5pmnMynXmxj+cBpw7mKeky7DuO+YsAsq9kXzn6d7D8KractlkY25
 KFCT8Si2xwH70xaWLCkVLxx5uA==
X-Google-Smtp-Source: AA0mqf51HSkAI68LZ+non6s4Lm2PTEDdVujvW5j3wufF3meuc2TJ3GCRPpXrxta9S6J7og30Wpi52g==
X-Received: by 2002:a9d:161:0:b0:670:6615:a9e8 with SMTP id
 88-20020a9d0161000000b006706615a9e8mr11560646otu.34.1670946064653; 
 Tue, 13 Dec 2022 07:41:04 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:c63:85ed:4256:8ad0?
 ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a056830164400b0066871c3adb3sm1327910otr.28.2022.12.13.07.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 07:41:04 -0800 (PST)
Message-ID: <c658547e-8546-f165-bc6b-e6bdf53c99b1@linaro.org>
Date: Tue, 13 Dec 2022 09:41:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH-for-8.0 06/10] hw/virtio: Cache access_is_big_endian
 value in VirtIODevice state
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20221212230517.28872-1-philmd@linaro.org>
 <20221212230517.28872-7-philmd@linaro.org>
 <94c26d02-94d5-ec42-99bf-3fac080e567e@linaro.org>
 <8ed5aab1-402f-9d9b-c70e-5d8082d35d1e@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8ed5aab1-402f-9d9b-c70e-5d8082d35d1e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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

On 12/13/22 01:30, Philippe Mathieu-Daudé wrote:
> On 13/12/22 01:14, Richard Henderson wrote:
>> On 12/12/22 17:05, Philippe Mathieu-Daudé wrote:
>>> The device endianness doesn't change during runtime.
>>
>> What are you talking about?  Of course it does.
> 
> The host CPU certainly does, but the virtio device doesn't... Does it?
> 
> This check only consider the device, not the CPU:
> 
>      bool virtio_access_is_big_endian(VirtIODevice *vdev)
>      {
>      #if defined(LEGACY_VIRTIO_IS_BIENDIAN)
>          return virtio_is_big_endian(vdev);

This is set for both ARM and PPC, which checks current cpu endianness in both cases.

> and once the features are negotiated it doesn't seem to change.

Incorrect.


r~

