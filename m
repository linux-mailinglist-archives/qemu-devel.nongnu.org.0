Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A19589444
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 00:05:27 +0200 (CEST)
Received: from localhost ([::1]:51848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJMUY-0003OK-Rd
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 18:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJMSh-0001zN-SG
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 18:03:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJMSe-0006AH-Kv
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 18:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659564207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sf9ToL4TJr/0tlGNowaYvNpS3s4+eOdqPwBsU1xnpdk=;
 b=Jzp2irnqxFMnoqIbGIwl21WnRPku8P1gtP+kfSohrzeme4gGbb9AwX1KV/p7z6g8msBCZp
 8gohc70vK5Ab2g81vlew8ghe2d1G/eLyl+NgjKaR9LWhXN7XMko6QVz1nE8uarGrcXrZuI
 otG0KEwXlS83vUGIa6dnUfw13r4xBLY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-fmfJUHg5MImo3z54yB_xiQ-1; Wed, 03 Aug 2022 18:03:26 -0400
X-MC-Unique: fmfJUHg5MImo3z54yB_xiQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 w5-20020a05640234c500b0043dda025648so5010076edc.8
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 15:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=sf9ToL4TJr/0tlGNowaYvNpS3s4+eOdqPwBsU1xnpdk=;
 b=ObBHUk5YgFrWZOe6ABn6EbVT4wWSjx3oRzP21/qwXjM3WvaL4SoLiHxlOnhwGdZNnc
 mBTf55QaQUCA7nh7z3MqdWkTeptjAik42W0RVuXoY0IB2Htby0vtODfi9pFU43MXZuob
 1q3HKLzkmx9QiUzaO6lD4R6ck4lMP+5+erB7ekMYXm8u+lwmNRknmgXxNnnX4yZSURrL
 fFtVPe1movAJa7/Dxtv91wkoKoX6annri6I0AZ5i6P4Rp2biQS9wA3vdwTqEquDtepgs
 lsOkDolg8egkj+6NPllBbFUJbOEIcZJ3HDwpQgVkxq8xAejMPqJbQwpY9kjL+eJm0wen
 kP3g==
X-Gm-Message-State: ACgBeo2TTmwj0C6u3B1M0536qPg5mYZA5JEMKpOOb/IkrjgXLc38VDAA
 62M+ZZjguA8aSXRqpE6lQFcX0quFSIpsGFJjeGlPxylmLZkhGzYQKpcA0XRH3kAqmgYLMQlb48o
 rEga44ybLQ/eZEo8=
X-Received: by 2002:a17:907:1dcc:b0:730:80c1:fc77 with SMTP id
 og12-20020a1709071dcc00b0073080c1fc77mr12545377ejc.414.1659564205409; 
 Wed, 03 Aug 2022 15:03:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7lE5JVwiKv4sD7IOWpx/q6dUPJH5JgEPcgIEE+0dQ4682H2+NZS9p9Is/MDIw9ICmy5gNOGA==
X-Received: by 2002:a17:907:1dcc:b0:730:80c1:fc77 with SMTP id
 og12-20020a1709071dcc00b0073080c1fc77mr12545367ejc.414.1659564205181; 
 Wed, 03 Aug 2022 15:03:25 -0700 (PDT)
Received: from redhat.com ([2.54.191.86]) by smtp.gmail.com with ESMTPSA id
 w7-20020aa7d287000000b0043bc19efc15sm9930848edq.28.2022.08.03.15.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 15:03:24 -0700 (PDT)
Date: Wed, 3 Aug 2022 18:03:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 9/9] hw/i386: pass RNG seed via setup_data entry
Message-ID: <20220803180115-mutt-send-email-mst@kernel.org>
References: <20220721163621.761513-10-pbonzini@redhat.com>
 <dae86884-6cfa-a428-374c-60c42900aade@intel.com>
 <Yukk0YOFgkPwcTzG@zx2c4.com>
 <a3ddd211-a569-4348-c3bb-2ff509fd6ccf@intel.com>
 <Yuk9a0v+CNnzAX37@zx2c4.com>
 <CAHmME9qDNmX7TYio3TxgP_xFL1LGUoKrT6w=OG_1c688ZSdvKg@mail.gmail.com>
 <YupTaZlkyy1/9FUC@redhat.com> <Yup0FIOLLo0thP8u@zx2c4.com>
 <Yup5TG2kZs+TifEJ@zx2c4.com> <YuqraGAFyCibc1h6@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuqraGAFyCibc1h6@zx2c4.com>
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

On Wed, Aug 03, 2022 at 07:07:52PM +0200, Jason A. Donenfeld wrote:
> On Wed, Aug 03, 2022 at 03:34:04PM +0200, Jason A. Donenfeld wrote:
> > On Wed, Aug 03, 2022 at 03:11:48PM +0200, Jason A. Donenfeld wrote:
> > > Thanks for the info. Very helpful. Looking into it now.
> > 
> > So interestingly, this is not a new issue. If you pass any type of setup
> > data, OVMF appears to be doing something unusual and passing 0xffffffff
> > for all the entries, rather than the actual data. The reason this isn't
> > new is: try passing `-dtb any/dtb/at/all/from/anywhere` and you get the
> > same page fault, on all QEMU versions. The thing that passes the DTB is
> > the thing that passes the RNG seed. Same mechanism, same bug.
> > 
> > I'm looking into it...
> 
> Fixed with: https://lore.kernel.org/all/20220803170235.1312978-1-Jason@zx2c4.com/
> 
> Feel free to join into the discussion there. I CC'd you.
> 
> Jason

Hmm I don't think this patch will make it in 7.1 given the
timeframe. I suspect we should revert the patch for now.

Which is where you maybe begin to see why we generally
prefer doing it with features - one can then work around
bugs by turning the feature on and off.

-- 
MST


