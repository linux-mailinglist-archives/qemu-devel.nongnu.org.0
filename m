Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5541346A5E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:42:22 +0100 (CET)
Received: from localhost ([::1]:44860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOnr3-0005Pz-NP
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOnpY-0004Yg-R8
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:40:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOnpW-0002NY-0h
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616532043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uUWqG+q96tGrMdE42HcZnprdAhHvoUL0YBwDwH3hpvk=;
 b=Tgkq6keH7T6nj8MAz5l4uJ5k1zx9LPSkXBrXsdRVbonzFM/sfSughjp1NXumLV8XoLjxKj
 jbb/g7xGWqPSmb+GYlLNGInIgSuWS6IcJ6cw3gmbIQbMlcOPXBIEYPF4ZsnVOSc0jltYob
 Q8B+RYgu7A3x1OJ7sERYsm1qVFWwrvs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-ppP1g1pQOdOpFt1uCH-AGg-1; Tue, 23 Mar 2021 16:40:41 -0400
X-MC-Unique: ppP1g1pQOdOpFt1uCH-AGg-1
Received: by mail-qv1-f72.google.com with SMTP id t18so22314qva.6
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 13:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uUWqG+q96tGrMdE42HcZnprdAhHvoUL0YBwDwH3hpvk=;
 b=Pg4LZXDvzNxZbnTDH1t0KMY0/4YA5gDn5AbiW53xY7vHSy2cdaW7+TftsAOW/SE1rK
 Yb4hkFOtHMNpbkK+RplBBAR9Vl9WnCTcC7wD7Y7P1q0NF7VOCMgrPGzrHhehTM/6UXym
 kl+l/jNvZsl2PQNYBQbxjhtfs8UBdBTCys3zf3fd0t3ZW6Uem97fupMcUiyrHw1MuTrM
 iJUUDlTRLSLgqpl1DJXnpSoyTqcfxWx8N5HrDxFePjpUEx3YaDFWmqoxD1eoDC8fhqB8
 yAvhYfH7Sf/etquT/H7BwwVMmq10lC2nVnISun7tSCskOZGEn3IWlgxv5eBCdClU4zJ4
 czRw==
X-Gm-Message-State: AOAM530Pnrt8MKTUGNgeemN9G0oxCUaLztYrFxlUBWWrvAI5rsb8xrbu
 Fo5EiqUpjQFwDOz++P1SveRt0kp1dQqePRUnrnZEbLCFHDV7vj6T9i77rU47lR8LebclAYw+0PH
 R8GOCDbkoHSMIO7s=
X-Received: by 2002:ac8:745a:: with SMTP id h26mr136299qtr.79.1616532041239;
 Tue, 23 Mar 2021 13:40:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJIiDRG2KCCG6SQTbxd+MQFwn7Xdlz6KMtqkhpSpZCimjmE7RIf4W55dzL5pk/4q19MQa5Rw==
X-Received: by 2002:ac8:745a:: with SMTP id h26mr136272qtr.79.1616532040989;
 Tue, 23 Mar 2021 13:40:40 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id g11sm41655qkk.5.2021.03.23.13.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 13:40:40 -0700 (PDT)
Date: Tue, 23 Mar 2021 16:40:38 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 03/14] softmmu/physmem: Fix qemu_ram_remap() to handle
 shared anonymous memory
Message-ID: <20210323204038.GK6486@xz-x1>
References: <20210319101230.21531-1-david@redhat.com>
 <20210319101230.21531-4-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210319101230.21531-4-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 19, 2021 at 11:12:19AM +0100, David Hildenbrand wrote:
> RAM_SHARED now also properly indicates shared anonymous memory. Let's check
> that flag for anonymous memory as well, to restore the proper mapping.
> 
> Fixes: 06329ccecfa0 ("mem: add share parameter to memory-backend-ram")
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


