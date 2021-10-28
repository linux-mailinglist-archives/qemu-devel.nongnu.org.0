Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F5E43D9EF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:43:23 +0200 (CEST)
Received: from localhost ([::1]:40876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfwK2-00074v-9x
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfvb2-0003Z5-O5
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:56:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfvaz-0003Tq-2c
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635389807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H75VbJm6SRI/gNCK6VYC6iM2VpYB5o7ZhI3Ujpt1P3U=;
 b=JOCOy0cuO+SOgnfspn9/YDvZBSaL9Og3qH5AtOIjaxu4wMBLUmvcJBzxL6GfnJVGj6jUzF
 hCCvI2tBt7HQM2G1fcNxeoO5WVNFJuCgiDMT+PoyLEwubBexDoSomigqw668dFypeo2mk9
 9/CZZFFTfjEO1ECIDfZBA8Q4fpY6MBc=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-M3rFuP4ZNReAVi7ICGQ6zw-1; Wed, 27 Oct 2021 22:56:46 -0400
X-MC-Unique: M3rFuP4ZNReAVi7ICGQ6zw-1
Received: by mail-pl1-f198.google.com with SMTP id
 12-20020a170902c10c00b0014167ea00cbso2032321pli.9
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H75VbJm6SRI/gNCK6VYC6iM2VpYB5o7ZhI3Ujpt1P3U=;
 b=4N1W7Ko3CyLzlmAzbDjyP7v0Z8VFQijP/ZiOtbfkkZuQYzgLG/tjODG24v2XWCvJUu
 Uiim3L0I0uywnJJeIocQhyeOu+M/w+SL+jsVRrSoprAVUqfLI6yvC4HVJbxN5yHdndI3
 lmNBhRPp0qP1zriZek8qMg6B6n/bviQyHg/z+Lrf/Eb5INFnG9kak0m5BbL6r9Bvj9Mk
 BadDdxEMh4ytShhnqOaKKLjsDx8VeGRrNAZhW9OZgAAwFUnVPauf36o2RfTgL9/wMY9W
 XZe40bY/Jsv+BMqkfstQwx73hh4Ftl8UA9qtjEZ6z8aomMMj43cwTRSe07ddSUW1NHZY
 vmNg==
X-Gm-Message-State: AOAM530OX7ddZFKJeRCdocafQ17/5250CNWp4WbRZt9aGVm2PkIqrOJx
 H9IP/VP+Ev72lBAzH1U1hN2lKOh+2oCjr3U13PHvR/E7e/RdB35w6GBtNWyVOfO/7vMQBPGCcHB
 07Y7+xQ5LgHFKVTw=
X-Received: by 2002:aa7:8b0d:0:b0:44c:89ca:7844 with SMTP id
 f13-20020aa78b0d000000b0044c89ca7844mr1536493pfd.19.1635389805070; 
 Wed, 27 Oct 2021 19:56:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMIddhNaEjZ9aVTh/GK3QBY/wOOarZR17ImxmKEkPd67fjOHcXDdXVt73RputbY4JFacq67Q==
X-Received: by 2002:aa7:8b0d:0:b0:44c:89ca:7844 with SMTP id
 f13-20020aa78b0d000000b0044c89ca7844mr1536468pfd.19.1635389804803; 
 Wed, 27 Oct 2021 19:56:44 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.60])
 by smtp.gmail.com with ESMTPSA id d137sm1285152pfd.72.2021.10.27.19.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:56:44 -0700 (PDT)
Date: Thu, 28 Oct 2021 10:56:38 +0800
From: Peter Xu <peterx@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 5/8] pci: Add pci_for_each_root_bus()
Message-ID: <YXoRZu/g8fHkIcS7@xz-m1.local>
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-6-peterx@redhat.com>
 <20211025091435-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211025091435-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 25, 2021 at 09:16:53AM -0400, Michael S. Tsirkin wrote:
> > +void pci_for_each_root_bus(pci_bus_fn fn, void *opaque)
> > +{
> > +    pci_root_bus_args args = { .fn = fn, .opaque = opaque };
> > +
> > +    object_child_foreach_recursive(object_get_root(), pci_find_root_bus, &args);
> > +}
> >  
> >  PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn)
> >  {
> 
> 
> How about adding an API with a type filter to the qom core?
> E.g.
> object_child_foreach_type_recursive getting a type.

Sounds good, will do.  Thanks,

-- 
Peter Xu


