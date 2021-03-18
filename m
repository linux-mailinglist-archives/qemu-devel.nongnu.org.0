Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D67734061E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 13:53:12 +0100 (CET)
Received: from localhost ([::1]:50708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMs9H-0008OL-5h
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 08:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMs7T-0007O7-EM
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 08:51:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMs7N-0005l7-94
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 08:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616071869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=iv00lkq4KpmiUnCsbaq63NHK2LmU55pVqsq5Ah7CB9o=;
 b=bYcI/hYryZUbxm5dw4rIgtq+dB1R3+o2GtaHtMgqOeGrhVVhQ6gj/2kr4rr8E6++Wz4HdZ
 gs/+M32VhtMGzOmOWwvf2CJ5m24P2GZGRgIuPXDg0oY3uqDlcablN3gwmiJCKpU022bB4N
 nOrsSOupXw0DlkvEt+Jg7zy/aLsknaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-4fdEso8vNHi5NJezD7UuvA-1; Thu, 18 Mar 2021 08:51:07 -0400
X-MC-Unique: 4fdEso8vNHi5NJezD7UuvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B129E108BD14
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 12:51:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 830BA60862;
 Thu, 18 Mar 2021 12:51:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 005C411386A7; Thu, 18 Mar 2021 13:51:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Misleading configure failure GLIB_SIZEOF_SIZE_T
Date: Thu, 18 Mar 2021 13:51:04 +0100
Message-ID: <87v99oiq13.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I just ran into this failure:

    $ ../configure --disable-tools --disable-system --static

    ERROR: sizeof(size_t) doesn't match GLIB_SIZEOF_SIZE_T.
           You probably need to set PKG_CONFIG_LIBDIR
           to point to the right pkg-config files for your
           build target

My config.log ends with

    cc -std=gnu99 -Wall -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -pthread -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -o config-temp/qemu-conf.exe config-temp/qemu-conf.c -static -m64 -fstack-protector-strong -lgthread-2.0 -pthread -lglib-2.0 -pthread -lpcre -pthread
    /usr/bin/ld: cannot find -lgthread-2.0
    /usr/bin/ld: cannot find -lglib-2.0
    /usr/bin/ld: cannot find -lpcre
    /usr/bin/ld: cannot find -lpthread
    /usr/bin/ld: cannot find -lc
    collect2: error: ld returned 1 exit status

I need to install more libraries.

The error message "sizeof(size_t) doesn't match GLIB_SIZEOF_SIZE_T." is
wrong.


