Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EC12F3B54
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 20:57:55 +0100 (CET)
Received: from localhost ([::1]:60798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzPnd-0005EX-RH
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 14:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kzPmQ-0004Py-Uk; Tue, 12 Jan 2021 14:56:38 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:47049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kzPmN-0000wn-2k; Tue, 12 Jan 2021 14:56:38 -0500
Received: from [192.168.100.1] ([82.252.137.42]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N94FT-1juKWG32Kl-0164AN; Tue, 12 Jan 2021 20:56:23 +0100
Subject: Re: [PATCH] vnc: Fix a memleak in vnc_display_connect()
To: Alex Chen <alex.chen@huawei.com>, kraxel@redhat.com
References: <20201126065702.35095-1-alex.chen@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <647da265-f3a6-fef1-dcb3-43c7957ecd3e@vivier.eu>
Date: Tue, 12 Jan 2021 20:56:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201126065702.35095-1-alex.chen@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rm9orNwHRJkg6KwqGfe7XI5k4640cJWCfjyMgihYiCp+F0skc8u
 nRiXqhXI3k3+ZC5ymUxVS7T8okqOhCDVwKrVR3t65gvheFq/oiLfJn/fmb0NINDdbrEpSCE
 Vfzjmro4ne+qrZAYrqF4FC6du5xcmSKhZ6ovAZYJLxzrErTPHuyAiAV1SN4oZ/u11ZTJhIk
 /zPWCb3wzjzOBrNGLLyMw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pYmKzHZTSS8=:aMvxUQsaVjxI+gOyogR0OR
 zydcsIKYHGnMgM0R9j8nLQKfZ4CVjxFIjb6hWGfrQyGZ4g6U6GT0SufCDJhviOFvVXxSu2sX+
 tvoJZMPBVzK2Ym+y0Xo+E/nsBUXqc//wCjdOn1MeBqiwZIcFnq0rULxd3w8X0wtezzH47dUwr
 BW5az3TCy2nlScgZUISZJ0XSzC5xmg/6HZVwjCs3XFumTAQLhSCYHuztQKpNRDTtzx2+h9h2/
 yiJtSnutmNKPaHP5cQAE/ao0DQV9uLdzVOIGgFrf4T27vKTc27Vnezb7VY0ug6OALzogRzTyl
 7OzAL/YJoiTzmc4jkKjsymEzoEOSNurxnatAzx/w4E8+ATJy5aO/FtTmFPkZA2V98tIfgyt2z
 1fVRS/sEo0IDpffqLWqQlJIwJEoadjqrAEh0/gQQqWllVHe0NUHqkP22IjyvL
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Applied to my trivial-patches branch.

Thanks,
Laurent


