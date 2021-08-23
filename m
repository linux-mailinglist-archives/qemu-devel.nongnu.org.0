Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9453F468C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 10:24:54 +0200 (CEST)
Received: from localhost ([::1]:38114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI5GH-0002H7-Kr
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 04:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mI5FU-0001bm-HE
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:24:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mI5FP-0002zF-LL
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629707037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/bAjozNxUPimVWPs13Q33prCgBRzkdxHOYRS2I6W1A=;
 b=WcYUOMpFACirVsAxaW8yLNCjMvxN203xzCcxXZpaqmBNwdPJ4dLXW9zV9RlvC/qFYWN8Qk
 uag3VUacgFCcG3qq8LJrU15pcQ71fraf/V8s31ZDiodHZUKpJfwd1GjroI7ZoQjkxpIS76
 a+F7Ih+y2u2XBSkrWYexZN8ht12DS+w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-1DDACuYnPQiCDuTOaltIOw-1; Mon, 23 Aug 2021 04:23:56 -0400
X-MC-Unique: 1DDACuYnPQiCDuTOaltIOw-1
Received: by mail-wm1-f69.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so4184614wmj.6
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 01:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=k/bAjozNxUPimVWPs13Q33prCgBRzkdxHOYRS2I6W1A=;
 b=iyR96vhiqBNE42toifOvvHKaD7//ZvQQ+o0tEDV5YopHX9JwzAV+dZRc2GEpUQJzVa
 Eoq7qQPkUGPkHy18Vvkb7FeGGWw8Y6wikQhogVUb0s4/VD27XSNV4rcm5zj/U6Azdibc
 79mIIJpv5prVASQwLqVxUjNGRpX54hVHHNLBbvP6lxg6UwV28t5KtbLnzhPnFMrxjvs8
 uzt4qcv4u1FqLX3JEk2Hqst1H8lTCyBoeHjh4e/pNijjKMTRjQaY/bEEDfWNBJ7+UBgu
 0qzToyZmE0uYPlrEKCC7u2KIdy8aclqigQq2hlv8IPnwW+xmN0La5orfbeIBcMB5Sx9w
 UMtg==
X-Gm-Message-State: AOAM531W7MF8/KYuqZcBIT/BRaRTMqmiVSfTJgVGOdV4+cbmr6QGojsw
 gvbSpypm54mflJ740fudD0GYmYSohEXc2BP3Ic+V7CPtaW0vsRI+iyfnOlzIc1CP6DyNdvIuEpN
 JF5EfeVdcNAXvfFE=
X-Received: by 2002:a05:600c:3798:: with SMTP id
 o24mr14811736wmr.18.1629707035032; 
 Mon, 23 Aug 2021 01:23:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvFZUxECVwOIz8PFBIdyEX+TtktxZW6uw4q5PAKZa01NuqYG6EEUCGsfpFgkH2Nr4HSOSuNA==
X-Received: by 2002:a05:600c:3798:: with SMTP id
 o24mr14811722wmr.18.1629707034802; 
 Mon, 23 Aug 2021 01:23:54 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 q3sm11995221wmf.37.2021.08.23.01.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 01:23:54 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Add a blog post about FUSE block exports
To: Eric Blake <eblake@redhat.com>
References: <20210819102501.69638-1-hreitz@redhat.com>
 <20210820212422.z6hfoghubmd7pzzl@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <9ec9b11d-c405-52a0-a35e-9ca76c7f3558@redhat.com>
Date: Mon, 23 Aug 2021 10:23:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820212422.z6hfoghubmd7pzzl@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.08.21 23:24, Eric Blake wrote:
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
> ...
>> +
>> +Besides attaching guest devices to block nodes, you can also export them for
>> +users outside of qemu, for example via NBD.  Say you have a QMP channel open for
>> +the QEMU instance above, then you could do this:
>> +```json
>> +{
>> +    "execute": "nbd-server-start",
>> +    "arguments": {
>> +        "addr": {
>> +            "type": "inet",
>> +            "data": {
>> +                "host": "localhost",
>> +                "port": "10809"
>> +            }
>> +        }
>> +    }
>> +}
> Rather than using a TCP port, is it worth mentioning that you can use
> a Unix socket?  If the point of this is local access to the disk
> contents, that feels a bit lighter weight.

Well, the point of this is local access through FUSE; the NBD part here 
just serves to introduce the concept of block exports, so it shouldn’t 
really matter whether we use TCP or Unix sockets here.  I like TCP 
sockets a bit more in this case, because I feel like for people who 
don’t know much about NBD, that may seem more natural.

>> +{
>> +    "execute": "block-export-add",
>> +    "arguments": {
>> +        "type": "nbd",
>> +        "id": "fmt-node-export",
>> +        "node-name": "fmt-node",
>> +        "name": "guest-disk"
>> +    }
> This defaults to a readonly image; you may want to include
> "writable":true in the JSON, especially if the purpose is to show how
> to modify guest-visible contents of an at-rest disk image.

Oh, yes, good idea.  I should do this in every export command line.

> Overall a nice post!  I hope my comments help in addition to all the
> other good reviews you got.

Thanks!  I think I’ll keep TCP for exporting, but I will add writable=on 
to every export example.

Hanna


