Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DDE421EE7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 08:36:09 +0200 (CEST)
Received: from localhost ([::1]:45942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXe3c-0003KS-1W
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 02:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXe1g-0002ee-C7
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 02:34:08 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:58113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXe1e-0000Rb-Mr
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 02:34:08 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N8G6I-1mtNuO03Bw-014FMe; Tue, 05 Oct 2021 08:34:04 +0200
Subject: Re: [PATCH v2 03/12] macfb: fix overflow of color_palette array
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211004211928.15803-1-mark.cave-ayland@ilande.co.uk>
 <20211004211928.15803-4-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <087a5700-e6a4-eaf1-84c1-bf9170e2c1ed@vivier.eu>
Date: Tue, 5 Oct 2021 08:34:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211004211928.15803-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/SrWVCxqdU4rirZ5SUeHTegeTzkGa/m9ZyHfgT9Djmw238Vt2dB
 O5MOrIh3E1WXLebiOPtSzczb7wFqqVR0IgTHaTKhS6xfL87IS6hzhBxjOO1WQqLNJVy7oKP
 JdHdoO2jU5QhH5BJfi9snS4uFcVshC3bfIGzr7UJqxVU0R3HQ7ZJmOROHl2iEtRTE13fM2N
 zEC2NUra2zsIfrwwl9WBQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ahTT4wgCis0=:TAVfowHW4rFX75aCWGrGN0
 y/OvqpiJ5n7Aclv3oEYrX04y4h9jwHd7bSa3+XVCFoK4b6u0p6mnnA7YDpZzB8WCBWBNrBv7P
 95SHGy8s0gXBFCVE0kRqWlqKenajWkpUaq34BI49wbU5flosIW+D37l7TDer/sIdndwu0a+aJ
 zvfKikqmBiHMpF6WFLljsYLewEumwTeiuECxbqp3PX9F5p9SRzcysQZaOtsWMBxWWfN6u3zkE
 OohxAD1sCkOQyXJ+v11TuWNsJ/GzFKkEz1B+vu/BDOqBEGGY6q+Oe1qGQv6mFl1zgg6pYIeyN
 xtxyWG9ZXUFf4id8odcYt/sSgDsbO2rPSBderEpwKgE9erExji3GK9bHY7RqE+9wuDG1+FeaR
 gdGQvCLDZ4tQUUR5PglpEa6hR9iMvRdGVedPkv454iWnDl7BmdOytjpowJhUf4Cd7LxWuMUMg
 vNitDuwYmSwamukwwU+H89Hd3Sr+hUliXmpxUh4Mk7LXJNhZlqnSR+ha9m/zpBw0LCpzES2wY
 nnQic0hfRlA0KuK/Vvf3phJf6OsadPqQ+cLkrd/oE9C69/cBf1EHcdTQnYzMnrhNxlD3Iy2gE
 kAqKGcF5Yntz/YyAfewgEJu3MEERs3bZ5L1EnjFaZiqBWp+uT/fT61Mgs1VeZy8MHKsIgscjF
 y4IbqmHv+rt9MMa/P5oQMWdtc2A9STvoIP005YIurEYunhA6tHjDMzCQc+89zCMM4rqTFxszO
 ZjRF+Cc9aGWVYKjAXeysm9OTdVFId7zrs+tjWg==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/10/2021 à 23:19, Mark Cave-Ayland a écrit :
> The palette_current index counter has a maximum size of 256 * 3 to cover a full
> color palette of 256 RGB entries. Linux assumes that the palette_current index
> wraps back around to zero after writing 256 RGB entries so ensure that
> palette_current is reset at this point to prevent data corruption within
> MacfbState.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index b363bab889..39dab49026 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -303,7 +303,9 @@ static void macfb_ctrl_write(void *opaque,
>          s->palette_current = 0;
>          break;
>      case DAFB_LUT:
> -        s->color_palette[s->palette_current++] = val;
> +        s->color_palette[s->palette_current] = val;
> +        s->palette_current = (s->palette_current + 1) %
> +                             ARRAY_SIZE(s->color_palette);
>          if (s->palette_current % 3) {
>              macfb_invalidate_display(s);
>          }
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

