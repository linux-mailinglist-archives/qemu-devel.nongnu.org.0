Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B814E2F3B23
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 20:51:09 +0100 (CET)
Received: from localhost ([::1]:44614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzPh6-0006ow-Dl
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 14:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kzPfg-0005xI-05; Tue, 12 Jan 2021 14:49:40 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:52463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kzPfd-00075U-Nz; Tue, 12 Jan 2021 14:49:39 -0500
Received: from [192.168.100.1] ([82.252.137.42]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MN5Nt-1kgMgD0ViX-00J1qz; Tue, 12 Jan 2021 20:49:24 +0100
Subject: Re: [PATCH] vnc: Fix a memleak in vnc_display_connect()
To: Alex Chen <alex.chen@huawei.com>, kraxel@redhat.com
References: <20201126065702.35095-1-alex.chen@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a431bb77-4cf5-c94e-2aa4-c1ac52400ec6@vivier.eu>
Date: Tue, 12 Jan 2021 20:49:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201126065702.35095-1-alex.chen@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vTYDjdgZ2IzQzPpgtsDnQAK5/HGbB4sVlVFC1hjx7vNSG1NQujb
 PPupmVYmtUzs8Ne76594QpTzAkYgmRWnd0dDLj7Tqd4p1mWwiCAeYPjXleEx6VtjHsU1V+4
 pil2GcLhZ4Dkutb4xmnjbf/nat4qc1r/yXg+yZgT0393N9dAh6537C5HuXfWxR+XggZ9GVl
 owTlnWMO5Vd9V23YIkWzg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JYuw/Ti/a4Q=:vlq4SrqZSHFLBo4ClxnZ+J
 ogfrZbwXCqyZsRbtStOpGs652h0/asmzbNP4erNmer4PzY/5mBVrelwHU1OU4O0KEnoMtMP74
 +xe2NYpJaOzTxRqlURCuilLd/HrxVYgjuWlloptpA5DMMHeERDOBSEOUsuNHUHa6KGNGOsnHS
 45fvvAN9m3BcRoWYZRHwRJHiIRxuhSNOk/XS7n6ufhVGwqPcklRfhu8xxn6r9f5/DIqsrgJ8N
 VyBPWVe/9X8rS32zFu3tI+TrNLwO+kFcn98aKljfsOJDSJXBgCHjV74DSkCDznJZpM+mJC5Uh
 HXb1h9g2T776A8m5vPw15FkcjtUQhd1pm1CSA54wM5sTAHtjIyzRKleFh6/m0PJi3/g0rvZfT
 DMz19t3hv0KcNStu6H899piuFlLEIdVOnPBhannQ0It6LMMX10L69DtThmxWCpUWlSi7475K7
 m9tPHsheXA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/11/2020 à 07:57, Alex Chen a écrit :
> Free the 'sioc' when the qio_channel_socket_connect_sync() fails.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  ui/vnc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 49235056f7..dae56e9493 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -3743,6 +3743,7 @@ static int vnc_display_connect(VncDisplay *vd,
>      sioc = qio_channel_socket_new();
>      qio_channel_set_name(QIO_CHANNEL(sioc), "vnc-reverse");
>      if (qio_channel_socket_connect_sync(sioc, saddr[0], errp) < 0) {
> +        object_unref(OBJECT(sioc));
>          return -1;
>      }
>      vnc_connect(vd, sioc, false, false);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

