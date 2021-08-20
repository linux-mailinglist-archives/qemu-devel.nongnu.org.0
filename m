Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99013F27FD
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 09:58:15 +0200 (CEST)
Received: from localhost ([::1]:54530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGzPq-00048R-Es
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 03:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGzOi-0003BX-1f
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 03:57:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGzOd-0000Xh-Jm
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 03:57:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629446217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OA61FffLAXegeTI26VRDQxTXsBf6useYmmy5+DYpUm8=;
 b=IcZn72Ir0BZq62lsIdAqJWzCwSK5KM0Ekju/qfad7cFII0A0uhNl+UGG4qhOL6Vkfd8UAB
 6iSyl1kUBxeFc7ZvUqzyCMgiemX5OKOpxXUQILYHd64Rr0dkHk6Oz46UHqt9Qgmts5ZxT+
 kOq8+PsAttFC7PlH5zNUfxZU2+2DAQg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-lYTErbPcM8Gaq2ivfPsqCg-1; Fri, 20 Aug 2021 03:56:56 -0400
X-MC-Unique: lYTErbPcM8Gaq2ivfPsqCg-1
Received: by mail-wr1-f70.google.com with SMTP id
 z2-20020adff1c20000b0290154f60e3d2aso2570525wro.23
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 00:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=OA61FffLAXegeTI26VRDQxTXsBf6useYmmy5+DYpUm8=;
 b=T1kl2fxrIFj2tvhKChfDRWK2wdEtkjQMxuXUSeLpFd5owJaStdKjbn8dtHRT2U1YiQ
 +OUndqYOoAenlnQaIOLfAgZdctMbsALx6sIChkShkbf0Tao7OM2la6Nxz4Tt2l7M8ut9
 xYMlYs7Ig5f391/OXw6tCB43bAOBUV1dZAtd1eGJjXJTZjSpu9KpTvRWZBCPRCW8aYwb
 APRuvtfK4yql8KV+Fq+YewlKMcrCQrWp3Gs+MSW6LAAHbGUa85VgxS88n7gBUVC44Krm
 Y2WsZ9MdBj6GaVbwyJQdbuREe8w9Phdtc78+LFqZ7cCbdCC9SIXw2P7ZhCwUgQEnxtzF
 mfpw==
X-Gm-Message-State: AOAM531ogfpL81gQNCUbo80ONwu4pjMnr0SuUz/Rmcw9NBkXfvZXbi1j
 4/5Bi6JDO9gq4bHXzA6c46iwn5LeKyducuTnBPAuva63TxTDVpW8xNTHyKV9o8mJUtYOFuqhTyv
 QUTEC4GNJgSA/Bdc=
X-Received: by 2002:a05:600c:1d11:: with SMTP id
 l17mr2481894wms.58.1629446215305; 
 Fri, 20 Aug 2021 00:56:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzprV+jrLA+4uPS+ZyqJ7gv+ptJT251D4sNMgjs68jKEdIyvF0qGglclvSBRZW2dHXFU79a9A==
X-Received: by 2002:a05:600c:1d11:: with SMTP id
 l17mr2481883wms.58.1629446215111; 
 Fri, 20 Aug 2021 00:56:55 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 e14sm320714wrr.6.2021.08.20.00.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 00:56:54 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Add a blog post about FUSE block exports
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210819102501.69638-1-hreitz@redhat.com>
 <YR6FauCbECxehubc@stefanha-x1.localdomain>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <46a68d5c-cfc1-e521-8c6b-90eb74c85ede@redhat.com>
Date: Fri, 20 Aug 2021 09:56:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR6FauCbECxehubc@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.08.21 18:23, Stefan Hajnoczi wrote:
> On Thu, Aug 19, 2021 at 12:25:01PM +0200, Hanna Reitz wrote:
>> This post explains when FUSE block exports are useful, how they work,
>> and that it is fun to export an image file on its own path so it looks
>> like your image file (in whatever format it was) is a raw image now.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>> You can also find this patch here:
>> https://gitlab.com/hreitz/qemu-web fuse-blkexport-v1
>>
>> My first patch to qemu-web, so I hope I am not doing anything overly
>> stupid here (adding SVGs with extremely long lines comes to mind)...
>> ---
>>   _posts/2021-08-18-fuse-blkexport.md       | 488 ++++++++++++++++++++++
>>   screenshots/2021-08-18-block-graph-a.svg  |   2 +
>>   screenshots/2021-08-18-block-graph-b.svg  |   2 +
>>   screenshots/2021-08-18-block-graph-c.svg  |   2 +
>>   screenshots/2021-08-18-block-graph-d.svg  |   2 +
>>   screenshots/2021-08-18-block-graph-e.svg  |   2 +
>>   screenshots/2021-08-18-root-directory.svg |   2 +
>>   screenshots/2021-08-18-root-file.svg      |   2 +
>>   8 files changed, 502 insertions(+)
>>   create mode 100644 _posts/2021-08-18-fuse-blkexport.md
>>   create mode 100644 screenshots/2021-08-18-block-graph-a.svg
>>   create mode 100644 screenshots/2021-08-18-block-graph-b.svg
>>   create mode 100644 screenshots/2021-08-18-block-graph-c.svg
>>   create mode 100644 screenshots/2021-08-18-block-graph-d.svg
>>   create mode 100644 screenshots/2021-08-18-block-graph-e.svg
>>   create mode 100644 screenshots/2021-08-18-root-directory.svg
>>   create mode 100644 screenshots/2021-08-18-root-file.svg
> Great! Two ideas:
>
> It would be nice to include a shoutout to libguestfs and mention that
> libguestfs avoids exposing the host kernel's file systems and partion
> code to untrusted disk images. If you don't mount the image then the
> FUSE export has similar security properties.

Oh, right!  Absolutely.

Though now I do wonder why one would actually want to use QEMU’s FUSE 
exports then...

Looks like the performance isn’t as bad as I claimed (for me around 
1.5G/s for reading/writing from/to a raw image on tmpfs), so perhaps 
that’s one point.  Another is probably that FUSE exports are better 
suited when you actually want access to the whole image.  I guess.

> This is a long blog post. One idea is to show a quickstart
> qemu-storage-daemon FUSE export command-line in the beginning before
> explaining all the details. That way people who just want to see what
> this is about can get an idea without learning all the background first.

Sounds good, will do.  Thanks!

Hanna


