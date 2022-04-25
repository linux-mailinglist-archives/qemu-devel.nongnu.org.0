Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942BC50EC48
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 00:52:27 +0200 (CEST)
Received: from localhost ([::1]:57580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj7ZC-0002Jx-Mt
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 18:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj7YD-00018F-Qb
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 18:51:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj7YA-0001OS-CP
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 18:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650927080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/qRnmBTaUxO+ZIwnDbx6njTRmfBdShf+QuKK01m8CZ4=;
 b=XxWSxPGQrvUItxTMvXlqsLK30Mfm8ALMBgpvcgTHs8zuuf5MZtWDD1zGxhndRfsc8OJChI
 VzRjLDEITrDnSoh4j1qg5mOY3LLZElCQSONTAjXPWmiNCcLRQPHjtJ933tfY6JzovLjFEY
 fkQnfq+qXWhNZHte2gwvKktTqmTG/Zs=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-Tgqh8Xn5PqCM-SbdJ2G_1Q-1; Mon, 25 Apr 2022 18:51:19 -0400
X-MC-Unique: Tgqh8Xn5PqCM-SbdJ2G_1Q-1
Received: by mail-il1-f198.google.com with SMTP id
 v14-20020a056e020f8e00b002caa6a5d918so6882523ilo.15
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 15:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/qRnmBTaUxO+ZIwnDbx6njTRmfBdShf+QuKK01m8CZ4=;
 b=W37BPP2Ljeef5lV4SwN3zZqOO0QzRDBIB6Zyn6i3NqwdwAYg9o69p6UsDz+zT9dQTo
 xFx9AnWlICaUHgaOTU0gFzjt1vW6wZ0V3I+oE6jgbIq8ArQ3wLyo9eQWbcCuGAwJMKmr
 sccAF27fj2WQ2iQ1PBJgztwkbOgL3jqNCIjtSXOK9XDccvv2DhCQodbvW0EGu+ag9MQy
 SqgqBv84dN3ZIyFFv8mht1xlVHhoWsHDo7rk+/5n8Ltwz5y+Ti3nRKOej8IVS5e5A7s7
 YLQFE8t4DbiCucVZAGYkcGXksIin4Zg6hPkGeOtawnXXtEL1CkA2W6TReAQLGIFURM9a
 MHAg==
X-Gm-Message-State: AOAM532HBdx22pU4zrIe81wSTOG+Pu1t+dW042dYfbstiJqIL0j3sfm1
 id8shQJRneHLKQKoaBf30txJoqe3OTu6BGYYmZgfB3MYFiozuVDCqm0mqTjm/Jmklj3PucOTFqQ
 ZeipJqooI0cvBBOA=
X-Received: by 2002:a05:6602:2d8d:b0:649:f82b:c877 with SMTP id
 k13-20020a0566022d8d00b00649f82bc877mr8083763iow.66.1650927078624; 
 Mon, 25 Apr 2022 15:51:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIi7NEUqSn5vtgY9W0F7Jg2yA7o7HqFXX4K75q+FXmoZ9wgBO/+olH9rf2FVyzwnU2exl/qA==
X-Received: by 2002:a05:6602:2d8d:b0:649:f82b:c877 with SMTP id
 k13-20020a0566022d8d00b00649f82bc877mr8083756iow.66.1650927078440; 
 Mon, 25 Apr 2022 15:51:18 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a92dd0c000000b002cac22690b6sm6944588ilm.0.2022.04.25.15.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 15:51:17 -0700 (PDT)
Date: Mon, 25 Apr 2022 18:51:16 -0400
From: Peter Xu <peterx@redhat.com>
To: Artyom <starardev@gmail.com>
Subject: Re: Live Migration ToDo
Message-ID: <Ymcl5OB8xpqP2bTx@xz-m1.local>
References: <CA+inuZ85ktnAuvmmMcxJFX0EVZC6A_g2fR5BSQRTshDoxdv8=Q@mail.gmail.com>
 <YmbpoyhTXB4jdgx+@xz-m1.local>
 <CA+inuZ_o5eyc+dFyTxKe1v1nw8fmhXP1P4gysY0+L7N6VRtMwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+inuZ_o5eyc+dFyTxKe1v1nw8fmhXP1P4gysY0+L7N6VRtMwQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Tue, Apr 26, 2022 at 01:39:58AM +0300, Artyom wrote:
> Thank you for your response. Yes, I would like to work on some task, and
> eventually I would like to use it as my student project. For example, it
> might be possible to implement the technique from the article Post-Copy,
> Hines, 2009: demand paging, active push, prepaging and dynamic
> self-ballooning. As far as I understood from the postcopy documentation,
> the pages are pushed sequentially, but it is possible to implement a new
> prepaging strategy. Or are there any obstacles to implementing the ideas of
> this paper in QEMU?

I'm a bit confused.  Firstly, Dave implemented postcopy for QEMU years ago,
please see migration/postcopy-ram.c.  Or do you mean you want to implement
some specific optimization for QEMU's postcopy?

Thanks,

-- 
Peter Xu


