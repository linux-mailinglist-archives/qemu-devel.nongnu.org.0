Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2CC6FDA79
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:12:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwfrv-0004jC-In; Wed, 10 May 2023 05:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwfrs-0004cw-6s
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:12:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwfrq-0000xk-2k
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683709927;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bYUbjt5Qklpp5LibevpPyxX52zURSDHH/3t/2pPuqtU=;
 b=MDR060GAwsqGFKgDVaNuZnULk5QMncXP4fWNcEYzNS2enUGpM+Zb9D04uzk6YNdZp80pwY
 ju6zqMltNQrD8BlZG5FeznoBwMs3XKUmZJmOIdA0ZlNnqwX0vzn8lX+6iWifoz0jVPdrRy
 XURdtwkeN7uIO7TnsdlkIKNWsj0Rc3w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-SfCSyjgZMFaJC4271M4qlQ-1; Wed, 10 May 2023 05:12:06 -0400
X-MC-Unique: SfCSyjgZMFaJC4271M4qlQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3076fc5c278so4044388f8f.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 02:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683709925; x=1686301925;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bYUbjt5Qklpp5LibevpPyxX52zURSDHH/3t/2pPuqtU=;
 b=P8SQQhQ3GbPGgFzzw/j+cDUT3ETjp4XxIqBZ/3ScODv6ef5vBYS/Njd+LQAmWLYEZg
 NCIcHcAzuwd0LwwXe17HmbUNteFWtqWlRM3E9b0coKkn9hORl1kai21IDx+zEQVpm9rP
 omaLyOiKzn1MBjGFLzFyOQNmIxN2h0cRShsXU82VVVDMfY3glkmOMljJhVj8l/jO7q1c
 uVTEx0ICocAb22ZFvtMiBpamg6rxF90dMCL5R1JpDIFi6B7edaoKNFZmkGbJGIfim9CE
 c9D+oZjmCWyDPN90hJY4Xf43xN+4hjd0Fnc+QVlt16gODNUC+1ZDkBxTe+tDPgsTxjmn
 wO2w==
X-Gm-Message-State: AC+VfDx0JorZi6Ko+RnHb6C5cM5HonXFaKXVBwZyremN1lzSoYaO9JDY
 ElT+sjvyNzSTfYATV8NWYGCAZlN3J+uJ9NVt7iOm+nQA8dJDxcX6Bm7Psj6i/7sYd6ziyHvcI+Y
 bo0VyrMccrqCHxeI=
X-Received: by 2002:a5d:44c7:0:b0:2f9:dfab:1b8c with SMTP id
 z7-20020a5d44c7000000b002f9dfab1b8cmr12440549wrr.50.1683709925181; 
 Wed, 10 May 2023 02:12:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ66XBbbdzgB45UV75KaoIMpqNVVUNyWtKMsPDrtdQ88BJP2d/KVFLOL6m2dn/srqpg/tAlfXw==
X-Received: by 2002:a5d:44c7:0:b0:2f9:dfab:1b8c with SMTP id
 z7-20020a5d44c7000000b002f9dfab1b8cmr12440517wrr.50.1683709924833; 
 Wed, 10 May 2023 02:12:04 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 x10-20020adfffca000000b002e61e002943sm16665010wrs.116.2023.05.10.02.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 02:12:04 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: Peter Xu <peterx@redhat.com>,  qemu-devel@nongnu.org,  Alex Williamson
 <alex.williamson@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,  Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Yishai Hadas <yishaih@nvidia.com>,  Jason
 Gunthorpe <jgg@nvidia.com>,  Maor Gottlieb <maorg@nvidia.com>,  Kirti
 Wankhede <kwankhede@nvidia.com>,  Tarun Gupta <targupta@nvidia.com>,  Joao
 Martins <joao.m.martins@oracle.com>, Daniel Berrange <berrange@redhat.com>
Subject: Re: [PATCH 0/8] migration: Add precopy initial data capability and
 VFIO precopy support
In-Reply-To: <72e14c81-a953-c288-c570-4987492b3569@nvidia.com> (Avihai Horon's
 message of "Wed, 3 May 2023 18:22:59 +0300")
References: <20230501140141.11743-1-avihaih@nvidia.com> <ZFGTerErJWnWHD6/@x1n>
 <72e14c81-a953-c288-c570-4987492b3569@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 11:12:03 +0200
Message-ID: <87v8h08s9o.fsf@secure.mitica>
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Avihai Horon <avihaih@nvidia.com> wrote:
> On 03/05/2023 1:49, Peter Xu wrote:
>> External email: Use caution opening links or attachments

>> Only until READY msg received on src could src switchover the precopy to
>> dst.
>>
>> Then it only needs 1 more field in SaveVMHandlers rather than 3, and only 1
>> more msg (dst->src).
>>
>> This is based on the fact that right now we always set caps on both qemus
>> so I suppose it already means either both have or don't have the feature
>> (even if one has, not setting the cap means disabled on both).
>>
>> Would it work for this case and cleaner?
>
> Hi Peter, thanks for the response!
> Your approach is indeed much simpler, however I have a few concerns
> regarding compatibility.
>
> You are saying that caps are always set both in src and dest.
> But what happens if we set the cap only on one side?
> Should we care about these scenarios?

Not really.
We are supposed that something like libvirt has set things up and such
things are ok.  We don't try to detect that kind of things in the
migration stream (I am not telling we should'nt, but that we don't).

If you configure qemu with an disk on source that is on source but not
on destination, migration will work fine until the device copy stage,
when that disk is missing.  I think this is something like that.  A
missconfiguration.

> For example, if we set the cap only in src, then src will wait
> indefinitely for dest to notify that switchover is ready.
> Would you expect migration to fail instead of just keep running
> indefinitely?
> In current approach we only need to enable the cap in the source, so
> such scenario can't happen.

I see.  I have to think if this is a better approach.  But will like to
know what libvirt thinks about this.

Daniel?


> Let's look at some other scenario.
> Src QEMU supports explicit-switchover for device X but *not* for
> device Y (i.e., src QEMU is some older version of QEMU that supports
> explicit-switchover for device X but not for Y).
> Dest QEMU supports explicit-switchover for device X and device Y.
> The capability is set in both src and dest.
> In the destination we will have switchover_pending=2 because both X
> and Y support explicit-switchover.
> We do migration, but switchover_pending will never reach 0 because
> only X supports it in the source, so the migration will run
> indefinitely.
> The per-device handshake solves this by making device Y not use
> explicit-switchover in this case.

You have a point here.
But I will approach this case in a different way:

Destination QEMU needs to be older, because it don't have the feature.
So we need to NOT being able to do the switchover for older machine
types.
And have something like this is qemu/hw/machine.c

GlobalProperty hw_compat_7_2[] = {
    { "our_device", "explicit-switchover", "off" },
};

Or whatever we want to call the device and the property, and not use it
for older machine types to allow migration for that.

Once told that, this is the "ideal" world.  In general we don't force
this because we are not good at detecting this kind of failures.

Later, Juan.


