Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2B76A5C79
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 16:56:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX2Jr-00045z-2K; Tue, 28 Feb 2023 10:55:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pX2Jo-00042g-Hu
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:55:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pX2Jm-0006NX-Ul
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:55:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677599705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RhrEgmHHLV2GhAKpxtzdzwMiTo4Y3GV75K3EjCyDRI=;
 b=MR1ZQF4a394anKkmAI5rnL3qYdX4ILEVQHkzV74LdK6h8L80MpWYV+6jlNZFCuG3Yr3+vE
 BJuJITlOwCv6FTB3rWzp2MnlKCqlQNGvJtn7qi0C8FDvZEbNyvx6MInthTW1t+qzzNHXB3
 MT/JBD3lPjgYfnxlAicsNsr7mvloutg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-a_bql0tOO0-kwoCXBRc1zA-1; Tue, 28 Feb 2023 10:55:03 -0500
X-MC-Unique: a_bql0tOO0-kwoCXBRc1zA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21A10857F41;
 Tue, 28 Feb 2023 15:54:59 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED2CB492B0E;
 Tue, 28 Feb 2023 15:54:57 +0000 (UTC)
Date: Tue, 28 Feb 2023 09:54:56 -0600
From: Eric Blake <eblake@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 07/10] qapi: implement conditional command arguments
Message-ID: <20230228155456.6iqmkof76xvcjuws@redhat.com>
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-8-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230207142535.1153722-8-marcandre.lureau@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Feb 07, 2023 at 06:25:32PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The generated code doesn't quite handle the conditional arguments.
> For example, 'bar' in 'test-if-cmd' is not correctly surrounded by #if
> conditions. See generated code in qmp_marshal_test_if_cmd().
> 
> Note that if there are multiple optional arguments at the last position,
> there might be compilation issues due to extra comas. I left an assert
> and FIXME for later.

Would it be simpler to just state that ALL commands that want to use
optional arguments must use a boxed type?  Then the function signature
is simple (a single boxed type), and the logic of the optional
parameter is now contained within the type rather than within the
function signature.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


