Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9807D2D3194
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 18:59:27 +0100 (CET)
Received: from localhost ([::1]:55816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhGo-0006Tb-Hr
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 12:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kmhFX-0005zt-KV
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:58:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kmhFT-0005pH-Vv
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607450282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XxB8Aj7Lo4ZzVLtAzuiBjDnNqivvGrqFqGafMqk+CyM=;
 b=SvMMiG76lRQGKsMPCEYqx3/+kAO396/9ZEiOyftrvGIyetA2O1XwsGO9N68Z2rRWRzZjbO
 bCAVExEtZySjNA289ZM/hHTww2HXuxkBm5k7S/WzzgG1EDz8dlypm1VKH2fDE/98J2521E
 bGxhYNbkGsoAR5bNuf5BE7L7+6IywTw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-IdYOgw1HP4GiPF-rO_NZrA-1; Tue, 08 Dec 2020 12:58:00 -0500
X-MC-Unique: IdYOgw1HP4GiPF-rO_NZrA-1
Received: by mail-qv1-f70.google.com with SMTP id i20so1652214qvk.18
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 09:58:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XxB8Aj7Lo4ZzVLtAzuiBjDnNqivvGrqFqGafMqk+CyM=;
 b=QVnA5XoeCGXDuGlteTYRuWbNfEDylyTaSU+vxMqA95aBkIB57A1goOdd+m+VsCiYml
 irpBIOcJiZ6l475x1bBrIiYFHZ5KizsmxpW2u7UaTqVOzLfkpms+7dDn/+LQCja+vY43
 1lkG37oUbXG7laDlAY4HmApIZSCXWCS9E3N8dKhaFzZD5P87AURwlNt2e+J0nVpb812W
 UT4m7CqtX6deJNE4IS9tnit/E6RmRTMWXEQeTPl15bp9nBnESi3YuqGoS/mJs7HO/qW3
 n4y0dmkpxRj3A8ErCtqJdQKd4fuy86bjK1WZB+yx2PE99n4XhssQCfWTbuwkVj9mB9oH
 OuZg==
X-Gm-Message-State: AOAM5303rJkThdJ4zBiIBbw9xR5cCBFHs++gr8m9DN9HpbUN8DmAwdkf
 Buna5+ZI7BbSNXws7S9mPbE+VdL2BTzzbRmtafNt7mjffvaLllQtC3AQRdRk3mJFxF1g25fQLBZ
 nsQYsFfgZYyVPT+c=
X-Received: by 2002:ac8:74c7:: with SMTP id j7mr12919021qtr.102.1607450279754; 
 Tue, 08 Dec 2020 09:57:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBi7B/mjJnmSDDQuZmrsMyrfTxlA0IfDEsv0kG+gogC8pscT2GJei3PcESBNht/6p0SZGZvg==
X-Received: by 2002:ac8:74c7:: with SMTP id j7mr12918999qtr.102.1607450279554; 
 Tue, 08 Dec 2020 09:57:59 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id n81sm13742786qka.76.2020.12.08.09.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 09:57:58 -0800 (PST)
Date: Tue, 8 Dec 2020 12:57:57 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v5 2/4] migration: introduce UFFD-WP low-level interface
 helpers
Message-ID: <20201208175757.GB21402@xz-x1>
References: <20201204093103.9878-1-andrey.gruzdev@virtuozzo.com>
 <20201204093103.9878-3-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201204093103.9878-3-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 04, 2020 at 12:31:01PM +0300, Andrey Gruzdev wrote:
> Glue code to the userfaultfd kernel implementation.
> Querying feature support, createing file descriptor, feature control,
> memory region registration, IOCTLs on registered registered regions.
> 
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


