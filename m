Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D4F2DA95B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 09:41:11 +0100 (CET)
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp5tO-0008BN-BX
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 03:41:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kp5sQ-0007mG-3t
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:40:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kp5sO-0002V0-Hj
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:40:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608021607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RDAnlZ+hRqUBeK2slxSqmeDGHGaw/GbyKiDA4sv1uiE=;
 b=iro/fOb+iXU2x3iVbranQQVndwQXES70TRyvqBO0KCX/M2vGVVSqfIHhvUGsjZ/SrpIwV3
 +2werAHRQRRiuQ4H6t4U8LyDgo0mLGlalHDMES4XwtyPyzjY/2npslfypXbV+HpHebLHHD
 EZ+tQ+5VkkPjFciZduwKNFH/Hwgvp6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-rHIhHzqDP8WMY09RhCoxmA-1; Tue, 15 Dec 2020 03:40:06 -0500
X-MC-Unique: rHIhHzqDP8WMY09RhCoxmA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23A18107ACF5;
 Tue, 15 Dec 2020 08:40:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F2E3341E8;
 Tue, 15 Dec 2020 08:39:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8F57C11329A5; Tue, 15 Dec 2020 09:39:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v5 3/4] hmp: Use QMP query-netdev in hmp_info_network
References: <20201108235952.107961-1-lekiravi@yandex-team.ru>
 <20201108235952.107961-4-lekiravi@yandex-team.ru>
 <3e019e9d-2649-5df8-8f9c-8d76eb2615a5@redhat.com>
Date: Tue, 15 Dec 2020 09:39:57 +0100
In-Reply-To: <3e019e9d-2649-5df8-8f9c-8d76eb2615a5@redhat.com> (Jason Wang's
 message of "Mon, 7 Dec 2020 13:52:14 +0800")
Message-ID: <87o8ivmpia.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel@nongnu.org, Vincenzo Maffione <v.maffione@gmail.com>,
 Luigi Rizzo <rizzo@iet.unipi.it>, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>, Alexey Kirillov <lekiravi@yandex-team.ru>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jason Wang <jasowang@redhat.com> writes:

[...]
> One more stupid question, instead of generating the string via hard
> codes, is there any method (dict?) to iterate all the key/values 
> automatically?

QAPI visitors.

The lazy way: use the QObject output visitor to convert the QAPI type
(here: NetdevInfo) to QObject, then qobject_to_json() to convert to
JSON text.

If you don't want JSON, replace qobject_to_json().  Perhaps you can
create something that's generally useful for HMP, not just "info
network".  I'd pick keyval_parse() syntax.

The detour through QObject creates and destroys a rather fat temporary
data structure.  Tolerable when the amount of data is small.  An output
visitor that directly creates the string is more efficient.  Takes a bit
more code, though.  I intend to post one for JSON, to reduce QMP's
malloc gluttony.


