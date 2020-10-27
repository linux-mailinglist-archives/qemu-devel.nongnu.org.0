Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D92EC29A4C8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 07:38:03 +0100 (CET)
Received: from localhost ([::1]:34734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXIcM-0001EZ-Fr
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 02:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kXIaR-0000j1-K4
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 02:36:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kXIaP-0002sH-G6
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 02:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603780560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Au584E7N3mFwH1OUWBuJsb1Mz6+5v4llX06uCnJh88=;
 b=XSUEdsmAFIsqVLVcFCZNPfMPE5idChXyLHdzYNX172wtLaH1jaw8Jm91hKZkTZhkyujOVZ
 IUaFBpdsr+7pFwDeIEkzKldFoB+AW6a5IIx7MIOQRFzkmTrWB2Nv0rmG5uG0CJNN40ysCK
 hC6GLPwgO+Fv/9Jx1mYGaCS3kkefa5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-ANfDWEIDN_2Zr2kLe29LgA-1; Tue, 27 Oct 2020 02:35:58 -0400
X-MC-Unique: ANfDWEIDN_2Zr2kLe29LgA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4461D6408A;
 Tue, 27 Oct 2020 06:35:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 733F055781;
 Tue, 27 Oct 2020 06:35:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 00562113865F; Tue, 27 Oct 2020 07:35:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: mdroth@linux.vnet.ibm.com
Subject: Re: [PATCH 0/4] qga: Fix several guest-get-devices issues
References: <20201021071520.2168877-1-armbru@redhat.com>
Date: Tue, 27 Oct 2020 07:35:51 +0100
In-Reply-To: <20201021071520.2168877-1-armbru@redhat.com> (Markus Armbruster's
 message of "Wed, 21 Oct 2020 09:15:16 +0200")
Message-ID: <87imaw18hk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, tgolembi@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mike,

This series addresses interface defects, and must go into 5.2.  It's
fully reviewed.  Pull request in time for soft freeze would be ideal.
If you can't make it, feel free to ask me.  I'll continue to push for
the series even if it misses the soft freeze.


