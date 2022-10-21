Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB9960706B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 08:49:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ollq4-0007mn-LF
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:49:04 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olloN-0002Xp-Lb
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ollo4-0002AX-45
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 02:47:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ollo2-0005oL-DE
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 02:46:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666334817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jpXOT60aSEVePNxPzhS7Cx5BChB4JcWs66WBHAn2u+s=;
 b=H4YF/HSnqa5ksNrXdejw5usaNF0Eu4tic502FgdpPFYZEXHnkErYebOC3woRCdcGBu1qzc
 5K/uc3upd4KKLelk+RKV5Wx7/K5z/7xRJ0eFIR2jBvdiowCBXSKaJOZzQCsTDFpSYxGHs5
 JilQ5nGen7vzVAHXTC6LKoUNsjIx7+o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-excxtAtJM-aWvuXQ-q56Cw-1; Fri, 21 Oct 2022 02:46:53 -0400
X-MC-Unique: excxtAtJM-aWvuXQ-q56Cw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC8168688D1;
 Fri, 21 Oct 2022 06:46:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 848D31759E;
 Fri, 21 Oct 2022 06:46:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 73EDE21E6686; Fri, 21 Oct 2022 08:46:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,  qemu-devel@nongnu.org,  Paul
 Durrant <paul@xen.org>,  Thomas Huth <thuth@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Greg Kurz <groug@kaod.org>,  Stefano Stabellini
 <sstabellini@kernel.org>,  David Gibson <david@gibson.dropbear.id.au>,
 Eric Blake <eblake@redhat.com>,  xen-devel@lists.xenproject.org,
 "Michael S. Tsirkin" <mst@redhat.com>,  Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>,  Samuel Thibault
 <samuel.thibault@ens-lyon.org>,  Anthony Perard
 <anthony.perard@citrix.com>,  Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v13 00/17] qapi: net: add unix socket type support to
 netdev backend
References: <20221020162558.123284-1-lvivier@redhat.com>
 <CACGkMEt9Hoo=GAuCUqMcBjqNvs94fEPA_GU9Z7TOh8c7Wam55Q@mail.gmail.com>
Date: Fri, 21 Oct 2022 08:46:51 +0200
In-Reply-To: <CACGkMEt9Hoo=GAuCUqMcBjqNvs94fEPA_GU9Z7TOh8c7Wam55Q@mail.gmail.com>
 (Jason Wang's message of "Fri, 21 Oct 2022 13:49:05 +0800")
Message-ID: <87h6zx4qsk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jason Wang <jasowang@redhat.com> writes:

> I've queued this version and will send pull requests shortly.
>
> Any future comment we can do patches on top.

Please give Laurent and me a few hours to try to improve PATCH 17's
commit message.  Which you could then integrate without a respin.


