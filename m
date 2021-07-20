Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EC13CF257
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 05:04:38 +0200 (CEST)
Received: from localhost ([::1]:36030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5g3h-0005qC-7j
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 23:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zxq_yx_007@163.com>)
 id 1m5g2x-0005AE-9h
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 23:03:51 -0400
Received: from m12-12.163.com ([220.181.12.12]:48624)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zxq_yx_007@163.com>) id 1m5g2t-0001uB-JK
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 23:03:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=Kv1Po
 rllcAxkLWspT53O87MBtAJOHhB/5PZJLYhwVSU=; b=Oc/Gix00s3c65bd1mCwgS
 Bj38CEx8RPkXvUD/1FAVwm6ixSiWT+Zt0B+xH1C0a3/NoUmXarN7wjQL4mbUwxgn
 rxpvWJR6iAVOf6fszsdmEuJ1d3rg+Ja9KF/N3X/gV6jNTqWFBmdTtLpPISFGyGPR
 ZLfCHummHwCKKLWhGTRJKI=
Received: from [10.12.169.24] (unknown [106.38.115.16])
 by smtp8 (Coremail) with SMTP id DMCowACHEihpOfZgyIP8Pg--.53661S2;
 Tue, 20 Jul 2021 10:48:10 +0800 (CST)
Subject: Re: [PATCH] util: fix abstract socket path copy
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210719130112.932069-1-marcandre.lureau@redhat.com>
From: zhao xiao qiang <zxq_yx_007@163.com>
Message-ID: <9c9a6518-dafd-cd58-e74a-a895a71074af@163.com>
Date: Tue, 20 Jul 2021 10:48:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210719130112.932069-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowACHEihpOfZgyIP8Pg--.53661S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr4ktr1DGr1UXF47WF1Dtrb_yoW8CrW3pr
 W5Ca15AFZ5AFW0grs3Ja17ur4rA3WSkay3W343Ja4FkFZY93WSya48KayUJrnFyryrGrWI
 vFyIgryv9r1qywUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bUXocUUUUU=
X-Originating-IP: [106.38.115.16]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiqAHVxlc7VWZsCQAAsA
Received-SPF: pass client-ip=220.181.12.12; envelope-from=zxq_yx_007@163.com;
 helo=m12-12.163.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/19 21:01, marcandre.lureau@redhat.com 写道:
> Commit 776b97d360 "qemu-sockets: add abstract UNIX domain socket
> support" neglected to update socket_sockaddr_to_address_unix() and
> copied the whole sun_path without taking "salen" into account.
> 
> Later, commit 3b14b4ec49 "sockets: Fix socket_sockaddr_to_address_unix()
> for abstract sockets" handled the abstract UNIX path, by stripping the
> leading \0 character and fixing address details, but didn't use salen
> either.
> 
> Not taking "salen" into account may result in incorrect "path" being
> returned in monitors commands, as we read past the address which is not
> necessarily \0-terminated.
> 
> Fixes: 776b97d3605ed0fc94443048fdf988c7725e38a9
> Fixes: 3b14b4ec49a801067da19d6b8469eb1c1911c020
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  util/qemu-sockets.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 080a240b74..f2f3676d1f 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1345,13 +1345,16 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
>      SocketAddress *addr;
>      struct sockaddr_un *su = (struct sockaddr_un *)sa;
>  
> +    assert(salen >= sizeof(su->sun_family) + 1 &&
> +           salen <= sizeof(struct sockaddr_un));
> +
>      addr = g_new0(SocketAddress, 1);
>      addr->type = SOCKET_ADDRESS_TYPE_UNIX;
>  #ifdef CONFIG_LINUX
>      if (!su->sun_path[0]) {
>          /* Linux abstract socket */
>          addr->u.q_unix.path = g_strndup(su->sun_path + 1,
> -                                        sizeof(su->sun_path) - 1);
> +                                        salen - sizeof(su->sun_family) - 1);
>          addr->u.q_unix.has_abstract = true;
>          addr->u.q_unix.abstract = true;
>          addr->u.q_unix.has_tight = true;


Reviewed-by: xiaoqiang zhao <zxq_yx_007@163.com>


