Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BD4508B7C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:03:10 +0200 (CEST)
Received: from localhost ([::1]:42476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBrJ-0005Sq-Ic
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhAzP-00064C-8Z; Wed, 20 Apr 2022 10:07:27 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhAzL-00035O-OT; Wed, 20 Apr 2022 10:07:26 -0400
Received: by mail-wm1-x335.google.com with SMTP id x3so1274749wmj.5;
 Wed, 20 Apr 2022 07:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qx1RS1d/iwIlmKxsGWzbrFCdBXNg3Eu/twn2yeRqm1k=;
 b=UtcsiCkwCnwfMPbawty5J+18kRqmfMCsgF45DZgpe83koF676J/8zzC9aUA0fozX63
 q2e9qdlf91pyNIO4nE7lIBudNH4ZBzGHgncIqNCRMEr/rxwUfKLV7jjda3wvtwFE/Hel
 16t0GJVxvZRYOZDrBXZ9Hjqj+nQ4dDAKqWgE+SSxtvujOyj80yflA2N+oUdEa+Tx2F8N
 FFKoJoVkRi980UI+6uxT1h6uDcmDs5pag1mS+KQO8yjq6rvf12cH5HLkpk4iDM10O1jO
 r4qga5leSQZANjJVI6TQPz8qr+8WdTyep3CWX9k/zuzDeD/jJ0nm0FADQnEJINjnOYMJ
 qhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qx1RS1d/iwIlmKxsGWzbrFCdBXNg3Eu/twn2yeRqm1k=;
 b=dgqOpjYSHJSKFMtHD6+7Wyk9W4kAaWmJSzjLARpED+FSIrblANmyGl+qqMyC+HuKHL
 7BTnFTKBiOWooZQniKsVHFa2S/TJPsIHZVgW+GshC13Z1Pr2jtjD0TgbZqWL3FnrLBly
 +eKHV6BXj7zYbvHdN15tGHcridc799CeILUAWQ+iM5WvKP+EgLQxzaK86jA4cuuFoiFI
 oJchuk+FV5vrvscrdQJ1Jq0H69kTyDuo+gK+znf+sph3yauTG+5VyF7JxqraLxJHGVrL
 6WH9H3x52ZYgt67tEaqw5CdLpnAxwKpSMHelBukRHJZ+Lyhunp73pjgB+xWckONjtuA5
 bedQ==
X-Gm-Message-State: AOAM531N92zo0U6zb2hL0MpUnk9vjyu64K46eRLYRCHDvlFaQ4wf/8tR
 W2j8CINyznwJtiI8k1M1vgQ=
X-Google-Smtp-Source: ABdhPJyVltw2d/apTj30EHiXNpN6w1uv7s5ypM1EcMgtza4149R8ncj9IosdRkKL0H1XDSkIsp388A==
X-Received: by 2002:a05:600c:4e92:b0:392:89ef:55c8 with SMTP id
 f18-20020a05600c4e9200b0039289ef55c8mr3831071wmq.69.1650463639245; 
 Wed, 20 Apr 2022 07:07:19 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 s13-20020a5d4ecd000000b00207b4c92594sm14703770wrv.59.2022.04.20.07.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 07:07:18 -0700 (PDT)
Message-ID: <e455d56c-8613-8a5f-1ccb-5d65a9a354f0@redhat.com>
Date: Wed, 20 Apr 2022 16:07:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 03/26] nbd: remove incorrect coroutine_fn annotations
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
 <20220415131900.793161-4-pbonzini@redhat.com>
 <20220419180815.ovptpidwpyku2qjf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220419180815.ovptpidwpyku2qjf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: kwolf@redhat.com, hreitz@redhat.com, stefanha@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 20:08, Eric Blake wrote:
>>   
>> -void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
>> +void nbd_co_establish_connection_cancel(NBDClientConnection *conn);
> Should we rename this function to drop_co_  while at it?

Or perhaps rename it to nbd_cancel_co_establish_connection...

Paolo

