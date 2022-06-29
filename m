Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCCE5601BA
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:52:58 +0200 (CEST)
Received: from localhost ([::1]:59092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Y7l-0005Qh-D1
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6Y4v-0002UE-On
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 09:50:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6Y4s-0007zC-8q
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 09:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656510597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qYErzokliGjsoCENAxVuSs57nLKM8jq/7/tAB6XIgj8=;
 b=ilrpB5j9gD0WVJRa4aBUtKmhOae15ZrvwOp0Hdu0E1zEVzf0+Zd1ffEoxrjU87tYlH6tHj
 nv2uccmcFnq0g1VTAAZ7IV2inZv55aZ38YCsYP8Cul3cUhrB/QU/80sOx+lShv26bQgH/v
 673lFWb2dYsRp7F0IXdHov1a/mam3ns=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-8vqlgJeuNwC_EPsZJY0iyQ-1; Wed, 29 Jun 2022 09:49:48 -0400
X-MC-Unique: 8vqlgJeuNwC_EPsZJY0iyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5966581D9CA
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 13:49:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33DC71415108;
 Wed, 29 Jun 2022 13:49:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0AF1E21E690D; Wed, 29 Jun 2022 15:49:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v5 05/12] qapi: net: add stream and dgram netdevs
References: <20220627154749.871943-1-lvivier@redhat.com>
 <20220627154749.871943-6-lvivier@redhat.com>
Date: Wed, 29 Jun 2022 15:49:47 +0200
In-Reply-To: <20220627154749.871943-6-lvivier@redhat.com> (Laurent Vivier's
 message of "Mon, 27 Jun 2022 17:47:42 +0200")
Message-ID: <8735fneg04.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> writes:

> Copied from socket netdev file and modified to use SocketAddress
> to be able to introduce new features like unix socket.
>
> "udp" and "mcast" are squashed into dgram netdev, multicast is detected
> according to the IP address type.
> "listen" and "connect" modes are managed by stream netdev. An optional
> parameter "server" defines the mode (server by default)
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>

Suggest to add a summary of what we learned during review.  Let me try.

  The two new types need to parsed the modern way with -netdev, because
  <explanation goes here>.

  The previous commit paved the way for parsing the modern way, but
  omitted one detail: how to pick modern vs. traditional, in
  netdev_is_modern().

  We want to pick based on the value of parameter "type".  But how to
  extract it from the option argument?

  Parsing the option argument, either the modern or the traditional way,
  extracts it for us, but only if parsing succeeds.

  If parsing fails, there is no good option.  No matter which parser we
  pick, it'll be the wrong one for some arguments, and the error
  reporting will be confusing.

  Fortunately, the traditional parser accepts *anything* when called in
  a certain way.  This maximizes our chance to extract the value of
  "type", and in turn minimizes the risk of confusing error reporting.

How do you like it?


