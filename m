Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 816C568DBE3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:43:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPBS-0000tT-3c; Tue, 07 Feb 2023 09:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPPBQ-0000tG-7W
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:42:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPPBO-00020l-B3
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675780973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ugR8Scgm50Zn3kKriW/gus6lslDuLfKFTuofnttDaM=;
 b=YuPpZo7bU8lPOdi/zWUnL/LpopxWq2qOMli1Bun0PMElNchvyYE57cVKSGdsS5ff8xD2+a
 AhL19SbzcIQg2zg+QTqxdSy4ALDXlntfHTHufBQd1UUS+Ffgg589/FuJbih5Flrs/SBot3
 7KEXt0mtU/D6bDZo6BZ0/3pEXXsgcZE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670-K8h4jBhfMlOUptpYQ0l4zg-1; Tue, 07 Feb 2023 09:42:50 -0500
X-MC-Unique: K8h4jBhfMlOUptpYQ0l4zg-1
Received: by mail-wm1-f69.google.com with SMTP id
 n4-20020a05600c3b8400b003dfe223de49so8056620wms.5
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:42:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ugR8Scgm50Zn3kKriW/gus6lslDuLfKFTuofnttDaM=;
 b=R4GRAF1Oa+apek8DF/eIl74l9mUPrhMJz0sVhMdiooQI74CvcWH8nGEEiPCgAb5LFG
 QH8OXDFQ2OvC4SoYul5Oi+Bh5jP/QmG3zE6pQWJTbwWMDrO+RJLaVWsSt6vQZDV6R5+Y
 IWCc7UpmOHiXf40KS+AJAP9GwGdJ7saSEpG6I1iYM8ZrrshGZef/cgoZ0vnGZre/fkIG
 l+ijxQQjJchvQB4lcKkBHLWEYHuST3vfmfQlwkSG0AFZehO074E4qatMHW+5X+jqK52r
 9YQRDZ7fiTlDPPnKw6f9oYwMNmhxr7bwJIM7a0BW2qRt+3rIm/BWGrUfw501pcdoGcm2
 d0lg==
X-Gm-Message-State: AO0yUKXf4QSg99QoMJWZjXw88Lri8x6oqYVUOgerp/Ed8nMiv6bSDF7k
 84kkJx3g6c5MT92gvBqIFnauHi9cc45xDLFrs+pWRXW22frTWXUsm4pfpoC2vpM75/VFlUi+C4H
 KJjV7+8tJ+8KNBro=
X-Received: by 2002:adf:edc9:0:b0:2c0:6217:8459 with SMTP id
 v9-20020adfedc9000000b002c062178459mr3146134wro.16.1675780968874; 
 Tue, 07 Feb 2023 06:42:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+nk4tH0cTqha9JaDW+N5cW4k31yfASURbnkPiLDt3f3fZmDTFolf8hwe6tzdr4oehaOuZycw==
X-Received: by 2002:adf:edc9:0:b0:2c0:6217:8459 with SMTP id
 v9-20020adfedc9000000b002c062178459mr3146127wro.16.1675780968686; 
 Tue, 07 Feb 2023 06:42:48 -0800 (PST)
Received: from redhat.com ([2.52.8.17]) by smtp.gmail.com with ESMTPSA id
 o15-20020a5d684f000000b002c3f03d8851sm2985749wrw.16.2023.02.07.06.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:42:48 -0800 (PST)
Date: Tue, 7 Feb 2023 09:42:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 11/12] tests/qtest: bios-tables-test: Skip if missing
 configs
Message-ID: <20230207094103-mutt-send-email-mst@kernel.org>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-12-farosas@suse.de>
 <218e02c0-efed-1461-e9d5-6bee0a5ecbbc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <218e02c0-efed-1461-e9d5-6bee0a5ecbbc@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Feb 07, 2023 at 03:35:56PM +0100, Thomas Huth wrote:
> On 06/02/2023 16.04, Fabiano Rosas wrote:
> > If we build with --without-default-devices, CONFIG_HPET and
> > CONFIG_PARALLEL are set to N, which makes the respective devices go
> > missing from acpi tables.
> > 
> > Signed-off-by: Fabiano Rosas <farosas@suse.de>
> > ---
> > I currently don't see a way of allowing the tests to pass in the
> > absence of these two configs. As far as I understand, we would need to
> > have one set of expected table files (tests/data/acpi) for each
> > combination of machine vs. possible CONFIG that can be toggled.
> 
> I think you're right ... maintaining tables for each combination does not
> scale. Disabling the test in that case is likely the best we can do here
> right now.
> 
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index a930706a43..2829eda2c9 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -78,7 +78,9 @@ qtests_i386 = \
> >      config_all_devices.has_key('CONFIG_Q35') and                                             \
> >      config_all_devices.has_key('CONFIG_VIRTIO_PCI') and                                      \
> >      slirp.found() ? ['virtio-net-failover'] : []) +                                          \
> > -  (unpack_edk2_blobs ? ['bios-tables-test'] : []) +                                         \
> > +  (unpack_edk2_blobs and                                                                    \
> > +   config_all_devices.has_key('CONFIG_HPET') and                                            \
> > +   config_all_devices.has_key('CONFIG_PARALLEL') ? ['bios-tables-test'] : []) +             \
> >     qtests_pci +                                                                              \
> >     qtests_cxl +                                                                              \
> >     ['fdc-test',
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>


One thing we could do is move this code to an SSDT by itself.  Then
there's two variants of e.g. HPET SSDT: with and without CONFIG_HPET.
Needs ACPI work though. Igor what do you think? Worth it?


-- 
MST


