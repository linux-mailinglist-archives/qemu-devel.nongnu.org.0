Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7D23330A7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:11:27 +0100 (CET)
Received: from localhost ([::1]:48762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjdW-0005Rh-Jb
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjAf-0000x7-0M; Tue, 09 Mar 2021 15:41:38 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:60807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjAc-0006Ow-Ha; Tue, 09 Mar 2021 15:41:36 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MSKly-1lD5Iv2Zzc-00Sc9D; Tue, 09 Mar 2021 21:41:29 +0100
Subject: Re: [PATCH 1/2] backends/dbus-vmstate: Fix short read error handling
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210126124240.2081959-1-armbru@redhat.com>
 <20210126124240.2081959-2-armbru@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <b3f5ab1f-589a-1f61-2043-07b661a50272@vivier.eu>
Date: Tue, 9 Mar 2021 21:41:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210126124240.2081959-2-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oSsrdiPWMyOl6VqfWDrh385HhTVgOou919K26Zxss4ZGW5py/ZL
 ld7q7p0wIFnwxl8jPItldpIjzFxwmQrMxzVgBBtpNyR8kUfphrAyHtkUfDj0noIm53CGtZS
 rpJJucWMun2C3C+rsi6B+RotZ4zLWQWavaINRv2ZAX5zSj9HX/Qs/p+HQ+eAioYURocd5Cr
 V+xCGZstvNNhOy/D5KlBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:B5RMyDUOuNs=:YIF2twlaB6QPLHKIyWde6H
 bIsi4TDldq4vFgYENmwy89FsVSRyXZvO4MhjQH2ps/Du1fjzLCHcEHNne0FPRH3pUAZAZVswa
 1/Qvp/930qzG0PP1c8lzO9RS4x5yIXAUXeuopLYybvTVmnSdoVSoCkWo6h2jFAdBNrZE8Ueq8
 Jy0yzphoBelDuuKuqxv1vyouZuJ2fdNgfKE78EHWs0QYlubam/QsrU4qhSBRnL8Na8U1Obu/F
 cWXaxAfBEZF1+1zwIFAjxoJWEbGvxaNtt2aLMkHP+Dy2//827oTBa1y0RQHNQ3DcBSpFCsKH+
 uMiYW70KaYVhLayWk89xGKRzZqcwhYwtCHwtw/gS7rJK6YwVHLmHgoNCr/pkCQhyhFf22cl7N
 AOmCJwKX3mG9dRyuUi+xlCCc/w28hsy9F4KpsDphxbC+8tup1J4zIdxrDpC8F
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 marcandre.lureau@redhat.com, kraxel@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/01/2021 à 13:42, Markus Armbruster a écrit :
> When dbus_vmstate_post_load() fails, it complains to stderr.  Except
> on short read, where it checks with g_return_val_if_fail().  This
> fails silently if G_DISABLE_CHECKS is undefined (it should be), or
> else pads the short read with uninitialized bytes.
> 
> Replace g_return_val_if_fail() by a proper error check.
> 
> Fixes: 5010cec2bc87dafab39b3913c8ca91f88df9c540
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  backends/dbus-vmstate.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
> index bd050e8e9c..2a0d2e4a31 100644
> --- a/backends/dbus-vmstate.c
> +++ b/backends/dbus-vmstate.c
> @@ -229,7 +229,10 @@ static int dbus_vmstate_post_load(void *opaque, int version_id)
>                                       &bytes_read, NULL, &err)) {
>              goto error;
>          }
> -        g_return_val_if_fail(bytes_read == len, -1);
> +        if (bytes_read != len) {
> +            error_report("%s: Short read", __func__);
> +            return -1;
> +        }
>          id[len] = 0;
>  
>          trace_dbus_vmstate_loading(id);
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


