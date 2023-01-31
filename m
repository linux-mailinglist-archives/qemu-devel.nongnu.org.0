Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749726838A2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 22:29:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMyBG-00037O-Rl; Tue, 31 Jan 2023 16:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMyBE-00036r-Ke
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 16:28:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMyBD-0000ez-51
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 16:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675200458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+CqjXBFrkKGiIvADnRgkUMQEKICNEjfj1VLjg3fHwqg=;
 b=LMiByVE2oA6U98njw2DMGsA5qbQbhBmw9R4LJG70fuUruNIDAU/n2EWF2qHQ254gD4lMMR
 lKjmYNlR+aVGDwZC6qIY3kjP78sOQdS6I792E2XatiOuhoYaJOiXkl6PUpHwuYAf7HVGGR
 PXAsDaAnEBqhiaMPwaNQUyjlDMrbDWQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-Lx_oBvCANESYTGDTXqV5jA-1; Tue, 31 Jan 2023 16:27:36 -0500
X-MC-Unique: Lx_oBvCANESYTGDTXqV5jA-1
Received: by mail-wm1-f69.google.com with SMTP id
 bd21-20020a05600c1f1500b003dc5cb10dcfso3188549wmb.9
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 13:27:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+CqjXBFrkKGiIvADnRgkUMQEKICNEjfj1VLjg3fHwqg=;
 b=F/n0llJWky7whha8FOkMIfauE/auRMiOnZS4qIcT9jxBWrmHmZPDdP90KherFf3oSR
 z3wbAQmD95Yhzv6Oi2/gCxxlhTajRBtEyZD3zGaVgZEvCUlURKuosU6mGCY2vWv97QVh
 eUKx6nRf4u2hj+GlzkrnP/VG4oM7u/Ve2R8HJK7SXAILFnH4xXGon4li9m9ADyDcVOPs
 dOIYBI8QtumTPRnP0La/hT1ZV2syJfTRpGaPD2ggB0Tqj3VpxK17U0bauSgj2mf/+sHM
 rLFM/HabIZko36l+xXKVCWXkSqzpw+lgowptl6S4RuM2kR998eWGkTbRvlBTd9CALpJA
 9ptQ==
X-Gm-Message-State: AO0yUKXVK7iAbleqnuRAv8yntvTlwMUYvcdk4zhoiVZyyb5hemcb4fnL
 X+1UwT30Xqh30GqW2iODEy6CqUwthe9cWBdO63aOip/D4A6KxgE1epb0TEOxzmRbVbshB9qf6Sa
 EB9HDpRpRO+XccMY=
X-Received: by 2002:a1c:7205:0:b0:3dc:523c:229a with SMTP id
 n5-20020a1c7205000000b003dc523c229amr11250899wmc.7.1675200455235; 
 Tue, 31 Jan 2023 13:27:35 -0800 (PST)
X-Google-Smtp-Source: AK7set9UMxT+yubP/b/MsEytxGv2r1d/wtXo8WQXoBVBEKgqplizM3rKjtx64BAhPSYk050ZzN2r2w==
X-Received: by 2002:a1c:7205:0:b0:3dc:523c:229a with SMTP id
 n5-20020a1c7205000000b003dc523c229amr11250874wmc.7.1675200454909; 
 Tue, 31 Jan 2023 13:27:34 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 l11-20020a05600c2ccb00b003cf71b1f66csm19904802wmc.0.2023.01.31.13.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 13:27:34 -0800 (PST)
Date: Tue, 31 Jan 2023 16:27:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 x86@kernel.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 Eric Biggers <ebiggers@kernel.org>, Eric Biggers <ebiggers@google.com>,
 Mathias Krause <minipli@grsecurity.net>,
 Sergio Lopez <slp@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PULL 10/56] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <20230131162550-mutt-send-email-mst@kernel.org>
References: <20230130201810.11518-1-mst@redhat.com>
 <20230130201810.11518-11-mst@redhat.com>
 <Y9luXHaZXqYy+Rb4@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9luXHaZXqYy+Rb4@zx2c4.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 31, 2023 at 08:39:08PM +0100, Jason A. Donenfeld wrote:
> On Mon, Jan 30, 2023 at 03:19:59PM -0500, Michael S. Tsirkin wrote:
> > From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> > 
> > The setup_data links are appended to the compressed kernel image. Since
> > the kernel image is typically loaded at 0x100000, setup_data lives at
> > `0x100000 + compressed_size`, which does not get relocated during the
> > kernel's boot process.
> > 
> > The kernel typically decompresses the image starting at address
> > 0x1000000 (note: there's one more zero there than the compressed image
> > above). This usually is fine for most kernels.
> > 
> > However, if the compressed image is actually quite large, then
> > setup_data will live at a `0x100000 + compressed_size` that extends into
> > the decompressed zone at 0x1000000. In other words, if compressed_size
> > is larger than `0x1000000 - 0x100000`, then the decompression step will
> > clobber setup_data, resulting in crashes.
> > 
> > Visually, what happens now is that QEMU appends setup_data to the kernel
> > image:
> > 
> >           kernel image            setup_data
> >    |--------------------------||----------------|
> > 0x100000                  0x100000+l1     0x100000+l1+l2
> > 
> > The problem is that this decompresses to 0x1000000 (one more zero). So
> > if l1 is > (0x1000000-0x100000), then this winds up looking like:
> > 
> >           kernel image            setup_data
> >    |--------------------------||----------------|
> > 0x100000                  0x100000+l1     0x100000+l1+l2
> > 
> >                                  d e c o m p r e s s e d   k e r n e l
> >                      |-------------------------------------------------------------|
> >                 0x1000000                                                     0x1000000+l3
> > 
> > The decompressed kernel seemingly overwriting the compressed kernel
> > image isn't a problem, because that gets relocated to a higher address
> > early on in the boot process, at the end of startup_64. setup_data,
> > however, stays in the same place, since those links are self referential
> > and nothing fixes them up.  So the decompressed kernel clobbers it.
> > 
> > Fix this by appending setup_data to the cmdline blob rather than the
> > kernel image blob, which remains at a lower address that won't get
> > clobbered.
> > 
> > This could have been done by overwriting the initrd blob instead, but
> > that poses big difficulties, such as no longer being able to use memory
> > mapped files for initrd, hurting performance, and, more importantly, the
> > initrd address calculation is hard coded in qboot, and it always grows
> > down rather than up, which means lots of brittle semantics would have to
> > be changed around, incurring more complexity. In contrast, using cmdline
> > is simple and doesn't interfere with anything.
> > 
> > The microvm machine has a gross hack where it fiddles with fw_cfg data
> > after the fact. So this hack is updated to account for this appending,
> > by reserving some bytes.
> > 
> > Fixup-by: Michael S. Tsirkin <mst@redhat.com>
> > Cc: x86@kernel.org
> > Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> > Cc: H. Peter Anvin <hpa@zytor.com>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Eric Biggers <ebiggers@kernel.org>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > Message-Id: <20221230220725.618763-1-Jason@zx2c4.com>
> > Message-ID: <20230128061015-mutt-send-email-mst@kernel.org>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Tested-by: Eric Biggers <ebiggers@google.com>
> > Tested-by: Mathias Krause <minipli@grsecurity.net>
> 
> This one should wind up in the stable point release too. Dunno what the
> procedure for that is.
> 
> Jason

If you want that you need to include
    Cc: qemu-stable@nongnu.org
    Fixes: <hash> ("subject")

you can still reply to the original mail with this.

-- 
MST


