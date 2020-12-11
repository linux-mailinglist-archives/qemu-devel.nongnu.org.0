Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7752D7FAD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:49:34 +0100 (CET)
Received: from localhost ([::1]:44890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knoQ1-0006t9-U6
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:49:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knnZI-0001py-LS
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:55:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knnZG-0004FE-Ph
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:55:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607712901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ITY9aNeELCDv8y3lb3Ru+zsIeMenqHrrUy2TYbC7bCM=;
 b=V2RuL4zGSYyXzi6nSkEQ26Cw5Dm8dtzn7EenUFSZ7z+pRdL/AIJpBXGABhx/Ki6IWa4Wec
 oz2eIVZfIhyI37wmSfh5WfAs06ofvd+Hw2dTioFIpq7yZodamIh8lqyWL0B4nLqXOFVuAX
 6Jks8hb5DntyH1QE5APkEvimg+S23KM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-rjIWN3ULO6W-OV57Z7OXug-1; Fri, 11 Dec 2020 13:54:59 -0500
X-MC-Unique: rjIWN3ULO6W-OV57Z7OXug-1
Received: by mail-ej1-f71.google.com with SMTP id dc13so3105561ejb.9
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 10:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ITY9aNeELCDv8y3lb3Ru+zsIeMenqHrrUy2TYbC7bCM=;
 b=iDydIB0Rx6kflN4H6lq8ns/JPUYN0ziP++ICCHpWD/Sd4OrJgtjMpFuze5EEd8rkRr
 zzYnjeIYFzO6N9wHZCr19K0m72JanUZEAdJq7rmGlh/V3nLJUN/UShNu50/bEda/gQH1
 So1w6XfHAZOM5AaQGtKCORIWZ60GIDuyW0ptpc/2Pv9/EiuoU/ik3ym4JCMiaRTbkoPz
 zlALbCcAs6vsGXVio7+9SvHygQA8p2+NGsiEWgIJaaczjlcvlqszTloCJ1dN/2uNixAd
 nT0TU275SF9F6VqwBDuU6hnbDaXp7Dp32a6QC9aaxEEAWRRgQKb+lC6rHQz2G4SYdyhU
 6eNw==
X-Gm-Message-State: AOAM533XBq0oxCYazzGFU+K6mOd6XXDmfIKrRPeyYGEqLYDBpSL8CeXw
 WaiBIVP/r21hkOMjQb1BRocm8udXdllyarHkDeqzbeAFJUkuqRokZJelTf/nCv4qpyFZN0KN9vP
 PGVjNDSRKnM3K7so=
X-Received: by 2002:a17:906:9588:: with SMTP id
 r8mr11943839ejx.148.1607712897980; 
 Fri, 11 Dec 2020 10:54:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQqQ0QprQgHJnLZibN1Xz3hz7XyMJgvcr42eljJxu6E113cyM5XwhyhGqat6KD9EJ9RHlEYg==
X-Received: by 2002:a17:906:9588:: with SMTP id
 r8mr11943802ejx.148.1607712897735; 
 Fri, 11 Dec 2020 10:54:57 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id d14sm8297249edu.63.2020.12.11.10.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 10:54:56 -0800 (PST)
Subject: Re: [PATCH v11 18/25] cpu: Move synchronize_from_tb() to tcg_ops
To: Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-19-cfontana@suse.de>
 <78a7119d-1b4b-47dc-8f16-510708c9fcd4@linaro.org>
 <cca08e8d-9235-46da-3610-8acafbc2de14@suse.de>
 <15b884b7-94e4-1476-f883-e84379b2661e@linaro.org>
 <5d9457df-c7c6-dd61-bbd7-1563d29102f8@suse.de>
 <946cb717-d1f3-5b30-5622-0126437420d7@suse.de>
 <b7db8e36-f623-a090-a19a-644b02c3cd76@linaro.org>
 <6c117162-7b6d-14bc-9d6e-f5169d7d1e31@redhat.com>
 <2d76e092-14bf-f9dc-4703-811f7768f1a7@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <988c68b8-e9bc-55f2-cb6e-2a7b3767c14f@redhat.com>
Date: Fri, 11 Dec 2020 19:54:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2d76e092-14bf-f9dc-4703-811f7768f1a7@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 7:51 PM, Claudio Fontana wrote:
> On 12/11/20 7:26 PM, Philippe Mathieu-Daudé wrote:
>> On 12/11/20 7:22 PM, Richard Henderson wrote:
>>> On 12/11/20 12:15 PM, Claudio Fontana wrote:
>>>> Should I return this file to the original state (without the extra #includes that pretend it to be a standalone header file,
>>>> and call it
>>>>
>>>> tcg-cpu-ops.h.inc
>>>>
>>>> ?
>>>
>>> If this header can work with qemu/typedefs.h, then no, because the circularity
>>> has been resolved.  Otherwise, yes.
>>
>> My editor got confused with TranslationBlock, which is why I asked
>> to include its declaration.
>>
>> Easier to forward-declare TranslationBlock in qemu/typedefs.h?
>>
>> Regards,
>>
>> Phil.
>>
> 
> Hello Philippe,
> 
> ok you propose to move the existing fwd declaration of TranslationBlock from cpu.h to qemu/typedefs.h .

I'll let that answer to Richard =)

> 
> And what about #include "exec/memattrs.h"?
> 
> I assume you propose to put struct MemTxAttrs there as a fwd declaration too,
> 
> and this concludes our experiment here?

Well, there is no circular problem here, right?
(and Richard already reviewed patch #24 :P )

> 
> Thanks,
> 
> Claudio
> 


