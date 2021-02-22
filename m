Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2E1321406
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 11:23:11 +0100 (CET)
Received: from localhost ([::1]:56608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE8Mw-0007Vx-76
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 05:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lE8KY-0005Fa-Vv
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:20:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lE8KW-0007gM-0W
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613989238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8YkQO/3xMLbYWKJdXkFZV0mc+rf7JbeFX37jy+7NyaY=;
 b=Y+MnTqUCXJAQD87p/+MVakTQJZQCWlFcjwAClu7xxABiV+/CBJ4xRZ4sU8u9K049DngqdW
 iZGyOZsOoPUzckEl56W8nwUFRTCoqtRrtsYdB8gZOXY9GRev8tkgOEP4UHARuq4fQd3jy8
 QCnglC5zxk+FGG+nub7rfwAub150BDc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-37bwRsniNzGtTAIET8oR_Q-1; Mon, 22 Feb 2021 05:20:36 -0500
X-MC-Unique: 37bwRsniNzGtTAIET8oR_Q-1
Received: by mail-ej1-f69.google.com with SMTP id mm18so997640ejb.7
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 02:20:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=8YkQO/3xMLbYWKJdXkFZV0mc+rf7JbeFX37jy+7NyaY=;
 b=e+LfcnL/M5HnoMMEKiUKnrmIQtBSeHGG1i1SHXe79ygjNxSHeIhOGiXJ+/a94uxoMI
 zJ5i+sLmcmr33sdTht9HIuDnU6rNG/kOF+JDDgUht8o8VvZeZiEo+fG4xVXlK07IO6mG
 VunUgBX8ruMyvMfY6VOkw7fzi+u2Ypxk0Y7k8ktVtbhPx3WZKuDeAh/RSuvI2Nh0PZTP
 a95NMdJDx5EOLmbjbUvW7WhdNV/xPKz1+cP7/t3UsfAiR9sp7ec7BTXlSe1jdqVndg1x
 bkedslEQK+lTsuXI1O6a5LK8iPk2iCVD0YlAzaD67E1FCjfoh2r1vhx0pgfzeG9meF8W
 swzA==
X-Gm-Message-State: AOAM531dH8QEof+XFn/OGfdB399h/D5L+6+ybBM/SyPR11qwFG81fh8B
 jDS87jBa6nXkFuVOoFsUfGTbx6VU28gKVCsIiCkFRH+a+2/ad6l2OjTjrEWGX3lmXX1FlpQSAnX
 esyn5WqG1dgYhI6U=
X-Received: by 2002:a17:907:d21:: with SMTP id
 gn33mr20336685ejc.242.1613989235374; 
 Mon, 22 Feb 2021 02:20:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/8yTmqqubcD5N6La2J13sFfv9BpZDC5gsPZyQmvt/g5cTkE6iDB4SWql91FTcm8aReuuYyg==
X-Received: by 2002:a17:907:d21:: with SMTP id
 gn33mr20336678ejc.242.1613989235199; 
 Mon, 22 Feb 2021 02:20:35 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id f1sm213831edz.83.2021.02.22.02.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 02:20:34 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
In-Reply-To: <87sg5xjj60.fsf@vitty.brq.redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com> <87tuqhllmn.fsf@vitty.brq.redhat.com>
 <20210212151259.3db7406f@redhat.com> <87k0rdl3er.fsf@vitty.brq.redhat.com>
 <20210212170113.30a902b2@redhat.com> <87eehhlnj5.fsf@vitty.brq.redhat.com>
 <20210215180106.7e573e6a@redhat.com> <87sg5xjj60.fsf@vitty.brq.redhat.com>
Date: Mon, 22 Feb 2021 11:20:34 +0100
Message-ID: <87mtvw4d59.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, drjones@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vitaly Kuznetsov <vkuznets@redhat.com> writes:

> Igor Mammedov <imammedo@redhat.com> writes:
>
>>> 
>>> We need to distinguish because that would be sane.
>>> 
>>> Enlightened VMCS is an extension to VMX, it can't be used without
>>> it. Genuine Hyper-V doesn't have a knob for enabling and disabling it,
>> ...
>>> That bein said, if
>>> guest CPU lacks VMX it is counter-productive to expose EVMCS. However,
>>> there is a problem with explicit enablement: what should
>>> 
>>> 'hv-passthrough,hv-evmcs' option do? Just silently drop EVMCS? Doesn't
>>> sound sane to me.
>> based on above I'd error out is user asks for unsupported option
>> i.e. no VMX -> no hv-evmcs - if explicitly asked -> error out
>
> That's what I keep telling you but you don't seem to listen. 'Scratch
> CPU' can't possibly help with this use-case because when you parse 
>
> 'hv-passthrough,hv-evmcs,vmx=off' you
>
> 1) "hv-passthrough" -> set EVMCS bit to '1' as it is supported by the
> host.
>
> 2) 'hv-evmcs' -> keep EVMCS bit '1'
>
> 3) 'vmx=off' -> you have no idea where EVMCS bit came from.
>
> We have to remember which options were aquired from the host and which
> were set explicitly by the user. 

Igor,

could you please comment on the above? In case my line of thought is
correct, and it is impossible to distinguish between e.g.

'hv-passthrough,hv-evmcs,-vmx'
and
'hv-passthrough,-vmx'

without a custom parser (written just exactly the way I did in this
version, for example) regardless of when 'hv-passthrough' is
expanded. E.g. we have the exact same problem with
'hv-default,hv-evmcs,-vmx'. I that case I see no point in discussing
'scratch CPUs' idea at this point because it is not going to change
anything at all ('hv_features_on' will stay, custom parsers will stay).

Am I missing something?

-- 
Vitaly


