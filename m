Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADFC69936B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:43:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pScfR-0001V6-H4; Thu, 16 Feb 2023 06:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pScfP-0001ND-7B
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:43:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pScfN-0001H6-C1
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676547788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SGOW/FdRhq0QhwtV6xXpys2Hacsw/FocVpfj94++v8U=;
 b=caFZ+gigl/reheWzElN0AttK6cTRExTV1nTCXJy7PNv4f7ZMFNs2cLaaK5e262jUOdMaQL
 BvZb+ZUDYaRjKd0AQbxxUJe8vJSpdoQIqrJmB8kEUdGcAqG3aS2jciCSI4UzW7pUqnartx
 0wkMCVqCBSZ4Mj47+VtlbLLNWmbHI0M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-3XlBWNnVMMOl_B7tsvaoPA-1; Thu, 16 Feb 2023 06:43:07 -0500
X-MC-Unique: 3XlBWNnVMMOl_B7tsvaoPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2CD5185A7A4;
 Thu, 16 Feb 2023 11:43:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87D961121318;
 Thu, 16 Feb 2023 11:43:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0889E1800097; Thu, 16 Feb 2023 12:43:04 +0100 (CET)
Date: Thu, 16 Feb 2023 12:43:04 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dorinda Bassey <dbassey@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, armbru@redhat.com, pbonzini@redhat.com,
 wtaymans@redhat.com
Subject: Re: [PATCH] audio/pwaudio.c: Add Pipewire audio backend for QEMU
Message-ID: <20230216114304.7lt55lmowu3ilaii@sirius.home.kraxel.org>
References: <20230215085102.415053-1-dbassey@redhat.com>
 <CAJ+F1CL0_OAj5-jsyCVY5aF=qoSoPx2Mu=q8Z7mpp3mesRi6=Q@mail.gmail.com>
 <5159868.WgR6L5i3FV@silver>
 <CAJ+F1CK6kCbhAbpK8dmS3qMHnRptJiiU-FeKy3qT2WjQUGyekQ@mail.gmail.com>
 <CACzuRyy5ac-1_pugMKGaYzszaLceBDk_xeQmrcq4M+SLpLucVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACzuRyy5ac-1_pugMKGaYzszaLceBDk_xeQmrcq4M+SLpLucVQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

On Wed, Feb 15, 2023 at 04:09:59PM +0100, Dorinda Bassey wrote:
> >
> > My point is that pipewire has ALSA plugin (and also pulseaudio compat
> > library etc). So why add another back in QEMU?
> >
> Good question. Well the pulseaudio compatibility layer adds to the runtime
> overhead and dependency, dropping the usage of pw-pulse daemon as a runtime
> dependency would reduce footprint.

Oh, pulseaudio compatibility goes through another daemon.  That is IMHO
enough reason for a native pipewire backend, to avoid that overhead and
specifically reduce latency.

(this and other good reasons should be added to the commit message).

take care,
  Gerd


