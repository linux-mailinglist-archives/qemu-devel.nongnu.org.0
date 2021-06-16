Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38633A9D08
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 16:10:28 +0200 (CEST)
Received: from localhost ([::1]:45174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltWFO-00060o-BF
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 10:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ltWER-0005JW-D5
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:09:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ltWEN-0000D5-LV
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:09:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623852561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gUnWNHPNp+IucsSaeFuYA6Aq+zBKPEVqqQS4MAe8SLM=;
 b=amXCET1A7ZoeuoruNtIxge/N/Mog2Wz0jqJ2VHAGdoHcpFqJRcRHh+UQoSG0hiRZdZt8i2
 Jj7liECxbFebXn3Y1p7uSWoinygnz0QT6zcgvO7YxEcfaFtX+Mn0z7cGsZ1Rgk4bwcJ9sd
 f+xIzDMRnJ83gdFlTD7i/FLddmNA4MM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-WaQcj3ZNM-eSecrcPaMNMQ-1; Wed, 16 Jun 2021 10:09:20 -0400
X-MC-Unique: WaQcj3ZNM-eSecrcPaMNMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2883818418
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 14:09:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D62B19726;
 Wed, 16 Jun 2021 14:09:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B1D6D113865F; Wed, 16 Jun 2021 16:09:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 03/11] keyval: introduce keyval_parse_into
References: <20210610133538.608390-1-pbonzini@redhat.com>
 <20210610133538.608390-4-pbonzini@redhat.com>
Date: Wed, 16 Jun 2021 16:09:17 +0200
In-Reply-To: <20210610133538.608390-4-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Thu, 10 Jun 2021 15:35:30 +0200")
Message-ID: <87zgvpaoky.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Allow parsing multiple keyval sequences into the same dictionary.
> This will be used to simplify the parsing of the -M command line
> option, which is currently a .merge_lists = true QemuOpts group.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Straightforward.  Thanks for adjusting the contract for
keyval_parse_into().

Reviewed-by: Markus Armbruster <armbru@redhat.com>

It's too hot & humid for me to figure out why you need both
keyval_merge() and keyval_parse_into().


