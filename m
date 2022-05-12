Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6271F525224
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 18:10:34 +0200 (CEST)
Received: from localhost ([::1]:60924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npBOa-00062D-Vb
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 12:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npBHs-0002aq-9l
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:03:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npBHq-0008HF-Nh
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652371411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uyYH+MV/bDDU4hvPkHGyhuVApNBPS5r2zvsUOrUMsKQ=;
 b=K/7BjeadEWTSv8ec+auneAcEK23Rp/yyc6/yIAKb+4p++hIl4GALdpJCZ2NKimCixJ8yOm
 Oz9Rpjxh+gZVKv8WKRsaYZP0UH3ta0O0FumCDwYudX1Zr0PPEf4HJJ8/wG3h0EWOalTfKW
 YmN/x9IsxKGYCptp6K5Vph5jsd62/pY=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-r5DMK0cPPkOctLECIaDuEQ-1; Thu, 12 May 2022 12:03:30 -0400
X-MC-Unique: r5DMK0cPPkOctLECIaDuEQ-1
Received: by mail-io1-f71.google.com with SMTP id
 i66-20020a6bb845000000b00657bac76fb4so3285322iof.15
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 09:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uyYH+MV/bDDU4hvPkHGyhuVApNBPS5r2zvsUOrUMsKQ=;
 b=0feHz3gTp7YYuhox7sKEmucwu29d/JZiWI9zZFTOqB4znKFwHBHWp+j4WyB3cBxl1v
 KEdAST1P08Hq2Ongs905UjWr7GRs/sXz67R/XliSHmgelAAkTqkPVXe/4VokCMNQYdxz
 IHng0hYhYvfIo9jPwuojMEa/2KR46TIUPWZG7lr6ai3gTe4yU4PPUJO11/PcieOeXOsh
 /GvdPQYXddZEwnzu0xWGU2MdChakuLNwHLnzuufKy6TgzNPcpfZkWsi2TbKfM3a08ecx
 SGtx0DLHfA2Kv36d6brn17DjOtzE5FD/QbnScN8LWPfgXtdEBuHHFcd+k0KJuLz/ElzJ
 0TZg==
X-Gm-Message-State: AOAM530mIzNXqeyutxqmRIIRFNBam93e5HltZiefOK7BvmqwpQx5u6VV
 nWqMZw6BafHitL54JGuCb1+sBHmPLG0J3Xm9sUaXxr20LOuTgOHhsDL5bFnsl8VnL5Mra+Zse+n
 +Uliv1T8K3zV+474=
X-Received: by 2002:a5e:930e:0:b0:649:d7f0:ebc5 with SMTP id
 k14-20020a5e930e000000b00649d7f0ebc5mr364479iom.80.1652371409322; 
 Thu, 12 May 2022 09:03:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLmdC9m46GmOqmEocB50WnbzVjg9royiWaZHOe5iLgpw652NL4xCwMkI23oLUzn1y/yzWocg==
X-Received: by 2002:a5e:930e:0:b0:649:d7f0:ebc5 with SMTP id
 k14-20020a5e930e000000b00649d7f0ebc5mr364468iom.80.1652371409112; 
 Thu, 12 May 2022 09:03:29 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a056e020b2600b002cde6e352c7sm1479832ilu.17.2022.05.12.09.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 09:03:28 -0700 (PDT)
Date: Thu, 12 May 2022 12:03:27 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] util: Return void on iova_tree_remove
Message-ID: <Yn0vz+6nYs0d/Hvj@xz-m1.local>
References: <20220427154931.3166388-1-eperezma@redhat.com>
 <CAJaqyWdwzUnP71LNEDe6Fo+th9-qMLQXJMgeo2nb3jE-GyUCPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWdwzUnP71LNEDe6Fo+th9-qMLQXJMgeo2nb3jE-GyUCPw@mail.gmail.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 12, 2022 at 05:48:47PM +0200, Eugenio Perez Martin wrote:
> On Wed, Apr 27, 2022 at 5:50 PM Eugenio Pérez <eperezma@redhat.com> wrote:
> >
> > It always returns IOVA_OK so nobody uses it.
> >
> > Acked-by: Jason Wang <jasowang@redhat.com>
> > Reviewed-by: Peter Xu <peterx@redhat.com>
> > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> 
> Hi! Friendly ping about this, is it something pending from my side?

Don't think so. :)

This patch does look fine to go via trivial branch, Laurent?

Also copying Michael since for other iova-tree change it always go via
Michael before.

Thanks,

-- 
Peter Xu


