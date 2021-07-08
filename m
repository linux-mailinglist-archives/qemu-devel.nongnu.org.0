Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30E23BF7BF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:43:49 +0200 (CEST)
Received: from localhost ([::1]:48736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1QZQ-00030h-UV
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m1QYf-0002Kp-Ed
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:43:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m1QYd-0001ft-Ai
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:43:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625737378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OP3ZUalua15dWt7/6whmBL3iz7bdHz8xouhqteRGHp0=;
 b=b9s0iE0hygHurqCHZfjZeELam+dHYLtCfQ2+KsTfW/gPcyQ0bKNFSR4F/eY1azyIR5VOz2
 nvoGbJfSBEqmIQDGeu3r8ToUDBOM+JF1o85Au12Meog7ftSuKNUtvu88exZ3l0yx76ilKh
 +yfdT1GlRy3uJudJ8x6igUTaRbT1PEM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-e5pVadDoMv2GiwwDcegJzw-1; Thu, 08 Jul 2021 05:42:57 -0400
X-MC-Unique: e5pVadDoMv2GiwwDcegJzw-1
Received: by mail-ed1-f72.google.com with SMTP id
 f21-20020a0564021615b029039dd8826cd9so2673886edv.9
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 02:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OP3ZUalua15dWt7/6whmBL3iz7bdHz8xouhqteRGHp0=;
 b=ZT5MQW62JcJYC2LKOuiV0nyDNvATBpWOk8XfFrjejqYEQ9OUdXx2+kIZ1Y0wv04wkh
 rfuUKZNHMQj6epryt4b5nQY8gOgnfMNjBKXwtuww1yyk2g9hLNNdFInxvnw8E7AhA17m
 ve5qg5eAky4QHExcgA5MNn+BIouTJ7nFk0RPAimLzWeaCN/PxSmxYs7r9kp7FWkuybzJ
 SQjdojbpIoUnN8wRS4g9YeF4ME5nonCr6/kAcp9mrVX3x3WaY9JUgO9C8FA5agTEY6J+
 zc3a5+Q5x+5vj5Iv5JtU6NZzfsgEQdTd2CWpHCefrXMxFPeNCDA2umzOC0qkY7RrIpF2
 5UYw==
X-Gm-Message-State: AOAM5305dm+CFL9Vr2gEs6lmlxzqKnxBHQcPnEhS4Wr4nwiugURToepr
 US7na9x5gEeU8HMMoBY2VZrSCXWWnogmx9UsNLTaZixKNmj4XHVL0xKfwoJVHVsgLWU7baAFMZQ
 TugklWYbuTN0KgL7uHvM6NV8k5hhMHQHEGKTIgAWyc1vViCbcI/Dcby4t2XkErGobZ/M=
X-Received: by 2002:a05:6402:430f:: with SMTP id
 m15mr24758138edc.113.1625737376393; 
 Thu, 08 Jul 2021 02:42:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/wy0HACtM9nsI0b7uwzWk6pZrkxN3uJa+IQ7uaOWNapo1qEW88x527NopNP6CW4xFbeTXYw==
X-Received: by 2002:a05:6402:430f:: with SMTP id
 m15mr24758101edc.113.1625737376196; 
 Thu, 08 Jul 2021 02:42:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cq6sm975936edb.1.2021.07.08.02.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 02:42:55 -0700 (PDT)
Subject: Re: [PATCH] vl: fix leak of qdict_crumple return value
To: Markus Armbruster <armbru@redhat.com>
References: <20210707121545.361829-1-pbonzini@redhat.com>
 <87k0m19nw6.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6126d8d4-38dc-d63b-b1f8-e8da62d28d28@redhat.com>
Date: Thu, 8 Jul 2021 11:42:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87k0m19nw6.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/07/21 11:05, Markus Armbruster wrote:
> Minimally invasive fix, but the result is a bit awkward.  Possibly
> neater:
> 
>         if (qobject_type(crumpled) == QTYPE_QLIST) {
>             error_setg(errp,
>                        "Lists cannot be at top level of a configuration section");
>         } else {
>             assert(qobject_type(crumpled) == QTYPE_QDICT);
>             qemu_record_config_group(group, qobject_to(QDict, crumpled),
>                                      false, errp);
>         }
>         qobject_unref(crumpled);

Even better:

     switch (qobject_type(crumpled)) {
     case QTYPE_QDICT:
         qemu_record_config_group(group, qobject_to(QDict, crumpled), false, errp);
         break;
     case QTYPE_QLIST:
         error_setg(errp, "Lists cannot be at top level of a configuration section");
         break;
     default:
         g_assert_unreachable();
     }

Paolo


