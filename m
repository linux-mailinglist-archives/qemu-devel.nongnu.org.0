Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612735674E8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 18:58:47 +0200 (CEST)
Received: from localhost ([::1]:60466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8lsq-0002sE-Ih
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 12:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8lUK-0006MO-Ih
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:33:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8lUG-0000Du-Kj
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657038799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4lQgGvYp+7tNYJdz6C5F4PNyvpPTjHkMRPJv7OKkIc=;
 b=BFN4siBWaByiieCUkNNcDqkox8rv0L1APkYFsuodm2zMKM71NHc5LI5mtG1DV/JPXFBOUa
 OwaY0/o48PcEVu7zjxphvrzbKqkYJdx43eXM18qaZZR/ASHQfNSNEQEV8tT+ayzvHUuE7X
 Scs2hDkmFQbMqOTrkjOJsd1ySgeLH0Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-xGgplD3dNmauJnhoAlUdsw-1; Tue, 05 Jul 2022 12:33:18 -0400
X-MC-Unique: xGgplD3dNmauJnhoAlUdsw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r128-20020a1c4486000000b003a2b44d876aso2275351wma.2
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 09:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=z4lQgGvYp+7tNYJdz6C5F4PNyvpPTjHkMRPJv7OKkIc=;
 b=lj+uEHJDzF2t9SlTtPU3EDZHPmw0Nudx16RK67sXzkX3GGw96NmOibJeQb7Vkhs0tM
 SJw4OYiq782XDJCFr+iB5B7jQNq2G7FDAGibx2xwJKJI7q08I39M9ukExzWg/zCAymk6
 Vox9TPxOpgp1oj6BLk88dz8+pTBkK5s7Kv6LLbnpHrNQZa3qMLxE4zID4pwyiRTLgBvq
 sqb8qOSQfuHT/US7NClgURrHAENyvs0Vkj9FQ2MQyKo5ggwkspmhR3eMkQsgc+Mge5ba
 u3RGpnICwzNkN0IQdzfkVlPcSZnnGJFLvY70T67boYw77rOYW1I7UkLa9259QefSEPpY
 RmQQ==
X-Gm-Message-State: AJIora80i/zOZGjOa5pp3sv7/fR7SvYaXGpyTyFJ1pJjK65KBFgCkwG8
 dcgrD8tWply5PqdeN30lUY4xlCwFyDh052OEaIh+2hDtj16RNQeLWsqnyXYXTIYnsSlYBbYZfDg
 q6333StyR7p6Vu7I=
X-Received: by 2002:a5d:4b05:0:b0:21d:79fb:88d5 with SMTP id
 v5-20020a5d4b05000000b0021d79fb88d5mr463881wrq.54.1657038797009; 
 Tue, 05 Jul 2022 09:33:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u/Htg/XoDbUlWgRBxQTZEypTYi+tjNygqFW9ocZuaWBtsb3TOe1ULoNE/3uQCUgUejh5X8fg==
X-Received: by 2002:a5d:4b05:0:b0:21d:79fb:88d5 with SMTP id
 v5-20020a5d4b05000000b0021d79fb88d5mr463851wrq.54.1657038796743; 
 Tue, 05 Jul 2022 09:33:16 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 f190-20020a1c38c7000000b0039c5328ad92sm19761189wma.41.2022.07.05.09.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 09:33:16 -0700 (PDT)
Date: Tue, 5 Jul 2022 17:33:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>, zlib@madler.net
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] multifd: Copy pages before compressing them with zlib
Message-ID: <YsRnyRQg7TqBjW7j@work-vm>
References: <20220704164112.2890137-1-iii@linux.ibm.com>
 <CAFEAcA-PU-iXKRKd_0rYzyq3o4DZEbzU4OqJ=8qq+cxNA64O+w@mail.gmail.com>
 <YsRj0DMhs65WRqMP@work-vm>
 <43b4a7ce-28d1-3f1e-96cd-273dec0e4bcb@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43b4a7ce-28d1-3f1e-96cd-273dec0e4bcb@de.ibm.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Christian Borntraeger (borntraeger@de.ibm.com) wrote:
> Am 05.07.22 um 18:16 schrieb Dr. David Alan Gilbert:
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > On Mon, 4 Jul 2022 at 17:43, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> > > > 
> > > > zlib_send_prepare() compresses pages of a running VM. zlib does not
> > > > make any thread-safety guarantees with respect to changing deflate()
> > > > input concurrently with deflate() [1].
> > > > 
> > > > One can observe problems due to this with the IBM zEnterprise Data
> > > > Compression accelerator capable zlib [2]. When the hardware
> > > > acceleration is enabled, migration/multifd/tcp/plain/zlib test fails
> > > > intermittently [3] due to sliding window corruption. The accelerator's
> > > > architecture explicitly discourages concurrent accesses [4]:
> > > > 
> > > >      Page 26-57, "Other Conditions":
> > > > 
> > > >      As observed by this CPU, other CPUs, and channel
> > > >      programs, references to the parameter block, first,
> > > >      second, and third operands may be multiple-access
> > > >      references, accesses to these storage locations are
> > > >      not necessarily block-concurrent, and the sequence
> > > >      of these accesses or references is undefined.
> > > > 
> > > > Mark Adler pointed out that vanilla zlib performs double fetches under
> > > > certain circumstances as well [5], therefore we need to copy data
> > > > before passing it to deflate().
> > > > 
> > > > [1] https://zlib.net/manual.html
> > > > [2] https://github.com/madler/zlib/pull/410
> > > > [3] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03988.html
> > > > [4] http://publibfp.dhe.ibm.com/epubs/pdf/a227832c.pdf
> > > > [5] https://gitlab.com/qemu-project/qemu/-/issues/1099
> > > 
> > > Is this [5] the wrong link? It's to our issue tracker, not zlib's
> > > or a zlib mailing list thread, and it doesn't contain any messages
> > > from Mark Adler.
> > 
> > Looking at Mark's message, I'm not seeing that it was cc'd to the lists.
> > I did however ask him to update zlib's docs to describe the requirement.
> 
> 
> Can you maybe forward the message here?

Lets see, it looks OK from the content, here's a copy of my reply with
the thread in it.  I've add Mark to the cc here so he knows.

Dave

<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
* Mark Adler (zlib@madler.net) wrote:
> Dave,
> 
> d), which should also result in an invalid check value (CRC-32 or Adler-32). I suppose you could call that b).
> 
> To get c), the input data would need to be read exactly once. However there is a case in deflate when writing a stored block where the input is accessed twice — once to copy to the output, and then a second time to fill in the sliding window. If the data changes between those two, then the sliding window does not reflect the data written, which can propagate to incorrect matches downstream of the modified data.
> 
> That is the only place I see that. The impact would usually be c), but if you are trying to compress incompressible data followed by compressible data, you will have stored blocks followed by dynamic blocks with matches to the incorrect data. Your testing would likely not expose that. (I tried to compile the linked test, but went down a rat hole to find include files and gave up.)

OK - thanks for your clarification!
I've created:
  https://gitlab.com/qemu-project/qemu/-/issues/1099

as a reminder we need to fix this in qemu somewhere.

Could you please add a note to the zlib docs somewhere to make this
explicit.

Thanks again,

Dave

> Mark
> 
> 
> > On Jun 30, 2022, at 9:26 AM, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> > 
> > * Mark Adler (zlib@madler.net <mailto:zlib@madler.net>) wrote:
> >> Ilya,
> >> 
> >> What exactly do you mean by “concurrently”? What is an example of this?
> > 
> > In qemu's live migration we have a thread that shuffles the contents of
> > guest memory out over the network. The guest is still
> > running at the time and changing the contents of the memory we're
> > saving.
> > Fortunately we keep a 'modified' flag so that if the guest does modify
> > it while we're saving, we know about it and will send the block again.
> > 
> > Zlib (and zstd) have recently been forcibly inserted into this; so zlib
> > may be compressing a page of memory that changes.
> > 
> >> If you mean modifying the data provided to deflate() before deflate() has returned, then that is certainly not safe.
> > 
> > So a question is what does 'not safe' mean:
> > a) It explodes and segs
> > b) It produces an invalid stream
> > c) It produces a valid stream but the data for the modified block may
> > be garbage
> > d) It produces a valid stream but the data for the modified block and
> > other blocks may be garbage.
> > 
> > The qemu live migration code is happy with (c) because it'll retransmit
> > a stable block later. So far with the software zlib libraries we've
> > seen that be fine; I think Ilya is finding something like (b) or (d) on
> > their compression hardware.
> > 
> > Dave
> > 
> >> 
> >> Mark
> >> 
> >> 
> >>> On Jun 22, 2022, at 2:04 AM, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> >>> 
> >>> [resending with a smaller cc: list in order to pass the
> >>> zlib-devel mailing list moderation process]
> >>> 
> >>> Hello zlib developers,
> >>> 
> >>> I've been investigating a problem in the QEMU test suite on IBM Z [1]
> >>> [2] in connection with the IBM Z compression accelerator patch [3].
> >>> 
> >>> The problem is that a QEMU thread compresses data that is being
> >>> modified by another QEMU thread. zlib manual [4] does not state that
> >>> this is safe, however, the current stable zlib in fact tolerates it.
> >>> 
> >>> The accelerator, however, does not: not only what it compresses ends up
> >>> being unpredictable - QEMU actually resolves this just fine -
> >>> but the accelerator's internal state also ends up being corrupted.
> >>> 
> >>> I have a design question in connection to this: does zlib guarantee
> >>> that modifying deflate() input concurrently with deflate() is safe?
> >>> Or does it reserve the right to change this in the future versions?
> >>> 
> >>> Cc:ing zlib-ng folks for their opinion as well.
> >>> 
> >>> [1] https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg06841.html
> >>> [2] https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg00329.html
> >>> [3] https://github.com/madler/zlib/pull/410
> >>> [4] https://zlib.net/manual.html
> >>> 
> >>> Best regards,
> >>> Ilya
> >> 
> > -- 
> > Dr. David Alan Gilbert / dgilbert@redhat.com <mailto:dgilbert@redhat.com> / Manchester, UK
> 
<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


