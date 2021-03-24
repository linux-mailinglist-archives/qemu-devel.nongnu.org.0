Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C523334733B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 09:16:16 +0100 (CET)
Received: from localhost ([::1]:34946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOygZ-00020d-53
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 04:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOyf6-0001S0-LW
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:14:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOyez-0005Hy-Nc
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616573675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nD1M9sP4GQByG10KFXOikjB3OEozBDmlij7fB5PeGPM=;
 b=OpS24+fKipdPYSwtuK4Iz3bdzeWbYlHwrgCgLu62BLde20irF3VeEtgm/LekajJ3qD2ALi
 /4V6fLEOCEapkOPuFEMpsteel5aZDxBhHYuhfkV9Puo12J27CUIrHG3e5F602uoAonFD/Z
 9HK/kscKayvS+ff9j5W/yTedTHdooWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-dWi4CcojNGWSO_tqYPOauw-1; Wed, 24 Mar 2021 04:14:33 -0400
X-MC-Unique: dWi4CcojNGWSO_tqYPOauw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90DD610866AE;
 Wed, 24 Mar 2021 08:14:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E758B1992D;
 Wed, 24 Mar 2021 08:14:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7A6FD11327E1; Wed, 24 Mar 2021 09:14:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 05/20] qobject: Change qobject_to_json()'s value to GString
References: <20201211171152.146877-1-armbru@redhat.com>
 <20201211171152.146877-6-armbru@redhat.com>
 <fd5690fb-cc11-3477-7ab8-78d10a3277d0@redhat.com>
Date: Wed, 24 Mar 2021 09:14:27 +0100
In-Reply-To: <fd5690fb-cc11-3477-7ab8-78d10a3277d0@redhat.com> (Thomas Huth's
 message of "Wed, 24 Mar 2021 08:16:34 +0100")
Message-ID: <871rc59dek.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 11/12/2020 18.11, Markus Armbruster wrote:
>> qobject_to_json() and qobject_to_json_pretty() build a GString, then
>> covert it to QString.  Just one of the callers actually needs a
>> QString: qemu_rbd_parse_filename().  A few others need a string they
>> can modify: qmp_send_response(), qga's send_response(), to_json_str(),
>> and qmp_fd_vsend_fds().  The remainder just need a string.
>> Change qobject_to_json() and qobject_to_json_pretty() to return the
>> GString.
>> qemu_rbd_parse_filename() now has to convert to QString.  All others
>> save a QString temporary.  to_json_str() actually becomes a bit
>> simpler, because GString provides more convenient modification
>> functions.
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
>  Hi Markus!
>
> This patch broke the output of default values in the device help. With
> commit eab3a4678b07267c39e72:
>
> $ ./qemu-system-x86_64 -device pvpanic,help
> pvpanic options:
>   events=<uint8>         -  (default: (null))
>   ioport=<uint16>        -  (default: (null))
>   pvpanic[0]=<child<qemu:memory-region>>
>
> With the commit right before that one:
>
> $ ./qemu-system-x86_64 -device pvpanic,help
> pvpanic options:
>   events=<uint8>         -  (default: 3)
>   ioport=<uint16>        -  (default: 1285)
>   pvpanic[0]=<child<qemu:memory-region>>
>
> Any ideas how to fix that?

Yes:

diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index c3324b0f86..bd8a947a63 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -159,7 +159,7 @@ char *object_property_help(const char *name, const char *type,
     }
     if (defval) {
         g_autofree char *def_json = g_string_free(qobject_to_json(defval),
-                                                  true);
+                                                  false);
         g_string_append_printf(str, " (default: %s)", def_json);
     }
 

I'll post a proper patch.  Sorry for the dumb mistake, and thanks for
pinpointing the commit!


