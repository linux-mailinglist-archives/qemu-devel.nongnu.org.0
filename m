Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A9934E6EF
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 13:55:22 +0200 (CEST)
Received: from localhost ([::1]:34812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRCxt-0008LD-Ey
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 07:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lRCwl-0007iP-BE
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:54:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lRCwj-0002yo-DY
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:54:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617105248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vcPOskfXs14U1BOzy/guCgYUpo1NzDvsmSzg045Sn1A=;
 b=BBMBJZtzi80fZ1YNFQGlIZvpLW+lzdtDt/8oPej29R+oQE+0j22FNWOitpE1i/9i1XLSDE
 r8cjjMl52xxq7pIFa0Z9LV8GZOU8qYotO8pO2f1g+SDB6XQ5Ycs9boE76277wDKextBLvo
 hAspUCk78S55ffU1iUvPANhFzI3OxuU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-1jKHAtYAP_moFebmTKI7eg-1; Tue, 30 Mar 2021 07:54:04 -0400
X-MC-Unique: 1jKHAtYAP_moFebmTKI7eg-1
Received: by mail-wm1-f69.google.com with SMTP id b20so593700wmj.3
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 04:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vcPOskfXs14U1BOzy/guCgYUpo1NzDvsmSzg045Sn1A=;
 b=g9pu9HD09tYLZBSbxsdVx8k9VtVJo8DtXDzHkNNeOx4HytIIt2iEIEZk60tafayRxV
 yRjoD1Nom9F/GS/F5ESOOId5Q8MmrQd0tlR/2HEJ51n9RoZon277lsO3K46L/cRdzN7+
 TVHq2n8Msbu+NgMZTGxfAbuCbUdElPQbPgzRyHS2ad8SQRpKZKcNMe3yH5FgubonGo9u
 kpp86DVWeY/+cRu6oysolc7fS2KzrK18AiGrmX755GzPlrgUkcp7nuQKDmWYTcHbLqsR
 qH9LeX/Sa8Ud/anMdHPOp9MYjMynCDhFtajRNbJpREm0/hSoRFjI715VmhFtHb0Itzxn
 lnOw==
X-Gm-Message-State: AOAM531pnuRgojb/BUuDaWHs2FSDkb908jmmIMxOtNwxxYFoJyrz1TgV
 zVdE4r6JEX/mOtgTb3DLYpgj7Gs/KGJwcE3z80JnWymoVWKbWlWeWI4frLLBRSg+Q3EqZ+hTtyA
 eUN4PX6zOkrxRnEU=
X-Received: by 2002:a1c:a306:: with SMTP id m6mr3576376wme.13.1617105243222;
 Tue, 30 Mar 2021 04:54:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrS50kCjujdaWtTtBn7dft0n+7ZsWMLp5IRLG2x/Esl2mK2cjXej4zw0YfBS6Drt0jXXuncg==
X-Received: by 2002:a1c:a306:: with SMTP id m6mr3576360wme.13.1617105243090;
 Tue, 30 Mar 2021 04:54:03 -0700 (PDT)
Received: from redhat.com (bzq-79-183-252-180.red.bezeqint.net.
 [79.183.252.180])
 by smtp.gmail.com with ESMTPSA id a13sm34948312wrp.31.2021.03.30.04.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 04:54:01 -0700 (PDT)
Date: Tue, 30 Mar 2021 07:53:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Edmondson <dme@dme.org>
Subject: Re: Ways to deal with broken machine types
Message-ID: <20210330075313-mutt-send-email-mst@kernel.org>
References: <20210301195919.9333-1-cheptsov@ispras.ru>
 <20210322114116-mutt-send-email-mst@kernel.org>
 <B813DBC6-B989-4630-B2DE-8F5825484E78@ispras.ru>
 <20210323104542-mutt-send-email-mst@kernel.org>
 <71AD039B-775A-4DF3-B16D-4BC3768A20AC@ispras.ru>
 <a1a1b783-6217-cb22-0dd8-fab9b7971542@proxmox.com>
 <20210323175447.0c57d2a4@redhat.com> <YFooFMWxwpiSB6ZJ@redhat.com>
 <20210323153730-mutt-send-email-mst@kernel.org>
 <m2o8f0q43i.fsf@dme.org>
MIME-Version: 1.0
In-Reply-To: <m2o8f0q43i.fsf@dme.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 libvir-list@redhat.com, qemu devel list <qemu-devel@nongnu.org>,
 Vitaly Cheptsov <cheptsov@ispras.ru>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 30, 2021 at 12:21:37PM +0100, David Edmondson wrote:
> > Unfortunately I do not think this is practical :(.
> >
> > All examples of breakage I am aware of, we did not
> > realise some part of interface was part of guest ABI
> > and unsafe to change. We simply would not know to write a
> > test for it.
> 
> While agreeing that it would not be possible to cover all aspects of the
> ABI immediately, does that mean that some level of coverage would not be
> useful?

Our testing already warns about ACPI table changes (which is what
happened here). We just verified them manually and thought they are
fine.

-- 
MST


