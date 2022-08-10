Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C699A58EA8B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 12:41:07 +0200 (CEST)
Received: from localhost ([::1]:40976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLj98-0008JX-9s
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 06:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oLirQ-0005E4-W0; Wed, 10 Aug 2022 06:22:50 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oLirO-0003Sg-U6; Wed, 10 Aug 2022 06:22:48 -0400
Received: by mail-ej1-x62e.google.com with SMTP id j8so26839265ejx.9;
 Wed, 10 Aug 2022 03:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=wYFU7qtSItQbuAo3PMvAGSijMlX2NQQ4RHjhYirQVpQ=;
 b=SuoS5t50klVKkKaBpMTEkSeyUEElrtuA3BaHylKHuM2hYIvxB1n3nmta2tGID3T0UJ
 k0w6coEsUZP/jBN+w3j8KKsmBl+AwAZSfSrm3CkBG+5PlGbGdLuxndbAc0fmttfQvTOK
 L24eqjzmx4AZVWJfNO/a2JE4ip0I/brwzlRjRfSdX1AzrOvIDgabWlvQmfTozqTzemC4
 rP310+EHrnaM2JfsTJMtQYipRRwBR1vI2HLx04A2dTFmG3WASYs1zKriEPz60mXZ8Tjx
 71svxtSfEOhcaPM/Jo26yx+9U8+QZcCZxf1UCVyTWTPiqfmBYU4Z0hQYdR+lAVUXulnM
 9saQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=wYFU7qtSItQbuAo3PMvAGSijMlX2NQQ4RHjhYirQVpQ=;
 b=bbP3NOoClecs962GgFM2g53np531H6Ekucyrl0SLeI232krmRB84BPdPU3lvqK/Rtd
 6I1WSImMuTy/NvtgG8QYzV+ul7cRi9kQr7NuOcjyFYQKy1kG9RQ6HylMmY9kCFpLF2zm
 Ivbc07JaGV+cp2B3hSL3SxzI6EQ+NqVH8G9ajcFKqonWNd5J4hhXk+tZ4rt7G79SdLqg
 jLSJgvxtuissY+kag23v38qtj2Vu2E+dY01kxdDxJh2squNTl84YIE8S2orhdc8YXAyH
 fO/NNiw5qyGdt+MyxRL9WqX4jG7U/MbKnO48JIP4nSIBLGLFXvcelU2u/MPUPOljvSGn
 HlPA==
X-Gm-Message-State: ACgBeo1bvdLJv+28ZWTSAv2oEWRix9oW7eC5WNRneiIR8BFby33s/CHf
 5mu3E/rMVJzzIr30PaahRKo=
X-Google-Smtp-Source: AA6agR78UJaKxc79UQXFoz+Qw1dpSCCwPDx+KAFjwv4BgzDsDMDzI9V2KkP+V052i6mciWcE/26f8g==
X-Received: by 2002:a17:907:7284:b0:731:82a3:16e3 with SMTP id
 dt4-20020a170907728400b0073182a316e3mr6938990ejc.30.1660126963680; 
 Wed, 10 Aug 2022 03:22:43 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 a1-20020a50ff01000000b0043a5bcf80a2sm7457435edu.60.2022.08.10.03.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 03:22:43 -0700 (PDT)
Message-ID: <f0f0b559-3159-27e4-738d-de1068dcc991@redhat.com>
Date: Wed, 10 Aug 2022 12:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 00/11] Refactor bdrv_try_set_aio_context using
 transactions
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220725122120.309236-1-eesposit@redhat.com>
 <b3eb6174-5fd5-f7f9-512c-4cdb46e62502@yandex-team.ru>
 <0b3872fa-830a-f657-76be-2fbae055dffa@redhat.com>
 <7b84b9be-b97b-2e53-5396-70d5c66ebfcf@yandex-team.ru>
 <662bee2d-e053-1a59-ba6a-41bbde955260@redhat.com>
 <2775bfae-5814-fdc3-c1ed-37b270a85aba@yandex-team.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <2775bfae-5814-fdc3-c1ed-37b270a85aba@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/22 17:32, Vladimir Sementsov-Ogievskiy wrote:
>> if I understand correctly you suggest:
>>
>> .prepare = check and then change aiocontext
>> .abort = revert aiocontext change
>> .commit = nothing
> 
> Yes. And that's is how it used actually now in transactions, for example:
>    bdrv_attach_child_common (which is .prepare) calls 
> bdrv_try_set_aio_context() (which is check and then change)
>    bdrv_attach_child_common_abort (which is .abort) calls 
> bdrv_try_set_aio_context() to revert .prepare

I see your point, but I think this can be solved just with a doc comment 
explaining why the transaction is "local".  This is already clear in 
bdrv_child_try_change_aio_context (which doesn't take a Transaction*), 
it can be documented in bdrv_child_change_aio_context as well.

After all, the point of this series is just to avoid code duplication in 
the two visits of the graph, and secondarily to unify the .can_set and 
.set callbacks into one.  We could do it just as well without 
transaction with just a GList of BdrvChild* (keeping the callbcks 
separate); what the Transaction API gives is a little more abstraction, 
by not having to do linked list manipulation by hand.

To be honest I also don't like very much the placement of the 
drained_begin/drained_end in bdrv_change_aio_context.  But if the needs 
arises to call bdrv_change_aio_context within another transaction, I 
think they can be pulled relatively easily (as a subtree drain) in 
bdrv_child_try_change_aio_context or in its callers.  For now, this 
series is already an improvement on several counts.

Paolo

