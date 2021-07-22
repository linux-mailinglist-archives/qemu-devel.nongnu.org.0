Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4763D2AD4
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:10:13 +0200 (CEST)
Received: from localhost ([::1]:38340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6cD5-0007K8-RS
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6cCE-0006Xe-99
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:09:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6cCA-0005vx-Gt
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626973752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IotH/Q91sOf8sonvNeSXsvH+6rgM9yGSV9aJt1nFexU=;
 b=KZH0RzTiew2C2loQPwwxDLOS2BCGvzwNRuv7RpDDdAtG1xI2934k7VRN895kZL2rWFQHba
 00AmIpjyRU0C4KGzIL8x68LttDTtb+HGGNFRRpR1XI7ggtT3aeDSFXSGFu8bj8gdLvpnNL
 hE8/OvlBUWMLpdIVQYSMd9uzK121ESs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-1ADDoUjkOLut67nVe9t_pA-1; Thu, 22 Jul 2021 13:09:11 -0400
X-MC-Unique: 1ADDoUjkOLut67nVe9t_pA-1
Received: by mail-wr1-f70.google.com with SMTP id
 32-20020adf82a30000b029013b21c75294so2672747wrc.14
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IotH/Q91sOf8sonvNeSXsvH+6rgM9yGSV9aJt1nFexU=;
 b=et3WezdgVN/5cR1FzBTgWVNI7a0O0rcYFUiaoo4uRaA5IU64hfEZB0IMU0FJxDQmGI
 LJ54qVvOjNGEji1YQmTaySQBt1L6XDzUlaYx57CTrwIzwyABoIvY9V1Vnz3wGA04Or3n
 p7BYx1rdBEIFny87oM4aTqPcDi0el8eJQiTxfzIAZBwhqJoshfFFPcLjp2CKl2siASaF
 lTAAkvmEM7kCQreQh48fYgJN22EXpjk6RxOWxzdSYTSIjzAYUPn9sRuVxv+B7O1ey9gI
 XkSJJPJRI4OF5lSnevumzZnb8Gn7H2Uve2ykoL0TXPyEiANie5YM8yfU4McevIsosn6/
 OtNg==
X-Gm-Message-State: AOAM533GcOhNv2BO5q6oE3k2GlEL39tpM5utkbPDcIbQpHqKJSzGdBgn
 7ulu5xEN5A6MZiNhNi+6QSqIShlr0rcPqfTP5K9Low3PIGpjs5RAHGOur41IKk2HxBv5orAcTjp
 y7OBdAU2ZDaEQU98=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr10206722wmb.142.1626973749889; 
 Thu, 22 Jul 2021 10:09:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznmk9VrQC94Sha3lrGrT7UD3Lap/MSFAwesQyS679KxwHvRNQKuOJz3W36rX+S7caL0UiVzA==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr10206700wmb.142.1626973749668; 
 Thu, 22 Jul 2021 10:09:09 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id l24sm3027991wmi.30.2021.07.22.10.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:09:05 -0700 (PDT)
Date: Thu, 22 Jul 2021 18:09:03 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 5/5] migration: Move the yank unregister of
 channel_close out
Message-ID: <YPmmL9XBdsCFH2rs@work-vm>
References: <20210721193409.910462-1-peterx@redhat.com>
 <20210721193409.910462-6-peterx@redhat.com>
 <YPmOZ3LGm0u7GoBA@work-vm> <YPmagh393LlpVSm9@t490s>
MIME-Version: 1.0
In-Reply-To: <YPmagh393LlpVSm9@t490s>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Thu, Jul 22, 2021 at 04:27:35PM +0100, Dr. David Alan Gilbert wrote:
> > > @@ -3352,6 +3355,8 @@ static MigThrError postcopy_pause(MigrationState *s)
> > >  
> > >          /* Current channel is possibly broken. Release it. */
> > >          assert(s->to_dst_file);
> > > +        /* Unregister yank for current channel */
> > > +        migration_ioc_unregister_yank_from_file(s->to_dst_file);
> > 
> > Should this go inside the lock?
> 
> Shouldn't need to; as we've got the assert() right above so otherwise we'll
> abrt otherwise :)

Hmm OK; although with out always having to think about it then you worry
about something getting in after the assert.

> The mutex lock/unlock right below this one is not protecting us from someone
> changing it but really for being able to wait until someone finished using it
> then we won't crash someone else.
> 
> I think the rational is to_dst_file is managed by migration thread while
> from_dst_file is managed by rp_thread.
> 
> Maybe I add a comment above?

OK, I almost pushed this further, but then I started to get worried that
we'd trace off a race with ordering on two locks with yank_lock; so yeh
lets just add a comment.

Dave

> Thanks,
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


