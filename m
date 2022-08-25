Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4085A1CDE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:59:17 +0200 (CEST)
Received: from localhost ([::1]:37080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLoi-0001Ty-Cq
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1oRLll-0005Y4-OH; Thu, 25 Aug 2022 18:56:13 -0400
Received: from fencepost.gnu.org ([2001:470:142:3::e]:48270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1oRLlk-0000gS-Tc; Thu, 25 Aug 2022 18:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
 s=fencepost-gnu-org; h=In-Reply-To:MIME-Version:References:Subject:To:From:
 Date; bh=34QUsbjWUhkfrIZskbLaPt6GUfEKjLFfT5ft17PChjU=; b=Hq4H1HWx8XWnWCk/jQYu
 HdRvGX7tZon2Wap709DUC4yu6XOMDUd0FouVGmasS1CylcE5wsWjUzRr4olpPX4BaxQ3fF1B6ZcPz
 oBdg9TUVYisZvFxmlS0c3kcbAHVaGxojgFhgMwQo8GjWYCyhr51wMZMq0z3Ndf00oZ6TrHVUUnBHt
 DVASnbkSQ8ifIh5YPWlWsiIUyy+BXORUYwHJp3PUc3ze5Uefeirns6CnN70HVc1GrnTB8CCdu+tUt
 luD3a5XCOAlLFrQb5sOM+NEKQ1AX7nMbz+uBajxiBpbN43IT0duoewB3OqnbKBTzO8b2qw0eajymW
 pClyGkphmQqHBQ==;
Received: from [2a01:cb19:956:1b00:de41:a9ff:fe47:ec49] (port=58582 helo=begin)
 by fencepost.gnu.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1oRLlk-0004UD-Mh; Thu, 25 Aug 2022 18:56:12 -0400
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@gnu.org>) id 1oRLlj-002l1E-00;
 Fri, 26 Aug 2022 00:56:11 +0200
Date: Fri, 26 Aug 2022 00:56:10 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Peter Delevoryas <peter@pjd.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org,
 garnermic@fb.com, patrick@stwcx.xyz, zhdaniel@fb.com
Subject: Re: slirp: Can I get IPv6-only DHCP working?
Message-ID: <20220825225610.oio5h5bflp4gmaph@begin>
References: <Ywf5/cIDTV8OQ/0d@pdel-fedora-MJ0HJWH9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ywf5/cIDTV8OQ/0d@pdel-fedora-MJ0HJWH9>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Peter Delevoryas, le jeu. 25 août 2022 15:38:53 -0700, a ecrit:
> It seems like there's support for an IPv6 dns proxy, and there's literally a
> file called "dhcpv6.c" in slirp, but it has a comment saying it only supports
> whatever is necessary for TFTP network boot I guess.

For which DNS support is welcome :)

> Maybe there's no support then?

It seems there is:

    if (ri.want_dns) {
        *resp++ = OPTION_DNS_SERVERS >> 8; /* option-code high byte */
        *resp++ = OPTION_DNS_SERVERS; /* option-code low byte */
        *resp++ = 0; /* option-len high byte */
        *resp++ = 16; /* option-len low byte */
        memcpy(resp, &slirp->vnameserver_addr6, 16);
        resp += 16;
    }

Samuel

