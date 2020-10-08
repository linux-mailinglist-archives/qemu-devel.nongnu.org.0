Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25739287EA2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 00:23:25 +0200 (CEST)
Received: from localhost ([::1]:44782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQeJn-0000FZ-A0
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 18:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1kQeGC-0007wV-NK
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 18:19:40 -0400
Received: from relay.felk.cvut.cz ([2001:718:2:1611:0:1:0:70]:20308)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pisa@cmp.felk.cvut.cz>) id 1kQeG9-0003D7-78
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 18:19:40 -0400
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by relay.felk.cvut.cz (8.15.2/8.15.2) with ESMTP id 098MIPLd023646;
 Fri, 9 Oct 2020 00:18:25 +0200 (CEST)
 (envelope-from pisa@cmp.felk.cvut.cz)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 098MIPYM001395; Fri, 9 Oct 2020 00:18:25 +0200
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 098MIPH3001393;
 Fri, 9 Oct 2020 00:18:25 +0200
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 2/3] can-host-socketcan: Fix crash when 'if' option is not
 set
Date: Fri, 9 Oct 2020 00:18:24 +0200
User-Agent: KMail/1.9.10
References: <20201008202713.1416823-1-ehabkost@redhat.com>
 <20201008202713.1416823-3-ehabkost@redhat.com>
In-Reply-To: <20201008202713.1416823-3-ehabkost@redhat.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202010090018.24802.pisa@cmp.felk.cvut.cz>
X-FELK-MailScanner-Information: 
X-MailScanner-ID: 098MIPLd023646
X-FELK-MailScanner: Found to be clean
X-FELK-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-0.436, required 6, autolearn=not spam, BAYES_00 -0.50,
 KHOP_HELO_FCRDNS 0.28, NICE_REPLY_A -0.21, SPF_HELO_NONE 0.00,
 SPF_NONE 0.00)
X-FELK-MailScanner-From: pisa@cmp.felk.cvut.cz
X-FELK-MailScanner-Watermark: 1602800307.27792@M6MNmp1d0dLGwC3wtyMVdg
Received-SPF: none client-ip=2001:718:2:1611:0:1:0:70;
 envelope-from=pisa@cmp.felk.cvut.cz; helo=relay.felk.cvut.cz
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 18:19:32
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.214,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Vikram Garhwal <fnu.vikram@xilinx.com>,
 "Daniel P. =?iso-8859-1?q?Berrang=E9?=" <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?iso-8859-1?q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for catching missing test

On Thursday 08 of October 2020 22:27:12 Eduardo Habkost wrote:
> Fix the following crash:
>
>   $ qemu-system-x86_64 -object can-host-socketcan,id=obj0
>   Segmentation fault (core dumped)
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Pavel Pisa <pisa@cmp.felk.cvut.cz>
> Cc: Vikram Garhwal <fnu.vikram@xilinx.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-devel@nongnu.org
> ---
>  net/can/can_socketcan.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/net/can/can_socketcan.c b/net/can/can_socketcan.c
> index 92b1f79385..4b68f60c6b 100644
> --- a/net/can/can_socketcan.c
> +++ b/net/can/can_socketcan.c
> @@ -194,6 +194,11 @@ static void can_host_socketcan_connect(CanHostState
> *ch, Error **errp) struct sockaddr_can addr;
>      struct ifreq ifr;
>
> +    if (!c->ifname) {
> +        error_setg(errp, "'if' property not set");
> +        return;
> +    }
> +
>      /* open socket */
>      s = qemu_socket(PF_CAN, SOCK_RAW, CAN_RAW);
>      if (s < 0) {

Acked-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>

-- 
                Pavel Pisa
    e-mail:     pisa@cmp.felk.cvut.cz
    Department of Control Engineering FEE CVUT
    Karlovo namesti 13, 121 35, Prague 2
    university: http://dce.fel.cvut.cz/
    personal:   http://cmp.felk.cvut.cz/~pisa
    projects:   https://www.openhub.net/accounts/ppisa
    CAN related:http://canbus.pages.fel.cvut.cz/


