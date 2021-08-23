Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747E73F46A5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 10:32:54 +0200 (CEST)
Received: from localhost ([::1]:40546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI5O1-0004Dd-Ik
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 04:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mI5Lx-0003Vs-Qt
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:30:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mI5Lt-0000JH-OL
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629707440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qETgZdFgVcdfdygOlusTwauaC54uCAMXA1SJjURAeAM=;
 b=K+8zdi29wy/qIJpTQz97kJSXVuvLdI7d8lkOcKKl9bYrEYj+VoYnYWci9keytA2raMZeC0
 rk2V2fsL2DvobaIM9P4FK54Y1JsHKq4LraMbwZvJelpQHDCf80DanbiRLnydjfrc+ci53P
 /E56l4X6TN73w8hSmjy79sCMoBq04h4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-Vk-gxPgnMZadrE5l9whYxA-1; Mon, 23 Aug 2021 04:30:35 -0400
X-MC-Unique: Vk-gxPgnMZadrE5l9whYxA-1
Received: by mail-wm1-f72.google.com with SMTP id
 g3-20020a1c2003000000b002e751c4f439so366783wmg.7
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 01:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=qETgZdFgVcdfdygOlusTwauaC54uCAMXA1SJjURAeAM=;
 b=KBEQYncuoee+7RlgTWrjSMVN8MfPK0ETZRsjxzOgMO2857TaAJz8LwDMNvBIGSNIYF
 1ipfUjl9AR28VVSXrGQLJPCJYQ4bTycZ+HXW7skhduInCc7rdnTR6+NuQXID6DVodYoP
 mRurj/fo8qD7eHp7t3jN7t9gsMnokSCwgyklPSAI9m6RFM4On/eVKbEDRM0/MfKxyAPa
 Dl6/x35YSv26/uOlzdIajxtcNLdulmPXIlGN01yyxta+zeg3+QhKhALXxu5ckpXFWzRU
 O41qG8/zby70ObrEPhJZIIdEtWJBN4ZsDEnIqSIeIQ011yx/WhL6q/ZjME2USjQUKWTk
 WE4A==
X-Gm-Message-State: AOAM530619ATECHJ/KwfTDS7Wr+LEnLJC2/Ix033u5kZZ3jE/8xeBbMO
 lXzQm7IAgPkd5tAB7MLlyjd3lDs/PXju3UJbKpRMN7XS0dZtILdXH/GEX0RHZ0SiDKZ2BTWgTZb
 9U9vEWL/ThArqcdk=
X-Received: by 2002:a7b:c8cd:: with SMTP id f13mr15250572wml.6.1629707434138; 
 Mon, 23 Aug 2021 01:30:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVI06sm+ipWx1Nn7jXBR/9A9jdVi66ovtjvkBNwYT7sAzrNtQCTH6r4ii8kjigH1+58dHi7g==
X-Received: by 2002:a7b:c8cd:: with SMTP id f13mr15250554wml.6.1629707433959; 
 Mon, 23 Aug 2021 01:30:33 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 s15sm5867116wmh.48.2021.08.23.01.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 01:30:33 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Add a blog post about FUSE block exports
To: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20210819102501.69638-1-hreitz@redhat.com>
 <YR6FauCbECxehubc@stefanha-x1.localdomain>
 <46a68d5c-cfc1-e521-8c6b-90eb74c85ede@redhat.com>
 <541f1df5-47b4-bff7-f326-a087512c95ba@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <dd8a6ccf-6e40-a94b-fbf9-d301259b965a@redhat.com>
Date: Mon, 23 Aug 2021 10:30:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <541f1df5-47b4-bff7-f326-a087512c95ba@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.959, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.08.21 15:18, Thomas Huth wrote:
> On 20/08/2021 09.56, Hanna Reitz wrote:
>> On 19.08.21 18:23, Stefan Hajnoczi wrote:
>>> On Thu, Aug 19, 2021 at 12:25:01PM +0200, Hanna Reitz wrote:
>>>> This post explains when FUSE block exports are useful, how they work,
>>>> and that it is fun to export an image file on its own path so it looks
>>>> like your image file (in whatever format it was) is a raw image now.
> [...]
>>> This is a long blog post. One idea is to show a quickstart
>>> qemu-storage-daemon FUSE export command-line in the beginning before
>>> explaining all the details. That way people who just want to see what
>>> this is about can get an idea without learning all the background 
>>> first.
>>
>> Sounds good, will do.  Thanks!
>
> Oops, sorry, I just already pushed your patch to the repository since 
> I did not notice this conversation in time. Next time, please make 
> sure to put myself (and Paolo) on CC: when sending updates for 
> qemu-web, otherwise I might not notice the updates :-/

Oh, sorry... :/

Is it acceptable to send an update still?

(And would you accept a patch to CONTRIBUTING.md to make it say to CC 
you and Paolo?)

Hanna


