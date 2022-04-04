Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652A54F1990
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 19:13:51 +0200 (CEST)
Received: from localhost ([::1]:55262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbQH0-0002XI-7J
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 13:13:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nbQF8-0001h7-SF
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 13:11:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nbQF5-0005OS-Oa
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 13:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649092310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/EDA1Y+rFxk36cbuWJP2RqZP8PcCJBr6HHXrk7V5R4Y=;
 b=Ghn5UmeH3MVix0DL/Ti4P7gU9CtSgfgv7UdOvmn1vc65qfwvUq3KW9FMnf7gi7b19JT+B2
 qUDqDsXfh/AR8qFBK/RM1+7qp+YlSvLdUcPUSFhbdH5gKBxIO8+UylJ6PD8egQVdJdU6MK
 LScO5xIWazd+NICJ7/E4Pc0FNLI9kp8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-D6EOWmI7MMG86ZULMuTrzQ-1; Mon, 04 Apr 2022 13:11:49 -0400
X-MC-Unique: D6EOWmI7MMG86ZULMuTrzQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 189-20020a1c02c6000000b0038e6c4c6472so2981360wmc.1
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 10:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=/EDA1Y+rFxk36cbuWJP2RqZP8PcCJBr6HHXrk7V5R4Y=;
 b=c50so5GmXSI8jhzmeRVnvsaxGImckqZn1fC8VNhWFJuww8qzQjiotLcLlP5XwQtTPa
 mHXvczeIY5/PYiDjMAPXOsP7yeIQX/fu0cfG0GjgmforK0P3tl2s79B/mlyndwOO4/Ei
 8C7omuNPYkduSyQly+GS1HrYYFlK07BhLzBqBnbMwI8CXZOZstTDKZqWRCOCB7lmeM5/
 SbRy2pRYQ0Eba6U8f4ftfxsDUqC4K/VNVybvtCwI4P+VqAbPMfQ4DyzLV8Wc8DoOSZmc
 YI/kkVfF+2rRlZp2upzBs/w0oCR00WH9KVe/ADRQSHOeX7ADN+mYJG7ZB3jpBh0Seo5b
 zRlA==
X-Gm-Message-State: AOAM533N9vZDWBx7FwCcQ0GnMFbW3ah5Kwn9CboDC2n641eHUlxwwiSu
 bvGE8ZL88WF8RDb7zRQ7tWuyLBjKsYg/DU4s1b1PVdGEFHvIhwItsCPvDcVgt6gMQTK5mrQG/09
 n4jOpoQhzX5tP7aQ=
X-Received: by 2002:a05:600c:1c0e:b0:38c:ae37:c1d2 with SMTP id
 j14-20020a05600c1c0e00b0038cae37c1d2mr95620wms.205.1649092308079; 
 Mon, 04 Apr 2022 10:11:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1yuNxXJDc+239uG/G2qSHghLwLPYA3GyipWMuek7wp6s0t51nO2TmXJD+dnXVoVW1R0b5Mg==
X-Received: by 2002:a05:600c:1c0e:b0:38c:ae37:c1d2 with SMTP id
 j14-20020a05600c1c0e00b0038cae37c1d2mr95598wms.205.1649092307798; 
 Mon, 04 Apr 2022 10:11:47 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 61-20020adf8043000000b00205e1d92a41sm10433954wrk.74.2022.04.04.10.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 10:11:47 -0700 (PDT)
Date: Mon, 4 Apr 2022 18:11:44 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH] multifd: Copy pages before compressing them with zlib
Message-ID: <Yksm0KLPHHQ4lZ7K@work-vm>
References: <20220329152123.493731-1-iii@linux.ibm.com>
 <YkrUbt8Z+N5uenDT@work-vm>
 <76fd645d423ab0e835ef9de37aaeb9d857eae4e8.camel@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <76fd645d423ab0e835ef9de37aaeb9d857eae4e8.camel@linux.ibm.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, jinpu.wang@ionos.com,
 s.reiter@proxmox.com, Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 peterx@redhat.com, qemu-s390x@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philippe.mathieu.daude@gmail.com>,
 hreitz@redhat.com, f.ebner@proxmox.com,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Ilya Leoshkevich (iii@linux.ibm.com) wrote:
> On Mon, 2022-04-04 at 12:20 +0100, Dr. David Alan Gilbert wrote:
> > * Ilya Leoshkevich (iii@linux.ibm.com) wrote:
> > > zlib_send_prepare() compresses pages of a running VM. zlib does not
> > > make any thread-safety guarantees with respect to changing
> > > deflate()
> > > input concurrently with deflate() [1].
> > > 
> > > One can observe problems due to this with the IBM zEnterprise Data
> > > Compression accelerator capable zlib [2]. When the hardware
> > > acceleration is enabled, migration/multifd/tcp/zlib test fails
> > > intermittently [3] due to sliding window corruption.
> > > 
> > > At the moment this problem occurs only with this accelerator, since
> > > its architecture explicitly discourages concurrent accesses [4]:
> > > 
> > >     Page 26-57, "Other Conditions":
> > > 
> > >     As observed by this CPU, other CPUs, and channel
> > >     programs, references to the parameter block, first,
> > >     second, and third operands may be multiple-access
> > >     references, accesses to these storage locations are
> > >     not necessarily block-concurrent, and the sequence
> > >     of these accesses or references is undefined.
> > > 
> > > Still, it might affect other platforms due to a future zlib update.
> > > Therefore, copy the page being compressed into a private buffer
> > > before
> > > passing it to zlib.
> > 
> > While this might work around the problem; your explanation doesn't
> > quite
> > fit with the symptoms; or if they do, then you have a separate
> > problem.
> > 
> > The live migration code relies on the fact that the source is running
> > and changing it's memory as the data is transmitted; however it also
> > relies on the fact that if this happens the 'dirty' flag is set
> > _after_
> > those changes causing another round of migration and retransmission
> > of
> > the (now stable) data.
> > 
> > We don't expect the load of the data for the first page write to be
> > correct, consistent etc - we just rely on the retransmission to be
> > correct when the page is stable.
> > 
> > If your compressor hardware is doing something undefined during the
> > first case that's fine; as long as it works fine in the stable case
> > where the data isn't changing.
> > 
> > Adding the extra copy is going to slow everyone else dowmn; and since
> > there's plenty of pthread lockingin those multifd I'm expecting them
> > to get reasonably defined ordering and thus be safe from multi
> > threading
> > problems (please correct us if we've actually done something wrong in
> > the locking there).
> > 
> > IMHO your accelerator when called from a zlib call needs to behave
> > the same as if it was the software implementation; i.e. if we've got
> > pthread calls in there that are enforcing ordering then that should
> > be
> > fine; your accelerator implementation needs to add a barrier of some
> > type or an internal copy, not penalise everyone else.
> > 
> > Dave
> 
> The problem with the accelerator is that during the first case the
> internal state might end up being corrupted (in particular: what goes
> into the deflate stream differs from what goes into the sliding
> window). This may affect the data integrity in the second case later
> on.

Hmm I hadn't expected the unpredictability to span multiple blocks.

> I've been trying to think what to do with that, and of course doing an
> internal copy is one option (a barrier won't suffice). However, I
> realized that zlib API as documented doesn't guarantee that it's safe
> to change input data concurrently with compression. On the other hand,
> today's zlib is implemented in a way that tolerates this.
> 
> So the open question for me is, whether we should honor zlib
> documentation (in which case, I would argue, QEMU needs to be changed)
> or say that the behavior of today's zlib implementation is more
> important (in which case accelerator code needs to change). I went with
> the former for now, but the latter is of course doable as well.

Well I think you're saying that the current docs don't specify and
thus assume that there's a constraint.

I think the right people to answer this is the zlib community; so
can you send a mail to zlib-devel and ask?

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


