Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A411C4CA5C4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:18:32 +0100 (CET)
Received: from localhost ([::1]:44262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOsB-0005tz-J2
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:18:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPN8J-00005a-UK
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:27:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPN8G-0006tI-V6
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:27:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646220417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fIsqlWa1fD5PpZRji9duXGANNJtbxRIEc8qhgu3bYhw=;
 b=fNypnz3LAVkD1KLtvk+AWJYZlvjdPo9Y5Spu/zKloz6F9jF/ey7byjh9IcuFfzP+kTrbhd
 H8vJmKtKikO3AKxEB/anT4QNhBZkcUBG3mocb66UEEO1EE5sbp/w5woP987QcLrTU3JDrt
 HZNrAIvUMP6XU0/D9gUFzlmFgFVT6q4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-yQxndICKMnKJewJCOYES7Q-1; Wed, 02 Mar 2022 06:26:55 -0500
X-MC-Unique: yQxndICKMnKJewJCOYES7Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg33-20020a05600c3ca100b00380dee8a62cso417918wmb.8
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 03:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=fIsqlWa1fD5PpZRji9duXGANNJtbxRIEc8qhgu3bYhw=;
 b=u6RlX36g9VYRDNU+zPBa3d+4J8JB7HXUmX+Os0npiyo2fuz2m963PXV+szxrAKOV+a
 tswGu7vxwQCAmoEvcHYjx+djzvF7WGAMd5DVCqVorpCfMkP+/HWR0QCb6W3GMD6SSLqM
 bXjJJcPwtGZ4ageh2OvTLz0/bv24p9UkMde8xnTS2QbErvdFmcDRKQ9ANRm7ertXFPfd
 9SYGW4Wuw21t7XqfF1YKGxOWI0zKSjOMv3YVvlduJ1uu3r6k2FdfJWTWaVyqUav4q3l8
 +Y8NjNInuaAEM5ewJwIdGrbO1Q2DVdMB06V/+Z+ReppdLJOewmedSwb3/5amUE25gL0J
 p8NQ==
X-Gm-Message-State: AOAM5309KUCgwjHPVj1sHZVQryaz3fhUGtwWB2RMMD6ccTlG/ryrzcOt
 qx41NGuVLAu1cP89NTT9zqHcTy1JHssDsLfckppb2XI+0pwuPPm6aWPwlQxX6mEv6eL248pVcC4
 4vyyMcCQR4huW+78=
X-Received: by 2002:a05:600c:4151:b0:381:15c5:62fb with SMTP id
 h17-20020a05600c415100b0038115c562fbmr20912281wmm.152.1646220414335; 
 Wed, 02 Mar 2022 03:26:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxF0M4sV0GrPSbnSnT96Lf9Ak1iPftHSC5DB+84sSwBFb1shLqaJSEfzF48qcKekOv7RwXh/A==
X-Received: by 2002:a05:600c:4151:b0:381:15c5:62fb with SMTP id
 h17-20020a05600c415100b0038115c562fbmr20912271wmm.152.1646220414102; 
 Wed, 02 Mar 2022 03:26:54 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 j6-20020adfe506000000b001f00d7c38e8sm4838874wrm.93.2022.03.02.03.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 03:26:53 -0800 (PST)
Date: Wed, 2 Mar 2022 11:26:51 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH v9 0/3] VNC-related HMP/QMP fixes
Message-ID: <Yh9Ue37ibftk4ME4@work-vm>
References: <20220225084949.35746-1-f.ebner@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20220225084949.35746-1-f.ebner@proxmox.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: w.bumiller@proxmox.com, berrange@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, marcandre.lureau@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, eblake@redhat.com,
 t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Fabian Ebner (f.ebner@proxmox.com) wrote:
> Original cover letter by Stefan R.:
> 
> Since the removal of the generic 'qmp_change' command, one can no
> longer replace the 'default' VNC display listen address at runtime
> (AFAIK). For our users who need to set up a secondary VNC access port,
> this means configuring a second VNC display (in addition to our
> standard one for web-access), but it turns out one cannot set a
> password on this second display at the moment, as the 'set_password'
> call only operates on the 'default' display.
> 
> Additionally, using secret objects, the password is only read once at
> startup. This could be considered a bug too, but is not touched in
> this series and left for a later date.

Queued

> v8 -> v9:
> * use s instead of V to indicate when a flag takes a string parameter
> * make @connected a common member of @SetPasswordOptions
> 
> v7 -> v8:
> * drop last patch deprecating SetPasswordAction values besides 'keep'
>   for VNC (unfortunately, I don't have enough time to try implementing
>   'disconnect' and 'fail' for VNC in the near future)
> * drop if conditionals for DisplayProtocol enum to make compilation
>   with --disable-spice and/or --disable-vnc work
> * order 'keep' first in enum, to fix how patch #3 uses it as an
>   implicit default
> * also set connected and has_connected for the VNC options in
>   hmp_set_password
> * fix typo in patch #1
> * add missing '#' for description in patch #3
> 
> v6 -> v7:
> * remove g_strdup and g_free, use strings directly
> * squash in last patch
> 
> v5 -> v6:
> * consider feedback from Markus' review, mainly:
>   * fix crash bug in patch 1 (sorry, artifact of patch-splitting)
>   * rely on '!has_param => param == NULL' to shorten code
>   * add note to 'docs/about/deprecated.rst' and touch up comments a bit
> * go back to g_free instead of qapi_free_* since the latter apparently tries to
>   free the passed in pointer which lives on the stack...
> * fix bug in HMP parsing (see patch 1)
> 
> v4 -> v5:
> * add comment to patch 1 in "monitor-internal.h"
> * use qapi_free_SetPasswordOptions and friends, don't leak strdups
> * split QAPI change into 3 seperate patches
> 
> v3 -> v4:
> * drop previously patch 1, this was fixed here instead:
>   https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02529.html
> * patch 1: add Eric's R-b
> * patch 2: remove if-assignment, use 'deprecated' feature in schema
> 
> v2 -> v3:
> * refactor QMP schema for set/expire_password as suggested by Eric Blake and
>   Markus Armbruster
> 
> v1 -> v2:
> * add Marc-André's R-b on patch 1
> * use '-d' flag as suggested by Eric Blake and Gerd Hoffmann
>   * I didn't see a way to do this yet, so I added a "flags with values" arg type
> 
> Stefan Reiter (3):
>   monitor/hmp: add support for flag argument with value
>   qapi/monitor: refactor set/expire_password with enums
>   qapi/monitor: allow VNC display id in set/expire_password
> 
>  hmp-commands.hx            |  24 ++++----
>  monitor/hmp-cmds.c         |  47 ++++++++++++++-
>  monitor/hmp.c              |  19 +++++-
>  monitor/monitor-internal.h |   3 +-
>  monitor/qmp-cmds.c         |  49 +++++----------
>  qapi/ui.json               | 120 +++++++++++++++++++++++++++++++------
>  6 files changed, 194 insertions(+), 68 deletions(-)
> 
> -- 
> 2.30.2
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


