Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D26A5F3D1F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 09:20:15 +0200 (CEST)
Received: from localhost ([::1]:48844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofcDu-0007Ma-8c
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 03:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ofbnD-0000jF-VP
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 02:52:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ofbnA-0000nH-FK
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 02:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664866354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tyObtag/yBtjXw6foTuUEyDZTiYK9vBZ1Cwr1sB4Ib0=;
 b=GzZaXnOIeZ+7UhHQBpo4BPstmdMShgdtHlvD4fIzor5bdJmSenpjkirTFHcRSr0IBcL9CH
 6jKlza0iOfZncAVr9EMtOOl97x8oTSb4WwdvQcSAX/fIU5c8k0/faTvSd7LrlxoJz7Gumg
 N+LfJJQUa5u75fseigLR4yW4IxL/4tQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-zDu1PtGAOxW7g6K2n53s6w-1; Tue, 04 Oct 2022 02:52:33 -0400
X-MC-Unique: zDu1PtGAOxW7g6K2n53s6w-1
Received: by mail-wm1-f72.google.com with SMTP id
 5-20020a05600c028500b003b4d2247d3eso269540wmk.0
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 23:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=tyObtag/yBtjXw6foTuUEyDZTiYK9vBZ1Cwr1sB4Ib0=;
 b=xU2iGVbDaMvI0FvE96102Nzxr96cSO5Xomucn3W3d1PcWXhX9jeNrOlImzhhMqjDhp
 /lxRTpL0dFYB6if9m12mu4Yan7RvqJHGEjuLXhSICpp2HZSEpP27YsjV94+qLup6qYg8
 BQ4+X3CFKtCqpeQZtAlOk0hFSgeWhEWs5wKQ2T+2t1ouU+ty/8H80npB2p6Ayaub9xrO
 Mm/rfk+NmqhyR+Y6hwb4aXWkHtxZf8Z0atDc2OIq7a1IRYSCUezTqAwAh4rzOepibgQd
 ZF8SezMxNqxkr69fHiG6AcwbjmO8JUQV3pKxoE7/U9Y3+E+c7JOsYvuluQbUYhUFI7q3
 KV7w==
X-Gm-Message-State: ACrzQf3DbXpitmVSE2JrpR4qpAWoMT75lvnm2RvePcHSBdMgOKCuuZUO
 PJUULecdVtBt/AfUvN4ux95dgJIaeSPK317wyTtql3N+o1Za11cwKtv2LvaiH7HPNPa/cWCbIGN
 j7+JWQKA/0ygouWU=
X-Received: by 2002:a5d:47cc:0:b0:22c:86fe:ad94 with SMTP id
 o12-20020a5d47cc000000b0022c86fead94mr15770455wrc.599.1664866352459; 
 Mon, 03 Oct 2022 23:52:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6hHwUKRpL+NRHqNKrYRBsUiUnUNNZQdaWLOxEyoC9/MD+ypszmb9CcWE52qjwkm/4A6bU0FA==
X-Received: by 2002:a5d:47cc:0:b0:22c:86fe:ad94 with SMTP id
 o12-20020a5d47cc000000b0022c86fead94mr15770441wrc.599.1664866352245; 
 Mon, 03 Oct 2022 23:52:32 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-246.web.vodafone.de.
 [109.43.178.246]) by smtp.gmail.com with ESMTPSA id
 o30-20020adf8b9e000000b0022da3977ec5sm11226861wra.113.2022.10.03.23.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 23:52:31 -0700 (PDT)
Message-ID: <8600412e-587a-b28e-cc21-81f4018b7187@redhat.com>
Date: Tue, 4 Oct 2022 08:52:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] build-sys: error when slirp is not found and not disabled
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 marcandre.lureau@redhat.com, qemu-devel@nongnu.org, jb-gnumlists@wisemo.com
Cc: jasowang@redhat.com, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20221003070534.2180380-1-marcandre.lureau@redhat.com>
 <YzqXuhJWloERf6Wm@redhat.com> <832398553.RmnqxNm477@silver>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <832398553.RmnqxNm477@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.467, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/10/2022 12.48, Christian Schoenebeck wrote:
> On Montag, 3. Oktober 2022 10:05:14 CEST Daniel P. Berrangé wrote:
>> On Mon, Oct 03, 2022 at 11:05:34AM +0400, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> This is an alternative configure-time solution to "[PATCH] net:
>>> print a more actionable error when slirp is not found".
>>>
>>> See also "If your networking is failing after updating to the latest git
>>> version of QEMU..." ML thread.
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>
>>>   meson.build | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 8dc661363f..565096001d 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -657,6 +657,12 @@ if not get_option('slirp').auto() or have_system
>>>
>>>     endif
>>>   
>>>   endif
>>>
>>> +if not get_option('slirp').disabled() and not slirp.found()
>>> +  error('libslirp is not explicitely disabled and was not found. ' +
>>> +        'Since qemu 7.2, libslirp is no longer included as a submodule '
>>> +
>>> +        'fallback, you must install it on your system or
>>> --disable-libslirp.') +endif

s/--disable-libslirp/--disable-slirp/

>> I understand the motivation, but this goes against the main principal
>> of our build time detection, which is to "do the right thing" automatically.
>> If libslirp is not present on the host, then I would consider the need to
>> pass --disable-libslirp to be a bug.
>>
>> I think this pain that people see of loosing slirp support is going to be
>> a pretty short term problem. IMHO it suffices to print a warning message
>> right at the very end of configure, after everything else, just for one
>> or two releases.
> 
> I guess that many users would find it a bug as well if this core feature just
> stops working. Even if you add a warning; what will probably happen is that
> packages are first built without. You want to risk that backlash, users filing
> reports, etc?
> 
> What about using this error for couple releases and then restoring symmetry?

I think that's a good compromise. Marc-André, could you maybe add a comment 
in front of your new code, saying something like "This is a temporary 
solution, remove after QEMU 8.1 has been released"?

  Thomas


