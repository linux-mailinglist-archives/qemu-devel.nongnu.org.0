Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A3E5C00CD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 17:11:02 +0200 (CEST)
Received: from localhost ([::1]:46658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob1NM-0006yz-33
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 11:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ob1I1-0002Ye-G9
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:05:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ob1Hk-0006yB-Gt
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663772711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i+iVFC+myaJEscTxF7fiAwXznaL6zDbolQynA64C11E=;
 b=FBfIOaNvgKf2kpA+sJGxN9XQPgmi8uZygE2VD4j95BXA+lUR6dl/gqikDebawDwnTjOK6n
 XL39H46kZOzd0uUoHlgiOKQcSSX6KUHgbTJLKLr88qciSpp8giLCa8UlyOt8eb6Jy+CK2G
 ZZy8Pagh9o+gx5/wYbDKnNT3Uaodr60=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-HQfS9NvFOC2Pryprad6yBw-1; Wed, 21 Sep 2022 11:05:10 -0400
X-MC-Unique: HQfS9NvFOC2Pryprad6yBw-1
Received: by mail-wm1-f70.google.com with SMTP id
 y20-20020a05600c365400b003b4d4ae666fso1733846wmq.4
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 08:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=i+iVFC+myaJEscTxF7fiAwXznaL6zDbolQynA64C11E=;
 b=cKSwWhCKR+4O/kSfBG5SOZ2sUYKyp9rT6y/qqcuTnCdic7t0FKKoLHtqEqmqHWAhMz
 xuGMO/Dwe3qT7dJytVhsYjsiRbMo5JU7DtUVuBJ552Ly0qh2KWs2GVWaylK/+95nwA2T
 cRyaeD4hAY9SEQNyyPfLmEZJGXkt+jkU0oanHq51dtgRyTYC2kpz3T/bhUVYV3lvVqwY
 eqBSTNEt1N7ASVLZKDEjqulmMBmKpVtKnTJqUqBeNRgBAzK1CaJF4puJQJODNXtN1Ppl
 lhyQuzmrt1VD6T/xRQULngBzG/rgWgNXrrOudr+cIi2UPxibAQADaK0+XSkTfsJ/Kf+H
 BlEQ==
X-Gm-Message-State: ACrzQf2D4jCAUU37GNoX6CVKQwrhdsb9r8+GJTJE2yPAQ6/MR6Fs7hSb
 AG3ZQUlsx0Er44YANj3Oynk1xaxKApoBXihCEL/eFvjxiFY2eS7LE9hCkv1NmfwJvScnk7o+kTH
 Yr57Goadc3Dhoqec=
X-Received: by 2002:a5d:64e4:0:b0:22a:4997:c13c with SMTP id
 g4-20020a5d64e4000000b0022a4997c13cmr18576442wri.621.1663772708342; 
 Wed, 21 Sep 2022 08:05:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6lFB0mFjx/31kUd6jWEDp7SRFzrD9rSo5vPTFOlW2+pJ+R6WOsZKOiHqljfbApg9ZyuQz6Ig==
X-Received: by 2002:a5d:64e4:0:b0:22a:4997:c13c with SMTP id
 g4-20020a5d64e4000000b0022a4997c13cmr18576411wri.621.1663772707969; 
 Wed, 21 Sep 2022 08:05:07 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 x2-20020a5d6b42000000b002286670bafasm2798308wrw.48.2022.09.21.08.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 08:05:07 -0700 (PDT)
Date: Wed, 21 Sep 2022 16:05:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: "Wang, Lei" <lei4.wang@intel.com>, paul.c.lai@intel.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org, robert.hu@intel.com,
 xiaoyao.li@intel.com, chenyi.qiang@intel.com
Subject: Re: [PATCH] i386: Add new CPU model SapphireRapids
Message-ID: <YysoIQEkgGRlZmfE@work-vm>
References: <20220812055751.14553-1-lei4.wang@intel.com>
 <Yysk/taT/eKR0Bp3@work-vm> <YysnZp+Jxt5wHLI+@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YysnZp+Jxt5wHLI+@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> On Wed, Sep 21, 2022 at 03:51:42PM +0100, Dr. David Alan Gilbert wrote:
> > * Wang, Lei (lei4.wang@intel.com) wrote:
> > > The new CPU model mostly inherits features from Icelake-Server, while
> > > adding new features:
> > >  - AMX (Advance Matrix eXtensions)
> > >  - Bus Lock Debug Exception
> > > and new instructions:
> > >  - AVX VNNI (Vector Neural Network Instruction):
> > >     - VPDPBUS: Multiply and Add Unsigned and Signed Bytes
> > >     - VPDPBUSDS: Multiply and Add Unsigned and Signed Bytes with Saturation
> > >     - VPDPWSSD: Multiply and Add Signed Word Integers
> > >     - VPDPWSSDS: Multiply and Add Signed Integers with Saturation
> > >  - FP16: Replicates existing AVX512 computational SP (FP32) instructions
> > >    using FP16 instead of FP32 for ~2X performance gain
> > >  - SERIALIZE: Provide software with a simple way to force the processor to
> > >    complete all modifications, faster, allowed in all privilege levels and
> > >    not causing an unconditional VM exit
> > >  - TSX Suspend Load Address Tracking: Allows programmers to choose which
> > >    memory accesses do not need to be tracked in the TSX read set
> > >  - AVX512_BF16: Vector Neural Network Instructions supporting BFLOAT16
> > >    inputs and conversion instructions from IEEE single precision
> > > 
> > > Features may be added in future versions:
> > >  - CET (virtualization support hasn't been merged)
> > > Instructions may be added in future versions:
> > >  - fast zero-length MOVSB (KVM doesn't support yet)
> > >  - fast short STOSB (KVM doesn't support yet)
> > >  - fast short CMPSB, SCASB (KVM doesn't support yet)
> > > 
> > > Signed-off-by: Wang, Lei <lei4.wang@intel.com>
> > > Reviewed-by: Robert Hoo <robert.hu@linux.intel.com>
> > 
> > Hi,
> >    What fills in the AMX tile and tmul information leafs
> > (0x1D, 0x1E)?
> >   In particular, how would we make sure when we migrate between two
> > generations of AMX/Tile/Tmul capable devices with different
> > register/palette/tmul limits that the migration is tied to the CPU type
> > correctly?
> >   Would you expect all devices called a 'SappireRapids' to have the same
> > sizes?
> 
> We shouldn't assume this will only be used on 'SappireRapids' host
> silicon. Thi named CPU model is likely to be used by a guest running
> on any host silicon generations that follow SappireRapids too.

Indeed, but I wanted to check the opposite question first; whether
all SappireRapids had the same sizes; I think you're asking the opposite
question.

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


