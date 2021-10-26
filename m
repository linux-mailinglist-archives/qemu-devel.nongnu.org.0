Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF7C43AFEF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:19:50 +0200 (CEST)
Received: from localhost ([::1]:51878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJYb-0004rR-N2
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfJXB-0004BU-Mm
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:18:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfJX6-00030u-Hn
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635243495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BjCwWlg+Sjwq27e/3slNW7toAQ3gtmzc/I+XhFmhihs=;
 b=hLbyV8+L5hTw2vO08QGfd57KSnxoCq6iJzOCfYWiqlrLHpJYqgqTiqEiHCijTURoossug8
 qISS4QPK7Ug/t0W2Ydi/BStlh3cZ991ld/reu57Rie4JZ3QfqVs7AhYuDTHdGGKZwUJVgS
 7xlfyw8Bfeo8WsfncKKzAQDU/icfKFU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-qYKk1njvNPaeFxIgfOydyg-1; Tue, 26 Oct 2021 06:18:14 -0400
X-MC-Unique: qYKk1njvNPaeFxIgfOydyg-1
Received: by mail-wm1-f69.google.com with SMTP id
 g9-20020a1c9d09000000b0032cc23db051so745782wme.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BjCwWlg+Sjwq27e/3slNW7toAQ3gtmzc/I+XhFmhihs=;
 b=bu/jb9n5EWtuaEX/rBccydWZ7dc1y4iJW4fLXwb+iZrYlPaOy/hT+6FTLMcxixSVYx
 Ga4NsH5ZemxI47ZO6v0Uj9Mt7BjqdiiqzpIfDB6BEVXf8nYe8urgTw4nkMxZDRLNgmYM
 p+jszI5th24RykfosxxjC0kSKonsxM1EhBleMo4DYev9xkQjnIZzkHXdCH5QXPA7zkml
 4/R3WqLb81Jaj5+E6a4ijuJRzsQdp86pIjCUvmULquDt6BNe0wSpDaZMnaRKgCK/yoET
 DIl0qdvZlPrZzBxlnWM9WIN1vohfd2lGg061EMrrxqqXJ+ZcdsNbCL93duZ9/AqHjbkp
 56rQ==
X-Gm-Message-State: AOAM530r7V7s+zPM3jBFoBd/L0l7O2yXKcCl70+ra6WKtkLL49apVbpM
 6BbNMLs++taJUfh7C2pPdXs6BPGJwBJCTrRC18RZBP3Lk43feieV56X83YTvYGO/9J1VbTLR6om
 FXBqULw4FwCJv8Q4=
X-Received: by 2002:adf:c78d:: with SMTP id l13mr29710314wrg.134.1635243492911; 
 Tue, 26 Oct 2021 03:18:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrTUDVX/lDvo1cZsNrHOhQdU4rxetE7x7o8/b3FxnMcrLjSXE5wT05QANnZJ2fIidvi4e0TA==
X-Received: by 2002:adf:c78d:: with SMTP id l13mr29710284wrg.134.1635243492724; 
 Tue, 26 Oct 2021 03:18:12 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id b8sm1563558wri.53.2021.10.26.03.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:18:11 -0700 (PDT)
Date: Tue, 26 Oct 2021 11:18:10 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v7 0/4] VNC-related HMP/QMP fixes
Message-ID: <YXfV4vf5+YLFXYbA@work-vm>
References: <20211021100135.4146766-1-s.reiter@proxmox.com>
 <87k0i6d5l5.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87k0i6d5l5.fsf@dusky.pond.sub.org>
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Stefan Reiter <s.reiter@proxmox.com>, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> I'm done reviewing.  David, care to have another look at the HMP part?

Yep, looking good to me - is that going via qmp, hmp, or vnc ?

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


