Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B429D43C353
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 08:53:47 +0200 (CEST)
Received: from localhost ([::1]:53604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfcok-0007JE-R1
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 02:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mfclO-0003oy-Hl
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:50:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mfclL-0008BH-Fh
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635317413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JnU8To2gDfAV43PV4v849RqzBZY8sfFLoTTLXrHdEbs=;
 b=fyhuK0zCsLG36flWsp1Kk/PN5H3LsBwJtETxWGaJX6hXFP/JnGCswvUY3rbNnmMWYHBRt2
 XRQf/XjamBDvnpg4hu2e/6o13rasH4b4FDMA4pwFixh/jf7DhfKxQCRQ5EENVY+O++OeRa
 h5NH81wH7SL50dPUbxgz85TYJHW+IZU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-h4wAmpX_OGiLZHw4d3uKag-1; Wed, 27 Oct 2021 02:50:10 -0400
X-MC-Unique: h4wAmpX_OGiLZHw4d3uKag-1
Received: by mail-lf1-f70.google.com with SMTP id
 j22-20020a05651231d600b003ffacdb8311so953533lfe.7
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 23:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JnU8To2gDfAV43PV4v849RqzBZY8sfFLoTTLXrHdEbs=;
 b=CNU1ik9eDJtuzxMdTsffDxpu+9QXFcDqZlWTzgJRiZ+qKnmB32tQX9tgfsalqvCESB
 EzYeaJ861+4YvDZVV122LiS+ixPBIzzBvl+jmq1tnauEMbqqVD1qSoBUbZHN6aAKtlMj
 8Bug03JwFRM038MtjUNEl+2aNq23/16Ju4p/U01X9qD4MzATObrgad9iS22rlmNX1Iho
 8quXbIZYSqjwfZtR7/vDwifgadGKSGtpDTzcbwIVsbvO9t1awruXgjNbHPi5incnR5x/
 2hGNHPIgQwT0J6uHL5M4aiDJ8cyHYcOWt4/d+fRn16FcrVkELwXdurw29TcJ7qQffaQ5
 EE6Q==
X-Gm-Message-State: AOAM530PpPIZ8fXFBU30cRzok4rsM+PzpoTBOAqgCSyTxFIonw+jwVjK
 5K7xntO7z3IFgwr+pCA/yMQ5+Xz/8HynAA93cFCsgim7pzj/dkM6iuc+HKV8aBR0iMKIw4stv2q
 75BG1pgffLpax3rU3aKHiw12cJqnPmHU=
X-Received: by 2002:a2e:878d:: with SMTP id n13mr7608672lji.116.1635317408691; 
 Tue, 26 Oct 2021 23:50:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTFZnbnPK5tsjKt2B+lRpeVLwoLaICl6qA6jJuIcnVRUCpQbaEX/aUnlbkNfYzuNgZFETE0WDiTepJ6+LmspQ=
X-Received: by 2002:a2e:878d:: with SMTP id n13mr7608642lji.116.1635317408424; 
 Tue, 26 Oct 2021 23:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-4-leobras@redhat.com>
 <YWZ8I8s62qyjTF/e@t490s>
In-Reply-To: <YWZ8I8s62qyjTF/e@t490s>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 27 Oct 2021 03:50:09 -0300
Message-ID: <CAJ6HWG4=g4m=v4czSDmMaABxSTeW67+y=P7G3EPMr53R3KVUqQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 3:26 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Sat, Oct 09, 2021 at 04:56:13AM -0300, Leonardo Bras wrote:
> > @@ -105,7 +105,13 @@ static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
> >   */
> >  static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
> >  {
> > -    return qio_channel_writev_all(p->c, p->pages->iov, used, errp);
> > +    int flags = 0;
> > +
> > +    if (migrate_multifd_zerocopy()) {
> > +        flags = QIO_CHANNEL_WRITE_FLAG_ZEROCOPY;
> > +    }
> > +
> > +    return qio_channel_writev_all_flags(p->c, p->pages->iov, used, flags, errp);
> >  }
>
> What if the user specified ZEROCOPY+MULTIFD, but the kernel doesn't support it?
>
> IIUC then the first call to qio_channel_writev_all_flags() above will fail,
> then we fail the migration.
>
> It seems fine, but since you've introduced QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY
> in the previous patch - I think the cleaner way is when start migration and
> after we setup the ioc, we sanity check on the capability and the ioc to make
> sure if ZEROCOPY+MULTIFD is specified, we should fail early if we're sure the
> ioc doesn't have QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY bit set?
>
> --
> Peter Xu
>

Failing earlier is always a good idea.
I will try to implement that.

Thanks Peter!

Best regards,
Leo


