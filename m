Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FAC402C36
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 17:56:14 +0200 (CEST)
Received: from localhost ([::1]:55876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNdSG-0008Pi-Ku
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 11:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNdQr-0007iy-CX
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:54:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNdQo-0004dO-CN
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631030081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gClofr+HTz3uTtS/X9SXqBiCvXj7xPXuRvnkDybyuFY=;
 b=V3URhnTZZm5fgtmvgVtrDuwT/6CWAVev1jK7jsrf6PHj3f4UlQpg42i3zhEsH/T7thj9Jk
 Z7SY3tacj5OEpHS0hRuRfXBqn4wVg1xSjI+QJbIf5UtUWvOecFsWYx9uiceLchob2+suG+
 xapAAj32TlXQcSBqCytfbW9FfQOOeuk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-fC24QbYJNZO_atZwV1fEkg-1; Tue, 07 Sep 2021 11:54:38 -0400
X-MC-Unique: fC24QbYJNZO_atZwV1fEkg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m22-20020a7bca56000000b002e7508f3faeso3564571wml.2
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 08:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gClofr+HTz3uTtS/X9SXqBiCvXj7xPXuRvnkDybyuFY=;
 b=XiKy11dHfJpRgc+39h6vewvrH55M2wyG3bUPzjQ32sXrOBbmRfZ42+a9oMtuhLVQuL
 E15hgPPkQYRxVk99bkTOZvv6d0U4M+5d6CfJjCKzLlOGQc3Jmvc5rgwovJZ4pksreFP/
 /VtW4OWOouRh8gFdCnjOvRwnYcFQ+3LLWE7wUnJuucMasWC3kz/djoJH85eHqfWphUqX
 iEVLfxtgWZoqfG6yyF1qcMB6E6TLbEyGaDE0m/FyoyQq6W3XM/4n/ze5ee3X9Bnzlih4
 nBcI5XmxsaLHyyCh9UTrlgH3PnMkoCGhPnznJ8qUbG+61VyKa7IhMdIxQcX7K15hKdYS
 xGEg==
X-Gm-Message-State: AOAM533LIjKfKQLqY/BSjPV8Gdzzgc9RwDbstidw5NDG5E+87oSa6znL
 t0+meXFlIIDaMGA6dKuobHS2/8Wb3LZGZdgGyCHH3gZ4h6vp2ddec+1U/6Jya3Jg4+ZuXgtTd+M
 CkN+/MqnJac1pKRs=
X-Received: by 2002:a5d:6cc9:: with SMTP id c9mr19266833wrc.12.1631030077793; 
 Tue, 07 Sep 2021 08:54:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7k0iYhNsbkYQf6kDVuXJ7VLeczLaa9t3pxE1NdZ5QaLr3py6PHB+T+TL3l72U8m0BNutmwg==
X-Received: by 2002:a5d:6cc9:: with SMTP id c9mr19266809wrc.12.1631030077599; 
 Tue, 07 Sep 2021 08:54:37 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id t14sm11433631wrw.59.2021.09.07.08.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 08:54:37 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Update FUSE block export blog post
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210906162916.21714-1-hreitz@redhat.com>
 <8abf1571-cef6-e3ee-b2ce-1528801b4b17@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <c01c99d6-4c31-cbf1-cc5b-37d79f981cc1@redhat.com>
Date: Tue, 7 Sep 2021 17:54:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8abf1571-cef6-e3ee-b2ce-1528801b4b17@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Klaus Kiwi <kkiwi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.09.21 16:07, Thomas Huth wrote:
> On 06/09/2021 18.29, Hanna Reitz wrote:
>> Because I forgot to CC Thomas on the discussion adding this post, it was
>> merged prematurely.  This patch updates the post to incorporate the
>> feedback I received on it:
>>
>> - Title change: This article mostly deals with presenting a guest image
>>    in one image format as a raw image, so the title should reflect that;
>>    there is much less focus on exporting block devices from a live VM
>>
>> - Mention libguestfs, and contrast against it; make a note that
>>    libguestfs provides security that FUSE exports cannot provide
>>
>> - Have a full example in the intro, to show where we are going with this
>>    post
>>
>> - Some heading depths changed (nesting did not really make sense)
>>
>> - Be more explicit that by "file mounts" I do not mean a filesystem with
>>    a root directory and a single file in it
>>
>> - Explicitly mention that "/" is a directory without a name, to
>>    illustrate the fact that root nodes do not have names
>>
>> - Short intro for "QEMU block exports", explaining its place in this
>>    post
>>
>> - Make all exports writable
>>
>> - Use "exp0" as export ID to get shorter lines that fit better into 80
>>    characters
>>
>> - Reference the intro example in the intro of "Mounting an image on
>>    itself"
>>
>> - Show "qemu-fuse-disk-export.py" in *italic* instead of as `code`
>>    (because I had all other command names in *italic*)
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   _posts/2021-08-22-fuse-blkexport.md | 145 ++++++++++++++++++++++------
>>   1 file changed, 117 insertions(+), 28 deletions(-)
>
> Thanks, changes looked fine to me, so I've pushed it now.

Thanks!

Hanna


