Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D83031A1AF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 16:32:06 +0100 (CET)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAaQP-0005Z1-9z
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 10:32:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lAaKk-0002Mx-JR
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 10:26:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lAaKe-0005Oc-Mb
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 10:26:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613143567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gUXSfZ/79ukrEtqnWqQfYNscUhu1zlKYgFbDSby6WFk=;
 b=WjKxsqDvNuaHkF8CJMpphu4z7hIXZzGFk2t9YYh507s6Ii42c1CC4brtzbCbvjVFg7MtuJ
 HcddT81i1uy+JaPaEwHFIP4/N+moNVcDOM5KOGiYSBH3uSSqPnzMiK55C+ravfi4gXvEmb
 F/MluuhdAfipuYHCBepW50E6lmY3Czg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-9wFrE9KRM9e1gFCcaLkD0w-1; Fri, 12 Feb 2021 10:26:05 -0500
X-MC-Unique: 9wFrE9KRM9e1gFCcaLkD0w-1
Received: by mail-ed1-f72.google.com with SMTP id a20so78108edx.14
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 07:26:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=gUXSfZ/79ukrEtqnWqQfYNscUhu1zlKYgFbDSby6WFk=;
 b=knRMJeo88HOIn8kqmw5QfUNeIBt06nY/eUEohUzjZTtcFD7sFvcitdOzMYlHfNVu7/
 DX5WbLmO2gflk0bZtbHD40S6Skv23wRK6Y5ZAK7H+W62ZWGu5hUhYbOMbcag2maVP/Gh
 UrSRlZ9nV7SRLbykwbC5m+B5kmv3P9wqnCYHAnFIFUKOX9pIL/JQC226huXgOhRiRcdB
 BiHaUhQeC3qX5NYHay2gaajr4k2vF4QcPgf060qYOlpuPLanl00yA+eOWxGIW16LLN1D
 pNz152ii1lS6RVMhZsxBc0VoJB+w3Dc0M1nnurlGZ8Abnrr75wXNPAG0w4F+ZO7PtzG0
 I04w==
X-Gm-Message-State: AOAM531AUGxhDrYgZC0hix/vlel2SHIjWP/GH1oo/wpfxrUDPlL25l9W
 8Ce5x/hwph6wayHDiwpXsMFyCPFlR49g3YjWh/ZHvP/vnx+N3uKQYD0EJFZDfzXvKr+VmVtJ8zr
 jKlbZt/EYGnw6pOY=
X-Received: by 2002:a17:906:5016:: with SMTP id
 s22mr3570529ejj.550.1613143564131; 
 Fri, 12 Feb 2021 07:26:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSg1mFTNDm5f1MEbCEYzrVGUFJWw3unfSNcpNjA6u0v0GuY6c3b51LRXQdJQ5s3Wul6N6KPg==
X-Received: by 2002:a17:906:5016:: with SMTP id
 s22mr3570510ejj.550.1613143563941; 
 Fri, 12 Feb 2021 07:26:03 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id lc11sm6423357ejc.95.2021.02.12.07.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 07:26:03 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
In-Reply-To: <87k0rdl3er.fsf@vitty.brq.redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com> <87tuqhllmn.fsf@vitty.brq.redhat.com>
 <20210212151259.3db7406f@redhat.com> <87k0rdl3er.fsf@vitty.brq.redhat.com>
Date: Fri, 12 Feb 2021 16:26:03 +0100
Message-ID: <87h7mhl33o.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
>>
>> Please try reusing scratch CPU approach, see
>>   kvm_arm_get_host_cpu_features()
>> for an example. You will very likely end up with simpler series,
>> compared to reinventing wheel.
>
> Even if I do that (and I serioulsy doubt it's going to be easier than
> just adding two 'u64's, kvm_arm_get_host_cpu_features() alone is 200
> lines long) this is not going to give us what we need to distinguish
> between
>
> 'hv-passthrough,hv-evmcs'
>
> and 
>
> 'hv-passthrough'
>
> when 'hv-evmcs' *is* supported by the host. When guest CPU lacks VMX we
> don't want to enable it unless it was requested explicitly (former but
> not the later).

... and if for whatever reason we decide that this is also bad/not
needed, I can just drop patches 16-18 from the series (leaving
'hv-passthrough,hv-feature=off' problem to better times).

-- 
Vitaly


