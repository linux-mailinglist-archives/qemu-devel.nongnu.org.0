Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469B0442A15
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 10:05:35 +0100 (CET)
Received: from localhost ([::1]:38750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpjZ-0001hx-V5
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 05:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhpiH-00010I-46
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:04:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhpiE-0004ph-Dp
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635843849;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=pAEDq0UUrer0WMLd7uOufaXObq/c7ApBY4EMkNfJcTs=;
 b=Yqtuj2eZQJCiO2lVXg2tLStSEYeCINkvS/cmyzAuv5cH9Q5JxuVjaxbVxa2KgI5nlCfaQO
 MUa3E6rK4K8Bfk2nww47dfkurygyZhWG6Riu1wVhPNiGLAGnvjBTKM3hFiWPLRUiY3VA/x
 mtL8YX2deWDnqZ1/m3djM/ptfP3RqFs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-TNZngyTLMzWoxoODlDGaWg-1; Tue, 02 Nov 2021 05:04:06 -0400
X-MC-Unique: TNZngyTLMzWoxoODlDGaWg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r6-20020a1c4406000000b0033119c22fdbso3944218wma.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 02:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=pAEDq0UUrer0WMLd7uOufaXObq/c7ApBY4EMkNfJcTs=;
 b=tCENxd76af16kZKjz69qbJt3i5yV5XE76jOXR4l589a4DYNbbncgpByS6IknjK03GR
 HIEZsTbshbXk0nXhHuTqx0sjZa/eDqmhtfx96nx+zDHNjr7penD2jh0qpxeeWDZ+d/DA
 kP/gqk00NS1VdwUR7COue9AP/bCRw4yuSPXERcYGDkVoGeOrypCeIdDEB3YRk1HHj7aw
 3yWAmGaCju5fJXhAnCBxFVQ1ZyU1/gnpem0wRomlovTbT5QfgFxQiFdqxreLCGwkUxg7
 jjbtkd9wyYiInOcnV8xYpeCDy/gLmfjMEJamKVDyGnzkSjVd+vu8f7xCWtcACEyOpTQy
 Hy4g==
X-Gm-Message-State: AOAM531vxz/QPln1vJjcc9Oy3D+zISTiGzE183tvj6K5SIRukhvurnZx
 i58+gq0rc4qMYLyB+YaH33Us2CX1jXHU57RtIkS9hEevJchZW2ITbuJl0bk71AIBUic8UiCCR1n
 WazQr5sjH4FvPUmo=
X-Received: by 2002:a7b:c344:: with SMTP id l4mr5617851wmj.64.1635843845406;
 Tue, 02 Nov 2021 02:04:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzF1A4LZ3AAhk56ZtrjOhh7qmKTf5pC1SZZZ1BS9dM/xSycUFgaZCu1cxHPB+ZccQnohiWRQ==
X-Received: by 2002:a7b:c344:: with SMTP id l4mr5617826wmj.64.1635843845194;
 Tue, 02 Nov 2021 02:04:05 -0700 (PDT)
Received: from localhost ([188.26.219.88])
 by smtp.gmail.com with ESMTPSA id p18sm1825638wmq.4.2021.11.02.02.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 02:04:04 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 1/2] migration: provide an error message to
 migration_cancel()
In-Reply-To: <20210929144311.1168561-2-lvivier@redhat.com> (Laurent Vivier's
 message of "Wed, 29 Sep 2021 16:43:10 +0200")
References: <20210929144311.1168561-1-lvivier@redhat.com>
 <20210929144311.1168561-2-lvivier@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 10:04:03 +0100
Message-ID: <87lf27lyik.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> wrote:
> This avoids to call migrate_get_current() in the caller function
> whereas migration_cancel() already needs the pointer to the current
> migration state.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


>          error_setg(&err, "RAM block '%s' resized during precopy.", rb->idstr);
> -        migrate_set_error(migrate_get_current(), err);
> +        migration_cancel(err);
>          error_free(err);
> -        migration_cancel();

This was already there, but it is ugly, isn't it?

Later, Juan.


