Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1530568F2A3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 16:59:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPmq6-0007Yn-BE; Wed, 08 Feb 2023 10:58:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPmq4-0007YV-BB
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:58:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPmq1-0004rL-Sr
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:58:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675871904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+SumB18J8SPTOpxD/V0lcHXlMjFz2+h/YniBTG+hasY=;
 b=cMidb54LTcdWEgEAnlF/xoxqdld0epdcHR3ckY7rtWqOxfosN9zBxQUl5viBvfG0dHyqUB
 4KVJ40l3/LWTzvMwFUfi+oj/YKblEtOn/PIpDywiCSFN5II1g0vY9XPInC+/mbe+waPuN1
 dll529wERyCAZkEgHYw1dHBhlOMzJ3Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-4E6F5VrdNtC2RMfEZijHCQ-1; Wed, 08 Feb 2023 10:58:23 -0500
X-MC-Unique: 4E6F5VrdNtC2RMfEZijHCQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 o42-20020a05600c512a00b003dc5341afbaso1260832wms.7
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 07:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+SumB18J8SPTOpxD/V0lcHXlMjFz2+h/YniBTG+hasY=;
 b=oOW+t0OvVwrawKE6UQbcR0vjV+3ckmKf4bQLsu3EomtKIfnFrbLcHmx+4G3oKBi7Ms
 QT/fyBfqm9fPygEGsx1/t8OmB9GJEFCG1NCpJamJFVOQwIE4zxJhB2eyhvSIMMJ68e2f
 XEq8m5JIXwIHD5W6YNgN3hCvqUx7cjOVpvm+CawVe5+FFvmAtagYdI+yhObOhU595ryL
 JeDExGkzxgeIdP+SXyNrt/HFRcQmVs92wDTZo6m9C6j5YOga5ZtyFcyp3n4uarXpTR/o
 evxRDmk+tsnfTytHhXzNaTjMP+eTtivgenk1ra4U7vMvQcdWxutanVnxF6vSn0pL8HWv
 qRzA==
X-Gm-Message-State: AO0yUKXwJuKt7I488WD5fKHsLpBWBniPPbVvPD8G+JJfZd5V03K65yhE
 gv/f4EN55h97xiwAOgdgzPREUDf+4DXM8l1Tri41OlBCxaCWoCdO8bzwBoPsi1x3o808DWJm0hu
 tUnyqQW0k0Y+PJs0=
X-Received: by 2002:adf:fe8b:0:b0:2c4:6b1:cf69 with SMTP id
 l11-20020adffe8b000000b002c406b1cf69mr442160wrr.13.1675871901941; 
 Wed, 08 Feb 2023 07:58:21 -0800 (PST)
X-Google-Smtp-Source: AK7set9YCj2augAQhwDR25E2oENYFD44f2/t9Y70fsVdhll4Ixq8+1GvkYOnAHgWBpsZWkZEWNsxtQ==
X-Received: by 2002:adf:fe8b:0:b0:2c4:6b1:cf69 with SMTP id
 l11-20020adffe8b000000b002c406b1cf69mr442141wrr.13.1675871901748; 
 Wed, 08 Feb 2023 07:58:21 -0800 (PST)
Received: from ?IPV6:2003:cf:d71d:64b4:b0d4:7b71:b8bd:d2cc?
 (p200300cfd71d64b4b0d47b71b8bdd2cc.dip0.t-ipconnect.de.
 [2003:cf:d71d:64b4:b0d4:7b71:b8bd:d2cc])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a5d4601000000b002bdfe3aca17sm13844164wrq.51.2023.02.08.07.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 07:58:21 -0800 (PST)
Message-ID: <d33b0bff-f07d-56a9-8648-16310b60f8a5@redhat.com>
Date: Wed, 8 Feb 2023 16:58:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: vhost-user (virtio-fs) migration: back end state
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dave Gilbert <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
References: <fb523956-7a8c-608b-6db1-961686b73e9c@redhat.com>
 <CAJSP0QWnq6av7j6x_n-C2mLSPMYBhMeEthr6ayPN-cmsEB3UnA@mail.gmail.com>
 <f26dd5ed-fa02-faeb-fadb-0dbfbe7792d3@redhat.com>
 <CAJSP0QWA5j8J_nsUWwh5a18XsoJxjtRutLQzXT6JT1LwLbxCCA@mail.gmail.com>
 <CAJSP0QWh-4cYfKK3ea4qwcaGrmXpS0npxvhzr0JG7rNUjfrB=A@mail.gmail.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CAJSP0QWh-4cYfKK3ea4qwcaGrmXpS0npxvhzr0JG7rNUjfrB=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 08.02.23 15:32, Stefan Hajnoczi wrote:
> On Tue, 7 Feb 2023 at 07:29, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> On Tue, 7 Feb 2023 at 04:08, Hanna Czenczek <hreitz@redhat.com> wrote:
>>> On 06.02.23 17:27, Stefan Hajnoczi wrote:
>>>> On Mon, 6 Feb 2023 at 07:36, Hanna Czenczek <hreitz@redhat.com> wrote:
>>>> Should we schedule a call with Jason, Michael, Juan, David, etc to
>>>> discuss further? That way there's less chance of spending weeks
>>>> working on something only to be asked to change the approach later.
>>> Sure, sounds good!  I’ve taken a look into what state we’ll need to
>>> migrate already, but I’ll take a more detailed look now so that it’s
>>> clear what our requirements are.
> Hi Hanna,
> The next step is getting agreement on how the vhost-user device state
> interface will work. Do you want to draft the new vhost-user protocol
> messages and put together slides for discussion with Michael, Jason,
> Juan, and David in the next KVM call? That might be the best way to
> get agreement. Doing it via email is possible too but I guess it will
> take longer.
>
> If you don't want to design the vhost-user protocol changes yourself
> then someone on this email thread can help with that.

I’ll need to talk about the whole thing to Stefano and German first 
(we’re collaborating on virtio-fs migration, looking at different 
aspects of it).  Also, I think I’ll want to look into the code a bit 
first and fiddle around to get a working prototype so I get an idea of 
what might be feasible at all.  I wouldn’t want to propose something 
that actually can’t work when I try to make it work in practice. O:)

Hanna


