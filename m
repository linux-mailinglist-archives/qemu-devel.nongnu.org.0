Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7941FEBC9
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 08:57:40 +0200 (CEST)
Received: from localhost ([::1]:50578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jloUV-0000Te-DL
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 02:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jloSy-0007t9-QF
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 02:56:04 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57118
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jloSw-0001Zb-Hz
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 02:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592463360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=eHHewTtYb69Es1LE3vZdcUbxAlv9dd3TpL89uh0f4og=;
 b=N3RB2kAsU9JkbYFu8VIKzZ0oif0zrkDzyvtrfquMRPtL0f39FarPtIBEgYURMCCdqyUw4W
 OoR8wC5yVc3ioDsgIR92geOtbpWqsG5qGn/xHbBcHGT9LCSug/+jT5WGpEEaXcK4DOVRc1
 8BAd1e1NiFAov1dQGhsd+RR+Gx0zwRA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-2eWAbsoeO8Kkf_xSqoXz9A-1; Thu, 18 Jun 2020 02:55:59 -0400
X-MC-Unique: 2eWAbsoeO8Kkf_xSqoXz9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32CA11083E84
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 06:55:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BB5F10246F2;
 Thu, 18 Jun 2020 06:55:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CEDA11132BD7; Thu, 18 Jun 2020 08:55:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Gibson <dgibson@redhat.com>
Subject: Memory leak in spapr_machine_init()?
Date: Thu, 18 Jun 2020 08:55:53 +0200
Message-ID: <874kr8uakm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 00:57:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Either I'm confused (quite possible), or kvmppc_check_papr_resize_hpt()
can leak an Error object on failure.  Please walk through the code with
me:

        kvmppc_check_papr_resize_hpt(&resize_hpt_err);

This sets @resize_hpt_err on failure.

        if (spapr->resize_hpt == SPAPR_RESIZE_HPT_DEFAULT) {
            /*
             * If the user explicitly requested a mode we should either
             * supply it, or fail completely (which we do below).  But if
             * it's not set explicitly, we reset our mode to something
             * that works
             */
            if (resize_hpt_err) {
                spapr->resize_hpt = SPAPR_RESIZE_HPT_DISABLED;
                error_free(resize_hpt_err);
                resize_hpt_err = NULL;

Case 1: failure and SPAPR_RESIZE_HPT_DEFAULT; we free @resize_hpt_err.
Good.

            } else {
                spapr->resize_hpt = smc->resize_hpt_default;
            }
        }

        assert(spapr->resize_hpt != SPAPR_RESIZE_HPT_DEFAULT);

        if ((spapr->resize_hpt != SPAPR_RESIZE_HPT_DISABLED) && resize_hpt_err) {
            /*
             * User requested HPT resize, but this host can't supply it.  Bail out
             */
            error_report_err(resize_hpt_err);
            exit(1);

Case 2: failure and not SPAPR_RESIZE_HPT_DISABLED; fatal.  Good.

        }

What about case 3: failure and SPAPR_RESIZE_HPT_DISABLED?

Good if we get here via case 1 (we freed @resize_hpt_err).

Else, ???


