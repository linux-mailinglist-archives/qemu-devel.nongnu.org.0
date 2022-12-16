Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4398464EC5E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:55:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6BAb-00086q-4u; Fri, 16 Dec 2022 08:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p6BAY-00086O-Nh; Fri, 16 Dec 2022 08:54:35 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p6BAW-0007gu-Fu; Fri, 16 Dec 2022 08:54:34 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1925F5CF7C;
 Fri, 16 Dec 2022 13:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671198869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tNrlAlGtyFIeN4ZTa8eQLhjmCM1vCnVO6P90U3cSGKU=;
 b=wy+2Z+yrnVxxizwSoJR2dOzzMG+HPI2OjnQ4okBPqAm9RxJUZOdI4mbpR9VWS+GAWb/0mE
 0NoJEF6D2/qLvKNISMXPPPTn3jMqJXW6bezv2bnsJsfX0DR56Wbkf6vjpvLuy+i9HTLeAe
 FIqfy0d6WmTo5k4sk+wVIyfeFRc6pt8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671198869;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tNrlAlGtyFIeN4ZTa8eQLhjmCM1vCnVO6P90U3cSGKU=;
 b=k90TdZbm5yW4HmDjQMtYP22jOMvO2g1DM51ArJWUm7/9AUC3M7dTD1H8k9hC0FK4Uubcpm
 qrgJFvZMCY8t67AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 90A75138F0;
 Fri, 16 Dec 2022 13:54:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Bo9FFZR4nGMkWAAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 16 Dec 2022 13:54:28 +0000
From: Fabiano Rosas <farosas@suse.de>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org, Peter Lieven
 <pl@kamp.de>, Kevin Wolf <kwolf@redhat.com>, libvir-list@redhat.com,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, =?utf-8?Q?Daniel_P=2E_Berrang?=
 =?utf-8?Q?=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 2/3] block: deprecate iSCSI 'password' in favour of
 'password-secret'
In-Reply-To: <20221216113152.584460-3-berrange@redhat.com>
References: <20221216113152.584460-1-berrange@redhat.com>
 <20221216113152.584460-3-berrange@redhat.com>
Date: Fri, 16 Dec 2022 10:54:26 -0300
Message-ID: <87y1r7h2st.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> Support for referencing secret objects was added in
>
>   commit b189346eb1784df95ed6fed610411dbf23d19e1f
>   Author: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>   Date:   Thu Jan 21 14:19:21 2016 +0000
>
>     iscsi: add support for getting CHAP password via QCryptoSecret API
>
> The existing 'password' option is overdue for deprecation and
> subsequent removal.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Fabiano Rosas <farosas@suse.de>

