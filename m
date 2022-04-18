Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732FE505A59
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 16:53:19 +0200 (CEST)
Received: from localhost ([::1]:43336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngSkg-0002xs-JS
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 10:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngSjY-0001jp-CC
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 10:52:09 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngSjW-0007wy-Vc
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 10:52:08 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b19so18802729wrh.11
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 07:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hMFZhwvNEp3U44Nun8fRBdW4uQ37LKxC4HgXeXAz1HY=;
 b=XBpRwcu0g1VOBYtKkqsuajpiNmfd1LveW31DYgF8tDF/kjZ90CU0l7E2XBIDIx5Gge
 7Wz2QMgHb2k0yGkQrAq07EM1QAwhnc71IzYDCV85k8glrZRCosRzsOh969XdSx5D5BQL
 xifTfvcXFDKZfNX3J1Of4Xvkk61KD05tbpq7CdikZfHHSAYphdyn+Ua818wwBH1lpITO
 dWDMUmqcmCUJzSF99KPnnzH9J3DAWr/TqFEDF/bVF77pvst74x2cEeK6X0+cRpf8ZTL+
 72/u9EOoX6xyGqlpAoXQQyqYNL5BL2xsxPm6RZM3tS9dHcb8Co+CaLC2XkTvGKr4UihK
 /5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hMFZhwvNEp3U44Nun8fRBdW4uQ37LKxC4HgXeXAz1HY=;
 b=CMIGv5yarvwibhE4GsEMHFW4CXStxv4onBZK7tXpkzCGECCscLCG+q6dApFu2TYW83
 StMHZoMfs/R2fWPpcS6myXTJXilNYHO5AL+g1/0fH1qNjvWvUU7D5nu0FwzNI+uwNmiR
 gdWeaNVBrPC6J+KycKtRXbkHlUzmRj+uDezIYoBSwv+MRZWSr4/5vzTwDx6Z/+/6yBVh
 6oxYXI06Zi4RUutoXoz0EctVzuIfsK1p73gk91ToUp87TBoY2qm7X+NdXABVvoMoMnw5
 uf8TSbQ57361tZmWzgDcsLpewevF2DaNGxjIoelhSnKO/Wxvbk9k4Ejc1z2ZcJ5HYfo0
 h2qw==
X-Gm-Message-State: AOAM530nwVhM3WYEaY9WW/tHLGis2/3VxbLhWIh4k3a2lBomi0BOkDge
 Mbq22PNf6R7dgYL2W9msIQ4=
X-Google-Smtp-Source: ABdhPJwRx2wmzdyIo+nwz0kboxF7Td+qYOt+CvqlK/waH6v9qD/v9tKfBX8n2pAm94g9DexCjjHcng==
X-Received: by 2002:a5d:60d2:0:b0:20a:8591:9a28 with SMTP id
 x18-20020a5d60d2000000b0020a85919a28mr8306277wrt.553.1650293525604; 
 Mon, 18 Apr 2022 07:52:05 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 b5-20020adfd1c5000000b0020a7954a974sm9547963wrd.34.2022.04.18.07.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Apr 2022 07:52:04 -0700 (PDT)
Message-ID: <28b1e303-303d-d91f-7e45-3b6baf2a0e29@redhat.com>
Date: Mon, 18 Apr 2022 16:52:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/3] qapi-schema: support alternates with array type
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <20220321164243.200569-1-pbonzini@redhat.com>
 <20220321164243.200569-2-pbonzini@redhat.com> <874k3qjp1c.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <874k3qjp1c.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/22 10:48, Markus Armbruster wrote:
> I double-checked the generated code; it looks good to me.
> 
> Thanks for implementing this, and extra thanks for the tests!

Heh, the problem is having to build the infrastructure for tests.  If 
it's already there, patches like this are actually easier to write with 
tests than without!...

Paolo

