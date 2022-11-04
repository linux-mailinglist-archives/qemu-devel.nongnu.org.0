Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43055619EDB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 18:35:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or0Zo-0007JU-9w; Fri, 04 Nov 2022 13:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1or0Zm-0007JN-9M
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:33:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1or0Zk-0003RG-1K
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667583228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S06mxTRAB/uH4p09zfbVpnzQn3NZ33nncPpIH515IsE=;
 b=B4NvSrDQhS9TAn7Gt2lt/oh0DvqxCs801IaK8q1j9KXrTxxmzM6oHDoKE1a2u9VBgg1Qzl
 9lc2R3BktHUVnVNTpAcgtLEQnfQbXEaMN2aTt5X9gfu69T8v0BkpMMm6IpSeyRi3HfN+yz
 rrrC1btCbPHHFBiVyBmJhK51H8rLpT4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-153-J6TZbVZoNCWCmmFViG6H0A-1; Fri, 04 Nov 2022 13:33:46 -0400
X-MC-Unique: J6TZbVZoNCWCmmFViG6H0A-1
Received: by mail-wr1-f72.google.com with SMTP id
 m24-20020adfa3d8000000b00236774fd74aso1441356wrb.8
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 10:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S06mxTRAB/uH4p09zfbVpnzQn3NZ33nncPpIH515IsE=;
 b=FSIfi42DbYwoykhVA+8/ubcU9pr8GDfvkAoBlfeA1SSOqRZgI5+nfrQZqgyDfybBK+
 By0FDXXiwfVYCUnymdYTr+Vb9/WeqsRuMdqCZKl1KMUXnTGkRdylTxlHAZCaISN27WWn
 nn68nnLnc8HCU0KXzmuVEdajSeO7vLA/BP+V4Eq8XPTzfVnuXe7IWozMIW2CkecQ7uCN
 qCFdTC/60DdK6Uk6YhyWkWJ4gue6dg2AVpqxgI427Zgsr9syCy6yrmdvvWPHMS2Itcue
 WlQHHdnMG01/adR/XczXckJ/b+wpvJahcrTivI0s9HmQy01lK6XHYmxLb3HdfG3uLTMy
 0Mcw==
X-Gm-Message-State: ACrzQf3wTRD4X8gS9b5oLBa43vrW//XvXNJtEmtJlf0x6qq8RMoejZ1n
 1BsTYaj6ftkF66y0bljL3hKum8a+8DPS88AZ7PI3rxvj+EnSnXnoNgFygA2xNv/KCEdcyHaSBmQ
 sFvOGNNyNmSeJ2Yc=
X-Received: by 2002:a5d:6da2:0:b0:236:791d:e5a1 with SMTP id
 u2-20020a5d6da2000000b00236791de5a1mr23198347wrs.665.1667583225761; 
 Fri, 04 Nov 2022 10:33:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5acXDbpFGCa1E0smb1tt8Ww4Kw1pzRC7AhhleKtioAQjOlLkNzMoWJT4cCF9z0DZJSGLBt3Q==
X-Received: by 2002:a5d:6da2:0:b0:236:791d:e5a1 with SMTP id
 u2-20020a5d6da2000000b00236791de5a1mr23198328wrs.665.1667583225514; 
 Fri, 04 Nov 2022 10:33:45 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-201.web.vodafone.de.
 [109.43.177.201]) by smtp.gmail.com with ESMTPSA id
 d33-20020a05600c4c2100b003cf37c5ddc0sm21734wmp.22.2022.11.04.10.33.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 10:33:44 -0700 (PDT)
Message-ID: <8ff8d033-9394-d114-6145-e36707dc9056@redhat.com>
Date: Fri, 4 Nov 2022 18:33:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221022160052.1132-1-vr_qemu@t-online.de>
 <CAJ+F1CLjiCs4zSxSpr_OPWDM9_xCC0YfJTL_82umDB-rX6aW3Q@mail.gmail.com>
 <b3c5e4b6-0208-0b0d-fef4-b536ce889dfc@t-online.de>
 <CAJ+F1C+HmS7Y8Wu88uwr5DVcspstGS+MMFAH_QB5Cd3LiVxoNA@mail.gmail.com>
 <9f4b112e-c687-2846-3cee-2f130847dd51@t-online.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/qtest/ac97-test: add up-/downsampling tests
In-Reply-To: <9f4b112e-c687-2846-3cee-2f130847dd51@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/10/2022 21.34, Volker Rümelin wrote:
> Am 25.10.22 um 09:44 schrieb Marc-André Lureau:
>> Hi
>>
>> On Tue, Oct 25, 2022 at 12:31 AM Volker Rümelin<vr_qemu@t-online.de>  wrote:
>>> Am 24.10.22 um 10:13 schrieb Marc-André Lureau:
>>>> Hi
>>>>
>>>> On Mon, Oct 24, 2022 at 9:28 AM Volker Rümelin<vr_qemu@t-online.de>
>>>> wrote:
>>>>
>>>>      Test if the audio subsystem can handle extreme up- and down-
>>>>      sampling ratios like 44100/1 and 1/44100. For some time these
>>>>      used to trigger QEMU aborts. The test was taken from
>>>>      https://gitlab.com/qemu-project/qemu/-/issues/71  where it was
>>>>      used to demonstrate a very different issue.
>>>>
>>>>      Suggested-by: Marc-André Lureau<marcandre.lureau@redhat.com>
>>>>      Signed-off-by: Volker Rümelin<vr_qemu@t-online.de>
>>>>
>>>>
>>>> Thanks for working on this
>>>>
>>>> It seems to show something different though:
>>>> "
>>>> A bug was just triggered in audio_calloc
>>>> Save all your work and restart without audio
>>>> I am sorry
>>>> "
>>>>
>>>> AUD_open_out() is called with audsettings: {freq = 1, nchannels = 2,
>>>> fmt = AUDIO_FORMAT_S16, endianness = 0}
>>>>
>>>> And that's it. Any idea?
>>> Hi,
>>>
>>> the scary message is expected and doesn't mean this qos-test failed.
>>> This is the currently not so silent 'the audio subsystem should (...)
>>> silently give up' case.
>> Ok, but it's not silent. According to the AC97 spec, "if the value
>> written to the register is supported that value will be echoed back
>> when read, otherwise the closest (higher in case of a tie) sample rate
>> supported is returned". We should probably pick a low sample rate,
>> like 8000 (see Table 32 in spec 2.1) for anything below it.
> 
> Hi,
> 
> I don't think we should limit the lowest sample rate to 8000 Hz. The sample 
> rates in AC97 revision 2.1 Table 32 are sample rates the codec should 
> support at minimum. We are free to support the whole 1-65535 Hz sample rate 
> range.

FWIW, a minimum sample rate of 1 Hz also does not make much sense. You 
cannot hear that frequency anymore... so it does not really make that much 
sense to support such low frequencies here. Just my 0.02 €.

> This is a convenient way to test edge cases. If you think the 
> audio_bug message is an issue, I'll improve the error handling in AUD_open_* 
> first and then resend this qos test.

I agree with Marc-André - the error message looks confusing when running the 
test. Maybe you could simply fence it with qtest_enable() at least?

>>> The noaudio backend uses a mixing-engine buffer size of 1024 audio
>>> frames and AUD_open_* tries to allocate memory for 1024/44100 = 0.0232
>>> audio frames for the resample buffer in audio_pcm_sw_alloc_resources_*.
>>> This allocation fails and produces the scary message. The error is
>>> handled correctly and AUD_open_* returns NULL. AUD_read and AUD_write
>>> return early if this pointer is NULL and the audio frontend callback
>>> functions will also not be called because the audio_frontend_frames_*
>>> functions return 0 in this case.
>> Thanks, it'd be nice to have such a description in the commit message.
> 
> I'll improve the commit message of patch version 2.

A v2 would be appreciated!

  Thanks,
   Thomas


