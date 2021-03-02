Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0133632AC0E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:08:02 +0100 (CET)
Received: from localhost ([::1]:52002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCFN-00067R-1P
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lHC2V-0000YI-Qy
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:54:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lHC2S-0000O1-Ld
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:54:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614718479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r1j8NMEhAgYTyBf1WiHgSfc0TUumNZ7UztixpClsp1g=;
 b=PeCqai+woAZWZf4XI9HUuaOiQ3s1ExqAW30gYW2UmA96WeGePRNk3XPvi1XWtrV4xW3TBG
 3v7dAyQXgFC6cE/zagWcKdRFLGSdSqWmJT6UDMgLwziqqaTa6o7575nQoU08KktmGHqWCV
 NbpI0wYnt5/2A8P5W9DyDeiUHBGO2e4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-HoWBPha8PBSjmNsE2z2UQQ-1; Tue, 02 Mar 2021 15:54:36 -0500
X-MC-Unique: HoWBPha8PBSjmNsE2z2UQQ-1
Received: by mail-qt1-f199.google.com with SMTP id r1so14160166qtu.9
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 12:54:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r1j8NMEhAgYTyBf1WiHgSfc0TUumNZ7UztixpClsp1g=;
 b=JGXBgY4curebEFIuX6X9kdmDz4/G19v7i8ArW3zbQqGdag+3CbF7MqYaueuRM481DI
 2lS9YT0PSC23qo43jqQLjCYV+JOveyw09vyW9Wrgr2bakEsPzC25h3YlrN0Pt8n3r+36
 VYJ7zuRuJnyL4QW01U0GjVtSWpQnD4/UO1f/zCjmex/euDQqppT5HxGrh7vIBiv7Lo2s
 ChAQGjKOeCyTFO+MW0sQq6NtoFG98uOl8hiHVUV9mOZ6jCBg8WSoXffHN9hDJQJMn3mC
 HeWgo6y3naODosEP2XxyqUcfEvKO/hjU0go3m5DcTGwsAwD5lEuE+sAACVaMv/HVgmEQ
 ZAIg==
X-Gm-Message-State: AOAM5338o56Yz8ygljQpq2L8V4SCvk4MfEzTWKEL8ztgehq9yWu/+cjt
 /guaJ2mFxLXpSOVrzwZZptdRrzBNkitoe66ii73GQAwpbQJS58sFZQEdE5v03XvOocidWKG7DLv
 PShCOlmaFznnDU94=
X-Received: by 2002:a37:ab0f:: with SMTP id u15mr9741274qke.438.1614718475692; 
 Tue, 02 Mar 2021 12:54:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeLa7exf65Sst/hfzfwtQs/1PH2WNwQVPCjrtJLfFvcsvwr7ln11WOQH1Etx3PH8jtyeZS7Q==
X-Received: by 2002:a37:ab0f:: with SMTP id u15mr9741240qke.438.1614718475456; 
 Tue, 02 Mar 2021 12:54:35 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id l6sm5671096qke.34.2021.03.02.12.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 12:54:34 -0800 (PST)
Date: Tue, 2 Mar 2021 15:54:32 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 7/9] memory: introduce RAM_NORESERVE and wire it up in
 qemu_ram_mmap()
Message-ID: <20210302205432.GP397383@xz-x1>
References: <20210209134939.13083-1-david@redhat.com>
 <20210209134939.13083-8-david@redhat.com>
 <20210302173243.GM397383@xz-x1>
 <91613148-9ade-c192-4b73-0cb5a54ada98@redhat.com>
MIME-Version: 1.0
In-Reply-To: <91613148-9ade-c192-4b73-0cb5a54ada98@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 02, 2021 at 08:02:34PM +0100, David Hildenbrand wrote:
> > > @@ -174,12 +175,18 @@ void *qemu_ram_mmap(int fd,
> > >                       size_t align,
> > >                       bool readonly,
> > >                       bool shared,
> > > -                    bool is_pmem)
> > > +                    bool is_pmem,
> > > +                    bool noreserve)
> > 
> > Maybe at some point we should use flags too here to cover all bools.
> > 
> 
> Right. I guess the main point was to not reuse RAM_XXX.
> 
> Should I introduce RAM_MMAP_XXX ?

Maybe we can directly use MAP_*?  Since I see qemu_ram_mmap() should only exist
with CONFIG_POSIX.  However indeed I see no sign to extend more bools in the
near future either, so maybe also fine to keep it as is, as 4 bools still looks
okay - your call. :)

-- 
Peter Xu


