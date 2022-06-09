Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C764654500E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:00:45 +0200 (CEST)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJeK-00036d-U4
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzI0b-0003dG-AX
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:15:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzI0Y-0008Fa-5n
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:15:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654780529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bpjaRie5jvywJJk9V/eRJd+6KWhGF5InpeeL6pXgy6Y=;
 b=TdZ4su2kh5xzCvE8VyWpfRqAKh8xsp1aHYmZwEEzVQDJd+sSyhUlqbCGnAtwfQnbxDAGdi
 Gh73nIE/GHsxaee7z1BRnjxW9NrSbh3xKZE8pgAoUIc+/YsfhwU0d7fRxKbMMgZ2mahwnr
 vHM6GC8TJ6eSOEZ6yxikpSq554OVjfk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-DHuie5n5NTW7ZQe-RX1MWw-1; Thu, 09 Jun 2022 09:15:27 -0400
X-MC-Unique: DHuie5n5NTW7ZQe-RX1MWw-1
Received: by mail-wm1-f70.google.com with SMTP id
 130-20020a1c0288000000b0039c6608296dso1841822wmc.4
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 06:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=bpjaRie5jvywJJk9V/eRJd+6KWhGF5InpeeL6pXgy6Y=;
 b=O6npsftkJNmnfC5DAxPN78bCzHk913ZN/ch6EZlWTyYrVGobDr0ImibfNE+GC6/R3l
 y0/W0C8ypviuLnB9FVwUfV041L5fNwxKnkfar89Vwxgmmf07m5rtCWlvlEx2uwX6M96/
 DbXuI3iBUgao4I9h25VlYdud2aOm+zyOFMqgnt/cu0rFF4gpJzC45bnASky85YHCkW8r
 y9HqHGZ/LdKKolEGF2dIfnseinDnCV0+P4k7PED3n3ySMKypNQ16YVQGAY6DD++ncVM7
 2sdQD2k9vSFTRuGHC0DKH+0x/bndEmKv0Y/HNY9gxiUCdgx48kKieM9MgRWmMEkDzWy3
 c93Q==
X-Gm-Message-State: AOAM533psp8o9NnTyBgXYePC9kU1YX9EFGugeXab8zKFqObtIX0AfyAl
 82HBcbn4Ke3LaCsl3VIWmYYqMKTVLG4c43QIm1x3JF4b9Cs1TqWeo8CgS14ywtF2NO4VHOJ8fT3
 I73OWZusCQ+Z1S7I=
X-Received: by 2002:a05:6000:1869:b0:211:7f25:89da with SMTP id
 d9-20020a056000186900b002117f2589damr38515582wri.696.1654780526792; 
 Thu, 09 Jun 2022 06:15:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrglJMmiX97DEWzXHJ/Xzi0UdL/YoyN6sLu2omRZULpJ8UhcIXz7T1moLNtEykeMbkmWaDnw==
X-Received: by 2002:a05:6000:1869:b0:211:7f25:89da with SMTP id
 d9-20020a056000186900b002117f2589damr38515552wri.696.1654780526487; 
 Thu, 09 Jun 2022 06:15:26 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 z3-20020a05600c0a0300b0039c362311d2sm37706968wmp.9.2022.06.09.06.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 06:15:25 -0700 (PDT)
Date: Thu, 9 Jun 2022 14:15:23 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 07/20] migration: rename qemu_update_position to
 qemu_file_credit_transfer
Message-ID: <YqHya/taQpnXdPMo@work-vm>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-8-berrange@redhat.com>
 <CAFEAcA-nv+chmz1ih7FQp-Ptyx9qLSy8AbxRitcafiWNbDZUNQ@mail.gmail.com>
 <YqHvSqJO94+LfxHE@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqHvSqJO94+LfxHE@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Thu, Jun 09, 2022 at 01:56:00PM +0100, Peter Maydell wrote:
> > On Tue, 24 May 2022 at 12:46, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > >
> > > The qemu_update_position method name gives the misleading impression
> > > that it is changing the current file offset. Most of the files are
> > > just streams, however, so there's no concept of a file offset in the
> > > general case.
> > >
> > > What this method is actually used for is to report on the number of
> > > bytes that have been transferred out of band from the main I/O methods.
> > > This new name better reflects this purpose.
> > >
> > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > 
> > >  int qemu_peek_byte(QEMUFile *f, int offset);
> > >  void qemu_file_skip(QEMUFile *f, int size);
> > > -void qemu_update_position(QEMUFile *f, size_t size);
> > > +/*
> > > + * qemu_file_credit_transfer:
> > > + *
> > > + * Report on a number of bytes that have been transferred
> > > + * out of band from the main file object I/O methods.
> > > + */
> > > +void qemu_file_credit_transfer(QEMUFile *f, size_t size);
> > >  void qemu_file_reset_rate_limit(QEMUFile *f);
> > >  void qemu_file_update_transfer(QEMUFile *f, int64_t len);
> > >  void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);
> > 
> > What's the difference between "credit transfer" and "update
> > transfer" ? The latter also seems to just be adding a number
> > to a count of bytes-transferred...
> 
> The other method is merely related to the rate limiting, and so
> probably ought to have 'rate_limit' included in its name too.

Bleh that's messy; I see update_transfer is used in the multifd case
as well, so makes sense for stats only and not a position in a stream
that only makes sense for a single fd.
(But now doesn't make any sense any more with these changes either)

Dave

> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


