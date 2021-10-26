Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC7143AEF6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 11:24:18 +0200 (CEST)
Received: from localhost ([::1]:35080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfIgr-00061j-Ge
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 05:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfIf4-0004Sp-0i
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:22:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfIf0-0002zo-VW
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:22:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635240141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZA4L7faeXyat0HzQVj/ysClPn/tXVjpUMZGdbRJFJ+U=;
 b=B/o+hgfhItO30qd3efWBgoXsO/7regmWgv4SXZs9I5FXfaQpFlP/jTOJ2C7oiPq1z+Gytl
 EPaNqvNpeUATzz7rh4kREQ+If6QqazW5GMr9LW2PAhKUJBl4qe+ulzcjBSVezkaX+xF5Wv
 jDjOCjPJludvAtKtcZJ1BlOw9IdEawg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-FfbS8_QTPLaLl65UE9N14Q-1; Tue, 26 Oct 2021 05:22:20 -0400
X-MC-Unique: FfbS8_QTPLaLl65UE9N14Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 e7-20020adffc47000000b001688df0b917so2153174wrs.22
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 02:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZA4L7faeXyat0HzQVj/ysClPn/tXVjpUMZGdbRJFJ+U=;
 b=VB1L4vCsQthZ7QA0nWpBbL3hELR3U/5isavuVZPQEGy+PwtRcUtnU+mb6QIXcPnJEX
 LlZJ+AdS99J1RM8DZqcAjvZRSVzZeuu0XvK2J9NTbW1DDLatiKY1LsSyab88DYzLHeo4
 uyavw6Oct9lUYtvucZfvMrkP1A+tud/K11KhmLcZHWvEn5cP4UV44WlwnUsE75zofY0l
 BwEBmKuctGcMinp807pDBLHBoKn55U+OY/eTrWbF/JgQKYPMq7MLRn7hi9oTRE1IWYlM
 /ROo6K2lNAs+jLLCLSYhIv2SqpkXv+EKFZc7XS0HTTG76mwkhclinM20wlX308moQmcT
 MVUw==
X-Gm-Message-State: AOAM532ilA1kmbnpCxfI1ZadDQY9wtKky9SC/Hm0OqZOf4fUVGbJcX/v
 0yoO8ChL4N1RfDwwzm7EWL17f4rsNj5c1OWYhy0bXmWSBHX5o8Ch0IMwY8zsMI1OC27GZhM8ykk
 fk2NOwIXueJnnJ+c=
X-Received: by 2002:a1c:a186:: with SMTP id k128mr15930123wme.6.1635240138969; 
 Tue, 26 Oct 2021 02:22:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+Wv9732CBDrYD3m7qQorRR2XWX3L71LdQZ5Q67cKClxnyclGm2mpTRlRLWGgbYc/vX6K0nw==
X-Received: by 2002:a1c:a186:: with SMTP id k128mr15930097wme.6.1635240138738; 
 Tue, 26 Oct 2021 02:22:18 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id v191sm23799wme.36.2021.10.26.02.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 02:22:18 -0700 (PDT)
Date: Tue, 26 Oct 2021 10:22:15 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/9] qapi: New special feature flag "unstable"
Message-ID: <YXfIx171QE5ig/Pw@work-vm>
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-2-armbru@redhat.com>
 <YXewOaSDEXJDYV+1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YXewOaSDEXJDYV+1@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, quintela@redhat.com, qemu-devel@nongnu.org,
 eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 Markus Armbruster <armbru@redhat.com>, libvir-list@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kevin Wolf (kwolf@redhat.com) wrote:
> Am 25.10.2021 um 07:25 hat Markus Armbruster geschrieben:
> > By convention, names starting with "x-" are experimental.  The parts
> > of external interfaces so named may be withdrawn or changed
> > incompatibly in future releases.
> > 
> > Drawback: promoting something from experimental to stable involves a
> > name change.  Client code needs to be updated.
> > 
> > Moreover, the convention is not universally observed:
> > 
> > * QOM type "input-barrier" has properties "x-origin", "y-origin".
> >   Looks accidental, but it's ABI since 4.2.
> > 
> > * QOM types "memory-backend-file", "memory-backend-memfd",
> >   "memory-backend-ram", and "memory-backend-epc" have a property
> >   "x-use-canonical-path-for-ramblock-id" that is documented to be
> >   stable despite its name.
> > 
> > We could document these exceptions, but documentation helps only
> > humans.  We want to recognize "unstable" in code, like "deprecated".
> > 
> > Replace the convention by a new special feature flag "unstable".  It
> > will be recognized by the QAPI generator, like the existing feature
> > flag "deprecated", and unlike regular feature flags.
> > 
> > This commit updates documentation and prepares tests.  The next commit
> > updates the QAPI schema.  The remaining patches update the QAPI
> > generator and wire up -compat policy checking.
> > 
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> 
> Obviously, replacing the old convention gets rid of the old drawbacks,
> but adds a new one: While using x- makes it very obvious for a human
> user that this is an unstable feature, a feature flag in the schema will
> almost certainly go unnoticed in manual use.

Agreed, I'd keep the x- as well.

Having said that, the x- represents a few different things (that we
don't currently distinguish):
  - experimental
  - for internal use
  - for debugging/human use

Dave

> Kevin
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


