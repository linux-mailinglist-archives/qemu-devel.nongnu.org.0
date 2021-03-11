Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0553C337156
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:29:08 +0100 (CET)
Received: from localhost ([::1]:42300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJV5-0004oN-3i
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKJT9-0003pM-Bn
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:27:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKJT7-0005vS-2s
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615462024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2hov6M5gFt0mIaVRNXVeCjOGUYRFmDpf9UxvgubbZQk=;
 b=F6Q78sURYD5NY+5RT+SYh3OmWyFOI4xvAigbk2beTfpMWWxHLQJkc7uw/pB7NFXT+4fJvF
 JAyExhEJ208daIqXY5WY2pD9ofEdhsVFPmtnksbO/MTYkwY7c4M1xJiwoDGSY1cJiikzXs
 C0V373OMkVJXZpk2MagluXkM429GnvY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-X_E4jAlkPO6Xz7OxJJNjKg-1; Thu, 11 Mar 2021 06:27:03 -0500
X-MC-Unique: X_E4jAlkPO6Xz7OxJJNjKg-1
Received: by mail-wr1-f71.google.com with SMTP id y5so9388257wrp.2
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 03:27:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2hov6M5gFt0mIaVRNXVeCjOGUYRFmDpf9UxvgubbZQk=;
 b=lgA+Z+URcZQAIbqNjrSWmQkOzAUdZ+vjl7Pn+ZMKYNtz4dwk7TQ1fK//AhZM7b5DJo
 kLR5/NjNj3+tpHWhH2lEVZs6YjOZfRsgOalqAddxW4nfFdIjhZP5/WQ3yhOJgzabo9Ae
 tb/7iFPMIri41skkiJ+JIKXTf37fc9N5RDdTNhxo+3zrz5ujCtZLUvca1mjFXDry3ela
 /1/4O62fXx1sILh3IGMQogd10VjZ0uHW+qveK9nS0UT/Tp7zh2nYZ0JS3qnyTSfVqirZ
 r+szNpU8TCQNctLMbqXF8SP9fYZEZDT2yH0yTJSfhrVfS6RpKwdcPIiBUjCVjK/ccW03
 fNQw==
X-Gm-Message-State: AOAM533mZw+suJ18DC2asXQPiuAJtBpvpqUMYV9unQYPEj1ZONgrbacr
 i7q2jB3zav5D7n3BXwxcOMt7oqadLlGfwsDy4cdIwvlbBIvUTUAXptNWRDUnhXmB5DVFGeJsPK+
 LGEBHz2jOlf8H1hI=
X-Received: by 2002:adf:d851:: with SMTP id k17mr8332730wrl.254.1615462021927; 
 Thu, 11 Mar 2021 03:27:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAuUxmGA7wddCqLBgSRsnHpdjnmRfXSE8gbtsGHEq1VWFnd75afdUNZPfzFgE7dG3IpPQwxA==
X-Received: by 2002:adf:d851:: with SMTP id k17mr8332715wrl.254.1615462021720; 
 Thu, 11 Mar 2021 03:27:01 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm3666786wmd.27.2021.03.11.03.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 03:27:01 -0800 (PST)
Subject: Re: [PATCH v2 0/7] vhost: replace master/slave with more accurate
 wording
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210311103250.532191-1-pbonzini@redhat.com>
 <CAMxuvaxwDujPJN=JjADGE+=wDiBWjhFX+omJ_D8bmXJMPxRaZA@mail.gmail.com>
 <4c5c32a6-a646-a6dd-f60d-6e7a831b674b@redhat.com>
 <CAMxuvazvBQryHEwOQqnbFZPo9f8NzK6M4Qq3aUV=sFvsd+sBkw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6f4f5c87-3d75-e746-ca39-037af4a1d7fd@redhat.com>
Date: Thu, 11 Mar 2021 12:27:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAMxuvazvBQryHEwOQqnbFZPo9f8NzK6M4Qq3aUV=sFvsd+sBkw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/03/21 12:18, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Mar 11, 2021 at 3:08 PM Paolo Bonzini <pbonzini@redhat.com 
> <mailto:pbonzini@redhat.com>> wrote:
> 
>     On 11/03/21 11:51, Marc-André Lureau wrote:
>      >
>      >
>      > What about renaming  VhostUserSlaveRequest too ?
>      > (subprojects/libvhost-user/libvhost-user.h & hw/virtio/vhost-user.c)
>      >
> 
>     I missed it in vhost-user.c (I did rename the values but not the enum),
>     while in libvhost-user.h I'm keeping it for backwards compatibility
>     as I
>     don't want to break the API.
> 
> 
> Keeping API stability is great and all, but libvhost-user never received 
> an official release, and isn't installed either.  We should be free to 
> break it atm imho.

That's true, but I'd rather follow (at least informally) the usual 
policy around deprecation.  There's no need to rush things.

Paolo


