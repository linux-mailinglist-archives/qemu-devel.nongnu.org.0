Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2CA28F75D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 19:00:41 +0200 (CEST)
Received: from localhost ([::1]:54002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT6cJ-0002uF-Ub
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 13:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kT6UM-0001wF-87
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 12:52:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kT6UH-0001Pw-4n
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 12:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602780740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=llH9wrjtFOuz0FCeC+jMKaYbRHVJSqilfUFVhFHCtIA=;
 b=Hw67hl7F7HYnMURYdV93aQjTdbljraB16RpOMEkTGnwZjIhHsR+NP+bMAnIXIddjWdDPuf
 dqNtrJhoZxdY413eOoqN5v/KukVZEO0uHnpOGgx33nFIhsbc4mJB3PwXkzgOVn7FcbMvtE
 HRoP+JsOwQW0cYPvH/faICb5TUyD/Ls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-6F4s-AQWOnON02Y09pyRzA-1; Thu, 15 Oct 2020 12:52:18 -0400
X-MC-Unique: 6F4s-AQWOnON02Y09pyRzA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A37480363A;
 Thu, 15 Oct 2020 16:52:17 +0000 (UTC)
Received: from localhost (ovpn-66-44.rdu2.redhat.com [10.10.66.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 143E860E1C;
 Thu, 15 Oct 2020 16:52:16 +0000 (UTC)
Date: Thu, 15 Oct 2020 12:52:15 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3] qom: code hardening - have bound checking while
 looping with integer value
Message-ID: <20201015165215.GE5733@habkost.net>
References: <20200921093325.25617-1-ani@anisinha.ca>
MIME-Version: 1.0
In-Reply-To: <20200921093325.25617-1-ani@anisinha.ca>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:38:26
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 21, 2020 at 03:03:25PM +0530, Ani Sinha wrote:
> Object property insertion code iterates over an integer to get an unused
> index that can be used as an unique name for an object property. This loop
> increments the integer value indefinitely. Although very unlikely, this can
> still cause an integer overflow.
> In this change, we fix the above code by checking against INT16_MAX and making
> sure that the interger index does not overflow beyond that value. If no
> available index is found, the code would cause an assertion failure. This
> assertion failure is necessary because the callers of the function do not check
> the return value for NULL.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Queued on machine-next, thanks!  My apologies for the delay.

-- 
Eduardo


