Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD0B3A5E78
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:36:47 +0200 (CEST)
Received: from localhost ([::1]:60548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsi5O-0006VV-Lb
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lsi32-0002wA-0k
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:34:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lsi30-0000r7-9n
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623659657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UFmXdU8g6Ov04a0vi+ESFrXaxYrlyhX1GJ4ralhlrak=;
 b=ZVAPB/h3dvF10wDUH9uKQBw6iIXdZbjeE7XS1urfe9NyazDOw3WWPxq5dIANXyZx9GE/jO
 Q0J+QVgVONfwsxgBE/I3lzaSewU7aFFZFDveSRzvJcVNBl5Tu0pl6npDf76k9hObvIuku+
 7g16GNKXk31/5pacz4CAb5sTbX7S9PE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-I3ihX6GpPWGJEnWcCYrzaQ-1; Mon, 14 Jun 2021 04:34:16 -0400
X-MC-Unique: I3ihX6GpPWGJEnWcCYrzaQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C53E100C609;
 Mon, 14 Jun 2021 08:34:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 100595C22B;
 Mon, 14 Jun 2021 08:34:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 98EB9113865F; Mon, 14 Jun 2021 10:34:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [RFC PATCH V1 0/3] tpm: Eliminate TPM related code if
 CONFIG_TPM is not set
References: <20210612012102.1820063-1-stefanb@linux.ibm.com>
Date: Mon, 14 Jun 2021 10:34:13 +0200
In-Reply-To: <20210612012102.1820063-1-stefanb@linux.ibm.com> (Stefan Berger's
 message of "Fri, 11 Jun 2021 21:20:59 -0400")
Message-ID: <87y2bc4zga.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Berger <stefanb@linux.ibm.com> writes:

> The following patches entirely elimiante TPM related code if CONFIG_TPM
> is not set.
>
>   Stefan

I believe this is on top of Philippe's "[PATCH v2 2/2] tpm: Return QMP
error when TPM is disabled in build"

Based-on: <20210609184955.1193081-3-philmd@redhat.com>

However, it should probably go *first*, so the additional 'if' to
suppress warnings about unused qmp_marshal_output_TpmFOO() can be
squashed into Philippe's patch.

Apart from that, this looks good to me!

Additional 'if':

diff --git a/qapi/tpm.json b/qapi/tpm.json
index 09332e6f99..e74c881ea6 100644
--- a/qapi/tpm.json
+++ b/qapi/tpm.json
@@ -17,7 +17,9 @@
 #
 # Since: 1.5
 ##
-{ 'enum': 'TpmModel', 'data': [ 'tpm-tis', 'tpm-crb', 'tpm-spapr' ] }
+{ 'enum': 'TpmModel', 'data': [ 'tpm-tis', 'tpm-crb', 'tpm-spapr' ],
+  'if': 'defined(CONFIG_TPM)' }
+
 ##
 # @query-tpm-models:
 #
@@ -47,7 +49,8 @@
 #
 # Since: 1.5
 ##
-{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator' ] }
+{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator' ],
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @query-tpm-types:
@@ -124,7 +127,8 @@
 { 'struct': 'TPMInfo',
   'data': {'id': 'str',
            'model': 'TpmModel',
-           'options': 'TpmTypeOptions' } }
+           'options': 'TpmTypeOptions' },
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @query-tpm:


