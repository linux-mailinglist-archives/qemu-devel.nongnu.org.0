Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0401956742E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 18:26:26 +0200 (CEST)
Received: from localhost ([::1]:56956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8lNZ-0002Fo-34
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 12:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8lDs-00045e-Qk
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:16:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8lDq-0005sB-D5
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aJ7YtB6ic+oq+O09u3V4ROTFqm9rSiQBKaLUjFFI2D4=;
 b=NKpuAgkYulK8KZIDEgvAeYj5qFYmRbQnrQkdKeOk/qMDXP52RXZmsfalqvUpuoOHRnupfP
 eioiLSH/YPCUPwKV/sAd/5OIn7DMAdflLJdGC7N1ygbxFn69WjdYvmrau1u+ig7MymAVRg
 mM3NctcHKkmx3nfuS1VIFk+HfVWZytE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-uv6l55YcOnisYy8fV7_6LQ-1; Tue, 05 Jul 2022 12:16:20 -0400
X-MC-Unique: uv6l55YcOnisYy8fV7_6LQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 j16-20020adfa550000000b0021d63d200a8so1411499wrb.5
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 09:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aJ7YtB6ic+oq+O09u3V4ROTFqm9rSiQBKaLUjFFI2D4=;
 b=S4LHBPfjPmsouZd/qNpnwQRGYM6kB2NueIVvF8WsNaybhzpPrKv5eK/VpPURaKpyVR
 11RIU1pkKbHLWzQ3itpZ4NJ+f9H0SQM+I79ydF8pTB4ztRLbp1i17BsrrzFDJ316l2Rh
 TNEhf0xZizTdMNpZpYjwO2WM3gkMFFNOm5iek7bo7Me98GtTn+gtwHRC0fV7Xov1OeK5
 x/8SGxB8Co/XShejgpgw/qPD0Gra/Ppf9pz8B2pTOIlPNXunpCKnOJbJmlDq6oEUEjFH
 vyF8RSgDrsTXXT46BpvctMEj3+lZRE6geOKeBnQZNavjuSJd3Emzho3cviTNEcpcEJvZ
 YaXA==
X-Gm-Message-State: AJIora+aKodkp8rJWWU5T1vEmXj7lSHMLBqlakPlavOZ8FfrU13NuUC6
 wVMC0KRDHxc+P+LZ3FWz6MVvLTijIt2JjRD73hiwzlKFBpnIFvvaMWNBrKhex2SSvOo/RrVYCVG
 Ds5Zr4JStzYn+k3c=
X-Received: by 2002:a05:6000:2c6:b0:21b:ad25:9c1b with SMTP id
 o6-20020a05600002c600b0021bad259c1bmr34170289wry.391.1657037779381; 
 Tue, 05 Jul 2022 09:16:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tJ0+G8mp8c5RDl1A8b9Op/HvouDedMCPi2zKD3jbYjuLatViWx3cNJnTOpHMwmLRPYP1LAyQ==
X-Received: by 2002:a05:6000:2c6:b0:21b:ad25:9c1b with SMTP id
 o6-20020a05600002c600b0021bad259c1bmr34170262wry.391.1657037779089; 
 Tue, 05 Jul 2022 09:16:19 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 x11-20020adff0cb000000b0021b92171d28sm41180869wro.54.2022.07.05.09.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 09:16:18 -0700 (PDT)
Date: Tue, 5 Jul 2022 17:16:16 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH] multifd: Copy pages before compressing them with zlib
Message-ID: <YsRj0DMhs65WRqMP@work-vm>
References: <20220704164112.2890137-1-iii@linux.ibm.com>
 <CAFEAcA-PU-iXKRKd_0rYzyq3o4DZEbzU4OqJ=8qq+cxNA64O+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-PU-iXKRKd_0rYzyq3o4DZEbzU4OqJ=8qq+cxNA64O+w@mail.gmail.com>
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

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Mon, 4 Jul 2022 at 17:43, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> >
> > zlib_send_prepare() compresses pages of a running VM. zlib does not
> > make any thread-safety guarantees with respect to changing deflate()
> > input concurrently with deflate() [1].
> >
> > One can observe problems due to this with the IBM zEnterprise Data
> > Compression accelerator capable zlib [2]. When the hardware
> > acceleration is enabled, migration/multifd/tcp/plain/zlib test fails
> > intermittently [3] due to sliding window corruption. The accelerator's
> > architecture explicitly discourages concurrent accesses [4]:
> >
> >     Page 26-57, "Other Conditions":
> >
> >     As observed by this CPU, other CPUs, and channel
> >     programs, references to the parameter block, first,
> >     second, and third operands may be multiple-access
> >     references, accesses to these storage locations are
> >     not necessarily block-concurrent, and the sequence
> >     of these accesses or references is undefined.
> >
> > Mark Adler pointed out that vanilla zlib performs double fetches under
> > certain circumstances as well [5], therefore we need to copy data
> > before passing it to deflate().
> >
> > [1] https://zlib.net/manual.html
> > [2] https://github.com/madler/zlib/pull/410
> > [3] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03988.html
> > [4] http://publibfp.dhe.ibm.com/epubs/pdf/a227832c.pdf
> > [5] https://gitlab.com/qemu-project/qemu/-/issues/1099
> 
> Is this [5] the wrong link? It's to our issue tracker, not zlib's
> or a zlib mailing list thread, and it doesn't contain any messages
> from Mark Adler.

Looking at Mark's message, I'm not seeing that it was cc'd to the lists.
I did however ask him to update zlib's docs to describe the requirement.

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


