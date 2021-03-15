Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E505F33B0C0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:13:03 +0100 (CET)
Received: from localhost ([::1]:55830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLl9j-0000nr-01
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLl4y-0006GS-6z
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:08:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLl4u-0000IP-Tz
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615806481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=msWbx+F+WWP2pTEoxz86s5oYTHQRANxAFH279m1Aibs=;
 b=gjjRk8gfauxBiw9rutr5ZAfqyvnkRd3k3CLU6G5d+GIhHGMZy2kDtWogBjoEViqux1OdWG
 7H6mSCDfDR3RnBbhZsapdPGQuO+SqKTfxwrNV/USoWgUwGptI4+7q2nb2xaSUWLCbTWHmt
 a2cf2n7uspZMqv9RzqYxOHClKq65akY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-5v1cTVWnNZ-Yo3akl5RWhg-1; Mon, 15 Mar 2021 07:08:00 -0400
X-MC-Unique: 5v1cTVWnNZ-Yo3akl5RWhg-1
Received: by mail-wr1-f70.google.com with SMTP id h5so14888570wrr.17
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 04:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=msWbx+F+WWP2pTEoxz86s5oYTHQRANxAFH279m1Aibs=;
 b=g0VD6w60o1A2Kn8tb9f984jCTDhbcE6u8cpnNxjorlaVLVELPqQfhDgrl/6vHUeruA
 X2ZWSFkvM6DKkRVvthAfH/0cHKvoHmTEclyyanAOWhT++hX0yiLIaP0Q+NhScLCVwjry
 S2TPMisz55wz9C08iQKFuQIhCFzkKY2wvy09Q2GpdN1E3kAiGNne7qXHX+lEVKbmmVU3
 PB2f7iWl1CI2T1kClN4zUFS495BfyflhnaDZIMMZSQRtDAXgxwCK6LMEGJwkNTSBtJZv
 pXFV7MbD4zC3faCUWrzESWKwcaj82QwLVQbeFo9GvtSkl4e1adlmATl2h5CUd8YfRh57
 0U4w==
X-Gm-Message-State: AOAM532nEZzr9jBi3LBI+Buhy2AjXiusYrdVViNvXzKNV5pC2kdAnQwy
 0s9McqRWlX+WHNPd2K4CjPPPfdoYG7ynpdVsaLUPggVM0y/Jem+1lK471oliZ2R7Y5k88c9KqOj
 Kn40BGfY8CzNzOL71vpfglqptT5FD6a2AJfWXPTCobCmreDTu9C/swqRJdNQUyEBJ
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr26947646wru.401.1615806477804; 
 Mon, 15 Mar 2021 04:07:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyE/eStDj1ZWe+V92IkQSQjUEX264w5Rb7K+GAmvJpRjNBgmkGPXVfCavl+/vnRKVDjbbTaxA==
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr26947625wru.401.1615806477619; 
 Mon, 15 Mar 2021 04:07:57 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v9sm18375986wrn.86.2021.03.15.04.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 04:07:57 -0700 (PDT)
Subject: Re: ALSA errors?
To: Izak van Langevelde <eezacque@xs4all.nl>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Volker_R=c3=bcmelin?=
 <vr_qemu@t-online.de>
References: <af1b31d4-b9d1-3db9-3301-5b2b9ce867c8@xs4all.nl>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <01c00886-6435-dc7e-77cb-07f4507b6110@redhat.com>
Date: Mon, 15 Mar 2021 12:07:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <af1b31d4-b9d1-3db9-3301-5b2b9ce867c8@xs4all.nl>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-discuss@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing audio team

On 3/15/21 11:57 AM, Izak van Langevelde wrote:
> It's been a while since I used qemu, but when I try to run my virtual
> machine I get the following errors:
> 
> ALSA lib pcm_dsnoop.c:641:(snd_pcm_dsnoop_open) unable to open slave
> alsa: Could not initialize ADC
> alsa: Failed to open `default':
> alsa: Reason: No such file or directory
> ALSA lib pcm_dsnoop.c:641:(snd_pcm_dsnoop_open) unable to open slave
> alsa: Could not initialize ADC
> alsa: Failed to open `default':
> alsa: Reason: No such file or directory
> audio: Failed to create voice `ac97.pi'
> ALSA lib pcm_dmix.c:1089:(snd_pcm_dmix_open) unable to open slave
> alsa: Could not initialize DAC
> alsa: Failed to open `default':
> alsa: Reason: No such file or directory
> ALSA lib pcm_dmix.c:1089:(snd_pcm_dmix_open) unable to open slave
> alsa: Could not initialize DAC
> alsa: Failed to open `default':
> alsa: Reason: No such file or directory
> audio: Failed to create voice `ac97.po'
> ALSA lib pcm_dsnoop.c:641:(snd_pcm_dsnoop_open) unable to open slave
> alsa: Could not initialize ADC
> alsa: Failed to open `default':
> alsa: Reason: No such file or directory
> ALSA lib pcm_dsnoop.c:641:(snd_pcm_dsnoop_open) unable to open slave
> alsa: Could not initialize ADC
> alsa: Failed to open `default':
> alsa: Reason: No such file or directory
> audio: Failed to create voice `ac97.mc'
> ALSA lib pcm_dmix.c:1089:(snd_pcm_dmix_open) unable to open slave
> alsa: Could not initialize DAC
> alsa: Failed to open `default':
> alsa: Reason: No such file or directory
> ALSA lib pcm_dmix.c:1089:(snd_pcm_dmix_open) unable to open slave
> alsa: Could not initialize DAC
> alsa: Failed to open `default':
> alsa: Reason: No such file or directory
> audio: Failed to create voice `adlib'
> qemu-system-x86_64: Initialization of device adlib failed: Initializing
> audio voice failed
> 
> Looks like the world has changed, how can I get qemu back into working
> shape?
> 
> 
> Any help is appreciated,
> Izak
> 


