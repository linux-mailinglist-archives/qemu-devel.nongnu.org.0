Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BCD3EE6F9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 09:07:29 +0200 (CEST)
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFtC3-0003I0-Ol
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 03:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mFtAp-0002aM-Uu
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 03:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mFtAm-0002QN-Gf
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 03:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629183966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ACHPJbIdKDUhS/odG6yGvHlRzyASudkbg/mNYu8Y77o=;
 b=WaMiloilH8W4/iZb63qX4uebH6uvtyj5acOQ3QGmxOYThr9LvCGRgDYATOdWFQ0T2sx2z6
 699ECVjZ4fAHImSCDGarV8RQHDG5iUGAOXzValXwXMGaR+fUPLOwY3W4hAH6M1ZK3wKbrj
 Te15zQrURFeDj7zNph55bBrdv2s4kGY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-2cOsDNMgOHyiUFAstErAqQ-1; Tue, 17 Aug 2021 03:06:05 -0400
X-MC-Unique: 2cOsDNMgOHyiUFAstErAqQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 k12-20020a170906680cb02905aeccdbd1efso5630391ejr.9
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 00:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ACHPJbIdKDUhS/odG6yGvHlRzyASudkbg/mNYu8Y77o=;
 b=ckV3nfFM6X5o4u1QpOn9OgeJoUg5WS8yS2F34SL/vChLNHVAtAXXc/GmEDEHAnTGS7
 LYO3l+xMTWgJ7ZJB7K6nmp7zIe9l8dOlO7cjhA///s9cy1t9R1y7BVfJigN9LYGrYdkB
 3ySv0oTxARbuc/ldWqlOjJhpdTPOp3B/Dhe9UVj5OvS21cRNjJQYxkmRTBKogUjWHjDi
 PYLX9OOUlDolX/7vbeMP6/uEOtnw81+aVE5ioUakFGV5G5+vdmQo0eBTtifgdD5GdarB
 27DOhoVlWo5YMwSnTklbOCTtP3mjeU7f+uSl2syZCGMg9AhiCTsq4j/V6wEtfH3MylEZ
 Gtog==
X-Gm-Message-State: AOAM532CP6YKr40162mixYFuJmkZm+CVZ/gbc56oukG78i9gvvHsZCzu
 ihJNEtg5dh+8Ef9q/VLM4cDYyNmyklOMT/E+ANmzykbDz/qPB+NLC8QOR9uZ4ylOlCgRGK6ccWP
 ACGOVge6AVKxWjgA=
X-Received: by 2002:a17:907:7883:: with SMTP id
 ku3mr2397749ejc.453.1629183964555; 
 Tue, 17 Aug 2021 00:06:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWnXeTRbnJ+IA8um/1WaCevePcTlg5rkoMqIos60WP0jOTxWS8o35Ua2QT0cMewf32pgMF2A==
X-Received: by 2002:a17:907:7883:: with SMTP id
 ku3mr2397720ejc.453.1629183964381; 
 Tue, 17 Aug 2021 00:06:04 -0700 (PDT)
Received: from redhat.com ([2.55.150.133])
 by smtp.gmail.com with ESMTPSA id h10sm564625edb.74.2021.08.17.00.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 00:06:03 -0700 (PDT)
Date: Tue, 17 Aug 2021 03:05:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Steve Rutherford <srutherford@google.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
Message-ID: <20210817024924-mutt-send-email-mst@kernel.org>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: thomas.lendacky@amd.com, Ashish Kalra <Ashish.Kalra@amd.com>,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org, tobin@ibm.com,
 jejb@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 dgilbert@redhat.com, frankeh@us.ibm.com, dovmurik@linux.vnet.ibm.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 04:53:17PM -0700, Steve Rutherford wrote:
> Separately, I'm a little weary of leaving the migration helper mapped
> into the shared address space as writable. Since the migration threads
> will be executing guest-owned code, the guest could use these threads
> to do whatever it pleases (including getting free cycles). The
> migration helper's code needs to be trusted by both the host and the
> guest. Making it non-writable, sourced by the host, and attested by
> the hardware would mitigate these concerns.

Well it's an ABI to maintain against *both* guest and host then.

And a separate attestation isn't making things easier to manage.

I feel guest risks much more than the hypervisor here,
the hypervisor at worst is giving out free cycles and that can
be mitigated, so it makes sense to have guest be in control.

How about we source it from guest but write-protect it on the
hypervisor side? It could include a signature that hypervisor could
verify, which would be more flexible than hardware attestation.

-- 
MST


