Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9F969481F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:34:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZsu-0000Zy-Uy; Mon, 13 Feb 2023 09:32:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pRZst-0000YI-9G
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:32:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pRZsr-0003ta-Cj
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676298764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CEQIveOmx9QJpzrU27rdrVjn8OVvsmkoQmBKOBmsPoI=;
 b=IjZgOo1JVox5tohC0NFwHLE9Pw7oobscACHiL0IuyyO0ugEf6G1QvlMdfsHM3XcCkwGI7A
 MyhB268GVI/cRSpemYBy+0pxMe9IsLffHGPZhagjmBUFRjuGGdQSl0FQKJZMJDwoI2GJCj
 +oKU/mJ58uoHbxuoKfoQrZlwSJz8jms=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-F1IyJq4ON0uMpvq0uSyVeQ-1; Mon, 13 Feb 2023 09:32:40 -0500
X-MC-Unique: F1IyJq4ON0uMpvq0uSyVeQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F68085C70B;
 Mon, 13 Feb 2023 14:32:39 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81994492B03;
 Mon, 13 Feb 2023 14:32:38 +0000 (UTC)
Date: Mon, 13 Feb 2023 15:32:37 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org, ale@rev.ng,
 hreitz@redhat.com
Subject: Re: [PATCH] block: Handle curl 7.55.0, 7.85.0 version changes
Message-ID: <Y+pKBVkzivH+Xwvb@redhat.com>
References: <20230123201431.23118-1-anjo@rev.ng>
 <CAFEAcA_WiWwMVt8GQa8AHW5pO57W0NrHaGYJzoj8UVGyvTxmVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_WiWwMVt8GQa8AHW5pO57W0NrHaGYJzoj8UVGyvTxmVQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 13.02.2023 um 14:28 hat Peter Maydell geschrieben:
> On Mon, 23 Jan 2023 at 20:15, Anton Johansson via <qemu-devel@nongnu.org> wrote:
> >
> > * 7.55.0 deprecates CURLINFO_CONTENT_LENGTH_DOWNLOAD in favour of a *_T
> >   version, which returns curl_off_t instead of a double.
> > * 7.85.0 deprecates CURLOPT_PROTOCOLS and CURLOPT_REDIR_PROTOCOLS in
> >   favour of *_STR variants, specifying the desired protocols via a
> >   string.
> >
> > Signed-off-by: Anton Johansson <anjo@rev.ng>
> 
> Block folks -- this patch has been reviewed, are you going to
> pick it up (with the Resolves: line added) ?

Yes, I'm going through the patches right now that were stuck because the
previous pull request was blocked by CI.

Thanks, applied to the block branch.

Kevin


