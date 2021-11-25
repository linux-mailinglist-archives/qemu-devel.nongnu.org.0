Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4A545E129
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 20:47:54 +0100 (CET)
Received: from localhost ([::1]:52152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqKin-00083T-D0
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 14:47:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqKhe-0007N1-79
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 14:46:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqKha-00049D-Tw
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 14:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637869597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=et8cy/gg9Wrw05E4gC3Mb913nsWArxVcB9K+pxBNHOE=;
 b=feHegr4heblSaAG3G+TQzso9hDjeKHturalaAfyHcm+yUPF+rVx5R3UEtdzhA3ICCUGiwi
 8M4zCUO8pWRQOuLUBSWOY97D/1JmFVG/TiqjZnqvWbpa7ar58j9fHpSa/7x4KI2IsJHbPj
 cf9KZhB4IJAJSUTkMZOrDo8Zvdr2e04=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-Zfkede4iOuuK844cO83afg-1; Thu, 25 Nov 2021 14:46:36 -0500
X-MC-Unique: Zfkede4iOuuK844cO83afg-1
Received: by mail-wm1-f69.google.com with SMTP id
 a85-20020a1c7f58000000b0033ddc0eacc8so3597162wmd.9
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 11:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=et8cy/gg9Wrw05E4gC3Mb913nsWArxVcB9K+pxBNHOE=;
 b=YYl7FUiQlj6sPjN+HipWKut5ioa7Zh4LYVJeexg0ceGSEkWfI51ttHM17I3FejiR2Y
 EpaL7cmYMdQWhBGAgjf/B7sSiwAtdNSPuL+Kh0EWUhgFsAwZUaKLguwPcJ+csJW/ligg
 w2/ATNcn+YPu3/HIQXX4BzBX42dn9KBQdslDTWEGJRjhhtNuTMFO9xk+Ekis2DjCR+U+
 jef8nv70xSJFReOWry/qzz25TZ+K0NUoV2syzB+s1aqOhB1Cpqfw8MmjitQeEljKcc6j
 WPksbS6Rm+vHLwU0c92JKm2bCHHgpLhRQ80h7T5Celqzpsduqibt2IjrY6fSyFdhSZ/Y
 5+Hw==
X-Gm-Message-State: AOAM531obpHuEkt5rPbRxXPiMG4KTc6FCBkBHvIQwauyWFpIUa8wKJAo
 kL/Kq0cG+sZlGXbun2g2qAGld/eF3+hDI6sVg6fvdeL6XLzTv+TSQDk+kXgf368v4tKQjLfC2ez
 NaJhIB3OTsbrfxP8=
X-Received: by 2002:a7b:c770:: with SMTP id x16mr3958550wmk.66.1637869590438; 
 Thu, 25 Nov 2021 11:46:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxK948lP3FQ1IcIQmr852FKzIyoAxt2JHszT58mEmS/5LYyWBQg3BXWqzJt+J22oVNbIrQKLA==
X-Received: by 2002:a7b:c770:: with SMTP id x16mr3957680wmk.66.1637869576249; 
 Thu, 25 Nov 2021 11:46:16 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id y142sm3914369wmc.40.2021.11.25.11.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 11:46:15 -0800 (PST)
Date: Thu, 25 Nov 2021 19:46:13 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 01/23] multifd: Delete useless operation
Message-ID: <YZ/oBfd2TT3pGc1u@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-2-quintela@redhat.com>
 <YZ6JCNdj0G4r3igs@work-vm> <87ilwgg0ks.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87ilwgg0ks.fsf@secure.mitica>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > * Juan Quintela (quintela@redhat.com) wrote:
> >> We are divining by page_size to multiply again in the only use.
> >              ^--- typo
> >> Once there, impreve the comments.
> >                   ^--- typo
> >> 
> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >
> > OK, with the typo's fixed:
> 
> Thanks.
> 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >
> > but, could you also explain the  x 2 (that's no worse than the current
> > code); is this defined somewhere in zlib?  I thought there was a routine
> > that told you the worst case?
> 
> Nowhere.
> 
> There are pathological cases where it can be worse.  Not clear at all
> how much (ok, for zlib it appears that it is on the order of dozen of
> bytes, because it marks it as uncompressed on the worst possible case),
> For zstd, there is not a clear/fast answer when you google.

For zlib:

ZEXTERN uLong ZEXPORT compressBound OF((uLong sourceLen));
/*
     compressBound() returns an upper bound on the compressed size after
   compress() or compress2() on sourceLen bytes.  It would be used before a
   compress() or compress2() call to allocate the destination buffer.
*/

> As this buffer is held for the whole migration, it is one for thread,
> this looked safe to me.  Notice that we are compressing 128 pages at a
> time, so for it not to compress anything looks very pathological.
> 
> But as one says, better safe than sorry.

Yeh.

Dave

> If anyone that knows more about zlib/zstd give me different values, I
> will change that in an additional patch.
> 
> Later, Juan.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


