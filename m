Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F45F40436B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 04:06:53 +0200 (CEST)
Received: from localhost ([::1]:49014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO9Sl-00036O-Pl
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 22:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mO9Rm-0002H1-Si
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 22:05:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mO9Rj-0003jS-7X
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 22:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631153144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8HtotLq0nQZdGK43N1vNXa6d5L1VyHW9Y/D9Mo/3I5Q=;
 b=bKRRtyV/gVNZ1+DdzUYsRNMEGUHUoGjYmBF+6HsDm5QbHq34ue/HVVhRmy3enWJ4dTHQAw
 t1jupxIxHEJ/QdPyYbLb3F7hmJkh1FDsyDl6PXszjJ55O/EvLUUgva3spVQNEyDIoDi7Z5
 I1u5uphHm8jCU9OWJ79VMXudlRAFFBg=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-9sb22fBmN3S_cPNVfxX8oA-1; Wed, 08 Sep 2021 22:05:43 -0400
X-MC-Unique: 9sb22fBmN3S_cPNVfxX8oA-1
Received: by mail-il1-f199.google.com with SMTP id
 f13-20020a056e02168d00b002244a6aa233so492438ila.7
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 19:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8HtotLq0nQZdGK43N1vNXa6d5L1VyHW9Y/D9Mo/3I5Q=;
 b=vfnHSg8yw8uQ3pT4cWUmzyDssv4D/g8gGPk8s35ld+GR7dfmvyA/EhfxuV9hoDVvsq
 FXIdQNlvDJZFt8SrzQDL8mclfp4gWWN26MskBnFR5gjLeR7jXvF4CWEEIYoYv9wV6iIo
 YtIrEoiIVLzHzWcmQ3hy/nWz5xSi0Xi9r7zscof2M3fXJjZrkRgpAlUSg158z7ax0HcU
 wt7HpamUYOWU7XUivC111NvmJZx9/8D9BUA+LBWXBCMcZlX7p8i7UFUCg5r6H+1h8gKy
 LnexM0jdBCinshTxn7tL7XVG9gtUX+l1UaNEIfJXCHM2lAZgy0ixopJQwpCe6ocogIh+
 Of7g==
X-Gm-Message-State: AOAM533BVMaJXK0EYt70VjNJTOk6EQTYVFS/9PgSIyjhacPtjsqYtjz+
 ZRglPvcxeWiNheiSgzpBfSZb1rzI5xvLiE4B2c8Y5k5VLQtrCzMfMBTUtVEPVVSYxJswGPIyx43
 RJDW3L3N5lCY3Jlc=
X-Received: by 2002:a5e:db06:: with SMTP id q6mr532107iop.129.1631153143064;
 Wed, 08 Sep 2021 19:05:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxiesXsm/xAAs05Uyi7G42r2ZkFsy4el1jbMWmSF5LnvN4dQrgdYoTwsjL9ewHSlCuBEu2/A==
X-Received: by 2002:a5e:db06:: with SMTP id q6mr532087iop.129.1631153142815;
 Wed, 08 Sep 2021 19:05:42 -0700 (PDT)
Received: from xz-m1.local ([2607:fea8:56a3:500:f917:5e1f:6e63:74cd])
 by smtp.gmail.com with ESMTPSA id d10sm199027ilu.54.2021.09.08.19.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 19:05:42 -0700 (PDT)
Date: Wed, 8 Sep 2021 22:05:39 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
Message-ID: <YTlr8xIFOFym2cFy@xz-m1.local>
References: <CAJ6HWG75NDzaRAoHvM6FkFoB+sQvTpmdR8+AdMkoY6TsP06ZhA@mail.gmail.com>
 <YTCPngNB+l70sl06@redhat.com>
 <CAJ6HWG6dd+timQM27-NTumvwDM2bFawRsnmrZumdzGZ8hCR3dQ@mail.gmail.com>
 <YTCeNCEmr3NsQEPR@redhat.com>
 <CAJ6HWG6D61K49gyvfLo2c5=cZpkYh96ciZjO5V=wiPdG+wB5zQ@mail.gmail.com>
 <YTCnP9J/JINhg4h8@redhat.com> <YTdHpx263WNe7nuZ@work-vm>
 <CAJ6HWG6L1LOec6yMY1oxFjbjhAv4LK6beS5FmU=g_s4h2+7ouA@mail.gmail.com>
 <YTkmjdsY1ZkBnVdS@t490s> <YTkrHUMMV0xDmHCU@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YTkrHUMMV0xDmHCU@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Leonardo Bras Soares Passos <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 10:57:06PM +0100, Daniel P. Berrangé wrote:
> We think we're probably ok with migration as we are going to rely on the
> face that we eventually pause the guest to stop page changes during the
> final switchover. None the less I really strongly dislike the idea of
> not honouring the kernel API contract, despite the potential performance
> benefits it brings.

Yes understandable, and it does looks tricky. But it's guest page and it's just
by nature how it works to me (sending page happening in parallel with page
being modified).

I think the MSG_ZEROCOPY doc page mentioned that and it's userspace program's
own choice if that happens. So even if it's not by design and not suggested, it
seems not forbidden either.

We can wr-protect the page (using things like userfaultfd-wp) during sending
and unprotect them when it's done with a qio callback, that'll guarantee the
buffer not changing during sending, however we gain nothing besides the "api
cleaness" then..

Thanks,

-- 
Peter Xu


