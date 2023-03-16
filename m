Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DC16BD278
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 15:37:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcoiV-0006sL-V6; Thu, 16 Mar 2023 10:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcoiU-0006sD-VS
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:36:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcoiT-0004Wr-Ik
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678977388;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ayZb1+1ylW8R0TeoPsdKOQ/sX6QE1oy3CVj3lrzUzjU=;
 b=gYX1/CZhtb5aUn8evEOOgsFzEzfJE8vcp0a4ZGGaGOraBZsKrb4U72xej7kg42juc+PYwJ
 brIjrMlJXvQKVARxCL/RguYnSDNSnWUDEQ3WGfkN3jkwWmnFLjF7+mzZSY/jG0eYSS+bDM
 uXyFkD/HtiGW4sOMkibAz1NiO6a4hx4=
Received: from mail-wm1-f69.google.com (209.85.128.69 [209.85.128.69]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-361-GvPjsLTLMwihHMsjwV-afA-1; Thu,
 16 Mar 2023 10:36:27 -0400
X-MC-Unique: GvPjsLTLMwihHMsjwV-afA-1
Received: by mail-wm1-f69.google.com with SMTP id
 az7-20020a05600c600700b003ed25435106so752709wmb.2
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 07:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678977385;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ayZb1+1ylW8R0TeoPsdKOQ/sX6QE1oy3CVj3lrzUzjU=;
 b=5yQLAcj1RB3l7jbR/muTb4JgbW2pMSjw7sEFdyhMd7t+ogshjMXonEo+njLeDVOeY1
 9NdjyN99lDl+BCYOqAyDNU9JCvh4oHAigBgj9knECz42mHf+HfFsjT02yv1qhtFalBl+
 ggrMM2DFiPCJRxWiDWEj/MlcKeLVgT/ps93SD9TsoekG+lihdTTsWx+1arzHeJxfXe6h
 UIGQjmTY1xVyevI55pvA0gcezwPx4nEhm+AtNKJcgl4SzSIlolf/S6bfH2V3JlH48IUA
 Y1bM9md2cQislF5VS0VKemNRUrXM2y4K3qdWI3ACFiPxs7vry6KusLOZO5G2NWT6VufH
 YtUw==
X-Gm-Message-State: AO0yUKW33mlmGphrPprSsJffF61fQRGDSpNUCY2o1YA1KoFb/eZgYGvy
 2wgHw7TPHZlEIDPYpQ5Y0OG0JZ3K7oXJiYB/3ggOPMEB2GKHu4z+7kyPm1Wl6LRkAEmFyP5csdB
 8aVUbuqbtVbeML7Su8PnKhqcDaOQI
X-Received: by 2002:a05:600c:4f8e:b0:3e2:662:ade6 with SMTP id
 n14-20020a05600c4f8e00b003e20662ade6mr20931144wmq.26.1678977385764; 
 Thu, 16 Mar 2023 07:36:25 -0700 (PDT)
X-Google-Smtp-Source: AK7set8pWKBVAW1oRIAUXtiFU5eeefG3FdLdb1P0NjUmTHtctKQW4k1qGFpjFxpMu9IyplagHw6P5g==
X-Received: by 2002:a05:600c:4f8e:b0:3e2:662:ade6 with SMTP id
 n14-20020a05600c4f8e00b003e20662ade6mr20931126wmq.26.1678977385378; 
 Thu, 16 Mar 2023 07:36:25 -0700 (PDT)
Received: from redhat.com (62.117.238.225.dyn.user.ono.com. [62.117.238.225])
 by smtp.gmail.com with ESMTPSA id
 u22-20020a05600c00d600b003e203681b26sm5242742wmm.29.2023.03.16.07.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 07:36:24 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Thomas Huth
 <thuth@redhat.com>
Subject: Re: [PATCH V2 01/20] migration: fix populate_vfio_info
In-Reply-To: <1675795623-234945-1-git-send-email-steven.sistare@oracle.com>
 (Steve Sistare's message of "Tue, 7 Feb 2023 10:47:03 -0800")
References: <1675795623-234945-1-git-send-email-steven.sistare@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Mar 2023 15:36:23 +0100
Message-ID: <87pm98lq54.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Steve Sistare <steven.sistare@oracle.com> wrote:
> Include CONFIG_DEVICES so that populate_vfio_info is instantiated for
> CONFIG_VFIO.  Without it, the 'info migrate' command never returns
> info about vfio.
>
> Fixes: 43bd0bf30f ("migration: Move populate_vfio_info() into a separate =
file")
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


