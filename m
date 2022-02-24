Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79A94C378E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 22:24:08 +0100 (CET)
Received: from localhost ([::1]:57156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNLap-00068K-B1
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 16:24:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1nNLZE-0005C8-Qj; Thu, 24 Feb 2022 16:22:30 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:46884
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1nNLZ2-0005Tu-5l; Thu, 24 Feb 2022 16:22:20 -0500
Received: from [192.168.178.59] (p5b1510d9.dip0.t-ipconnect.de [91.21.16.217])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 0B8A2DA1103;
 Thu, 24 Feb 2022 22:22:11 +0100 (CET)
Message-ID: <44e29af1-6d6b-5613-d4c3-aec1f133e931@weilnetz.de>
Date: Thu, 24 Feb 2022 22:22:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: qemu-devel@nongnu.org
References: <20220107154930.505075-1-sw@weilnetz.de>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] libvhost-user: Fix wrong type of argument to formatting
 function (reported by LGTM)
In-Reply-To: <20220107154930.505075-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.01.22 um 16:49 schrieb Stefan Weil:

> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> LGTM has some more alerts which need attention:
> https://lgtm.com/projects/g/qemu/qemu/
>
> Regards,
> Stefan
>
>   subprojects/libvhost-user/libvhost-user.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index 787f4d2d4f..6eb72c4200 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -651,7 +651,7 @@ generate_faults(VuDev *dev) {
>   
>           if (ioctl(dev->postcopy_ufd, UFFDIO_REGISTER, &reg_struct)) {
>               vu_panic(dev, "%s: Failed to userfault region %d "
> -                          "@%p + size:%zx offset: %zx: (ufd=%d)%s\n",
> +                          "@%" PRIx64 " + size:%zx offset: %zx: (ufd=%d)%s\n",
>                        __func__, i,
>                        dev_region->mmap_addr,
>                        dev_region->size, dev_region->mmap_offset,


Up to now I did not see any response to this patch, and it is also still 
missing in the latest code.

dev_region->mmap_addr is an uint64_t value, so the current format string 
"%p" won't work on any platform where pointers are not 64 bit value.

Stefan



