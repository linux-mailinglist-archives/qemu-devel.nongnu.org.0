Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8712F6353
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:42:02 +0100 (CET)
Received: from localhost ([::1]:38040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03p3-0006Gu-D9
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1l03kK-0002LG-B4
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:37:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1l03kH-0006MD-9r
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610635024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rx0/WVcVnhEk5fu4uffnnxPDB97QIwuRZGv1ezajLbQ=;
 b=G+9g6damhWMz4FMhBODJeLWyPaOECt0/3DKTATpPZFtZLYbQItY5iYhzGm9M6/uHZKfjYn
 vdHq6qv4Tb3t4yEKqdQ5dVjAQu8hOhr1koSGWhC8oLuozZkwpQ6CaS+1Dcd2TV8a3wjtYj
 yucF6VY3EwtgPaNKwVL+eMSZ1JJE/n4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-w82u9j2lPVGRZx1SRXUmyQ-1; Thu, 14 Jan 2021 09:36:59 -0500
X-MC-Unique: w82u9j2lPVGRZx1SRXUmyQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D2088145E0;
 Thu, 14 Jan 2021 14:36:58 +0000 (UTC)
Received: from lws.brq.redhat.com (unknown [10.40.195.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F51419C71;
 Thu, 14 Jan 2021 14:36:57 +0000 (UTC)
Date: Thu, 14 Jan 2021 15:36:54 +0100
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 1/2] Fix net.c warning on GCC 11
Message-ID: <20210114143654.3dk3blpcwt5iwh7p@lws.brq.redhat.com>
References: <cover.1610607906.git.mrezanin@redhat.com>
 <dcb4bfa3fe810236475b338f2f6401ec3d1a1c57.1610607906.git.mrezanin@redhat.com>
 <4fd8d2a3-e665-4422-79e0-4e2a7337e4fc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4fd8d2a3-e665-4422-79e0-4e2a7337e4fc@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 02:15:59PM +0100, Philippe Mathieu-Daudé wrote:
> +Jason +Dmitry
> 
> On 1/14/21 8:07 AM, Miroslav Rezanina wrote:
> > When building qemu with GCC 11, compiling eth.c file produce following warning:
> > 
> >    warning: array subscript 'struct ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct ip6_ext_hdr[1]' [-Warray-bounds]
> > 
> > This is caused by retyping from ip6_ext_hdr to ip6_ext_hdr_routing that has more
> > attributes.
> > 
> > As this usage is expected, suppress the warning temporarily through the function
> > using this retyping.
> 
> This is not expected, this is a bug...

Thanks for confirmation, my initial idea was the same but then I got
impression (do not remember where) that ip6_ext_hdr is not type where
data are initially written to so the overflow here is expected.

Mirek

> 
> > 
> > Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> > ---
> >  net/eth.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/net/eth.c b/net/eth.c
> > index 1e0821c5f8..b9bdd0435c 100644
> > --- a/net/eth.c
> > +++ b/net/eth.c
> > @@ -405,6 +405,8 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
> >                          struct ip6_ext_hdr *ext_hdr,
> >                          struct in6_address *dst_addr)
> >  {
> > +#pragma GCC diagnostic push
> > +#pragma GCC diagnostic ignored "-Warray-bounds"
> >      struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
> 
> eth_parse_ipv6_hdr() called iov_to_buf() to fill the 2 bytes of ext_hdr.
> 
> >      if ((rthdr->rtype == 2) &&
> 
> Here we access after the 2 bytes filled... rthdr->rtype is somewhere on
> eth_parse_ipv6_hdr's stack, its content is unknown.
> 
> > @@ -426,6 +428,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
> >      }
> >  
> >      return false;
> > +#pragma GCC diagnostic pop
> 
> Nacked-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> 


