Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53BC32A78C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:20:15 +0100 (CET)
Received: from localhost ([::1]:43496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8gw-0007wb-Fr
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:20:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lH8eo-0006Vn-5l
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:18:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lH8em-0001LU-AJ
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:18:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614705479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4JsCXMLDbeIfKshJv13i6PmSeGDgju555UNeNmjq5Qg=;
 b=gZyJ+Z3Uxd1qL/rFU0KAqWnzxeqeBkgJtW5/pAJA/lN541T7BBywNrNWCWERwgCTL8smPA
 guV9CYW5rbTmVONLsxDEXj9wQOf/1dP+w0VmJvPnDOmhPSjavtlMDwIoJme2WYAcQcQenV
 Ze+ko3iGkgUD6SZHJERKNoovt9/p1KA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-PsHLOb_TN0SYbQ9IbcirDw-1; Tue, 02 Mar 2021 12:17:57 -0500
X-MC-Unique: PsHLOb_TN0SYbQ9IbcirDw-1
Received: by mail-qk1-f199.google.com with SMTP id o8so17448531qkl.3
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:17:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4JsCXMLDbeIfKshJv13i6PmSeGDgju555UNeNmjq5Qg=;
 b=mpXZceAxlURKikx1Gul9EPtkm3AF6WK13ppC0f4j0HD5lDZyrFVLeX6rIeQlduHyge
 fDL9x7JTA7XTieTDn4P1RQsrshz5ETlKOM3/Xt/O7XdJEsG8+xmvpAoBl7zmbhg+L0y6
 A13KkegBri9BQm6zyov3JTHZKJOiTQc9EXvhkbgLTaVTAa8TDNRC6+cEbswttljRTMdl
 RifTHpZD+yzdJ5UEcQGfsLHNE4+cVC5ejaBzUJMLOGxYfCHRkUM3060E288cKvYOHHzj
 ryY2Ir1kT41JJzvNhbixQtlkN1Hm1WxBMtN98OkmrILH8vyCDzwDvwtBGVt81ydwR3TF
 r+pw==
X-Gm-Message-State: AOAM533Q20M1e52rcWhz+wxCc3sL4CA/6Pa4WwCdjoCYwue4dGoY3Jz4
 tjI+UCK5yNGx6TPZ6G/mM1eTYTgjlzgv9iQUv0CvaPYKDEF2JuudR36Anta6c8UUOzyOcPT5kpH
 kqWlDme4xuXqJ7ZM=
X-Received: by 2002:a05:620a:15d:: with SMTP id
 e29mr21355073qkn.48.1614705477109; 
 Tue, 02 Mar 2021 09:17:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyenBAcqIOicNmP3Tz5faN2glKIwMEbRaENpCYuB46sLhd4ZuyS/4JgZSbQaYAovv/uKhhyQQ==
X-Received: by 2002:a05:620a:15d:: with SMTP id
 e29mr21355048qkn.48.1614705476889; 
 Tue, 02 Mar 2021 09:17:56 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id z196sm7427946qka.70.2021.03.02.09.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:17:56 -0800 (PST)
Date: Tue, 2 Mar 2021 12:17:54 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 6/9] softmmu/memory: pass ram_flags into
 memory_region_init_ram_shared_nomigrate()
Message-ID: <20210302171754.GL397383@xz-x1>
References: <20210209134939.13083-1-david@redhat.com>
 <20210209134939.13083-7-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209134939.13083-7-david@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
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

On Tue, Feb 09, 2021 at 02:49:36PM +0100, David Hildenbrand wrote:
> Let's forward ram_flags instead, renaming
> memory_region_init_ram_shared_nomigrate() into
> memory_region_init_ram_flags_nomigrate(). Forward flags to
> qemu_ram_alloc() and qemu_ram_alloc_internal().
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


