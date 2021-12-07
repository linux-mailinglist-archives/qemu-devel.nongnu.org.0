Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AB746BD57
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 15:14:29 +0100 (CET)
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mubEi-0000hu-CA
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 09:14:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mubD6-0008Lq-Lh
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 09:12:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mubD3-0008J1-Ki
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 09:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638886364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8W3wRxMoXci3DQr/gsWNlO97VaXlwsyB6T9L77y9HCM=;
 b=d6ttyVGeWrb5qbUrwMkJOOw7mDR1VnPkUqdhI4tFVnv6/37yK6bUrT2gTAZcMw09ptTBmd
 fBIwy5QRKH5Fa9VRLlynRHFCbu2luiZXUbuEhPLrosofKE4vP6Hwz63G/By8i2yZvpsHNH
 xGykEh5tcKb0NFyBc2D+PAeidlJCEfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-dHGy6oKUPmiBZTpz4E8oTQ-1; Tue, 07 Dec 2021 09:12:41 -0500
X-MC-Unique: dHGy6oKUPmiBZTpz4E8oTQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0C101023F55;
 Tue,  7 Dec 2021 14:12:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B57C13A58;
 Tue,  7 Dec 2021 14:12:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8B75C113865F; Tue,  7 Dec 2021 15:12:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH v7 1/7] net/vmnet: add vmnet dependency and customizable
 option
References: <20211207101828.22033-1-yaroshchuk2000@gmail.com>
 <20211207101828.22033-2-yaroshchuk2000@gmail.com>
Date: Tue, 07 Dec 2021 15:12:37 +0100
In-Reply-To: <20211207101828.22033-2-yaroshchuk2000@gmail.com> (Vladislav
 Yaroshchuk's message of "Tue, 7 Dec 2021 13:18:22 +0300")
Message-ID: <87ilw07bca.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
Cc: jasowang@redhat.com, phillip.ennen@gmail.com, qemu-devel@nongnu.org,
 r.bolshakov@yadro.com, phillip@axleos.com, akihiko.odaki@gmail.com,
 hsp.cat7@gmail.com, hello@adns.io, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No cover letter?


