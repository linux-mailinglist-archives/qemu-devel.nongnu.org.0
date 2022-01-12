Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5636648C276
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 11:44:13 +0100 (CET)
Received: from localhost ([::1]:40970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7b6y-0001nW-G4
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 05:44:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n7b5o-00016l-Ft
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:43:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n7b5n-00051H-1j
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641984178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oKU/BTke1xR16jZBEHjMvFoxtrKtCTktYxQPJNbmt2o=;
 b=SBSsDZ25C00z6fIZEdMUiqEHU2uC0c9oF73CVpleYG2RJR5VmqRVJIN8UydXftga+fHxfk
 tyW1NocM5HV67xVRhc8xaca/3AYxnTNf8HcAX1oJzwC9dRVbEPp4h9u2ORQ6Gzy0aWshli
 XTvnXCRPDsBi1TTIa+h67wSaxfoKVfc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-IMPA_gXFP5iFIEvLCUxteA-1; Wed, 12 Jan 2022 05:42:57 -0500
X-MC-Unique: IMPA_gXFP5iFIEvLCUxteA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v1-20020adfc5c1000000b001a37fd2fa2dso363752wrg.22
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 02:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oKU/BTke1xR16jZBEHjMvFoxtrKtCTktYxQPJNbmt2o=;
 b=n5QIDfJc2N38x7L7KcBcaY9rqjozwKSeM8LiRmfaoiZG3AMpUQmTV+ipwNOdMSJSdO
 L+b03+Htfl59o87yWWo4xkc1LxbqikZiVRqKeVLlsJSRLxsosEbLOaPMFdQKBGOOQPBi
 umBrze5UqqrCwlPYxso1B3plDUg26mIylIc3IytRm3XkPkZegKEy31LrKT4iGSmk7gli
 DUtQSxroZHE2uqgbrlR/ORt4iwGXJDqcvf5WU3qUsllXL97jV07Rpd7xfV4a//u7D2Wt
 TSN4XqrFyJmoDdcciNr0R2D35IqWh84D71CBkS1I4Fk8RWhASw3Ir/owrRnzk9wTKYei
 tZow==
X-Gm-Message-State: AOAM532sV8Qo7lp0tmtwCjW8r71/WKmWR/SDzQypzVK4MwHvjHAoq3kO
 grURiBXJI8IYwfmVFZT57yycq87oPvUyvLbbcAZ0oLuzc1oKf35GKlDCuouUs7dPaAtNvcbJCKp
 JuiEIGmNAToxCzxg=
X-Received: by 2002:adf:f90c:: with SMTP id b12mr7576694wrr.123.1641984176343; 
 Wed, 12 Jan 2022 02:42:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfhVfe7q3oHQf+TIHJGyCi/vEfCcGHRPcb9OrH5bmZqD69oJ78c8EAT9ecEE5csO9s8Adauw==
X-Received: by 2002:adf:f90c:: with SMTP id b12mr7576681wrr.123.1641984176146; 
 Wed, 12 Jan 2022 02:42:56 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id bh26sm5050548wmb.3.2022.01.12.02.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 02:42:55 -0800 (PST)
Date: Wed, 12 Jan 2022 10:42:53 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] migration: Add canary to VMSTATE_END_OF_LIST
Message-ID: <Yd6wrYdzzT/XsSSK@work-vm>
References: <20220112102345.79395-1-dgilbert@redhat.com>
 <CAFEAcA9b9NtkyWY2aCUpOvm2J5uRVt9qUPj6gPk3MFtkTh6ceQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9b9NtkyWY2aCUpOvm2J5uRVt9qUPj6gPk3MFtkTh6ceQ@mail.gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lsoaresp@redhat.com, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Wed, 12 Jan 2022 at 10:24, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > We fairly regularly forget VMSTATE_END_OF_LIST markers off descriptions;
> > given that the current check is only for ->name being NULL, sometimes
> > we get unlucky and the code apparently works and no one spots the error.
> >
> > Explicitly add a flag, VMS_END that should be set, and assert it is
> > set during the traversal.
> 
> Does 'make check' definitely do the traversal for all vmstate
> structs, or do we need to add a "sanity check them all on startup"
> bit of test code ?

Oh I doubt it does; some vmsd's are conditional on guest state, many are
only on particular machine types.

I think the closest we have to being able to walk the tree, is
--dump-vmstate - although you need to call that for each machine type.
(I forgot to add the canary check in the dump-vmstate code, I'll fix
that).

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


