Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F514CA969
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 16:47:19 +0100 (CET)
Received: from localhost ([::1]:56024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRCA-0007VU-3W
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 10:47:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nPRAx-0006o6-Ez
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:46:03 -0500
Received: from [2a00:1450:4864:20::42f] (port=37712
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nPRAw-0007kL-2H
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:46:03 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bk29so3457042wrb.4
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 07:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=osQYM7JEqJHnuIRYRJXH/C7mtXJTBOH/d5tWdJ/A0QY=;
 b=WcXBa6rm5wGrmCIqM+Ikb5kmeWgIznQSC7+Pr+f2xuBM7DGKXVY10WC8H726rm1B3i
 fQJMqxHqJuXYfszX1Q+VNCYfxExg/ig1RmOF+O8fWewsDecaCdQwPzd0OHmUMXVBHQ2g
 iDHS5BChYaLWPCCLev2ZuWk4Z2YSdJmQwj6AeBaZC01MbYNKAznzS5AhDe+2mox/NKwc
 w0/5JdVfM/8pS4Iv4ar8j/fDipVg38d/v7BUM6IootLtiREgOeuYv2oM2RUhDWj1ANi6
 Fv/0waqc1v8ccX9MFpkeoB6BoR1G2mOUItDe2lqouIUS0vp3aXps9J//6PDU2qwFvNbs
 L/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=osQYM7JEqJHnuIRYRJXH/C7mtXJTBOH/d5tWdJ/A0QY=;
 b=YXXIx69kt5Fo9mBFjnA2Y6ZVEcQ2iidvz9xqpcQrLuiZnQ7U4sTWD5MKQK8dRRYD2F
 6dFCxcUUCO8CYX43VrVOXJAbgDhwq7i9Jb2cEWu/KVr4psaPF88lqfiV2oGP3Je1glqy
 Ug/N8q1nUBiq8Uy1lUpVafkHU6dIKC/eOuAHKVOu66kGJjnHEVSpNi+aYbA/EZu2pLJe
 at0bzQwqrSZ37Il62QIQ5SXafEcnNryZi8iGSUO9ciWgYy3lA6bKTeBhERm0l80yvmtl
 6UjcybG+139vTCsexXhNProFsxQ/ygAvNpMqHU1nLJ1jKiKJcP9nxT6BhKBvbVKeuU+x
 wDzw==
X-Gm-Message-State: AOAM531DzPQ+CsMsgg+fdnkoy3uIAcplvV7IoUy387ktghUcvs50I/LK
 hcSRoeVmqAKYgNYim1zEiJijJSppKR+YCw==
X-Google-Smtp-Source: ABdhPJzSWU9x1jT7NlgoUizGd6Jb3QBd9Hc9H/s3DgpMqlGMdJhx3n96+fOfeSZskYQzP4w6MyOOsw==
X-Received: by 2002:a5d:440c:0:b0:1ee:1c9a:193e with SMTP id
 z12-20020a5d440c000000b001ee1c9a193emr22997281wrq.523.1646235960406; 
 Wed, 02 Mar 2022 07:46:00 -0800 (PST)
Received: from ?IPV6:2a10:800b:ea29:1:266:a58e:9f87:7014?
 ([2a10:800b:ea29:1:266:a58e:9f87:7014])
 by smtp.gmail.com with ESMTPSA id
 k19-20020adfd233000000b001f0358e47bdsm2093487wrh.50.2022.03.02.07.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 07:46:00 -0800 (PST)
Message-ID: <a9676a57-4ef3-6460-9d8a-8f99e7887047@gmail.com>
Date: Wed, 2 Mar 2022 17:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-3-liavalb@gmail.com>
 <20220301094354.1d37f470@redhat.com>
 <20220301061131-mutt-send-email-mst@kernel.org>
 <20220301124757.61525849@redhat.com>
 <20220301071112-mutt-send-email-mst@kernel.org>
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <20220301071112-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: ani@anisinha.ca, shentey@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>> but I feel quoting spec
>>> and including table name is a good idea actually, but pls quote verbatim:
>> I don't do that  and don't ask it from others.
>>
>> The reason being that pointing where to look in spec and having
>> verbatim copy of field name is sufficient
>> for looking it up and
>> QEMU does not endup with half of spec copied in (+unintentional mistakes).
>> (As reviewer I will check if whatever written in patch actually matches
>> spec anyways)
>>
>> That's why I typically use
>>    'spec ver, verbatim field name[, chapter/table name]'
>> policy. The later optional part is usually used for pointing
>> to values description.
>
> Ok but here the field name was not listed verbatim, and table name
> is missing. It is actually 8042 and table name is Fixed ACPI Description
> Table Boot Architecture Flags.
So, in which route should I go with this? I could add a reference to the 
ACPI spec, but can write and explain more if you want me to.


