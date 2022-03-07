Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F084D0110
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:22:24 +0100 (CET)
Received: from localhost ([::1]:59950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nREFj-0006Ll-E8
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:22:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nREDv-0004oe-3E
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:20:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nREDr-0006BP-78
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:20:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646662825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=04eLOWaRbiatBtb/ighOuJ+aYIxGHYsiUFApmGojnFo=;
 b=Gu6XFu/xxj+1h+5rgnM/EIG0vfEkVjbBncas8S/gROweXKoaScEN/303uQz8n3gJNhpH2u
 aPt4wrbgruNMA24V1Haw+oC+qRIMKXeSprR0v53HzB9oEwJe/oc60QkLwopmb7+vLzYZXO
 aA2k2bfvttlOLdkwgTeGTAL9x4JXsr0=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-FH9NHz9iM-u921_50Bvvzg-1; Mon, 07 Mar 2022 09:20:24 -0500
X-MC-Unique: FH9NHz9iM-u921_50Bvvzg-1
Received: by mail-lf1-f71.google.com with SMTP id
 e8-20020ac25468000000b00443973fc878so3543172lfn.23
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 06:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=04eLOWaRbiatBtb/ighOuJ+aYIxGHYsiUFApmGojnFo=;
 b=YS+WaQFtMJmQoclyA5sXuHTjmbtuzp9sACtPxpwvoKdhFO2EfVsG6NsAnAmFwE2nvM
 DFnx8gcRpIiX8Tb72AQ06WvMe0J6s+93Pd/og6iqqKdnFkfPLYXnuDk0mWEQZw/ohZLF
 fUmha1pZDq7zO985y6CdjP15J5ntbYXMyARmPZyUhcaYGG3j2XktRFJ54MhayB8oICGg
 Tj9k6IkUBz6oFPtMAwMjyzylwmRn7IDQ4ETO/yDAa8lINQmWjVQi4ITLdO7XBiN/xK2E
 5iBeR4UN5rskc+G/Vmj0veVdWd4e5VphE1V/7JPDV4UwlZvN97hUqOJ+9DOr5FGoJVNW
 qMtg==
X-Gm-Message-State: AOAM532ZgZGnvBfQec0mffZhpwB471CA2vcEZVfYy6J8LbJfJCfXGwrs
 pJdm6TFtmZxfjR8qMk2F64WNztB+aMikTc0TmY5LXDycA1IIhiEWJWrb8jRRIryp70QqsZSEH1o
 uXqZJWZ/0xzWvycgUdcZsEvkdXSR4mvc=
X-Received: by 2002:a2e:b7c5:0:b0:23e:4c1b:d9d0 with SMTP id
 p5-20020a2eb7c5000000b0023e4c1bd9d0mr7932675ljo.10.1646662822767; 
 Mon, 07 Mar 2022 06:20:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywXq21xej49uiuTZHz0qGUkDf+xVp7nkoJeU7+HGnwTD0HfmWFaQByGbTYJkkdKXKU+u1d/tOma+Ap9uuSfWM=
X-Received: by 2002:a2e:b7c5:0:b0:23e:4c1b:d9d0 with SMTP id
 p5-20020a2eb7c5000000b0023e4c1bd9d0mr7932656ljo.10.1646662822483; Mon, 07 Mar
 2022 06:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20220201062901.428838-1-leobras@redhat.com>
 <20220201062901.428838-6-leobras@redhat.com>
 <87fsogcdue.fsf@secure.mitica> <Yh2ZrbDkIGOuwrx2@xz-m1.local>
In-Reply-To: <Yh2ZrbDkIGOuwrx2@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 7 Mar 2022 11:20:14 -0300
Message-ID: <CAJ6HWG4K=m083s0DzbvHep9=RFmRE5GGUfQBw5JGSJF+To3YKw@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 1, 2022 at 12:57 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Feb 18, 2022 at 05:57:13PM +0100, Juan Quintela wrote:
> > I did a change on:
> >
> > commit d48c3a044537689866fe44e65d24c7d39a68868a
> > Author: Juan Quintela <quintela@redhat.com>
> > Date:   Fri Nov 19 15:35:58 2021 +0100
> >
> >     multifd: Use a single writev on the send side
> >
> >     Until now, we wrote the packet header with write(), and the rest of the
> >     pages with writev().  Just increase the size of the iovec and do a
> >     single writev().
> >
> >     Signed-off-by: Juan Quintela <quintela@redhat.com>
> >     Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >
> > And now we need to "perserve" this header until we do the sync,
> > otherwise we are overwritting it with other things.
> >
> > What testing have you done after this commit?
> >
> > Notice that it is not _complicated_ to fix it, I will try to come with
> > some idea on monday, but basically is having an array of buffers for
> > each thread, and store them until we call a sync().
>
> Or can we conditionally merge the two write()s?  IMHO the array of buffers
> idea sounds too complicated, and I'm not extremely sure whether it'll pay
> off at last.  We could keep the two write()s with ZEROCOPY enabled, and use
> the merged version otherwise.

I think that's a great idea!
It would optimize the non-zerocopy version while letting us have a
simpler zerocopy implementation.
The array of buffers implementation would either require us to have a
'large' amount of memory for keeping the headers, or having flush
happening too often.

>
> Btw, is there any performance measurements for above commit d48c3a044537?
> I had a feeling that the single write() may not help that much, because for
> multifd the bottleneck should be on the nic not on the processor.

I am quite curious about those numbers too.

>
> IOW, we could find that the major time used does not fall into the
> user<->kernel switches (which is where the extra overhead of write()
> syscall, iiuc), but we simply blocked on any of the write()s because the
> socket write buffer is full...  So we could have saved some cpu cycles by
> merging the calls, but performance-wise we may not get much.
>
> Thanks,
>
> --
> Peter Xu
>

Thanks Peter!


