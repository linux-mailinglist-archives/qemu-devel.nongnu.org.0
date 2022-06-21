Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4F855353A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:08:59 +0200 (CEST)
Received: from localhost ([::1]:59854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fUu-0002j9-B4
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o3fQr-00082d-4h
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:04:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o3fQb-00022a-77
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:04:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655823867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hgZC4fj15uLb+dh8gKc7LdpwSybpFGn+VQh7gJblEj8=;
 b=VFN8LGEOYVhm197+sobyhwoKLepqZrmR8m22tIJBGsoRdoxYRfX5pf4LF+tqiDOcau6X5k
 w1db763uH+LkirM/BWshchOI7LClWtKotkFi+toctpB8KEV2BA5VT4TUDY4yeEGrkr0ZhY
 EfW8szat/160+UhYNH64mmZvz/JSp3w=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-mplEwb4WMp2z4nheBk97ng-1; Tue, 21 Jun 2022 11:04:19 -0400
X-MC-Unique: mplEwb4WMp2z4nheBk97ng-1
Received: by mail-io1-f72.google.com with SMTP id
 s189-20020a6b2cc6000000b00669add3c306so7709718ios.21
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 08:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hgZC4fj15uLb+dh8gKc7LdpwSybpFGn+VQh7gJblEj8=;
 b=riJBp0mdN1vCfCf4rWuXmFdDQJQRtbDuZtydw+3b7tvJWvbVQfj3u5cVtIVQ8/1aL9
 QzzLnjWbwUHO+0IYgj1Rdvh+X6zQcA4pkA4JEjbgJ1Eb+/qcjLt6RURWn8cgb/ROAF40
 ZBDdcaIAA61hwT4xBICF2v3xu1jyScfJ9OIsWiVqZ4kWjpcCWHlTShcLqKRC4stZTe+j
 jTixPuHzDSnW/AJARMiNS3S38v+SHQkRoTtGPIYYwWWUwXdQjayFwBpdgXhR0qbU6/7M
 OZrRUO/lzzjUDca1/C/46tJnLk3lu3WoCOa0Uc3AgLpBW9n7bKI2HF96K+Wlzu+rP33I
 xzPw==
X-Gm-Message-State: AJIora/tYdTaigB8jLpu/JF8AJeGnzqS/QsVMwX4NLn6+CyxVJkGDBEo
 1FIKwhOuU78xRovqGHV+v1EtnAdv0Sr+gJHd0M6R97nIfReofWJq4d6NHcwLtAkQF2Z9uYfV6Bj
 V9E6av8oNi3mXIgM=
X-Received: by 2002:a02:a701:0:b0:331:76e0:4ef4 with SMTP id
 k1-20020a02a701000000b0033176e04ef4mr16990468jam.1.1655823857700; 
 Tue, 21 Jun 2022 08:04:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vj14icxrommuEjlyMB2XLSK4LEheWjnqmq3DzD+Q9G9pkBw/czdVAVNlfVCCUhanlyvBTtlQ==
X-Received: by 2002:a02:a701:0:b0:331:76e0:4ef4 with SMTP id
 k1-20020a02a701000000b0033176e04ef4mr16990445jam.1.1655823857464; 
 Tue, 21 Jun 2022 08:04:17 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a922605000000b002d1c94b7143sm7525357ile.39.2022.06.21.08.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 08:04:16 -0700 (PDT)
Date: Tue, 21 Jun 2022 11:04:14 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo =?utf-8?B?QnLDoXM=?= <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 3/4] migration: zero-copy flush only at the end of
 bitmap scanning
Message-ID: <YrHd7pxev/3hlfaT@xz-m1.local>
References: <20220620053944.257547-1-leobras@redhat.com>
 <20220620053944.257547-4-leobras@redhat.com>
 <87wndb4riu.fsf@secure.mitica> <YrCV089JKhc067sm@xz-m1.local>
 <7fbc118dedbaf7d01dd72220255affc98abffc9d.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7fbc118dedbaf7d01dd72220255affc98abffc9d.camel@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 21, 2022 at 12:35:54AM -0300, Leonardo Brás wrote:
> > This reminded me - Leo, have you considered adding the patch altogether to
> > detect the "fallback to non-zero-copy" condition?  Because when with it and
> > when the fallback happens at some point (e.g. when the guest memory is
> > larger than some value) we'll know.
> 
> I still did not consider that, but sure, how do you see that working?
> 
> We can't just disable zero-copy-send because the user actually opted in, so we
> could instead add a one time error message for when it falls back to copying, as
> it should happen in the first try of zero-copy send.
> 
> Or we could fail the migration, stating the interface does not support
> MSG_ZEROCOPY, since it should happen in the first sendmsg().
> 
> I would personally opt for the last option.
> 
> What do you think?

I don't have a very strong feeling on it, but yes that sounds proper to me.
If one day we'll like zero-copy send be on by default then we'll consider
the other way round, but maybe not necessary for now.  Thanks.

-- 
Peter Xu


