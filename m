Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6817691EE0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 13:13:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQSGG-0001zQ-3Q; Fri, 10 Feb 2023 07:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQSFj-0001dD-Pl
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:11:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQSFi-0006u4-0X
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676031099;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=oSvy1CVUqvLeFCKQgKxtW1DjhhdKHWUHS8ZTQ/7b49w=;
 b=ZJtYwFFeUK5yzJsi6FjYrjwrzQcN0OyoHjgkuXBrCjdNoOhFfFuJ2EZuFS4PCycEdNZA4k
 0F/NE3AyxuVKhu//2TDe9awAmGwQ/NVE/rAibSWXQuHI8mRHWxlCxSj2Z6OV0QL4PFVwL1
 0/HgetMauXZMBBdyx1qvEFJ4cIX340U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-34-X4NOLm8hPMayq0SkF1jOzw-1; Fri, 10 Feb 2023 07:11:38 -0500
X-MC-Unique: X4NOLm8hPMayq0SkF1jOzw-1
Received: by mail-wm1-f69.google.com with SMTP id
 h9-20020a05600c350900b003e000facbb1so4476519wmq.9
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 04:11:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oSvy1CVUqvLeFCKQgKxtW1DjhhdKHWUHS8ZTQ/7b49w=;
 b=CbON45Pi8BM+Hf0sdxAD5ENL8Y1taUJDDgRrvKCElSV937mf6lOpl/fQJLbNV8wPks
 AuMnXWYZjZMPTRmbTh9kjt7MvwNUAJZWMDR3TOqIEGc5/l9jm067+3+s9uxkqFRcSieh
 /qdtqacgSJhAkW6Xlw67OkfZhk93m4clKqXmT3MUBThgF+4rCcdHYLS1NS9xjRyeAJBO
 tbIQIeHxydsDnkrvPXmOJ5Lu9RlghsQOEYnM1mqjnk9A0kaV6KDwCvctvn/e0FvWnwEd
 pm5Z1hfDnSQzzvz0WA80hnArwJ727yqgiBlNHj60b+1E4WMQR1MymOz86ako3aAxWO2E
 s06Q==
X-Gm-Message-State: AO0yUKWyHAbxwwsm/wiGeBWcJDKmTcBBWya6j9EDcLITlOZ8ms0TrfJ5
 b8WPQ2boVnB1zhVd0wk5POmWQQBqVwhYUfslYrFcPNY+pWDcjguAvyXZJiXxos6RZh4OTANqIZw
 pKaxUUcG70UkJjeY=
X-Received: by 2002:a05:600c:a295:b0:3dd:1bcc:eb17 with SMTP id
 hu21-20020a05600ca29500b003dd1bcceb17mr12788834wmb.28.1676031096970; 
 Fri, 10 Feb 2023 04:11:36 -0800 (PST)
X-Google-Smtp-Source: AK7set87RnUq0aik/Njw/9YRbChmVgXis0TpEQo0FiPR0W/WG6oqf1ha5zTSqpaGL+Yfr+D66+PQhw==
X-Received: by 2002:a05:600c:a295:b0:3dd:1bcc:eb17 with SMTP id
 hu21-20020a05600ca29500b003dd1bcceb17mr12788817wmb.28.1676031096639; 
 Fri, 10 Feb 2023 04:11:36 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a7bce8b000000b003dd9232f036sm7780024wmj.23.2023.02.10.04.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 04:11:36 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org,  Peter Xu <peterx@redhat.com>,
 qemu-stable@nongnu.org
Subject: Re: [PULL 01/30] migration: Fix migration crash when target psize
 larger than host
In-Reply-To: <0dd85902-0071-a915-2655-8aff8d0074d1@msgid.tls.msk.ru> (Michael
 Tokarev's message of "Fri, 10 Feb 2023 12:32:47 +0300")
References: <20230207005650.1810-1-quintela@redhat.com>
 <20230207005650.1810-2-quintela@redhat.com>
 <0dd85902-0071-a915-2655-8aff8d0074d1@msgid.tls.msk.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 10 Feb 2023 13:11:34 +0100
Message-ID: <87ilg9iutl.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Michael Tokarev <mjt@tls.msk.ru> wrote:
> 07.02.2023 03:56, Juan Quintela wrote:
>> From: Peter Xu <peterx@redhat.com>
>> Commit d9e474ea56 overlooked the case where the target psize is even
>> larger
>> than the host psize.  One example is Alpha has 8K page size and migration
>> will start to crash the source QEMU when running Alpha migration on x86.
>> Fix it by detecting that case and set host start/end just to cover
>> the
>> single page to be migrated.
>
> FWIW, commit in question, which is d9e474ea56, has been applied after the
> last released version to date, which is 7.2.0.  So I guess this change is
> not applicable to -stable.

I think it should.

This is a bug that can happen when your host page is smaller than the
guest size.

And has been that way for a long time.
Once told that, people don't migrate alpha guests a lot, but it can also
happens with funny combinations of large pages.

Peter Xu knows more about this.

Later, Juan.


