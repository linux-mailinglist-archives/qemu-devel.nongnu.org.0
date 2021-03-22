Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1439B343E2C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:43:25 +0100 (CET)
Received: from localhost ([::1]:37400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOI1s-0004jm-5M
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lOHmR-0008Be-Ut
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:27:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lOHmO-0004is-Ae
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616408842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0ajlH6k94ChvXpuTslcukyWjQLHOBoVmYAD24wqgQyA=;
 b=KiyJeJ8WdGogYtU39xYyGuTvACjiqph6HfLA4mC2pIB1WFZ9aiwdindfzLX9hF2zYNPNEd
 CQD+PIvPVY7bwRQE47mDXJiatwIgiYsWhMBYWJQsJzBHd9kXYRpOvckyp6zf7973wZKAJp
 QL+7t24FtL3GPrhdBxkc8tJwm3JxWEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-ufFAvxX-PLOtBRLvZ_lHVQ-1; Mon, 22 Mar 2021 06:27:20 -0400
X-MC-Unique: ufFAvxX-PLOtBRLvZ_lHVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 757B9A0C22;
 Mon, 22 Mar 2021 10:27:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30BDE26188;
 Mon, 22 Mar 2021 10:27:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8E746180039B; Mon, 22 Mar 2021 11:27:17 +0100 (CET)
Date: Mon, 22 Mar 2021 11:27:17 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 2/7] ui/vdagent: core infrastructure
Message-ID: <20210322102717.xakx5rfg3gdekjfk@sirius.home.kraxel.org>
References: <20210318091647.3233178-1-kraxel@redhat.com>
 <20210318091647.3233178-3-kraxel@redhat.com>
 <CAJ+F1CL2mR1BwHfV7FzjV5Dh-nq-4CGP74ptxJgS75LN-6DdpQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CL2mR1BwHfV7FzjV5Dh-nq-4CGP74ptxJgS75LN-6DdpQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > +    if (vd->msgsize != msg->size + sizeof(*msg)) {
> > +        /* FIXME: handle parse messages splitted into multiple chunks */
> > +        fprintf(stderr, "%s: size mismatch: chunk %d, msg %d (+%zd)\n",
> > +                __func__, vd->msgsize, msg->size, sizeof(*msg));
> >
> 
> Not fixing? You handle chunking on sending but not on receiving?

linux vdagent doesn't do chunking on send, so no need (and also no
testcase) so far.

Didn't try windows guests (yet), but that is next on my clipboard
todo list.

take care,
  Gerd


