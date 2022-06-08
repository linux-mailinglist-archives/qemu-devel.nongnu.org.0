Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64824542156
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:45:18 +0200 (CEST)
Received: from localhost ([::1]:40518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyoVJ-0006qW-F8
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nyoO8-0001lf-8f
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:37:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nyoO6-0004hq-Jy
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:37:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654666669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qr8XLqsaiBHZPShy2IUXKRZDYIoP2wWoQznOB3E94+g=;
 b=LVZwP4w/fQV2gg0L7mFHY7Xspwc+oeFptrknFMz+AQI9CoXW2fU2fkUFiFqLg7uPwurZRR
 N6G/djl+YQyrB2rlkQ+pZYRd6rdIep9JVZgy7z0HB+Z/LG1TYKkLjIoLY1b2ULhSpqXDSV
 O28z8PIAc1qe6etkJkKrjvL1to0inXc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-yRniwDadOdm5vczjKtj-2Q-1; Wed, 08 Jun 2022 01:37:40 -0400
X-MC-Unique: yRniwDadOdm5vczjKtj-2Q-1
Received: by mail-ej1-f71.google.com with SMTP id
 n2-20020a170906724200b006fed87ccbb8so8866186ejk.7
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qr8XLqsaiBHZPShy2IUXKRZDYIoP2wWoQznOB3E94+g=;
 b=5lpbv7L1z5FR+YNhXze4zJwub1tFE7oZ/zCjM7XYcwneKfQc8UYgMt6nQoj4JIaB9A
 oa5DQ9uMUu1xd9++xyOrVdXQoPA+eqKd6kCOn2yMgd9cYZpUvJgXqdPFhVCNsEyD9N4n
 sE4Mc890wN8Gr9DUnJxv8f/v6zfGYWxTQ6t0WXH3JDCY0hgh1mRzUT10mjRvCXF36OWU
 o1k++92Bd+10jfeGQY1p9LsO3LfTU1+9qU1MT6MhZZQsMY7sjS0ZZL41wnqBMiigLJen
 6Afv5jCmhTlNISHt8S0Hp7mRRz7Q+W0FD/BT4qj9tQ6AQnO7eOfxto8BwcULd7G9YCx4
 nWgA==
X-Gm-Message-State: AOAM533HrYbfbBZeZH98U6fhyEhE7k37A2SrtLQkiPxH3MGEKdMmWANY
 yp3WGmUMHQlUpmXNJV8tCERQTMuzIp41WtGsE94NDhR4yGfVCIbiD5UwIaj4wE9dqk0Hg29xU8k
 fO5Q48M99fx9K9wA1O7VDU9EiAcFY8s4=
X-Received: by 2002:a05:6402:11d2:b0:42d:e68a:eae0 with SMTP id
 j18-20020a05640211d200b0042de68aeae0mr37050275edw.111.1654666659463; 
 Tue, 07 Jun 2022 22:37:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE08rkaPVTJ/3j6P+7rHV205Thk9ojOmRAdCy9gO19hRDi8jMtUQ+F1/JDXloFzmjKWpLKgc3E+S8J5U+6VrI=
X-Received: by 2002:a05:6402:11d2:b0:42d:e68a:eae0 with SMTP id
 j18-20020a05640211d200b0042de68aeae0mr37050245edw.111.1654666659190; Tue, 07
 Jun 2022 22:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-4-leobras@redhat.com>
 <b2fae41c-7f47-9bf1-21b9-1b123818a262@bytedance.com>
 <YpdwcHu7I8dGDimt@xz-m1.local>
In-Reply-To: <YpdwcHu7I8dGDimt@xz-m1.local>
From: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Date: Wed, 8 Jun 2022 02:37:28 -0300
Message-ID: <CAJ6HWG7vxRzEN5CRf93m_afHPn9zvMdYe=DZ4pGKKBQ8gyTY+Q@mail.gmail.com>
Subject: Re: [External] [PATCH v13 3/8] QIOChannelSocket: Implement io_writev
 zero copy flag & io_flush for CONFIG_LINUX
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 lizefan.x@bytedance.com, zhouyibo@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hello Peter,

On Wed, Jun 1, 2022 at 10:58 AM Peter Xu <peterx@redhat.com> wrote:
>
[...]
> > Hi, Leonardo. I'm also paying attention to the application of MSG_ZEROCOPY
> > in live migration recently. I noticed that you defined a member
> > `zero_copy_queued` in the struct QIOChannelSocket, but I can't find out
> > where the value of this member has been changed in your patch. Can you
> > answer it for me?
> >
>
> Good point.. it should probably be increased when queuing the pages. We'd
> better fix it up or it seems the flush() will be literally an no-op..

That's correct.
I am working on a fix right now.
The idea is to increment it in qio_channel_socket_writev() if sendmsg succeeds.

>
> Two things in qio_channel_socket_flush() we can do to make sure it'll work
> as expected, imo:
>
>   1) make ret=-1 as initial value, rather than 1 - we only check negative
>      errors in the caller so we could have missed a positive "1"
>
>   2) add a tracepoint into the loop of updating zero_copy_sent
>
> Leo, what's your take?

(1) is not an option, as the interface currently uses ret=1 to make
sure MSG_ZEROCOPY is getting used,
I added that so the user of qio_channel can switch off zero-copy if
it's not getting used, and save some cpu.

(2) is not a problem, but I fail to see how useful that would be. Is
the idea manually keeping track of flush happening?

Best regards,
Leo


