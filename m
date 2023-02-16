Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05D7698FB2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:25:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSaVM-00071r-RH; Thu, 16 Feb 2023 04:24:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSaVI-0006uN-Qz
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:24:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSaVG-0006si-14
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676539472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uAOS3Aq5w1thmRrou1adMN4ib6qbRle83zkEuwQrJX4=;
 b=KI3fZD+owq8y1Z/oXdX/T5+kXaf4WgXKZze2kQAcmsDe06jtCmkxh+qEwFX2T+MsaUq+cH
 B9cK57hELjmUTsTt3qyeW38/4pyuKKhsC4WkgK1nN0kFhSBGE0OmRiZ6pSm0u/YqkETcXV
 kiNQ/UHnDpLzixDtrP1+to9ZxwFl2kI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-oYvd4yCAOTCyLCEefpstyw-1; Thu, 16 Feb 2023 04:24:26 -0500
X-MC-Unique: oYvd4yCAOTCyLCEefpstyw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23BD61C05ABF;
 Thu, 16 Feb 2023 09:24:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF263175AD;
 Thu, 16 Feb 2023 09:24:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DA48021E6A1F; Thu, 16 Feb 2023 10:24:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,  Eric Blake
 <eblake@redhat.com>,  Marcelo Tosatti <mtosatti@redhat.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  James Bottomley <jejb@linux.ibm.com>,  Tom
 Lendacky <thomas.lendacky@amd.com>,  Michael Roth <michael.roth@amd.com>,
 Ashish Kalra <ashish.kalra@amd.com>,  Mario Smarduch
 <mario.smarduch@amd.com>,  Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Subject: Re: [RFC PATCH v2 1/2] qapi, i386: Move kernel-hashes to
 SevCommonProperties
References: <20230216084913.2148508-1-dovmurik@linux.ibm.com>
 <20230216084913.2148508-2-dovmurik@linux.ibm.com>
Date: Thu, 16 Feb 2023 10:24:24 +0100
In-Reply-To: <20230216084913.2148508-2-dovmurik@linux.ibm.com> (Dov Murik's
 message of "Thu, 16 Feb 2023 08:49:12 +0000")
Message-ID: <87wn4irmif.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Dov Murik <dovmurik@linux.ibm.com> writes:

> In order to enable kernel-hashes for SNP, pull it from
> SevGuestProperties to its parent SevCommonProperties so
> it will be available for both SEV and SNP.

Missing

  Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>

Patch does not apply for me.


