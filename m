Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2A52FBC8F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:36:39 +0100 (CET)
Received: from localhost ([::1]:36086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tzi-0006fS-IO
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l1tuo-0003bL-1W
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:31:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l1tum-0006fF-6B
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611073889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2kci2ZKBGDHTB5wq8L0u3AedOG5/PW6PyGrI+WHe/Cg=;
 b=by8SDKOqRfQcMm4SOL8OUJK8mKqRnK1v+2FoRgu3sD40DE0c07AP9sX/0ph2kFeex2BVoU
 X+RF+yvkxgqWv8fcMK20oTTCXzC0ZxS4alEX5nkSe0Hiu370y6Zu3U0aG60ZaAcWV7dbZf
 ms52B6LhwRlATnNekULROeFNhJrNauY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-69psq5tXMy-nAxXXrMmI_A-1; Tue, 19 Jan 2021 11:31:27 -0500
X-MC-Unique: 69psq5tXMy-nAxXXrMmI_A-1
Received: by mail-qt1-f198.google.com with SMTP id f5so859257qtf.15
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 08:31:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2kci2ZKBGDHTB5wq8L0u3AedOG5/PW6PyGrI+WHe/Cg=;
 b=AALLONI5UxwF8t+0+STCZw3jh209H6uzxTPVrv+rU+aCm0uhnSsQQG4EnAAnW+Ho7n
 47y7OcVg9dqoMXVeDIadoNTDYpv4kZ+DA0Apn551FMVihm25kNbYoD0ILWXYavBgeIIo
 I4Ubv7ikrxMzTjlQS5JEXEPHzL5TqtCHmEEDFcySdDHOd941SCYsksOH6Rie276KUtUm
 BxanmcH1lj87+QGt3L9e4KeT4c28r0YtP7sFI6ZBfKYf5tLrBnEdzIz8NsUCJMWkx6Kd
 DEhqHK0sl5ETydk2Ipzt0XmhADKTdkLVzfCl1EVIaHDEEa45KJaOCs1OiaL+WbevYdpM
 OX3A==
X-Gm-Message-State: AOAM532MJ7YloNyrrtdRptzimUllJ4BG2ahXbd0oL9GBQ+cb8xJOLWAB
 ZDLVt3l5JL7NQUR4WftT06q9Ce+yDs0E1rclMIJUbltprRA4eqgZ5z/GYe2OrbEFRe67qAMGyw8
 m6eqSWTbqewrN430=
X-Received: by 2002:a37:ccf:: with SMTP id 198mr4975507qkm.223.1611073885878; 
 Tue, 19 Jan 2021 08:31:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4Q7IHTLPbOoOCRyDN5F2DUrwnMYFFfvxtIDxhrSbtVmp/zc8QHbgYbsxF2OqN/QbPXo8Rzg==
X-Received: by 2002:a37:ccf:: with SMTP id 198mr4975481qkm.223.1611073885593; 
 Tue, 19 Jan 2021 08:31:25 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id r8sm13135989qkm.106.2021.01.19.08.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 08:31:24 -0800 (PST)
Date: Tue, 19 Jan 2021 11:31:23 -0500
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] pci: add romsize property
Message-ID: <20210119163123.GF76571@xz-x1>
References: <20201218182736.1634344-1-pbonzini@redhat.com>
 <20201218185457.GH2956@work-vm>
MIME-Version: 1.0
In-Reply-To: <20201218185457.GH2956@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 18, 2020 at 06:54:57PM +0000, Dr. David Alan Gilbert wrote:
> * Paolo Bonzini (pbonzini@redhat.com) wrote:
> > This property can be useful for distros to set up known-good ROM sizes for
> > migration purposes.  The VM will fail to start if the ROM is too large,
> > and migration compatibility will not be broken if the ROM is too small.
> > 
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> I suspect something breaks horribly if you set this to the 4GB that the
> UINT32 would allow.
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Indeed, but we do have lots of restrictions (IIUC) in qemu cmdline that it
won't really work if we don't specify things correctly, so I won't worry it too
much, since I assumed qemu cmdline users are advanced users, always. :)

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


