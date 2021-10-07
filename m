Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4DF4251A3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 13:03:57 +0200 (CEST)
Received: from localhost ([::1]:44236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYRBs-0002U9-Gp
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 07:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYR99-0001W5-Fb
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:01:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYR95-0005T4-7t
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633604462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nd2T32WL1YohvSCrZGKnPVXjh4zNlMpmjN69+SRZGpY=;
 b=C4cOMkv6ZmSuLy4MirPUkjDdozUbpccafmH6k5ZfGPrJf7InPsxCgDI0UF/TMUNUwyZ6EH
 AxviHfD6d7/fycKfQibI8rSKKZYNj2/E/PFWXkWWAkNr5II0BNzVQxzbSYLhk9SwNGcWO4
 lU4lpwj872+wu6BFv7juixcgLbUzkR8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-vyh4aiFGO2OURW0WsDDKfw-1; Thu, 07 Oct 2021 07:01:01 -0400
X-MC-Unique: vyh4aiFGO2OURW0WsDDKfw-1
Received: by mail-ed1-f70.google.com with SMTP id
 eg14-20020a056402288e00b003db54cde124so794027edb.17
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 04:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nd2T32WL1YohvSCrZGKnPVXjh4zNlMpmjN69+SRZGpY=;
 b=jD+mh643CDaaxBdjGE1hduuo4taXmpMEWCR75uUv1KnHg4s5RYtZnkmrGkxwumFbn2
 6fZt1W8hXxf0ccLo6maj8yVQf80plJHqmlPjrRDP5/7NE+91RPTIhXY92IlUghUfOp3S
 etYlVhZLsB376rX+B1HUF4Bfwgy0po9xxWXX7AChScBH+LqfG+YyVtxY7usGPVhKNpgw
 r1ds4G8ocsTTOK4Je4zjlz5cs/QxAdAoQxaSnFrLeeDR0q6z1Fl6ITKwh/2TuywYaSCv
 +ECKF+v0/x+ICT/02v87JZrFlCm4uJRXy+venwD/3Gp9I+FPTlVxyRtZs8cUvrfuWaml
 tQWw==
X-Gm-Message-State: AOAM530u/yRAbA/6nMIwUW/HBYmTgRqBnSb9Dv+QnYjL4imBXv/262eL
 obSH6ztlhdpMxM7iH/im1nW+tizaZ2Qu7039wCMus2rd34vSW8htyxVFBPilO+rPO1wIe8Udm1H
 PNBaqcrAhguX/rMQ=
X-Received: by 2002:aa7:c741:: with SMTP id c1mr5310312eds.194.1633604460429; 
 Thu, 07 Oct 2021 04:01:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8GnCPJpxXxnTSfqMKV6a56slRV5fvt83TtZL42V+KQP6dBX4/VZUDJw4KId//0GsJmar4fg==
X-Received: by 2002:aa7:c741:: with SMTP id c1mr5310283eds.194.1633604460246; 
 Thu, 07 Oct 2021 04:01:00 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm11342418eds.10.2021.10.07.04.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 04:00:59 -0700 (PDT)
Message-ID: <848ce438-df0e-f25a-0eca-432825c726f6@redhat.com>
Date: Thu, 7 Oct 2021 13:00:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] build-sys: move Spice configure handling to meson
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20211007102453.978041-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211007102453.978041-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/10/21 12:24, marcandre.lureau@redhat.com wrote:
> +spice_protocol = dependency('spice-protocol', version: '>=0.12.3',
> +                            required: get_option('spice_protocol'))
> +spice = dependency('spice-server', version: '>=0.12.5',
> +                   required: get_option('spice'))

This needs to be:

spice_protocol = not_found
if not get_option('spice_protocol').auto() or have_system
   spice_protocol = ...
endif
spice = not_found
if not get_option('spice_protocol').auto() or have_system
   spice = ...
endif

in order to avoid useless warnings on --disable-user --static builds.

> +if spice.found()
> +  config_host += { 'CONFIG_SPICE': 'y' } # for audio/meson.build
> +endif

I have a pending series that removes the need for this, so I'll fold it 
in my queue.

(I didn't know about partial_dependency - nice one!)

Paolo


