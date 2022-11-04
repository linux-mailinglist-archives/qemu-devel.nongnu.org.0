Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0B4619F8A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 19:17:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or1EJ-00055b-Db; Fri, 04 Nov 2022 14:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1or1EE-00054t-RU
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 14:15:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1or1EC-0000yD-E5
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 14:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667585738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0QNaoZvbFH82nNfHOVqtODbOGLDI8ukR9cpbm9+T3IQ=;
 b=RVKODDxpe9lYk0E9OqTUSfwL8svfqH+ZSuPWIFrR+YBIRxHiVLNEtOvjOSF0c1iG6woeSq
 MlE5EUs2yRFS/V15NmpF/TM3CGUGzWIwJo1jVOOptWd5jszHCOs2xebcehUTuvr0Y4dPKW
 EsTfoYsDVh91i/eo7bQ/4WwkK4u2mN8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-435-2Zh35QvKOIiriNnC6yQUPA-1; Fri, 04 Nov 2022 14:15:36 -0400
X-MC-Unique: 2Zh35QvKOIiriNnC6yQUPA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l42-20020a05600c1d2a00b003cf8e70c1ecso1086666wms.4
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 11:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0QNaoZvbFH82nNfHOVqtODbOGLDI8ukR9cpbm9+T3IQ=;
 b=e3z93vVg76UJIfqmvQVdvw2GM1bUHBJFAmLLD71cSl3mQufvREKlPXjD6HUxrEl48P
 wrViTU337TAoFt8VsW4ny264sb4I4eU4DTwtZncFP0sSNfsUfM1a3OIGFE52H/apw+CM
 DpAjjc+TqSX3WupB79kETGdfLlqB+Y3X05YDp/4dBNJmBdRT9FWpHJKL6DyYODxm9yiV
 mOpSxl+KNHfmV5POYBYmVPuzJweF2UukArikr2SvH8Q6A22E7fcdcSbDbuzy/XxsObFb
 g+lgDmVobL/3Aq0qqwmXkR/EwgCt3U5afi7zL2sg+wGjI1Qlt0ESLHYhW0DiLyxazA2h
 lNfQ==
X-Gm-Message-State: ACrzQf12XJzNIq8v75XCPxQeng+KIOeFzaLJcYDWDL5nl4YlKEoXIgVh
 wDA8MGQ3o1HabKbY7hI3Rpbh7VW7eK98FsADR5QHlOWN6IgeUd42btFUvkkbFBr1SuC4yNojzT0
 f13DVCiFekMmoFhE=
X-Received: by 2002:a05:6000:1566:b0:236:6a6f:6c27 with SMTP id
 6-20020a056000156600b002366a6f6c27mr23452660wrz.553.1667585735095; 
 Fri, 04 Nov 2022 11:15:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6lpH8G09cP8rMhd3X60IvNI4rnRMZTxTxGVqgWuC3/LuZqthhEIeW8j41ABnvgIxRO6ytOrQ==
X-Received: by 2002:a05:6000:1566:b0:236:6a6f:6c27 with SMTP id
 6-20020a056000156600b002366a6f6c27mr23452644wrz.553.1667585734864; 
 Fri, 04 Nov 2022 11:15:34 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-201.web.vodafone.de.
 [109.43.177.201]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b003c701c12a17sm3857478wmq.12.2022.11.04.11.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 11:15:34 -0700 (PDT)
Message-ID: <daa4cc28-2635-23fb-d176-ca5515893bf2@redhat.com>
Date: Fri, 4 Nov 2022 19:15:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest/ac97-test: add up-/downsampling tests
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20221022160052.1132-1-vr_qemu@t-online.de>
 <CAJ+F1CLjiCs4zSxSpr_OPWDM9_xCC0YfJTL_82umDB-rX6aW3Q@mail.gmail.com>
 <b3c5e4b6-0208-0b0d-fef4-b536ce889dfc@t-online.de>
 <CAJ+F1C+HmS7Y8Wu88uwr5DVcspstGS+MMFAH_QB5Cd3LiVxoNA@mail.gmail.com>
 <9f4b112e-c687-2846-3cee-2f130847dd51@t-online.de>
 <8ff8d033-9394-d114-6145-e36707dc9056@redhat.com>
 <f8e296e2-8be6-cb62-49c2-bc1b636cf8c6@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <f8e296e2-8be6-cb62-49c2-bc1b636cf8c6@linaro.org>
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

On 04/11/2022 18.56, Philippe Mathieu-Daudé wrote:
> On 4/11/22 18:33, Thomas Huth wrote:
>> On 26/10/2022 21.34, Volker Rümelin wrote:
>>> Am 25.10.22 um 09:44 schrieb Marc-André Lureau:
>>>> Hi
>>>>
>>>> On Tue, Oct 25, 2022 at 12:31 AM Volker Rümelin<vr_qemu@t-online.de> wrote:
>>>>> Am 24.10.22 um 10:13 schrieb Marc-André Lureau:
>>>>>> Hi
>>>>>>
>>>>>> On Mon, Oct 24, 2022 at 9:28 AM Volker Rümelin<vr_qemu@t-online.de>
>>>>>> wrote:
>>>>>>
>>>>>>      Test if the audio subsystem can handle extreme up- and down-
>>>>>>      sampling ratios like 44100/1 and 1/44100. For some time these
>>>>>>      used to trigger QEMU aborts. The test was taken from
>>>>>>      https://gitlab.com/qemu-project/qemu/-/issues/71  where it was
>>>>>>      used to demonstrate a very different issue.
>>>>>>
>>>>>>      Suggested-by: Marc-André Lureau<marcandre.lureau@redhat.com>
>>>>>>      Signed-off-by: Volker Rümelin<vr_qemu@t-online.de>
>>>>>>
>>>>>>
>>>>>> Thanks for working on this
>>>>>>
>>>>>> It seems to show something different though:
>>>>>> "
>>>>>> A bug was just triggered in audio_calloc
>>>>>> Save all your work and restart without audio
>>>>>> I am sorry
>>>>>> "
>>>>>>
>>>>>> AUD_open_out() is called with audsettings: {freq = 1, nchannels = 2,
>>>>>> fmt = AUDIO_FORMAT_S16, endianness = 0}
>>>>>>
>>>>>> And that's it. Any idea?
>>>>> Hi,
>>>>>
>>>>> the scary message is expected and doesn't mean this qos-test failed.
>>>>> This is the currently not so silent 'the audio subsystem should (...)
>>>>> silently give up' case.
>>>> Ok, but it's not silent. According to the AC97 spec, "if the value
>>>> written to the register is supported that value will be echoed back
>>>> when read, otherwise the closest (higher in case of a tie) sample rate
>>>> supported is returned". We should probably pick a low sample rate,
>>>> like 8000 (see Table 32 in spec 2.1) for anything below it.
>>>
>>> Hi,
>>>
>>> I don't think we should limit the lowest sample rate to 8000 Hz. The 
>>> sample rates in AC97 revision 2.1 Table 32 are sample rates the codec 
>>> should support at minimum. We are free to support the whole 1-65535 Hz 
>>> sample rate range.
>>
>> FWIW, a minimum sample rate of 1 Hz also does not make much sense. You 
>> cannot hear that frequency anymore... so it does not really make that much 
>> sense to support such low frequencies here. Just my 0.02 €.
> 
> Still useful when using a sound card as signal generator, i.e.:
> https://www.allaboutcircuits.com/technical-articles/how-to-use-your-computer-as-an-arbitrary-waveform-generator/ 

I dare to say that you can reproduce low frequency wave forms with higher 
sample rates, too. In the example on that page, the author also reproduces a 
signal with the rate of 441 Hz with a sample rate of 22050 Hz, so I do not 
really see your point here why lower sample rates should still be useful here.

  Thomas



