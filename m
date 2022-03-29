Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BCA4EAC65
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 13:34:59 +0200 (CEST)
Received: from localhost ([::1]:56630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZA7m-0004jB-IY
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 07:34:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nZA41-0003Gb-Ho
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 07:31:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nZA3y-00023z-Gk
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 07:31:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648553461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDA0vtN1gsVFcdCar/RDCOGnQ+oBbRCL8Kvc2No9b+k=;
 b=ijZEW4WV5SortaLg8rNTecO/hLg6U5dxZZ/2DuMZXzXzqsFcG024Vinj3CQ0R1EbGAhqu9
 IomFOB7m9NVzQ5XcYT+wSdcjaHaC52ocVpz1pvg13FTNEzOx9Ul3amduWIAtEakuF3TWWA
 yLUZ4EwWw+w/Z2yUDMaRsinHBZQKMWQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-xEb5z2giP-yc0bmVhgcFjQ-1; Tue, 29 Mar 2022 07:30:59 -0400
X-MC-Unique: xEb5z2giP-yc0bmVhgcFjQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r9-20020a1c4409000000b0038c15a1ed8cso798388wma.7
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 04:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=qDA0vtN1gsVFcdCar/RDCOGnQ+oBbRCL8Kvc2No9b+k=;
 b=0ex7u73pMR4zwAkoZt+dzRYbDUMzNURGgaffQ/pUC+BEasZw4RLX7CLUeubhYYdtWm
 8uJm344/HnnZW2iGwLlgi02HJKJbvKkHNSY26Q+NFZgj9WLJZhiaHbc7MZoP7pOM4Wui
 hXNKBjtF1q0sMSyW/r0BiMOnl7Ek3SgHCPUI8nAYvP2zgrXKGo7b3tKUKMZ1Q8kIsZoO
 NPIvv15pfC8VZkHNP276UYFJA1P50GsOSA40850kg4KLJdkm9bZ923TO3jLt6bBoDYOf
 mZMc7BgsZwB8UvW7nR8dzsP2BjkXBl5/VBo7G8vTu/n41L8gGuhyewK9RwpnLFFXHQyW
 fGng==
X-Gm-Message-State: AOAM532ZeRvyOXiueEZf9k4bhnQgnRcLzotySvCeQ98UyqcBFU3fDPk7
 AsiLWLsHMThU88QGXMnLEf8YWwHIt+/1D7v0tbxoRi5fxTdsvXBjIBZmcFs10nT1gzH81H2DV2W
 l3hBTVGjP1xWz80c=
X-Received: by 2002:adf:82b2:0:b0:203:f34d:dff with SMTP id
 47-20020adf82b2000000b00203f34d0dffmr30070558wrc.661.1648553457841; 
 Tue, 29 Mar 2022 04:30:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfdJK8IhjBK0iihC3UuY5QNaJRIf0REwH1FPbrKAt1yMAe60s2ZE4gG1rEiTRZAaLlndn3Fg==
X-Received: by 2002:adf:82b2:0:b0:203:f34d:dff with SMTP id
 47-20020adf82b2000000b00203f34d0dffmr30070530wrc.661.1648553457630; 
 Tue, 29 Mar 2022 04:30:57 -0700 (PDT)
Received: from ?IPv6:2a0c:5a80:3506:3400:69b5:c807:1d52:ff67?
 ([2a0c:5a80:3506:3400:69b5:c807:1d52:ff67])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038c9249ffdesm2227176wmq.9.2022.03.29.04.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 04:30:57 -0700 (PDT)
Message-ID: <fb2014811c7c7c26c598f4144dc8bb97bbd80465.camel@redhat.com>
Subject: Re: [PATCH v3 2/3] util/main-loop: Introduce the main loop into QOM
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Date: Tue, 29 Mar 2022 13:30:56 +0200
In-Reply-To: <877d8uug2e.fsf@pond.sub.org>
References: <20220316135321.142850-1-nsaenzju@redhat.com>
 <20220316135321.142850-3-nsaenzju@redhat.com> <877d8uug2e.fsf@pond.sub.org>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, eduardo@habkost.net, hreitz@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Markus,

On Wed, 2022-03-16 at 15:28 +0100, Markus Armbruster wrote:
> Nicolas Saenz Julienne <nsaenzju@redhat.com> writes:
> 
> > 'event-loop-base' provides basic property handling for all 'AioContext'
> > based event loops. So let's define a new 'MainLoopClass' that inherits
> > from it. This will permit tweaking the main loop's properties through
> > qapi as well as through the command line using the '-object' keyword[1].
> > Only one instance of 'MainLoopClass' might be created at any time.
> > 
> > 'EventLoopBaseClass' learns a new callback, 'can_be_deleted()' so as to
> > mark 'MainLoop' as non-deletable.
> > 
> > [1] For example:
> >       -object main-loop,id=main-loop,aio-max-batch=<value>
> > 
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
> [...]
> 
> > diff --git a/qapi/qom.json b/qapi/qom.json
> > index eeb5395ff3..10800166e8 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -528,6 +528,19 @@
> >              '*poll-shrink': 'int',
> >              '*aio-max-batch': 'int' } }
> >  
> > +##
> > +# @MainLoopProperties:
> > +#
> > +# Properties for the main-loop object.
> > +#
> > +# @aio-max-batch: maximum number of requests in a batch for the AIO engine,
> > +#                 0 means that the engine will use its default (default:0)
> > +#
> > +# Since: 7.1
> > +##
> > +{ 'struct': 'MainLoopProperties',
> > +  'data': { '*aio-max-batch': 'int' } }
> > +
> 
> IothreadProperties has the same member, with the same documentation.
> 
> Do main loop and iothreads have a common ancestor, conceptually?
>
> If yes, it might make sense for MainLoopProperties and
> IothreadProperties to have a common base type, and put @aio-max-batch
> there.  This is not a demand.

Yes it could make sense, in terms of the QOM they both inherit from the same
base abstract class, called EventLoopBase.

On top of that, patch #3 adds two more common properties. So doing so would
avoid some amount of duplication. I'll look into it and prepare a v4 of the
series.

Thanks!

-- 
Nicolás Sáenz


