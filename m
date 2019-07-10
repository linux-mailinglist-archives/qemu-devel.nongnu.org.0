Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269EB63FB2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 05:50:02 +0200 (CEST)
Received: from localhost ([::1]:57812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hl3cH-0004Ou-3Y
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 23:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48710)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jasowang@redhat.com>) id 1hl3bJ-0003xg-JN
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 23:49:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1hl3bG-0002PA-7Q
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 23:49:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56364)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1hl3bF-0001nG-G7
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 23:48:57 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2EDD53082B3F;
 Wed, 10 Jul 2019 03:48:05 +0000 (UTC)
Received: from [10.72.12.42] (ovpn-12-42.pek2.redhat.com [10.72.12.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F39DC196FB;
 Wed, 10 Jul 2019 03:48:00 +0000 (UTC)
To: Zhang Chen <chen.zhang@intel.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-dev <qemu-devel@nongnu.org>
References: <20190704083647.30614-1-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ad2627e3-8198-42f2-a89d-8e6a5596ef20@redhat.com>
Date: Wed, 10 Jul 2019 11:47:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190704083647.30614-1-chen.zhang@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 10 Jul 2019 03:48:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH V2] net/colo-compare.c: Fix memory leak and
 code style issue.
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
Cc: Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2019/7/4 =E4=B8=8B=E5=8D=884:36, Zhang Chen wrote:
> From: Zhang Chen <chen.zhang@intel.com>
>
> This patch to fix the origin "char *data" menory leak, code style issue
> and add necessary check here.
> Reported-by: Coverity (CID 1402785)
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>   net/colo-compare.c | 28 +++++++++++++++++++++-------
>   1 file changed, 21 insertions(+), 7 deletions(-)
>
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index 909dd6c6eb..ed349f5f6a 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -127,6 +127,17 @@ static int compare_chr_send(CompareState *s,
>                               uint32_t vnet_hdr_len,
>                               bool notify_remote_frame);
>  =20
> +static bool packet_matches_str(const char *str,
> +                               uint8_t *buf,
> +                               uint32_t packet_len)
> +{
> +    if (packet_len <=3D strlen(str)) {
> +        return false;
> +    }
> +
> +    return !memcmp(str, buf, strlen(str) + 1);


This assumes buf is NULL terminated (you pass notify_rs->buf) which is=20
not correct I think?

Thanks


> +}
> +
>   static void notify_remote_frame(CompareState *s)
>   {
>       char msg[] =3D "DO_CHECKPOINT";
> @@ -1008,21 +1019,24 @@ static void compare_notify_rs_finalize(SocketRe=
adState *notify_rs)
>   {
>       CompareState *s =3D container_of(notify_rs, CompareState, notify_=
rs);
>  =20
> -    /* Get Xen colo-frame's notify and handle the message */
> -    char *data =3D g_memdup(notify_rs->buf, notify_rs->packet_len);
> -    char msg[] =3D "COLO_COMPARE_GET_XEN_INIT";
> +    const char msg[] =3D "COLO_COMPARE_GET_XEN_INIT";
>       int ret;
>  =20
> -    if (!strcmp(data, "COLO_USERSPACE_PROXY_INIT")) {
> +    if (packet_matches_str("COLO_USERSPACE_PROXY_INIT",
> +                           notify_rs->buf,
> +                           notify_rs->packet_len)) {
>           ret =3D compare_chr_send(s, (uint8_t *)msg, strlen(msg), 0, t=
rue);
>           if (ret < 0) {
>               error_report("Notify Xen COLO-frame INIT failed");
>           }
> -    }
> -
> -    if (!strcmp(data, "COLO_CHECKPOINT")) {
> +    } else if (packet_matches_str("COLO_CHECKPOINT",
> +                                  notify_rs->buf,
> +                                  notify_rs->packet_len)) {
>           /* colo-compare do checkpoint, flush pri packet and remove se=
c packet */
>           g_queue_foreach(&s->conn_list, colo_flush_packets, s);
> +    } else {
> +        error_report("COLO compare got unsupported instruction '%s'",
> +                     (char *)notify_rs->buf);
>       }
>   }
>  =20

