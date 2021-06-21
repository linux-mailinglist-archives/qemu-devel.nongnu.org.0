Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA813AF1CA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:20:47 +0200 (CEST)
Received: from localhost ([::1]:35098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNbK-0001gJ-7M
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lvNZ2-00082T-Uv
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 13:18:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lvNYz-0003GY-8V
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 13:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624295900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AS7GRM/j/ZFauJ+gPTNrPYYAYPJYTR4tclIbivXTk8c=;
 b=ALburwNA7CsZgQP4g/32Y5kKY+/kx/px1go1rfRcoDWb+wiZoe8Yayb/uskQLPFWpLRoQ9
 o3oijhkehkq/xrgX/fAXEK+a/101RR+hpd9auiwDeoJEmmQVtdWQqpAP6q64OJBXLeflnZ
 KxqsjC8ojALxc3vtIjdU9llcSCFFzcU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-mLNcYgUGMLWFUJSivkUxHg-1; Mon, 21 Jun 2021 13:18:19 -0400
X-MC-Unique: mLNcYgUGMLWFUJSivkUxHg-1
Received: by mail-ed1-f72.google.com with SMTP id
 cb4-20020a0564020b64b02903947455afa5so6309698edb.9
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 10:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=AS7GRM/j/ZFauJ+gPTNrPYYAYPJYTR4tclIbivXTk8c=;
 b=FEjGcZyzNOTf+g4kYJpNjf0Za/TLOayu5eVcRTNfGWH/t14B8YYFII9KC1katHUrsE
 ZlB4NX0zCogWncbTQQv/gjX3vdHB4rLIgfQRiUmcPzX3EkYRo0IOiDqgMZIGthEJ9oin
 ftQByXHWKH5paKw3tgG+Jl7zNu+Lua7t1Nb9TNAnj250qn/c4TP4N1gRnwTAQAWPwsnv
 US3dyL/S7MeuwbTMZkmX7A3pqc41hqatPo8W/oAXhrYGrykQBqk9yWXTCqtIwu8z5reg
 72efTB02i86fACmYoHV4pwv/e7oOIWQoa1thn//RaPTMv957KVIOou0m6JFw1qJDxall
 sMdQ==
X-Gm-Message-State: AOAM533ThRyFXOQzVLx9FY07/BE+VUWr86veI/w5m1qIxH2If/nKb+a9
 UuZcCgvYAevsg4JDXfQBBWoCb3Z9vphD9VxMwb3jN2nXtxDJOwKREfCLRaNgBMTtTYx3lZ4Z3UA
 ZT0T0j25GpDEJWA6MDV1tDqNFcPPuap0FSrVyl8Un85pnHgTaK//961Fna5QTc0S3
X-Received: by 2002:a17:907:9c9:: with SMTP id
 bx9mr24190290ejc.144.1624295897991; 
 Mon, 21 Jun 2021 10:18:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/sUuD6XPLG3Pl6wRJdJzMuOibTbDtqa7qI3X+oV8L6H6tma0CRBIN+EQ5j+sGN2zqtN39aw==
X-Received: by 2002:a17:907:9c9:: with SMTP id
 bx9mr24190261ejc.144.1624295897756; 
 Mon, 21 Jun 2021 10:18:17 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 x9sm5212586ejc.37.2021.06.21.10.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 10:18:17 -0700 (PDT)
Subject: Re: [PATCH 0/4] export/fuse: Allow other users access to the export
To: Kevin Wolf <kwolf@redhat.com>
References: <20210614144407.134243-1-mreitz@redhat.com>
 <YNC6Xvcc9lKc50Sk@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <9af03389-8c6d-6610-9326-61c65e8eac30@redhat.com>
Date: Mon, 21 Jun 2021 19:18:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YNC6Xvcc9lKc50Sk@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.06.21 18:12, Kevin Wolf wrote:
> Am 14.06.2021 um 16:44 hat Max Reitz geschrieben:
>> Hi,
>>
>> With the default mount options, FUSE mounts are not accessible to any
>> users but the one who did the mount, not even to root.  To allow such
>> accesses, allow_other must be passed.
>>
>> This is probably useful to some people (it certainly is to me, e.g. when
>> exporting some image as my normal user, and then trying to loop mount it
>> as root), so this series adds a QAPI allow-other bool that will make the
>> FUSE export code pass allow_other,default_permissions to FUSE.
>>
>> (default_permissions will make the kernel do the usual UNIX permission
>> checks, which is something that makes a lot of sense when allowing other
>> users access to the export.)
>>
>> This also requires our SETATTR code to be able to handle permission
>> changes, though, so the user can then run chmod/chown/chgrp on the
>> export to adjust its permissions to their need.
>>
>> The final patch adds a test.
> If there is even a use case for leaving the option off (not trusting
> root?), it must certainly be the less common case? So I'm not sure if
> allow-other should be an option at all, but if it is, enabling it by
> default would make more sense to me.
>
> Is there a reason why you picked false as the default, except that it is
> the old behaviour?

No. :)

Well, mostly.  I also thought, if FUSE thinks allow_other shouldn’t be 
the default, who am I to decide otherwise.

Now that I tried to find out why FUSE has it as the default (I only 
remember vague “security reasons”), I still couldn’t find out why, but I 
did find that using this option as non-root user requires /etc/fuse.conf 
to have user_allow_other in it, which I don’t think we can require.

So I think it must be an option.  As for which value should be the 
default, that probably depends on how common having user_allow_other in 
/etc/fuse.conf is.  I know I never put it there, and it’s both on my 
Fedora and my Arch system.  So I guess it seems rather common?

Max


