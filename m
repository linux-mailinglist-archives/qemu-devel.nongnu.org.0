Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA10632A78F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:21:41 +0100 (CET)
Received: from localhost ([::1]:47202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8iK-000177-U8
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lH8eT-00068u-De
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:17:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lH8eR-0001Dg-H3
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614705458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J5ZFiE0ngPmpdFrSQisrhlE6g3KPJk3IilkjI0RK0To=;
 b=ZrUan9loRamaIf9jwa7O1BGePJQ0Gz7UqKhsrbsUcI2PF8fjyoPPdeLwTGmNqyW4yKpkhV
 Ymdl2hBetX9y/ozCbG05V0DZe4ASlstmVz2tKgJOExMTwBt6FZlC0l4/y5kxGJNuTLrsCT
 FwrfcVVfxbQ4xrPjHtN1xfnK6/13dtI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-et8CjnL7NPa4XX_8ehcJ3A-1; Tue, 02 Mar 2021 12:17:36 -0500
X-MC-Unique: et8CjnL7NPa4XX_8ehcJ3A-1
Received: by mail-qt1-f198.google.com with SMTP id w33so4731806qte.11
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:17:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J5ZFiE0ngPmpdFrSQisrhlE6g3KPJk3IilkjI0RK0To=;
 b=GFvOh23F6NfqK74ZRi2hjRbyF4zdO5IfpKE0mqfSMoR66B2ryX4y37IYMTBtSVdtl0
 kcWvaCpgDx9AbhYZ7o20f3Bhh4x7FVerDbGVLkiKb2MrdIwxZS8TWWFWx6o0d5NG74w9
 rywuNjJIj58uQLJX6iwGIj+ixs15Fmmf+oEVRpOLxUd/5O6OMHTIxAcvevQ4kNqqMrVC
 G1LXVpWqEJk0dGwuUWB/PgTLmq1H2Evlju/Z8dsNkWNutjMbZrHQBBOpT6aKNlL4HteF
 rlqh49+JitnZ83cscSNw3hKDaR9j/tj5GEpownVfPZHlaPE09q8qRFXSgSbSMQ7BTROF
 I1zA==
X-Gm-Message-State: AOAM532+SlBjWjiUH98Q0MZ5VeQKAbS8e2LN3OnI25umExm8ExI4eslj
 sUsRZC0hBQGQ8eD3RPeu4gvOWuradOoqt0uRPlgWRNg2+ImWU3XG5t/QNCCwo88TKnVAzVAHYkL
 +Q1AjDBjDmURgOBo=
X-Received: by 2002:a37:7245:: with SMTP id n66mr21161677qkc.374.1614705455919; 
 Tue, 02 Mar 2021 09:17:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrTuBix82Mzhr1DbAR6wRQ6rIKqU7T43/2QDfVPA9EMLG7rqSwm3w/VluxhOjjqxtI1w8raA==
X-Received: by 2002:a37:7245:: with SMTP id n66mr21161646qkc.374.1614705455708; 
 Tue, 02 Mar 2021 09:17:35 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id b63sm24708qkd.84.2021.03.02.09.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:17:35 -0800 (PST)
Date: Tue, 2 Mar 2021 12:17:33 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 5/9] softmmu/memory: pass ram_flags into
 qemu_ram_alloc_from_fd()
Message-ID: <20210302171733.GK397383@xz-x1>
References: <20210209134939.13083-1-david@redhat.com>
 <20210209134939.13083-6-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209134939.13083-6-david@redhat.com>
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

On Tue, Feb 09, 2021 at 02:49:35PM +0100, David Hildenbrand wrote:
> Let's pass in ram flags just like we do with qemu_ram_alloc_from_file(),
> to clean up and prepare for more flags.
> 
> Simplify the documentation of passed ram flags: Looking at our
> documentation of RAM_SHARED and RAM_PMEM is sufficient, no need to be
> repetitive.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


