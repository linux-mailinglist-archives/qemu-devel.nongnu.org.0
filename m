Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9762D2E51
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 16:34:16 +0100 (CET)
Received: from localhost ([::1]:33692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmf0I-0002AN-Ou
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 10:34:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kmevr-0008Gz-9d
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 10:29:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kmevo-0004fH-LF
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 10:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607441375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GBE/SerOL6wtPREh/Pa5ZzcbBVdUfbk8/NwR1xnFb20=;
 b=bhDrGah4u6AJM/RqPHS35rH9GfBLM0OqSHZQ7L6p0wa1KFiCYE9Hn8BrQoN3oqX/McnJfj
 ocW9uCt82VTXFJI+THXbvqI0Ra5XtOyJWZ4veN6HW9kHXwCqB3TDPWEU7DGQ8iXkrlW/Ow
 ZkFAawyzSyoQjgXuzWbhzf9zm5kntD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-H_m_2iFTMNCD4V9pSdysvw-1; Tue, 08 Dec 2020 10:29:33 -0500
X-MC-Unique: H_m_2iFTMNCD4V9pSdysvw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBF161927813;
 Tue,  8 Dec 2020 15:29:13 +0000 (UTC)
Received: from starship (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17FAF5C1A3;
 Tue,  8 Dec 2020 15:29:08 +0000 (UTC)
Message-ID: <b7fb21459daf73ae9fc624ae80c575cab29467e9.camel@redhat.com>
Subject: Re: [PATCH v3 2/2] block: qcow2: remove the created file on
 initialization error
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
Date: Tue, 08 Dec 2020 17:29:07 +0200
In-Reply-To: <w51wnxspbdx.fsf@maestria.local.igalia.com>
References: <20201208142159.492489-1-mlevitsk@redhat.com>
 <20201208142159.492489-3-mlevitsk@redhat.com>
 <w51wnxspbdx.fsf@maestria.local.igalia.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-12-08 at 16:26 +0100, Alberto Garcia wrote:
> On Tue 08 Dec 2020 03:21:59 PM CET, Maxim Levitsky wrote:
> > If the qcow initialization fails, we should remove the file if it was
> > already created, to avoid leaving stale files around.
> > 
> > We already do this for luks raw images.
> > 
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> 
> Reviewed-by: Alberto Garcia <berto@igalia.com>
> 
> >      ret = qcow2_co_create(create_options, errp);
> >      if (ret < 0) {
> > +
> > +        Error *local_delete_err = NULL;
> 
> Why that empty line though?

I didn't notice. I can send a new version if this is needed.

Thanks for the review!

Best regards,
	Maxim Levitsky
> 
> Berto
> 



