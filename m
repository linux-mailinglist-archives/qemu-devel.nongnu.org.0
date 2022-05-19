Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA9952D119
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 13:04:40 +0200 (CEST)
Received: from localhost ([::1]:39192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrdxG-0007rc-58
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 07:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrdt6-0006x0-FJ
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:00:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrdt3-0005rX-Fc
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:00:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652958008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cTNF8C+eA31JEYZeeRyvtZCdIqusDHDiFHtRqFN8ZbM=;
 b=dtyajIW9urArOcGMcrpd+O+lYV/XyI5UglmCEFm0aGXWtDDKwJNp5+hNlg+PFXDREdEyCi
 JfbbPxNSB4x4dJCPhwCMTFzijbXEnqj/h8RQWBPrV/dm9T7LguXRhEmPnndHKGU7beC0Pn
 IN29qYNqEw9s8YtNazJbTkjKd34MU7M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-tD_UvCNRPsyPUCd5_eOMNA-1; Thu, 19 May 2022 07:00:07 -0400
X-MC-Unique: tD_UvCNRPsyPUCd5_eOMNA-1
Received: by mail-wm1-f71.google.com with SMTP id
 p24-20020a1c5458000000b003945d2ffc6eso1906653wmi.5
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 04:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cTNF8C+eA31JEYZeeRyvtZCdIqusDHDiFHtRqFN8ZbM=;
 b=75CteR/gZlAsgG3skd06byjvP27dkumKYejbLtQPpVPUKvhh6Uj31/BFKLpfyGuATl
 HX+mEUbNCxqL+xvm62/lSLTzxnzv+K68hCYMsatfrcjGtC/FIG0d5H+DuSMYrHsUKO3I
 NxzWLi6jiwPvIgqF2sEQUUsd/IRq8MD6L+Iyi4Eb0s+YZZ6PEGPKI9Ldmx4F9ADLZoHZ
 sWcZ7+aFu5joN912OkMJD6B8VBRyMr2AQhN850fm7q4Hhmpckc3QPVWiqhZfbINd+ghj
 woGMFQy7ng4knVZlPZ0UweY35j63le2P48To3k/eGRXBNd1lqasY2lyltf6yxehGZ/lK
 FNtw==
X-Gm-Message-State: AOAM532sLJniCfOXTjl2moYCNPoXvIn/GyH7gAafl/Nz0vD1PbgWYD84
 YDTEKwB7IDTYeLlbemkYczYLZiUH+fgx++rPObxrs3SrSuwErDaXmJQA7afjtcqjyWrKvyTH6vE
 D3p5P2hIRj8et46g=
X-Received: by 2002:a5d:64ca:0:b0:20c:64e3:949e with SMTP id
 f10-20020a5d64ca000000b0020c64e3949emr3474590wri.584.1652958005929; 
 Thu, 19 May 2022 04:00:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFS5jhMUUFFTi31ccNnYO2xVIKXyZHgBI0Lt3gRB4PYcBJDL7+7cLgvvyLHy+AhWdjHwH4Sg==
X-Received: by 2002:a5d:64ca:0:b0:20c:64e3:949e with SMTP id
 f10-20020a5d64ca000000b0020c64e3949emr3474562wri.584.1652958005651; 
 Thu, 19 May 2022 04:00:05 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-176-97.web.vodafone.de.
 [109.43.176.97]) by smtp.gmail.com with ESMTPSA id
 c3-20020adfa703000000b0020d012692dbsm5516929wrd.18.2022.05.19.04.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 04:00:04 -0700 (PDT)
Message-ID: <0fe4b580-af34-6147-c9f4-2f3a8ea6cd31@redhat.com>
Date: Thu, 19 May 2022 13:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/3] ui: Switch "-display sdl" to use the QAPI parser
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Ryan El Kochta <relkochta@gmail.com>
References: <20220518134446.211632-1-thuth@redhat.com>
 <20220518134446.211632-3-thuth@redhat.com> <87pmkakhdk.fsf@pond.sub.org>
 <f1e31bd1-551e-0366-8a59-d012b23bb88e@redhat.com>
 <fa3d97ca-ae63-30aa-4b0b-10f786069e15@redhat.com>
 <0fa5a892-0053-4172-60f3-d6e5a49a23fd@redhat.com>
 <20220519104824.gkrkbsbs3xwuytgr@sirius.home.kraxel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220519104824.gkrkbsbs3xwuytgr@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 19/05/2022 12.48, Gerd Hoffmann wrote:
>    Hi,
> 
>> Oh well, I just noticed that we already have a GrabToggleKeys enum in
>> qapi/common.json ... I wonder whether I should try to use that instead? It
>> seems to be used in a slightly different context, though, if I get that
>> right ...?
> 
> qemu/ui/input-linux.c
> 
> Those switch the input routing between host and guest, and they act on
> their own (i.e. by default both control keys without anything else).
> 
> For SDL it defines the modifiers to press in addition to the hotkeys
> (i.e. ctrl + shift + 'G' for grab release, IIRC there a are more, 'F'
> for fullscreen?).
> 
> So I don't think it makes sense to merge them.

Hmm, ok ... but maybe I should call the new enum HotKeyMod instead of 
GrabMod to make it more obvious that it is something different?

  Thomas



