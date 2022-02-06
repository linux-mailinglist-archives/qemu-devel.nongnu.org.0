Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D664AAEBF
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:02:28 +0100 (CET)
Received: from localhost ([::1]:59666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGeNG-0002H3-6p
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:02:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdrq-0002cR-1X
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:29:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdrl-0002Lx-9N
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:29:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644139791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2P5WM6D8tx5DF433WLJkjj//h9SIwMnj8ZwIpC0moXI=;
 b=T9DQxVY1ewhISDlnWSLbkluv5pK4UPKJlzBPN3+NZQBQ+i3BLIJCIhxZZFlUkYFZFQ44Qk
 +VUqq0b9ZfoF1voPTgsDQLObQwofnS1wbJFaF4nealv2CU30v/5gCgaa3aeYvheq/811o5
 nAw12Kc8gZmDNXJQkvX/Pq/gNrklDVo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-CO3WWNbvOGu0MtEIPx04Ew-1; Sun, 06 Feb 2022 04:29:50 -0500
X-MC-Unique: CO3WWNbvOGu0MtEIPx04Ew-1
Received: by mail-wm1-f72.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so3933596wmj.5
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:29:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2P5WM6D8tx5DF433WLJkjj//h9SIwMnj8ZwIpC0moXI=;
 b=Jquf+V8/d8S47EqyqqYuiepuLZeqQ88Z4Pm/7VnmYZK5y/QyMc/jP0L+tPobQkA208
 eGy9eqxqLlNhegfhzBmB1N/PKR9YQGXMUZXLv7TSxaZKsTeoJzPNDHx/Ffc01Y+Ch2gX
 33oB++190/DG4e9aY626c8nEqqgFOxwJNTgHtTxw2//Pm7E8QFcPSGxQ+CAt7U7L8ANj
 VHpkADTD08b5B9DZbEtrvuRDroArNNyU5uk296/NOj5s/OtzBA2lGT6HrqCcRUwu/MvY
 h5FVn1BaNSZKqksfMu5K07eecFHKWYmVK86i+4wT+oG6DxQtGoaAp3Ripd6C+rHAvax5
 D9cQ==
X-Gm-Message-State: AOAM530fISVV95QO3OlCE0LsRiVsVoZEXo6sPQdDtVM8ry3FoOu2qVNu
 i2amtc81qlDfKNFVUSuRPtr8tsOfDrgdf65ajtAGDo+0qeOieWdUmcNtn/j7XqLY7S4nHcmfmuE
 xPpMtl/6fbCEEmeA=
X-Received: by 2002:adf:fa4b:: with SMTP id y11mr1252347wrr.221.1644139788892; 
 Sun, 06 Feb 2022 01:29:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnsudnLysSOaxl9z7ckx8Iwti0r3uj3lPmDzivSX8hP3xNQuw0aRUrhploQghIgvdTpeQrMQ==
X-Received: by 2002:adf:fa4b:: with SMTP id y11mr1252336wrr.221.1644139788649; 
 Sun, 06 Feb 2022 01:29:48 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id z5sm16825183wmp.10.2022.02.06.01.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:29:46 -0800 (PST)
Date: Sun, 6 Feb 2022 04:29:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/32] virtio,pc: features, cleanups, fixes
Message-ID: <20220206042826-mutt-send-email-mst@kernel.org>
References: <20220205014149.1189026-1-mst@redhat.com>
 <CAFEAcA91cVDym5fVCXgHFHJ8fkt8GhrOis-EPHN6YWpVn9TOCA@mail.gmail.com>
 <20220205072452-mutt-send-email-mst@kernel.org>
 <CAFEAcA-RJ8OkwaXWx=bRHJCDoWrQvZbdSEuuyz1j9ZFod0kcfg@mail.gmail.com>
 <20220205124235-mutt-send-email-mst@kernel.org>
 <CAFEAcA_kbt0HOp=8w--ZR9g+EgZvownyrbWYseSxuArd1g4CBw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_kbt0HOp=8w--ZR9g+EgZvownyrbWYseSxuArd1g4CBw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 05, 2022 at 09:05:12PM +0000, Peter Maydell wrote:
> On the build-tsan and build-cfi-x86_64 jobs and also on macos
> (this is a "clang is pickier than gcc about unused functions" one):
> https://gitlab.com/qemu-project/qemu/-/jobs/2058536617
> https://gitlab.com/qemu-project/qemu/-/jobs/2058536571
> 
> ../tests/qtest/erst-test.c:91:20: error: unused function 'out_reg64'
> [-Werror,-Wunused-function]
> static inline void out_reg64(ERSTState *s, unsigned reg, uint64_t v)
> ^


That's a weird one - it's static inline, compiler should not warn I
think. compiler bug? I can drop this for sure but still. Is this
what we should be doing?

-- 
MST


