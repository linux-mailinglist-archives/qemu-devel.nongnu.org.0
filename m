Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AE630BF9D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:37:12 +0100 (CET)
Received: from localhost ([::1]:60504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vrj-0002Uo-4p
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l6vqJ-00024E-B3
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:35:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l6vqG-00057V-GW
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:35:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612272939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xrpl9SpgZGFx/q1luDHFyUEw8VNOHUnwfqAhHeq/dGc=;
 b=Yx22a19ITkUKBlOn+dvnUCHpPSwupWOXf9kYOfnGPQ9xTmjLvkNCOmr409m0DRVMT4/nYy
 kjbvY1fnfV7EM/sV4qDv0toud228cRLkzRTBnl6OPjCayPLqIlYs+Eqg/7FFhGvHNqI6g7
 U3jWN1aVMdB7q7mqq4fW+VMv9aCQvbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-3KvtvwgiMfCRr2RQ3IS6xQ-1; Tue, 02 Feb 2021 08:35:37 -0500
X-MC-Unique: 3KvtvwgiMfCRr2RQ3IS6xQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79F6B835E26;
 Tue,  2 Feb 2021 13:35:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 326F25C230;
 Tue,  2 Feb 2021 13:35:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7075718000A7; Tue,  2 Feb 2021 14:35:34 +0100 (CET)
Date: Tue, 2 Feb 2021 14:35:34 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: vnc clipboard support
Message-ID: <20210202133534.u364ubxxvr5xyieb@sirius.home.kraxel.org>
References: <05C58667-D9BA-49E2-897D-2286B243E802@redhat.com>
 <20210201155116.GL4131462@redhat.com>
 <0C14700F-CF47-4CD1-AB41-AA69BC0DA469@redhat.com>
 <20210201165634.GM4131462@redhat.com>
 <D704948F-96C7-441F-BCA3-F848ABFD8087@redhat.com>
 <20210201174018.GP4131462@redhat.com>
 <8456ae54-b737-fa7d-cac8-75cd701f9ef5@eik.bme.hu>
 <20210202113144.jrmqtgllpgd2nw2h@sirius.home.kraxel.org>
 <e3598537-86af-6cf7-bdfe-eac43bce0f2@eik.bme.hu>
 <20210202123829.GF4168502@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202123829.GF4168502@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: qemu-devel@nongnu.org, Christophe de Dinechin <cdupontd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> The VNC protocol is way too crude. It is limited to transferring
> plain text, and provides no way to specify or negotiate a character
> set. The RFB spec says apps should use latin-1. In reality few, if any,
> impls do charset conversion so most Linux impls will be sending UTF8
> while Windows impls will be sending Windows Codepage 1252. It clearly
> shows its heritage of being designed in the 1990s.

Well, there is an extension which supports more than just text.  But it
is a small number of formats which clearly has window-ish background,
for example rich text format (windows wordpad) for formated text and dib
(aka windows device independant bitmap) for images.

Dunno how this looks on windows these days, but linux uses a combination
of legacy x11 naming and mime types for metadata.  When creating
something new I'd tend to also use mime types as they are an
established, os-independent standard.

take care,
  Gerd


