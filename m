Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA72A51B6F7
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 06:22:20 +0200 (CEST)
Received: from localhost ([::1]:34852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmT0O-0004hO-20
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 00:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nmSyV-0003OE-Ae
 for qemu-devel@nongnu.org; Thu, 05 May 2022 00:20:23 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:51844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nmSyR-0006Pq-Ui
 for qemu-devel@nongnu.org; Thu, 05 May 2022 00:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651724418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=anDEt7XGtNlij/oQodH/tg59MqHDc02E8imu/Ps8UdY=;
 b=ebYgvHGtRJXb71MDWjksOScVx7+U0VMGyT/sR7AOdlcSvMtdP2a12LAsjGRH8WcMpoSNmV
 Q2bxrAEUzvwkv6OZS4ATZzNB1CuygPH6kvmiEXSjLt0hBKy2+bxdlMfgW01F2GORnBaR59
 oY5tQ7GzcKU5VpaB5Lshjbm0XGOfmPA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-DwRvL5YvN16GIM8vEZgZPw-1; Thu, 05 May 2022 00:20:17 -0400
X-MC-Unique: DwRvL5YvN16GIM8vEZgZPw-1
Received: by mail-ed1-f72.google.com with SMTP id
 dk9-20020a0564021d8900b00425a9c3d40cso1702163edb.7
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 21:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=anDEt7XGtNlij/oQodH/tg59MqHDc02E8imu/Ps8UdY=;
 b=FvFF6lEVRrLdM8E+8HZghdEf/Oco6Xs8GSKhdbr7QVuaIUOJybGZSGh2zYi7cf9Z06
 5tA7eMQlCvsjodVkkOseNf1ei+qGRkogHgoeOGJz8mSNlWQ8+wgwez8ScQzML1JwgFEZ
 UYwxnxr9OmhSilrMoMDemNZURAIbcMCXs+/I5hDwvhmFaKlkXIn+XBQSKPyia3lbpchH
 diB2TBtDzacd25f1ShhblUBtbTJHkpdFcjMSNwMNzAxHPPFDAGw2aRBJU62x4FaP+WyQ
 7jep1biXqLEblbMUOUVrEHigb8o4nhi/ul+peZ3EEiXU3k7I998mNfV+gUozUBwMdizd
 wFMg==
X-Gm-Message-State: AOAM530S5ePMxseqvmyzHIBn2eB/HCRY0L0Dsmyyz9qQ5K0Biozm5JQo
 Tl6RLTDBxDGkurbJLlzgI/XrQ3Ck03UvpbhA6drqZSMbjLwWw4zgtuEgR7Rcon9OuGvYToNVEra
 7NE+1uqkQ6z/y0qpAP47UmiCpfGbv7Xw=
X-Received: by 2002:a05:6402:254a:b0:427:c112:6df9 with SMTP id
 l10-20020a056402254a00b00427c1126df9mr19836223edb.367.1651724415818; 
 Wed, 04 May 2022 21:20:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx21yjK8wDcbXmZbrieoo83KVEAGbN3O0duMXVLJHHxt/KoSRLZC5MmEaweVYCBlnFpEMIr9l4jafsulRTOP3M=
X-Received: by 2002:a05:6402:254a:b0:427:c112:6df9 with SMTP id
 l10-20020a056402254a00b00427c1126df9mr19836196edb.367.1651724415527; Wed, 04
 May 2022 21:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220504191835.791580-1-leobras@redhat.com>
 <20220504191835.791580-3-leobras@redhat.com>
 <YnLZovDd8YCj/QxF@xz-m1.local>
In-Reply-To: <YnLZovDd8YCj/QxF@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 5 May 2022 01:20:04 -0300
Message-ID: <CAJ6HWG7A1sCgyH8+cPgxdGY_+eAuVe+sbr_1q+VYkKH-He97EQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/7] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.74; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, May 4, 2022 at 4:53 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, May 04, 2022 at 04:18:31PM -0300, Leonardo Bras wrote:
> > +/*
> > + * Zero-copy defines bellow are included to avoid breaking builds on systems
> > + * that don't support MSG_ZEROCOPY, while keeping the functions more readable
> > + * (without a lot of ifdefs).
> > + */
> > +#ifndef MSG_ZEROCOPY
> > +#define MSG_ZEROCOPY 0x4000000
> > +#endif
> > +#ifndef SO_ZEROCOPY
> > +#define SO_ZEROCOPY 60
> > +#endif
>
> So this will define these two values on e.g. FreeBSD, while they do not
> make sense at all there because these numbers are pure magics and
> meaningless outside Linux..

Correct.
But since only in Linux it's possible to set the
QIO_CHANNEL_WRITE_FLAG_ZERO_COPY flag, sflags will always be zero and
it would never try using MSG_ZEROCOPY outside Linux.

> I don't think it's anything dangerous, but IMHO it's another way of being
> not clean comparing of using some "#ifdef"s.  Comparing to this approach
> the "use #ifdef" approach is actually slightly more cleaner to me. :)
>

This requires:
- Creating a define such as 'QEMU_MSG_ZEROCOPY', that needs to include
<sys/socket.h> to get some flags:
#define QEMU_MSG_ZEROCOPY defined(CONFIG_LINUX) &&
defined(MSG_ZEROCOPY) && defined(SO_ZEROCOPY)
- Making it available for all code in this patchset that does "ifdef
CONFIG_LINUX'
(migration/migration.c/h, qapi/migration.json, monitor/hmp-cmds.c,
io/channel-socket.c)
- Replace current usage of CONFIG_LINUX in this patchset for QEMU_MSG_ZEROCOPY
- Change qio_channel_socket_writev() so the current 2 usages of
MSG_ZEROCOPY are surrounded by ifdef QEMU_MSG_ZEROCOPY.

Pros of above approach (1):
- Smaller binary: The whole MSG_ZEROCOPY code is compiled out if the
building system does not support it.
- Since it's compiled out, there is a couple lines of less code
running if the building system does not support it
- It's not even possible to set this option in MigrationSetParams,
which will return an error.

Pros of current approach (2):
- Define is local to file (I am not sure if it's ok to create a
'global' define for above approach, including <sys/socket.h> bits)
- A build system that does not support MSG_ZEROCOPY can produce a
binary that can use MSG_ZEROCOPY if the target system supports it.
- There are no #ifdefs on qio_channel_socket_writev()

(2) is already implemented in v11, but I have no issue implementing
(1) for v12 if it's ok to create this 'global' define.

> Let's wait for some other inputs.

Agree.
Having the pros of each approach clear, I would like some input on
what is better for the project.

Best regards,
Leo


