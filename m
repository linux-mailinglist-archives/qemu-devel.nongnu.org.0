Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCD63FCCEF
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 20:22:22 +0200 (CEST)
Received: from localhost ([::1]:37776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL8Or-0004Bp-52
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 14:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mL8N3-0002ah-Ul
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 14:20:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mL8Mz-0003M3-9a
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 14:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630434022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EEAVwzl0sTONEzmPBinyKLz22G25jNuRJsI8LKKFZ4s=;
 b=P2bGQaVnHVxmFj6/AD7RDNCa1hpQQeTaXS1CvlW9ox53Gbn31Be7Xi61uwwL1XyqWsCJgI
 9Fw+N8+iFJ5vWzZKpI9S+lvEYQWt3qP1m3ZiyuMm2AUG4K+7qpB5XvCu+a6nf+UZHd5dMu
 Vn+MibyUp6kkT/4jvnbURgVz2AR2r34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-fD8uInCaOE2n-n9hF1yLxQ-1; Tue, 31 Aug 2021 14:20:21 -0400
X-MC-Unique: fD8uInCaOE2n-n9hF1yLxQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28680A0CCA;
 Tue, 31 Aug 2021 18:20:19 +0000 (UTC)
Received: from localhost (unknown [10.22.8.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82EAC60E1C;
 Tue, 31 Aug 2021 18:20:18 +0000 (UTC)
Date: Tue, 31 Aug 2021 14:20:17 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Luis Pires <luis.pires@eldorado.org.br>
Subject: Re: [PATCH v2 02/19] host-utils: move abs64() to host-utils as
 uabs64()
Message-ID: <20210831182017.4nplvbtr2nfpsdjh@habkost.net>
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
 <20210831164007.297781-3-luis.pires@eldorado.org.br>
MIME-Version: 1.0
In-Reply-To: <20210831164007.297781-3-luis.pires@eldorado.org.br>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 31, 2021 at 01:39:50PM -0300, Luis Pires wrote:
> Move abs64 to host-utils as uabs64, so it can be used elsewhere.
> The function was renamed to uabs64 and modified to return an
> unsigned value. This avoids the undefined behavior for common
> abs implementations, where abs of the most negative value is
> undefined.
> 
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

In case you need to send a new version of the series, I'd suggest
separating this into two patches: creation of the uabs64()
function in host-utils, and then changing the KVM PIT code to use
the new uabs64() function.  This way, the rest of your series
won't depend on the KVM PIT changes, helping bisectability and
backportability.

-- 
Eduardo


