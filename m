Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D020435C8F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 10:03:18 +0200 (CEST)
Received: from localhost ([::1]:43796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdT2j-0005jN-6s
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 04:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdT05-0004j9-1D
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 04:00:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdT00-0005WE-Or
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 04:00:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634803226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BEj1DTo7+1QjV0XKsjD2VQzoagUyCZkPHQ8QJpa0dUA=;
 b=ByjNgLCYtw+KonFkNXokrUQVyoVqRO1BFwvzep2hM3udL3OKbaOj3p6eW31Xngb9ykgqGy
 IwOCMvnrvtCteQhnQh9g+XajRZUY3nyf6dxGjrlXuxNhqMSL1HDxCL15/O6FuaemUXO4VE
 UvF3at1LvQA8325IqaYFYl3V6qhddAI=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-aw8pfYOtPEG3JNbnkrWH3Q-1; Thu, 21 Oct 2021 04:00:25 -0400
X-MC-Unique: aw8pfYOtPEG3JNbnkrWH3Q-1
Received: by mail-pf1-f197.google.com with SMTP id
 q202-20020a6275d3000000b0044dc3987ae6so3297185pfc.12
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 01:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BEj1DTo7+1QjV0XKsjD2VQzoagUyCZkPHQ8QJpa0dUA=;
 b=mFf1OxIUFJvQyB3yUDe39vaPe9pYHyF8mmnzMxzuL1XxO1EYB1ruyuXB3/MhOwZOL4
 CaSC3shs4wFnp4qJrApk643YvGzxmYHqacu8K4B7ppatSixcENzbm/vifImxLsc0Ztzf
 QrnnBuFDYgbIyOx73q489jEvPuhWJrquUpQtL7l6/XPw6Yye7zIegXuQtAcGPsmEvWXw
 3YnqNmbSu1NkSAa6RFg91sIP49kqUexZgO7eDIKmKfR7kErDOLIcsH1M6SUrIlZikNHq
 NDmCR5+l9f4AfD+glmveH9+QdY9VAl72xp2jQAHFk5kj/iqAvxdu6X+WJW1l5K4qjdJq
 aDmw==
X-Gm-Message-State: AOAM531Kuwjnd1ynPrhgs+twH06pBEbOxVzARwXYW+MZoW74Ez4rlMYl
 43IY2z6Ny0UkX9QU9mANAnS6xPFOk9KAC762aJx2NqAhSxwY8lcVvaQIgsErTNnID60sfEBr/tt
 Ae1Ch3uzdjP+WN2w=
X-Received: by 2002:a17:90a:e38f:: with SMTP id
 b15mr4945116pjz.76.1634803224098; 
 Thu, 21 Oct 2021 01:00:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLm+KgsJiz30xzsAFF5Q0BXs8os2bdKV4lGcrT9iYQsLiUGYy5SUoyf9o8J9hGu8z127jt9Q==
X-Received: by 2002:a17:90a:e38f:: with SMTP id
 b15mr4945047pjz.76.1634803223590; 
 Thu, 21 Oct 2021 01:00:23 -0700 (PDT)
Received: from xz-m1.local ([84.17.34.135])
 by smtp.gmail.com with ESMTPSA id t38sm5442182pfg.102.2021.10.21.01.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 01:00:22 -0700 (PDT)
Date: Thu, 21 Oct 2021 16:00:16 +0800
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 0/4] vl: Prioritize device realizations
Message-ID: <YXEeEFuovkNqRRMu@xz-m1.local>
References: <20210818194217.110451-1-peterx@redhat.com>
 <2817620d-facb-eeee-b854-64193fa4da33@redhat.com>
 <YXDqaZL71DCEghbr@xz-m1.local>
 <12cdd7f4-16c2-5af8-aeb2-e168506eefc2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <12cdd7f4-16c2-5af8-aeb2-e168506eefc2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 21, 2021 at 09:17:57AM +0200, David Hildenbrand wrote:
> I know, whenever someone proposes a way to tackle part of a challenging
> problem, everybody discovers their hopes and dreams and suddenly you
> have to go all the way to solve the complete problem. The end result is
> that there is no improvement at all instead of incremental improvement.

Yeah, there's the trade-off; we either not moving forward or otherwise we could
potentially bring (more) chaos so the code is less maintainable.  Before I'm
sure I won't do the latter and convince the others, I need to hold off a bit. :-)

> I'm not planning on letting the user set the actual number of memslots
> to use, only an upper limit. But to me, it's fundamentally the same: the
> user has to enable this behavior explicitly.

I'm not familiar enough on virtio-mem's side, it's just that it will stop
working when the ideal value (even in a very corner case) is less than the
maximum specified, then that trick stops people from specifying the ideal.  But
if it's bigger the better then indeed I don't see much to worry.

-- 
Peter Xu


