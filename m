Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DF163C274
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 15:28:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p01aP-0002hs-9X; Tue, 29 Nov 2022 09:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p01aN-0002hM-It
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 09:27:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p01aL-0007JC-VU
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 09:27:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669732065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qu0XovBiTXd5XpzGU/A200UcPJeEtP1LLPHiw/ESpA4=;
 b=PfsAu/vX2sXquk3Q04e30QwDSIUA2Icg+QSAG6xj0q/fsiPZ+5wGS7PjksfJ/X6v9zpkTL
 y9m5DLQk8N6Sdr5VPV7RxXsyNHffnI04lYdFu/p5ZWNeDS5Br16EScGqrdb5z7TuBjE69g
 iUDR/l8MW+weeJt5ApENaahij4qVBZc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-353-Gc2237yfP82FMwfwHncS2g-1; Tue, 29 Nov 2022 09:27:44 -0500
X-MC-Unique: Gc2237yfP82FMwfwHncS2g-1
Received: by mail-qt1-f198.google.com with SMTP id
 n12-20020ac85a0c000000b003a5849497f9so21696746qta.20
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 06:27:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qu0XovBiTXd5XpzGU/A200UcPJeEtP1LLPHiw/ESpA4=;
 b=ZHxPqt8ueJ0jucd2U3ku7owcZxO2lfVI8SFUE3/KxuUGASNbrXRwiOLpXQgm8LOe1P
 xToL2Q/j6xq/mrR/qLKZj+CYmAGhM7Q4akgSjzwD3qtM9MYC1E/ADsyZJGxZlLqPOm3M
 xZU7IQg8fPKYRk10ETtuCV3vkIo1Efds6xe4m6I+J3ldHhRFoiD83SFotWkH06vcEqX0
 qudMUeqf2RtebQzeVu0xbogKCJU5r6E5/qyUTREw8xe5Ly8jzl14WwfIL8YTA5DKgm5T
 2F5sfrzyGRi6IgPNppLDarcRhDI0MNdZ9i9Z9jONlcDqGUIGk2IzH4ezwl63peUjXee+
 4bHA==
X-Gm-Message-State: ANoB5pkgFwIBQGx+7eSrZEmDrP0Evo79zowgqcXSd7EJHGur0iPSGyOj
 ACD3xiEdp4fX8Y5iLIdKjbM+mZxS24GDq8O3A/xHNoxw5fz0R/G9IYMrbvjYIjEHsk7gJz9pxgc
 gfgotTxMNdIJ9w0A=
X-Received: by 2002:a37:4043:0:b0:6fa:ada6:e898 with SMTP id
 n64-20020a374043000000b006faada6e898mr52738209qka.706.1669732063570; 
 Tue, 29 Nov 2022 06:27:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7LkWo5gEpSy+vRb0+JgJ/KR3O+yTegQ+ltFazDnMdoVIPcpYDvLOS4YLDBmVtY4WhkOpWYLA==
X-Received: by 2002:a37:4043:0:b0:6fa:ada6:e898 with SMTP id
 n64-20020a374043000000b006faada6e898mr52738178qka.706.1669732063288; 
 Tue, 29 Nov 2022 06:27:43 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 m19-20020a05620a291300b006fa12a74c53sm10753357qkp.61.2022.11.29.06.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 06:27:42 -0800 (PST)
Date: Tue, 29 Nov 2022 09:27:41 -0500
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
Subject: Re: [PATCH v5 1/2] io: Add support for MSG_PEEK for socket channel
Message-ID: <Y4YW3fRvTYULGLTd@x1n>
References: <20221123172735.25181-1-manish.mishra@nutanix.com>
 <20221123172735.25181-2-manish.mishra@nutanix.com>
 <Y35gyiCk/Kjdd1Lq@x1n>
 <aaf17b45-ea8a-cd93-008c-b43b68532ef1@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaf17b45-ea8a-cd93-008c-b43b68532ef1@nutanix.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Tue, Nov 29, 2022 at 04:24:58PM +0530, manish.mishra wrote:
> 
> On 23/11/22 11:34 pm, Peter Xu wrote:
> > On Wed, Nov 23, 2022 at 05:27:34PM +0000, manish.mishra wrote:
> > > MSG_PEEK reads from the peek of channel, The data is treated as
> > > unread and the next read shall still return this data. This
> > > support is currently added only for socket class. Extra parameter
> > > 'flags' is added to io_readv calls to pass extra read flags like
> > > MSG_PEEK.
> > > 
> > > Reviewed-by: Daniel P. Berrangé <berrange@redhat.co
> > > Suggested-by: Daniel P. Berrangé <berrange@redhat.com
> > > Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
> > Reviewed-by: Peter Xu <peterx@redhat.com>
> > 
> Hi Peter, Daniel
> 
> Just wanted to check if both patches in this series are approved or i
> need to update few more things. Also Peter, for your Review-by to be
> included do i need to send another patch version or it will be taken up
> whoever will be merging it?

No need to resend it for now.

https://wiki.qemu.org/Planning/7.2

Today should tag rc3, maybe it's too late for such a change to go into this
release.  It's not a regression of 7.2 so may not be justified either.

Maybe it'll need to wait until the next dev cycle opens.

Thanks,

-- 
Peter Xu


