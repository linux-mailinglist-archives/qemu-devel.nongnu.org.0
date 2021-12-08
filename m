Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CC946CED6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 09:26:20 +0100 (CET)
Received: from localhost ([::1]:45760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1musHK-0001Ok-IS
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 03:26:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1musFv-0000Ve-MI
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 03:24:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1musFs-00048w-Jb
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 03:24:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638951887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=77ptrkSdW6PGTFrrvbTG2nA24arzaxTjbTK2egSz5gg=;
 b=Zdn6a8cki8nxDVYtkhTellzv+DvtyXm2y2hMQ5fec/7kgsPYIlIIKj3YdHppETzTGB5RAY
 S5ekBCswfPO3y3DEy/yjZvrY6DYQIjNMY3M8mvfGMEUDV5wUbgwAMoIHYzpfOU84h6oUog
 2Ni74Mlcc4RMweOf9XMS9ZR+IIIfXks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-PHQj0JUEN_qC8x88QKdUzA-1; Wed, 08 Dec 2021 03:24:44 -0500
X-MC-Unique: PHQj0JUEN_qC8x88QKdUzA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E863B1023F50;
 Wed,  8 Dec 2021 08:24:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9AE260BF1;
 Wed,  8 Dec 2021 08:24:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7FAB3113865F; Wed,  8 Dec 2021 09:24:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH v7 1/7] net/vmnet: add vmnet dependency and customizable
 option
References: <20211207101828.22033-1-yaroshchuk2000@gmail.com>
 <20211207101828.22033-2-yaroshchuk2000@gmail.com>
 <87ilw07bca.fsf@dusky.pond.sub.org>
 <CADO9X9SF9gGUs6rQKS7eMZpHYTOA8W8pCztF8CSJOxDP2AEZ8A@mail.gmail.com>
Date: Wed, 08 Dec 2021 09:24:40 +0100
In-Reply-To: <CADO9X9SF9gGUs6rQKS7eMZpHYTOA8W8pCztF8CSJOxDP2AEZ8A@mail.gmail.com>
 (Vladislav Yaroshchuk's message of "Tue, 7 Dec 2021 20:39:41 +0300")
Message-ID: <87mtlbec6v.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
Cc: Jason Wang <jasowang@redhat.com>, phillip.ennen@gmail.com,
 qemu-devel <qemu-devel@nongnu.org>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Phillip Tennen <phillip@axleos.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladislav Yaroshchuk <yaroshchuk2000@gmail.com> writes:

> If you meant patch series cover letter, it exists, see
> https://patchew.org/QEMU/20211207101828.22033-1-yaroshchuk2000@gmail.com/

Never arrived here.  Since the list archive has it, the problem must be
on my end.  Thanks!


