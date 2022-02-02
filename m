Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25114A74F4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 16:52:21 +0100 (CET)
Received: from localhost ([::1]:57210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFHvg-0000iO-AD
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 10:52:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFGWZ-0004PO-5q
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:22:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFGWO-0000et-La
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643811720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FseRkDL02Sv7aO0UklHxVTdAWo+MDFN2K+/wJMze+TY=;
 b=T21elZjs1bcR2iCyFxbfh0HZAhEPOGP6J+n9qLAooqghXzoIre2f6xSF4/glZaVaOnRJ1R
 Haf/ss4JPqDfvp2AuAkDo8Fix499A8yDOdD5Esf0ux1VBVW6U8XORpvSAXBJoAXGnlcqXF
 9sQQ0HBG/fuhhKXIhotMKQGHdlVZeUs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380--mG3q2SsNhKprMYvJum9fQ-1; Wed, 02 Feb 2022 09:21:43 -0500
X-MC-Unique: -mG3q2SsNhKprMYvJum9fQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 ed6-20020a056402294600b004090fd8a936so10502280edb.23
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 06:21:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FseRkDL02Sv7aO0UklHxVTdAWo+MDFN2K+/wJMze+TY=;
 b=FiToZrEqTCf68U79sXOGLZy18F2yWe+Dz3DOWkLUkSWQ8+K9jevImkD7WkBFtg8Ugc
 9+keZmDVvfFa75Qpjq0baKJO/fnYHUQTFL9ny82nUOcwm33G89FgAmK7j6gALMbweEeX
 jjIPIeNcc8W3GxSCtin0NJhaUxYFnzlIjolRHYyOtp8i8K1AySp0hR2TXMNf9euw6813
 OuX2kxz8SSz9h2/3VcynlwLzjKLIMQEJlnZ8p0j2PQuk5NQDUlKh1R6I3zCG6DZMzp5X
 y+ytJRDkmQpCXR0/qfOTnijxowIWFpdGCEB6XuwadebM42V/fphTKuUhT+a2gyb4l7RH
 KPmA==
X-Gm-Message-State: AOAM5302cBg2KPup+yYYGQQEUr6c+NbC9q/i8UKyFck5VvLQEmG0aQwb
 5qRsIJS2FMICA8SANrMtaTiCduSXOzmuejk0AlET+JawDbcZ2AJSsGr2xefsxFjaf7aDPX4hYpb
 hfthQxPdBmylbGMU=
X-Received: by 2002:aa7:d949:: with SMTP id l9mr30778901eds.153.1643811702152; 
 Wed, 02 Feb 2022 06:21:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyC64lLdvxNe4//JWwEIsiLFpDKuV2pJs3eEhNKM1zcpbhqwqMLnXxGMemZNEjjqMFBhXhvOg==
X-Received: by 2002:aa7:d949:: with SMTP id l9mr30778876eds.153.1643811701908; 
 Wed, 02 Feb 2022 06:21:41 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id v23sm13075535ejf.21.2022.02.02.06.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 06:21:41 -0800 (PST)
Message-ID: <f041ee3b-e910-9fa1-a5ff-45ed38b6967f@redhat.com>
Date: Wed, 2 Feb 2022 15:21:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 18/20] block/nbd: drop connection_co
To: Eric Blake <eblake@redhat.com>, Fabian Ebner <f.ebner@proxmox.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
 <20210927215545.3930309-19-eblake@redhat.com>
 <8e8b69e4-a178-aff1-4de3-e697b942f3b3@proxmox.com>
 <20220202135353.dau24mip4zwib47z@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220202135353.dau24mip4zwib47z@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.02.22 14:53, Eric Blake wrote:
> On Wed, Feb 02, 2022 at 12:49:36PM +0100, Fabian Ebner wrote:
>> Am 27.09.21 um 23:55 schrieb Eric Blake:
>>> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>
>>> OK, that's a big rewrite of the logic.
>>>
>>> Pre-patch we have an always running coroutine - connection_co. It does
>>> reply receiving and reconnecting. And it leads to a lot of difficult
>>> and unobvious code around drained sections and context switch. We also
>>> abuse bs->in_flight counter which is increased for connection_co and
>>> temporary decreased in points where we want to allow drained section to
>>> begin. One of these place is in another file: in nbd_read_eof() in
>>> nbd/client.c.
>>>
>>> We also cancel reconnect and requests waiting for reconnect on drained
>>> begin which is not correct. And this patch fixes that.
>>>
>>> Let's finally drop this always running coroutine and go another way:
>>> do both reconnect and receiving in request coroutines.
>>>
>> Hi,
>>
>> while updating our stack to 6.2, one of our live-migration tests stopped
>> working (backtrace is below) and bisecting led me to this patch.
>>
>> The VM has a single qcow2 disk (converting to raw doesn't make a
>> difference) and the issue only appears when using iothread (for both
>> virtio-scsi-pci and virtio-block-pci).
>>
>> Reverting 1af7737871fb3b66036f5e520acb0a98fc2605f7 (which lives on top)
>> and 4ddb5d2fde6f22b2cf65f314107e890a7ca14fcf (the commit corresponding
>> to this patch) in v6.2.0 makes the migration work again.
>>
>> Backtrace:
>>
>> Thread 1 (Thread 0x7f9d93458fc0 (LWP 56711) "kvm"):
>> #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
>> #1  0x00007f9d9d6bc537 in __GI_abort () at abort.c:79
>> #2  0x00007f9d9d6bc40f in __assert_fail_base (fmt=0x7f9d9d825128
>> "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x5579153763f8
>> "qemu_get_current_aio_context() == qemu_coroutine_get_aio_context(co)",
>> file=0x5579153764f9 "../io/channel.c", line=483, function=<optimized
>> out>) at assert.c:92
> Given that this assertion is about which aio context is set, I wonder
> if the conversation at
> https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg00096.html is
> relevant; if so, Vladimir may already be working on the patch.

It should be exactly that patch:

https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg06222.html

(From the discussion it appears that for v1 I need to ensure the 
reconnection timer is deleted immediately once reconnecting succeeds, 
and then that should be good to move out of the RFC state.)

Basically, I expect qemu to crash every time that you try to use an NBD 
block device in an I/O thread (unless you don’t do any I/O), for example 
this is the simplest reproducer I know of:

$ qemu-nbd --fork -k /tmp/nbd.sock -f raw null-co://

$ qemu-system-x86_64 \
     -object iothread,id=iothr0 \
     -device virtio-scsi,id=vscsi,iothread=iothr0 \
     -blockdev '{
         "driver": "nbd",
         "node-name": "nbd",
         "server": {
             "type": "unix",
             "path": "/tmp/nbd.sock"
         } }' \
     -device scsi-hd,bus=vscsi.0,drive=nbd
qemu-system-x86_64: ../qemu-6.2.0/io/channel.c:483: 
qio_channel_restart_read: Assertion `qemu_get_current_aio_context() == 
qemu_coroutine_get_aio_context(co)' failed.
qemu-nbd: Disconnect client, due to: Unable to read from socket: 
Connection reset by peer
[1]    108747 abort (core dumped)  qemu-system-x86_64 -object 
iothread,id=iothr0 -device  -blockdev  -device


