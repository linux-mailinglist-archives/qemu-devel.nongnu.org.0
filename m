Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52445AE508
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:11:05 +0200 (CEST)
Received: from localhost ([::1]:36222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVXs-0001kA-Mr
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1oVUvw-0006ty-0M
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:31:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1oVUvt-0005g5-AS
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662456706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hi+Qbw6CHfFZnKi2cur6A9Dasx3eNnwBpR3TjCWtulI=;
 b=bDMlNQm5TA9ZwipcwjW+gcfM8iQtwUxZsn+46X3wCwnkIH8p478mw56sQw/SaSL+Nppdmp
 3r40gjr47UGo3bCaq6q6Ggk4vCxzYHpsQqGDzZbbAjqlYbnz3ZOqPVWuBEkk753PkeovVT
 6raSdB3Kl2zJSO98qIdQ0bQThkR+qsU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-3uIzJLrsPQqUeLXetU28nA-1; Tue, 06 Sep 2022 05:31:45 -0400
X-MC-Unique: 3uIzJLrsPQqUeLXetU28nA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35D84803917
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 09:31:45 +0000 (UTC)
Received: from localhost (unknown [10.39.193.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E73032166B26;
 Tue,  6 Sep 2022 09:31:44 +0000 (UTC)
Date: Tue, 6 Sep 2022 10:31:44 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 00/11] crypto: improve robustness of LUKS metadata
 validation
Message-ID: <20220906093144.GO7484@redhat.com>
References: <20220906084147.1423045-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220906084147.1423045-1-berrange@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Sep 06, 2022 at 09:41:36AM +0100, Daniel P. Berrangé wrote:
> Richard pointed out that we didn't do all that much validation against
> bad parameters in the LUKS header metadata. This series adds a bunch
> more validation checks along with unit tests to demonstrate they are
> having effect against maliciously crafted headers.
> 
> Daniel P. Berrangé (11):
>   crypto: sanity check that LUKS header strings are NUL-terminated
>   crypto: enforce that LUKS stripes is always a fixed value
>   crypto: enforce that key material doesn't overlap with LUKS header
>   crypto: validate that LUKS payload doesn't overlap with header
>   crypto: strengthen the check for key slots overlapping with LUKS
>     header
>   crypto: check that LUKS PBKDF2 iterations count is non-zero
>   crypto: split LUKS header definitions off into file
>   crypto: split off helpers for converting LUKS header endianess
>   crypto: quote algorithm names in error messages
>   crypto: ensure LUKS tests run with GNUTLS crypto provider
>   crypto: add test cases for many malformed LUKS header scenarios
> 
>  crypto/block-luks-priv.h       | 143 ++++++++++++++++
>  crypto/block-luks.c            | 228 +++++++++++--------------
>  tests/unit/test-crypto-block.c | 302 ++++++++++++++++++++++++++++++++-
>  3 files changed, 542 insertions(+), 131 deletions(-)
>  create mode 100644 crypto/block-luks-priv.h

I think there is one typo in a commit message, but for the series:

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW


