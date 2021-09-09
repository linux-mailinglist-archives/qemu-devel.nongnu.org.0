Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E00D405B11
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 18:42:03 +0200 (CEST)
Received: from localhost ([::1]:42680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mON7i-00016X-CC
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 12:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mON6T-0008Bs-0u
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:40:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mON6R-0002d5-Kv
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631205641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wSXLPV80sck1IyyYzuRc7B7W7sIlvAeWZS15l6tJVIM=;
 b=U94cLW2oMmfClUXBWg8v7ZaCPMBc/xkwTm+ODxPN1KuZr4mJUPYSxsWrrURttR4UNxlEWo
 RqXNCx+9jJY4DxNQL8ndnCgn6vexm4EvE4HDveESJSSriIrGUH6/l8yU3Aj+mxz67STkpY
 wTK2O0vcFUOcCmQjYsGtbd4254R5yYA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-kfq72SGtPqGeYmylxk3wxw-1; Thu, 09 Sep 2021 12:40:40 -0400
X-MC-Unique: kfq72SGtPqGeYmylxk3wxw-1
Received: by mail-qk1-f200.google.com with SMTP id
 d202-20020a3768d3000000b003d30722c98fso5204806qkc.10
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 09:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wSXLPV80sck1IyyYzuRc7B7W7sIlvAeWZS15l6tJVIM=;
 b=YuyxeuBKXEKlD9MYej6I9SGshaUVh+HSp7ECNzOOzKQMJahFbBd+aXERjGd3GvaQ8p
 0boOuLtldgH2asPeLNOKt+E8DVU+/Z6jw51r4PdTPEexLPEt+LowqgQUxTyQ5cJ3vFBH
 B/s0DazU20aIXbjCrYlRVCkP87C/Yj71UVNnZL+QW/CL7MdWosGvcyIzqXC7a9W98thO
 z6sr/yqbdIFNGZwouhFPUgiYKlB85rxoiQqJSP5VEng6QLaOUEY9FH02+Pel4XdC1csf
 LVG4BZHmwnrbZUAlkQURpzbasuvHYvFVyUyvbYq81JzpU26T8t5o9apnT85uHhxcr6XZ
 2bWw==
X-Gm-Message-State: AOAM532MxJxXX9Xb/h3jQMEdYAGSWAEJak9YAEKFxFv6zfdwR2++C1LZ
 hZKa1GrlE5rofK9H315WQyZd+vquthngaaJqvgrmfqQRMVkTtDOWttjtV17SLVcUHBURSBmvl6I
 cc1LWH6mfKAnXQkw=
X-Received: by 2002:a37:84c3:: with SMTP id g186mr3681186qkd.276.1631205640231; 
 Thu, 09 Sep 2021 09:40:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnreZemnBpUrzFRu8RkkCCl5iNuVsc2ziGp6KPJHALAjZwBITAXrZH2irBZih9jKnJmoheFg==
X-Received: by 2002:a37:84c3:: with SMTP id g186mr3681161qkd.276.1631205639983; 
 Thu, 09 Sep 2021 09:40:39 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id h70sm1660920qke.54.2021.09.09.09.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 09:40:39 -0700 (PDT)
Date: Thu, 9 Sep 2021 12:40:37 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
Message-ID: <YTo5BRw/M2Cdrpvw@t490s>
References: <CAJ6HWG6dd+timQM27-NTumvwDM2bFawRsnmrZumdzGZ8hCR3dQ@mail.gmail.com>
 <YTCeNCEmr3NsQEPR@redhat.com>
 <CAJ6HWG6D61K49gyvfLo2c5=cZpkYh96ciZjO5V=wiPdG+wB5zQ@mail.gmail.com>
 <YTCnP9J/JINhg4h8@redhat.com> <YTdHpx263WNe7nuZ@work-vm>
 <CAJ6HWG6L1LOec6yMY1oxFjbjhAv4LK6beS5FmU=g_s4h2+7ouA@mail.gmail.com>
 <YTkmjdsY1ZkBnVdS@t490s> <YTkrHUMMV0xDmHCU@redhat.com>
 <YTlr8xIFOFym2cFy@xz-m1.local>
 <CAJ6HWG4GTiqvXjyLnBTEaP6fBCt76cR=imLRfM1eYi3qp9QiPg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG4GTiqvXjyLnBTEaP6fBCt76cR=imLRfM1eYi3qp9QiPg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 01:58:39AM -0300, Leonardo Bras Soares Passos wrote:
> FWIW, what I had in mind for a (theoretical) migration setup with
> io_async_writev() + io_async_flush():

One trivial concern is it's not strictly just "async" because "async" can
happen on any nonblocking fd; here it's more "zerocopy" specific.  But as long
as Dan is okay with it I'm fine too to start with "async", as long as we do
proper documentation on the requirement of lifecycle of the buffers.

> - For guest RAM we can decide not to rw_lock memory on zerocopy,
> because there is no need,
> - For headers, we can decide to not use async  (use io_writev() instead),
> - flush() can happen each iteration of migration, or at each N
> seconds, or at the end.

I think we should only need the flush at the end of precopy, and that should
also cover when switching to postcopy.  We could merge this flush() into the
existing per-iteration sync of multi-fd, but it's not strictly necessary, imho.
We can see which is easier. The rest looks good to me.  Thanks,

-- 
Peter Xu


