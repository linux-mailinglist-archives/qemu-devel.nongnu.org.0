Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475F9404069
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 23:06:37 +0200 (CEST)
Received: from localhost ([::1]:51480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO4mB-0006cH-SF
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 17:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mO4kd-0005HV-0e
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 17:04:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mO4ka-0005BT-Vu
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 17:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631135095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m4KmfA/ZtkMKCcQ/pLSR1y8RQX+Jov2uo1wuvXq3YYo=;
 b=fYEURiSp+f585TSF7l3uoSiFQeXpQF2Pg4Oli9NeizcPdzXvnxEC/rFsD/YNkYcGdWEqNC
 f5itn+/vPp2DyTfXej9K3kWKDamNBDp78m7QtHyO+Mlqtl9lqIBD7g5yf+EB6yxoHImgLQ
 jEO3dtJb/UMJmgFEIdngeILyRxU6IYc=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-_JhCBwykOSKjnpds0cZLqg-1; Wed, 08 Sep 2021 17:04:52 -0400
X-MC-Unique: _JhCBwykOSKjnpds0cZLqg-1
Received: by mail-il1-f200.google.com with SMTP id
 w12-20020a92ad0c000000b00227fc2e6eaeso2793361ilh.4
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 14:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m4KmfA/ZtkMKCcQ/pLSR1y8RQX+Jov2uo1wuvXq3YYo=;
 b=yyptNE7puwZ151mQ/cRIMEKGPg0/AanRi3qZxHv0e/ARLF62bG0McbgM4u+qlUgUu2
 JObG6h0VTheZapSkzhWop1H8isj4blsKt8RAqaZUIutL3EYHzMFUxsaTfr9FpgnK7eZf
 0VpHq56T9pQTXO+hk76T4zOJuz7GEf/YJL0ktI5Owg4xqaQ27XH39asflIDmghy97plY
 WyPhSMZcaU3BeLYLEQiMe6fALF2nFvf69FFx3SQycVHbHWnhbCVzqgGkTn4AYFD6Ob6D
 5Ehxsm4/QJXP4cHt2QlB5j05Q9WCLLk8umxe6DTisk6TNEB5aEtS9mI1cbJTJ3RXJ0Xw
 LYmA==
X-Gm-Message-State: AOAM5312Ti2+eqgDzeBzHAV7jWiuad9h3LcdTUr4DlwJVO3Rfm+F7ibm
 rskRI0pgRmWoR2Xc0SD4Vm032bS/GxSsQtUkNZa6TVlutKNuhJFIdgaDyOdErBlZ73YQMaeADSO
 W1XkeOR6R1U/Elh8=
X-Received: by 2002:a92:130e:: with SMTP id 14mr165642ilt.129.1631135091701;
 Wed, 08 Sep 2021 14:04:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8lavzCqpfM0rMnMKCFbd+aW9gpYa9ojJTbYJlnyoMFRpfpl5+8nmZG+ZougGeMBHIZ9wkbg==
X-Received: by 2002:a92:130e:: with SMTP id 14mr165619ilt.129.1631135091488;
 Wed, 08 Sep 2021 14:04:51 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id g8sm99617ild.31.2021.09.08.14.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 14:04:50 -0700 (PDT)
Date: Wed, 8 Sep 2021 17:04:49 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
Message-ID: <YTklca5MNvv8fE8h@t490s>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com> <YS6QmOrN4qr055vR@t490s>
 <CAJ6HWG72311UK9Nvh+JDw-zo1Days0u8N_QHbeGGdfKR+hALCA@mail.gmail.com>
 <YTeXBCAUOpy0HagV@t490s>
 <CAJ6HWG7xWNJZG7=QDkeL6wNiBdTBo3YeHLtu1iTACeC9+4_rHQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG7xWNJZG7=QDkeL6wNiBdTBo3YeHLtu1iTACeC9+4_rHQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 05:13:40PM -0300, Leonardo Bras Soares Passos wrote:
> On Tue, Sep 7, 2021 at 1:44 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Thu, Sep 02, 2021 at 03:59:25AM -0300, Leonardo Bras Soares Passos wrote:
> > > I also suggested something like that, but I thought it could be good if we could
> > > fall back to io_writev() if we didn't have the zerocopy feature (or
> > > the async feature).
> > >
> > > What do you think?
> >
> > That fallback looks safe and ok, I'm just not sure whether it'll be of great
> > help.  E.g. if we provide an QIO api that allows both sync write and zero-copy
> > write (then we do the fallback when necessary), it means the buffer implication
> > applies too to this api, so it's easier to me to just detect the zero copy
> > capability and use one alternative.  Thanks,
> >
> > --
> > Peter Xu
> >
> 
> I was thinking this way (async method with fallback) we would allow code using
> the QIO api to just try to use the io_async_writev() whenever the code
> seems fit, and
> let the QIO channel layer to decide when it can be used
> (implementation provides,
> features available), and just fallback to io_writev() when it can't be used.

Sure, I think it depends on whether the whole sync/async interface will be the
same, e.g., when async api needs some callback registered then the interface
won't be the same, and the caller will be aware of that anyways.  Otherwise it
looks fine indeed.  Thanks,

-- 
Peter Xu


