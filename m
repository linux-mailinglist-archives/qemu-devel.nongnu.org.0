Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF290330BAB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:48:46 +0100 (CET)
Received: from localhost ([::1]:45882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJDRN-0003sv-TW
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:48:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJDPt-0002wE-IP
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:47:13 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:36099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJDPr-0005Fp-Oi
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:47:13 -0500
Received: from [192.168.100.1] ([82.252.159.174]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M6lxY-1lOCIM0apq-008LIk; Mon, 08 Mar 2021 11:47:08 +0100
Subject: Re: [PATCH v2] linux-user: Fix executable page of /proc/self/maps
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Nicolas Surbayrole <nsurbayrole@quarkslab.com>
References: <20210308091959.986540-1-nsurbayrole@quarkslab.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c74adef9-fb5f-06ee-9dfc-083576a5a607@vivier.eu>
Date: Mon, 8 Mar 2021 11:47:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308091959.986540-1-nsurbayrole@quarkslab.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DxgknW6ICzZRefs+QN2KB1BasHlJlNYV469/oZL5luu/X0goVkb
 oVnQBSG/eY0afta61AC+LEfQusEzG+/+1+t1jW7nqOapd30ZcLNzBq7xyNLgbYkXat/WTlK
 bPSdHweyEq7BsTs1ucFJVsiWeN55uqvPpaLp/dLG8pDDgrHPpHK0tpg4SnMoqqm46dO9y9S
 rpqATc3upqHMatIRvZZmw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3shL5TqXon0=:Bvzhb7VndCqEvKEH76LvfW
 KQNEPz9tVSaWbK7i1/s9UXKWGHn7/3ZeAsH+jgYPQLsm++lYwyE2Vb8Vuaglx45fURDxkowgm
 n9IXEWXkdzKRZgHLxgFhVaMtVpBea0X29CsxoJOxNwHQJqB5+VxT7DMtBvIqiVNWnsQ+2pMhi
 DqaBPL22cYbaFQRipoNVaNbef/Jb8wMbGK8gRTQEvgeYSotwQRQbuB6jhaBn69h/xheJjRGTC
 79CbwpYP5DKCgCWQlpUK/RtQYNzPQM6YUW4Z0wbLRdQD3Cwlq2BP82y5TTInpzssy3sldi/rY
 RClTZ3rqicQBDP1pit5hGixFKfBr3Cb7ph3BCm4mhWizY8ZEsL2i9jwAjeDJTNFR1CupZtOsT
 5MtliHVUb5wd11OKQAUBZCfJkhXYmAh1lMYA/1lI7ydvry4RUXn3D516hrXI1F+rYnhYjky/r
 3W9ipinAug==
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/03/2021 à 10:19, Nicolas Surbayrole a écrit :
> The guest binary and libraries are not always map with the
> executable bit in the host process. The guest may read a
> /proc/self/maps with no executable address range. The
> perm fields should be based on the guest permission inside
> Qemu.
> 
> Signed-off-by: Nicolas Surbayrole <nsurbayrole@quarkslab.com>
> ---
>  linux-user/syscall.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 389ec09764..0bbb2ff9c7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7888,9 +7888,9 @@ static int open_self_maps(void *cpu_env, int fd)
>              count = dprintf(fd, TARGET_ABI_FMT_ptr "-" TARGET_ABI_FMT_ptr
>                              " %c%c%c%c %08" PRIx64 " %s %"PRId64,
>                              h2g(min), h2g(max - 1) + 1,
> -                            e->is_read ? 'r' : '-',
> -                            e->is_write ? 'w' : '-',
> -                            e->is_exec ? 'x' : '-',
> +                            (flags & PAGE_READ) ? 'r' : '-',
> +                            (flags & PAGE_WRITE_ORG) ? 'w' : '-',
> +                            (flags & PAGE_EXEC) ? 'x' : '-',
>                              e->is_priv ? 'p' : '-',
>                              (uint64_t) e->offset, e->dev, e->inode);
>              if (path) {
> 

It looks good.

Alex, you wrote this code, any comment?
Should we move this directly in read_self_maps() to have the guest values in MapInfo?

Thanks,
Laurent

