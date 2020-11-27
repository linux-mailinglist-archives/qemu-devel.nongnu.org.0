Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAC82C6C34
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:57:57 +0100 (CET)
Received: from localhost ([::1]:53306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kijsS-0007Ak-AD
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kijq7-0006UM-V9
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:55:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kijq3-0002cg-N1
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:55:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606506925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Ncg75t9NkStzSToDoatlQuBege2ysP8WbzJm+gbAus=;
 b=cgEvvXOZM2px9MohzEp7o5omxErxu9rFzDYEqaqEbGzmFR1ux7FMu1wm65ZDwhqsajvaHr
 HQrTREq6Zy41x6HImOTxMzyhXoBls+9dHdhmKh7oPLwQ1q3FZgJGYpx/LPvmBq/I6A7gJX
 hSpaD56qt5VvMHT7xMpvyEfnzZXw1Kg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-QJhzSSk0NnyqxbcMq-6Fsw-1; Fri, 27 Nov 2020 14:55:23 -0500
X-MC-Unique: QJhzSSk0NnyqxbcMq-6Fsw-1
Received: by mail-qt1-f197.google.com with SMTP id t22so3811468qtq.2
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 11:55:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9Ncg75t9NkStzSToDoatlQuBege2ysP8WbzJm+gbAus=;
 b=dl82ouM1X3Ur2yIWNin/ReNt/G3eyjhocVzjsfcj2yZ2MZUweO3X7B8Xm3AczWpApe
 Z2WqN7yfV5UXUGHOi8PUgmL31Fz6VmYZLgooAnCDzw7wRK2G0uyL0q68ny2GFD0xzrAW
 5BbHvKcmzK/MFjO5oGBlsDfcAcm40HoD5yvUc5lPKhmQXy9BjXHDrPBIX7//3XV7Zl7x
 gktwu92JVS34uierIfiF8GXdFEKeelTzSdF29ULCdxP/PLw26MggW8kOVMdWlM3b9c1z
 PlJ8MM5chib0Ra5/VTR5pdMt10ej0MhJPf+l38/AtTC1NkRAFmLkZ20Zp0brz7SagkME
 GheQ==
X-Gm-Message-State: AOAM533LpPXZGVxchUbstpZ3258kMg/WK4LwTn1uXgIJqKAODSEZn+u0
 /v9ktd03XfYqEqRu1bJC263ZObU/k8rEi0fkeedvuzv0pkvpcLTvjHfqb3n6UTd1cSZoTeFqT1L
 oBcRDr+7MizL0BC4=
X-Received: by 2002:ad4:47b0:: with SMTP id a16mr9826294qvz.22.1606506923363; 
 Fri, 27 Nov 2020 11:55:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8DJUWJXyfplFdK2YvNPtw1PdkXiZas/hXiL1ptddXgkQB6op4jhYVE7eoWVVKs0Bi7SxCNg==
X-Received: by 2002:ad4:47b0:: with SMTP id a16mr9826286qvz.22.1606506923196; 
 Fri, 27 Nov 2020 11:55:23 -0800 (PST)
Received: from xz-x1 ([142.126.81.247])
 by smtp.gmail.com with ESMTPSA id k4sm6673048qtp.5.2020.11.27.11.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:55:22 -0800 (PST)
Date: Fri, 27 Nov 2020 14:55:20 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v4 1/6] introduce 'background-snapshot' migration
 capability
Message-ID: <20201127195520.GE6573@xz-x1>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126151734.743849-2-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201126151734.743849-2-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu, Nov 26, 2020 at 06:17:29PM +0300, Andrey Gruzdev wrote:
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>

The patch looks good to me, but again, any commit message would be more than
welcomed... as long as it's not empty. :)

-- 
Peter Xu


