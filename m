Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE6934CE01
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 12:31:44 +0200 (CEST)
Received: from localhost ([::1]:40462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQpBP-0002x3-42
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 06:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQp9M-0002QY-MF
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 06:29:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQp9I-0001Kj-QU
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 06:29:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617013769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6/RPWM9tQWn+8KgIkE/9pdQwEjcx6rVHz+YUjcedeEE=;
 b=GHWnv69rRUV1uiv0Lm3/fWqBYxKugTTI40bKBW01P0W7KqoZCZkb1RLMDepfErwXAb7lYp
 5zZoQJl19oYkey2EWLPDPlNkWf+PkGLPBkGDFMgpRzu7FiHwN/PqpJc55eQ3pTFtD5OwYo
 /FDGEUMZZP9k5v28x+5oZCp1XlycmRE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-ky7BKVNnMPynXdLl0XN-4A-1; Mon, 29 Mar 2021 06:29:27 -0400
X-MC-Unique: ky7BKVNnMPynXdLl0XN-4A-1
Received: by mail-wr1-f69.google.com with SMTP id t14so8460609wrx.12
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 03:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6/RPWM9tQWn+8KgIkE/9pdQwEjcx6rVHz+YUjcedeEE=;
 b=sSn3Zmxe6rSYic5VMffSznsMytrxDPidp547Y1aHi0KcTdeNF7O6pb1Wj88Dbvbspw
 aXsoOPx/qEcxF92+fHQurpe4mUVcwO2DrsnagrVBJr4gY20e8b2SGaLyF1QyDrW0Fc6w
 Xfwj4+iKiXBzi0tg0xEtOfaqDFpVZpkyR3HN7KBXbV5BbDtq03LWFc279IWaJPuLjRmz
 7PYVQmpiGrZEyhAoMBc4X1ebL2jyhrzglP06ED6srfvewkIadu0yxs6PKKc7iiAAfV7y
 pAbxs4IatMV7iTzlbaQGeoCOWZuRTsjj9jMtIG/MfYbWoHTI8i/tOxga5dE0hygarxLg
 AWPg==
X-Gm-Message-State: AOAM533EmDgzfMBrFrlJ1r56oxI7V/3mUD6BhL4bAcbiBRsLt1DXStpY
 z2tBheX7mnlElwE0rGXjV7WnkC5oFbT/iyO/kX702Zpe4oMXbmBrjKg0kGrono4niKR/onMaqya
 bNodlNs2gpvKjazc=
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr28350812wrw.334.1617013766300; 
 Mon, 29 Mar 2021 03:29:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvWrmtRYTTZMjLhOQczzNbldktSt3SwrPTGK7F0yNSAPFsSyHAzHyUPaNqGl4NVAwsXlpvvw==
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr28350794wrw.334.1617013766098; 
 Mon, 29 Mar 2021 03:29:26 -0700 (PDT)
Received: from [192.168.10.118] ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id l15sm28674531wru.38.2021.03.29.03.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 03:29:25 -0700 (PDT)
Subject: Re: [PATCH v2] replay: notify CPU on event
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161700382734.1136014.13372992399972618499.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0fa410cd-32e8-5349-dbde-0c61fdc29e80@redhat.com>
Date: Mon, 29 Mar 2021 12:29:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161700382734.1136014.13372992399972618499.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/03/21 09:43, Pavel Dovgalyuk wrote:
> This patch enables vCPU notification to wake it up
> when new async event comes in replay mode.
> 
> The motivation of this patch is the following.
> Consider recorded block async event. It is saved into the log
> with one of the checkpoints. This checkpoint may be passed in
> vCPU loop. In replay mode when this async event is read from
> the log, and block thread task is not finished yet, vCPU thread
> goes to sleep. That is why this patch adds waking up the vCPU
> to process this finished event.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   replay/replay-events.c |    1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/replay/replay-events.c b/replay/replay-events.c
> index a1c6bb934e..92dc800219 100644
> --- a/replay/replay-events.c
> +++ b/replay/replay-events.c
> @@ -126,6 +126,7 @@ void replay_add_event(ReplayAsyncEventKind event_kind,
>   
>       g_assert(replay_mutex_locked());
>       QTAILQ_INSERT_TAIL(&events_list, event, events);
> +    qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
>   }

I still do not understand why the qemu_clock_notify function is used to 
notify the CPU.  It would be nice to have a description of the call 
chain in a comment or to have a more appropriate API.  I can queue the 
patch since it's deep in replay-events.c and not in common code, but if 
you post a short description here I'll integrate it.

Paolo


