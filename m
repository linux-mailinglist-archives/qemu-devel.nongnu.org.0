Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ECE3BABAE
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 08:30:59 +0200 (CEST)
Received: from localhost ([::1]:57870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzvec-0004V4-9V
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 02:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzvdH-0003be-UB
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 02:29:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzvdE-0000Mt-5F
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 02:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625380170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7oCcjemD2Y1q41LsNnHS9lSWDim7ojG5makW3W+u+Dg=;
 b=M0sNzpiXfLHbm15nJImin1qlRx7ehBbj21IZfkiGIQCuSF8UR2khithTOAScFKQ/h1GnE7
 1Y2nhR2Z8+hbYsiSGtXnpybSWQb6axm98P8zTTihVn1K5jYPgVMSBalresay99fgcy2QzW
 HD+x0deXFFPhApcFq/NG90da3lLuINQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-23H_we75O-KCHT9bDHonoQ-1; Sun, 04 Jul 2021 02:29:28 -0400
X-MC-Unique: 23H_we75O-KCHT9bDHonoQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 t82-20020a1cc3550000b02901ee1ed24f94so8095819wmf.9
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 23:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7oCcjemD2Y1q41LsNnHS9lSWDim7ojG5makW3W+u+Dg=;
 b=k7XzjUhHknWzOHnqMmx+ArdDm1UgOzNiEoeQhbHDbt/nbYycQ/3D2YBtCw2r3cfn+r
 OEATY56WPBF1d9uiddY75ZrH67eRZ2fWG5crO1WXzsUDaSvb/VpbxFUJ+MoA8j6jlQtN
 jlGJRvImyRzNMQUhC9EXzqsa49GFqlY1FybLAz5MFLFMhorROHkCd/+G/5kjZItkVIfU
 mFRs/F6Cned9z4McrE+ySmC1h66KYgJPiv0bcTG91PSYc72sgTu+OTx7bd6qes6/GflZ
 JWx5hVBSH7mS6DNYlwEuoELeR63LH9ZmvwnlkvT8WLfsAn3WLgQbRvevoT3Vc0HD7+x0
 4jmg==
X-Gm-Message-State: AOAM530lOcn4oVjN91wI4KbaUOGptNu/LxYC4YRqZ+JhZMLp9Gf/02Yn
 fb+edcGoKutAuWuIhUVU67pv8nJ9p3hjzND3JzISpme6ANbKmBhVC2i/GCyj0OGzZq0k351objp
 9wWoTVVYzqhkpXEs=
X-Received: by 2002:a05:6000:1a87:: with SMTP id
 f7mr8527004wry.172.1625380167144; 
 Sat, 03 Jul 2021 23:29:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa/2cfUd+6w3N1JRPhoqNNRHfPli4BpuBQO2e3fHZ8uPJ2Jwus9qEH7vCAPjCbvm5rbcUXeA==
X-Received: by 2002:a05:6000:1a87:: with SMTP id
 f7mr8526975wry.172.1625380166955; 
 Sat, 03 Jul 2021 23:29:26 -0700 (PDT)
Received: from redhat.com ([2.55.4.39])
 by smtp.gmail.com with ESMTPSA id x17sm10723829wrn.62.2021.07.03.23.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 23:29:26 -0700 (PDT)
Date: Sun, 4 Jul 2021 02:29:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH] x86: add SEV hashing to fw_cfg for kernel/initrd/cmdline
Message-ID: <20210704022842-mutt-send-email-mst@kernel.org>
References: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
 <20210703123406-mutt-send-email-mst@kernel.org>
 <0f36d5a0-c063-4ba7-ceca-f09d8f37fb3e@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <0f36d5a0-c063-4ba7-ceca-f09d8f37fb3e@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jul 04, 2021 at 09:16:59AM +0300, Dov Murik wrote:
> Hi Michael,
> 
> [+cc Connor, Dave]
> 
> On 03/07/2021 19:42, Michael S. Tsirkin wrote:
> > On Tue, May 25, 2021 at 06:59:31AM +0000, Dov Murik wrote:
> >> From: James Bottomley <jejb@linux.ibm.com>
> >>
> >> If the VM is using memory encryption and also specifies a kernel/initrd
> >> or appended command line, calculate the hashes and add them to the
> >> encrypted data.  For this to work, OVMF must support an encrypted area
> >> to place the data which is advertised via a special GUID in the OVMF
> >> reset table (if the GUID doesn't exist, the user isn't allowed to pass
> >> in the kernel/initrd/cmdline via the fw_cfg interface).
> > 
> > Sorry about asking basic questions so late in the game.
> 
> No worries. Please noice there's a newer version:
> 
> https://lore.kernel.org/qemu-devel/20210624102040.2015280-1-dovmurik@linux.ibm.com/
> 
> 
> > I'm a bit curious why this feature makes sense. If someone can play
> > with a Linux kernel command line isn't it pretty much game over security
> > wise? What protections does Linux have against malicious actors
> > manipulating the command line?
> > 
> 
> You're right -- if the host can modify the kernel command-line it's a game over.
> 
> This is why this patch (together with the corresponding OVMF patches; still
> under review) measures and verifies the content of the kernel blob and
> the initrd blob *and* the command-line blob.
> 
> Any modification/omission of any of them by the host will make the expected
> SEV PSP measurement invalid, which should then indicate to the Guest Owner that
> something is wrong with this guest.  At that point the Guest Owner should
> refuse to inject secrets into the guest (and also complain to the Cloud
> Service Provider).
> 
> -Dov

Got it, thanks!

-- 
MST


