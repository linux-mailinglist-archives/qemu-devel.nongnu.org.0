Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFC65AD344
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:55:01 +0200 (CEST)
Received: from localhost ([::1]:53484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVBcw-0006vj-QG
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oVAqD-0005v7-8O
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:04:37 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:56991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oVAq7-0007HS-QU
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:04:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=48uvFd8R1lxPQODmB/BkaKaZ/Kq6FK1I0NDoNqKFMgw=; b=UfiI5EBMl3RB59ImRoFvVHtTf8
 plH4BokYu4lmJz78QU+z/cTkEzbvYzfrrezGe942GkXafuqU29rg6J0HahsCJ4gPV6e3AL/ZJMbCX
 hWrFpUwlCBCF7IevD+sq61gwb26Bh1aDDve7AtK+6XTT5j4s1ocMUWJg9/v7Okz7o0iOlJzHUcDLN
 fkKUBFweRYETUhMxgn/9auNfwx/N/LkrmH1xLHbilEVg0RRwdLktbvk/1DTgF96EvqWnE9u5BksYl
 hIBdBA+dt79t/PFo1HByZ5vcPU6VHz1YliZOkYdIElgjommWFGy8s1tvHywedZI+hz+gcpPRRc+3/
 Nkk6Ima+PNg18jQgeqJY2EpOD5yLqBNrIiT3r1044PoOLTNouO2Udop8mfCbH9AOUQtnWwc1xLmsM
 TuFylqME9u+NRv4WU2Y1N5h8CAKebtyU53xtTMHxShD0bGftqHlHanMYN3eJLdpg55mcjKI63lFRH
 7l4Ylz3+EfJoscYxFtCStPdCluq4168LG648Y3pau2kU9LWc4nuz16n4ljjasdMJ3hcaeJ975HXcd
 JFY2VoX+FPjTPbENH2UfQJPWbjoE2rE3ev2EVD/r4CWla6C/6DQFa3EjBh8uoeSo17ejoZnE6LCuD
 3oRfINW12IpY/WsaDouREVvxtvHoRVuhEUTVvWnuY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: peter.maydell@linaro.org, f4bug@amsat.org, marcandre.lureau@redhat.com,
 richard.henderson@linaro.org, berrange@redhat.com, mst@redhat.com,
 kraxel@redhat.com, qemu-devel@nongnu.org
Cc: tugy@chinatelecom.cn
Subject: Re: [PATCH v1 0/2] introduce qemu_socketpiar()
Date: Mon, 05 Sep 2022 14:04:24 +0200
Message-ID: <2356130.dJNAEDbtAm@silver>
In-Reply-To: <cover.1661240709.git.tugy@chinatelecom.cn>
References: <cover.1661240709.git.tugy@chinatelecom.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

On Dienstag, 23. August 2022 09:50:38 CEST tugy@chinatelecom.cn wrote:
> From: Guoyi Tu <tugy@chinatelecom.cn>
> 
> Introduce qemu_socketpair() to create socket pair fd, and
> set the close-on-exec flag at default as with the other type
> of socket does.
> 
> besides, the live update feature is developing, so it's necessary
> to do that.
> 
> Guoyi Tu (2):
>   oslib-posix: Introduce qemu_socketpair()
>   vhost-user: Call qemu_socketpair() instead of socketpair()
> 
>  hw/display/vhost-user-gpu.c |  3 ++-
>  hw/virtio/vhost-user.c      |  2 +-
>  include/qemu/sockets.h      | 18 ++++++++++++++++++
>  util/oslib-posix.c          | 19 +++++++++++++++++++
>  4 files changed, 40 insertions(+), 2 deletions(-)

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>





