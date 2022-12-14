Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4173864D1D5
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 22:32:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ZLE-0002oJ-2E; Wed, 14 Dec 2022 16:31:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5ZL7-0002nW-H0
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 16:30:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5ZL4-0002n8-DY
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 16:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671053453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vcIzs+xe8vtV0UBjA+2hi+J4Y/EC9UlBvVaWLiPoA74=;
 b=X7dMbiowkNEZIQzmKjbnCUruJuBDc1EZAP7Uca7XcTAqKzL7I0ZrDjblj3HNS1oSwvqpQf
 VakiHKlViYm9x+e4BHUnnfBQWX8rFxcvFKo9jMQE0NhdxTBR0khPpXOyAog2eeqD9VBrp6
 4zCGN0Q+96j3Yp3DqLzkZw7eu0IsgYE=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-387-SOMmSmrAPvWflT1xyxJRtw-1; Wed, 14 Dec 2022 16:30:51 -0500
X-MC-Unique: SOMmSmrAPvWflT1xyxJRtw-1
Received: by mail-yb1-f199.google.com with SMTP id
 r7-20020a25c107000000b006ff55ac0ee7so1255613ybf.15
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 13:30:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vcIzs+xe8vtV0UBjA+2hi+J4Y/EC9UlBvVaWLiPoA74=;
 b=blyZUJdl7oy11Mrhzyor8yy9aU+aHUogZkauXCbLlIU0XJyGJwXtUlt11QoDGBfqRm
 zB3U9m+op6/zJopmZOqsADEjudEYsMfWITn5R8f8q8PI+ARBemijjX2TZ2jk2siAsCWR
 wEXvzUNP/WQg1EEPw1iZdhe21viPPufpOlI/ryHXtnuoP4+RfECzR7VI9r4O0fGtNujE
 4NOYP3stwmGI3eCoqI1yxT/QAB3r1Le/K5UmlkKwdupCX1w4a/Y7MuBLNL5rBRKrRiYv
 ZWhgH7HsYDvHNp9BeikaaQN0wKS6NMAZikO7b+VzEcmX/C3Jc7sZN1M2zxHQteRUF2s6
 3HPQ==
X-Gm-Message-State: ANoB5pkbSSHKmyAkecPA8uhqH8nhuy3xjgS4SwzT91rHaE86u3npmwSw
 Le2WKkJf6RHAB1eZbbBN9Q+HWLOwI9u8DxQ8oEp0/x2zhVvVHI95hCot+vt9ZVU0E5rBuvPlDC5
 Brw+ZGK+Wj8C+YpY=
X-Received: by 2002:a05:6902:12cd:b0:6e7:3f9c:65b2 with SMTP id
 j13-20020a05690212cd00b006e73f9c65b2mr19642762ybu.3.1671053451002; 
 Wed, 14 Dec 2022 13:30:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Pzz9aPEEMmv7OTNXmlSFFxyTLvlg2kted+Hk01JZYC16Hr9K4e0KjnM+rs82eeidK40dLXw==
X-Received: by 2002:a05:6902:12cd:b0:6e7:3f9c:65b2 with SMTP id
 j13-20020a05690212cd00b006e73f9c65b2mr19642749ybu.3.1671053450790; 
 Wed, 14 Dec 2022 13:30:50 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-45-70-31-26-132.dsl.bell.ca.
 [70.31.26.132]) by smtp.gmail.com with ESMTPSA id
 a3-20020a05620a438300b006eeb3165554sm10364943qkp.19.2022.12.14.13.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 13:30:49 -0800 (PST)
Date: Wed, 14 Dec 2022 16:30:48 -0500
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 1/5] io: Add support for MSG_PEEK for socket channel
Message-ID: <Y5pAiFv/JHQvgxha@x1n>
References: <20221213213850.1481858-1-peterx@redhat.com>
 <20221213213850.1481858-2-peterx@redhat.com>
 <Y5mT4V3iYlcH56/H@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y5mT4V3iYlcH56/H@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Wed, Dec 14, 2022 at 09:14:09AM +0000, Daniel P. Berrangé wrote:
> On Tue, Dec 13, 2022 at 04:38:46PM -0500, Peter Xu wrote:
> > From: "manish.mishra" <manish.mishra@nutanix.com>
> > 
> > MSG_PEEK reads from the peek of channel, The data is treated as
> > unread and the next read shall still return this data. This
> > support is currently added only for socket class. Extra parameter
> > 'flags' is added to io_readv calls to pass extra read flags like
> > MSG_PEEK.
> > 
> > Reviewed-by: Daniel P. Berrang?? <berrange@redhat.co
> > Suggested-by: Daniel P. Berrang?? <berrange@redhat.com
> 
> The last letter of my name has been mangled - whatever tools used
> to pull in manish's patches seem to not be UTF-8 clean.
> 
> Also the email addr isn't terminated, but that was pre-existing
> in manish's previous posting.

I'll fix at least the latter in my next post, sorry.

For the 1st one - I am still looking at what went wrong.

Here from the web interfaces it all looks good (besides the wrong
ending..), e.g. on lore or patchew:

https://lore.kernel.org/all/20221213213850.1481858-2-peterx@redhat.com/
https://patchew.org/QEMU/20221213213850.1481858-1-peterx@redhat.com/20221213213850.1481858-2-peterx@redhat.com/

It also looks good with e.g. Gmail webclient.

Then I digged into the email headers and I found that comparing to Manish's
original message, the patches I posted has one more line of "Content-type":

  Content-Type: text/plain; charset="utf-8"
  Content-type: text/plain
  https://patchew.org/QEMU/20221213213850.1481858-2-peterx@redhat.com/mbox

While Manish's patch only has one line:

  Content-Type: text/plain; charset="utf-8"
  https://patchew.org/QEMU/20221123172735.25181-2-manish.mishra@nutanix.com/mbox

I found that it also happens in my local mail archive, so with my local
mail client it doesn't show correctly either (mutt here).  After I manually
removed that extra Content-type line in the archive it went right even
locally on mutt.

So it seems the 2nd "Content-type: text/plain" overwrote the first one and
it may not correctly apply utf-8 in the email client depending on what the
email client uses as default.  Said that, I'm pretty sure my muttrc has:

 set charset = "UTF-8"
 set send_charset = "UTF-8"

So neither do I know why that mutt config didn't apply to these patches,
nor do I (yet..) have an idea where that extra line comes from.. :-(

-- 
Peter Xu


