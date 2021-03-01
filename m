Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DFD329226
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 21:41:49 +0100 (CET)
Received: from localhost ([::1]:36838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGpMS-00062n-Dv
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 15:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lGpKI-0004tH-T6
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:39:38 -0500
Received: from hera.aquilenet.fr ([2a0c:e300::1]:43886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lGpKH-0006HQ-EX
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:39:34 -0500
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 7D57D2A2;
 Mon,  1 Mar 2021 21:39:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fEkC9XqHgUfR; Mon,  1 Mar 2021 21:39:28 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id A0816D9;
 Mon,  1 Mar 2021 21:39:28 +0100 (CET)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1lGpKB-003Yoi-Fl; Mon, 01 Mar 2021 21:39:27 +0100
Date: Mon, 1 Mar 2021 21:39:27 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Doug Evans <dje@google.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
Message-ID: <20210301203927.pi24kzmeroowfpys@begin>
References: <CADPb22TNebyiYxc+gtNFD+=CfwtWP4heSYt+_=uBcZAeWoWHXw@mail.gmail.com>
 <YDN73SqaDQDtwlgZ@redhat.com>
 <20210228213957.xkc4cceh5o6rgd5n@begin>
 <CADPb22RMRfRAe1Wto1dH8WaCFuMXwkWVEsNo-kXCY607=v4J_w@mail.gmail.com>
 <20210301162623.grhyejdwnshdv7t5@begin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301162623.grhyejdwnshdv7t5@begin>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 7D57D2A2
X-Spamd-Result: default: False [-2.50 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_FIVE(0.00)[5];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 TO_DN_ALL(0.00)[]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MID_RHS_NOT_FQDN(0.50)[];
 BAYES_HAM(-3.00)[100.00%]
Received-SPF: softfail client-ip=2a0c:e300::1;
 envelope-from=samuel.thibault@gnu.org; helo=hera.aquilenet.fr
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Samuel Thibault, le lun. 01 mars 2021 17:26:23 +0100, a ecrit:
> We could make libslirp enable the IPV6ONLY flag to avoid that, and
> make qemu pass an AF_UNSPEC address for the ipv4+ipv6 case, in which
> case libslirp wouldn't set IPV6ONLY.

Ah, no, AF_UNSPEC would not allow to specify the port. But we can use a
flag in the slirp_add_hostxfwd call.

Samuel

