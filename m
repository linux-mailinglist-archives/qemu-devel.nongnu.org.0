Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3272F705E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 03:09:54 +0100 (CET)
Received: from localhost ([::1]:50744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0EYj-0008Rw-4X
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 21:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l0EX3-0007RE-Ki
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 21:08:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l0EWz-0006uD-Kb
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 21:08:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610676484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4S8jmM1gdO+j7RtHM9AtEshSRA1tVh2KfskVQ5Rxb70=;
 b=PX9I0N9hBvBq0IT74o5BcX3FDj5AkGfUmwIju3NLzqCg+Q+u2NmoGArpgg8Gvv8PDZ3Nx+
 G5VSbaq8Sm0he0wBrF3U6FRwAcwr/VS/94cGuMG6RGq+fJ8j+q5JUBEnImdyKRAvkGM+Rk
 in6+qNpl2cDeU76wLFF5M2nIZnTTG8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-d2YF-BYTOEqNQfLowJfrfA-1; Thu, 14 Jan 2021 21:08:02 -0500
X-MC-Unique: d2YF-BYTOEqNQfLowJfrfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6418615720
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 02:08:01 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 827155D739;
 Fri, 15 Jan 2021 02:07:57 +0000 (UTC)
Subject: Re: [PATCH 09/11] qapi/gen: Support for switching to another module
 temporarily
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201218205407.1326907-1-armbru@redhat.com>
 <20201218205407.1326907-10-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <df6a8584-fbf4-48aa-2283-1f90ed981491@redhat.com>
Date: Thu, 14 Jan 2021 21:07:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201218205407.1326907-10-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 3:54 PM, Markus Armbruster wrote:
> +    @contextmanager
> +    def _temp_module(self, name: str) -> ContextManager[None]:

Doesn't quite typecheck; we want Iterator[None] -- I think we're typing 
the function that is yet-to-be-decorated -- mypy will handle typing the 
resulting function.

--js


