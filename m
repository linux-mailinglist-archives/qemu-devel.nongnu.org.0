Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDAD1EE173
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 11:39:33 +0200 (CEST)
Received: from localhost ([::1]:42214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgmLU-0000u3-S6
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 05:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jgmKe-0000KQ-NJ
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 05:38:40 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22771
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jgmKd-0003av-Rq
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 05:38:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591263518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Inp27RRpYwkmZiU4OgeXOgBO3Oi8VhpF+SX4T2NsGvY=;
 b=ZM9QsEkDueoaiwUzM69bpDvm+62KpqSxkNizBwm1Dm/n9ZmDctC1pph8mVCzYLDgTY2tLY
 eLQCD92Mo3N5Vrvg5lRv+LcIQ8KYSzB+cYBXYcgdDTAbZjtMGG/mIr4J6awGmw3TatKett
 DfDSqezetXFDsNvmDnRVCTHra8r72TE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110--prUBEOFPRigt-IleOulMA-1; Thu, 04 Jun 2020 05:38:36 -0400
X-MC-Unique: -prUBEOFPRigt-IleOulMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 760FA800C78;
 Thu,  4 Jun 2020 09:38:35 +0000 (UTC)
Received: from work-vm (ovpn-114-247.ams2.redhat.com [10.36.114.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAB3E2DE70;
 Thu,  4 Jun 2020 09:38:30 +0000 (UTC)
Date: Thu, 4 Jun 2020 10:38:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3] migration/xbzrle: add encoding rate
Message-ID: <20200604093828.GB2851@work-vm>
References: <1588208375-19556-1-git-send-email-wei.w.wang@intel.com>
 <CAFXwXrm4R5nxk6ruTJ2kP5dUnF7Qm3TfRRiKVAUDNA1uwYf65w@mail.gmail.com>
 <5ED86344.4020505@intel.com>
 <4b9cd244-0d96-d1c8-11ec-b61a6bc2bfaa@linaro.org>
MIME-Version: 1.0
In-Reply-To: <4b9cd244-0d96-d1c8-11ec-b61a6bc2bfaa@linaro.org>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:08:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_HK_NAME_DR=0.01, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kevin.tian@intel.com, Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, gloryxiao@tencent.com,
 Wei Wang <wei.w.wang@intel.com>, yi.y.sun@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Richard Henderson (richard.henderson@linaro.org) wrote:
> On 6/3/20 7:58 PM, Wei Wang wrote:
> > It is possible that encoded_size==0, but unencoded_size !=0. For example,
> > a page is written with the same data that it already has.
> 
> That really contains 0 bytes?
> Not even the ones that say "same data"?
> 
> You certainly have a magical compression algorithm there.
> Or bad accounting.

We just don't bother sending the page at all in the case it's not
changed; no headers, no nothing:

    if (encoded_len == 0) {
        trace_save_xbzrle_page_skipping();
        return 0;

and that's xbzrle having correctly done it's job.


> > The encoding_rate is expected to reflect if the page is xbzrle encoding friendly.
> > The larger, the more friendly, so 0 might not be a good representation here.
> > 
> > Maybe, we could change UINT64_MAX above to "~0ULL" to avoid the issue?
> 
> ~0ull is no different than UINT64_MAX -- indeed, they are *exactly* the same
> value -- and is not an exactly representible floating-point value.
> 
> If unencoded_size != 0, and (somehow) encoded_size == 0, then
> 
>   unencoded_size / encoded_size = Inf
> 
> which is indeed the limit of x -> 0, n / x.
> 
> Which is *also* printable by %0.2f.
> 
> I still contend that the middle if should be removed, and you should print out
> whatever's left.  Either NaN or Inf is instructive.  Certainly nothing in the
> middle cares about the actual value.

Hmm OK; I'll admit to not liking NaN/Inf in output.

Dave

> 
> r~
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


