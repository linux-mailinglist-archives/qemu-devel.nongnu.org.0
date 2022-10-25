Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB9660C9A4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 12:12:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onGqp-0004NT-Vf; Tue, 25 Oct 2022 06:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1onGqn-0004Kk-P7
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:08:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1onGql-0004yB-EQ
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666692477;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZX7IIdkbjzb59G1MqLsOVjHPrefydUVp8+Wwv/8rcXk=;
 b=RvygOF+oaOuRTTADu4M7OhBE5kCwqzWyCR7bUrzoSbTgnYEL+vpfJ3fX8LfeyTOfF/F+Q+
 f3yCv3bHdFZNqAkMQ4OQP9Ebs96UEZecmzDwMAdkKDvI+iHl+zE5udmLl/tpfuWvXysVCk
 C/OxVfJxbulsJOepfrB6CqQ8CHG8jPE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-271-2NzoFMG1PGCyyZxuTkaBgw-1; Tue, 25 Oct 2022 06:07:56 -0400
X-MC-Unique: 2NzoFMG1PGCyyZxuTkaBgw-1
Received: by mail-wr1-f72.google.com with SMTP id
 h26-20020adfaa9a000000b002364ad63bbcso4449531wrc.10
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 03:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZX7IIdkbjzb59G1MqLsOVjHPrefydUVp8+Wwv/8rcXk=;
 b=l3L9J2E4gEGBraMrbFUevBxZp6r33QBlqFXTWsR1YLdm219ErzGUJK99UfgSf1HaBD
 blJZ7eBeyM/euT4H2I0rHmXNF5mIsI6vxbIO3Dsrl0g3Y8mYnrHL3g++yOIj89YfCnlO
 8uHqiUoHpxQOjAdohquHP/MSByyYMob4AC280hODTXzwQdQ70LOSOpfdnLi8wp6+j33a
 q0C67EPoN/s4lVRiGabHq+qWGlA20p2Gl5zcZFmPn1s5AOJ1KoiIK7wYj65jYZi7U2P1
 KCw5z2P5Bakxmf343bB+9dyhF/5GTyu1p3SlxtlJUb3maptrEswXWlz7D68dqp+MLqkd
 yWzA==
X-Gm-Message-State: ACrzQf2NaOyOGyfGJGNNBkMsuwtimOvt/ivfqSWFEmBWsvhZ701WpN6k
 h03L2GOfxoXmSo1q3YD4BSwfhGoBtQjmRlVLsk1oOJs0ZcvuAcFECz9h1J+Mg/+DCf0L3dRBkHM
 +s7nEy6znjQ7LMe0=
X-Received: by 2002:a05:600c:88a:b0:3c6:cc34:abf with SMTP id
 l10-20020a05600c088a00b003c6cc340abfmr44244409wmp.147.1666692474866; 
 Tue, 25 Oct 2022 03:07:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4mzFi0diBbXDIKFJiyJGvn706frGLpKwnzZHCSRqR6pb3YPhCdxm5M40f592nlZ1xWc0swkg==
X-Received: by 2002:a05:600c:88a:b0:3c6:cc34:abf with SMTP id
 l10-20020a05600c088a00b003c6cc340abfmr44244380wmp.147.1666692474587; 
 Tue, 25 Oct 2022 03:07:54 -0700 (PDT)
Received: from localhost (static-28-206-230-77.ipcom.comunitel.net.
 [77.230.206.28]) by smtp.gmail.com with ESMTPSA id
 b2-20020a05600003c200b0022cdb687bf9sm2858110wrg.0.2022.10.25.03.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 03:07:54 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 4/4] migration/multifd/zero-copy: Flush only the LRU
 half of the header array
In-Reply-To: <Y1ef6/8gxsCiNjiO@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 25 Oct 2022 09:35:55 +0100")
References: <20221025044730.319941-1-leobras@redhat.com>
 <20221025044730.319941-5-leobras@redhat.com>
 <Y1ef6/8gxsCiNjiO@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Tue, 25 Oct 2022 12:07:53 +0200
Message-ID: <875yg8dxmu.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> On Tue, Oct 25, 2022 at 01:47:31AM -0300, Leonardo Bras wrote:
>> Zero-copy multifd migration sends both the header and the memory pages i=
n a
>> single syscall. Since it's necessary to flush before reusing the header,=
 a
>> header array was implemented, so each write call uses a different
>> array, and flushing only take place after all headers have been used,
>> meaning 1 flush for each N writes.
>>=20
>> This method has a bottleneck, though: After the last write, a flush will
>> have to wait for all writes to finish, which will be a lot, meaning the
>> recvmsg() syscall called in qio_channel_socket_flush() will be called a
>> lot. On top of that, it will create a time period when the I/O queue is
>> empty and nothing is getting send: between the flush and the next write.
>>=20
>> To avoid that, use qio_channel_flush()'s new max_pending parameter to wa=
it
>> until at most half of the array is still in use. (i.e. the LRU half of t=
he
>> array can be reused)
>>=20
>> Flushing for the LRU half of the array is much faster, since it does not
>> have to wait for the most recent writes to finish, making up for having
>> to flush twice per array.
>>=20
>> As a main benefit, this approach keeps the I/O queue from being empty wh=
ile
>> there are still data to be sent, making it easier to keep the I/O maximum
>> throughput while consuming less cpu time.
>
> Doesn't this defeat the reason for adding the flush in the first
> place, which was to ensure that a migration iteration was fully
> sent before starting the next iteration over RAM ? If it is OK to
> only partially flush on each iteration, then why do we need to
> flush at all ?

Now we need to do the flush in two places:
- on sync_main (the old place)
- on the migration thread, when we run out of array entries.
  This one has nothing to do with correctness, it is just that we have
  more space than needed.

So, in this regard, I think that the patches are correct.

But on the other hand, I am not sure that I like the size of the array.
Leonardo is using 1024 entries for each migration channel.  That means
that it allows it to have 1024 entries * 512 KB each packet is 512MB of
unflushed data in each channel.  I think that this is still too much.

I will need some data from testing, but my understanding on how Zero
Copy work is that having around 10MB in each channel would be more than
enough to saturate the link.  And once that the data inflight is
smaller, we can just flush it when we get out of channels.

My idea here was to work the size the other way around, add a parameter
to the user about how much memory is he available for mlocking, and
just do a memory/channels array entries on each channel.  That will:

a - limit the amount of mlocked memory that we need
    10MB/channel for 10 channels is 100MB of mlocked memory, for a guest
    that has lots of Gigabytes of RAM looks reasonable.

b - We don't synchronize after each write, because I still claim than
    doing a non asynchronous write on the channel just syncs everything
    (otherwise I can't see how the hardware can even work).

So I guess that the best thing to decide this is:
- get a couple of nice 100Gigabit networking cards
- Enable 16 channels or so, so we know that the CPU is not going to be
  the bottleneck
- test with this patch
- remove last two patches and test with several array sizes
  (10, 20, 30,..) and we will see that after some size, performance will
  not improve at all.
- Got that value as default one.

What do you think?

Later, Juan.

PD.  Yes, I don't like to add another parameter, so you can recompile
     with different values, or we will not add the parameter once that
     we find a right value.


