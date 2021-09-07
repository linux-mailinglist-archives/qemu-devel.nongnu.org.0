Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44617402794
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 13:08:02 +0200 (CEST)
Received: from localhost ([::1]:38036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNYxN-0000Qj-B7
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 07:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mNYw0-00079D-QS
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:06:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mNYvw-0007EX-S5
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631012791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E2fULgCVcQ+9SmU+55xR8XYsl1r+O5v8AJSxu7Z9wQw=;
 b=QHOQMdlL4/3w8DZKLd8IsmCfs9dfXQ29j2l2hoqfbMu84PuhYI9JNZQSRuBLBPcV7NSGMN
 rkErFs8THYdPPcrnRtiZ8i0JZ4etIHxUIXTDRX7VdPOmZ0fyx3J2RkZnC11qjcpBdPmuqg
 8LTHgzeQ/iDqtpzf+UcVNgfZnBpiw+w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-9HjPAFIOOyOuXqBt3rXnxw-1; Tue, 07 Sep 2021 07:06:19 -0400
X-MC-Unique: 9HjPAFIOOyOuXqBt3rXnxw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so2003933wrl.0
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 04:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=E2fULgCVcQ+9SmU+55xR8XYsl1r+O5v8AJSxu7Z9wQw=;
 b=jxzhOBRKqIGxzv5/fK6flg7sR0zXimbxTTahS9ZBvUQw0XD/o351WWWnLhREyqiVu3
 haD7Y4+tQmXiYaH0dv5NkPdlrIW2w2iyzKTK29mNz0RURZbvkuVlpFt/mAmTBn8Urosq
 BN8dy0Acq7t03Cgn3tpBBGeNo8F4ttCnxcEb82rfM+t+ZVzxIcEMgo7u/CiN2XXcvh06
 HlWgSQtvSqO7xALsQZsd4QdD/G+CRjmDMSyYkQfPheUwsauS+m9y2Z3YPgctaxWEOdPZ
 xGa5Yw6PQfWBh8aT8DsFdNWcm3tum4Cff/11ozZ8fm7j++NIHWEN3toUgH+iKjz0sWfG
 5eiw==
X-Gm-Message-State: AOAM533Z4sR6RMTx2tCwj1dVb+8TQ2cwTQiY19YPC5XbGxuBiU2EHZjk
 B5eW8NqKrvOB9l7xIWqs8xX/BtPQ+TQ6s12n6MM5PJt9UI7xFUjeIH41tI3FgKZ2qfyeHCrE+K/
 zeY9W7A5UFmkdw2Q=
X-Received: by 2002:a5d:460a:: with SMTP id t10mr18343352wrq.147.1631012778072; 
 Tue, 07 Sep 2021 04:06:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0bRAYVdmXMElkwajpO/GRTwv9AbTFaWQr0u7Bu8NuCITbWYKTJ4oxeT3goSJQKkx/zef/Yw==
X-Received: by 2002:a5d:460a:: with SMTP id t10mr18343324wrq.147.1631012777866; 
 Tue, 07 Sep 2021 04:06:17 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id h16sm10690439wre.52.2021.09.07.04.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 04:06:17 -0700 (PDT)
Date: Tue, 7 Sep 2021 12:06:15 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
Message-ID: <YTdHpx263WNe7nuZ@work-vm>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com>
 <CAJ6HWG75NDzaRAoHvM6FkFoB+sQvTpmdR8+AdMkoY6TsP06ZhA@mail.gmail.com>
 <YTCPngNB+l70sl06@redhat.com>
 <CAJ6HWG6dd+timQM27-NTumvwDM2bFawRsnmrZumdzGZ8hCR3dQ@mail.gmail.com>
 <YTCeNCEmr3NsQEPR@redhat.com>
 <CAJ6HWG6D61K49gyvfLo2c5=cZpkYh96ciZjO5V=wiPdG+wB5zQ@mail.gmail.com>
 <YTCnP9J/JINhg4h8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YTCnP9J/JINhg4h8@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras Soares Passos <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Thu, Sep 02, 2021 at 07:19:58AM -0300, Leonardo Bras Soares Passos wrote:
> > On Thu, Sep 2, 2021 at 6:50 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > >
> > > On Thu, Sep 02, 2021 at 06:34:01AM -0300, Leonardo Bras Soares Passos wrote:
> > > > On Thu, Sep 2, 2021 at 5:47 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > >
> > > > > On Thu, Sep 02, 2021 at 03:38:11AM -0300, Leonardo Bras Soares Passos wrote:
> > > > >
> > > > > > > I would suggest checkig in close(), but as mentioned
> > > > > > > earlier, I think the design is flawed because the caller
> > > > > > > fundamentally needs to know about completion for every
> > > > > > > single write they make in order to know when the buffer
> > > > > > > can be released / reused.
> > > > > >
> > > > > > Well, there could be a flush mechanism (maybe in io_sync_errck(),
> > > > > > activated with a
> > > > > > parameter flag, or on a different method if callback is preferred):
> > > > > > In the MSG_ZEROCOPY docs, we can see that the example includes using a poll()
> > > > > > syscall after each packet sent, and this means the fd gets a signal after each
> > > > > > sendmsg() happens, with error or not.
> > > > > >
> > > > > > We could harness this with a poll() and a relatively high timeout:
> > > > > > - We stop sending packets, and then call poll().
> > > > > > - Whenever poll() returns 0, it means a timeout happened, and so it
> > > > > > took too long
> > > > > > without sendmsg() happening, meaning all the packets are sent.
> > > > > > - If it returns anything else, we go back to fixing the errors found (re-send)
> > > > > >
> > > > > > The problem may be defining the value of this timeout, but it could be
> > > > > > called only
> > > > > > when zerocopy is active.
> > > > >
> > > > > Maybe we need to check completions at the end of each iteration of the
> > > > > migration dirtypage loop ?
> > > >
> > > > Sorry, I am really new to this, and I still couldn't understand why would we
> > > > need to check at the end of each iteration, instead of doing a full check at the
> > > > end.
> > >
> > > The end of each iteration is an implicit synchronization point in the
> > > current migration code.
> > >
> > > For example, we might do 2 iterations of migration pre-copy, and then
> > > switch to post-copy mode. If the data from those 2 iterations hasn't
> > > been sent at the point we switch to post-copy, that is a semantic
> > > change from current behaviour. I don't know if that will have an
> > > problematic effect on the migration process, or not. Checking the
> > > async completions at the end of each iteration though, would ensure
> > > the semantics similar to current semantics, reducing risk of unexpected
> > > problems.
> > >
> > 
> > What if we do the 'flush()' before we start post-copy, instead of after each
> > iteration? would that be enough?
> 
> Possibly, yes. This really need David G's input since he understands
> the code in way more detail than me.

Hmm I'm not entirely sure why we have the sync after each iteration;
the case I can think of is if we're doing async sending, we could have
two versions of the same page in flight (one from each iteration) -
you'd want those to get there in the right order.

Dave

> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


