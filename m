Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20C7388D91
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 14:08:25 +0200 (CEST)
Received: from localhost ([::1]:34800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljKzx-0000wj-1S
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 08:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljKyn-0000H4-L4
 for qemu-devel@nongnu.org; Wed, 19 May 2021 08:07:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljKyh-0008Lv-Pn
 for qemu-devel@nongnu.org; Wed, 19 May 2021 08:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621426026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=34ONOp/SFejHvxLPWysYNU9BBjVJKbtaN0zfGvWC/ak=;
 b=Ds5M8W9Qfmz0ZBn716WLjT9rDP2j71UBR8wRklQoKQCdhgd273baTxBEoPsGbRv9AomB2p
 yl5QnuK+lxrbFE2uJyyx4G5qQ9DUk1b+Sb9ahyJz9Qjgh6j2WaRzOCfG9mg+Fbs2L+9t89
 U2UFLryPipL9pqrZBsoeoR7AjExVnU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-XBPP5T4BPUindXogD5_tjQ-1; Wed, 19 May 2021 08:07:04 -0400
X-MC-Unique: XBPP5T4BPUindXogD5_tjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0E081854E2A
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 12:07:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E62360C04;
 Wed, 19 May 2021 12:06:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B829B113861E; Wed, 19 May 2021 14:06:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v6 5/9] ui/vdagent: add mouse support
References: <20210519053940.1888907-1-kraxel@redhat.com>
 <20210519053940.1888907-6-kraxel@redhat.com>
Date: Wed, 19 May 2021 14:06:54 +0200
In-Reply-To: <20210519053940.1888907-6-kraxel@redhat.com> (Gerd Hoffmann's
 message of "Wed, 19 May 2021 07:39:36 +0200")
Message-ID: <8735ujq65d.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> writes:

> This patch adds support for mouse messages to the vdagent
> implementation.  This can be enabled/disabled using the new
> 'mouse' parameter for the vdagent chardev.  Default is on.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


