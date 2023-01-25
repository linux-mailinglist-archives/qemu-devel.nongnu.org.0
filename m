Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3904B67B242
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 13:05:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKeWF-00040f-3Z; Wed, 25 Jan 2023 07:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKeW1-0003pD-Rd
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 07:04:34 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKeW0-0005QG-28
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 07:04:33 -0500
Received: by mail-wr1-x432.google.com with SMTP id e3so16792838wru.13
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 04:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FVVALoV7jaNOOxAnaklUaAayBWSuzKz72M+4GPlzCYw=;
 b=ZcXdkabmrvPJ+/15CVHcfF/Cp4gSKK8g1DJZMFqRXz3KhSjI3sCXEUGp+h6xP4rBeV
 CY0jQgupX6E3TXJb/wnPqGApxInuiNCSH3OcJUP6UvGbA5JwkJ4TOLcxJcF2HM6X/360
 MNblw+qGypLZ5WMZlikjJ723YxKkvPRUALYeR5ltBjJXLq5VmAp34HDmSpNdD2wSFQMy
 wcWydQxUxAeOkrbiOCKaBb/Fvl8Kfy3DXj/6aSeMXW71Z74xAam1eZmm0SmOgD1JxejU
 j49MOROByuV6JQBeQ7g5AcgY2j1v/8xysuYrNo1dIlftRl1Vym0zmsDVYkaWaSr+NMej
 tdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FVVALoV7jaNOOxAnaklUaAayBWSuzKz72M+4GPlzCYw=;
 b=BJ6aIS5Vpmm0HW1NwFNTHjg+1dc7tTt/czHJXCSg63L++DagA23nUq9PTpiizsnBGP
 cO/NSppaF7EnlhYXjrGttIWtm4A1ti/DhBvYD3Fw8gfLIsGOCEiBgSfQCKRqzbiPSDSD
 sdKJA3QfbHyOpqYZ5FbpUxrxkr/em98qdGhusfqL1lm04tMGTxDeQKt1BXVxiyB1xDoY
 CF/L32d4sY4Yye0QV3qLmFJEeg8C01eH5E1IoZF/osSko1vPrnI+nZKCqSapxIdAfjoM
 yX8YqXdLZXdO6Jfg6PnKF6S9RVIBVkjrrtnyE+LtZV9Ls+ycfJzAkIsEckznaiNY2hse
 IrEw==
X-Gm-Message-State: AFqh2kozlUVd3MypWYicqdMn4HV08wtTV+rBUEly4F/v/XRJsf0x1DA0
 gu/J6jqtTFrMC/u6iB6V+G3neQ==
X-Google-Smtp-Source: AMrXdXv1Pwqmom2gbZYgtUsrnVbzk0CJtlT+iuNPn46vI/YSIOGvkQhjsgXvd+BHJVI3KZSGvuLa6g==
X-Received: by 2002:a5d:4bce:0:b0:2be:4ae1:215a with SMTP id
 l14-20020a5d4bce000000b002be4ae1215amr17661411wrt.16.1674648269243; 
 Wed, 25 Jan 2023 04:04:29 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 m15-20020adffa0f000000b0024cb961b6aesm4189310wrr.104.2023.01.25.04.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 04:04:28 -0800 (PST)
Message-ID: <9bf80a28-be03-3fe3-760b-d53970c29d26@linaro.org>
Date: Wed, 25 Jan 2023 13:04:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] qapi, audio: add query-audiodev command
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Volker_R=c3=bcmelin?=
 <vr_qemu@t-online.de>, Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20230123083957.20349-1-thuth@redhat.com>
 <20230123083957.20349-2-thuth@redhat.com>
 <47d18f28-73b1-af59-ab65-2366ed3da55a@linaro.org>
 <Y85rVoXhR5skLVOz@redhat.com>
 <c94b801d-3c19-24c7-505a-7ab0d98faa67@linaro.org>
 <Y855BSwizi0n+w7r@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y855BSwizi0n+w7r@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 23/1/23 13:09, Daniel P. Berrangé wrote:
> On Mon, Jan 23, 2023 at 01:05:45PM +0100, Philippe Mathieu-Daudé wrote:
>> On 23/1/23 12:11, Daniel P. Berrangé wrote:
>>> On Mon, Jan 23, 2023 at 10:20:29AM +0100, Philippe Mathieu-Daudé wrote:
>>>> On 23/1/23 09:39, Thomas Huth wrote:
>>>>> From: Daniel P. Berrangé <berrange@redhat.com>

>>>>> +AudiodevList *qmp_query_audiodevs(Error **errp)
>>>>> +{
>>>>> +    AudiodevList *ret = NULL;
>>>>> +    AudiodevListEntry *e;
>>>>> +    QSIMPLEQ_FOREACH(e, &audiodevs, next) {
>>>>
>>>> I am a bit confused here, isn't &audiodevs containing what the user provided
>>>> from CLI? How is that useful to libvirt? Maybe the corner case
>>>> of a user hand-modifying the QEMU launch arguments from a XML config?
>>>>
>>>> Wouldn't a list of linked in AudiodevDriver be more useful to libvirt
>>>> so it could pick the best available backend to start a VM?
>>>
>>> On the libvirt side we're never going to need to actually call the
>>> query-audiodevs commands. The mere existance of the command, means
>>> that the QMP schema now exposes information about what audio backends
>>> have been compiled into the binary. This is the same trick we've used
>>> for other aspects of QMP. IOW we don't need a separate command just
>>> for the purpose of listing AudiodevDrivers.
>>
>> I understand having "what audio backends have been compiled into the
>> binary" is useful, but I am missing how you get that from &audiodevs.
>>
>> AFAICT &audiodevs is for the CLI parsed backends, not all the backends
>> linked within a binary. I probably need sugar / coffee and will revisit
>> after lunch.
> 
> It ties into the 'query-qmp-schema' command, along with patch #2 in
> this series.
> 
> The query-audiodevs command will cause the 'AudiodevDriver' enum to
> be reported in the 'query-qmp-schema' response. Patch #2, makes all
> the AudiodevDriver enum entries conditional on CONFIG_XXXX.
> 
> IOW now query-qmp-schema data will tell you what AudiodevDriver
> backends are compiled into the binary you're talking to.

Thanks for the explanation Daniel.

Just FTR, while I'm not confident enough to add a R-b tag, I am
not opposed to it.

Regards,

Phil.

