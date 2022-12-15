Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418AD64DFC7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 18:36:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5s8u-0005nb-8u; Thu, 15 Dec 2022 12:35:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5s8r-0005my-56
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 12:35:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5s8p-0007d5-2H
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 12:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671125730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=61h8KRbUox1qcT38sGF0luLbjAJmLm2Hv2mJvmrZ6tE=;
 b=eoUezvrxrVqCLzrRRdJvRFKfpZ/dtLQ/6GtK+QOuD1OS2W9Ebub5R4EDlmEuYgzyYAfcE8
 ft0pQgYFSLYi2jSybPArK2qjBDmXBpyDyRyurwABfxEiBpLebmsUWXPWhIr8i9GoX+XVw8
 fuRuymZABOHZQnG107vFHEVwqXuqesc=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-435-qSJwbp3XP0-Be0rMAsIXGg-1; Thu, 15 Dec 2022 12:35:28 -0500
X-MC-Unique: qSJwbp3XP0-Be0rMAsIXGg-1
Received: by mail-yb1-f200.google.com with SMTP id
 p124-20020a257482000000b0073867e191adso2188253ybc.9
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 09:35:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=61h8KRbUox1qcT38sGF0luLbjAJmLm2Hv2mJvmrZ6tE=;
 b=njfHrUty75+D47jVHMh202sDJjdJYkrz93sPy0pP2+35BRdl60C+KIyW9Ix1DlugHm
 z5ExLl579POc/IOg29qJmfwZY9CzZGnmZrUrv4MWDoKTZsMe7jCP1vd5+Esqzhh511fw
 TOePlusPA7lumZLa7I0aOkY58bjRf9dQGLJkQzpzasye5qwqJ583i5nEni16Z/144E1r
 PYE6uXmkj2utSAtyUCMxcNBnOdZptsUIJ+74+L3gQagxUFZ5xmCbBF5PW2NIirl2c8f3
 nyH9e4Sa1y1vZ/PPJFZwpVHsoFA/UaSgc719eC+U75fbyNpx7kdCxAKTA3eualuhhSSN
 RpBA==
X-Gm-Message-State: ANoB5pnUygtrZjM9vFE5P5sH0KaCytKnTzJCbepizz4fKAhg1TUe1Hxg
 E42i5+WZUDcNVDJQU52EW7zySEfkUC0pjun3PrKY7Cy5v/lqBrkUVsy8dS1OCEQJZATfbXbLKoV
 /7UcN26bQziEr32Q=
X-Received: by 2002:a05:7500:3e01:b0:ea:db4c:fc6f with SMTP id
 lh1-20020a0575003e0100b000eadb4cfc6fmr3050249gab.37.1671125728240; 
 Thu, 15 Dec 2022 09:35:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7e97V/AwU9XHYjvs3WjE61yQFNsJVTGIknnaAkVbYqblEzTDIafC19bijLoIFe7/vOjzj15Q==
X-Received: by 2002:a05:7500:3e01:b0:ea:db4c:fc6f with SMTP id
 lh1-20020a0575003e0100b000eadb4cfc6fmr3050241gab.37.1671125727854; 
 Thu, 15 Dec 2022 09:35:27 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-45-70-31-26-132.dsl.bell.ca.
 [70.31.26.132]) by smtp.gmail.com with ESMTPSA id
 o18-20020a05620a111200b006fc92cf4703sm11934151qkk.132.2022.12.15.09.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 09:35:27 -0800 (PST)
Date: Thu, 15 Dec 2022 12:35:26 -0500
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 1/5] io: Add support for MSG_PEEK for socket channel
Message-ID: <Y5ta3jGHhN0nrIf6@x1n>
References: <20221213213850.1481858-1-peterx@redhat.com>
 <20221213213850.1481858-2-peterx@redhat.com>
 <Y5mT4V3iYlcH56/H@redhat.com> <Y5pAiFv/JHQvgxha@x1n>
 <Y5rrmRyhRjEiHtAe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y5rrmRyhRjEiHtAe@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Thu, Dec 15, 2022 at 09:40:41AM +0000, Daniel P. Berrangé wrote:
> On Wed, Dec 14, 2022 at 04:30:48PM -0500, Peter Xu wrote:
> > On Wed, Dec 14, 2022 at 09:14:09AM +0000, Daniel P. Berrangé wrote:
> > > On Tue, Dec 13, 2022 at 04:38:46PM -0500, Peter Xu wrote:
> > > > From: "manish.mishra" <manish.mishra@nutanix.com>
> > > > 
> > > > MSG_PEEK reads from the peek of channel, The data is treated as
> > > > unread and the next read shall still return this data. This
> > > > support is currently added only for socket class. Extra parameter
> > > > 'flags' is added to io_readv calls to pass extra read flags like
> > > > MSG_PEEK.
> > > > 
> > > > Reviewed-by: Daniel P. Berrang?? <berrange@redhat.co
> > > > Suggested-by: Daniel P. Berrang?? <berrange@redhat.com
> > > 
> > > The last letter of my name has been mangled - whatever tools used
> > > to pull in manish's patches seem to not be UTF-8 clean.
> > > 
> > > Also the email addr isn't terminated, but that was pre-existing
> > > in manish's previous posting.
> > 
> > I'll fix at least the latter in my next post, sorry.
> > 
> > For the 1st one - I am still looking at what went wrong.
> > 
> > Here from the web interfaces it all looks good (besides the wrong
> > ending..), e.g. on lore or patchew:
> > 
> > https://lore.kernel.org/all/20221213213850.1481858-2-peterx@redhat.com/
> > https://patchew.org/QEMU/20221213213850.1481858-1-peterx@redhat.com/20221213213850.1481858-2-peterx@redhat.com/
> > 
> > It also looks good with e.g. Gmail webclient.
> > 
> > Then I digged into the email headers and I found that comparing to Manish's
> > original message, the patches I posted has one more line of "Content-type":
> > 
> >   Content-Type: text/plain; charset="utf-8"
> >   Content-type: text/plain
> >   https://patchew.org/QEMU/20221213213850.1481858-2-peterx@redhat.com/mbox
> > 
> > While Manish's patch only has one line:
> > 
> >   Content-Type: text/plain; charset="utf-8"
> >   https://patchew.org/QEMU/20221123172735.25181-2-manish.mishra@nutanix.com/mbox
> 
> Don't trust what is shown by patchew, as that's been through many
> hops.
> 
> The copy I receieved came directly to me via CC, so didn't hit mailman,
> nor patchew, and that *only* has  "Content-type: text/plain".  So the
> extra Content-type line with utf8 must have been added either by
> mailman or patchew.
> 
> So it probably looks like a config problem in the tool you use to send
> the patches originally.

Ouch... for misterious reasons I had one line in .gitconfig:

177 [format]
178         headers = "Content-type: text/plain"

And that'll also affect git-publish too...  I have it dropped now.

Thanks,

-- 
Peter Xu


