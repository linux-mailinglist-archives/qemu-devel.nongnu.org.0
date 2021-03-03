Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058F832B55A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 08:03:09 +0100 (CET)
Received: from localhost ([::1]:41634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHLXH-000422-Ii
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 02:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHLVP-00035c-H5
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 02:01:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHLVK-0006up-Vt
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 02:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614754865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qc4DI0qAP/RO3Dc6EiCFSPF97HSRIGPo3I8RO1hyV9Q=;
 b=e403kHKTzyquaJ+RH2/wutD8rptv7WUgCZkywAh4ydT0aQUd6Qyn3Khxox1NPUZqArPgqu
 kXsBEcZ9rNwhgFf3R30GF2mcccJ4McESQ5gaCq28tk442VCJ8TVw8B0F0IfMgkhileGkIK
 DkwTf/sV7c3la8lYerXPDVfEPjrLXnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-RRhcth22NUSqVqxsBwqFLA-1; Wed, 03 Mar 2021 02:01:02 -0500
X-MC-Unique: RRhcth22NUSqVqxsBwqFLA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FCEA18B9EC3;
 Wed,  3 Mar 2021 07:01:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-154.ams2.redhat.com
 [10.36.112.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28BAE63B8C;
 Wed,  3 Mar 2021 07:01:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4DEE918000A7; Wed,  3 Mar 2021 08:00:59 +0100 (CET)
Date: Wed, 3 Mar 2021 08:00:59 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 2/3] qapi, audio: respect build time conditions in audio
 schema
Message-ID: <20210303070059.sx5t3y3d76f2aflo@sirius.home.kraxel.org>
References: <20210302175524.1290840-1-berrange@redhat.com>
 <20210302175524.1290840-3-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210302175524.1290840-3-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 02, 2021 at 05:55:23PM +0000, Daniel P. Berrangé wrote:
> Currently the -audiodev accepts any audiodev type regardless of what is
> built in to QEMU. An error only occurs later at runtime when a sound
> device tries to use the audio backend.
> 
> With this change QEMU will immediately reject -audiodev args that are
> not compiled into the binary. The QMP schema will also be introspectable
> to identify what is compiled in.

Note that audio backends are modularized, so "compiled with
CONFIG_AUDIO_ALSA" doesn't imply "alsa support is available".

take care,
  Gerd


