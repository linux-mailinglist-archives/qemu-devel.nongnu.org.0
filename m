Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A257C3AE4FB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:34:38 +0200 (CEST)
Received: from localhost ([::1]:58452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFO9-0007VY-MY
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lvFMi-0005aB-NL
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:33:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lvFMh-0002Ox-6K
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624264386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/rC1zQYXz9dLX7EH8TQlZq0VTkhvCz8KjlOyn9PDss=;
 b=FWdlWxj4bU/OFhs50Y5/PeWi8eA4sFS5hsc+0fWWGImR84eCfEK5NYnaBzLdjoDYHJOWKL
 zdlVma9aQhm/wgrlzvnskjr7PkOAtqqffUVLkG8+FxpzoV0TQHcqhDAQ9HUEU0IURiADCd
 294ITTIXrdvQDMzqbmC75M+E5mjOTBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-UHX8MUisMKKJkQaSvvrtTg-1; Mon, 21 Jun 2021 04:33:05 -0400
X-MC-Unique: UHX8MUisMKKJkQaSvvrtTg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3432F804312;
 Mon, 21 Jun 2021 08:33:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-99.ams2.redhat.com
 [10.36.112.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8082818AD4;
 Mon, 21 Jun 2021 08:32:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 187D4112D587; Mon, 21 Jun 2021 10:32:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Khor, Swee Aun" <swee.aun.khor@intel.com>
Subject: Re: [PATCH v2] ui/gtk: Allow user to select monitor number to
 display qemu in full screen through new gtk display option
References: <20210617020609.18089-1-swee.aun.khor@intel.com>
 <8735tfsa79.fsf@dusky.pond.sub.org>
 <DM8PR11MB571712EDA6522BB50D192A63AF0A9@DM8PR11MB5717.namprd11.prod.outlook.com>
Date: Mon, 21 Jun 2021 10:32:57 +0200
In-Reply-To: <DM8PR11MB571712EDA6522BB50D192A63AF0A9@DM8PR11MB5717.namprd11.prod.outlook.com>
 (Swee Aun Khor's message of "Mon, 21 Jun 2021 05:26:09 +0000")
Message-ID: <87wnqn1uti.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
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
Cc: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>, "eblake@redhat.com" <eblake@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Khor, Swee Aun" <swee.aun.khor@intel.com> writes:

> Hi Markus,
> Thanks for include Graphic maintainer and the coding style comments.  Yes=
, sweeaun is my name =F0=9F=98=8A

I'd expect something like

    Signed-off-by: Khor, Swee Aun <swee.aun.khor@intel.com>


