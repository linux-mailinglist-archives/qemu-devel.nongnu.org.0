Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C209645C404
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:43:36 +0100 (CET)
Received: from localhost ([::1]:58164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpsYh-0008OM-8I
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:43:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mprzU-0001GG-D1
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:07:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mprzS-0007gx-7A
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637759228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dptFLvsRdvRwk38ibI6FEBFEazfpFmsgFMnM6nh3+oE=;
 b=jBGldL9gLYBP2irvE/1+w2WLcv21gJEP92af+6/dDVH158pGsHgBmhkyRdVhmq7lPciBHp
 Rs7E7USKTzL9CB/e/hkp+GhWna3gZC8htQj5SJXGjFvYIdY9+2NlHLuoE5ZX8zF8dqMNqF
 4V1tyHhQ6CWumpYHyQCx0ocv0qhEj70=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-_mWNOdsVPfu_DLaOggNI1g-1; Wed, 24 Nov 2021 08:07:07 -0500
X-MC-Unique: _mWNOdsVPfu_DLaOggNI1g-1
Received: by mail-wm1-f71.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so1309095wme.6
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 05:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dptFLvsRdvRwk38ibI6FEBFEazfpFmsgFMnM6nh3+oE=;
 b=gPGS+HwheJCKRFt43cRNzmMOUxqBOBzMTOduGN67VgHqPmzLoQOIlaMY/dSqNTk5ST
 EgJSrWhu8NJhYgh1Sd+L4LCKm2Jb+amU9heamd/tZyTlSY9AkULpLtZXm7ruvb3u02FC
 OaRLZ/UExyHntUq7kgUZ7L7YlTiURBtJ032mU4ZOENPpuQUVc7ySxdovt/KsLPTQrKfk
 +YdtlPJ0difzzCE6N4d1bADgTk9N3aCnboMbqYmoyM5JSIHjlfNZfVbz3rsTWUE4NcsJ
 8ISSjT28wPtNZWWtAv9UUrQCK+G4JT/BlT1H/OdIA+bWtofanGXQiQ977gFzfGNGwYdW
 GArQ==
X-Gm-Message-State: AOAM5324DHBBec0x0NXn/c2hpIWnQ1q+I2n8YaB5ixPahNgenSCcjKes
 UhmsuoWa2pyz2KB3SlIhxJlHDnRVJFzHAEauqLP5iLMQHM6q2fjBHl4BQcFGu7BIFS18vSh5Wws
 MUgjwVXToRbQopU8=
X-Received: by 2002:a5d:6447:: with SMTP id d7mr18948662wrw.118.1637759224662; 
 Wed, 24 Nov 2021 05:07:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGPquWRpQ6+2uCXbI6pBfZrS1pv46lqJVP53gIjK2hQazjMvfJdTJPckiON8cjfcfVheRsAQ==
X-Received: by 2002:a5d:6447:: with SMTP id d7mr18948359wrw.118.1637759222669; 
 Wed, 24 Nov 2021 05:07:02 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f19sm5995701wmq.34.2021.11.24.05.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 05:07:02 -0800 (PST)
Message-ID: <84a64ab9-f874-2c30-9ed9-41b13a1c6c33@redhat.com>
Date: Wed, 24 Nov 2021 14:07:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] spice: Update QXLInterface for spice >= 0.15.0
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211123134302.45741-1-berrange@redhat.com>
 <20211123134302.45741-3-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211123134302.45741-3-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 14:43, Daniel P. Berrangé wrote:
> From: John Snow <jsnow@redhat.com>
> 
> spice updated the spelling (and arguments) of "attache_worker" in
> 0.15.0. Update QEMU to match, preventing -Wdeprecated-declarations
> compilations from reporting build errors.
> 
> See also:
> https://gitlab.freedesktop.org/spice/spice/-/commit/974692bda1e77af92b71ed43b022439448492cb9
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

?Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>?

> ---
>  hw/display/qxl.c        | 14 +++++++++++++-
>  include/ui/qemu-spice.h |  6 ++++++
>  ui/spice-display.c      | 11 +++++++++++
>  3 files changed, 30 insertions(+), 1 deletion(-)

Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


