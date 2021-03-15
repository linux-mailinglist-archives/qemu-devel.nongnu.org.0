Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1992933BDD4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:45:48 +0100 (CET)
Received: from localhost ([::1]:34012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLoTb-0000bL-2E
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lLoS4-0008QN-I8
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:44:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lLoS1-0007Ow-V4
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615819448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MPP/yzuKykbMDYUpwALSYWpQbfofvsVe00/EJqbRsSE=;
 b=ItuzHZuyEE2iM0ixDzLpNHAQfNIiJqTX1dnmZW23/BcZ8BKcUkyvbTZFw7VZeYPmSmMykn
 MmlfvvrvC3BGV7hw+W+AEdZ78juDzUbpbCFITl2qmrcuLLFVGSFsFZ+KuvXj8kYMSj+FYX
 CKXopCFosBs98zHFSbCWL+QUsh+T59w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504--U5BSu3LMyuBR8yq6Cy8Wg-1; Mon, 15 Mar 2021 10:44:07 -0400
X-MC-Unique: -U5BSu3LMyuBR8yq6Cy8Wg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26894108BD08;
 Mon, 15 Mar 2021 14:44:05 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-128.ams2.redhat.com [10.36.115.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9188510190AA;
 Mon, 15 Mar 2021 14:43:55 +0000 (UTC)
Date: Mon, 15 Mar 2021 15:43:54 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 26/30] qemu-img: Use user_creatable_process_cmdline()
 for --object
Message-ID: <YE9yqlIBeftHXqU2@merkur.fritz.box>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-27-kwolf@redhat.com>
 <87k0qby00g.fsf@dusky.pond.sub.org>
 <95899a3d-ae3e-c635-d381-502da7d1bc5b@redhat.com>
 <87mtv7tevw.fsf@dusky.pond.sub.org>
 <YE9HTg/PjHjmGSir@merkur.fritz.box>
 <87tupcfqp3.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87tupcfqp3.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Am 15.03.2021 um 15:15 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 13.03.2021 um 13:30 hat Markus Armbruster geschrieben:
> >> Paolo Bonzini <pbonzini@redhat.com> writes:
> >> 
> >> > On 13/03/21 08:40, Markus Armbruster wrote:
> >> >>> +                if (!user_creatable_add_from_str(optarg, &local_err)) {
> >> >>> +                    if (local_err) {
> >> >>> +                        error_report_err(local_err);
> >> >>> +                        exit(2);
> >> >>> +                    } else {
> >> >>> +                        /* Help was printed */
> >> >>> +                        exit(EXIT_SUCCESS);
> >> >>> +                    }
> >> >>> +                }
> >> >>> +                break;
> >> >>>               }
> >> >>> -        }   break;
> >> >>>           case OPTION_IMAGE_OPTS:
> >> >>>               image_opts = true;
> >> >>>               break;
> >> >> Why is this one different?  The others all call
> >> >> user_creatable_process_cmdline().
> >> >> 
> >> >> 
> >> >
> >> > It's to exit with status code 2 instead of 1.
> >> 
> >> I see.  Worth a comment?
> >
> > There is a comment at the start of the function (which is just a few
> > lines above) that explains the exit codes:
> >
> >  * Compares two images. Exit codes:
> >  *
> >  * 0 - Images are identical or the requested help was printed
> >  * 1 - Images differ
> >  * >1 - Error occurred
> 
> I had in mind a comment that helps me over the "why is this not using
> user_creatable_process_cmdline()" hump.  Like so:
> 
>         case OPTION_OBJECT:
>             {
>                 /*
>                  * Can't use user_creatable_process_cmdline(), because
>                  * we need to exit(2) on error.
>                  */
>                 ... open-coded variation of
>                 user_creatable_process_cmdline() ...
>             }
> 
> Entirely up to you.

I see. This patch is already part of a pull request, but I wouldn't mind
a follow-up patch to add this comment if you want to send one.

Kevin


