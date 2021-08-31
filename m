Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCEE3FC440
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 10:47:35 +0200 (CEST)
Received: from localhost ([::1]:38588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKzQb-0007jV-JW
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 04:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mKzNx-0006dl-KI
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 04:44:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mKzNt-0003V0-VH
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 04:44:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630399483;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1xllgsFXFSP0Ughl2nM6yCTktdPOYljzxysSE0EKI+s=;
 b=SMS5HL3n9Ha1EJUHhyWCmMzeUEwy6DJ8ansjI+4ADaJy1Z7iRIKyt49jIUZnfGLPeR3VeH
 5PbI+SSgFroB6qBrwxuKeNKnuhwrdbP6j+15N1XSzDZkVmbwiPLXcQjGy11SzF0/Zpisck
 pYS4opn+CzA2MzRs6VTGDlCl7y9C4nY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-1W9hOinjMf2TPl-FmK7Rrg-1; Tue, 31 Aug 2021 04:44:38 -0400
X-MC-Unique: 1W9hOinjMf2TPl-FmK7Rrg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CA8780196F;
 Tue, 31 Aug 2021 08:44:37 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4439F5C1A3;
 Tue, 31 Aug 2021 08:44:35 +0000 (UTC)
Date: Tue, 31 Aug 2021 09:44:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: block/curl: should we be checking curl_easy_setopt() for errors?
Message-ID: <YS3r3CceplN2S6se@redhat.com>
References: <CAFEAcA9YCwrm43JfFE_oenTYnj+vfOHD+Bw4mTHAqOnBgpQX-w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9YCwrm43JfFE_oenTYnj+vfOHD+Bw4mTHAqOnBgpQX-w@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 30, 2021 at 04:34:56PM +0100, Peter Maydell wrote:
> Coverity complains (CID 1460331, 1459482, 1459336, 1458895)
> that we call curl_easy_setopt(), which can return an error value,
> but we never check the return value.
> 
> Is it correct? Looking at the libcurl documentation, the function
> does return an error status, and there's nothing that says it's
> ok to ignore (e.g. that it's guaranteed that the library will
> safely accumulate any errors and return them when you make the
> subsequent curl_easy_perform() call). On the other hand, neither
> the libcurl manpage example nor the handful of example programs
> at https://curl.se/libcurl/c/example.html ever seem to check the
> return value from curl_easy_setopt()...

Options that accept a string can return CURLE_OUT_OF_MEMORY from
curl_easy_setopt.Most other failures seem to be reporting caller
errors such as forgotten arguments, or too long strings.

Does look like we ought to check return status though for at
least some of the options, and if you check it for some then
coverity will also complain if you don't check it for all.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


