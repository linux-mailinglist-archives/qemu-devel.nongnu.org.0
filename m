Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBCF502E27
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 19:02:58 +0200 (CEST)
Received: from localhost ([::1]:37096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfPLV-0006oh-GB
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 13:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nfPKL-00068V-4U
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 13:01:45 -0400
Received: from smtp17.mail.ru ([94.100.176.154]:46524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nfPKI-00036o-AP
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 13:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=6dxVY59PmIYB1bWFvbiEzC5xwdOjeH+pK9jODNn98ck=; 
 t=1650042102;x=1650647502; 
 b=SdB1oMssXykk1gUmjG/uWxELhXEtas9517YJYH28tCX+lto3POWpojZw6XSXSPLugUuYYhAOq30I0tCjXsWTMgk6cLeP9/YhsrCxTmDhxRk6XVPmtzN5JUcJ/ID5oWkkD0lAf9dtloegYwVZe4jLFz4i4jSeY35nUGrRa7VC1Eea/tqUa0wFBjO0qm5wBkcKVjJNbV33TcBYk+y2axtoyo4R7gINNuGDWOzcDpgZz3TDKOf3ut6a8+WQJAOxBpXGwZg5WnyChdhRCQ+q9BNPnUrohrP88hNVI0lGZODqkBipSblp0REn7s2z04ti1hruF5Z2DdoPrUQcsQU8pyT2BA==;
Received: by smtp17.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nfPKE-00012j-P3; Fri, 15 Apr 2022 20:01:39 +0300
Message-ID: <43c9ee35-5d82-a848-5be7-6e76090f34e9@mail.ru>
Date: Fri, 15 Apr 2022 20:01:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 for-7.1 3/9] nbd: remove peppering of
 nbd_client_connected
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-4-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220414175756.671165-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp17.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD916C41472748AFA045227E19566B3903F30656B554836768100894C459B0CD1B9D4990C5BE6D7E731538D31AAE7F8C05407B48BBE2477D3E215F97051F6725EC3
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE751DD1FEBB966604DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063750965CC5CDB672DE8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D85D423F041CA2E01676C1B113E358466E6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE70B7EC9B0538196269FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B3A703B70628EAD7BA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC64627FC97409AA513AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637CA98D6A1C4115CFDEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3C1F32C4015049DDC35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5A033E5FF4CB6BCF8337362C38826B3C257231DC2263D7E3ED59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3453037B56386657215E1F0CBF757F6CE4825CD9BDBF7A4DE03EFB32FF9F4FEF0CC40281097DFEE8AE1D7E09C32AA3244C2D7858706FD501555692284C2CFA81E36C24832127668422FACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojNgQIGdrTxnjT6djHP5pBKw==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C3913943F99FBB61F905F312B9A6E8164A02FCFA3ABD02D4A424AE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.176.154;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp17.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

14.04.2022 20:57, Paolo Bonzini wrote:
> It is unnecessary to check nbd_client_connected() because every time
> s->state is moved out of NBD_CLIENT_CONNECTED the socket is shut down
> and all coroutines are resumed.
> 
> The only case where it was actually needed is when the NBD
> server disconnects and there is no reconnect-delay.  In that
> case, nbd_receive_replies() does not set s->reply.handle and
> nbd_co_do_receive_one_chunk() cannot continue.  For that one case,
> check the return value of nbd_receive_replies().
> 
> As to the others:
> 
> * nbd_receive_replies() can put the current coroutine to sleep if another
> reply is ongoing; then it will be woken by nbd_channel_error(), called
> by the ongoing reply.  Or it can try itself to read a reply header and
> fail, thus calling nbd_channel_error() itself.
> 
> * nbd_co_send_request() will write the body of the request and fail
> 
> * nbd_reply_chunk_iter_receive() will call nbd_co_receive_one_chunk()
> and then nbd_co_do_receive_one_chunk(), which will handle the failure as
> above; or it will just detect a previous call to nbd_iter_channel_error()
> via iter->ret < 0.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/nbd.c | 17 ++++-------------
>   1 file changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 3cc4ea4430..a30603ce87 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -409,10 +409,6 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
>               return 0;
>           }
>   
> -        if (!nbd_client_connected(s)) {
> -            return -EIO;
> -        }
> -
>           if (s->reply.handle != 0) {
>               /*
>                * Some other request is being handled now. It should already be
> @@ -512,7 +508,7 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
>       if (qiov) {
>           qio_channel_set_cork(s->ioc, true);
>           rc = nbd_send_request(s->ioc, request);
> -        if (nbd_client_connected(s) && rc >= 0) {
> +        if (rc >= 0) {
>               if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
>                                          NULL) < 0) {
>                   rc = -EIO;
> @@ -829,8 +825,8 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
>       }
>       *request_ret = 0;
>   
> -    nbd_receive_replies(s, handle);
> -    if (!nbd_client_connected(s)) {
> +    ret = nbd_receive_replies(s, handle);
> +    if (ret < 0) {
>           error_setg(errp, "Connection closed");
>           return -EIO;
>       }
> @@ -982,11 +978,6 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
>       NBDReply local_reply;
>       NBDStructuredReplyChunk *chunk;
>       Error *local_err = NULL;
> -    if (!nbd_client_connected(s)) {
> -        error_setg(&local_err, "Connection closed");
> -        nbd_iter_channel_error(iter, -EIO, &local_err);
> -        goto break_loop;
> -    }

Probably we should still check iter->ret here. It's strange to start new iteration, when user set iter->ret in previous iteration of NBD_FOREACH_REPLY_CHUNK()

Or, maybe we should set iter->done in nbd_iter_channel_error ?

>   
>       if (iter->done) {
>           /* Previous iteration was last. */
> @@ -1007,7 +998,7 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
>       }
>   
>       /* Do not execute the body of NBD_FOREACH_REPLY_CHUNK for simple reply. */
> -    if (nbd_reply_is_simple(reply) || !nbd_client_connected(s)) {
> +    if (nbd_reply_is_simple(reply) || iter->ret < 0) {

And then here, may be we can just goto break_loop from previous "if (ret < 0)". Then we'll not have to check iter->ret.

>           goto break_loop;
>       }
>   

anyway:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

(a bit weak, as it really hard to imagine all these paths and possible consequences :/

-- 
Best regards,
Vladimir

