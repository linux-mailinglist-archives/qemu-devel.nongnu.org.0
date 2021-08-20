Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13713F3509
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 22:18:21 +0200 (CEST)
Received: from localhost ([::1]:36000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHAy4-0001mw-Fw
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 16:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mHAws-00016h-3E
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 16:17:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mHAwp-0007P1-AX
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 16:17:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629490620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZXafrXKpsXL52RHRAnRO7PfHTpvEa9W/ps6B2Qf9VIY=;
 b=gVyJODfNDmwuu6vk3UpKktY0jykcwvqp3tX22QkhCUfYqG9AmBKLIHzz4faeZ1R8VXoibz
 h5xE919b61luqyC9XcKKXJV+9H/e0TSEUjZYKHBmMdL30Vxhds6Lww57xkEgM2uevpKVDO
 ePVUW78lggrhI7AxCV3kJ93U4WfMNjw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-Ya4BLkdANcCTNZ9PDCeFSg-1; Fri, 20 Aug 2021 16:16:57 -0400
X-MC-Unique: Ya4BLkdANcCTNZ9PDCeFSg-1
Received: by mail-qt1-f199.google.com with SMTP id
 m22-20020a05622a1196b029026549e62339so5451970qtk.1
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 13:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZXafrXKpsXL52RHRAnRO7PfHTpvEa9W/ps6B2Qf9VIY=;
 b=DxWnq2aLIdQoFuQd2SWDqfR46R5iMnS/aGOv/EUQ+ZoYHdhgxcsu6NfxRr7owDbixG
 HYrSWDOFayURqwNAsga0nVPFyzhmd2nQaobWARKblg+vMVuTKARob/j+8aZD2MfbFX5H
 xR5I49JL/gl32etH3FU18vWOBIvZEY5oLgjhHT3Tj5q3ECP2cWZxWz1EcI7O/lQVqESs
 EItA/rqtPJYUebmNi8/YLFeo2KNBHqXEsihlPmuonU1tWOF2BEu27Wu4dRveiXVRGe/w
 hSeWuD3YVXvexx9B6neEwrBnCom7n6KneZuzPJVw4czzsv5pBBF1gyMHTE/l1ZKhqOZL
 +arw==
X-Gm-Message-State: AOAM533deWKp34m3mkDTYme4qik0qz3arSmS51fJLY2qLijox1UUF363
 Rj8BtouJp9MFBG/AsvNrEwrJLIvTpaLoYgRMBVexFESa4w9Gp79Y1GQNfrjn3vegj2ExFSvZswV
 wg0C0Prp047nZrzA=
X-Received: by 2002:ac8:12c5:: with SMTP id b5mr8730619qtj.215.1629490617269; 
 Fri, 20 Aug 2021 13:16:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxz0QANn9Q/JPkpPGsYKZJW9yK4KT8J9U+lNs5QRk3NljKhXM/MP1Sn/V46kHkDshvWJTRA0w==
X-Received: by 2002:ac8:12c5:: with SMTP id b5mr8730588qtj.215.1629490616981; 
 Fri, 20 Aug 2021 13:16:56 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id x83sm3736610qkb.118.2021.08.20.13.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 13:16:56 -0700 (PDT)
Date: Fri, 20 Aug 2021 16:16:54 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] memory: Have 'info mtree' remove duplicated Address
 Space information
Message-ID: <YSANtgAah4THaxub@t490s>
References: <20210820105435.3034561-1-philmd@redhat.com>
 <73fa7b2f-fba2-6af0-5cf4-2066d7f625e5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <73fa7b2f-fba2-6af0-5cf4-2066d7f625e5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Phil,

On Fri, Aug 20, 2021 at 12:58:05PM +0200, Philippe Mathieu-Daudé wrote:
> >   (qemu) info mtree
> >   address-space: I/O
> >     0000000000000000-000000000000ffff (prio 0, i/o): io
> > 
> >   address-space shared 9 times:
> >     - cpu-memory-0
> >     - cpu-memory-1
> >     - cpu-memory-2
> >     - cpu-memory-3
> >     - cpu-secure-memory-0
> >     - cpu-secure-memory-1
> >     - cpu-secure-memory-2
> >     - cpu-secure-memory-3
> >     - memory

Do you think below would look better?

   address-space cpu-memory-0:
   address-space cpu-memory-1:
   address-space cpu-memory-3:
   ...
   address-space memory:
     [memory ranges]

"info mtree -f" has something similar:

FlatView #2
 AS "ich9-ahci", root: bus master container
 AS "vtd-root", root: vtd-00.0
 AS "virtio-blk-pci", root: bus master container
 AS "vtd-root", root: vtd-01.0
 AS "vtd-root", root: vtd-02.0
 AS "vtd-root", root: vtd-03.0
 AS "vtd-root", root: vtd-04.0
 AS "vtd-root", root: vtd-1f.0
 AS "vtd-root", root: vtd-1f.2
 AS "vtd-root", root: vtd-1f.3
 Root memory region: vtd-nodmar
   [memory ranges]

[...]

> > +struct AddressSpaceInfo {
> > +    MemoryRegionListHead *ml_head;
> > +    int counter;
> 
> Doh this field is unused :/

Looks good to me otherwise.

Thanks,

-- 
Peter Xu


