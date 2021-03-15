Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABA333B150
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:41:52 +0100 (CET)
Received: from localhost ([::1]:36644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlbb-00014g-8S
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lLlZC-0007iC-TR
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:39:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lLlYy-0001nb-U8
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615808347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UTwfW9xGGqNiHIlH42nUCTI08Fjm/TmIOJ5Mp9tEPmI=;
 b=SRPdUlA7LpW9pG53wAnPGpG24uLP/pyq8KIBzakueZmlnMLfeALlZvM3JbE4Q9jUH0uGYN
 6KgZ5CAN97UUsq0KZKwikzacFDAPkJlknRa9LS1zXNaTtcmF5SAUxPvbwBZhC7rvfCAkDV
 WNY+st4if1zMTn73iKap2XWrUh+YDM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-fc9yH-rTMsq-5gLeIVq1wA-1; Mon, 15 Mar 2021 07:39:06 -0400
X-MC-Unique: fc9yH-rTMsq-5gLeIVq1wA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11947100C61C;
 Mon, 15 Mar 2021 11:39:05 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-128.ams2.redhat.com [10.36.115.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 476FB60C5F;
 Mon, 15 Mar 2021 11:38:56 +0000 (UTC)
Date: Mon, 15 Mar 2021 12:38:54 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 26/30] qemu-img: Use user_creatable_process_cmdline()
 for --object
Message-ID: <YE9HTg/PjHjmGSir@merkur.fritz.box>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-27-kwolf@redhat.com>
 <87k0qby00g.fsf@dusky.pond.sub.org>
 <95899a3d-ae3e-c635-d381-502da7d1bc5b@redhat.com>
 <87mtv7tevw.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87mtv7tevw.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.03.2021 um 13:30 hat Markus Armbruster geschrieben:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
> > On 13/03/21 08:40, Markus Armbruster wrote:
> >>> +                if (!user_creatable_add_from_str(optarg, &local_err)) {
> >>> +                    if (local_err) {
> >>> +                        error_report_err(local_err);
> >>> +                        exit(2);
> >>> +                    } else {
> >>> +                        /* Help was printed */
> >>> +                        exit(EXIT_SUCCESS);
> >>> +                    }
> >>> +                }
> >>> +                break;
> >>>               }
> >>> -        }   break;
> >>>           case OPTION_IMAGE_OPTS:
> >>>               image_opts = true;
> >>>               break;
> >> Why is this one different?  The others all call
> >> user_creatable_process_cmdline().
> >> 
> >> 
> >
> > It's to exit with status code 2 instead of 1.
> 
> I see.  Worth a comment?

There is a comment at the start of the function (which is just a few
lines above) that explains the exit codes:

 * Compares two images. Exit codes:
 *
 * 0 - Images are identical or the requested help was printed
 * 1 - Images differ
 * >1 - Error occurred

Kevin


