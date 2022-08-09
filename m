Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047F158DA19
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 16:11:06 +0200 (CEST)
Received: from localhost ([::1]:53320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLPwk-0008IW-PR
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 10:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oLPu8-0006iV-01
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 10:08:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oLPtu-0007Gi-SF
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 10:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660054076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lrKZYmnWUxzeShUKgQKXDr1WtsqUMg/WhYfT8esF3Oo=;
 b=IOWVG1+eSDytTzBChm6RT2gvw9Ikm+OIAsdR2ol4ccbXjeDUaNpkRbugMJjx8vAzDLroVB
 SxS3ntDX54FSHHFzgKV19qx972HLjsRq8hh4AWuzoXc9mXBJNftzoJIRyYtqXvlmrfhIuF
 JdRwCyCJVuP9gFnY+E6UY/TL4ejHh1w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-KnyXG8vbM-a949OzXtIAgQ-1; Tue, 09 Aug 2022 10:07:53 -0400
X-MC-Unique: KnyXG8vbM-a949OzXtIAgQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 c6-20020adfa706000000b00222c3caa23eso1106246wrd.15
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 07:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=lrKZYmnWUxzeShUKgQKXDr1WtsqUMg/WhYfT8esF3Oo=;
 b=3O+6bdrrlvhR3Ck/L8KsFY+k9dbgqRxpKG2PQyDgA5Hg+djwksMTeclVSK0/3+D0fF
 XrOauh/vVVbUHQxgsxqCVuTirP0iNFYXWQaHKoaig8jrBXohPWjA2PfpB1/pjm4nLN+S
 Wdp8P5dZWR06P1kr8xDohz+Oef/U4Royrdf8LwwtkKxCU7HpO6LpuYQe/p06bd/mqoBN
 b6Bjw6q9Kqq8TEZycWed1dPoVU0MKCYfLxtApsOuCYgP8k6coVxe35Fx8SrVOTYaktYL
 ORI2/SjUmqKEaWoLJRWgWUZOaYsx0adetHLnbehhLvX02DTuRWC0QWdZUteTTiypNJ3I
 +AXw==
X-Gm-Message-State: ACgBeo3+9rsGcIp7X5KFPgiEPypOrkNLhX67QMUlEwOm94xpiQel4Kmt
 r6seZgwAIO0jI6mDRi2cKdMmd/JAG2Nqn+33kLbZrHFO55x5EnyMJxToDqoV2/LmFp18/ARdC17
 rWbMQvEU529evIzc=
X-Received: by 2002:a05:6000:a1a:b0:21f:10a3:924 with SMTP id
 co26-20020a0560000a1a00b0021f10a30924mr14856901wrb.650.1660054070541; 
 Tue, 09 Aug 2022 07:07:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7LXemJ2SoOuxnr52sK/fid1JNs4wiJsQT0kAmh9b8CClPePmSSEvmcaFugSb864/KrZN00kQ==
X-Received: by 2002:a05:6000:a1a:b0:21f:10a3:924 with SMTP id
 co26-20020a0560000a1a00b0021f10a30924mr14856877wrb.650.1660054070279; 
 Tue, 09 Aug 2022 07:07:50 -0700 (PDT)
Received: from redhat.com ([2.52.152.113]) by smtp.gmail.com with ESMTPSA id
 f6-20020a1c6a06000000b003a5a47d1226sm699449wmc.42.2022.08.09.07.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 07:07:48 -0700 (PDT)
Date: Tue, 9 Aug 2022 10:07:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 Laszlo Ersek <lersek@redhat.com>, linux-efi@vger.kernel.org
Subject: Re: [PATCH v3] hw/i386: place setup_data at fixed place in memory
Message-ID: <20220809100724-mutt-send-email-mst@kernel.org>
References: <YuxOgtykRQb1HU3e@zx2c4.com>
 <20220804230411.17720-1-Jason@zx2c4.com>
 <40fdfb11-1e40-a36a-d3a4-fcbef546a78a@redhat.com>
 <Yu0RX2b+e9BpGsJ6@zx2c4.com> <YvJQU0vS3sKDNPWn@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvJQU0vS3sKDNPWn@zx2c4.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Aug 09, 2022 at 02:17:23PM +0200, Jason A. Donenfeld wrote:
> Hey Paolo,
> 
> On Fri, Aug 05, 2022 at 02:47:27PM +0200, Jason A. Donenfeld wrote:
> > Hi Paolo,
> > 
> > On Fri, Aug 05, 2022 at 10:10:02AM +0200, Paolo Bonzini wrote:
> > > On 8/5/22 01:04, Jason A. Donenfeld wrote:
> > > > +    /* Nothing else uses this part of the hardware mapped region */
> > > > +    setup_data_base = 0xfffff - 0x1000;
> > > 
> > > Isn't this where the BIOS lives?  I don't think this works.
> > 
> > That's the segment dedicated to ROM and hardware mapped addresses. So
> > that's a place to put ROM material. No actual software will use it.
> > 
> > Jason
> 
> Unless I've misread the thread, I don't think there are any remaining
> objections, right? Can we try merging this and seeing if it fixes the
> issue for good?
> 
> Jason

Laszlo commented here:
https://lore.kernel.org/r/fa0601e4-acf5-0ce8-9277-4d90d046b53e%40redhat.com

-- 
MST


