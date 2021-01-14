Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4602F62F5
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:22:36 +0100 (CET)
Received: from localhost ([::1]:59484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03WE-0006mr-VG
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l03Ti-00056E-KJ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:19:58 -0500
Received: from relay68.bu.edu ([128.197.228.73]:39044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l03Tg-00079C-Jq
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:19:57 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 10EEJKZi015100
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 14 Jan 2021 09:19:23 -0500
Date: Thu, 14 Jan 2021 09:19:20 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 1/2] Fix net.c warning on GCC 11
Message-ID: <20210114141920.qjsnlt3cmkauggtw@mozz.bu.edu>
References: <cover.1610607906.git.mrezanin@redhat.com>
 <dcb4bfa3fe810236475b338f2f6401ec3d1a1c57.1610607906.git.mrezanin@redhat.com>
 <4fd8d2a3-e665-4422-79e0-4e2a7337e4fc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fd8d2a3-e665-4422-79e0-4e2a7337e4fc@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210114 1415, Philippe Mathieu-Daudé wrote:
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
> 

Seems related: https://bugs.launchpad.net/qemu/+bug/1879531
-Alex

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

