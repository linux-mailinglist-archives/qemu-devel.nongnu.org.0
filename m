Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5016A57F5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:24:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWy5n-0007J9-IV; Tue, 28 Feb 2023 06:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWy5c-0007Gb-61
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:24:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWy5a-0002RY-Mm
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677583450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cPt18yMFBhgEWcyFKRvmzxmC7YZWJirJ75g/XkJWVsg=;
 b=BkQXwGdzbZF7Ur7AANLRRr+QWwW1OHQR2nW1Vgk5a5JIUSdMPgeTNzG98NUtP3k+HbOFfI
 67jhmhwcRZDZtZufzs3aObGCWX8JoAjIyr/DdZcws63PGVodZTwHknpK44Uem3kj8h6EXR
 t6/k75E1XuB19tI0E47Ql/07i49uWz0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-92-wVyQyjSlMsOr4OIcXHx1bQ-1; Tue, 28 Feb 2023 06:24:08 -0500
X-MC-Unique: wVyQyjSlMsOr4OIcXHx1bQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 f14-20020a7bcc0e000000b003dd41ad974bso4142224wmh.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 03:24:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677583447;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cPt18yMFBhgEWcyFKRvmzxmC7YZWJirJ75g/XkJWVsg=;
 b=EBkpta0Q4M205yk/1d9ZhzJjLjRPV1fXvzwfrgsQC1373dASpsi3AAnTWNqT50bnUd
 QvtTckQaGKVkLcuJNfKNbDkhsMiWutzY739y/yflACilSb00diKYy15ec/f7jPGPiizU
 EoJIY+nR0pQ7BF2MMr77ZvjwQ34anKLtpJqNdSsIOrA/v64EhLQHgcmWQyrTnkG+x3+W
 yFZBPzc8vB0dC8kV6RzMqFFM3Qk3tlV3NT3czOFJEzbHermGWKlbGj+ap2kEjbif7CTK
 usl0OnOzvN666Io5iiUW0BdIYlFX4n17S3bXOKfx4s6lypsRahbBFgq2Or/Jlz+p6zb0
 qG4w==
X-Gm-Message-State: AO0yUKUIZaSkCLivPp5SJDRbcT+l/4FOfFCOXrcZheQVI3aiJnpVSJqw
 0cDuH3VEhTpVQg6c/3viPiV3nIJe27Ck+YMJbjCOiIdOAB1dxGZmVq50rWXTYiN7GhnL13iFZwH
 s6WXasdG6NpvfS1E=
X-Received: by 2002:a05:600c:4507:b0:3eb:2b88:a69a with SMTP id
 t7-20020a05600c450700b003eb2b88a69amr1863552wmo.14.1677583447653; 
 Tue, 28 Feb 2023 03:24:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9T5ZkS4VbZWkKkMQx04lsVjTlgvyWwH8VrH3B39Ebim23eqhBX9ts8ZVRgNNp1IV6iBjuM7Q==
X-Received: by 2002:a05:600c:4507:b0:3eb:2b88:a69a with SMTP id
 t7-20020a05600c450700b003eb2b88a69amr1863526wmo.14.1677583447355; 
 Tue, 28 Feb 2023 03:24:07 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 i13-20020a1c540d000000b003db06224953sm12401771wmb.41.2023.02.28.03.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:24:06 -0800 (PST)
Date: Tue, 28 Feb 2023 06:24:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228061853-mutt-send-email-mst@kernel.org>
References: <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com>
 <20230228050908-mutt-send-email-mst@kernel.org>
 <87cz5uhy50.fsf@pond.sub.org>
 <20230228055016-mutt-send-email-mst@kernel.org>
 <072a7502-6061-12b2-f778-736c6a8f5912@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <072a7502-6061-12b2-f778-736c6a8f5912@redhat.com>
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

On Tue, Feb 28, 2023 at 12:12:22PM +0100, Thomas Huth wrote:
> On 28/02/2023 11.51, Michael S. Tsirkin wrote:
> > On Tue, Feb 28, 2023 at 11:39:39AM +0100, Markus Armbruster wrote:
> > > The question to answer: Is 32 bit x86 worth its upkeep?  Two
> > > sub-questions: 1. Is it worth the human attention?  2. Is it worth
> > > (scarce!) CI minutes?
> > 
> > 3. Is it worth arguing about?
> 
> You are aware of the problems we're currently struggeling with, aren't you?
> Darn, we're having *SEVERE* problems with the CI, the QEMU project ran out
> of CI minutes for the second time this year, and you ask whether it's worth
> arguing about??? You're not serious with this question, are you?
> 
>  Thomas

Yah just couldn't resist. How many minutes do we use per month btw?

-- 
MST


