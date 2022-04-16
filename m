Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289555036FB
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 16:02:49 +0200 (CEST)
Received: from localhost ([::1]:41356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfj0h-0007ur-Vw
	for lists+qemu-devel@lfdr.de; Sat, 16 Apr 2022 10:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nfiy8-0006ij-8r
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 10:00:08 -0400
Received: from smtp45.i.mail.ru ([94.100.177.105]:55260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nfiy4-0007Et-IF
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 10:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=XtChFdtlbi+EmnPcQIB2nZAWuWOFeIcihtoIFjir7EY=; 
 t=1650117604;x=1650723004; 
 b=pchnL7QyPExyUFADH/xLu9mTOI/DRoYnEoWNw7K/W1d7CJIr+uavbT6msu2frU5+SlLyQJeyN3ReRgGGp1S/sgoBCZIZJYiW03vQB67tely9AvzRFUM2kU2Qzn2AqmVsXDqskxuJQTvDLT1DE4b8RRGi4EVhTpayEkAcJCJedrrS9uCJSdQMHXmDKY1plDEc9CRHjh1psIOEIel0wTPs0l4LEq237ztfAuQ63Cj098OqaZ8viixiaqxblyn6J3ExjkKSMTlVOcFF7RB+enXG38T86pMFFBUyXN131qmvzFHCuBkkqr0qiVFWTuoQ3hCv4pa/Dp0PFobFhRx7PvLA9Q==;
Received: by smtp45.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nfiy1-00073p-2p; Sat, 16 Apr 2022 17:00:01 +0300
Message-ID: <9f396359-7ff9-353c-b808-59aae39ad808@mail.ru>
Date: Sat, 16 Apr 2022 17:00:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 for-7.1 9/9] nbd: document what is protected by the
 CoMutexes
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-10-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220414175756.671165-10-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp45.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD95A798FEA17BE68F0750D514B51AA9BD144410212503178D9182A05F5380850404C228DA9ACA6FE273F46D87F9B469B9DCDAB61A83AD6723D7E0A3C9559531918FFA193E70A430598
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F2393C4755A27B53EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063726CA83C7ABDB938E8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D83C3F0105E8A013288819701A971D1A126F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE709B92020B71E24959FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751FC26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BEA77C8EAE1CE44B0A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC52D365B5EB63BCD33AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F790063733A25861FFD6A8E5EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3515BD7C68D321F4835872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5F134BB9CF91160FA0CB896F8491DAB23941A5604FFAE0D8DD59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34D8C933888226C8411CA4E623CD77B7E8FDC1CFDD9FD49747D826B6B45A2EED98E3EE88959AC448301D7E09C32AA3244C31675D846D3F2A65930658EC60930ADC8894E9C85370243EFACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOmri57mKkPA2dTT6AUeJqA==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C391329F8E4F11BBF34058EBBFFADBC071696B8DD0191BD683AA6E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.105;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp45.i.mail.ru
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL=1.31,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

14.04.2022 20:57, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/nbd.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 31c684772e..d0d94b40bd 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -81,12 +81,18 @@ typedef struct BDRVNBDState {
>       NBDClientRequest requests[MAX_NBD_REQUESTS];
>       QEMUTimer *reconnect_delay_timer;
>   
> +    /* Protects sending data on the socket.  */
>       CoMutex send_mutex;
> +
> +    /*
> +     * Protects receiving reply headers from the socket, as well as the
> +     * fields reply and requests[].receiving

I think, worth noting, that s->reply is used without mutex after nbd_receive_replies() success and till setting s->reply.handle to 0 in nbd_co_receive_one_chunk()..

Should "s->reply.handle = 0" be done under mutex as well? And may be, in same critical section as nbd_recv_coroutines_wake() ?

> +     */
>       CoMutex receive_mutex;
> +    NBDReply reply;
>   
>       QEMUTimer *open_timer;
>   
> -    NBDReply reply;
>       BlockDriverState *bs;
>   
>       /* Connection parameters */


-- 
Best regards,
Vladimir

