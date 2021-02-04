Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B474D30F53A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:42:58 +0100 (CET)
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fqT-0005SC-Pp
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7foQ-00043x-Rz
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:40:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7foO-0000rj-Oy
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612449648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DKsE5AQAtrQoBozLi1AmahHhSHTKpmCKt4sP/BAix90=;
 b=NW310FF0mdz+YEhUHVnQs5h0c/MQIbBC1otho3Sm1XQPLGUMtDbZqkVykS0ffUIC5RDrNl
 Wms5Ih/8MowpTEYi4XhQjAtBJ7WwC7xrcUtp9KW/+CMdt/8oC92oS81WgrSKU5oe5MNMc5
 R6wXPKfRGsEd6Uhc2NRJPEZ+4xOXDUs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-RU0uaN-NOdWltZDbGAYoZA-1; Thu, 04 Feb 2021 09:40:44 -0500
X-MC-Unique: RU0uaN-NOdWltZDbGAYoZA-1
Received: by mail-wm1-f70.google.com with SMTP id y9so2075403wmi.8
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 06:40:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DKsE5AQAtrQoBozLi1AmahHhSHTKpmCKt4sP/BAix90=;
 b=er7xyeJDxTroKy64GGlZHTOlUM+tQ+Ia0ntApBX5WlonmBxORn99bxebunikGPjZg3
 6OoeExtsSJVt6DIe89SRxC6t/Rq8ZEOtdp1vYe8SliPpEzVY+3iV8vd37aVaXnVNyhzj
 EdSXhSbXCQp9VwBnGXg9p69Ho6LarrzRzF+kmmuK7d8uGQN6yuocbboyqKLkjhlxOQt+
 CaU9AfxnjhybXfuzkbjgmiyCDOKyWb15BkbclCY7OEGm+a7E/uyZbR79Q/WDh30dvEB9
 6hkq5/B2g5H5Hw0MPWwvuyNx2kSpn/R0xXfXhJXyYoXPsCjQat1swEBXfxP+U5oO8onA
 GonA==
X-Gm-Message-State: AOAM531lozUu3r+eyoblsZ68vo/dJcFH4oGAT9r5KNelcJRtpFoQNujj
 CBahqwpfmry5bmWVgQNq46w8ypZSN2SgnMbTd2I9zkR7b1r3P9kMiqFcqfWp+fVmfooupp7Ef0h
 Pb7UMOEsWiQNweGs=
X-Received: by 2002:a7b:ce17:: with SMTP id m23mr7705241wmc.178.1612449643229; 
 Thu, 04 Feb 2021 06:40:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgJZKKc56zwooeUCrai16JPd85jLbXAi9ny0zUYWdj8DAsLrWEn5kvt40pBS9xbEKLpfVy8A==
X-Received: by 2002:a7b:ce17:: with SMTP id m23mr7705215wmc.178.1612449643051; 
 Thu, 04 Feb 2021 06:40:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s6sm5897096wmh.2.2021.02.04.06.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 06:40:41 -0800 (PST)
Subject: Re: [RFC] Move tools sources to the tools directory (was Re: [PATCH
 v2] MAINTAINERS: Fix the location of tools manuals)
To: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210204135425.1380280-1-wainersm@redhat.com>
 <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
 <0e0f9745-fe21-0bc6-2d02-431d67a6b57e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <affe4e6c-8f3e-1ec2-5a6f-6da31a2ced98@redhat.com>
Date: Thu, 4 Feb 2021 15:40:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <0e0f9745-fe21-0bc6-2d02-431d67a6b57e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/21 15:22, Wainer dos Santos Moschetta wrote:
>>> -F: docs/interop/virtfs-proxy-helper.rst
>>> +F: docs/tools/virtfs-proxy-helper.rst
>> 
>> Unrelated, but Paolo once said helpers are not tools.

I think helpers is not a good word.  However, if an executable:

- can be started directly by QEMU, or is not useful without an emulator

- is usually too complex for a user to run manually

then it should be documented in docs/interop (not docs/tools).  Their 
sources however can be in tools/, that's not a problem at all.

Paolo

> Unrelated too, but allow me to ask:
> 
> Should we move the tools (qemu-img, qemu-io, qemu-nbd...etc) to the 
> tools directory (virtiofsd seems to feel alone there)?


