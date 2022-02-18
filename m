Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D194BBD93
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 17:33:22 +0100 (CET)
Received: from localhost ([::1]:46486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL6C8-0001aY-Rc
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 11:33:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nL6Ao-0000tJ-3O
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 11:31:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nL6Aj-0005N0-1r
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 11:31:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645201910;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lg3iL/P0pt0uYiau8ls3TCa12gsEX4qoLBd5oiW9qLg=;
 b=h9Q7MTJNKpRGhp5OG4FVuD3r9fk4C6qrwqzeG0G710gDmC7jUt/KF/0G4FqG/xdR5pJ8lM
 C0MNzqWcrCXLQu+NtoLFqT91HEXi+vgr/h7D5GCMkqOArIkpjcaAzz/8i2WZ50eMkxvTWm
 6O0SjYLm9Kh+VBXntOEveLklFE5NI+w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-FPWwQs28M9iljAt6voCg1Q-1; Fri, 18 Feb 2022 11:31:49 -0500
X-MC-Unique: FPWwQs28M9iljAt6voCg1Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 q8-20020adfb188000000b001e33a8cdbf4so3754375wra.16
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 08:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lg3iL/P0pt0uYiau8ls3TCa12gsEX4qoLBd5oiW9qLg=;
 b=opmWloPPhdwHWGPTb+hpoPMJBhDyzSPhXudn9Y0K3QqXH21F6TjG4SLIlQKQ1ZkLaZ
 i+j4L2/Zt80cLRQGSv93dJ7BFN6y8li/hIuTTtQous4/ZrmNdcvg502fTrUef47ibuHd
 BkFcuvrdEdyv3RoxVPrqcZ6jo5QQ9JwTB0/pPtOkFuP8Dpf7vn/mEqeboy096UzDmlNh
 eByO64qhoVaiHw/Le+d/GXC0/OwJPivP3Jmsb4z4jRm21GKMktG9qAek9obUS+OyrwWm
 WH2Ke1b85iAqgoxTIJJ6lgULfnjlscakTAv/7PTwdcnejweC8ao/yYnu0lhEPd/ZPl1n
 2n8g==
X-Gm-Message-State: AOAM530rK9P4ttpn5/uwCTQJc5YXLvjbEBgbPTtqD1nVRSl/m2L9SqzN
 Np4zkqjkaGWgwobOnVpdB+sjgH9fB+YxuL/Qgyb9rHRGMoYvqjXd00jhW3hc6HbSTxiWYpykv0s
 TUkfwxWusED1R5UQ=
X-Received: by 2002:a05:6000:1103:b0:1e6:2787:cdf4 with SMTP id
 z3-20020a056000110300b001e62787cdf4mr6605502wrw.31.1645201908357; 
 Fri, 18 Feb 2022 08:31:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWKlaaVlU8KzZ+CR7SablGde1rL0Wj570oGdWzyFIBQ+olppV336BtMA7M4akX8XQYtjWjhA==
X-Received: by 2002:a05:6000:1103:b0:1e6:2787:cdf4 with SMTP id
 z3-20020a056000110300b001e62787cdf4mr6605478wrw.31.1645201908057; 
 Fri, 18 Feb 2022 08:31:48 -0800 (PST)
Received: from localhost (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id g12sm6197166wmq.28.2022.02.18.08.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 08:31:47 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v7 3/5] migration: Add zero-copy parameter for QMP/HMP
 for Linux
In-Reply-To: <CAJ6HWG6pWzkxmi+o3j9u+O0K=o3rBEKMmfMYQNY0pfKzg-NeqQ@mail.gmail.com>
 (Leonardo Bras Soares Passos's message of "Wed, 19 Jan 2022 15:46:04
 -0300")
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-4-leobras@redhat.com>
 <YeAkpTE0gqf1dj4C@redhat.com>
 <CAJ6HWG4GQV1N_=18TPqQygKCz36+VBx=b4EtUoZpMvcOQ6v0Vg@mail.gmail.com>
 <YehVMEL1hPaTbCIE@redhat.com>
 <CAJ6HWG6pWzkxmi+o3j9u+O0K=o3rBEKMmfMYQNY0pfKzg-NeqQ@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 18 Feb 2022 17:31:46 +0100
Message-ID: <87zgmocf0t.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras Soares Passos <leobras@redhat.com> wrote:
> On Wed, Jan 19, 2022 at 3:16 PM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
>>
>> On Wed, Jan 19, 2022 at 03:03:29PM -0300, Leonardo Bras Soares Passos wr=
ote:
>> > Hello Daniel,
>> >
>> > On Thu, Jan 13, 2022 at 10:10 AM Daniel P. Berrang=C3=A9 <berrange@red=
hat.com> wrote:
>> > >
>> > > On Thu, Jan 06, 2022 at 07:13:40PM -0300, Leonardo Bras wrote:
>> > > > Add property that allows zero-copy migration of memory pages,
>> > > > and also includes a helper function migrate_use_zero_copy() to che=
ck
>> > > > if it's enabled.
>> > > >
>> > > > No code is introduced to actually do the migration, but it allow
>> > > > future implementations to enable/disable this feature.
>> > > >
>> > > > On non-Linux builds this parameter is compiled-out.
>> > > >
>> > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
>> > > > ---
>> > > >  qapi/migration.json   | 24 ++++++++++++++++++++++++
>> > > >  migration/migration.h |  5 +++++
>> > > >  migration/migration.c | 32 ++++++++++++++++++++++++++++++++
>> > > >  migration/socket.c    |  5 +++++
>> > > >  monitor/hmp-cmds.c    |  6 ++++++
>> > > >  5 files changed, 72 insertions(+)
>> > >
>> > > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> >
>> > Thanks!
>>
>
> Ok, I see the point.
> I will try to refactor the code changing zero-copy to zero-copy-send
> or something like that.

Hi

I am late to the party, but I agree with Dan that we need two flags.

Thre reason is that you can be the target of one migration, and later be
the source of a next one.  If we only have one flag that means different
things on the source and destination side, things become really
complicated.

Later, Juan.


