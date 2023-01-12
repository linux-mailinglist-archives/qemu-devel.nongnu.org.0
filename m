Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A21B6687BA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 00:05:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG6bt-0000EH-PD; Thu, 12 Jan 2023 18:03:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pG6bs-0000Dz-33
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 18:03:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pG6bq-0004ds-11
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 18:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673564624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qXbpa0euBExBaTO/Ebm60JXaGA3mQo8UBGk1nDl0J48=;
 b=PDFL2cvrvpWCIrZtIGm9Myi70eiFY0BKb6iOxy+ioKzp70HWyax2oy72p751KE2EqOn9xU
 DAIgRuKdVmwKNmhfLPfcjPfNMZgEl6W9ohbcAnJeHjNScGxP91n3lxTJcA2M2tNOar3ony
 j0+3nQghD4k5uY2UcRDkSCXGW5mXXyE=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-224-cpSjsw5_OdCp00pdAPm-vQ-1; Thu, 12 Jan 2023 18:03:43 -0500
X-MC-Unique: cpSjsw5_OdCp00pdAPm-vQ-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-4c2d68b6969so198576387b3.7
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 15:03:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qXbpa0euBExBaTO/Ebm60JXaGA3mQo8UBGk1nDl0J48=;
 b=gZ2fMQ3DsHcBDX2+XUdqcP9ZyEMgduIWSUeLj8jPFWWGNoih3FCPiTiik2WUXYlhmq
 3iSlrjYRbVpuDST9Cb4VE1cUBa8tUM9mCn0/PSw5n8fvernDIViAzF/D2H6b89N6tqT7
 nzIkaQ7tx4fAW6TVdrZHrQumTcEPzLYongiwA9FNCDwAdj1VbJBGCe8eSnFa//BfeKuB
 dZzFQ6nP/vSXYlYRKTeFbwQ3AqpP5XRoj2eem5ojp6WtxQFk9geiBcysVgGGNrSj9W6R
 j2P/2q+UEDg2jtWoycQGThcFsph31xBZG1x77WmUn1FQeHSZYM1fJZmIDtpJwYkpY3dz
 LC4Q==
X-Gm-Message-State: AFqh2kqKW2rT1eXAF7XMBsMhhcWQcRBkTYk/BGmHo2R5EiFq1gaTUR9S
 QjRd2CTWsiPylK7X5YjrNMlV5LelenqNUaX6BBwod76FT6Nx+EVlOEi1M3J0DwKliKZLXkilZGu
 FBc4CN4J44m7DNL0=
X-Received: by 2002:a25:3485:0:b0:7b2:2c34:7bfa with SMTP id
 b127-20020a253485000000b007b22c347bfamr30601130yba.13.1673564622821; 
 Thu, 12 Jan 2023 15:03:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXve5xvOCSmtbGUXXlUsTJO6xAn094jfDpk6/0I1/Sq4yrg4uvAhGWuFoy1TISz3ntSn2UKEsg==
X-Received: by 2002:a25:3485:0:b0:7b2:2c34:7bfa with SMTP id
 b127-20020a253485000000b007b22c347bfamr30601107yba.13.1673564622570; 
 Thu, 12 Jan 2023 15:03:42 -0800 (PST)
Received: from redhat.com ([185.199.103.82]) by smtp.gmail.com with ESMTPSA id
 d7-20020a67c107000000b003cea834049dsm1901988vsj.29.2023.01.12.15.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 15:03:41 -0800 (PST)
Date: Thu, 12 Jan 2023 18:03:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <20230112180314-mutt-send-email-mst@kernel.org>
References: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz.ref@aol.com>
 <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com>
 <20230110030331-mutt-send-email-mst@kernel.org>
 <a6994521-68d5-a05b-7be2-a8c605733467@aol.com>
 <D785501E-F95D-4A22-AFD0-85133F8CE56D@gmail.com>
 <9f63e7a6-e434-64b4-f082-7f5a0ab8d5bf@aol.com>
 <7208A064-2A25-4DBB-BF19-6797E96AB00C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7208A064-2A25-4DBB-BF19-6797E96AB00C@gmail.com>
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

On Thu, Jan 12, 2023 at 10:55:25PM +0000, Bernhard Beschow wrote:
> I think the change Michael suggests is very minimalistic: Move the if
> condition around xen_igd_reserve_slot() into the function itself and
> always call it there unconditionally -- basically turning three lines
> into one. Since xen_igd_reserve_slot() seems very problem specific,
> Michael further suggests to rename it to something more general. All
> in all no big changes required.

yes, exactly.

-- 
MST


