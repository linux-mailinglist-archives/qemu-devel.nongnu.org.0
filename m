Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965D03A6409
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 13:19:21 +0200 (CEST)
Received: from localhost ([::1]:57606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lskci-0005Yn-FC
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 07:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lskac-0002Cz-8z
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:17:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lskYf-0002A6-U0
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:17:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623669309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wOuSUQzdd8ACXhGP62oQ99VhKzt1tkQHNiz7u3jhXA4=;
 b=BLNWPTD2d7Too5YJ4j+hlFAXhFJLRYs4jd59dvmg5XsK3UrDwWT7Ks0+S4FilMhqS/i/+l
 RJjRDM6LQa0by2Kc/gsBV+CpkUzR08+jI0gnUi5trp0G3iHAbpWqnwZbBY6ADHR5+iQmLk
 HitqjPW74n50EsouJ0QFrWO6XdJHu6Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-X3HpSfv7OUKQPmZvxS8ThA-1; Mon, 14 Jun 2021 07:15:07 -0400
X-MC-Unique: X3HpSfv7OUKQPmZvxS8ThA-1
Received: by mail-ed1-f69.google.com with SMTP id
 v8-20020a0564023488b0290393873961f6so12668576edc.17
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 04:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wOuSUQzdd8ACXhGP62oQ99VhKzt1tkQHNiz7u3jhXA4=;
 b=ZTa015nIQGVjXpT1Eh1pgYF2Ny8SdDygBg1ZJdX4PhVCxY8TXFFEWBSpa6N82265Ol
 AIfI6oFg87MNuXkJ78N778BTRwHKNycoy1PLIFUF2mRsoZDd3VFh5zK8j7X+EELiv1oL
 2KZyVKmjblOy2dX1gNxvx/OZJft9dx3mfXh8mT7VCN/pJ3PJqDXpQTbkr+4pDLjNz/K5
 zj9CiDwVmGLFhj35eCmpCgf3a/j5uxIJtV3F4P6VQcF+i8WZM3iWaJc121+VdHtYBXI3
 RI3rWsNj8M33qn4/fsTRQl6zl88hLTIow+kUKuNKOYvQOENsxnGy15NZnbdSAu1MLclb
 jkKA==
X-Gm-Message-State: AOAM531IVj2aBiatM1yOV6/Q/sCy8qx6KFcborF8EX9YNAnaaKnMcvva
 0LEu+bo/cLuPhrAn+wDXSux46PpaTUYiy7Jo5nqiLxsvlJAS0cSb+AlegNCDKJ4tIzeOxGoFj4i
 zMR5nVOo+pXTLq+o=
X-Received: by 2002:a05:6402:3123:: with SMTP id
 dd3mr16309340edb.113.1623669306727; 
 Mon, 14 Jun 2021 04:15:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZK7LQItvenjfOeRBm11KbeEhmpcs09E7lpDQaMgusYOO1A0K+xoLJuU51GM+rKs0ytk1tZQ==
X-Received: by 2002:a05:6402:3123:: with SMTP id
 dd3mr16309325edb.113.1623669306532; 
 Mon, 14 Jun 2021 04:15:06 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m7sm5372476ejo.95.2021.06.14.04.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 04:15:06 -0700 (PDT)
Subject: Re: [PATCH 0/8] configure: Change to -std=gnu11
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210611233347.653129-1-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5b49aaf2-322f-4841-ac9d-aa8ccc97fc5e@redhat.com>
Date: Mon, 14 Jun 2021 13:15:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210611233347.653129-1-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: thuth@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/06/21 01:33, Richard Henderson wrote:
> Now that we assume gcc 7.5 as a minimum, we have the option
> of changing to a newer C standard.  The two major ones that
> I think apply are _Generic and _Static_assert.
> 
> While Paolo created a remarkably functional replacement for _Generic
> using builtins, the error messages that you get out of the keyword
> are*vastly*  more intelligable, and the syntax is easier to read.
> 
> While I'd like to prefer _Static_assert over QEMU_BUILD_BUG_ON
> going forward, and would like to convert existing uses, that is
> a much bigger job.  Especially since the test condition is inverted.
> In the meantime, can drop the configure detection.
> 

Looks good, thanks.  QEMU_GENERIC is the kind of thing that one can be 
both proud and ashamed of. :)

Paolo


