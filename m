Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2070749D366
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 21:27:18 +0100 (CET)
Received: from localhost ([::1]:52018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCosu-0007tz-V6
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 15:27:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCoq8-00076B-O0
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 15:24:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCoq6-000721-3i
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 15:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643228660;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YhWuMMG93hBkUvQeripWgP73StGmEoihrL5UaPxhUfs=;
 b=NwEb4r1NNCzq69MQ86Zv/jSaahllpAByvHRV0VRFQW3M7BlODZzqFn8jePxptqcHmr01QZ
 P9fRDWUSQiHzF5/u22sgh93Vr5dZjjYNhp5PiqH5TPif2H2teHSWeygnov1q6KYdC+nx4h
 2/2ZC2q/h6ov9NbEQSHObLrOx/VkPVw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-i8P987rWOx2HcBu5_5_low-1; Wed, 26 Jan 2022 15:24:19 -0500
X-MC-Unique: i8P987rWOx2HcBu5_5_low-1
Received: by mail-wm1-f72.google.com with SMTP id
 l16-20020a1c7910000000b0034e4206ecb7so412835wme.7
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 12:24:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=YhWuMMG93hBkUvQeripWgP73StGmEoihrL5UaPxhUfs=;
 b=fQPETzBXY7dqLg6y4FJJtist1vu7avPuWG/CWQAIjph5gIAFbpl5mVC07P9d1vxmm/
 2XL0PvHGm9N4X7InwLjQsK7uxG9oFexFEkqaa/lZ/K6t/MTjorkit5zX5XCKUJagnakm
 XDBgvgRvyzQYzYDyn8zsZYrAtfoyf7wn29Y53zUl8LNByWQqsSfortAs2y4JVHqGS+GA
 KzB7A8Zzqv/wmNLr7UX06Sm/ce40xAsTAxi5WSnMKAgGPJrEeuXSRXVCUlfhi9mvyXv7
 oL96KCCQJLsIaOT+PV/b4vTLpU/jNkvcaA1oy5W7vWEloQdyjclPMu55sVRLd23hXrUi
 epLA==
X-Gm-Message-State: AOAM533lAIQy/CvBiDknYD8bKp3I0tPRai6kQGekC9NW/HLu/K0VpiTs
 9ugARJR90gZpEY0b5cGny8kS/BKY4RthBRjcIsSLlp1HDPDYTpF9HrU3/ipYhT7EBDyP8+mJFZ+
 WMemwoc+Qi3TcmoA=
X-Received: by 2002:a05:600c:d4:: with SMTP id
 u20mr9059644wmm.52.1643228658371; 
 Wed, 26 Jan 2022 12:24:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqdt4P3TBVT4B21cZfMvOWn01uOe10CPpfXcR8um1FE3CUgL3HiF6LHJL+a+srqmdyrXPDmQ==
X-Received: by 2002:a05:600c:d4:: with SMTP id
 u20mr9059630wmm.52.1643228658128; 
 Wed, 26 Jan 2022 12:24:18 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id m5sm235612wrs.22.2022.01.26.12.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 12:24:17 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH] migration: Report the error returned when
 save_live_iterate fails
In-Reply-To: <20211215141437.1238403-1-david.edmondson@oracle.com> (David
 Edmondson's message of "Wed, 15 Dec 2021 14:14:37 +0000")
References: <20211215141437.1238403-1-david.edmondson@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 26 Jan 2022 21:24:17 +0100
Message-ID: <87v8y6nt3i.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Edmondson <david.edmondson@oracle.com> wrote:
> Should qemu_savevm_state_iterate() encounter a failure when calling a
> particular save_live_iterate function, report the error code returned
> by the function.
>
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued


