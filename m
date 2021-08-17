Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F84A3EEC5C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 14:24:14 +0200 (CEST)
Received: from localhost ([::1]:43960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFy8b-0001J4-4N
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 08:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mFy7C-0000D6-CZ
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 08:22:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mFy7A-000584-FS
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 08:22:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629202963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iITD4CTk33j3XhyZzOBXzlhTg5c+Fqf6CjzioqJxTNs=;
 b=DtbXosMtA/yfXlnqPe7X82IF5FbH2vIeLAsfi+x+dSzOdh5B6T2aNdmgThmV5lWQt1it/x
 TOQKC8/a5mmkGaueb2ACYi4fOH1woZItGKHYa0CjGGekGkrUN8wTjs012/4GFjEXVizb6Q
 Bvw2cP4SUkiBWwD8T4qGktP2nkzTYw4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-WVyQShhEPfy1qDNyhlOKwQ-1; Tue, 17 Aug 2021 08:22:42 -0400
X-MC-Unique: WVyQShhEPfy1qDNyhlOKwQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 u23-20020a1709064ad700b005bb12df6cb9so2853979ejt.20
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 05:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iITD4CTk33j3XhyZzOBXzlhTg5c+Fqf6CjzioqJxTNs=;
 b=LFQnfIQPdqo+2oyiGUBpnB34TV+eTgMmNcNq5taIES1CLfxEUXLyet9/jz90QqRlCS
 B20EqJOr/ksbq/sz+/SW7yjSBK6G/Dl+7txJqF8zmDrwJxn44ILwvsMHbUIV+gS7JEAl
 WqeVqQwz6YdZSx4gZeONAO9em217jWmWHBecArgzqw+Ah/go9kXYiLwrUijxgz3y5jeV
 KLVZg7KItBhmgcGhq+yiETWVWs0APYxN+wZ/hb4qI0E2GI6Ew0sVXz3j6X4OKWVdq8uu
 6/884f3jPZmBabLkhoHcQF0l+PylvwDZRauFBYZ2cnmvZRuSs8FMfiHADI2sr6pwAAUY
 QKTg==
X-Gm-Message-State: AOAM53264XXt/bWiJ8u5Y8BnUwzv6lPLsWEmH3IrfqswvkZTUMxObs/B
 pjLo13VRCDrqlTK84J66yBSLPK5u5E2a2/UFymBhFgDwYmWYqpCsxVUZWawjrwYBmpiSvVSqSP4
 Q9sRL7cCQ9VhK6yE=
X-Received: by 2002:a05:6402:27d2:: with SMTP id
 c18mr3938800ede.87.1629202961129; 
 Tue, 17 Aug 2021 05:22:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDOqhoXcDT/piNlS24eqY2qLM5jnFMIAkV575Cm6krJRhuh8wmXJ2P3VcldfWB3dSkcUYocw==
X-Received: by 2002:a05:6402:27d2:: with SMTP id
 c18mr3938771ede.87.1629202960914; 
 Tue, 17 Aug 2021 05:22:40 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id a3sm1001106edu.46.2021.08.17.05.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 05:22:40 -0700 (PDT)
Date: Tue, 17 Aug 2021 14:22:38 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 1/1] machine: Disallow specifying topology parameters as
 zero
Message-ID: <20210817122238.hb2dk2a2zmhqrv7h@gator.home>
References: <20210816210603.42337-1-ehabkost@redhat.com>
 <20210816210603.42337-2-ehabkost@redhat.com>
 <CABgObfaWxNsq2i8j6P+oZGFjxyR3MFE9FopHsnvuNAPXa4upYQ@mail.gmail.com>
 <20210817120250.fdpujloefaqtawwo@gator.home>
 <CAFEAcA_fOa4uV3sA5kxJ1gKTGS3ASgvx2+FrG=5cr0wWaQ48-Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_fOa4uV3sA5kxJ1gKTGS3ASgvx2+FrG=5cr0wWaQ48-Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 17, 2021 at 01:06:19PM +0100, Peter Maydell wrote:
> On Tue, 17 Aug 2021 at 13:02, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Mon, Aug 16, 2021 at 11:37:21PM +0200, Paolo Bonzini wrote:
> > > How do we know that no one has ever used such configuration? The conversion
> > > was meant to be bug-compatible.
> >
> > We don't. But we do know that a zero input value was never documented
> > prior to 1e63fe68580, which has not yet been released. Can we claim
> > that an undocumented input value has undefined behavior, giving us
> > freedom to modify that behavior until it is documented?
> 
> Dunno; I definitely don't want a behaviour-change patch at this
> point in the release-cycle, though...
>

Can we replace this patch with the following one for now? And then
discuss this further before committing to supporting a zero input?

Thanks,
drew

Author: Andrew Jones <drjones@redhat.com>
Date:   Tue Aug 17 14:17:29 2021 +0200

    qapi/machine.json: Remove zero value reference from SMPConfiguration documentation
    
    Commit 1e63fe685804 ("machine: pass QAPI struct to mc->smp_parse")
    introduced documentation stating that a zero input value for an SMP
    parameter indicates that its value should be automatically configured.
    This is indeed how things work today, but we'd like to change that.
    Avoid documenting behaviors we want to leave undefined for the time
    being, giving us freedom to change it later.
    
    Fixes: 1e63fe685804 ("machine: pass QAPI struct to mc->smp_parse")
    Signed-off-by: Andrew Jones <drjones@redhat.com>

diff --git a/qapi/machine.json b/qapi/machine.json
index c3210ee1fb24..157712f00614 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1288,7 +1288,7 @@
 ##
 # @SMPConfiguration:
 #
-# Schema for CPU topology configuration.  "0" or a missing value lets
+# Schema for CPU topology configuration.  A missing value lets
 # QEMU figure out a suitable value based on the ones that are provided.
 #
 # @cpus: number of virtual CPUs in the virtual machine


