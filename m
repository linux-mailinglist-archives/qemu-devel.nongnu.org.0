Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EDA674253
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:10:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIaIJ-0001rm-PX; Thu, 19 Jan 2023 14:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIaIH-0001rQ-Td
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:09:49 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIaIG-0003EH-9Q
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:09:49 -0500
Received: by mail-pf1-x42b.google.com with SMTP id x4so2271156pfj.1
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 11:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GA8o0KD2GdUs15C6MHaE3DQmCW9/qy/ODDaR898O808=;
 b=hcZVGLjs7T2udbILZuPF4NxJvbmwtFJP6pta2bPPHIqProY0TvU7zKQEZXvsxGt9l/
 qtvEpTbSeu+icnT9sLBpXFXwoia4F7RjLP5LZa0w1/uehPdBBNYDoXlnCRXymR05z8pE
 EWqFr7kTG7IjaHbzTl+h7D9q8oWxXXv5v1YR3uZiyHsARiho5LewCB1wZmeTQsa9VNjG
 bSvKRaylHe6weEybvnYUpeeitThukikmccEVijIxvec9KZcndMLLjAbrczPH/FkI0kqj
 qbPBI/kpm9luTGPE4FJYDCeAzXIwcsdvJO+8uTBi4yoVEq+1nHV6EBwfWrfmDQs5SqnD
 X7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GA8o0KD2GdUs15C6MHaE3DQmCW9/qy/ODDaR898O808=;
 b=RO96HkTO/PCOGwMZfF3HlraYts+G9HvA9oacoHNeKMd0iveacQ2TfXqLdH49kyZHTY
 kUCKOnMw18FpPHAnIZXosaP8lqSaB7VguE58NsLpwJUQITFJOFj5U/CThPDEV7bznYjn
 NyD3dxfHJgmRXUwKcYSzolUgbsnxBUxVQV6vdbeoxz9Y01wG3DXSuOrT534cOA7N1id/
 Vgg8Dbr7eLsFWr04F34zsKL9K1H69YoF5Rh2mnRRp5zDRghZ/MWVBuigEBLXb7D97HYx
 cWcNRkqxVm9T6N2bqSeslkHDhvEzjIWG8qK2wosasSeq59jSUAUiDCVlv2tuxPi0ezOp
 K/sw==
X-Gm-Message-State: AFqh2kojBnGu2nqYFr44y6P+2KCS+DhLt1Nf9b3gSA70TCYYL7DuY4ya
 XTX6IjXpbsx5AGxYc57yXiWd1A==
X-Google-Smtp-Source: AMrXdXuX2aFjtYobOu9wEEs4l90ShdUro0rtCD43OCPpY1NptngpjcU+7dmHEyr5lsftsOF3zzpyug==
X-Received: by 2002:a05:6a00:181f:b0:58b:d244:b525 with SMTP id
 y31-20020a056a00181f00b0058bd244b525mr18139267pfa.17.1674155386622; 
 Thu, 19 Jan 2023 11:09:46 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 p12-20020aa79e8c000000b0058bc7e47a58sm10310123pfq.30.2023.01.19.11.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 11:09:46 -0800 (PST)
Message-ID: <cb112a3e-ad40-08ef-52b3-503d73ce97c2@linaro.org>
Date: Thu, 19 Jan 2023 09:09:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 11/15] tests/qemu-iotests: Allow passing a -cpu
 option in the QEMU cmdline
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-12-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-12-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/19/23 03:54, Fabiano Rosas wrote:
> +        cpu_map = (
> +            ('aarch64', 'cortex-a57'),
> +        )

This isn't a map...

> +        for suffix, cpu in cpu_map:
> +            if self.qemu_prog.endswith(f'qemu-system-{suffix}'):
> +                self.qemu_options += f' -cpu {cpu}'

... which causes you to use a loop here, instead of a map lookup.

Also, not keen on cortex-a57 vs max, again.

You want something like

     cpu_map = {
         'aarch64': 'max'
     }

     m = re.match('qemu-system-(.*)', self.qemu_prog)
     if m and m.group(1) in cpu_map:
         self.qemu_options += ' -cpu ' + cpu_map[m.group(1)]


My python is rough, so take that with a lot of testing...


r~

