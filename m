Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F124FF09B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 09:34:14 +0200 (CEST)
Received: from localhost ([::1]:58286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neXW1-0006dv-Il
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 03:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neXS3-0005PL-Ci
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 03:30:07 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neXS0-0001Ub-Dk
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 03:30:06 -0400
Received: by mail-wm1-x32f.google.com with SMTP id q20so497946wmq.1
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 00:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3+BOWkMIr4Wmhh4A2gyncW3FK4HKiR2V4+J5M7yixjY=;
 b=AtvumQ1CJ3Jb1DtUaanGwnQGAaZNmeeNGZlgBbTtCxXmz1Io54/4w/uHSiCif7wMeU
 rKc8gU0ZkQbxz14mB6tQ2SdpPQf54EzQWISm4hE4l5YsbAd/EaluD4ntONOtxHeZsNmA
 K13266l+NeAE43B0I/Ob6xBh/FEQu54kU/TUkHl9TkWOdLgaVz78lplOL43PgdGFu0Lq
 VK+rbzHuPHr4Ml0EVhCIlI7ngRJHs3jbwqsRmAVeFxj+OEAvJTgyWK3WBxeMTJcwStbQ
 5qQKrHDbLvDD4a5TW6icoHKiANJthsUCr1oc/sRapnlSlZrPpakALiYa/Np2Gspf5Zgi
 4DJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3+BOWkMIr4Wmhh4A2gyncW3FK4HKiR2V4+J5M7yixjY=;
 b=LuPqjTpQewQ2bu3VHynAD+O37k9foo1cDwtgUraZWlDFKzf1vC5EV2boKU5rP0lfg2
 4eQxzwK+tuxHLt2ihUskc3D1YopMReiy+zljvpxBH9L90BgObUG5KnwUZA30E7yvLw38
 nXHURppjsZu/4Gb/8OVtZM5Q4wi3nX7/je/RqQMJ4V8+5UUyCAwfxfa3Xn2KWKKexmVB
 Aq+PAHo/r8u+/xEF7S17lpEMXWNbNr4J1ESnRc1EgYaFCYsShec5Ao7Mg3lo7I6Ex1JJ
 smiLOdgxqIdT2yXHVYoIkwxUUf5zNx36u1zwapgOnJZmnyawJWgHPzwpDwXH7CBiGMdI
 1C5w==
X-Gm-Message-State: AOAM532HgjBY6XGBj/54F0jEd5Dbgk/i5f7ATKhsfWyFX5YQSeiMTXZ7
 7It6y/UzGtHOael5ubf0lCQ=
X-Google-Smtp-Source: ABdhPJzDf7MMxBl5ZzrF8AIHTxNY/GJEZkM/kCKlvu5ZGgMm7eZ25Pkgf8h5TOGIgt4lv6sh6sw7fg==
X-Received: by 2002:a05:600c:3ba9:b0:38e:c8c6:ae0d with SMTP id
 n41-20020a05600c3ba900b0038ec8c6ae0dmr6257227wms.120.1649835002215; 
 Wed, 13 Apr 2022 00:30:02 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 r17-20020a0560001b9100b00207afaa8987sm3756769wru.27.2022.04.13.00.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 00:30:01 -0700 (PDT)
Message-ID: <2f8df0cd-b067-199a-6396-cb29c9f45fac@redhat.com>
Date: Wed, 13 Apr 2022 09:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 1/8] nbd: actually implement reply_possible
 safeguard
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
 <20220412194204.350889-2-pbonzini@redhat.com>
 <20220412220553.dheyqpxfgkjkjtqv@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220412220553.dheyqpxfgkjkjtqv@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
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

On 4/13/22 00:05, Eric Blake wrote:
>> +        s->requests[ind2].reply_possible = nbd_reply_is_structured(&s->reply);
> If the reply is simple (not structured), then we expect no further
> replies, so this sets things to false.  But if the reply is
> structured, the answer depends on NBD_REPLY_FLAG_DONE, as in:
> 
> s->requests[ind2].reply_possible =
>    nbd_reply_is_structured(&s->reply) &&
>    (s->reply.structured.flags & NBD_REPLY_FLAG_DONE);
> 

Thinking more about it the field is unnecessary, we can just check 
.coroutine in the same fashion.

Paolo

