Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC10DBBBCF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 20:49:16 +0200 (CEST)
Received: from localhost ([::1]:32900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCTOd-00017M-M0
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 14:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53320)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iCTMA-0008JR-VY
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:46:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iCTM9-0007KI-Ld
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:46:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35980)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iCTM9-0007Jo-GO
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:46:41 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 063E55859E;
 Mon, 23 Sep 2019 18:46:40 +0000 (UTC)
Received: from dhcp-17-179.bos.redhat.com (dhcp-17-179.bos.redhat.com
 [10.18.17.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F10415D71C;
 Mon, 23 Sep 2019 18:46:34 +0000 (UTC)
Date: Mon, 23 Sep 2019 14:46:32 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] podman: fix command invocation
Message-ID: <20190923184632.GA6528@dhcp-17-179.bos.redhat.com>
References: <20190913193821.17756-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913193821.17756-1-jsnow@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 23 Sep 2019 18:46:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 13, 2019 at 03:38:21PM -0400, John Snow wrote:
> Oops; there's no argv here.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/docker/docker.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/docker/docker.py b/tests/docker/docker.py
> index 29613afd48..bc7a470ca2 100755
> --- a/tests/docker/docker.py
> +++ b/tests/docker/docker.py
> @@ -334,7 +334,7 @@ class Docker(object):
>              cmd = [ "-u", str(uid) ] + cmd
>              # podman requires a bit more fiddling
>              if self._command[0] == "podman":
> -                argv.insert(0, '--userns=keep-id')
> +                cmd.insert(0, '--userns=keep-id')
>  
>          ret = self._do_check(["run", "--label",
>                               "com.qemu.instance.uuid=" + label] + cmd,
> -- 
> 2.21.0
> 
> 

Hit it Today while testing your test/docker Python 3 patches.

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

