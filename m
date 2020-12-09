Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5010A2D48FC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:29:51 +0100 (CET)
Received: from localhost ([::1]:35308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4Dm-00041N-B7
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3tM-0002MO-HG
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3tK-00089W-Kf
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RFF5IIg4Ekdu4nz+jRqhTZiRa2N98qwhPD7+O5MB5A=;
 b=UjWC8/m0o7zx50g54I0CsyZ00MD1pa13IRPoG5p4+kOFBjgLC83pVUP7h7SFbPXIPF/l17
 Lp7SzXwVlibn5uKiUUsf+FN0AA2AleUxCKthXq/IOV0hDEW52O3jjUHGlr1FtDnZhQFaJD
 6O/a4TV5ijAeRWjQnmGOKnNDim5X1yk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-HGpVb2UgP1Ssn1SrKT3qBA-1; Wed, 09 Dec 2020 13:08:39 -0500
X-MC-Unique: HGpVb2UgP1Ssn1SrKT3qBA-1
Received: by mail-wm1-f70.google.com with SMTP id b4so819354wmj.4
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:08:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5YIE8TOZ0aPYSq7YQ6myb7vJz28nvuSjnYuTinySwjY=;
 b=W2E90sndbTpTzNmljaS/b/zECe9/r63fkHlMxCYRLqQS1vZVVyED1xTqcle6p/LC8A
 Oxd2bhM6ff7d3bAaPJf/7PDQd3O6W2PkqTB82SLKvVZt89jSGfKztoHGj4P4IS2VTYZX
 x5mr1CJ2XjBE8Jw5YFjCXBZUWbW5oIZa2+tCD5bx23ReMoS7ZyQU6ArQEFiIcMN7V1x+
 DTJSwqoPEUYPXTnPIGBH0unnOwvZ3yAfNdBBPiSFc4jnCrZDLFreRr8ysmKD14x/1uSY
 ALsAROMYKWG3713wGnfFkquYIZXf48tVv4cmGnP7TnIjiPKfU+/8N2rFyeSyAyFxaPX5
 1hwA==
X-Gm-Message-State: AOAM531gO1QPxDnNk5bRnKDVhJAz0dF9WzysTCd//aj4dhv97341bpy6
 xGg6P549Omh8Vn6GcNZ7AlpqzwV/wnmeJe56Ge0Dc5A9OhAB/rlRukGLbdNm0flz5XhUyxZWT3J
 g1Q/Q3h+y3iN4bkE=
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr3982049wrn.322.1607537318745; 
 Wed, 09 Dec 2020 10:08:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVcp8S41ZaJ40b9+ZVN74YngQp5qaaGK9Fdgm1HGUXVqmv23az+1UfKhXtqRcrq3Kh2rq0Fg==
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr3982020wrn.322.1607537318381; 
 Wed, 09 Dec 2020 10:08:38 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id f7sm4860205wmc.1.2020.12.09.10.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:08:37 -0800 (PST)
Date: Wed, 9 Dec 2020 13:08:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 6/8] libvhost-user: check memfd API
Message-ID: <20201209130729-mutt-send-email-mst@kernel.org>
References: <20201125100640.366523-1-marcandre.lureau@redhat.com>
 <20201125100640.366523-7-marcandre.lureau@redhat.com>
 <20201202142753.GH655829@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201202142753.GH655829@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 02:27:53PM +0000, Stefan Hajnoczi wrote:
> On Wed, Nov 25, 2020 at 02:06:38PM +0400, marcandre.lureau@redhat.com wrote:
> > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > 
> > Do not compile potentially panicking code, instead check memfd API is
> > present during configure time.
> > 
> > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > ---
> >  subprojects/libvhost-user/libvhost-user.c |  6 ------
> >  subprojects/libvhost-user/meson.build     | 12 ++++++++++++
> >  2 files changed, 12 insertions(+), 6 deletions(-)
> 
> Runtime checks are useful in environments where the QEMU and kernel
> version are not matched. In other words, if QEMU can be built against
> new kernel headers and launched on an old kernel then it needs to handle
> ENOSYS. But in some cases this situation is unlikely and we can stick to
> static feature checks. I'm not sure if it matters here, so...
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

It's a good point, and given this patch also made build fail on a bunch
of systems, I dropped it.

-- 
MST


