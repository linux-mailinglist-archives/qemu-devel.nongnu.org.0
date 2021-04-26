Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D783736B134
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 12:04:14 +0200 (CEST)
Received: from localhost ([::1]:48582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lay69-0003ro-EE
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 06:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lay2y-0002Wr-PP
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 06:01:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lay2v-0000Gi-Bl
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 06:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619431252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PA74sfXqj6QSgV1uSz6eLUNwRV4rMujeeQpw07g5tto=;
 b=Aqt2k+7mA7AJEs+vro32hLJPnLyW3xLQeaZvOeMS3RMvXP76Sq6YuUJyOmCebwpGO77JmY
 y9bdOMuzI2tMk6Sf0Z6V+7xsmwmrS3EbaGhk4K/ftyj7utL9cndwwCuRBI9GQLy4MlWloh
 DrQOdw0D/3R6Mx0kr4SxlAxHaGLg7WQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-PwYyZubiOeGYrwyuePTBFQ-1; Mon, 26 Apr 2021 06:00:48 -0400
X-MC-Unique: PwYyZubiOeGYrwyuePTBFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A51C1008062;
 Mon, 26 Apr 2021 10:00:47 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-150.ams2.redhat.com
 [10.36.113.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BE0269FB1;
 Mon, 26 Apr 2021 10:00:41 +0000 (UTC)
Date: Mon, 26 Apr 2021 12:00:38 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 0/4] accel/tcg: Make sure that tb->size != 0 after
 translation
Message-ID: <20210426120038.5919f026.cohuck@redhat.com>
In-Reply-To: <f84d413f-6f25-eca0-e963-dc11e446f38a@linaro.org>
References: <20210416154939.32404-1-iii@linux.ibm.com>
 <20210423123111.0575608e.cohuck@redhat.com>
 <f84d413f-6f25-eca0-e963-dc11e446f38a@linaro.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 10:50:59 -0700
Richard Henderson <richard.henderson@linaro.org> wrote:

> On 4/23/21 3:31 AM, Cornelia Huck wrote:
> > So, what's the way forward here? I can pick this if I get an ack for
> > the arm patch. If someone else wants to take this, I'll just ack the
> > s390x patch.  
> 
> You've volunteered, so that means you get it, I think.  ;-)
> 
> 
> r~
> 

I guessed as much :) Thanks for your review!


