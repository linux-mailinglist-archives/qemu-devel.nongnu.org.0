Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A341673565
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:22:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIRwd-0007k7-4F; Thu, 19 Jan 2023 05:14:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pIRwV-0007Zf-Jp
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:14:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pIRwR-0006u9-Qp
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:14:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674123281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qRI1dg6cwb4F3X6XrMWrfvTlO80OfZYv3saK7/0nceY=;
 b=O97gOlvB2TwTn8X+sLGBYilvEn5Nzw+JruNr32YDNC/vCmCt7oSF7dnRpKvWtZJKAIt9dp
 gOJbMJr5tgDhqo//3LftOEiPjl0s5p6Xj/2sPiRXqApP3RSSEdo5xGXy1xy0UxORafmgT4
 5ZtRf8dtP9K2GN2nsXGyJ3uqZFH9dhc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-XnokqqvoN7-lkQsZRB-kbA-1; Thu, 19 Jan 2023 05:14:38 -0500
X-MC-Unique: XnokqqvoN7-lkQsZRB-kbA-1
Received: by mail-ej1-f69.google.com with SMTP id
 sb39-20020a1709076da700b0086b1cfb06f0so1272793ejc.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qRI1dg6cwb4F3X6XrMWrfvTlO80OfZYv3saK7/0nceY=;
 b=4iPCnM3kIwlA0GawFoYD40EbIbZEzMW279dAhCAa+BO9Ccu049Jxv0cwwE3/HOI3MP
 CuQj+RpSI2DUVVQb0sVryCvr5i8bAErqNDqjXyCq3FsQ1EVhKoaFOG78AfYAnxiSbX/W
 mPByl19cKXDpM9hufvr4l5xn/7tDk+3PhbmfyLWLCA14vOSD8S7ilz3FQxKG1N75GaG5
 MIoJz765J1y7tf7Bo/2OAIk4EqbTWfMyzsoeAGAIsok3tHv6P+W2HIkQsHQZFzY/zEMf
 QGHg7jqfrOXQ1IMA8vYobyUUQPnSxv7ip4jUiT8awHQB4odvQCfQlm6inpM0JIbb5BXT
 AiIw==
X-Gm-Message-State: AFqh2kr1DJ3Jei3qNkADt6lHrKSfcpj7yuwNhJNow9iY0hQpLMXzLQAZ
 8aX5ClVxW7oLv3mG51+dOtuQIMc4Gkt9xyJurrd/Lr78e2D/ie8C03K3f8g0hO4l14WKGgydrVL
 wfHvOCX2xETz66As=
X-Received: by 2002:a17:907:36d:b0:7c1:5098:907f with SMTP id
 rs13-20020a170907036d00b007c15098907fmr10626133ejb.61.1674123277298; 
 Thu, 19 Jan 2023 02:14:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv7YJ/H4Rdleh5qAClyNg1SBuVJB8huaCr+iAIkMjVssrFON3tSy7ENXwkRvROkSgLhSq/kbA==
X-Received: by 2002:a17:907:36d:b0:7c1:5098:907f with SMTP id
 rs13-20020a170907036d00b007c15098907fmr10626103ejb.61.1674123276921; 
 Thu, 19 Jan 2023 02:14:36 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 i20-20020a1709064ed400b00872a726783dsm3736574ejv.217.2023.01.19.02.14.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:14:36 -0800 (PST)
Message-ID: <9474ce49-979d-f630-5f6a-754999db573a@redhat.com>
Date: Thu, 19 Jan 2023 11:14:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] Remove C virtiofsd
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 gmaglione@redhat.com, virtio-fs@redhat.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
References: <20230118153833.102731-1-dgilbert@redhat.com>
 <CAJSP0QU+o-R6ZKN8R1MHoUqFwfsQmpKt6KP5hqhyFrK5HJti6w@mail.gmail.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CAJSP0QU+o-R6ZKN8R1MHoUqFwfsQmpKt6KP5hqhyFrK5HJti6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18.01.23 16:59, Stefan Hajnoczi wrote:
> On Wed, 18 Jan 2023 at 10:40, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
>> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>
>> We deprecated the C virtiofsd in commit 34deee7b6a1418f3d62a
>> in v7.0 in favour of the Rust implementation at
>>
>>    https://gitlab.com/virtio-fs/virtiofsd
>>
>> since then, the Rust version has had more development and
>> has held up well.  It's time to say goodbye to the C version
>> that got us going.
>>
>> The only thing I've not cleaned up here is
>>    tests/avocado/virtiofs_submounts.py
>>
>> which I guess needs to figure out where the virtiofsd implementation
>> is and use it; suggestions welcome.
> I see something similar in tests/avocado/avocado_qemu/__init__.py:
>
>          # If qemu-img has been built, use it, otherwise the system wide one
>          # will be used.  If none is available, the test will cancel.
>          qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
>          if not os.path.exists(qemu_img):
>              qemu_img = find_command('qemu-img', False)
>          if qemu_img is False:
>              self.cancel('Could not find "qemu-img", which is required to '
>                          'create the bootable image')
>
> Maybe find_command('virtiofsd', False)?

It was supposed to be a test for virtiofsd, so it doesn’t really make 
sense to run it with the system-wide daemon, I think.

Maybe there’s some way we can move the test to the Rust repo?  I’ll take 
a look.

Hanna


