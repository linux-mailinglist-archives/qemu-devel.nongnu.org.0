Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F87250E858
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 20:35:44 +0200 (CEST)
Received: from localhost ([::1]:33478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj3Yl-0001uK-2U
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 14:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj3XR-0000YG-TF
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 14:34:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj3XM-0002m8-LK
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 14:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650911655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Yu+Y3W+eO72BzivHwgffilmD9IkBczVXKOe1OgHyuY=;
 b=dcY2Hb9X1Ffk5ujDqZYv6vjLyXPWS/UmP5e79oyfZ9Zn4vn0kP8i6RsnaNkxYckkOPxNNL
 CpDDMD5SETdtmkkkY0DAxKKhAZ5q8pzPI0X72TXXwtFEqS53gvx1xcKtsKEX6ZvmNxuws3
 gDgWWrEGWGcqwtfM1Ku/7W6ibeN9fCE=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-8myhn68CNeGNmBpWPRai6Q-1; Mon, 25 Apr 2022 14:34:13 -0400
X-MC-Unique: 8myhn68CNeGNmBpWPRai6Q-1
Received: by mail-il1-f197.google.com with SMTP id
 m11-20020a056e020deb00b002cbde7e7dcfso6594606ilj.2
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 11:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0Yu+Y3W+eO72BzivHwgffilmD9IkBczVXKOe1OgHyuY=;
 b=n7f6OnIeyLvbjuqeitEvapotxWhMnJsV6d7RJ45nYSlXxY8UbrQhxwwg9mygWz+NZ/
 7MikZLoJPjQ0uEP0MKcR5A98aZzRM7E0xP0SK9Brmrd3mak6weouBvu7Gni+j1padiLu
 utAOR0/ZeVyUAudJ1/PoYzft2LE0rMb+M00rDhxP0FWrzrO/5vQWzLfCToQkSLpf8fFA
 hSVmpStQNyetFWoSExsHWAA3F1ZKCmMiL27Cx3guIRNGRdQXJfsuByIiisaM13uIRt0Y
 9XOaQgaja52ecD2pJV+9+bDp/U5fIMsaYJ9a6cMO3UHEl5h1Go2cJEmCYwGK/mEJuE8t
 jmrA==
X-Gm-Message-State: AOAM530odxSfEFF63IxLwrlNnvYJeeOZxpZyTDYieufScHgtUdxNwk22
 eqDRPWTLWpf5CnM+CxPD8lAwZ5fUevYwVfnpolPnbHgIgHsrxtZv0n2Y3+UzXkvumVNFrdhTOQ1
 Pr/Rp5bEKUNoYGkE=
X-Received: by 2002:a05:6638:204e:b0:323:e3b1:1c2c with SMTP id
 t14-20020a056638204e00b00323e3b11c2cmr8325498jaj.222.1650911653104; 
 Mon, 25 Apr 2022 11:34:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbIENFOfXGRvZIQgdtunJ+O42JbHGK3at6oRquX9KinfBzS1EKo4Jf03Xabqrf5X/EKMjc2g==
X-Received: by 2002:a05:6638:204e:b0:323:e3b1:1c2c with SMTP id
 t14-20020a056638204e00b00323e3b11c2cmr8325488jaj.222.1650911652872; 
 Mon, 25 Apr 2022 11:34:12 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 5-20020a6b1405000000b0065064262ef4sm7734282iou.30.2022.04.25.11.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 11:34:12 -0700 (PDT)
Date: Mon, 25 Apr 2022 14:34:11 -0400
From: Peter Xu <peterx@redhat.com>
To: Artyom <starardev@gmail.com>
Subject: Re: Live Migration ToDo
Message-ID: <YmbpoyhTXB4jdgx+@xz-m1.local>
References: <CA+inuZ85ktnAuvmmMcxJFX0EVZC6A_g2fR5BSQRTshDoxdv8=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+inuZ85ktnAuvmmMcxJFX0EVZC6A_g2fR5BSQRTshDoxdv8=Q@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: leobras@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Mon, Apr 25, 2022 at 01:41:27PM +0300, Artyom wrote:
> Hello! I would like to see a list of suggestions/ideas/tickets for
> improving live migration (especially performance and algorithms). There is
> a page https://wiki.qemu.org/ToDo/LiveMigration, but it has not been
> updated for a long time. Thanks

Yes I think you're right and it's a good idea we should at some point
revive the page so it always contains up-to-date contents.

Do you mean that you want to contribute to QEMU project by working on some
(obviously, not bit-sized) performance related tasks on live migration to
improve the software?

So far I am aware that Leonardo was working on zero-copy sender side for
it, Juan was experimenting some bitmap split researches, and I'm working on
a bit of the postcopy specific enhancements.  I'm not sure what I can do
here to help you start any form of contribution, maybe starting from
knowing more context of what you want and plan. :)

Thanks,

-- 
Peter Xu


